import React from 'react'
import AdminPage from '../page'
import { DataTableUjian } from '../component/data-table'
import { columnsBlok } from './components/column'

export default function BlokAdminPage() {
  return (
    <AdminPage>
        <div>
            <p className='mb-6'>Blok Page</p>
            <DataTableUjian columns={columnsBlok} data={[]} />
        </div>
    </AdminPage>
  )
}
