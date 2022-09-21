Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B5BECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 19:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2s75aZ0If+jgHx3RZkV6mf8HDdlDB/EJXM8BphzSYuc=; b=goxphOt7axJr1Q
	+ysb5CHUM9nLuesnpkIlR45nf68D3nRouH4uAd53cPW2vvmOJpppcYSvOLry/lbvzBnVcbAgBnVJ4
	+sxyoJHMJ+PdWyUQSAU1tOWO8eS8IhlXpXmjxMRgaDH8+c1/B1MLyef30rCE5CI84tV3KpIodYOCN
	GBdUYrw+GGliBP70fX8iTd9Mzpm6eWW9FawCsgfT6Lp/6gs9h2Vt0Jw+HumTEBh+bN7jx5LcwQiem
	CqkUFd6DXdqz3gycrbbgd6BFi36ujojy/7MVC/pyqfue4DVZhXkKS9Mqh73ENN7Vo4hepxVWlFCuS
	u59RzB5nw8rUxkqv4X4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5hA-00CUvG-TS; Wed, 21 Sep 2022 19:47:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5h8-00CUt6-4r
	for linux-riscv@bombadil.infradead.org; Wed, 21 Sep 2022 19:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pVu+lnUdwFy/wDRUvSag5pYFGjTAxbn9RAYMOsiPMes=; b=VmeTngwWBNniscDLj5wXAIiK/j
	rUNaXVubRMCB8RtrYBLMWstu11U7CzvjJ1lrSogAMJb4A1FDXXCOAoCNyY3RoNc2bynGcvCrPG6hE
	cXzRAIpua620S2HufBD1Pc7I5BsTCdvLRjrUfNTDBb5BNilPNwQn+qHGwJEJLRU0lx3rVNZcO529C
	/mmRppCudt2I/2pLAMm6/y+RnPhg4nCPhIKswtp2SPi0Cq4qPKIDC0ZV+VE17DIOnrfPjdIz0ibBh
	mgCBbbqL6D1zTyABSS58wDuZEvQScugKCgmJLD5oZycGtkvZ21KvmMJbxoNPalFBZ23vyL1uiAmPJ
	Gd3e/26A==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5ga-00EkAB-Uf
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 19:47:30 +0000
Received: by mail-pl1-x62e.google.com with SMTP id t3so6716063ply.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 12:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=pVu+lnUdwFy/wDRUvSag5pYFGjTAxbn9RAYMOsiPMes=;
        b=yIPXjLBUAr2pCNf2pRaaYtWYsgNWbcGLCg4KhOsHcpuijRLrvAgSdnkX+glxO7ni5E
         SJNnzgaWcmbQdY/pQNS5DwzojJIHli8VCG7bRFKorUItUOiJwymLKBZvjDJHS93em1Wp
         SAM0x7GYtGjVwzi1i2AH4cDD4JbY42yR9kcK/l3wwy4aeyRstr7wOUUbAdJ23x+/fPLV
         XSojk7up7rVlLgSThBfs5E0H1GCr2Q1/yApGX8OzDFHtbYjRXTF4MJeLEOJD2J/01/o4
         wIYySCVYqdEFt/yKbvqQkZg/IGnhhTakWkOTBimG5mXqOf/tt4rAriXj6Jv/of79vafS
         W46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pVu+lnUdwFy/wDRUvSag5pYFGjTAxbn9RAYMOsiPMes=;
        b=RDhl/0HtJmjhJYFcNyHVCWRWjEKfcmgdshMuSnIj3kOyS2mpYhxMXpmpLPZsVPgjtc
         Snk55lae4o5YQkmOIBPbiA68sAI0wFVema+KLMPkoSC7aasg6PGWgNB7zmhzhpz83ivV
         0dy5Si80rQwNHC4SGEmk+ypGNjpxluLbhcXSJ/+3mTQ1F+HRMri+b3fXrQUgpklsyxQj
         hyJDaUCaPGgdyEH/fZQDo+l1Hfi+3vvJqOiqGAD6h3CblrmCEWkgWPE60aQ4k0fCHSrl
         73Yy5KlwgSIDmHCHiLS6nLDckgeQwXgTqDpkAXPN2MK0H5JUWhst8uIfKTFkLz8g1xod
         Asig==
X-Gm-Message-State: ACrzQf0aQ/1ssAsxEmG5BJznUgmZWmMLo/LTErv97fJSxuxmASJb2hHV
	um8dqIvjcB8PcK+kwOJbaoIwuSxdvgFSQA==
X-Google-Smtp-Source: AMsMyM4qYMXGO4CIALn8EX4KUkT6aa6dB1ZdmBbrITd0BS+i/FGhzLJxPm3kCuxkzIKR+l7esnZPIw==
X-Received: by 2002:a17:902:db0b:b0:178:1599:531d with SMTP id m11-20020a170902db0b00b001781599531dmr6299141plx.36.1663789615830;
        Wed, 21 Sep 2022 12:46:55 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id o2-20020aa79782000000b0054aa69bc192sm2551057pfp.72.2022.09.21.12.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 12:46:55 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	jpalmer@dabbelt.com,
	kvm-riscv@lists.infradead.org
Cc: Vincent Chen <vincent.chen@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>
Subject: [PATCH 11/17] riscv: signal: Report signal frame size to userspace via auxv
Date: Wed, 21 Sep 2022 12:46:23 -0700
Message-Id: <20220921194629.1480202-12-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921194629.1480202-1-stillson@rivosinc.com>
References: <20220921194629.1480202-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_204726_889307_2ACE20F5 
X-CRM114-Status: GOOD (  16.91  )
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

From: Vincent Chen <vincent.chen@sifive.com>

The vector register belongs to the signal context. They need to be stored
and restored as entering and leaving the signal handler. According to the
V-extension specification, the maximum length of the vector registers can
be 2^(XLEN-1). Hence, if userspace refers to the MINSIGSTKSZ to create a
sigframe, it may not be enough. To resolve this problem, this patch refers
to the commit 94b07c1f8c39c
("arm64: signal: Report signal frame size to userspace via auxv") to enable
userspace to know the minimum required sigframe size through the auxiliary
vector and use it to allocate enough memory for signal context.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/include/asm/elf.h         | 47 +++++++++++++++-------------
 arch/riscv/include/asm/processor.h   |  2 ++
 arch/riscv/include/uapi/asm/auxvec.h |  1 +
 arch/riscv/kernel/signal.c           |  8 +++++
 4 files changed, 36 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index 14fc7342490b..df9047b619e8 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -77,28 +77,31 @@ extern unsigned long elf_hwcap;
 #define COMPAT_ELF_PLATFORM	(NULL)
 
 #ifdef CONFIG_MMU
-#define ARCH_DLINFO						\
-do {								\
-	/*							\
-	 * Note that we add ulong after elf_addr_t because	\
-	 * casting current->mm->context.vdso triggers a cast	\
-	 * warning of cast from pointer to integer for		\
-	 * COMPAT ELFCLASS32.					\
-	 */							\
-	NEW_AUX_ENT(AT_SYSINFO_EHDR,				\
-		(elf_addr_t)(ulong)current->mm->context.vdso);	\
-	NEW_AUX_ENT(AT_L1I_CACHESIZE,				\
-		get_cache_size(1, CACHE_TYPE_INST));		\
-	NEW_AUX_ENT(AT_L1I_CACHEGEOMETRY,			\
-		get_cache_geometry(1, CACHE_TYPE_INST));	\
-	NEW_AUX_ENT(AT_L1D_CACHESIZE,				\
-		get_cache_size(1, CACHE_TYPE_DATA));		\
-	NEW_AUX_ENT(AT_L1D_CACHEGEOMETRY,			\
-		get_cache_geometry(1, CACHE_TYPE_DATA));	\
-	NEW_AUX_ENT(AT_L2_CACHESIZE,				\
-		get_cache_size(2, CACHE_TYPE_UNIFIED));		\
-	NEW_AUX_ENT(AT_L2_CACHEGEOMETRY,			\
-		get_cache_geometry(2, CACHE_TYPE_UNIFIED));	\
+#define ARCH_DLINFO						 \
+do {								 \
+	NEW_AUX_ENT(AT_SYSINFO_EHDR,				 \
+		(elf_addr_t)current->mm->context.vdso);		 \
+	NEW_AUX_ENT(AT_L1I_CACHESIZE,				 \
+		get_cache_size(1, CACHE_TYPE_INST));		 \
+	NEW_AUX_ENT(AT_L1I_CACHEGEOMETRY,			 \
+		get_cache_geometry(1, CACHE_TYPE_INST));	 \
+	NEW_AUX_ENT(AT_L1D_CACHESIZE,				 \
+		get_cache_size(1, CACHE_TYPE_DATA));		 \
+	NEW_AUX_ENT(AT_L1D_CACHEGEOMETRY,			 \
+		get_cache_geometry(1, CACHE_TYPE_DATA));	 \
+	NEW_AUX_ENT(AT_L2_CACHESIZE,				 \
+		get_cache_size(2, CACHE_TYPE_UNIFIED));		 \
+	NEW_AUX_ENT(AT_L2_CACHEGEOMETRY,			 \
+		get_cache_geometry(2, CACHE_TYPE_UNIFIED));	 \
+	/*							 \
+	 * Should always be nonzero unless there's a kernel bug. \
+	 * If we haven't determined a sensible value to give to	 \
+	 * userspace, omit the entry:				 \
+	 */							 \
+	if (likely(signal_minsigstksz))				 \
+		NEW_AUX_ENT(AT_MINSIGSTKSZ, signal_minsigstksz); \
+	else							 \
+		NEW_AUX_ENT(AT_IGNORE, 0);			 \
 } while (0)
 #define ARCH_HAS_SETUP_ADDITIONAL_PAGES
 struct linux_binprm;
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 95917a2b24f9..a09141ecf6aa 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -7,6 +7,7 @@
 #define _ASM_RISCV_PROCESSOR_H
 
 #include <linux/const.h>
+#include <linux/cache.h>
 
 #include <vdso/processor.h>
 
@@ -86,6 +87,7 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid);
 extern void riscv_fill_hwcap(void);
 extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 
+extern unsigned long signal_minsigstksz __ro_after_init;
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PROCESSOR_H */
diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/uapi/asm/auxvec.h
index 32c73ba1d531..6610d24e6662 100644
--- a/arch/riscv/include/uapi/asm/auxvec.h
+++ b/arch/riscv/include/uapi/asm/auxvec.h
@@ -33,5 +33,6 @@
 
 /* entries in ARCH_DLINFO */
 #define AT_VECTOR_SIZE_ARCH	7
+#define AT_MINSIGSTKSZ 51
 
 #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 41d9a02c7098..fb1f5012416e 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -478,8 +478,16 @@ asmlinkage __visible void do_notify_resume(struct pt_regs *regs,
 		resume_user_mode_work(regs);
 }
 
+unsigned long __ro_after_init signal_minsigstksz;
+
 void init_rt_signal_env(void);
 void __init init_rt_signal_env(void)
 {
 	rvv_sc_size = sizeof(struct __sc_riscv_v_state) + riscv_vsize;
+	/*
+	 * Determine the stack space required for guaranteed signal delivery.
+	 * The signal_minsigstksz will be populated into the AT_MINSIGSTKSZ entry
+	 * in the auxiliary array at process startup.
+	 */
+	signal_minsigstksz = cal_rt_frame_size();
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
