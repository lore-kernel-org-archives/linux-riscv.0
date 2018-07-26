From: hch@lst.de (Christoph Hellwig)
Date: Thu, 26 Jul 2018 10:10:15 +0200
Subject: [PATCH 1/6] RISC-V: simplify software interrupt / IPI code
In-Reply-To: <mhng-03f673cd-5779-44c6-98b3-657e5c4b9d39@palmer-si-x1c4>
References: <20180725093649.32332-2-hch@lst.de>
 <mhng-03f673cd-5779-44c6-98b3-657e5c4b9d39@palmer-si-x1c4>
Message-ID: <20180726081015.GA22702@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Jul 25, 2018 at 02:44:32PM -0700, Palmer Dabbelt wrote:
> I think it's probably easier to have the whole patch set go through the IRQ
> tree, so I won't put these in the RISC-V tree unless someone says something.

No matter where it goes it probably makes sense to keep the whole
series together..
