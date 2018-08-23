From: anup@brainfault.org (Anup Patel)
Date: Thu, 23 Aug 2018 11:15:29 -0400
Subject: [RFC PATCH 3/5] RISC-V: Add cpu_operatios structure
In-Reply-To: <20180823133726.GA28059@infradead.org>
References: <1534377377-70108-1-git-send-email-atish.patra@wdc.com>
 <1534377377-70108-4-git-send-email-atish.patra@wdc.com>
 <CAAhSdy2TeNfjdzWPHtCwrorBu8c9v-u9Ro-eGMbzSwzapfwdjw@mail.gmail.com>
 <ce39a215-3bb1-d866-0d84-76642acb70bc@wdc.com>
 <CAAhSdy30Fz0Ki5zMws6hspgn=xwcFLj3VVixH88UWGU+oehBQg@mail.gmail.com>
 <20180821074826.GA28079@infradead.org>
 <CAAhSdy2NP4raXXPVvEJyAO127=J9jR3NNEHLF=vigBz=v-Qqkw@mail.gmail.com>
 <20180822060353.GA27106@infradead.org>
 <CAAhSdy1jdn7OS1AxwXYZqejUw-qto-5Afbb6o034ahH26E+vyw@mail.gmail.com>
 <20180823133726.GA28059@infradead.org>
Message-ID: <CAAhSdy2E_H-qiyPbpGn68WftTU=2rA6VL7g0PGwyorwQM3kmqw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 23, 2018 at 9:37 AM, Christoph Hellwig <hch@infradead.org> wrote:
> On Wed, Aug 22, 2018 at 08:54:51PM +0530, Anup Patel wrote:
>> IMHO, rather than waiting for new CPU ON/OFF methods to come-up we
>> can keep the cpu_operations ready. Also, we are not re-inventing anything
>> here which we might have to discard later because cpu_operations are
>> already tried and hardened for Linux ARM64.
>
> Which is a different cpu architecture, and has shown to actually need
> it.  IFF we end up needing it on riscv we can still copy and paste
> it from AMD64.
>
>
>> I agree with you that in long-term SBI-based CPU ON/OFF will be widely
>> used. Most likely we will have at-least two CPU ON/OFF methods:
>> 1. Existing lottery based spinning
>> 2. New SBI calls
>
> And in this most likely case there is no need for an ops vector,
> a simple if/else will be much simpler and cleaner.

Like Atish mentioned, there is a possibility of existing HW going for
spin-table method instead of lottery based spinning.

This means in future we will have three or more CPU ON/OFF methods:
1. Existing lottery based spinning
2. spin-table
3. New SBI calls

I am fine dropping cpu_operations now but I am sure we will end-up
adding it back eventually.

Regards,
Anup
