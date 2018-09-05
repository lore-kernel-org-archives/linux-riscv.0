From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 5 Sep 2018 11:56:03 -0700
Subject: [RFC PATCH 1/5] RISC-V: Make IPI triggering flexible
In-Reply-To: <CAAhSdy1iPZ_Y4opsXBE0o09uzgSxV8A9YKHawFB+knXH7FFLsQ@mail.gmail.com>
References: <20180904124514.6290-1-anup@brainfault.org>
 <20180904124514.6290-2-anup@brainfault.org>
 <20180904185001.GA25119@infradead.org>
 <CAAhSdy1iPZ_Y4opsXBE0o09uzgSxV8A9YKHawFB+knXH7FFLsQ@mail.gmail.com>
Message-ID: <20180905185603.GA15741@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Sep 05, 2018 at 10:06:24AM +0530, Anup Patel wrote:
> It's outrageous to call IPI mechanisms using interrupt-controller as "wacky".

I call pluggable IPI whacky, and it's not outragous.  What is outragous
is your bullshit architecture astronaut patches.

There might be a nned to abstract IPI details even more in the future,
but the way to do it is either architectureally in the RISC-V privileged
spec, or in the SBI spec once we actually have one.

Having host OSes go through hoops to provide pluggable IPI
implementations is complete bullshit, and the argument that we already
have this in some architectures is not a good reason to repeat that
mistake.
