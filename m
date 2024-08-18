Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2531AC5320E
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Aug 2024 08:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BtEECD+GxIsS6xb89XnfjhXCUme+PLH+v2e4yLoZip4=; b=KrqXqMQhLK45aE
	CF+Pe2jVr+F+jOHalu/laEd/lC36VDm9kv1FEyKF/ycm1SRvc6+Xu8l+4ebNT62p9lL03CnRzMisV
	e/1pvWWusOjK5FmUl+xCN50T54QoTeP0mpxcBEUkDZrRjOnoN5DKzLRz01DIZjRZW/xTANacHgzTS
	9SOEAeln+myF0cfrnORrA7ToDXwe0FwiEFa28cbYE18YkW/GGyW4/2jyNDQcovUXzISvX35ihRsab
	mog3iLGr8SoQp2M2SqOPvgA7kmvRs6djFIJojmcrNPKZrFRNJZJP2WHCIcW8BGAYRBHfy/szvLV0k
	xqoHiSSpNGujsgr/bRwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfapi-0000000GKfN-3IFc;
	Sun, 18 Aug 2024 08:00:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfZiu-0000000GF0L-1f6N
	for linux-riscv@bombadil.infradead.org;
	Sun, 18 Aug 2024 06:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=luYpQp4OVqMmof3eSGbnJOpDEcugh3MQdyInZ+zIklA=; b=R91Q6FJQvA/mj6HjM1LEiN0Ee6
	eUvkn7E3/ebicSvxuUnSi4JtRNnsFgxZH2HTNgJmVXIfMrA7xWk+gT5U66kmPLyKBza2hSqK7aL9r
	ST89MvRVmdLJcjaCmBRyBEQ+KhH8eOpN1hQNQgK4dr3A2IhUnBX3yWHYI0UjAqOhKLNWxvLoTl5rQ
	R2xGdonxV0KJkuHhX+0frvlPP628dlmWoCGZNpzuR1EtPWnNHbVEOSm3112J2KRyjedP3JcEahGlF
	SOVOGJJM7+9cnZO/P7L9A2Gqzfwe58m81BVUOU/YwlPjO5j0VVArU5yFWKRqpodvsZXyIgQt59GIx
	woI7NNYA==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfZiq-00000008xYP-1ykU
	for linux-riscv@lists.infradead.org;
	Sun, 18 Aug 2024 06:49:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-429d2d7be1eso16609345e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 17 Aug 2024 23:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723963742; x=1724568542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luYpQp4OVqMmof3eSGbnJOpDEcugh3MQdyInZ+zIklA=;
        b=V03k+AvRjGRmWP0SP2ExXBpH2Oe3zCupa79YnblV3ffnxBa3ycRQk1LP6iiTVUGtAx
         LxaDM8P7CbSILtPqTr24D3xqmaO//FZhXdJZpU7RHmoSPAYQiymCHLddHhHDkixyJW7/
         5vGRgxSUmlXPzmYbZjMWT1aYwEFtVhzyxuL+uQFzS5PXdUrW+uXv0sK4JpYE9ILy2MGK
         GuNnfmoz1Q2XbCuS0/1JwGq8IYtBIL7lqymoqjYHLtWwhJni4gUEYP5RYj2iTPlNHczc
         VF/CRHec7DiDX0NOuFT391nFk35yt1z6z1WQXBGQV0rAq0w/TAFG07N+5JqKDP/evwN5
         lnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723963742; x=1724568542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luYpQp4OVqMmof3eSGbnJOpDEcugh3MQdyInZ+zIklA=;
        b=vIgTnFkMXMOVakno1oPtwtiaV7JnNE0LuAVcupPjVy3XGklcKFOzEgS6Q5dZjRu0UH
         tNbUoT/kvjgqgGZoCIS0bSSNfD6QO2sjgh5oH+FhEjQxzLF79aV3l1PIKm9q3ns8OcJX
         pvi6fI+10Z4svGi5wSI4Tz34bBF4y0EYcQeD0thKTiYDX1IZC3P6LcbJpWeDzaPKhLl3
         DKHRCrCVyQj6LbdyDVFbnRXX2uSLntMXNrxj7oOU0iH0OrnuoJ6+6cvlxmN4fsF2Cadk
         62fbTcmzk/ublEkJ/cegj1aeyYuY01JuE4/sBC0aJcnUxtEWlfdzw8cU5EmMyZb1VcFP
         ovPg==
X-Forwarded-Encrypted: i=1; AJvYcCUuXrOQ3D1sGu0EveYhXq1totdOjFm7QT0TkqqMZ0a/pjWs1PtJgEeeG1e84NX1iwSMfSKUCe2dLP4UIDK9Hf55GcjdJYOCYL9z8pBCiQ46
X-Gm-Message-State: AOJu0Yy832m2ko1yB1K5R8RYfX/IHAGsHOw0p2QakzjXmYf7Zbke62CT
	c7l0uPoyZZZhL4bDXcSztrGU5D9nh7y0yHEp9i08qRNj0dLrR6XDWMfniYSXfWU=
X-Google-Smtp-Source: AGHT+IEsvkhvyT/0ituMtpPmeaM6FNA/kWbI3AHcBR+0rlpsw+92Yz8DA6J8n1o3o1wi0guN4MhOfg==
X-Received: by 2002:a05:600c:4e91:b0:426:64c1:8388 with SMTP id 5b1f17b1804b1-429eda23e74mr44379405e9.17.1723963741667;
        Sat, 17 Aug 2024 23:49:01 -0700 (PDT)
Received: from alex-rivos.guest.squarehotel.net ([130.93.157.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed648f0csm66770755e9.9.2024.08.17.23.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 23:49:01 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 13/13] riscv: Add qspinlock support
Date: Sun, 18 Aug 2024 08:35:38 +0200
Message-Id: <20240818063538.6651-14-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240818063538.6651-1-alexghiti@rivosinc.com>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_074905_145926_CD3204E4 
X-CRM114-Status: GOOD (  27.43  )
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

In order to produce a generic kernel, a user can select
CONFIG_COMBO_SPINLOCKS which will fallback at runtime to the ticket
spinlock implementation if Zabha or Ziccrse are not present.

Note that we can't use alternatives here because the discovery of
extensions is done too late and we need to start with the qspinlock
implementation because the ticket spinlock implementation would pollute
the spinlock value, so let's use static keys.

This is largely based on Guo's work and Leonardo reviews at [1].

Link: https://lore.kernel.org/linux-riscv/20231225125847.2778638-1-guoren@kernel.org/ [1]
Signed-off-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 .../locking/queued-spinlocks/arch-support.txt |  2 +-
 arch/riscv/Kconfig                            | 34 ++++++++++++++
 arch/riscv/include/asm/Kbuild                 |  4 +-
 arch/riscv/include/asm/spinlock.h             | 47 +++++++++++++++++++
 arch/riscv/kernel/setup.c                     | 37 +++++++++++++++
 include/asm-generic/qspinlock.h               |  2 +
 include/asm-generic/ticket_spinlock.h         |  2 +
 7 files changed, 126 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/include/asm/spinlock.h

diff --git a/Documentation/features/locking/queued-spinlocks/arch-support.txt b/Documentation/features/locking/queued-spinlocks/arch-support.txt
index 22f2990392ff..cf26042480e2 100644
--- a/Documentation/features/locking/queued-spinlocks/arch-support.txt
+++ b/Documentation/features/locking/queued-spinlocks/arch-support.txt
@@ -20,7 +20,7 @@
     |    openrisc: |  ok  |
     |      parisc: | TODO |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: | TODO |
     |          sh: | TODO |
     |       sparc: |  ok  |
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ef55ab94027e..201d0669db7f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -79,6 +79,7 @@ config RISCV
 	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
+	select ARCH_WEAK_RELEASE_ACQUIRE if ARCH_USE_QUEUED_SPINLOCKS
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
 	select BUILDTIME_TABLE_SORT if MMU
 	select CLINT_TIMER if RISCV_M_MODE
@@ -488,6 +489,39 @@ config NODES_SHIFT
 	  Specify the maximum number of NUMA Nodes available on the target
 	  system.  Increases memory reserved to accommodate various tables.
 
+choice
+	prompt "RISC-V spinlock type"
+	default RISCV_COMBO_SPINLOCKS
+
+config RISCV_TICKET_SPINLOCKS
+	bool "Using ticket spinlock"
+
+config RISCV_QUEUED_SPINLOCKS
+	bool "Using queued spinlock"
+	depends on SMP && MMU && NONPORTABLE
+	select ARCH_USE_QUEUED_SPINLOCKS
+	help
+	  The queued spinlock implementation requires the forward progress
+	  guarantee of cmpxchg()/xchg() atomic operations: CAS with Zabha or
+	  LR/SC with Ziccrse provide such guarantee.
+
+	  Select this if and only if Zabha or Ziccrse is available on your
+	  platform, RISCV_QUEUED_SPINLOCKS must not be selected for platforms
+	  without one of those extensions.
+
+	  If unsure, select RISCV_COMBO_SPINLOCKS, which will use qspinlocks
+	  when supported and otherwise ticket spinlocks.
+
+config RISCV_COMBO_SPINLOCKS
+	bool "Using combo spinlock"
+	depends on SMP && MMU
+	select ARCH_USE_QUEUED_SPINLOCKS
+	help
+	  Embed both queued spinlock and ticket lock so that the spinlock
+	  implementation can be chosen at runtime.
+
+endchoice
+
 config RISCV_ALTERNATIVE
 	bool
 	depends on !XIP_KERNEL
diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index 5c589770f2a8..1c2618c964f0 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -5,10 +5,12 @@ syscall-y += syscall_table_64.h
 generic-y += early_ioremap.h
 generic-y += flat.h
 generic-y += kvm_para.h
+generic-y += mcs_spinlock.h
 generic-y += parport.h
-generic-y += spinlock.h
 generic-y += spinlock_types.h
+generic-y += ticket_spinlock.h
 generic-y += qrwlock.h
 generic-y += qrwlock_types.h
+generic-y += qspinlock.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
new file mode 100644
index 000000000000..e5121b89acea
--- /dev/null
+++ b/arch/riscv/include/asm/spinlock.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ASM_RISCV_SPINLOCK_H
+#define __ASM_RISCV_SPINLOCK_H
+
+#ifdef CONFIG_RISCV_COMBO_SPINLOCKS
+#define _Q_PENDING_LOOPS	(1 << 9)
+
+#define __no_arch_spinlock_redefine
+#include <asm/ticket_spinlock.h>
+#include <asm/qspinlock.h>
+#include <asm/jump_label.h>
+
+/*
+ * TODO: Use an alternative instead of a static key when we are able to parse
+ * the extensions string earlier in the boot process.
+ */
+DECLARE_STATIC_KEY_TRUE(qspinlock_key);
+
+#define SPINLOCK_BASE_DECLARE(op, type, type_lock)			\
+static __always_inline type arch_spin_##op(type_lock lock)		\
+{									\
+	if (static_branch_unlikely(&qspinlock_key))			\
+		return queued_spin_##op(lock);				\
+	return ticket_spin_##op(lock);					\
+}
+
+SPINLOCK_BASE_DECLARE(lock, void, arch_spinlock_t *)
+SPINLOCK_BASE_DECLARE(unlock, void, arch_spinlock_t *)
+SPINLOCK_BASE_DECLARE(is_locked, int, arch_spinlock_t *)
+SPINLOCK_BASE_DECLARE(is_contended, int, arch_spinlock_t *)
+SPINLOCK_BASE_DECLARE(trylock, bool, arch_spinlock_t *)
+SPINLOCK_BASE_DECLARE(value_unlocked, int, arch_spinlock_t)
+
+#elif defined(CONFIG_RISCV_QUEUED_SPINLOCKS)
+
+#include <asm/qspinlock.h>
+
+#else
+
+#include <asm/ticket_spinlock.h>
+
+#endif
+
+#include <asm/qrwlock.h>
+
+#endif /* __ASM_RISCV_SPINLOCK_H */
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index a2cde65b69e9..438e4f6ad2ad 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -244,6 +244,42 @@ static void __init parse_dtb(void)
 #endif
 }
 
+#if defined(CONFIG_RISCV_COMBO_SPINLOCKS)
+DEFINE_STATIC_KEY_TRUE(qspinlock_key);
+EXPORT_SYMBOL(qspinlock_key);
+#endif
+
+static void __init riscv_spinlock_init(void)
+{
+	char *using_ext = NULL;
+
+	if (IS_ENABLED(CONFIG_RISCV_TICKET_SPINLOCKS)) {
+		pr_info("Ticket spinlock: enabled\n");
+		return;
+	}
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
+	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&
+	    riscv_isa_extension_available(NULL, ZABHA) &&
+	    riscv_isa_extension_available(NULL, ZACAS)) {
+		using_ext = "using Zabha";
+	} else if (riscv_isa_extension_available(NULL, ZICCRSE)) {
+		using_ext = "using Ziccrse";
+	}
+#if defined(CONFIG_RISCV_COMBO_SPINLOCKS)
+	else {
+		static_branch_disable(&qspinlock_key);
+		pr_info("Ticket spinlock: enabled\n");
+		return;
+	}
+#endif
+
+	if (!using_ext)
+		pr_err("Queued spinlock without Zabha or Ziccrse");
+	else
+		pr_info("Queued spinlock %s: enabled\n", using_ext);
+}
+
 extern void __init init_rt_signal_env(void);
 
 void __init setup_arch(char **cmdline_p)
@@ -297,6 +333,7 @@ void __init setup_arch(char **cmdline_p)
 	riscv_set_dma_cache_alignment();
 
 	riscv_user_isa_enable();
+	riscv_spinlock_init();
 }
 
 bool arch_cpu_is_hotpluggable(int cpu)
diff --git a/include/asm-generic/qspinlock.h b/include/asm-generic/qspinlock.h
index 0655aa5b57b2..bf47cca2c375 100644
--- a/include/asm-generic/qspinlock.h
+++ b/include/asm-generic/qspinlock.h
@@ -136,6 +136,7 @@ static __always_inline bool virt_spin_lock(struct qspinlock *lock)
 }
 #endif
 
+#ifndef __no_arch_spinlock_redefine
 /*
  * Remapping spinlock architecture specific functions to the corresponding
  * queued spinlock functions.
@@ -146,5 +147,6 @@ static __always_inline bool virt_spin_lock(struct qspinlock *lock)
 #define arch_spin_lock(l)		queued_spin_lock(l)
 #define arch_spin_trylock(l)		queued_spin_trylock(l)
 #define arch_spin_unlock(l)		queued_spin_unlock(l)
+#endif
 
 #endif /* __ASM_GENERIC_QSPINLOCK_H */
diff --git a/include/asm-generic/ticket_spinlock.h b/include/asm-generic/ticket_spinlock.h
index cfcff22b37b3..325779970d8a 100644
--- a/include/asm-generic/ticket_spinlock.h
+++ b/include/asm-generic/ticket_spinlock.h
@@ -89,6 +89,7 @@ static __always_inline int ticket_spin_is_contended(arch_spinlock_t *lock)
 	return (s16)((val >> 16) - (val & 0xffff)) > 1;
 }
 
+#ifndef __no_arch_spinlock_redefine
 /*
  * Remapping spinlock architecture specific functions to the corresponding
  * ticket spinlock functions.
@@ -99,5 +100,6 @@ static __always_inline int ticket_spin_is_contended(arch_spinlock_t *lock)
 #define arch_spin_lock(l)		ticket_spin_lock(l)
 #define arch_spin_trylock(l)		ticket_spin_trylock(l)
 #define arch_spin_unlock(l)		ticket_spin_unlock(l)
+#endif
 
 #endif /* __ASM_GENERIC_TICKET_SPINLOCK_H */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
