From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 06 Mar 2018 15:45:11 -0800 (PST)
Subject: [PATCH 8/9] RISC-V: Support RISCV_ALIGN relocations in modules.
In-Reply-To: <CADJ6UvMrLYrew=TswTX3oPVng0Fdi9G3An8Nro1z6mDypQfQ7w@mail.gmail.com>
Message-ID: <mhng-201b9977-b1df-41d2-97e0-4e893e3d1d01@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, 02 Mar 2018 01:12:26 PST (-0800), sorear2 at gmail.com wrote:
> On Thu, Mar 1, 2018 at 3:53 PM, Shea Levy <shea@shealevy.com> wrote:
>> Palmer Dabbelt <palmer@sifive.com> writes:
>>> Well, this is awkward: I remembered doing this (and telling people about
>>> "-mno-relax"), but apparently that was all just in my head.  Here's a patch to
>>> add "-mno-relax" to GCC in the real world :)
>>> https://gcc.gnu.org/ml/gcc-patches/2018-03/msg00062.html
>>>
>>> I think the best thing to do is:
>>>
>>> * Check if the complier supports "-mno-relax" and add it to the module build
>>>   command-line.
>>> * Change R_RISCV_ALIGN support in the kernel to check if the address happens to
>>>   already be aligned (which happens sometimes), and if it's not then provide a
>>>   helpful error message along the lines of "upgrade to GCC 8".
>>>
>>> I guess we eventually want to support relaxation in the kernel, but only if
>>> there's a real performance problem that someone can point out.
>>
>> OK, thanks! I'll look into that.
>>
>> Actually, other than the initial implementation cost, is there any
>> potential *problem* with implementing relaxations? If I have time I
>> might want to look into that just for my own education.
>
> It might be a reasonable exercise but I'd rather not upstream it.
>
> -mno-relax .o files ought to be order of 2x smaller, so assuming you
> care about initramfs size we want to use that instead of complicating
> the loader.
>
> (I'd be interested in real numbers for a larger module, e.g. btrfs.)

It's actually kind of an odd one: using "-mrelax" instead of "-mno-relax" would 
result in:

* Larger initramfs sizes (the kernel modules would still have all the 
  pre-relaxed instructions, plus the extra relocation info required to relax 
  and the most pessimistic alignment possible).
* Larger, slower, more complicated module loading code (to handle all the 
  relaxations).
* Smaller, faster modules once they've been loaded into the kernel.

I guess we'd need to see some numbers as to how much can actually be relaxed, 
as I suspect there won't be a whole lot of opportunities for relaxation in 
module code.  I think this is probably not that high priority, but it would be 
fun :).
