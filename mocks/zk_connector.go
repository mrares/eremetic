package mocks

import (
	"github.com/klarna/eremetic/types"
	"github.com/stretchr/testify/mock"
)

// ZkConnectorInterface is an autogenerated mock type for the ZkConnectorInterface type
type ZkConnectorInterface struct {
	mock.Mock
}

// Connect provides a mock function with given fields: path
func (_m *ZkConnectorInterface) Connect(path string) (types.ZkConnection, error) {
	ret := _m.Called(path)

	var r0 types.ZkConnection
	if rf, ok := ret.Get(0).(func(string) types.ZkConnection); ok {
		r0 = rf(path)
	} else {
		if ret.Get(0) != nil {
			r0 = ret.Get(0).(types.ZkConnection)
		}
	}

	var r1 error
	if rf, ok := ret.Get(1).(func(string) error); ok {
		r1 = rf(path)
	} else {
		r1 = ret.Error(1)
	}

	return r0, r1
}
