var autoprefixer = require('autoprefixer');
var CopyPlugin = require('copy-webpack-plugin');
var ExtractTextPlugin = require('extract-text-webpack-plugin');
var path = require('path');
var webpack = require('webpack');

var commonsChunkPlugin = new webpack.optimize.CommonsChunkPlugin('vendor', 'js/[name].js');

copyPlugin = new CopyPlugin([{
  from: './web/static/assets',
  to: 'assets'
}]);

var extractTextPlugin = new ExtractTextPlugin(
  'css/[name].css'
);

var providePlugin = new webpack.ProvidePlugin({
  $: 'jquery',
  '_': 'underscore',
  jQuery: 'jquery',
  'window.jQuery': 'jquery',
  Backbone: 'backbone',
  'window.Backbone': 'backbone',
  Hammer: 'hammerjs'
});

var config = {
  entry: {
    cart: './web/static/js/cart.js',
    dashboard: './web/static/js/dashboard.js',
    storefront: './web/static/js/storefront.js',
    vendor: [
      'bootstrap-sass',
      'jquery',
      'jquery.cookie'
    ]
  },
  output: {
    filename: 'js/[name].js',
    path: path.resolve(__dirname, 'priv/static/'),
    publicPath: '/'
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel'
      },
      {
        test: /\.json$/,
        loader: 'json'
      },
      {
        test: /\.scss$/,
        loader: ExtractTextPlugin.extract([
          'css?sourceMap',
          'postcss',
          'sass'
        ])
      },
      {
        test: /\.(eot|otf|png|svg|ttf|woff|woff2)(\?v=[0-9.]+)?$/,
        loader: 'file?name=assets/[name].[ext]',
        include: [
          path.resolve(__dirname, 'node_modules'),
          path.resolve(__dirname, 'web/static/assets/fonts'),
          path.resolve(__dirname, 'web/static/assets/images'),
          path.resolve(__dirname, 'web/static/assets/img')
        ]
      }
    ]
  },
  plugins: [
    commonsChunkPlugin,
    copyPlugin,
    extractTextPlugin,
    providePlugin
  ],
  postcss: function() {
    return [autoprefixer];
  },
  sassLoader: {
    sourceMap: true
  }
};

module.exports = config;
