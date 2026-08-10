Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D705C5B56A
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 17:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JZDTMY9XuUVORCzeSIDi+qQAnv4HjvzM9iZ/RGM9XsQ=; b=KW044zRJ1Q5BDv
	HUw+4jXc0M08kHPqGVokkaU8OpwuD4W7nfQgIE95tSaJwTS46pInw45rISxPUeSfkSrcJydgppA+m
	aNB2zQrC7Ymp9+pNTzEAS6uHq+qCS29FZ7ory3MCF95o6wXbUaxxZNywHIXGz6aavL75PTwNzPsTd
	1fMX+MX+UPxMR/cymMSXfgvsA7iOEB2LxKI2/fJe0xqPhZYn2rhDOx86a1eShsz+x24kgk0SoW6Dg
	b3Iv38+RIsXuWcmFK1F7LLrKb78N5g2NHdrn/XQdOQonKyuAjzAZZIu9q2srAicVVcg0ST4DccCxj
	8o+Xg6esm622mGkw5SIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTl4-0000000CWJ1-03Ge;
	Mon, 10 Aug 2026 17:25:54 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTkx-0000000CWDw-1D0Y
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 17:25:53 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so2122919b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 10:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1786382746; x=1786987546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0vu7q1VAW5+m5tgRLHwsUVAqWZyc1LodfHoT1g5mIs=;
        b=byDO3UCLRSF/fo8QbwBP0T2jvP7Xes9JJmoaAORMOTqU2vccYgX3rskOCbaM8ajeCx
         Krosj55OdHO0QceAjUXZwzuGnqC3XCW8l1KnG7SxGg+SDWgkrWoJRhBkBo5yRUZAzyV3
         04o9pK7M37t/UkKv0ujnx5pNxR8PFBA7JMkiRmY+M34116ntry6WMuZmYCVJhKAVW2th
         0u+4//S4P0LoZIe/ZzaI0M9bOLItM/mpR8WEhLbg9acr/5x1CM5wzsahbUK05loXZtpe
         h1x3Wh1te8bvb9y76isFz778rdt9kiuNiBS1sUTiARediZxQ3PJR3EWYn1iwWm/fF1Vx
         2b9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786382746; x=1786987546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0vu7q1VAW5+m5tgRLHwsUVAqWZyc1LodfHoT1g5mIs=;
        b=eAmB2Bn0DfbftVailXN82gySEVIIQO6T+QVaRC+9NEGDPRGYpEH4HBMYTwN2wAgP4a
         9n2UUOU1FKh9HPHEXPYSIPZRIT7UXgCJWssubxzQbvw7iQu4cBsDac8zXSpjDxdUxh2u
         qCHWzLmaTLGP9kXBC8J4NSsfHoqnOYjl2h0skmuZ3anPv3+TeWHnK05He3XpU3cQNvDZ
         NN4RKO4sqRbl2O/htRSNp4Jly2vQdN1IPxxl4YeKDIvxV4Mn+FcpeEaDjJpDa2JDStFE
         AmN2s2s8qOWrN/ORpC3zwIymoh+V7qxwzuC8aGM7E/dRSDk3RMz/1NTM3w6rRMmtFWRn
         7Wyw==
X-Forwarded-Encrypted: i=1; AHgh+RpYE8niGOKOo5HYiwnh+61K0OcRsbEXVhBWgVUx4MiWCWxTpdvhB5Lh7SjKW/+E4d6xlea5i3KdcUSb0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwjb4Mej/VzCt2nMcwtbMf7fNKFVCC4xouE/BQIgl8OTcqRqDj
	2DQl3vomuvB481fGg1tLfzCV/AG+7wCf65fOAj45/o/kmNCmEiqHCyyWGGiGVR260kc=
X-Gm-Gg: AR+sD11qJqg7X4ThJbxuKGtIfOOIVKGjhKxqShJoOlz6646Xm4YWqWdSzn+Ce0nlnQl
	0TMUlMRSKTK7QHsWlDB+1HsDm/xqVVGyDRRMTdhj2oG2VOIWjPeAIU2n1gnaWwJA5+/Gzi59G9C
	iRZ5PCO5KGOZ/RwVYA6siQVtdgSCVVar1k/SxP8iTQp7LQKqbU+16LEnaZ5mo3tvxtIVuchDg4b
	xqVh+0d4YM7do23Ta0FWXOPugp9KOJD/3DQJeCKv+0mxHOYjx8iRAEkMqOdn2KJrYNA1A71W/B/
	EjNBpztvq/g9EjftBDAFbqtkrXnrYsRx0/WscU1vaT1hE7LROxoNg22/aioF0LTF2eMxC8Y55dN
	vMT014LPkg26RqkIp3Pih2+B8WijIwBmtcoBc5AJBlvdRaiVt6u/NxX/WjlJXgIbGjpblxBEHvp
	K+owR3tIbhP71kVDHIWz26LtZKE6GkQXBOjPsr5AJVuJ1CvWPE/5aRVXtvOJk19SP2J+2dV2uuO
	mGSgqVbAwAgpCCxyCqLFts0UCnqVxPxjX8lEsEILhDbp9kbBFD+HiTCltd5oBCx8g==
X-Received: by 2002:a05:6a00:240f:b0:847:8f8a:a05d with SMTP id d2e1a72fcca58-84f2e04999dmr48091369b3a.29.1786382746347;
        Mon, 10 Aug 2026 10:25:46 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (61-222-153-199.hinet-ip.hinet.net. [61.222.153.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a5898f8sm4149949b3a.52.2026.08.10.10.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:25:45 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	daichengrong <daichengrong@iscas.ac.cn>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Deepak Gupta <debug@rivosinc.com>,
	Florian Schmaus <flo@geekplace.eu>,
	Rui Qi <qirui.001@bytedance.com>,
	Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH v5 7/7] riscv: vector: optimize vstate operations
Date: Mon, 10 Aug 2026 12:22:34 -0500
Message-ID: <20260810172255.1532787-8-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810172255.1532787-1-tchiu@tenstorrent.com>
References: <20260810172255.1532787-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_102547_353938_B5D7AD4D 
X-CRM114-Status: GOOD (  20.68  )
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

Introduce the CONFIG_RISCV_VSTATE_OPT to optimize vector state operations
in kernel space. By default, the kernel disables the Vector unit upon
entering kernel space to guard illegal use of vector, and nulls out
vector registers at syscall stops to catch autovectorizer errors such as
using stale vector states across syscalls.

This patch enables Vector in kernel mode and bypasses vector register
nulling for user space on the syscall fast path when the new
configuration is selected.

Enabling this optimization yields the following performance benefits:
 - Cut 80 cycles latency for getpid on Ascalon.
 - Delivers a 3.5% request throughput improvement for an nginx workload
   serving 1KB web pages on a four-core Ascalon-S.

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v5:
 - new patch since v5
---
 arch/riscv/Kconfig              | 11 +++++++++++
 arch/riscv/include/asm/vector.h |  9 ++++++++-
 arch/riscv/kernel/entry.S       | 13 +++++++++++--
 arch/riscv/kernel/process.c     |  4 ++++
 arch/riscv/kernel/vector.c      |  3 +++
 5 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 3f0a647218e4..89c0de5d1243 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -647,6 +647,17 @@ config RISCV_ISA_V_UCOPY_THRESHOLD
 	  Prefer using vectorized copy_to_user()/copy_from_user() when the
 	  workload size exceeds this value.
 
+config RISCV_VSTATE_OPT
+	bool "Optimize vector state operation in the kernel space"
+	default n
+	help
+	  Say N here if you want to catch illegal use of Vector in the kernel
+	  space. This config turns on V when entering the kernel space and the
+	  kernel would not perform register nulling for the user space. This
+	  rougly cut ~30 ns latency for getpid on blackhole x280 and gives 3.5%
+	  request throughput improvement for nginx workload serving 1KB web page
+	  on a four-core Ascalon-S.
+
 config RISCV_ISA_V_PREEMPTIVE
 	bool "Run kernel-mode Vector with kernel preemption"
 	depends on PREEMPTION
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 2e6b88e35664..bed0958c0cb2 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -122,6 +122,9 @@ static inline bool riscv_v_vstate_query(struct pt_regs *regs)
 
 static __always_inline void riscv_v_enable(void)
 {
+	if (IS_ENABLED(CONFIG_RISCV_VSTATE_OPT))
+		return;
+
 	if (has_xtheadvector())
 		csr_set(CSR_SSTATUS, SR_VS_THEAD);
 	else
@@ -130,6 +133,9 @@ static __always_inline void riscv_v_enable(void)
 
 static __always_inline void riscv_v_disable(void)
 {
+	if (IS_ENABLED(CONFIG_RISCV_VSTATE_OPT))
+		return;
+
 	if (has_xtheadvector())
 		csr_clear(CSR_SSTATUS, SR_VS_THEAD);
 	else
@@ -335,7 +341,8 @@ static inline void riscv_v_vstate_set_restore(struct task_struct *task,
 static inline void riscv_v_vstate_discard(struct pt_regs *regs)
 {
 	if (__riscv_v_vstate_check_gt(regs->status, INITIAL)) {
-		riscv_v_vstate_set_restore(current, regs);
+		if (!IS_ENABLED(CONFIG_RISCV_VSTATE_OPT))
+			riscv_v_vstate_set_restore(current, regs);
 		riscv_v_vstate_init(regs);
 	}
 }
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index c6988983cdf7..6c9fd81b9583 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -6,6 +6,7 @@
 
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <linux/stringify.h>
 
 #include <asm/alternative-macros.h>
 #include <asm/asm.h>
@@ -175,10 +176,12 @@ SYM_CODE_START(handle_exception)
 	 * Disable user-mode memory access as it should only be set in the
 	 * actual user copy routines.
 	 *
-	 * Disable the FPU/Vector to detect illegal usage of floating point
+	 * Disable the FPU to detect illegal usage of floating point
 	 * or vector in kernel space.
 	 */
-	li t0, SR_SUM | SR_FS_VS
+	li t0, SR_SUM | SR_FS
+	ALTERNATIVE(__stringify(ori t0, t0, SR_VS), "nop",
+		    0, RISCV_ISA_EXT_ZVE32X, CONFIG_RISCV_VSTATE_OPT)
 #ifdef CONFIG_64BIT
 	li t1, SR_ELP
 	or t0, t0, t1
@@ -186,6 +189,12 @@ SYM_CODE_START(handle_exception)
 
 	REG_L s0, TASK_TI_USER_SP(tp)
 	csrrc s1, CSR_STATUS, t0
+	ALTERNATIVE("j .Lskip_v_enable", __stringify(andi t0, s1, SR_VS),
+		    0, RISCV_ISA_EXT_ZVE32X, CONFIG_RISCV_VSTATE_OPT)
+	bnez t0, .Lskip_v_enable
+	li a0, SR_VS_INITIAL
+	csrs CSR_STATUS, a0
+.Lskip_v_enable:
 	save_userssp s2, s1
 	csrr s2, CSR_EPC
 	csrr s3, CSR_TVAL
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b2df7f72241a..b17ca4f70740 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -258,6 +258,10 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		/* Supervisor/Machine, irqs on: */
 		childregs->status = SR_PP | SR_PIE;
 
+		if (IS_ENABLED(CONFIG_RISCV_VSTATE_OPT) &&
+		    (has_vector() || has_xtheadvector()))
+			riscv_v_vstate_init(childregs);
+
 		p->thread.s[0] = (unsigned long)args->fn;
 		p->thread.s[1] = (unsigned long)args->fn_arg;
 		p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 6fd541f5d5cb..050c09cc63dd 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -70,6 +70,9 @@ int riscv_v_setup_vsize(void)
 {
 	unsigned long this_vsize;
 
+	if (IS_ENABLED(CONFIG_RISCV_VSTATE_OPT))
+		csr_set(CSR_SSTATUS, SR_VS_INITIAL);
+
 	/*
 	 * There are 32 vector registers with vlenb length.
 	 *
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
