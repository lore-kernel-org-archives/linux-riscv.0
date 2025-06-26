Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DACAC7EE32
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 23:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gXPmQaQZsaXS6Kygr68iuzkKBWf0wMPr7FqmJmHhYhE=; b=ucohBEWdD9+GaI
	DtSDzzqofnFzcgVHxpEO2mtiaNW2JuDXtP40SVN8bnv1Gkl9/q7UGf561Uth4K3OQKIQREptPu96g
	aI6F2x5sbMnXcu6TAiuf7NTJvauwRe3lSh8NG5u7d3P/Grz+uo44Kw7TcsM6C7yo0Blx84eFk3VcX
	5LPJnN6jg2fNi3OqEeqpyHKnKtFQG2TGzJO4iqZ2UcjDRnLl2IF6Zzo4nf+C1kaP0NZol4/uVIcDo
	Vw2Ew5GHzRyNBKDNMP9qrGBax9vkPJWMVZt5SHGgp2mm3F7MR+HYZUG62yi2ltQZXZFSr3uhilSg/
	TUnW7CHeS38n6eKUQNUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwFC-0000000D5DY-3nLz;
	Thu, 26 Jun 2025 23:43:02 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUuOy-0000000CrZF-2GJc
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 21:45:02 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3138e64b42aso1806637a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 14:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750974299; x=1751579099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uSv8Y+Px5oxqi5OrqwYvXAbyxQm2lDW00pM2xXiCpK8=;
        b=RYp2evEk0YrV9rI2tBfINZx0qmdlDeAXn4CEalXNYUWl1NaeD/MftcHYi2Vu/0if5a
         EE70gymtqG0v7aPoGRqyv3Fz1I+idIrzQehdO6slUEAfMG6fu0dELZdHXP9sUxh7+6vA
         /qRxUuG7xvRzvYtQoBZLpLjyfKgrbZSIrXEk7yVrqjSCrrbfqjsPFpK9ZYGlk8awsaOR
         rZezsgbBW/dN5Lz+cad57EQUugnd+kuXd8tnID3BKTsKR1IArmqtP0l2ID2pNNIICkcP
         p5z4EM6o87bSEni80VShXClWWiZQ3IYTBz6L1rImM5t06BWJPd1XvH5xjPDv2tgg+C3x
         po/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750974299; x=1751579099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSv8Y+Px5oxqi5OrqwYvXAbyxQm2lDW00pM2xXiCpK8=;
        b=Tw0vMgjptYDBAFnktRxgzZBxGYzsWyqXyDATVK7/VpU3XfY+wp1RYUEFpFhaeyc12U
         SWRd/eFmkvly+VfOwnWv7L/N7qYgqWYOP//r/JQUg5+2TZwwZBjTiXzcuiN6arRFO8OE
         nphqVOP3g9qwJrN9AYKWPjBiWfh3n26BxpYVSiy4QgOnwf6+POZej6Bp7IMI5xqtlhtr
         gIB3BRsYPj2zvW+lobO34OBq3ZGQWvamz1zCw2IU14I7bgABVDjs7hE83uFKhDurtdW3
         /Q4f8llQ6WPTnhM574XNnnYT608zRUXdumvJ6gVCSpDwBgt7KQr6GbVTtNf0NG0CpuVe
         X8lA==
X-Gm-Message-State: AOJu0Yz0Tce9RMFonG/y5ruVzkHBwFEcdZt9u4hdIkwdgxro8VCZqmXT
	GYQMRrGa8fqGsFNvIlDnI0SXLE0LLo++KGY6GusL/M0/Sftc1vk2r57VtdmGq2fDl1q6qGWuB4q
	u4Some0w=
X-Gm-Gg: ASbGncvh9dlf0XEXTFpADdvB8MS8nF8cIA9M3WkI1kU3bkr80QzoLdDh4znq0cTNA2O
	RvENpEYD/KpEr6n1P7hFGbuElyuFNIecKk0EwUXIoEZQrcnfDFtPARoEUf66pTvo2+B/nJVxF3v
	1KsUDzm2EUMhD4rdWIXKNt2BOg9iX7WWI6obiTSowguK02NuiIIuw7XgtmBST7ARY4g7WB9WXMJ
	HjAldQ7HAJf7ak3jSINpfRzws1TtAVoG3FWhfVoa+0xAL6YqKv03sErph2eJtdWJmcf0kAin9o0
	ZR1Q4BMW/TsCQCBKTSCpRZqpFFFPfT3VCDj8sPxOwQZIPs1jQ4YXzpWFa4NItcyDNPFS47l4Hsr
	KFnA=
X-Google-Smtp-Source: AGHT+IFiy5e6/4y1eFV+YvUEGHahmgZinDJOFgk030JCyZD7g1g2fcqvRs62GWyAsZRroQu2Up37HA==
X-Received: by 2002:a17:90b:3e8a:b0:311:ff18:b83e with SMTP id 98e67ed59e1d1-318c8feefcemr835440a91.9.1750974299152;
        Thu, 26 Jun 2025 14:44:59 -0700 (PDT)
Received: from fw-ubuntu.hq.rivosinc.com ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c14e290dsm621241a91.30.2025.06.26.14.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:44:58 -0700 (PDT)
From: Vineet Gupta <vineetg@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Vineet Gupta <vineetg@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>
Subject: [PATCH] RISC-V: avoid using t6/x31 in hand asm
Date: Thu, 26 Jun 2025 14:44:55 -0700
Message-ID: <20250626214455.285086-1-vineetg@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_144500_674042_287C1C41 
X-CRM114-Status: GOOD (  16.42  )
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

This is technically NFC as nothing functional changes, except for usage
of different regs in some of the asm code.

This paves the way for using t6 as a global reg for say hoisting percpu
base address (with further compiler toggles suh as -ffixed-t6.

Lightly tested on QEMU: survives boot/hachbench (thx Atish for the
testing).

Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: Atish Patra <atish.patra@linux.dev>
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
---
 arch/riscv/kernel/entry.S       | 14 +++----
 arch/riscv/kernel/mcount.S      |  4 +-
 arch/riscv/lib/memcpy.S         | 66 ++++++++++++++++-----------------
 arch/riscv/lib/memmove.S        | 20 +++++-----
 arch/riscv/lib/strncmp.S        |  6 +--
 arch/riscv/lib/uaccess.S        | 24 ++++++------
 arch/riscv/lib/uaccess_vector.S | 12 +++---
 7 files changed, 73 insertions(+), 73 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 75656afa2d6b..0b5791feae5f 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -285,13 +285,13 @@ ASM_NOKPROBE(ret_from_exception)
 #ifdef CONFIG_VMAP_STACK
 SYM_CODE_START_LOCAL(handle_kernel_stack_overflow)
 	/* we reach here from kernel context, sscratch must be 0 */
-	csrrw x31, CSR_SCRATCH, x31
-	asm_per_cpu sp, overflow_stack, x31
-	li x31, OVERFLOW_STACK_SIZE
-	add sp, sp, x31
-	/* zero out x31 again and restore x31 */
-	xor x31, x31, x31
-	csrrw x31, CSR_SCRATCH, x31
+	csrrw x30, CSR_SCRATCH, x30
+	asm_per_cpu sp, overflow_stack, x30
+	li x30, OVERFLOW_STACK_SIZE
+	add sp, sp, x30
+	/* zero out x30 again and restore x30 */
+	xor x30, x30, x30
+	csrrw x30, CSR_SCRATCH, x30
 
 	addi sp, sp, -(PT_SIZE_ON_STACK)
 
diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index da4a4000e57e..d7e4303a18a4 100644
--- a/arch/riscv/kernel/mcount.S
+++ b/arch/riscv/kernel/mcount.S
@@ -89,8 +89,8 @@ SYM_FUNC_START(_mcount)
 
 	la	t3, ftrace_graph_entry
 	REG_L	t2, 0(t3)
-	la	t6, ftrace_graph_entry_stub
-	bne	t2, t6, .Ldo_ftrace_graph_caller
+	la	t5, ftrace_graph_entry_stub
+	bne	t2, t5, .Ldo_ftrace_graph_caller
 #endif
 	la	t3, ftrace_trace_function
 	REG_L	t5, 0(t3)
diff --git a/arch/riscv/lib/memcpy.S b/arch/riscv/lib/memcpy.S
index 44e009ec5fef..37ebe9f2b355 100644
--- a/arch/riscv/lib/memcpy.S
+++ b/arch/riscv/lib/memcpy.S
@@ -8,13 +8,13 @@
 
 /* void *memcpy(void *, const void *, size_t) */
 SYM_FUNC_START(__memcpy)
-	move t6, a0  /* Preserve return value */
+	move t5, a0  /* Preserve return value */
 
 	/* Defer to byte-oriented copy for small sizes */
 	sltiu a3, a2, 128
 	bnez a3, 4f
 	/* Use word-oriented copy only if low-order bits match */
-	andi a3, t6, SZREG-1
+	andi a3, a0, SZREG-1
 	andi a4, a1, SZREG-1
 	bne a3, a4, 4f
 
@@ -30,8 +30,8 @@ SYM_FUNC_START(__memcpy)
 1:
 	lb a5, 0(a1)
 	addi a1, a1, 1
-	sb a5, 0(t6)
-	addi t6, t6, 1
+	sb a5, 0(t5)
+	addi t5, t5, 1
 	bltu a1, a3, 1b
 	sub a2, a2, a4  /* Update count */
 
@@ -49,31 +49,31 @@ SYM_FUNC_START(__memcpy)
 	REG_L t2, 6*SZREG(a1)
 	REG_L t3, 7*SZREG(a1)
 	REG_L t4, 8*SZREG(a1)
-	REG_L t5, 9*SZREG(a1)
-	REG_S a4,       0(t6)
-	REG_S a5,   SZREG(t6)
-	REG_S a6, 2*SZREG(t6)
-	REG_S a7, 3*SZREG(t6)
-	REG_S t0, 4*SZREG(t6)
-	REG_S t1, 5*SZREG(t6)
-	REG_S t2, 6*SZREG(t6)
-	REG_S t3, 7*SZREG(t6)
-	REG_S t4, 8*SZREG(t6)
-	REG_S t5, 9*SZREG(t6)
-	REG_L a4, 10*SZREG(a1)
-	REG_L a5, 11*SZREG(a1)
-	REG_L a6, 12*SZREG(a1)
-	REG_L a7, 13*SZREG(a1)
-	REG_L t0, 14*SZREG(a1)
-	REG_L t1, 15*SZREG(a1)
+	REG_S a4,       0(t5)
+	REG_S a5,   SZREG(t5)
+	REG_S a6, 2*SZREG(t5)
+	REG_S a7, 3*SZREG(t5)
+	REG_S t0, 4*SZREG(t5)
+	REG_S t1, 5*SZREG(t5)
+	REG_S t2, 6*SZREG(t5)
+	REG_S t3, 7*SZREG(t5)
+	REG_S t4, 8*SZREG(t5)
+	REG_L a4, 9*SZREG(a1)
+	REG_L a5, 10*SZREG(a1)
+	REG_L a6, 11*SZREG(a1)
+	REG_L a7, 12*SZREG(a1)
+	REG_L t0, 13*SZREG(a1)
+	REG_L t1, 14*SZREG(a1)
+	REG_L t2, 15*SZREG(a1)
 	addi a1, a1, 16*SZREG
-	REG_S a4, 10*SZREG(t6)
-	REG_S a5, 11*SZREG(t6)
-	REG_S a6, 12*SZREG(t6)
-	REG_S a7, 13*SZREG(t6)
-	REG_S t0, 14*SZREG(t6)
-	REG_S t1, 15*SZREG(t6)
-	addi t6, t6, 16*SZREG
+	REG_S a4, 9*SZREG(t5)
+	REG_S a5, 10*SZREG(t5)
+	REG_S a6, 11*SZREG(t5)
+	REG_S a7, 12*SZREG(t5)
+	REG_S t0, 13*SZREG(t5)
+	REG_S t1, 14*SZREG(t5)
+	REG_S t2, 15*SZREG(t5)
+	addi t5, t5, 16*SZREG
 	bltu a1, a3, 3b
 	andi a2, a2, (16*SZREG)-1  /* Update count */
 
@@ -83,15 +83,15 @@ SYM_FUNC_START(__memcpy)
 	add a3, a1, a2
 
 	/* Use word-oriented copy if co-aligned to word boundary */
-	or a5, a1, t6
+	or a5, a1, t5
 	or a5, a5, a3
 	andi a5, a5, 3
 	bnez a5, 5f
 7:
 	lw a4, 0(a1)
 	addi a1, a1, 4
-	sw a4, 0(t6)
-	addi t6, t6, 4
+	sw a4, 0(t5)
+	addi t5, t5, 4
 	bltu a1, a3, 7b
 
 	ret
@@ -99,8 +99,8 @@ SYM_FUNC_START(__memcpy)
 5:
 	lb a4, 0(a1)
 	addi a1, a1, 1
-	sb a4, 0(t6)
-	addi t6, t6, 1
+	sb a4, 0(t5)
+	addi t5, t5, 1
 	bltu a1, a3, 5b
 6:
 	ret
diff --git a/arch/riscv/lib/memmove.S b/arch/riscv/lib/memmove.S
index cb3e2e7ef0ba..5fbd84c2cf18 100644
--- a/arch/riscv/lib/memmove.S
+++ b/arch/riscv/lib/memmove.S
@@ -35,7 +35,7 @@ SYM_FUNC_START(__memmove)
 	 *      Forward Copy: t3 - Index counter of dest
 	 *      Reverse Copy: t4 - Index counter of dest
 	 *   Both Copy Modes: t5 - Inclusive first multibyte/aligned of dest
-	 *   Both Copy Modes: t6 - Non-Inclusive last multibyte/aligned of dest
+	 *   Both Copy Modes: a3 - Non-Inclusive last multibyte/aligned of dest
 	 *   Both Copy Modes: t0 - Link / Temporary for load-store
 	 *   Both Copy Modes: t1 - Temporary for load-store
 	 *   Both Copy Modes: t2 - Temporary for load-store
@@ -47,7 +47,7 @@ SYM_FUNC_START(__memmove)
 
 	/*
 	 * Solve for some register values now.
-	 * Byte copy does not need t5 or t6.
+	 * Byte copy does not need t5 or a3.
 	 */
 	mv   t3, a0
 	add  t4, a0, a2
@@ -62,10 +62,10 @@ SYM_FUNC_START(__memmove)
 	beqz t0, .Lbyte_copy
 
 	/*
-	 * Now solve for t5 and t6.
+	 * Now solve for t5 and a3.
 	 */
 	andi t5, t3, -SZREG
-	andi t6, t4, -SZREG
+	andi a3, t4, -SZREG
 	/*
 	 * If dest(Register t3) rounded down to the nearest naturally
 	 * aligned SZREG address, does not equal dest, then add SZREG
@@ -99,7 +99,7 @@ SYM_FUNC_START(__memmove)
 	slli a6, a5, 3 /* Multiply by 8 to convert that to bits to shift */
 	sub  a5, a1, t3 /* Find the difference between src and dest */
 	andi a1, a1, -SZREG /* Align the src pointer */
-	addi a2, t6, SZREG /* The other breakpoint for the unrolled loop*/
+	addi a2, a3, SZREG /* The other breakpoint for the unrolled loop*/
 
 	/*
 	 * Compute The Inverse Shift
@@ -147,9 +147,9 @@ SYM_FUNC_START(__memmove)
 	or    t2, t1, t2
 	REG_S t2, ((1 * SZREG) - (2 * SZREG))(t3)
 
-	bne   t3, t6, 1b
+	bne   t3, a3, 1b
 	2:
-	mv    t3, t6 /* Fix the dest pointer in case the loop was broken */
+	mv    t3, a3 /* Fix the dest pointer in case the loop was broken */
 
 	add  a1, t3, a5 /* Restore the src pointer */
 	j .Lbyte_copy_forward /* Copy any remaining bytes */
@@ -232,7 +232,7 @@ SYM_FUNC_START(__memmove)
 	addi  a1, a1, SZREG
 	addi  t3, t3, SZREG
 	REG_S t1, (-1 * SZREG)(t3)
-	bne   t3, t6, 1b
+	bne   t3, a3, 1b
 
 	j .Lbyte_copy_forward /* Copy any remaining bytes */
 
@@ -269,13 +269,13 @@ SYM_FUNC_START(__memmove)
 	jalr zero, 0x0(t0) /* Return to multibyte copy loop */
 
 .Lbyte_copy_until_aligned_reverse:
-	beq  t4, t6, 2f
+	beq  t4, a3, 2f
 	1:
 	lb   t1, -1(a4)
 	addi a4, a4, -1
 	addi t4, t4, -1
 	sb   t1,  0(t4)
-	bne  t4, t6, 1b
+	bne  t4, a3, 1b
 	2:
 	jalr zero, 0x0(t0) /* Return to multibyte copy loop */
 
diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
index 062000c468c8..536d8ba8caa1 100644
--- a/arch/riscv/lib/strncmp.S
+++ b/arch/riscv/lib/strncmp.S
@@ -63,7 +63,7 @@ strncmp_zbb:
 	 *   a2 - number of characters to compare
 	 *
 	 * Clobbers
-	 *   t0, t1, t2, t3, t4, t5, t6
+	 *   t0, t1, t2, t3, t4, t5
 	 */
 
 	or	t2, a0, a1
@@ -73,12 +73,12 @@ strncmp_zbb:
 	bnez	t2, 3f
 
 	/* Adjust limit for fast-path.  */
-	andi	t6, t4, -SZREG
+	andi	t0, t4, -SZREG
 
 	/* Main loop for aligned string.  */
 	.p2align 3
 1:
-	bge	a0, t6, 3f
+	bge	a0, t0, 3f
 	REG_L	t0, 0(a0)
 	REG_L	t1, 0(a1)
 	orc.b	t3, t0
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 4efea1b3326c..25fdedc0efdb 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -27,16 +27,16 @@ EXPORT_SYMBOL(__asm_copy_from_user)
 
 SYM_FUNC_START(fallback_scalar_usercopy)
 	/* Enable access to user memory */
-	li	t6, SR_SUM
-	csrs 	CSR_STATUS, t6
-	mv 	t6, ra
+	li	a7, SR_SUM
+	csrs 	CSR_STATUS, a7
+	mv 	a7, ra
 
 	call 	fallback_scalar_usercopy_sum_enabled
 
 	/* Disable access to user memory */
-	mv 	ra, t6
-	li 	t6, SR_SUM
-	csrc 	CSR_STATUS, t6
+	mv 	ra, a7
+	li 	a7, SR_SUM
+	csrc 	CSR_STATUS, a7
 	ret
 SYM_FUNC_END(fallback_scalar_usercopy)
 
@@ -117,7 +117,7 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	fixup REG_L   a4,        0(a1), 10f
 	fixup REG_L   a5,    SZREG(a1), 10f
 	fixup REG_L   a6,  2*SZREG(a1), 10f
-	fixup REG_L   a7,  3*SZREG(a1), 10f
+	fixup REG_L   a2,  3*SZREG(a1), 10f
 	fixup REG_L   t1,  4*SZREG(a1), 10f
 	fixup REG_L   t2,  5*SZREG(a1), 10f
 	fixup REG_L   t3,  6*SZREG(a1), 10f
@@ -125,7 +125,7 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	fixup REG_S   a4,        0(a0), 10f
 	fixup REG_S   a5,    SZREG(a0), 10f
 	fixup REG_S   a6,  2*SZREG(a0), 10f
-	fixup REG_S   a7,  3*SZREG(a0), 10f
+	fixup REG_S   a2,  3*SZREG(a0), 10f
 	fixup REG_S   t1,  4*SZREG(a0), 10f
 	fixup REG_S   t2,  5*SZREG(a0), 10f
 	fixup REG_S   t3,  6*SZREG(a0), 10f
@@ -217,8 +217,8 @@ SYM_FUNC_END(fallback_scalar_usercopy_sum_enabled)
 SYM_FUNC_START(__clear_user)
 
 	/* Enable access to user memory */
-	li t6, SR_SUM
-	csrs CSR_STATUS, t6
+	li t5, SR_SUM
+	csrs CSR_STATUS, t5
 
 	add a3, a0, a1
 	addi t0, a0, SZREG-1
@@ -240,7 +240,7 @@ SYM_FUNC_START(__clear_user)
 
 3:
 	/* Disable access to user memory */
-	csrc CSR_STATUS, t6
+	csrc CSR_STATUS, t5
 	li a0, 0
 	ret
 4: /* Edge case: unalignment */
@@ -257,7 +257,7 @@ SYM_FUNC_START(__clear_user)
 	/* Exception fixup code */
 11:
 	/* Disable access to user memory */
-	csrc CSR_STATUS, t6
+	csrc CSR_STATUS, t5
 	sub a0, a3, a0
 	ret
 SYM_FUNC_END(__clear_user)
diff --git a/arch/riscv/lib/uaccess_vector.S b/arch/riscv/lib/uaccess_vector.S
index 03b5560609a2..401fde708c77 100644
--- a/arch/riscv/lib/uaccess_vector.S
+++ b/arch/riscv/lib/uaccess_vector.S
@@ -22,16 +22,16 @@
 
 SYM_FUNC_START(__asm_vector_usercopy)
 	/* Enable access to user memory */
-	li	t6, SR_SUM
-	csrs	CSR_STATUS, t6
-	mv	t6, ra
+	li	a7, SR_SUM
+	csrs	CSR_STATUS, a7
+	mv	a7, ra
 
 	call 	__asm_vector_usercopy_sum_enabled
 
 	/* Disable access to user memory */
-	mv 	ra, t6
-	li 	t6, SR_SUM
-	csrc	CSR_STATUS, t6
+	mv 	ra, a7
+	li 	a7, SR_SUM
+	csrc	CSR_STATUS, a7
 	ret
 SYM_FUNC_END(__asm_vector_usercopy)
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
