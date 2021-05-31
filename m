Return-Path: <SRS0=ZKx/=K2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF8BC47082
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 08:54:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D39516108D
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 08:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D39516108D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eWmoOx20aJnVG8CI3gP+Td7eDv7M2krZWKeaA6Od0Ek=; b=ZczGlgNwr7+ToB
	k5TTRuQzeHbvloZMxW9UH6M4G9NNOJjd5YJ0Sn+xWbDVqeTnIOcwpptC7xb34f2s79XSQP1bSezEH
	lfS4ygYfZ50Dc1VBIjOCdNUJ8YwmEWNvks8pTZSaTYzu9VicCAntWU0lHf+kAmBoowpTC/ulmtoO8
	sYg5+PpUs0sD9PQk106xynYhdhl+E7A3bHbnq/OPg5ll9VxGokOup0bDfw4agXVaBOy666giHvyhC
	bTO4d6kp2K6heGOfOCj2bwiAE8CZug9dIcEq7fcXuFtCODpLWPX8jzb+axbBCrnInQ5qPWh9uLX2a
	sFbtrhT061PLvlhQgHQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lndgU-00BYjr-Sw; Mon, 31 May 2021 08:54:06 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lndgR-00BYi4-P9
 for linux-riscv@lists.infradead.org; Mon, 31 May 2021 08:54:05 +0000
Received: by mail-ej1-x630.google.com with SMTP id lz27so15526235ejb.11
 for <linux-riscv@lists.infradead.org>; Mon, 31 May 2021 01:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A3Sgy9lxSE/4rJC7tRGP/6YuIFQCgMKdTyw9mrcVWZg=;
 b=fVUmkh6qSAPFNWHN9AX7ozHUcGgip/SzRcHJQBb2bTY9rqgCOJOmmFGLdIdG6r0KYX
 LVAFS3jnCyjU7sZttDAO3hdRRylr2G/mbcM49VydpOPQ2ptxHESXNnJUx1VVe4zKGUrM
 bGGDTr0G2qR2vDIRC6KLCwYWbhA1SZ4ntmc/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A3Sgy9lxSE/4rJC7tRGP/6YuIFQCgMKdTyw9mrcVWZg=;
 b=Ct3OsrItkGxTTml/OfwMY5CMyGkpubYvfe+dGkJW0n8EiwN8sLS+qp534nz1rLBETL
 8em8lchaaiWME7YP0Pz8rfFD7+3bBX7pgvzoqURrDkbbVSsldeNPbLvs4wMRhTy+p2d1
 9URWNeQ41EL4aEHdY9jjeOdrZjJswKD0W+Ux7G1CyeaThLa4z3Zfk/VVq1rCvQ3Lo2XV
 V8InAg+i+oiwURnfq67MLsquvOUvYcTfgV5nisMP9Bx75AklHTd1QaLD/5m7CQXdc5YU
 nKGsGZb9rQhK9VFsICJtLz++ZUgkcW0/A3den8LZORkYZgzMWmH6IZYyMtcjfBgsOQ04
 OPjg==
X-Gm-Message-State: AOAM533XBTUhLl2PuoI1726Lp6fjIqU2wkDJd2WYxp7JclcIr4axYc1x
 W9AEldSUHfInOEKpYQYIxSzGyhkifJFfRz4Sx/I=
X-Google-Smtp-Source: ABdhPJzkVghUA2l7j4wGR9CmhK24v5IJsEEEwSjLdIcvpqYMumWzIrfDITP3PgVWDLeaIKbAubzduA==
X-Received: by 2002:a17:906:b748:: with SMTP id
 fx8mr12586650ejb.477.1622451241210; 
 Mon, 31 May 2021 01:54:01 -0700 (PDT)
Received: from lootbox.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
 by smtp.gmail.com with ESMTPSA id c19sm1663683edw.10.2021.05.31.01.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 01:54:00 -0700 (PDT)
From: Vitaly Wool <vitaly.wool@konsulko.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 Nicolas Pitre <nico@fluxnic.net>, Alex Ghiti <alex@ghiti.fr>,
 Vitaly Wool <vitaly.wool@konsulko.com>
Subject: [PATCH] riscv: xip: support runtime trap patching
Date: Mon, 31 May 2021 11:53:42 +0300
Message-Id: <20210531085342.17494-1-vitaly.wool@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_015403_858653_A78369E7 
X-CRM114-Status: GOOD (  11.86  )
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

RISCV_ERRATA_ALTERNATIVE patches text at runtime which is currently
not possible when the kernel is executed from the flash in XIP mode.
Since runtime patching concerns only traps at the moment, let's just
have all the traps reside in RAM anyway if RISCV_ERRATA_ALTERNATIVE
is set. Thus, these functions will be patch-able even when the .text
section is in flash.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
---
 arch/riscv/kernel/traps.c           | 13 +++++++++----
 arch/riscv/kernel/vmlinux-xip.lds.S | 15 ++++++++++++++-
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 0721b9798595..7bc88d8aab97 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -86,8 +86,13 @@ static void do_trap_error(struct pt_regs *regs, int signo, int code,
 	}
 }
 
+#if defined (CONFIG_XIP_KERNEL) && defined (CONFIG_RISCV_ERRATA_ALTERNATIVE)
+#define __trap_section		__section(".xip.traps")
+#else
+#define __trap_section
+#endif
 #define DO_ERROR_INFO(name, signo, code, str)				\
-asmlinkage __visible void name(struct pt_regs *regs)			\
+asmlinkage __visible __trap_section void name(struct pt_regs *regs)	\
 {									\
 	do_trap_error(regs, signo, code, regs->epc, "Oops - " str);	\
 }
@@ -111,7 +116,7 @@ DO_ERROR_INFO(do_trap_store_misaligned,
 int handle_misaligned_load(struct pt_regs *regs);
 int handle_misaligned_store(struct pt_regs *regs);
 
-asmlinkage void do_trap_load_misaligned(struct pt_regs *regs)
+asmlinkage void __trap_section do_trap_load_misaligned(struct pt_regs *regs)
 {
 	if (!handle_misaligned_load(regs))
 		return;
@@ -119,7 +124,7 @@ asmlinkage void do_trap_load_misaligned(struct pt_regs *regs)
 		      "Oops - load address misaligned");
 }
 
-asmlinkage void do_trap_store_misaligned(struct pt_regs *regs)
+asmlinkage void __trap_section do_trap_store_misaligned(struct pt_regs *regs)
 {
 	if (!handle_misaligned_store(regs))
 		return;
@@ -146,7 +151,7 @@ static inline unsigned long get_break_insn_length(unsigned long pc)
 	return GET_INSN_LENGTH(insn);
 }
 
-asmlinkage __visible void do_trap_break(struct pt_regs *regs)
+asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
 {
 #ifdef CONFIG_KPROBES
 	if (kprobe_single_step_handler(regs))
diff --git a/arch/riscv/kernel/vmlinux-xip.lds.S b/arch/riscv/kernel/vmlinux-xip.lds.S
index 4b29b9917f99..a3ff09c4c3f9 100644
--- a/arch/riscv/kernel/vmlinux-xip.lds.S
+++ b/arch/riscv/kernel/vmlinux-xip.lds.S
@@ -99,9 +99,22 @@ SECTIONS
 	}
 	PERCPU_SECTION(L1_CACHE_BYTES)
 
-	. = ALIGN(PAGE_SIZE);
+	. = ALIGN(8);
+	.alternative : {
+		__alt_start = .;
+		*(.alternative)
+		__alt_end = .;
+	}
 	__init_end = .;
 
+	. = ALIGN(16);
+	.xip.traps : {
+		__xip_traps_start = .;
+		*(.xip.traps)
+		__xip_traps_end = .;
+	}
+
+	. = ALIGN(PAGE_SIZE);
 	.sdata : {
 		__global_pointer$ = . + 0x800;
 		*(.sdata*)
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
