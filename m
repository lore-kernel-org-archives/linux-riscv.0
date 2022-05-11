Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869F7C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 08:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I0zA8Yt5mpGmbRsk1j9GBHK9JYopcYXAkVmww93zypA=; b=WH1JRmMwCyuiFh
	EaFKP+gtUmkBT80k27FCmQBe9cZGo4p1brEvLGuGb+Ec5UQrk5AzXJEPQ3zH/C491YE1UEhs2xlRf
	I+2WpYDyNiSbxxYYCCeGlP2kbVkakbCTnsCHGOIKG2ccmbe74roq3jaRIRSfaoW3a2OKe0qAy16rF
	kGhtjRPpNlxY9sq23nlgziy8asv3M+59F6FdgFRKkHdNaQfbbWJNbZNwm2Wh3oO2MCQsvAnzjLqzP
	7cQp1liOoT20botgRM0ILdhY11HN8Y9bESYEM23mDItIkLFyx9lcFd630C0s4bS85vBSnN37bUAID
	IYM78RoU4ordWBwAkp/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nohlM-005xgl-IQ; Wed, 11 May 2022 08:32:04 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nohl7-005xR1-0d
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 08:31:53 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 15so1190548pgf.4
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 01:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
 :references; bh=Bis4bioW3cxmD3BG+PfyKzJ7bNrywOfCUDLOAVw8vgY=;
 b=WFvGr2NIbgp9U7DdxGvBxhPMhkRduVkZt3qfSQUEoHHWUuo+s1RlCNMCF1UQvLDGIq
 4d8ZN1Ch5Sgk//2OOmGOqcpfq2sMM2m1+7mAMI7pSRwoxz/tkqc727e8x5cg/P3oUCrF
 IpU3KY2c6aT0gTnOCTaprnqjeyBxggJML8ES/33iB1M3x3g+22qo3VknBmLk0RIwvex5
 6rNxQ1F8Nut4FEMvJocsnYwfzKGPyR4T+b1CpcObi3pyMJVEyNxcdA+Tkv/j9vITCSZe
 eVOGTqdbLzd0mXqQpW7/0oSThc4TlPSX9ddVGNP9OzUNcm6N65j0VqD0HIW1SL6rij8B
 uY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=Bis4bioW3cxmD3BG+PfyKzJ7bNrywOfCUDLOAVw8vgY=;
 b=D1YsT5JLfhkvOEr5wm6+wfsDtNDofHv4rAMAEOaPm18dATVjs2PHs/GfJdJUc/28nd
 RnVDCg0+LzFBpcprbwnmZGsZp4+v1koaz6dSKrByLTxVMNdSscdg1Eq4yHcnqUTdPLgC
 wv7OtqBNq+IyExa9G1wNV16r4h841bwt1gVekgqFgU49zWSGvnj1s1JE8lfZ3neXXso/
 gCbEkZdzfwiPMWrAWK4NKxFqQAYbv/87roxYp102SH4uzX84TrQI+feaBB7A9xe1aiZP
 weJBGmCw/KdtSJZfiYV9R5OT8ndcbGA8imRE7HK/bhCYF5yePirrQTVVIB5yGQmko0ED
 T8MA==
X-Gm-Message-State: AOAM530BRt6UcB8ErBh8fMT+JmMsE+HJINIkxATDGuanelNVBm5qLIxK
 2NbbDXOe8Po5sfR7iArJxfBtyQ==
X-Google-Smtp-Source: ABdhPJzGFAiZqmtdDQLQBNejJetP3TJC7Wth4JnHEHTZUfXINsdVxm4agg4p2YW0MjZZggWoz6xxSw==
X-Received: by 2002:a05:6a00:2402:b0:4e1:46ca:68bd with SMTP id
 z2-20020a056a00240200b004e146ca68bdmr23835090pfh.70.1652257907223; 
 Wed, 11 May 2022 01:31:47 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net.
 [59.124.168.89]) by smtp.gmail.com with ESMTPSA id
 m10-20020aa7900a000000b0050dc7628170sm1020202pfo.74.2022.05.11.01.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 01:31:46 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v10 11/16] riscv: signal: Report signal frame size to
 userspace via auxv
Date: Wed, 11 May 2022 08:31:21 +0000
Message-Id: <75ba9c8da9f2304335bb50fe57f12952b09d5258.1652257230.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_013149_120150_2907C81F 
X-CRM114-Status: GOOD (  15.39  )
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
 arch/riscv/include/asm/elf.h         | 41 +++++++++++++++++-----------
 arch/riscv/include/asm/processor.h   |  2 ++
 arch/riscv/include/uapi/asm/auxvec.h |  1 +
 arch/riscv/kernel/signal.c           |  8 ++++++
 4 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index f53c40026c7a..72e02a31a279 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -61,22 +61,31 @@ extern unsigned long elf_hwcap;
 #define ELF_PLATFORM	(NULL)
 
 #ifdef CONFIG_MMU
-#define ARCH_DLINFO						\
-do {								\
-	NEW_AUX_ENT(AT_SYSINFO_EHDR,				\
-		(elf_addr_t)current->mm->context.vdso);		\
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
index 91f1c318328e..ea2518f092e1 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -7,6 +7,7 @@
 #define _ASM_RISCV_PROCESSOR_H
 
 #include <linux/const.h>
+#include <linux/cache.h>
 
 #include <vdso/processor.h>
 
@@ -82,6 +83,7 @@ int riscv_of_parent_hartid(struct device_node *node);
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
index 21b48bddeb8f..8e7f20cb0404 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -473,8 +473,16 @@ asmlinkage __visible void do_notify_resume(struct pt_regs *regs,
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
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
