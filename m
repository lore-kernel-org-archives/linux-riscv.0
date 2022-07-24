Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C2FCCA47C
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Jul 2022 12:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DefRvucyATU6XHFzksfg6VFctXIMNgy1vXaK7KMOv+Y=; b=qQ0Q4OA+kzW+9e
	tj+53iydoDYn0D2QXO43shwUJWxpx6AtcvUkwFGl7aSZkdyZvAxKm0Zg79+Ru6MBma0OH57Em9tT2
	ZgVUed1tMYtjJc5R61TuJ25SPQJrgFtamGaDYEuc3h1ZLBgLrAGirmq12GikgoWf3Ll4j9cTAp4dg
	4ZQ2kJZ/RTXnaa6gXqka+9Fp6CDHKtE9fPPfRcnoJu+e3gaGNfYRDv/XEAPOEGLcvq31lb8OFT912
	9JeS+xzgFBJn5q4JqFbo9PXu254oAqWR2QUnlPVEeFesJM6UytyWh04C98pqKp9dbO9S1Yl0ISa8e
	UIVjJ/TiV9DtY50L4oXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFagt-0061K3-8J; Sun, 24 Jul 2022 12:26:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFago-0061Fn-QG
	for linux-riscv@lists.infradead.org; Sun, 24 Jul 2022 12:26:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 56A1A6106F;
	Sun, 24 Jul 2022 12:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77F7C385A5;
	Sun, 24 Jul 2022 12:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658665590;
	bh=920mmnpEJPScVrA5dKwmyImPh9PCuH+GiFZjlE1o8zI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KOdKpq+E4B/EJi49xbzc27v1TLG7ZtjFILg8aSF7N9+lSnRnEpR7LjSRUSbqeMr5L
	 ZQAzxLJ3xxcSfBXGnpPhlbsaOsZUgB2f5Coi0rleUrDhjTQsHtAntM9kz0YHpGH2/x
	 8SDZPhVIT9NXdYQ+a5aF0lacSIH7mk/oI/Gs0GFgyQoz+d+WmU59fNUftUET9/CTFl
	 07mv1i8TnX854bxdJzBN7waa7YDuL9WjQpSlYSBtjAgMzjl5qvUt7VBbsgSivTjMTs
	 AceE9qPAzul9KUiQIBQbEamCnpi8hpkTsb7O7rriYH9Rwui3zWwu81lDWuthAzyX86
	 qAB+XEfb3ayyA==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	heiko@sntech.de,
	hch@infradead.org,
	arnd@arndb.de,
	peterz@infradead.org,
	will@kernel.org,
	boqun.feng@gmail.com,
	longman@redhat.com,
	mingo@redhat.com,
	philipp.tomsich@vrull.eu,
	cmuellner@linux.com,
	linux-kernel@vger.kernel.org,
	David.Laight@ACULAB.COM
Cc: linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V8 10/10] csky: Add qspinlock support
Date: Sun, 24 Jul 2022 08:25:17 -0400
Message-Id: <20220724122517.1019187-11-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220724122517.1019187-1-guoren@kernel.org>
References: <20220724122517.1019187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_052631_033925_D4F3D7CA 
X-CRM114-Status: GOOD (  11.22  )
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

Enable qspinlock by the requirements mentioned in a8ad07e5240c9
("asm-generic: qspinlock: Indicate the use of mixed-size atomics").

C-SKY only has "ldex/stex" for all atomic operations. So csky give a
strong forward guarantee for "ldex/stex." That means when ldex grabbed
the cache line into $L1, it would block other cores from snooping the
address with several cycles.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/csky/Kconfig               | 16 ++++++++++++++++
 arch/csky/include/asm/Kbuild    |  2 ++
 arch/csky/include/asm/cmpxchg.h | 20 ++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index dfdb436b6078..09f7d1f06bca 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -354,6 +354,22 @@ config HAVE_EFFICIENT_UNALIGNED_STRING_OPS
 	  Say Y here to enable EFFICIENT_UNALIGNED_STRING_OPS. Some CPU models could
 	  deal with unaligned access by hardware.
 
+choice
+	prompt "C-SKY spinlock type"
+	default CSKY_TICKET_SPINLOCKS
+
+config CSKY_TICKET_SPINLOCKS
+	bool "Using ticket spinlock"
+
+config CSKY_QUEUED_SPINLOCKS
+	bool "Using queued spinlock"
+	depends on SMP
+	select ARCH_USE_QUEUED_SPINLOCKS
+	help
+	  Make sure your micro arch LL/SC has a strong forward progress guarantee.
+	  Otherwise, stay at ticket-lock/combo-lock.
+endchoice
+
 endmenu
 
 source "arch/csky/Kconfig.platforms"
diff --git a/arch/csky/include/asm/Kbuild b/arch/csky/include/asm/Kbuild
index 103207a58f97..b70b14de904f 100644
--- a/arch/csky/include/asm/Kbuild
+++ b/arch/csky/include/asm/Kbuild
@@ -3,10 +3,12 @@ generic-y += asm-offsets.h
 generic-y += extable.h
 generic-y += gpio.h
 generic-y += kvm_para.h
+generic-y += mcs_spinlock.h
 generic-y += spinlock.h
 generic-y += spinlock_types.h
 generic-y += qrwlock.h
 generic-y += qrwlock_types.h
+generic-y += qspinlock.h
 generic-y += parport.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
diff --git a/arch/csky/include/asm/cmpxchg.h b/arch/csky/include/asm/cmpxchg.h
index 5b8faccd65e4..5f693fadb56c 100644
--- a/arch/csky/include/asm/cmpxchg.h
+++ b/arch/csky/include/asm/cmpxchg.h
@@ -15,6 +15,26 @@ extern void __bad_xchg(void);
 	__typeof__(*(ptr)) __ret;				\
 	unsigned long tmp;					\
 	switch (size) {						\
+	case 2: {						\
+		u32 ret;					\
+		u32 shif = ((ulong)__ptr & 2) ? 16 : 0;		\
+		u32 mask = 0xffff << shif;			\
+		__ptr = (__typeof__(ptr))((ulong)__ptr & ~2);	\
+		__asm__ __volatile__ (				\
+			"1:	ldex.w %0, (%4)\n"		\
+			"	and    %1, %0, %2\n"		\
+			"	or     %1, %1, %3\n"		\
+			"	stex.w %1, (%4)\n"		\
+			"	bez    %1, 1b\n"		\
+			: "=&r" (ret), "=&r" (tmp)		\
+			: "r" (~mask),				\
+			  "r" ((u32)__new << shif),		\
+			  "r" (__ptr)				\
+			: "memory");				\
+		__ret = (__typeof__(*(ptr)))			\
+			((ret & mask) >> shif);			\
+		break;						\
+	}							\
 	case 4:							\
 		asm volatile (					\
 		"1:	ldex.w		%0, (%3) \n"		\
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
