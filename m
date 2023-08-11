Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D76C04E69
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 23:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=w8D0HDVHXuj08IbdT9FlaBAA0KQoQMZfdER+1EvYh1E=; b=Gg8fXR1BX1eR1C5UlE0N7azIEZ
	K4hk0zMzSjA7O7KLlwE6SWCmKCPyhezKi2OsAnh+CMZNvX9zhOzsYFgWyc4xs5+lARBxxgOPPslMh
	vqZNnvgeEu7iMXYayaN7fW6iVHCaNTQ8CNI829bLetiyQ6wrocRbt+yidexKSdWD6GhuA/CRlnR2a
	xnQNZX9VJJwm4Nv5hix1yIETwBrmWJ86Ra91H7EabU5BDWiATbqDsdpfb1BLIKkIAX7DX1anZhUXu
	zTmYcPw7/hhCbmUhQ0JkItaimzp8xVrzOPeW16Sfo3CMYHVhrwI2dv/Gf0lC+U24h/Tc3qLNrqlVC
	KDRBfLFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUbg1-00BwAk-1O;
	Fri, 11 Aug 2023 23:36:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUbfy-00Bw96-0s
	for linux-riscv@bombadil.infradead.org;
	Fri, 11 Aug 2023 23:36:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uqSttns2QMMHKhEq1iT/6N0civk3/DgixVYj3d7z750=; b=ERpre6Itm1ngOJVBopUV2DLcng
	7MfwrLxhR2ljIPFo8UciMbJ5Q7y8QTmeUNOtUrx6q8czH7as2OJvdi0t9J4PaaiuAMTyxiUqn6sxw
	fMRAuRSXrGBNyJMLbazvjPiUbdnHQBemMJaMLy7htZ0peHwWMmlc40LYQb92cL3NzoS6RDTWUk3GU
	wgyaoKqKHl4lZsGvdW8N9krkPaLIbf2Krx7Nm1n/x4nFzZjDl2KAhSWIFq+pqnt39pKwsoufG1SAR
	r+Gz2nOkDSB9OZIMUhv4ofXiRDxiXFaZunl2InRjMVidfpG8IDYd5SHST/EQe4iJCmW5AeGshMBS7
	D51j2aJg==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUbft-007te2-0j
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 23:36:12 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1bba5563cd6so32231945ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 16:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691796966; x=1692401766;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uqSttns2QMMHKhEq1iT/6N0civk3/DgixVYj3d7z750=;
        b=X34fuYj30ll5ylhB7Aqg1vD8KbeZ19k7cBalDKC4+jHgFwr/RyYNj6Pr6V61x2DfL+
         EJCnT8nIK0diol/XAn3zkp0CBQHYK32A+lAxwsdw8V0WmgFSaGLh6MeDrKTy+O1YtGQL
         lRW4ToSimJ7KM73g7/WgJ/lZD0oHxf4tn3qUdGyg4O4aRd94vZCmXlgckCK9wtoEnTIx
         By1wmnSVOyT/6qltlLMq/NHoH3JbmEp+o19oXoVJJzJxY75DUC/F8bAwXqxVHXMraBwG
         CNQJwBuxXfuA8b8ReBpbrRr4G875agXduf79V73IbjdTK0GMrf/tPtRPCyES9mwJzUQL
         9upw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691796966; x=1692401766;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uqSttns2QMMHKhEq1iT/6N0civk3/DgixVYj3d7z750=;
        b=YfoTYxiFVcc9xBFvbgf/IICmNniDBt6GoBwdp09XsiR+SzTb9ZEO6vdM90cyZmBBwu
         kICjxLSk39PvqpebWdGN4+2A16EAQx67SZ+WuuegWX842MlpYiTM/AaYyXqxovYlfyR1
         OlOJjDSKZzMRNRGhQ+lAtK/6yo1YNUcj+hVlinqs7vWg3mxeLTo+4DzN3eU4DatFovZB
         kaMZTjBla7MYuzOBTKh4Ddok149Kb2wG5saSII693X+qhr+LW9EoqKyzMcwcZZyLwGAZ
         G4QABJCEIEjBaR/5gIk9sGL+S9CSto2EsTlYmZsive/7b2u+13E42FFmnkhoS5rlzbxa
         Pr2w==
X-Gm-Message-State: AOJu0YyAZDue0PXqq8eFnCVK7raH35dTer3ombXtiUp3KI2hCIgc4aW7
	OwOcHsWCzU6ez3TudnwocK9zEqzh53n2AQgyBXY=
X-Google-Smtp-Source: AGHT+IHmoLAUiv8fk25rU3LsIqT4bGf0NYp3Jdy7r9PrFn7vgSF/A8z6XY7y0W3PdKsPxdaEB7q92Ncr+0mp/5dgQt8=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:902:da90:b0:1bc:8249:2547 with
 SMTP id j16-20020a170902da9000b001bc82492547mr1100101plx.12.1691796965861;
 Fri, 11 Aug 2023 16:36:05 -0700 (PDT)
Date: Fri, 11 Aug 2023 23:36:00 +0000
In-Reply-To: <20230811233556.97161-7-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230811233556.97161-7-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3217; i=samitolvanen@google.com;
 h=from:subject; bh=tt28FmYKneUlEuS934Ul5UfwYg3GE/8Wy9t+zpPCYws=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBk1sXcZHCAlTnd4EYJhbusgalCGC+w098BuJsGg
 pjfWx3ysWCJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZNbF3AAKCRBMtfaEi7xW
 7vtjC/9aDXQZ1XeqW1KEFEIdmhB56J7RualjvUaGwqw1lObaqRwOTOHqVWWF23giW/63wj+kC2d
 uHjLduotttcVZkHZsC6bSVritbMUdqcBJPktHpbake9N1DDHjOKuNQV7Nb8/N4fdKLoTbsIhX8J
 c9wUZRHH+uECCk0s/Vthl8g0IjkG8bxxiTWZPmj9U6cBnZreRQNTMLyS0VAeDbMe1fDLYwCxUOD
 m7jKpu3cmKHJ0+q07Tw7ImOGqjT+v/47NwVRAfE3wnQ2qG23TXar0JY6Ve/GXc8Cl5iQqIkW8I6
 vqNSlOuam4C9fCr1mNVlroRnndKOjNwoqNMGFOpCRRtZboI2i9jEI4sy77bqFyu9Z2AaZODMEky
 Z8lDTU3yZB+Dfy0y9jrRLlFmdooFQZZqg92id+407SgbATsSpewepWk6+xfbx/2ctL/zCdrzrKE Wqbc1Mw5wnbcu9O9FXMhy5KyHuHKxN0/EpYpF8+0511pfnh6hGOTgck63WxCg0nkRDL/o=
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230811233556.97161-10-samitolvanen@google.com>
Subject: [PATCH 3/5] riscv: Move global pointer loading to a macro
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Guo Ren <guoren@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_003609_409008_D60521DE 
X-CRM114-Status: UNSURE (   9.26  )
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
---
 arch/riscv/include/asm/asm.h      |  8 ++++++++
 arch/riscv/kernel/entry.S         |  6 ++----
 arch/riscv/kernel/head.S          | 15 +++------------
 arch/riscv/kernel/suspend_entry.S |  5 +----
 4 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 13815a7f907a..c53388f784a2 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -103,6 +103,14 @@
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
index 39875f5e08a6..2b4248c6b0a9 100644
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
2.41.0.640.ga95def55d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
