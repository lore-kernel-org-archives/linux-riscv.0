From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 27 Feb 2018 10:21:46 -0800 (PST)
Subject: [PATCH 0/9] RISC-V: Make modules loadable.
In-Reply-To: <CADJ6UvO88DUdH0paanf9=2UCrt-VC-U25nQu4xRZ4SxzJ1G1Ww@mail.gmail.com>
Message-ID: <mhng-c4e04870-37da-41d2-a541-c9fbb6d5de9b@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 26 Feb 2018 21:49:40 PST (-0800), sorear2 at gmail.com wrote:
> On Mon, Feb 26, 2018 at 4:35 PM, Palmer Dabbelt <palmer@sifive.com> wrote:
>> On Thu, 22 Feb 2018 19:12:09 PST (-0800), shea at shealevy.com wrote:
>>>
>>> This was enough to load enough modules to make virtio_scsi devices
>>> appear on the qemu virt machine on a highly modular distro kernel.
>>
>>
>> Thanks for this, but there's a bit of an issue with R_RISCV_ALIGN.  I'd be
>> OK merging the change set if you emit errors on R_RISCV_ALIGN instances that
>> actually require alignment, as IIRC it's possible to coerce GCC to emit code
>> that doesn't require relaxation of alignment sequences.  This should
>> probably go in the module CFLAGS as well.
>>
>> There are also some minor comments, see the per-patch messages.
>
> The question of whether processing R_RISCV_ALIGN is mandatory came up
> during lld patch review,
> https://lists.llvm.org/pipermail/llvm-dev/2017-July/115407.html .   My
> position is that if gas is generating instances that require
> alignment, that is a bug, although I'm quite fine with hardening this.

We'd need to add a new relocation in order to make that happen, as 
R_RISCV_ALIGN assumes.  I wouldn't be opposed to it, but I thought the 
conclusion we came to was that there were two reasons to avoid processing 
R_RISCV_ALIGN:

* The linker doesn't support relaxation.  We consider this a bug in the linker, 
  and I don't want to add a relocation just for incomplete linkers.
* Relaxation is too time consuming.  In this case you want to disable all 
  relaxation, and GAS will already emit code without R_RISCV_ALIGN when run 
  with relaxation disabled.

IIRC there was an email thread or a github issue about this.
