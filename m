From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 26 Feb 2018 16:35:10 -0800 (PST)
Subject: [PATCH 0/9] RISC-V: Make modules loadable.
In-Reply-To: <20180223031218.10390-1-shea@shealevy.com>
Message-ID: <mhng-2c353f73-e5d5-422a-8ae4-8d547d29eac2@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 22 Feb 2018 19:12:09 PST (-0800), shea at shealevy.com wrote:
> This was enough to load enough modules to make virtio_scsi devices
> appear on the qemu virt machine on a highly modular distro kernel.

Thanks for this, but there's a bit of an issue with R_RISCV_ALIGN.  I'd be OK 
merging the change set if you emit errors on R_RISCV_ALIGN instances that 
actually require alignment, as IIRC it's possible to coerce GCC to emit code 
that doesn't require relaxation of alignment sequences.  This should probably go 
in the module CFLAGS as well.

There are also some minor comments, see the per-patch messages.
