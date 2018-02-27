From: sorear2@gmail.com (Stef O'Rear)
Date: Mon, 26 Feb 2018 21:49:40 -0800
Subject: [PATCH 0/9] RISC-V: Make modules loadable.
In-Reply-To: <mhng-2c353f73-e5d5-422a-8ae4-8d547d29eac2@palmer-si-x1c4>
References: <20180223031218.10390-1-shea@shealevy.com>
 <mhng-2c353f73-e5d5-422a-8ae4-8d547d29eac2@palmer-si-x1c4>
Message-ID: <CADJ6UvO88DUdH0paanf9=2UCrt-VC-U25nQu4xRZ4SxzJ1G1Ww@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Feb 26, 2018 at 4:35 PM, Palmer Dabbelt <palmer@sifive.com> wrote:
> On Thu, 22 Feb 2018 19:12:09 PST (-0800), shea at shealevy.com wrote:
>>
>> This was enough to load enough modules to make virtio_scsi devices
>> appear on the qemu virt machine on a highly modular distro kernel.
>
>
> Thanks for this, but there's a bit of an issue with R_RISCV_ALIGN.  I'd be
> OK merging the change set if you emit errors on R_RISCV_ALIGN instances that
> actually require alignment, as IIRC it's possible to coerce GCC to emit code
> that doesn't require relaxation of alignment sequences.  This should
> probably go in the module CFLAGS as well.
>
> There are also some minor comments, see the per-patch messages.

The question of whether processing R_RISCV_ALIGN is mandatory came up
during lld patch review,
https://lists.llvm.org/pipermail/llvm-dev/2017-July/115407.html .   My
position is that if gas is generating instances that require
alignment, that is a bug, although I'm quite fine with hardening this.

-s
