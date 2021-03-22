Return-Path: <SRS0=7uwl=IU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA841C433C1
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 14:27:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A1656198B
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 14:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A1656198B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwRtyKO4nduf2aHDVwY9jvLrPJjRYUNukFOT7g+ydZ0=; b=a0RDVnIMSMF5SwQZJVGzlkJIed
	K75blaAl3B52CodspUE4XUNeupawRSmuUBKMVyWHoLLOKu4yqU9y27VgoDudW7xPCrBkIEBlDNUQB
	m8IBWT6ZtbU9FZCGFeYFhlf1zRoiVrer4vZ0CKTfs8+MiVwdSoeV6Ixj9Mo1oiLYebF9khVqAanzx
	3DVMP+BgEf7q/fjQUkr7LWoHYIlpXBpkvXEhDQ69RfAToVNBgcOtU0+UzuK7BDXQtPXvmsRUd9prx
	GauwcvgbE1LpTAYKi4P6cx5M/wjhtoL9FJy51VonBSegNqwV0pqaNDoBb9nsSBGiOGh68RZT2ho0v
	+/C/W/SQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOLW6-00BnTU-1c; Mon, 22 Mar 2021 14:26:53 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOLVw-00BnR3-Py
 for linux-riscv@lists.infradead.org; Mon, 22 Mar 2021 14:26:45 +0000
Received: by mail-pl1-x62e.google.com with SMTP id f17so6674325plr.0
 for <linux-riscv@lists.infradead.org>; Mon, 22 Mar 2021 07:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6Q3YnNYOfMoerR0kpEtZTgXZplG+guDye657YaTOY98=;
 b=D4uMo2a3MORqrWgoHwqn/CLvljYRTqDepnEzDQlOLj10aC452iV6a2BoJ7BjsVC40C
 s+Qq/ad1eMyMoSRpLuqevAklJoXxH1xPW+Jacbr2jOvPrz15RbSLvKPGhJYC1whMguNh
 bw3SIi+ixArwoq5J90yUkPsmcDsfrSKmUFRzXcrPUoFyTBw4yxoC2NPRg3t19rvZ17yw
 X/be9NSYLC3U13usn3BrQuOEoaddjNxuWuBYVD1ZimGKsw9Z4nUM/BufHvPWA52FIHuM
 H99tKQgY/j3gIbU3zU9P1hv7VB8JJ/AWe98xO7b9+081rIO2RZ1T6S8Yv4Mojgfy/b5O
 ZaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6Q3YnNYOfMoerR0kpEtZTgXZplG+guDye657YaTOY98=;
 b=qAwu/B8cnJbf+T56jLtCfHF/CAIVIDziGVdwa5eixxMm70GmIS1YJHy8xm38r7eGbO
 LcfaR0UdLKbzx38sKyHx6Cypl6ygqOZnxs/sslVYYagbgd9J0zZPLD59D7h5ShHfwksa
 XZucjdYbvzZvLafSrKxhpNG6+6BysTyyYSu3943RxngvuDvilWzaPhbwYAid4jk5ZoRZ
 ifA3PCJC+D/S32T51PZVgkPFdRaSSzpdWtWKkej+NFTuCC19EET+1M8/vwwffewCfhis
 AtEpuSnk82Pt4Gz/SRTZ+i1d2AEOPYaOA7pd4Kne1WVU1ujqrSfKcwISmxAMWglc7S5P
 jYyQ==
X-Gm-Message-State: AOAM5305+6gMLCu84/KsB0HwQka44wyJO9IMBU0Q8f0c9IwDf/iPfGo6
 +RplbU7JtwN/6L0aiEPGd6VvL1MiYn5JIeqR
X-Google-Smtp-Source: ABdhPJxOkhROdQ5mgLNoE0hly/pOTuvSVkcb3vCPOnLuGd8awDdnRpi4d6a7fe/0eBHZw5OE/7B4Pg==
X-Received: by 2002:a17:90a:1502:: with SMTP id
 l2mr13357630pja.149.1616423199160; 
 Mon, 22 Mar 2021 07:26:39 -0700 (PDT)
Received: from localhost.localdomain (61-230-29-29.dynamic-ip.hinet.net.
 [61.230.29.29])
 by smtp.gmail.com with ESMTPSA id v18sm14261971pfn.117.2021.03.22.07.26.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Mar 2021 07:26:38 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Cc: Frank.Zhao@starfivetech.com, anup.patel@wdc.com, atish.patra@wdc.com,
 guoren@kernel.org, alankao@andestech.com, ruinland@andestech.com,
 david.abdurachmanov@sifive.com, Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v3 4/5] riscv: sifive: Apply errata "cip-453" patch
Date: Mon, 22 Mar 2021 22:26:05 +0800
Message-Id: <1616423166-13857-5-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616423166-13857-1-git-send-email-vincent.chen@sifive.com>
References: <1616423166-13857-1-git-send-email-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_142643_394426_0DB942B3 
X-CRM114-Status: GOOD (  21.71  )
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

Add sign extension to the $badaddr before addressing the instruction page
fault and instruction access fault to workaround the issue "cip-453".

To avoid affecting the existing code sequence, this patch will creates two
trampolines to add sign extension to the $badaddr. By the "alternative"
mechanism, these two trampolines will replace the original exception
handler of instruction page fault and instruction access fault in the
excp_vect_table. In this case, only the specific SiFive CPU core jumps to
the do_page_fault and do_trap_insn_fault through these two trampolines.
Other CPUs are not affected.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/Kconfig.erratas                | 11 +++++++++
 arch/riscv/errata/sifive/Makefile         |  1 +
 arch/riscv/errata/sifive/errata.c         | 20 ++++++++++++++++
 arch/riscv/errata/sifive/errata_cip_453.S | 38 +++++++++++++++++++++++++++++++
 arch/riscv/include/asm/errata_list.h      | 21 ++++++++++++++++-
 arch/riscv/kernel/entry.S                 |  6 +++--
 6 files changed, 94 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/errata/sifive/errata_cip_453.S

diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
index 302e7467f302..b4146dca50fc 100644
--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -19,4 +19,15 @@ config ERRATA_SIFIVE
 
 	  Otherwise, please say "N" here to avoid unnecessary overhead.
 
+config ERRATA_SIFIVE_CIP_453
+	bool "Apply SiFive errata CIP-453"
+	depends on ERRATA_SIFIVE
+	default y
+	help
+	  This will apply the SiFive CIP-453 errata to add sign extension
+	  to the $badaddr when exception type is instruction page fault
+	  and instruction access fault.
+
+	  If you don't know what to do here, say "Y".
+
 endmenu
diff --git a/arch/riscv/errata/sifive/Makefile b/arch/riscv/errata/sifive/Makefile
index 2d644e19caef..bdd5fc843b8e 100644
--- a/arch/riscv/errata/sifive/Makefile
+++ b/arch/riscv/errata/sifive/Makefile
@@ -1 +1,2 @@
+obj-y += errata_cip_453.o
 obj-y += errata.o
diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index 826cd391fc55..e27391823f0f 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -16,6 +16,26 @@ struct errata_info_t {
 	bool (*check_func)(unsigned long  arch_id, unsigned long impid);
 };
 
+static bool errata_cip_453_check_func(unsigned long  arch_id, unsigned long impid)
+{
+	/*
+	 * Affected cores:
+	 * Architecture ID: 0x8000000000000007
+	 * Implement ID: 0x20181004 <= impid <= 0x20191105
+	 */
+	if (arch_id != 0x8000000000000007 ||
+	    (impid < 0x20181004 || impid > 0x20191105))
+		return false;
+	return true;
+}
+
+static struct errata_info_t errata_list[ERRATA_SIFIVE_NUMBER] = {
+	{
+		.name = "cip-453",
+		.check_func = errata_cip_453_check_func
+	},
+};
+
 static u32 __init sifive_errata_probe(unsigned long archid, unsigned long impid)
 {
 	int idx;
diff --git a/arch/riscv/errata/sifive/errata_cip_453.S b/arch/riscv/errata/sifive/errata_cip_453.S
new file mode 100644
index 000000000000..f1b9623fe1de
--- /dev/null
+++ b/arch/riscv/errata/sifive/errata_cip_453.S
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2021 SiFive
+ */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm/asm-offsets.h>
+#include <asm/alternative.h>
+
+.macro ADD_SIGN_EXT pt_reg badaddr tmp_reg
+	REG_L \badaddr, PT_BADADDR(\pt_reg)
+	li \tmp_reg,1
+	slli \tmp_reg,\tmp_reg,0x26
+	and \tmp_reg,\tmp_reg,\badaddr
+	beqz \tmp_reg, 1f
+	li \tmp_reg,-1
+	slli \tmp_reg,\tmp_reg,0x27
+	or \badaddr,\tmp_reg,\badaddr
+	REG_S \badaddr, PT_BADADDR(\pt_reg)
+1:
+.endm
+
+ENTRY(sifive_cip_453_page_fault_trp)
+	ADD_SIGN_EXT a0, t0, t1
+#ifdef CONFIG_MMU
+	la t0, do_page_fault
+#else
+	la t0, do_trap_unknown
+#endif
+	jr t0
+END(sifive_cip_453_page_fault_trp)
+
+ENTRY(sifive_cip_453_insn_fault_trp)
+	ADD_SIGN_EXT a0, t0, t1
+	la t0, do_trap_insn_fault
+	jr t0
+END(sifive_cip_453_insn_fault_trp)
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 1b56131431c9..6148d34d4245 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -5,8 +5,27 @@
 #ifndef ASM_ERRATA_LIST_H
 #define ASM_ERRATA_LIST_H
 
+#include <asm/alternative.h>
+#include <asm/vendorid_list.h>
+
 #ifdef CONFIG_ERRATA_SIFIVE
-#define	ERRATA_SIFIVE_NUMBER 0
+#define	ERRATA_SIFIVE_CIP_453 0
+#define	ERRATA_SIFIVE_NUMBER 1
 #endif
 
+#ifdef __ASSEMBLY__
+
+#define ALT_INSN_FAULT(x)						\
+ALTERNATIVE(__stringify(RISCV_PTR do_trap_insn_fault),			\
+	    __stringify(RISCV_PTR sifive_cip_453_insn_fault_trp),	\
+	    SIFIVE_VENDOR_ID, ERRATA_SIFIVE_CIP_453,			\
+	    CONFIG_ERRATA_SIFIVE_CIP_453)
+
+#define ALT_PAGE_FAULT(x)						\
+ALTERNATIVE(__stringify(RISCV_PTR do_page_fault),			\
+	    __stringify(RISCV_PTR sifive_cip_453_page_fault_trp),	\
+	    SIFIVE_VENDOR_ID, ERRATA_SIFIVE_CIP_453,			\
+	    CONFIG_ERRATA_SIFIVE_CIP_453)
+#endif /* __ASSEMBLY__ */
+
 #endif
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 744f3209c48d..60d0a2f1cd88 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -12,6 +12,7 @@
 #include <asm/unistd.h>
 #include <asm/thread_info.h>
 #include <asm/asm-offsets.h>
+#include <asm/errata_list.h>
 
 #if !IS_ENABLED(CONFIG_PREEMPTION)
 .set resume_kernel, restore_all
@@ -450,7 +451,7 @@ ENDPROC(__switch_to)
 	/* Exception vector table */
 ENTRY(excp_vect_table)
 	RISCV_PTR do_trap_insn_misaligned
-	RISCV_PTR do_trap_insn_fault
+	ALT_INSN_FAULT(RISCV_PTR do_trap_insn_fault)
 	RISCV_PTR do_trap_insn_illegal
 	RISCV_PTR do_trap_break
 	RISCV_PTR do_trap_load_misaligned
@@ -461,7 +462,8 @@ ENTRY(excp_vect_table)
 	RISCV_PTR do_trap_ecall_s
 	RISCV_PTR do_trap_unknown
 	RISCV_PTR do_trap_ecall_m
-	RISCV_PTR do_page_fault   /* instruction page fault */
+	/* instruciton page fault */
+	ALT_PAGE_FAULT(RISCV_PTR do_page_fault)
 	RISCV_PTR do_page_fault   /* load page fault */
 	RISCV_PTR do_trap_unknown
 	RISCV_PTR do_page_fault   /* store page fault */
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
