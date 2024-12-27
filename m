Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A915E77188
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Dec 2024 01:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5d0Yb6QnP9D8bTMr0LSRQM0+n6u4sp7n+1xoCyyDEZg=; b=IB1QQp0VFc0wYP
	u5q8W3aqz8YO/q8k+vW7bQ15qr1JSe371RRYMXwnuQJdx6bqrUYpeOCZLEKoDbiV2crdN0rp7G1AJ
	xti2Z3h8ax1cJh7sfk4RkJcrnDhiAKO3QhwSL8UHHG7x4ozcz15Bd/w0N87mvVdZeqFNXXplc/KqY
	VEFZlGqYVJ3OAUMe3zju5KIy5KRySxa4peDBB1IknK8WT/xyLsmTbqGrMg4XvzrcwkaHj7/4Wf4XT
	b7Qxlq1GLmEmiCyjaDT0rEfTGiungGgkWZsAOUn0Tw67n6IZFqsLQD+RI7ErxhKRUEpDJ7S8bdHy5
	HFyI2zU1WyfNyeuprVJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQys7-0000000GnAM-259C;
	Fri, 27 Dec 2024 01:10:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQys4-0000000Gn9B-2ysd
	for linux-riscv@lists.infradead.org;
	Fri, 27 Dec 2024 01:10:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B0AB5C60C3;
	Fri, 27 Dec 2024 01:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE5FC4CED1;
	Fri, 27 Dec 2024 01:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735261830;
	bh=PEpKWRWG85qXreAa2GFIFkBn6JqVPVHOqdEIDeEaMCU=;
	h=From:To:Cc:Subject:Date:From;
	b=UDs6pjlyLaz/KTF9OQ22DLAYarBKqKNLo9+9EyzHSeW4eiHFIN5/rQkFqczyB85RE
	 DZ3JpJBd+fn88RdlD1JN32amU7dF56zXLqypvQ/Rh8m3mXHTrVL+R4e3aoeKebGq/O
	 vcVktc+Npw04iH6+KlqF2PukchZ08INhwvgJSQJQY/6ctJBQD4ghjBODrlmcL1dXHR
	 fEZrycDFqdpjkKhYuZOBCUExp+K5oRfYnXc2O7Cq8DS9yoTPmR3r+bEJHOsVyWq8Sm
	 JSOixtK35g7n7uSLfGX3WayPyQIbFzIRlYI7WuzWwQORa26YEZv2AkNUzAtAUNfpL3
	 8DoNZbkifyaKg==
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
	rkrcmar@ventanamicro.com,
	atishp@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V2 0/4] RISC-V: Add PARAVIRT_SPINLOCKS support
Date: Thu, 26 Dec 2024 20:10:07 -0500
Message-Id: <20241227011011.2331381-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_171032_855381_621B3FC0 
X-CRM114-Status: GOOD (  10.21  )
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

Changes in v2:
 - Add RFC tag.
 - Using new SBI_EXT_PVLOCK ID.
 - Add virt_spin_lock support.
 - Add nopvspin support.

Guo Ren (4):
  RISC-V: paravirt: Add pvqspinlock KVM backend
  RISC-V: paravirt: Add pvqspinlock frontend
  RISC-V: paravirt: pvqspinlock: Add trace point for pv_kick/wait
  RISC-V: paravirt: Enable virt_spin_lock() when disable
    PARAVIRT_SPINLOCKS

 .../admin-guide/kernel-parameters.txt         |  2 +-
 arch/riscv/Kconfig                            | 12 +++
 arch/riscv/include/asm/Kbuild                 |  1 -
 arch/riscv/include/asm/kvm_vcpu_sbi.h         |  1 +
 arch/riscv/include/asm/qspinlock.h            | 59 ++++++++++++++
 arch/riscv/include/asm/qspinlock_paravirt.h   | 28 +++++++
 arch/riscv/include/asm/sbi.h                  | 21 +++++
 arch/riscv/include/uapi/asm/kvm.h             |  1 +
 arch/riscv/kernel/Makefile                    |  1 +
 arch/riscv/kernel/qspinlock_paravirt.c        | 77 +++++++++++++++++++
 arch/riscv/kernel/sbi.c                       |  2 +-
 arch/riscv/kernel/setup.c                     | 33 ++++++++
 .../kernel/trace_events_filter_paravirt.h     | 60 +++++++++++++++
 arch/riscv/kvm/Makefile                       |  1 +
 arch/riscv/kvm/vcpu_sbi.c                     |  4 +
 arch/riscv/kvm/vcpu_sbi_pvlock.c              | 57 ++++++++++++++
 16 files changed, 357 insertions(+), 3 deletions(-)
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
