From: anup@brainfault.org (Anup Patel)
Date: Tue, 21 Aug 2018 22:34:38 +0530
Subject: [RFC PATCH 3/5] RISC-V: Add cpu_operatios structure
In-Reply-To: <20180821074826.GA28079@infradead.org>
References: <1534377377-70108-1-git-send-email-atish.patra@wdc.com>
 <1534377377-70108-4-git-send-email-atish.patra@wdc.com>
 <CAAhSdy2TeNfjdzWPHtCwrorBu8c9v-u9Ro-eGMbzSwzapfwdjw@mail.gmail.com>
 <ce39a215-3bb1-d866-0d84-76642acb70bc@wdc.com>
 <CAAhSdy30Fz0Ki5zMws6hspgn=xwcFLj3VVixH88UWGU+oehBQg@mail.gmail.com>
 <20180821074826.GA28079@infradead.org>
Message-ID: <CAAhSdy2NP4raXXPVvEJyAO127=J9jR3NNEHLF=vigBz=v-Qqkw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Aug 21, 2018 at 1:18 PM, Christoph Hellwig <hch@infradead.org> wrote:
> On Thu, Aug 16, 2018 at 11:51:03AM +0530, Anup Patel wrote:
>> Having thought about this more, I think cpu_ops should be an pointer array
>> of NR_CPUS size. This means its not necessary to have have same ops for
>> all CPUs. The ARM64 implementation of CPU operations also allows separate
>> CPU operations for each CPU.
>>
>> For example, let's us assume that we have an SOC where we 2 cores
>> per-cluster and N clusters. All CPUs of cluster0 comes up at the same time
>> whereas cluster1 onwards we have to bring-up CPUs using special HW
>> mechanism.
>
> All this (including the patch itself) seems a little hypothetical.
> I'd rather only add all this infrastructure once it actually is needed.

The cpu_operations is certainly required because SOC vendors will add
vendor-specific mechanism to selectively bringing-up CPUs/HARTs instead
of all CPUs entering Linux kernel simultaneously. In fact, we might also end-up
having CPU ON/OFF operations in SBI.

Having separate cpu_operations for each CPU is good for flexibility because
CPU clusters might have different way of bringing up CPUs (for example, take
any Hetrogeneous Multiprocessor Systems (HMP)).

IMHO, RISCV Linux port is new and this the right time to implement critical
infrastructure things (such as cpu_operations). Also, its not something radical
because we are taking inspiration from existing Linux ports (such as ARM64).

Regards,
Anup
