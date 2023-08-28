Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DE7C83F12
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 19:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+bQg87hIrWQCKvAcslQzH+SuPEjYRfVqHebA/IM2Dzs=; b=fcRvRmKgRywGstvNj9g3fOv+JD
	RC9pJ7wz8alQ8DPng/4yvH2Nwri8DV6Okxl2yYktf3URrN+3c0ytFyY5yvlQsHVJbXuAQpkCdJUuW
	NU8fVxgz7hbFXCupPKn53MS7bZyXrFH2HSXVgOT/2Sswdk/uDiA3wGLeOe5kd11OP0nABUHAyI12p
	TzA0uOzNFHFPi5ruEIlqXCBaOJSnpg8kmBbAmxZXdx/Lth17qdWJZ9JRmmSKE2pG17d0dY+hiPE2A
	IsUr6Dvx4ioWqRbNX/BoetaERp5qhM1xIc0/rGvpuKjzHa7fjFtznMj2ElPsnplpNsOTTEU4uXNZn
	D2Wjwm2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaiNv-00ABwe-0a;
	Mon, 28 Aug 2023 19:58:51 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaiNp-00ABuN-1j
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 19:58:47 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d7493fcd829so4440078276.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 12:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693252724; x=1693857524;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GN6X1nlK+F0kjkEC50FG9os31FAuUCJYmCM49+1obnI=;
        b=q81rXqLshiF0sln/xS3h/1Wt74xT2Rdg2j7FkroNKWNJx+s5YHbY+oxX80kCoOEdXg
         Z7tbUBEmnha1x55o337Yu6Lp+PK9LnYIpjNDnXpf7Vvob1fBYdUFHdVNRYzgfh16aSLv
         eFNKGP5rRTkOAMSM3mrjAPNqs5knGLIBbNRZAC6qGU+CNi/lzLXAiQhO62xa0d/tNvJ+
         HZQCnftScs5HC5H/QHtUIo0uBGDaDIJXYW2D2SPFvrSpGGn81MfWM1OEFhJRudgn2+le
         WexQrz+RIoMq4d/FZyHuGt5KMF8ZH4GobjeJX5y+t0Ma6T4e2S48xP0NJhR5CYYZChPH
         OKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693252724; x=1693857524;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GN6X1nlK+F0kjkEC50FG9os31FAuUCJYmCM49+1obnI=;
        b=MFXYZNQ2Q0I36eKM4iN94PpHYallDxRWzNQZmdVMdxIVs4Ho3ONUcP4J5bVOcJcief
         fKbNEaLjfSSQ+lI09slu5Zdbru0Ape6tthIuurasFYLxnK/Dh/lQhl/kHxqBWZpYGOC+
         1DvOjqtJfKoa4DKpvBCs4S7UekX6pFVca0wP7wEOpZu+ldQBnzDTL7d1QvCye6Hki2q0
         CKj0KaxIR2+j8+q+J8GobraowTMaFCO73Y3p2ks8n4NYeQzppfOupWT7RLhWbcWcrJP8
         8yAbxzPWFuujU5ShYZVZP5bIrVeua6AuwXtNsolWEtSFzkCo8JWyM4lu8a5eluFJYBG0
         Go8g==
X-Gm-Message-State: AOJu0Yw9muDPgjH19Ru4mxmwRfGS85soROopr3tHdpu83oeJO2fUOrzl
	qEAArUu9aPDxomoFPzL2Vd2gHViX2s8AOALcgJM=
X-Google-Smtp-Source: AGHT+IH/uHwJj6+qOeylfRyEPqpB+nnMtItRxR7gf+ULc0gWYu3yZPJVS4kkyblR9fUvFWo2HvJU3EuGasR5rTd2B1w=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:9011:0:b0:d5d:b03c:49b2 with SMTP
 id s17-20020a259011000000b00d5db03c49b2mr820198ybl.11.1693252723904; Mon, 28
 Aug 2023 12:58:43 -0700 (PDT)
Date: Mon, 28 Aug 2023 19:58:37 +0000
In-Reply-To: <20230828195833.756747-8-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230828195833.756747-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3271; i=samitolvanen@google.com;
 h=from:subject; bh=Chgku5okNNw1TPF+7h/tJxx5VnEIks6hZ2ypKsZTKYg=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBk7PxqRbtkifAND8x/XfLzfQWcnICH3txr02qPt
 4eiKf2aYjSJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZOz8agAKCRBMtfaEi7xW
 7sqPC/4yfD8F4LJhON/0j9LDQmdASW7omk5GP9QTz9u9V2kMfasvvS5/J6shUYxruhqnrbLQBUp
 oZG+GjK1FZXYmm2NhWg4FLwoGp73evhYqS3wI+Ft3xabSmr5Na3lU51SZXDGqV8uyQ7euwUibuM
 1IB+PWku6qCOxTHa+PmjyOlXV/KauzFtIzwmz+0x5d45qcRehgOD29B8x93CCG4ocGo16RTP8LI
 F/iGt9KvESUFJHI8k0VjTovZNvf6YxjaSUpyeHxe3VVQSccGWV/T3h55eOORae0j0Myri46bWi6
 G6OIOjCjM5wvPYvwQTVyYFnbv5wTS0DJqhUWZt3ZEVviB/dFtXNBfxwtPWVuNItQMaZQ/8iaxqH
 ZZt1G2FWe/DvsQ5lHk95L6xpiDHTU8W8m68q4rh/0qju4f8K6jxJcN6sSbo2s98UyF1YVfErhSD UX5opXBgLT/rq9utajC5hslrYEgFPNP1pUHjVWRg8zD8f17xYD7/57e0gz+NISpgLceIs=
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
Message-ID: <20230828195833.756747-11-samitolvanen@google.com>
Subject: [PATCH v3 3/6] riscv: Move global pointer loading to a macro
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Clement Leger <cleger@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_125845_571502_FCE6A3AB 
X-CRM114-Status: UNSURE (   9.98  )
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
index 11c3b94c4534..79b5a863c782 100644
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
index 12b52afe09a4..556a4b166d8c 100644
--- a/arch/riscv/kernel/suspend_entry.S
+++ b/arch/riscv/kernel/suspend_entry.S
@@ -60,10 +60,7 @@ END(__cpu_suspend_enter)
 
 ENTRY(__cpu_resume_enter)
 	/* Load the global pointer */
-	.option push
-	.option norelax
-		la gp, __global_pointer$
-	.option pop
+	load_global_pointer
 
 #ifdef CONFIG_MMU
 	/* Save A0 and A1 */
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
