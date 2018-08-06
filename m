From: hch@lst.de (Christoph Hellwig)
Date: Mon, 6 Aug 2018 17:33:26 +0200
Subject: [PATCH 2/3] PCI/xilinx: Work-around for hardware DMA limit (32
 bits)
In-Reply-To: <20180806134043.GD18685@e107981-ln.cambridge.arm.com>
References: <20180804101402.10022-1-hch@lst.de>
 <20180804101402.10022-3-hch@lst.de>
 <CAMgXwTgr572J_HH396tfvT7Zj8Jj0fefKOSmVw2+Gwn8qcPR1g@mail.gmail.com>
 <20180806123527.GB6997@lst.de>
 <20180806134043.GD18685@e107981-ln.cambridge.arm.com>
Message-ID: <20180806153326.GA17328@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Aug 06, 2018 at 02:40:43PM +0100, Lorenzo Pieralisi wrote:
> It would do the right thing without patches 1 and 2 (I would
> consider merging patch 1 anyway - see pcibios_add_device()
> removal).
> 
> It seems to me that the best course of action consists in patching
> firmware, that would remove the need for patch 2 (I will merge patch
> 1 anyway - even if that's for a "different" purpose, see
> pcibios_add_device() removal), please let us know.

Sounds good to me.  Patch 1 also doesn't even depend on dma-mapping
bits so feel free to pull it in when you think is the best time.
