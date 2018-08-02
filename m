From: hch@lst.de (Christoph Hellwig)
Date: Thu, 2 Aug 2018 11:50:28 +0200
Subject: [PATCH 7/9] irqchip: add a RISC-V PLIC driver
In-Reply-To: <41a996bf-b591-db0c-718e-524743f348fd@wdc.com>
References: <20180726143723.16585-1-hch@lst.de>
 <20180726143723.16585-8-hch@lst.de>
 <1b3f6066-0c7c-a5f5-75ad-559fe81091ee@wdc.com>
 <dc69d688-f765-74cc-3234-563fecff6002@wdc.com> <20180731165712.GA2521@lst.de>
 <dcb17e67-9f83-0ff5-a2c6-a6dd1b4d9c0d@wdc.com>
 <20180801141858.GA28203@lst.de>
 <41a996bf-b591-db0c-718e-524743f348fd@wdc.com>
Message-ID: <20180802095028.GA14203@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Aug 01, 2018 at 06:02:52PM -0700, Atish Patra wrote:
> But can we keep the new kconfig option "SIFIVE_PLIC" enabled in 
> driver/irqchip/Kconfig or arch/riscv/Kconfig for now to avoid breakage 
> without linux_defconfig update.

I'll update arch/riscv/configs/defconfig for the next repost.
