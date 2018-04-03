From: aurelien@aurel32.net (Aurelien Jarno)
Date: Wed, 4 Apr 2018 00:06:55 +0200
Subject: [RFC PR] RISC-V changes for 4.17
In-Reply-To: <mhng-2eb61f09-8a89-482b-995b-5ae38b73dfe9@palmer-si-x1c4>
References: <mhng-2eb61f09-8a89-482b-995b-5ae38b73dfe9@palmer-si-x1c4>
Message-ID: <20180403220655.GA8917@aurel32.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Palmer,

On 2018-04-02 20:58, Palmer Dabbelt wrote:
> Here's the PR I'm planning on submitting to Linus for the first half of the
> 4.17 merge window.  Unless anyone knows of any problems I'll submit the PR on
> Wednesday morning.  I haven't given this a much testing as I probably should
> have, so please go give things a shot!
> I don't want to take any new code for Wednesday, but I'm planning on taking the
> perf stuff for next week if some small issues iron themselves out.

Do you think it's possible to also include this simple change:

http://lists.infradead.org/pipermail/linux-riscv/2018-March/000292.html

It fixes building the kernel with compilers defaulting to PIE and is a
no-op for compilers not defaulting to PIE.

Thanks,
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien at aurel32.net                 http://www.aurel32.net
