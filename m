From: sorear2@gmail.com (Stef O'Rear)
Date: Fri, 2 Mar 2018 01:12:26 -0800
Subject: [PATCH 8/9] RISC-V: Support RISCV_ALIGN relocations in modules.
In-Reply-To: <87zi3r8iaf.fsf@xps13.shealevy.com>
References: <mhng-53539693-f51f-4ff0-836b-e795a03a841c@palmer-si-x1c4>
 <87zi3r8iaf.fsf@xps13.shealevy.com>
Message-ID: <CADJ6UvMrLYrew=TswTX3oPVng0Fdi9G3An8Nro1z6mDypQfQ7w@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Mar 1, 2018 at 3:53 PM, Shea Levy <shea@shealevy.com> wrote:
> Palmer Dabbelt <palmer@sifive.com> writes:
>> Well, this is awkward: I remembered doing this (and telling people about
>> "-mno-relax"), but apparently that was all just in my head.  Here's a patch to
>> add "-mno-relax" to GCC in the real world :)
>> https://gcc.gnu.org/ml/gcc-patches/2018-03/msg00062.html
>>
>> I think the best thing to do is:
>>
>> * Check if the complier supports "-mno-relax" and add it to the module build
>>   command-line.
>> * Change R_RISCV_ALIGN support in the kernel to check if the address happens to
>>   already be aligned (which happens sometimes), and if it's not then provide a
>>   helpful error message along the lines of "upgrade to GCC 8".
>>
>> I guess we eventually want to support relaxation in the kernel, but only if
>> there's a real performance problem that someone can point out.
>
> OK, thanks! I'll look into that.
>
> Actually, other than the initial implementation cost, is there any
> potential *problem* with implementing relaxations? If I have time I
> might want to look into that just for my own education.

It might be a reasonable exercise but I'd rather not upstream it.

-mno-relax .o files ought to be order of 2x smaller, so assuming you
care about initramfs size we want to use that instead of complicating
the loader.

(I'd be interested in real numbers for a larger module, e.g. btrfs.)

-s
