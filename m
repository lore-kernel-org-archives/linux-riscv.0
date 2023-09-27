Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C07E80A8A
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 22:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zTE3zzjrfiNI1FF0t5uM5rjSyF+RzA54//J5HMa0dWI=; b=2BlWvDNYNy8KWTkp3h+28MaBaN
	Ayfk37U/fmpXb+a/ccaaU8Q1w1eaWHPDmKVHVlhbscDv3U9Gk72CoPdocRLORCLDMNL9r2HOT+5sF
	iZmhv1dK8HQOkW7nciBk7Dk1wvPhw4DkvVE9XM+F3Au2LK0/QctC+BVDuU0syOFgWYFYJMvlU2xJ+
	1HT29BKN1gg69CLOrB84sNLznkR5EeJ4fHvPikulywUPJoRyy7TDYgawG/JrHZnzDVIY4aVrQPSNr
	p/Za1R8XIXfpkLBaaQCigoNZwunvH7FS+XIIGpxpHZtv21tiKYpnIe1PJmHw2Q/K4OtiUgPq5B6QM
	VNi1JURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qldKK-001s3C-0b;
	Wed, 27 Sep 2023 22:48:16 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qldKD-001ryh-0a
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 22:48:10 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d815354ea7fso17999103276.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 15:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695854887; x=1696459687; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iZRzZZUde58Au/vMHi9s1sr9e50uKHmMzB9hG9Emfi8=;
        b=wtFd3ERdk9HhHTN4etJetNZgZdnQpE0OWD1J0VrT8W8g2F2J1k+qohPVArafayf05i
         zBseDy6eCtxfZC32nKfpxxrzIgG4paK0lY+SgzO5HqK3g80NFyk6eIdVfUZQXBiWt2sa
         cXz4g88jYJVqAcp86+K2uQCv6EOb8nxiLrLsf5JT7S6fto6sKEZQLJ6BSKztGaDaHhlk
         e5MCZUqe6i49Przlx+/0UhTGDmZy7b/t3pcPYrxmrygjTXEL57N3thQMlm4QGGFmdr5C
         T2oK/pTigHhvBuTilYijfXF96gp0sYquwqMK+XXSDQjkvtBamjIEjEkF7IsIih8Y/qy3
         +fjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695854887; x=1696459687;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZRzZZUde58Au/vMHi9s1sr9e50uKHmMzB9hG9Emfi8=;
        b=fLvXwsSMwOFypXQ+z/hsdgQaDPlHf2PqT5azpqw60e41U/49+ihZnLcMp61gBFA0P7
         3RnVCh8OLW+4bINNJuEuix9KQlE3vwfJz2gg0ccHnkwxwD5eHx8BmTuEQWjd8AerZcQq
         P/S9zFFxwR2QIfAM00fq4hi2FTSClR07X93Y9w2fyzEfSWfcCRtGPgD2h4eIA2dsq58q
         XaAPCkmP/KSb5uLC1t60OU/RyeyltfZczTtG6yJVufeSQMNDAhMauahdDo2xmcUE0Jo0
         lJ+6ci0SZgyDzqs4yBNN8uk+Hho3anCkH1O8XHCVT1BUh/qAQyYykKvVHZ/+vzjLX5kO
         lo0w==
X-Gm-Message-State: AOJu0YwmSsnGTuyy7KOCFOBlkwSFAtuH2jewq8w/1SWI82I1W/kQ5KyL
	uacIjJ4B7DbYxvmhld+/UxA9b0jQ0FbI0eria5c=
X-Google-Smtp-Source: AGHT+IHxA01ww/gyg3znhBfLop3CsLNtadfoLfadsJ+aTBN8Cew9KjwVh2b0BcNDR7oyVphEb0igmcTzaPy309ZP/TI=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:77c8:0:b0:d86:56f4:e4a3 with SMTP
 id s191-20020a2577c8000000b00d8656f4e4a3mr47419ybc.13.1695854886912; Wed, 27
 Sep 2023 15:48:06 -0700 (PDT)
Date: Wed, 27 Sep 2023 22:48:01 +0000
In-Reply-To: <20230927224757.1154247-8-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230927224757.1154247-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3282; i=samitolvanen@google.com;
 h=from:subject; bh=R9zKwYTLpHe6QQ7XyQD72MWWY4El/ER6AIXVUR/GJUM=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBlFLEdZRzIvfGvPyQVjyzKduUT/iUIvXAAcWfD+
 dGjTCtj8a6JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZRSxHQAKCRBMtfaEi7xW
 7vxkC/4lyaxKokcSbtqaj17rhTY1rhzJjWKwRCnuvZWzRstnDuir45jKziPslpAWi1iVs4RHF5x
 qreszbKjdycXuhJYRxcRe6hhHwB+MraLf+Jmo9RRUrC5vJrRwF4G4jMYJlYoEvCtKXrin9W7kYA
 lSX1MRkRZB7fwcX+42TsHFgVDTdkCgHi2VXX9HyMdy1BEjocetNYmgpwSy3jb/2sYwU9rOeEP+d
 xPuWVYmhdclejB1IRxi1FlxFV9dtGt/8drHYZaS0+mhI+6oC98fA8xqDLchezP4eqDL2BbTrAop
 m4GCYz2lwbxsAvQuj/G8ryvpfdC9INZUpo49ZnuqH9bAEQFLNBDL8W24eDJfiIggFROFKvicuWf
 bmwVX9GWrCQzHkG6Z9sT735briNXedUmD5tg1TizousIT92Wq54P/gQRA4WXCwWgeZMTTTQ7m2M 4Akymo49EdgXk6dPjkQb4//KenjqGWTqBerQSlGLryhBvRQrAAVQW0OWp3/+xHxCLiuOs=
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Message-ID: <20230927224757.1154247-11-samitolvanen@google.com>
Subject: [PATCH v4 3/6] riscv: Move global pointer loading to a macro
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Clement Leger <cleger@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_154809_223136_D22BAF9B 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

In Clang 17, -fsanitize=shadow-call-stack uses the newly declared
platform register gp for storing shadow call stack pointers. As
this is obviously incompatible with gp relaxation, in preparation
for CONFIG_SHADOW_CALL_STACK support, move global pointer loading
to a single macro, which we can cleanly disable when SCS is used
instead.

Link: https://reviews.llvm.org/rGaa1d2693c256
Link: https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a484e843e6eeb51f0cb7b8819e50da6d2444d769
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/riscv/include/asm/asm.h      |  8 ++++++++
 arch/riscv/kernel/entry.S         |  6 ++----
 arch/riscv/kernel/head.S          | 15 +++------------
 arch/riscv/kernel/suspend_entry.S |  5 +----
 4 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 8e446be2d57c..f34dd1a526a1 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -109,6 +109,14 @@
 	REG_L \dst, 0(\dst)
 .endm
 
+/* load __global_pointer to gp */
+.macro load_global_pointer
+.option push
+.option norelax
+	la gp, __global_pointer$
+.option pop
+.endm
+
 	/* save all GPs except x1 ~ x5 */
 	.macro save_from_x6_to_x31
 	REG_S x6,  PT_T1(sp)
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index a306562636e4..6215dcf2e83b 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -75,10 +75,8 @@ _save_context:
 	csrw CSR_SCRATCH, x0
 
 	/* Load the global pointer */
-.option push
-.option norelax
-	la gp, __global_pointer$
-.option pop
+	load_global_pointer
+
 	move a0, sp /* pt_regs */
 	la ra, ret_from_exception
 
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 3710ea5d160f..a0484d95d8fb 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -110,10 +110,7 @@ relocate_enable_mmu:
 	csrw CSR_TVEC, a0
 
 	/* Reload the global pointer */
-.option push
-.option norelax
-	la gp, __global_pointer$
-.option pop
+	load_global_pointer
 
 	/*
 	 * Switch to kernel page tables.  A full fence is necessary in order to
@@ -134,10 +131,7 @@ secondary_start_sbi:
 	csrw CSR_IP, zero
 
 	/* Load the global pointer */
-	.option push
-	.option norelax
-		la gp, __global_pointer$
-	.option pop
+	load_global_pointer
 
 	/*
 	 * Disable FPU & VECTOR to detect illegal usage of
@@ -228,10 +222,7 @@ pmp_done:
 #endif /* CONFIG_RISCV_M_MODE */
 
 	/* Load the global pointer */
-.option push
-.option norelax
-	la gp, __global_pointer$
-.option pop
+	load_global_pointer
 
 	/*
 	 * Disable FPU & VECTOR to detect illegal usage of
diff --git a/arch/riscv/kernel/suspend_entry.S b/arch/riscv/kernel/suspend_entry.S
index f7960c7c5f9e..d5cf8b575777 100644
--- a/arch/riscv/kernel/suspend_entry.S
+++ b/arch/riscv/kernel/suspend_entry.S
@@ -61,10 +61,7 @@ END(__cpu_suspend_enter)
 
 SYM_TYPED_FUNC_START(__cpu_resume_enter)
 	/* Load the global pointer */
-	.option push
-	.option norelax
-		la gp, __global_pointer$
-	.option pop
+	load_global_pointer
 
 #ifdef CONFIG_MMU
 	/* Save A0 and A1 */
-- 
2.42.0.515.g380fc7ccd1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
