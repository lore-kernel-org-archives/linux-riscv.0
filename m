From: hch@lst.de (Christoph Hellwig)
Date: Fri, 3 Aug 2018 15:30:01 +0200
Subject: [PATCH 03/11] dt-bindings: interrupt-controller: RISC-V PLIC
 documentation
In-Reply-To: <0093fadc-a150-3745-e73d-e579bfdfabfb@wdc.com>
References: <20180802115008.4031-1-hch@lst.de>
 <20180802115008.4031-4-hch@lst.de>
 <0093fadc-a150-3745-e73d-e579bfdfabfb@wdc.com>
Message-ID: <20180803133001.GA23900@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 02, 2018 at 03:08:15PM -0700, Atish Patra wrote:
> The one in the real device tree has two entries.
> reg = <0x00000000 0x0c000000 0x00000000 0x04000000>;
>
> Is it intentional or just incorrect entry left over from earlier days?

I'll need to SiFive folks to comment on that.  The driver itself uses
of_iomap, which as far as I can tell only needs two entries.
