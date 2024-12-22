Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C367AE77188
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Dec 2024 03:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dRfzfsfUnn7dW37bMWAqyXFJoiFnFKd1f6m2/8lXcOM=; b=bDcGEeMdpCyC3P
	GzRA6p2zL8g272MMmJatkc5D2g2SzdHF9zDUg79zNTpxRTJ5go/vYfZfC9c6mXKw2mqju86G/UdQt
	67Ua7aDkYrQWrxEIF7rbfoRVcgSbD7SGKpLu7OOQeTu8kBT9PG8S5vEPuLdwkTDDeTDUBdZXYlGqV
	AOxlkYIWsr4onLZQXTkAfGgNrwHSteWhb/7qrx6BvzNlI/Qwcpdm4j9/Un1/qHyjovq8Wg4/Nnv5k
	+ZD4FY6mOql2aoJjH6FlXMBL58Y2Hai49Mie0GXWtiC/XwZaVjQp7NrZEAJVOu+o3hmZiE1Bf0QZU
	Di7kPpb9IdKcZ7eKIeiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPCoe-00000007kak-0FPb;
	Sun, 22 Dec 2024 03:39:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPCob-00000007kaA-2lqc
	for linux-riscv@lists.infradead.org;
	Sun, 22 Dec 2024 03:39:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B5CC7A40168;
	Sun, 22 Dec 2024 03:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062CCC4CECD;
	Sun, 22 Dec 2024 03:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734838775;
	bh=k1hft2pZQ25CrvERlqt6gzzkxcTov5UhaHbkvuYf1uE=;
	h=From:To:Cc:Subject:Date:From;
	b=NPiY7kufR2lSWtV/+xTWeZ0iHo+ulY5hjf+y8y946mt5O9bydNYIGNRJVtQ9vZk2T
	 P4ZxlitTguNdWamv25Grbu2kU/uIxg9mbwkSxWwSA4m/3x98fXXN+XitMLr3638rpx
	 HbyvshwcW9ma8N6u8+Z3grMitawS6M7HLev+lJYQRdSvXEU9jvRlnMMFBsraPGwpOE
	 Bzw65s8CXf2RMJ+20t3ojer2x7BJGZ0QmLEacAU/VIoUFX7vsB3ibqHR4/P5ITt8ke
	 Yx4TmAwWdo8Cws/xynHesqWE60j0tFQqrT/wWOiDbD7HQh6DrccAWl9D405TOrxNMu
	 AJSfQIUUtMtBg==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	bjorn@rivosinc.com,
	conor@kernel.org,
	leobras@redhat.com,
	peterz@infradead.org,
	parri.andrea@gmail.com,
	will@kernel.org,
	longman@redhat.com,
	boqun.feng@gmail.com,
	arnd@arndb.de,
	alexghiti@rivosinc.com,
	ajones@ventanamicro.com,
	rkrcmar@ventanamicro.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 0/3] riscv: Add PARAVIRT_SPINLOCKS support
Date: Sat, 21 Dec 2024 22:39:14 -0500
Message-Id: <20241222033917.1754495-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_193937_862118_62400674 
X-CRM114-Status: UNSURE (   7.80  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Paravirtualized spinlocks allow a unfair qspinlock to replace the
ticket-lock or native fair qspinlock implementation with something
virtualization-friendly, for example, halt the virtual CPU rather
than spinning.

You could observe the paravirt qspinlock internal work situation with
/sys/kernel/debug/tracing/trace:

ls /sys/kernel/debug/tracing/events/paravirt/
 enable   filter   pv_kick  pv_wait

echo 1 > /sys/kernel/debug/tracing/events/paravirt/enable
cat /sys/kernel/debug/tracing/trace
 entries-in-buffer/entries-written: 33927/33927   #P:12

                                _-----=> irqs-off/BH-disabled
                               / _----=> need-resched
                              | / _---=> hardirq/softirq
                              || / _--=> preempt-depth
                              ||| / _-=> migrate-disable
                              |||| /     delay
           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
              | |         |   |||||     |         |
             sh-100     [001] d..2.    28.312294: pv_wait: cpu 1 out of wfi
         <idle>-0       [000] d.h4.    28.322030: pv_kick: cpu 0 kick target cpu 1
             sh-100     [001] d..2.    30.982631: pv_wait: cpu 1 out of wfi
         <idle>-0       [000] d.h4.    30.993289: pv_kick: cpu 0 kick target cpu 1
             sh-100     [002] d..2.    44.987573: pv_wait: cpu 2 out of wfi
         <idle>-0       [000] d.h4.    44.989000: pv_kick: cpu 0 kick target cpu 2
         <idle>-0       [003] d.s3.    51.593978: pv_kick: cpu 3 kick target cpu 4
      rcu_sched-15      [004] d..2.    51.595192: pv_wait: cpu 4 out of wfi
lock_torture_wr-115     [004] ...2.    52.656482: pv_kick: cpu 4 kick target cpu 2
lock_torture_wr-113     [002] d..2.    52.659146: pv_wait: cpu 2 out of wfi
lock_torture_wr-114     [008] d..2.    52.659507: pv_wait: cpu 8 out of wfi
lock_torture_wr-114     [008] d..2.    52.663503: pv_wait: cpu 8 out of wfi
lock_torture_wr-113     [002] ...2.    52.666128: pv_kick: cpu 2 kick target cpu 8
lock_torture_wr-114     [008] d..2.    52.667261: pv_wait: cpu 8 out of wfi
lock_torture_wr-114     [009] .n.2.    53.141515: pv_kick: cpu 9 kick target cpu 11
lock_torture_wr-113     [002] d..2.    53.143339: pv_wait: cpu 2 out of wfi
lock_torture_wr-116     [007] d..2.    53.143412: pv_wait: cpu 7 out of wfi
lock_torture_wr-118     [000] d..2.    53.143457: pv_wait: cpu 0 out of wfi
lock_torture_wr-115     [008] d..2.    53.143481: pv_wait: cpu 8 out of wfi
lock_torture_wr-117     [011] d..2.    53.143522: pv_wait: cpu 11 out of wfi
lock_torture_wr-117     [011] ...2.    53.143987: pv_kick: cpu 11 kick target cpu 8
lock_torture_wr-115     [008] ...2.    53.144269: pv_kick: cpu 8 kick target cpu 7

This series is split from [1].

[1]: https://lore.kernel.org/linux-riscv/20231225125847.2778638-1-guoren@kernel.org/

Guo Ren (3):
  RISC-V: paravirt: Add pvqspinlock KVM backend
  RISC-V: paravirt: Add pvqspinlock frontend
  RISC-V: paravirt: pvqspinlock: Add trace point for pv_kick/wait

 arch/riscv/Kconfig                            | 12 +++
 arch/riscv/include/asm/Kbuild                 |  1 -
 arch/riscv/include/asm/kvm_vcpu_sbi.h         |  1 +
 arch/riscv/include/asm/qspinlock.h            | 35 +++++++++
 arch/riscv/include/asm/qspinlock_paravirt.h   | 28 +++++++
 arch/riscv/include/asm/sbi.h                  |  5 ++
 arch/riscv/include/uapi/asm/kvm.h             |  1 +
 arch/riscv/kernel/Makefile                    |  1 +
 arch/riscv/kernel/qspinlock_paravirt.c        | 74 +++++++++++++++++++
 arch/riscv/kernel/setup.c                     |  4 +
 .../kernel/trace_events_filter_paravirt.h     | 60 +++++++++++++++
 arch/riscv/kvm/Makefile                       |  1 +
 arch/riscv/kvm/vcpu_sbi.c                     |  4 +
 arch/riscv/kvm/vcpu_sbi_pvlock.c              | 57 ++++++++++++++
 14 files changed, 283 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/qspinlock.h
 create mode 100644 arch/riscv/include/asm/qspinlock_paravirt.h
 create mode 100644 arch/riscv/kernel/qspinlock_paravirt.c
 create mode 100644 arch/riscv/kernel/trace_events_filter_paravirt.h
 create mode 100644 arch/riscv/kvm/vcpu_sbi_pvlock.c

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
