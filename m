From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 03 Apr 2018 17:27:26 -0700 (PDT)
Subject: [RFC PR] RISC-V changes for 4.17
In-Reply-To: <20180403220655.GA8917@aurel32.net>
Message-ID: <mhng-dd5d4bad-5db3-4830-a25d-65d4b04dca4c@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 03 Apr 2018 15:06:55 PDT (-0700), aurelien at aurel32.net wrote:
> Hi Palmer,
>
> On 2018-04-02 20:58, Palmer Dabbelt wrote:
>> Here's the PR I'm planning on submitting to Linus for the first half of the
>> 4.17 merge window.  Unless anyone knows of any problems I'll submit the PR on
>> Wednesday morning.  I haven't given this a much testing as I probably should
>> have, so please go give things a shot!
>> I don't want to take any new code for Wednesday, but I'm planning on taking the
>> perf stuff for next week if some small issues iron themselves out.
>
> Do you think it's possible to also include this simple change:
>
> http://lists.infradead.org/pipermail/linux-riscv/2018-March/000292.html
>
> It fixes building the kernel with compilers defaulting to PIE and is a
> no-op for compilers not defaulting to PIE.

Oh, sorry, it seems like I've missed that somehow.  It wasn't in my mail box, 
but I just picked it up from

    https://patchwork.kernel.org/patch/10300449/

It looks OK to me, so I'll include it in the next patch set.  FWIW, this sort 
of thing doesn't need to wait for the merge window as it's a small fix.

Thanks!
