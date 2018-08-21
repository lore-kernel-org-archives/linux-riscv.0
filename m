From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 21 Aug 2018 00:48:26 -0700
Subject: [RFC PATCH 3/5] RISC-V: Add cpu_operatios structure
In-Reply-To: <CAAhSdy30Fz0Ki5zMws6hspgn=xwcFLj3VVixH88UWGU+oehBQg@mail.gmail.com>
References: <1534377377-70108-1-git-send-email-atish.patra@wdc.com>
 <1534377377-70108-4-git-send-email-atish.patra@wdc.com>
 <CAAhSdy2TeNfjdzWPHtCwrorBu8c9v-u9Ro-eGMbzSwzapfwdjw@mail.gmail.com>
 <ce39a215-3bb1-d866-0d84-76642acb70bc@wdc.com>
 <CAAhSdy30Fz0Ki5zMws6hspgn=xwcFLj3VVixH88UWGU+oehBQg@mail.gmail.com>
Message-ID: <20180821074826.GA28079@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 16, 2018 at 11:51:03AM +0530, Anup Patel wrote:
> Having thought about this more, I think cpu_ops should be an pointer array
> of NR_CPUS size. This means its not necessary to have have same ops for
> all CPUs. The ARM64 implementation of CPU operations also allows separate
> CPU operations for each CPU.
> 
> For example, let's us assume that we have an SOC where we 2 cores
> per-cluster and N clusters. All CPUs of cluster0 comes up at the same time
> whereas cluster1 onwards we have to bring-up CPUs using special HW
> mechanism.

All this (including the patch itself) seems a little hypothetical.
I'd rather only add all this infrastructure once it actually is needed.
