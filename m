From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 12 Nov 2018 17:52:25 -0800 (PST)
Subject: [PATCH 0/2] riscv: add ARCH_HAS_SG_CHAIN to Kconfig
In-Reply-To: <20181030100107.4590-1-david.abdurachmanov@gmail.com>
Message-ID: <mhng-8aec482b-66bf-4190-8d73-e8c06bcac316@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 30 Oct 2018 03:01:05 PDT (-0700), david.abdurachmanov at gmail.com wrote:
> This should improve virtio-gpu support for riscv.
>
> David Abdurachmanov (2):
>   riscv: add ARCH_HAS_SG_CHAIN
>   doc: re-run features-refresh.sh
>
>  Documentation/features/io/sg-chain/arch-support.txt           | 4 ++--
>  .../features/locking/queued-spinlocks/arch-support.txt        | 2 +-
>  Documentation/features/perf/kprobes-event/arch-support.txt    | 2 +-
>  Documentation/features/vm/pte_special/arch-support.txt        | 2 +-
>  arch/riscv/Kconfig                                            | 1 +
>  5 files changed, 6 insertions(+), 5 deletions(-)

I'm not opposed to this, but I have no idea what it does or why it's in 
arch/*/Kconfig.  I've added the first patch to next-sg_chain, but I'm going to 
re-do the second one as it looks like it batches up a bunch of updates.

Thanks!
