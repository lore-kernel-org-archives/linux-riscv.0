From: anup@brainfault.org (Anup Patel)
Date: Wed, 22 Aug 2018 20:54:51 +0530
Subject: [RFC PATCH 3/5] RISC-V: Add cpu_operatios structure
In-Reply-To: <20180822060353.GA27106@infradead.org>
References: <1534377377-70108-1-git-send-email-atish.patra@wdc.com>
 <1534377377-70108-4-git-send-email-atish.patra@wdc.com>
 <CAAhSdy2TeNfjdzWPHtCwrorBu8c9v-u9Ro-eGMbzSwzapfwdjw@mail.gmail.com>
 <ce39a215-3bb1-d866-0d84-76642acb70bc@wdc.com>
 <CAAhSdy30Fz0Ki5zMws6hspgn=xwcFLj3VVixH88UWGU+oehBQg@mail.gmail.com>
 <20180821074826.GA28079@infradead.org>
 <CAAhSdy2NP4raXXPVvEJyAO127=J9jR3NNEHLF=vigBz=v-Qqkw@mail.gmail.com>
 <20180822060353.GA27106@infradead.org>
Message-ID: <CAAhSdy1jdn7OS1AxwXYZqejUw-qto-5Afbb6o034ahH26E+vyw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Aug 22, 2018 at 11:33 AM, Christoph Hellwig <hch@infradead.org> wrote:
> On Tue, Aug 21, 2018 at 10:34:38PM +0530, Anup Patel wrote:
>> The cpu_operations is certainly required because SOC vendors will add
>> vendor-specific mechanism to selectively bringing-up CPUs/HARTs instead
>> of all CPUs entering Linux kernel simultaneously. In fact, we might also end-up
>> having CPU ON/OFF operations in SBI.
>
> Your forgot an essential part in your analysis:  Right now we only have
> one single way to deal with cpu on/offlining, and that is the dummy WFI
> kind.  Once other ways show up we can build proper infrastructure, but
> until then this is just a white elephant as we have no idea how these
> abstractions will look like.
>
> And my hope is that we'll just see new SBI calls, in which case we'll
> just need SBI and dummy version and can avoid all the indirect calls.

IMHO, rather than waiting for new CPU ON/OFF methods to come-up we
can keep the cpu_operations ready. Also, we are not re-inventing anything
here which we might have to discard later because cpu_operations are
already tried and hardened for Linux ARM64.

I agree with you that in long-term SBI-based CPU ON/OFF will be widely
used. Most likely we will have at-least two CPU ON/OFF methods:
1. Existing lottery based spinning
2. New SBI calls

Regards,
Anup
