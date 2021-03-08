Return-Path: <SRS0=HQWJ=IG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEF9C433E6
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 03:59:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB4E264DE5
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 03:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB4E264DE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mcfEzc8tQCd87i14klPRYPc/KxwutFrpwwR5d048CQ=; b=Qq1m2mTNVHavgfjzSHe3Eamw0D
	k1s/fdoHahAiq5vxh3jOWqdfw0zZ0SqeVEX3ea/rnv2ZnnarOeLUuKXgjw/gW7NyypusPOQef0g5y
	NgTLngeimd/Hxs4KqcPtNNXcIuB3vBKkCD6h/FHRjmoRniQEp/do9SsGfF2/Tvsgl/QqVDO285Tor
	I2m5iTqi8JKODIbBoBoGsR2PU1B7tR7wptSCOqrXdetBs9kggbt9uDNfAtNtve9oBfeqT0r/63tYe
	q6CG72G8my1KFyv/w6jb8RAbB2AMbmSMzT2HO/Q1FrgSj0UlhFqiBwkX/CXesKC5h8kjaaKEG++oS
	vQ1SM+CQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ72i-00Eylf-Jo; Mon, 08 Mar 2021 03:58:52 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ72W-00Eyj4-Qk
 for linux-riscv@lists.infradead.org; Mon, 08 Mar 2021 03:58:48 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so3599370pjb.1
 for <linux-riscv@lists.infradead.org>; Sun, 07 Mar 2021 19:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XzcWO4WxAXbRR55X/ffvu5e/R0w7ktNqGho86e/yyUg=;
 b=H/kEkTDBm+YLhNI+3rVjm4zPzOUOncXS+rNArf/1fVNmOMwo4Gsg6MNIp02HTwj1b5
 juTz6LRQ5RhRsXfQQPqk3iIkUJtPY0fH1iVn033yvF7P5Kz0kxVWv5dEjOxCIPaurO10
 ncoFEdsod6/D1UvGvhlWd7eMWbNRbv4b4wp8/kbZ7F5I4LuT9xy9MTONJfIN3sSKTKL/
 G2Y0eXlh1ydMQM/kV9h8SHF5HqxeZ0PETZLhsgecV4gbqwW30srSnxH+07E4xLDfAYfJ
 gwRSh2hw1fHgqk4fHGJEvtvLW22c8PrUkDDqQCpwvTZsDJFzevJDcjnH9zOkOyBjBh6s
 Hanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XzcWO4WxAXbRR55X/ffvu5e/R0w7ktNqGho86e/yyUg=;
 b=QJHUNQotAiOr5RF3NEsRY1zDYYquIJsdugWdFDQ9x669XlFy+pmbY27TfKqGRYc4yk
 xQWfbcfJTjfklOK3JMctdLft1sD9ruCkk8NLkIOYcJX3gf01deN4OZ4eofA/ShHcuf7i
 JfW2AHlQL6idrW3Su4S3bxkIvRLZjwrJjIxjnaIP1gVHs3dCinTNbDnqTDsoCJk+m4YX
 jLRd1eXF7OFQpSS6nUw0h2nSWMM3afaNNdG4KARuVG0MwRDC8l5s7+m1UAu5TUwd+SlR
 QnNx+Ok1sG5Ovaq6gZ2JvmyZg1HCNDEyH3n/NuLPcBcCOnu+MP3nWQM+MvNbjLm2+Oli
 KGkg==
X-Gm-Message-State: AOAM533QHW6DAbrRfYU3L/4PbYKMknwIOYCvj0UGbd1Z+MyKqn3hknu2
 0mFTH2Tgjv/CvB42appqmLxTsbMjf1K+Jp49
X-Google-Smtp-Source: ABdhPJxCj84+PMBCAX98XjyjwWQxuXAzYSSeLUd296KK5Kr/MK6QJe5+2iU3mwg7vSrwahukb5EUSg==
X-Received: by 2002:a17:90a:bd06:: with SMTP id
 y6mr21362469pjr.112.1615175919176; 
 Sun, 07 Mar 2021 19:58:39 -0800 (PST)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id v3sm8394307pff.217.2021.03.07.19.58.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Mar 2021 19:58:38 -0800 (PST)
From: Vincent Chen <vincent.chen@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: Frank.Zhao@starfivetech.com, atish.patra@wdc.com, anup.patel@wdc.com,
 guoren@kernel.org, alankao@andestech.com, paul.walmsley@sifive.com,
 Vincent Chen <vincent.chen@sifive.com>
Subject: [RFC patch 4/4] riscv: sifive: apply errata "cip-453" patch
Date: Mon,  8 Mar 2021 11:58:17 +0800
Message-Id: <1615175897-23509-5-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615175897-23509-1-git-send-email-vincent.chen@sifive.com>
References: <1615175897-23509-1-git-send-email-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_035847_170605_636F5CF6 
X-CRM114-Status: GOOD (  23.93  )
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
 arch/riscv/Kconfig.erratas                | 20 +++++++++++
 arch/riscv/Kconfig.socs                   |  1 +
 arch/riscv/errata/Makefile                |  1 +
 arch/riscv/errata/sifive/Makefile         |  2 ++
 arch/riscv/errata/sifive/errata.c         | 56 +++++++++++++++++++++++++++++++
 arch/riscv/errata/sifive/errata_cip_453.S | 34 +++++++++++++++++++
 arch/riscv/include/asm/errata_list.h      |  3 +-
 arch/riscv/kernel/entry.S                 | 12 +++++--
 8 files changed, 126 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/errata/sifive/Makefile
 create mode 100644 arch/riscv/errata/sifive/errata.c
 create mode 100644 arch/riscv/errata/sifive/errata_cip_453.S

diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
index 4d0bafc536df..907fa6b13ee2 100644
--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -9,4 +9,24 @@ config RISCV_ERRATA_ALTERNATIVE
 	  code patching is performed once in the boot stages. It means
 	  that the overhead from this mechanism is just taken once.
 
+config ERRATA_SIFIVE
+	bool "SiFive errata"
+	help
+	  All SiFive errata Kconfig depend on this Kconfig. Please say "Y"
+	  here if your platform uses SiFive CPU cores.
+
+	  Otherwise, please say "N" here to avoid unnecessary overhead.
+
+config ERRATA_SIFIVE_CIP_453
+	bool "Apply SiFive errata CIP-453"
+	depends on ERRATA_SIFIVE
+	depends on RISCV_ERRATA_ALTERNATIVE
+	default y
+	help
+	  This will apply the SiFive CIP-453 errata to add sign extension
+	  to the $badaddr when exception type is instruction page fault
+	  and instruction access fault.
+
+	  If you don't know what to do here, say "Y".
+
 endmenu
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 7efcece8896c..b9eda857fc87 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -7,6 +7,7 @@ config SOC_SIFIVE
 	select CLK_SIFIVE
 	select CLK_SIFIVE_PRCI
 	select SIFIVE_PLIC
+	select ERRATA_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
index 43e6d5424367..b8f8740a3e44 100644
--- a/arch/riscv/errata/Makefile
+++ b/arch/riscv/errata/Makefile
@@ -1 +1,2 @@
 obj-y	+= alternative.o
+obj-$(CONFIG_ERRATA_SIFIVE) += sifive/
diff --git a/arch/riscv/errata/sifive/Makefile b/arch/riscv/errata/sifive/Makefile
new file mode 100644
index 000000000000..b7f4cd7ee185
--- /dev/null
+++ b/arch/riscv/errata/sifive/Makefile
@@ -0,0 +1,2 @@
+obj-y += altern_ops.o
+obj-y += errata_cip_453.o
diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
new file mode 100644
index 000000000000..0b0a9af42a55
--- /dev/null
+++ b/arch/riscv/errata/sifive/errata.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2021 Sifive.
+ */
+
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/bug.h>
+#include <asm/alternative.h>
+#include <asm/vendorid_list.h>
+#include <asm/errata_list.h>
+
+#define MAX_ERRATA_IMPID 5
+struct errata_info_t {
+	char name[ERRATA_STRING_LENGTH_MAX];
+	unsigned long arch_id;
+	unsigned long imp_id[MAX_ERRATA_IMPID];
+} errata_info;
+
+struct errata_info_t sifive_errata_list[ERRATA_NUMBER] = {
+	{
+		.name = "cip-453",
+		.arch_id = 0x8000000000000007,
+		.imp_id = {
+			0x20181004, 0x00200504
+		},
+	},
+};
+
+static inline bool __init cpu_info_cmp(struct errata_info_t *errata, struct alt_entry *alt)
+{
+	int i;
+
+	if (errata->arch_id != cpu_mfr_info.arch_id)
+		return false;
+
+	for (i = 0; i < MAX_ERRATA_IMPID && errata->imp_id[i]; i++)
+		if (errata->imp_id[i] == cpu_mfr_info.imp_id)
+			return true;
+
+	return false;
+}
+
+static bool __init sifive_errata_check(struct alt_entry *alt)
+{
+	if (cpu_mfr_info.vendor_id != alt->vendor_id)
+		return false;
+
+	if (likely(alt->errata_id < ERRATA_NUMBER))
+		return cpu_info_cmp(&sifive_errata_list[alt->errata_id], alt);
+
+	WARN_ON(1);
+	return false;
+}
+
+REGISTER_ERRATA_CHECKFUNC(sifive_errata_check, SIFIVE_VENDOR_ID);
diff --git a/arch/riscv/errata/sifive/errata_cip_453.S b/arch/riscv/errata/sifive/errata_cip_453.S
new file mode 100644
index 000000000000..34d0fe26172e
--- /dev/null
+++ b/arch/riscv/errata/sifive/errata_cip_453.S
@@ -0,0 +1,34 @@
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
+ENTRY(do_page_fault_trampoline)
+	ADD_SIGN_EXT a0, t0, t1
+	la t0, do_page_fault
+	jr t0
+END(do_page_fault_trampoline)
+
+ENTRY(do_trap_insn_fault_trampoline)
+	ADD_SIGN_EXT a0, t0, t1
+	la t0, do_trap_insn_fault
+	jr t0
+END(do_trap_insn_fault_trampoline)
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 5e5a1fcd90ba..d3752c8eff1f 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -4,5 +4,6 @@
  */
 
 #ifdef CONFIG_SOC_SIFIVE
-#define	ERRATA_NUMBER 0
+#define	ERRATA_CIP_453 0
+#define	ERRATA_NUMBER 1
 #endif
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 744f3209c48d..821e86ee67e4 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -12,6 +12,9 @@
 #include <asm/unistd.h>
 #include <asm/thread_info.h>
 #include <asm/asm-offsets.h>
+#include <asm/alternative.h>
+#include <asm/vendorid_list.h>
+#include <asm/errata_list.h>
 
 #if !IS_ENABLED(CONFIG_PREEMPTION)
 .set resume_kernel, restore_all
@@ -450,7 +453,9 @@ ENDPROC(__switch_to)
 	/* Exception vector table */
 ENTRY(excp_vect_table)
 	RISCV_PTR do_trap_insn_misaligned
-	RISCV_PTR do_trap_insn_fault
+	ALTERNATIVE(__stringify(RISCV_PTR do_trap_insn_fault),
+		    __stringify(RISCV_PTR do_trap_insn_fault_trampoline),
+		    SIFIVE_VENDOR_ID, ERRATA_CIP_453, CONFIG_ERRATA_SIFIVE_CIP_453)
 	RISCV_PTR do_trap_insn_illegal
 	RISCV_PTR do_trap_break
 	RISCV_PTR do_trap_load_misaligned
@@ -461,7 +466,10 @@ ENTRY(excp_vect_table)
 	RISCV_PTR do_trap_ecall_s
 	RISCV_PTR do_trap_unknown
 	RISCV_PTR do_trap_ecall_m
-	RISCV_PTR do_page_fault   /* instruction page fault */
+	/* instruciton page fault */
+	ALTERNATIVE(__stringify(RISCV_PTR do_page_fault),
+		    __stringify(RISCV_PTR do_page_fault_trampoline),
+		    SIFIVE_VENDOR_ID, ERRATA_CIP_453, CONFIG_ERRATA_SIFIVE_CIP_453)
 	RISCV_PTR do_page_fault   /* load page fault */
 	RISCV_PTR do_trap_unknown
 	RISCV_PTR do_page_fault   /* store page fault */
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
