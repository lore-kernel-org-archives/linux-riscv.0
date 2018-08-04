From: hch@lst.de (Christoph Hellwig)
Date: Sat, 4 Aug 2018 11:58:51 +0200
Subject: [PATCH 09/11] RISC-V: Support per-hart timebase-frequency
In-Reply-To: <20180803123357.GC18301@lst.de>
References: <20180802115008.4031-1-hch@lst.de>
 <20180802115008.4031-10-hch@lst.de>
 <fef973e1-6efc-0eff-2789-4a4b5b01900b@wdc.com>
 <20180803123357.GC18301@lst.de>
Message-ID: <20180804095851.GA12794@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Actually I had a slight change of heart: I'm going to drop both
timebase frequence patches and the enable method documentation one
from this series as they aren't strictly required to get a booting
qemu kernel.
