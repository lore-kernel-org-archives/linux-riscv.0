From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 17 Sep 2018 07:10:18 -0700
Subject: [PATCH] RISC-V: Show CPU ID and Hart ID separately in
 /proc/cpuinfo
In-Reply-To: <72961c71-c4e4-7990-da64-a7f1613f2e1c@wdc.com>
References: <20180912143822.21948-1-anup@brainfault.org>
 <72961c71-c4e4-7990-da64-a7f1613f2e1c@wdc.com>
Message-ID: <20180917141018.GB28689@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Sep 12, 2018 at 09:47:55AM -0700, Atish Patra wrote:
> The extra hart information will not be parsed by lscpu which will make the
> cpu information inconsistent between lscpu & /proc/cpuinfo.
> 
> Should we patch lscpu as well to show correct hart id as well ?

It would be good to follow whatever prescedent other architectures
with different logical vs physical cpuids have set.
