Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B0DC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 14:32:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE37C60FF1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 14:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE37C60FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28p2IWZf7O0CwtgEtu6bKTKr+UUprrtZmHO85Q00Ujs=; b=XG9GbbrT0adRIKZN9dJi23T71R
	SR9O9ABHIdTw2LXh1azZJwn+J5zP9U26oNTY3KK2nQYWL1AcDyI3L9cvCjj4Ip+D4CIgVlagz4zC4
	F5yTPyKVdEemqqCq+urj9BA/MKpzEdczKbdTHKBeuLmYag64AB46dT+C9b7HpVebGokRT+8Dl96HZ
	r0+qG6hwKE3suXP6GUup5M8//D/nZciQAFj3WoXcOEH7smtPwakg74LDwhHMElscH+s3MmN9zgneb
	PmWWmQ5iowMQsfmfsGkFbcL1uTt4sxZHRzpn2DElTbH51vp9TlzM4YaWnCIuBxcOZjap37q1KrLV+
	pI8Qv0BQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRbtZ-006oWF-1R; Wed, 31 Mar 2021 14:32:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRbtU-006oUi-1D
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 14:32:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50A8A60FF0;
 Wed, 31 Mar 2021 14:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617201146;
 bh=Ht9rtu0Co+dG0mLJd/EeyOUGuASgL6Jraidb6iiV2SA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sLjjqYUKM/9xT8bdGMLrv/vHz9hXgtgtxvs/oRmBw1S0V9setblm7Thg7sukdPtOh
 5Ff6couQIDJI4Zj2o5I89lUqC4hfTyLrlnnaG5vm6CEcTEYKTO/+O3NumvCjjgEiHc
 8qjcmWa/zIDXzY60NtXXR5R7f+OLc1kocQe2AiXzxCIR6a7HLR0QQiRzupGD7VTRTf
 RKfRw6YVG0MHOEviuThmdh3Z97OSB71QBJy1WJSuDfUIdQyk79BIDFWVVYeb316LO+
 2vLNSCWQKmwWV5DF2Rwv5oYo/GVqHJaM8oo/Br5KYK2E3yzm1SqoUhERexFzNrbhEA
 f1s1XOWvv+EcQ==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, Waiman Long <longman@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v6 5/9] csky: Convert custom spinlock/rwlock to generic
 qspinlock/qrwlock
Date: Wed, 31 Mar 2021 14:30:36 +0000
Message-Id: <1617201040-83905-6-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617201040-83905-1-git-send-email-guoren@kernel.org>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_153228_466872_03083A64 
X-CRM114-Status: GOOD (  11.76  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Update the C-SKY port to use the generic qspinlock and qrwlock.

C-SKY only support ldex.w/stex.w with word(double word) size &
align access. So it must select XCHG32 to let qspinlock only use
word atomic xchg_tail.

Default is still ticket lock.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Waiman Long <longman@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/csky/Kconfig                      | 8 ++++++++
 arch/csky/include/asm/Kbuild           | 2 ++
 arch/csky/include/asm/spinlock.h       | 4 ++++
 arch/csky/include/asm/spinlock_types.h | 4 ++++
 4 files changed, 18 insertions(+)

diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index 34e91224adc3..ae12332edb7b 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -8,6 +8,8 @@ config CSKY
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_QUEUED_RWLOCKS
+	select ARCH_USE_QUEUED_SPINLOCKS	if !CSKY_TICKET_LOCK
+	select ARCH_USE_QUEUED_SPINLOCKS_XCHG32
 	select ARCH_WANT_FRAME_POINTERS if !CPU_CK610
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select COMMON_CLK
@@ -304,6 +306,12 @@ config NR_CPUS
 	depends on SMP
 	default "4"
 
+config CSKY_TICKET_LOCK
+	bool "Ticket-based spin-locking"
+	default y
+	help
+	  Say Y here to use ticket-based spin-locking.
+
 config HIGHMEM
 	bool "High Memory Support"
 	depends on !CPU_CK610
diff --git a/arch/csky/include/asm/Kbuild b/arch/csky/include/asm/Kbuild
index cc24bb8e539f..2a2d09963bb9 100644
--- a/arch/csky/include/asm/Kbuild
+++ b/arch/csky/include/asm/Kbuild
@@ -2,6 +2,8 @@
 generic-y += asm-offsets.h
 generic-y += gpio.h
 generic-y += kvm_para.h
+generic-y += mcs_spinlock.h
 generic-y += qrwlock.h
+generic-y += qspinlock.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
diff --git a/arch/csky/include/asm/spinlock.h b/arch/csky/include/asm/spinlock.h
index 69677167977a..fe98ad8ece51 100644
--- a/arch/csky/include/asm/spinlock.h
+++ b/arch/csky/include/asm/spinlock.h
@@ -6,6 +6,7 @@
 #include <linux/spinlock_types.h>
 #include <asm/barrier.h>
 
+#ifdef CONFIG_CSKY_TICKET_LOCK
 /*
  * Ticket-based spin-locking.
  */
@@ -80,6 +81,9 @@ static inline int arch_spin_is_contended(arch_spinlock_t *lock)
 	return (tickets.next - tickets.owner) > 1;
 }
 #define arch_spin_is_contended	arch_spin_is_contended
+#else /* CONFIG_CSKY_TICKET_LOCK */
+#include <asm/qspinlock.h>
+#endif /* CONFIG_CSKY_TICKET_LOCK */
 
 #include <asm/qrwlock.h>
 
diff --git a/arch/csky/include/asm/spinlock_types.h b/arch/csky/include/asm/spinlock_types.h
index 8ff0f6ff3a00..547f035f6dd5 100644
--- a/arch/csky/include/asm/spinlock_types.h
+++ b/arch/csky/include/asm/spinlock_types.h
@@ -7,6 +7,7 @@
 # error "please don't include this file directly"
 #endif
 
+#ifdef CONFIG_CSKY_TICKET_LOCK
 #define TICKET_NEXT	16
 
 typedef struct {
@@ -21,6 +22,9 @@ typedef struct {
 } arch_spinlock_t;
 
 #define __ARCH_SPIN_LOCK_UNLOCKED	{ { 0 } }
+#else
+#include <asm-generic/qspinlock_types.h>
+#endif
 
 #include <asm-generic/qrwlock_types.h>
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
