import React from 'react'

export default class Hello extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <p>{this.props.content}</p>
      )
    }
  }
