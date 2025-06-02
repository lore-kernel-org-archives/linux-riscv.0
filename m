Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9E1C5AD49
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 17:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3Hf949RfitV8jZrO2eEydZUl5aUZXb69nh13wlhAZ1I=; b=Qe4OkGz02no7mf
	AO0XAASHhZv6S9pI8rR2hldOhZGYZ5C3yXIx7Lgz38GHbtvDTi4vqVOSM2ps4DXySYccbP+ZlkdRP
	QmGO9uFM2OCGbm8Etm3vex52V0+b5nmIFhEUam2kuIx3eTkVMJe/1yupF9JPsdnnqR8w4oA2rTiHA
	rJAfDUCL6w1AoAP3H++OQIL546bJsbUR1qicXyfWMlssQ/eK4RXEnb1mGuuzQTFRu+dt/+3bJHWDC
	aolGBDJrBM/HeZGEuv0STySG+DhL8KCVrKhX473pnRoG4hnw2/FtcZ4V5b7hUZB5NMBkWs7PG6mTR
	ssiPQCJ8ushrEzdkYCHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM92N-000000083VM-2zlZ;
	Mon, 02 Jun 2025 17:33:27 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM92L-000000083SX-0aGv
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 17:33:27 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7398d65476eso3307644b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 10:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1748885604; x=1749490404; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=aYQyX8aZ8NhXaDIBs9Ns28j59NnIu7JlDvT0Vk1HsrI=;
        b=3EBv7yfg6ngcL5/I+WEsJpghCYt91PkofflkMFYZ8+FBdjw1h3LlRV2i+bItHkClyX
         ibJAzRN7HeasV6CU/WD+qExY8k3HHEKdzL6FoOtAWrLtAVyc/zsWM6jI1K8ilxreLPVn
         xw1x3igUn2HrcEgWIWjydc5Dm75cBaPqWruvOlsd9GFrcz/6VAPd2NOngn7ar0dwX/JI
         6NTExoEsXLp3CHEG2lZZv8XlpGkhBP3yBTsZ5Oo5x2KUVdUA0+JuVWxQHM1Yn5sfljen
         RHIcMPtKW83zMktSZd0jXtQXtrOegNwsOXfZCYAbhPdSLxI+1TU6Kmfv0CKcDlk9sQeD
         FjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748885604; x=1749490404;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYQyX8aZ8NhXaDIBs9Ns28j59NnIu7JlDvT0Vk1HsrI=;
        b=IhcG2/Z8OS9BQKJwlXftz8l6Xl5kGuA/rmN0aoSzXEewpqUc9a78EULPgx81LCQGBl
         gWPp8O5YvYM6S9E8ch7qJ2TkIlCs8Gsy3LUGAEUDGGJlKcEr8pLD3xyG1Ypf6nUpqCZh
         swWHY6eCka3IwX7eaf9VQ5pg4y3WlkJH9SA5RvsxRrw7sCM5PhgQTmNhdSDcIxc0MR6D
         ErzukWCctIiRBjnn99wGFIvbK8VknV6QngXPZLvV+ElDnrDGLa+jQg5tjhFiUSAdjnSd
         f8XdZtMM0zEV1WNpylOIX0bTFR1kze13A5N8RFilFdmnLm8tNyoU3NiYWP9SJUVvGt4P
         d5CA==
X-Gm-Message-State: AOJu0YxoATfJalSs6yfbvWmzEm5954kkXLnPO4CWVxZPXDZsDFSB1dI+
	lfm297XAF7v4O3p+OiTAHfbS8cZxYFEy6EH+IhfqFEF80iTVikhWu2kFgNWuTDwCm7mb00i3kmX
	7sxuU
X-Gm-Gg: ASbGnctUPTvucZK8m8zVmyaTsq8CILMSf8rElZavWHMkZ9tf8L/Vx9medID0qwYfLYQ
	NgJWIy7BM8xz+3YHyIWZX3HQXnj4+M1j5Giu2laCc6DGSSoR6CRI+aZQpxeL69LwwROWQSprBQM
	DPZ7I1DZroBp9IGlq8/ekWzrilhfSz3crafXFFqLfeiNdAa6Y0E0wNpSTw/vLhpAkDydLAgfcui
	QYdBsVgm9WLjwD8bXUzuRJ1sti5qBaNHXpQQQJZDDpjIQTczW0j55Bb0ccb4QyCQmKx+tvHvvaO
	3O01WFGqHwa/tCx0XExA1J6r3h29rEQmDN8uJ60v1Nph2rV6r94lRP5CWrpqwyh3gg==
X-Google-Smtp-Source: AGHT+IH4ebgKrPudsIEVpMBhUEYV0QwsXStMenWeUdx9ZSZ/63MHgzNbJkMRTBxioooWxFk8KE7pfA==
X-Received: by 2002:aa7:8d52:0:b0:742:a24d:aede with SMTP id d2e1a72fcca58-747fbcaccd8mr276194b3a.8.1748885604065;
        Mon, 02 Jun 2025 10:33:24 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:e83a])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-747affaf9f0sm7872611b3a.117.2025.06.02.10.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 10:33:23 -0700 (PDT)
Subject: [PATCH] Revert "RISC-V: vDSO: Wire up getrandom() vDSO implementation"
Date: Mon,  2 Jun 2025 10:33:15 -0700
Message-Id: <20250602173315.20228-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_103325_192062_77D2AF52 
X-CRM114-Status: GOOD (  16.47  )
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

This has been on -next for a bit, but it's broken and there's already a
v2.  So I'm reverting it to avoid more rebasing.

This reverts commit 89079520cef65d6da1e864eab4464effe5396e23.

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/Kconfig                            |   1 -
 arch/riscv/include/asm/vdso/getrandom.h       |  30 ---
 arch/riscv/kernel/vdso/Makefile               |  12 -
 arch/riscv/kernel/vdso/getrandom.c            |  10 -
 arch/riscv/kernel/vdso/vdso.lds.S             |   1 -
 arch/riscv/kernel/vdso/vgetrandom-chacha.S    | 244 ------------------
 .../selftests/vDSO/vgetrandom-chacha.S        |   2 -
 7 files changed, 300 deletions(-)
 delete mode 100644 arch/riscv/include/asm/vdso/getrandom.h
 delete mode 100644 arch/riscv/kernel/vdso/getrandom.c
 delete mode 100644 arch/riscv/kernel/vdso/vgetrandom-chacha.S

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index fbca724302ab..bbec87b79309 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -218,7 +218,6 @@ config RISCV
 	select THREAD_INFO_IN_TASK
 	select TRACE_IRQFLAGS_SUPPORT
 	select UACCESS_MEMCPY if !MMU
-	select VDSO_GETRANDOM if HAVE_GENERIC_VDSO
 	select USER_STACKTRACE_SUPPORT
 	select ZONE_DMA32 if 64BIT
 
diff --git a/arch/riscv/include/asm/vdso/getrandom.h b/arch/riscv/include/asm/vdso/getrandom.h
deleted file mode 100644
index 8dc92441702a..000000000000
--- a/arch/riscv/include/asm/vdso/getrandom.h
+++ /dev/null
@@ -1,30 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2025 Xi Ruoyao <xry111@xry111.site>. All Rights Reserved.
- */
-#ifndef __ASM_VDSO_GETRANDOM_H
-#define __ASM_VDSO_GETRANDOM_H
-
-#ifndef __ASSEMBLY__
-
-#include <asm/unistd.h>
-
-static __always_inline ssize_t getrandom_syscall(void *_buffer, size_t _len, unsigned int _flags)
-{
-	register long ret asm("a0");
-	register long nr asm("a7") = __NR_getrandom;
-	register void *buffer asm("a0") = _buffer;
-	register size_t len asm("a1") = _len;
-	register unsigned int flags asm("a2") = _flags;
-
-	asm volatile ("ecall\n"
-		      : "+r" (ret)
-		      : "r" (nr), "r" (buffer), "r" (len), "r" (flags)
-		      : "memory");
-
-	return ret;
-}
-
-#endif /* !__ASSEMBLY__ */
-
-#endif /* __ASM_VDSO_GETRANDOM_H */
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 8d12f5646eb5..4a5d131506fc 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -13,17 +13,9 @@ vdso-syms += flush_icache
 vdso-syms += hwprobe
 vdso-syms += sys_hwprobe
 
-ifdef CONFIG_VDSO_GETRANDOM
-vdso-syms += getrandom
-endif
-
 # Files to link into the vdso
 obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
 
-ifdef CONFIG_VDSO_GETRANDOM
-obj-vdso += vgetrandom-chacha.o
-endif
-
 ccflags-y := -fno-stack-protector
 ccflags-y += -DDISABLE_BRANCH_PROFILING
 ccflags-y += -fno-builtin
@@ -32,10 +24,6 @@ ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday.o += -fPIC -include $(c-gettimeofday-y)
 endif
 
-ifneq ($(c-getrandom-y),)
-  CFLAGS_getrandom.o += -fPIC -include $(c-getrandom-y)
-endif
-
 CFLAGS_hwprobe.o += -fPIC
 
 # Build rules
diff --git a/arch/riscv/kernel/vdso/getrandom.c b/arch/riscv/kernel/vdso/getrandom.c
deleted file mode 100644
index f21922e8cebd..000000000000
--- a/arch/riscv/kernel/vdso/getrandom.c
+++ /dev/null
@@ -1,10 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2025 Xi Ruoyao <xry111@xry111.site>. All Rights Reserved.
- */
-#include <linux/types.h>
-
-ssize_t __vdso_getrandom(void *buffer, size_t len, unsigned int flags, void *opaque_state, size_t opaque_len)
-{
-	return __cvdso_getrandom(buffer, len, flags, opaque_state, opaque_len);
-}
diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index abc69cda0445..8e86965a8aae 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -80,7 +80,6 @@ VERSION
 #ifndef COMPAT_VDSO
 		__vdso_riscv_hwprobe;
 #endif
-		__vdso_getrandom;
 	local: *;
 	};
 }
diff --git a/arch/riscv/kernel/vdso/vgetrandom-chacha.S b/arch/riscv/kernel/vdso/vgetrandom-chacha.S
deleted file mode 100644
index d793cadc78a6..000000000000
--- a/arch/riscv/kernel/vdso/vgetrandom-chacha.S
+++ /dev/null
@@ -1,244 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2025 Xi Ruoyao <xry111@xry111.site>. All Rights Reserved.
- *
- * Based on arch/loongarch/vdso/vgetrandom-chacha.S.
- */
-
-#include <asm/asm.h>
-#include <linux/linkage.h>
-
-.text
-
-.macro	ROTRI	rd rs imm
-	slliw	t0, \rs, 32 - \imm
-	srliw	\rd, \rs, \imm
-	or	\rd, \rd, t0
-.endm
-
-.macro	OP_4REG	op d0 d1 d2 d3 s0 s1 s2 s3
-	\op	\d0, \d0, \s0
-	\op	\d1, \d1, \s1
-	\op	\d2, \d2, \s2
-	\op	\d3, \d3, \s3
-.endm
-
-/*
- *	a0: output bytes
- * 	a1: 32-byte key input
- *	a2: 8-byte counter input/output
- *	a3: number of 64-byte blocks to write to output
- */
-SYM_FUNC_START(__arch_chacha20_blocks_nostack)
-
-#define output		a0
-#define key		a1
-#define counter		a2
-#define nblocks		a3
-#define i		a4
-#define state0		s0
-#define state1		s1
-#define state2		s2
-#define state3		s3
-#define state4		s4
-#define state5		s5
-#define state6		s6
-#define state7		s7
-#define state8		s8
-#define state9		s9
-#define state10		s10
-#define state11		s11
-#define state12		a5
-#define state13		a6
-#define state14		a7
-#define state15		t1
-#define cnt		t2
-#define copy0		t3
-#define copy1		t4
-#define copy2		t5
-#define copy3		t6
-
-/* Packs to be used with OP_4REG */
-#define line0		state0, state1, state2, state3
-#define line1		state4, state5, state6, state7
-#define line2		state8, state9, state10, state11
-#define line3		state12, state13, state14, state15
-
-#define line1_perm	state5, state6, state7, state4
-#define line2_perm	state10, state11, state8, state9
-#define line3_perm	state15, state12, state13, state14
-
-#define copy		copy0, copy1, copy2, copy3
-
-#define _16		16, 16, 16, 16
-#define _20		20, 20, 20, 20
-#define _24		24, 24, 24, 24
-#define _25		25, 25, 25, 25
-
-	addi		sp, sp, -12*SZREG
-	REG_S		s0,         (sp)
-	REG_S		s1,    SZREG(sp)
-	REG_S		s2,  2*SZREG(sp)
-	REG_S		s3,  3*SZREG(sp)
-	REG_S		s4,  4*SZREG(sp)
-	REG_S		s5,  5*SZREG(sp)
-	REG_S		s6,  6*SZREG(sp)
-	REG_S		s7,  7*SZREG(sp)
-	REG_S		s8,  8*SZREG(sp)
-	REG_S		s9,  9*SZREG(sp)
-	REG_S		s10, 10*SZREG(sp)
-	REG_S		s11, 11*SZREG(sp)
-
-	ld		cnt, (counter)
-
-	li		copy0, 0x61707865
-	li		copy1, 0x3320646e
-	li		copy2, 0x79622d32
-	li		copy3, 0x6b206574
-
-.Lblock:
-	/* state[0,1,2,3] = "expand 32-byte k" */
-	mv		state0, copy0
-	mv		state1, copy1
-	mv		state2, copy2
-	mv		state3, copy3
-
-	/* state[4,5,..,11] = key */
-	lw		state4,   (key)
-	lw		state5,  4(key)
-	lw		state6,  8(key)
-	lw		state7,  12(key)
-	lw		state8,  16(key)
-	lw		state9,  20(key)
-	lw		state10, 24(key)
-	lw		state11, 28(key)
-
-	/* state[12,13] = counter */
-	mv		state12, cnt
-	srli		state13, cnt, 32
-
-	/* state[14,15] = 0 */
-	mv		state14, zero
-	mv		state15, zero
-
-	li		i, 10
-.Lpermute:
-	/* odd round */
-	OP_4REG	addw	line0, line1
-	OP_4REG	xor	line3, line0
-	OP_4REG	ROTRI	line3, _16
-
-	OP_4REG	addw	line2, line3
-	OP_4REG	xor	line1, line2
-	OP_4REG	ROTRI	line1, _20
-
-	OP_4REG	addw	line0, line1
-	OP_4REG	xor	line3, line0
-	OP_4REG	ROTRI	line3, _24
-
-	OP_4REG	addw	line2, line3
-	OP_4REG	xor	line1, line2
-	OP_4REG	ROTRI	line1, _25
-
-	/* even round */
-	OP_4REG	addw	line0, line1_perm
-	OP_4REG	xor	line3_perm, line0
-	OP_4REG	ROTRI	line3_perm, _16
-
-	OP_4REG	addw	line2_perm, line3_perm
-	OP_4REG	xor	line1_perm, line2_perm
-	OP_4REG	ROTRI	line1_perm, _20
-
-	OP_4REG	addw	line0, line1_perm
-	OP_4REG	xor	line3_perm, line0
-	OP_4REG	ROTRI	line3_perm, _24
-
-	OP_4REG	addw	line2_perm, line3_perm
-	OP_4REG	xor	line1_perm, line2_perm
-	OP_4REG	ROTRI	line1_perm, _25
-
-	addi		i, i, -1
-	bnez		i, .Lpermute
-
-	/* output[0,1,2,3] = copy[0,1,2,3] + state[0,1,2,3] */
-	OP_4REG	addw	line0, copy
-	sw		state0,   (output)
-	sw		state1,  4(output)
-	sw		state2,  8(output)
-	sw		state3, 12(output)
-
-	/* from now on state[0,1,2,3] are scratch registers  */
-
-	/* state[0,1,2,3] = lo(key) */
-	lw		state0,   (key)
-	lw		state1,  4(key)
-	lw		state2,  8(key)
-	lw		state3, 12(key)
-
-	/* output[4,5,6,7] = state[0,1,2,3] + state[4,5,6,7] */
-	OP_4REG	addw	line1, line0
-	sw		state4, 16(output)
-	sw		state5, 20(output)
-	sw		state6, 24(output)
-	sw		state7, 28(output)
-
-	/* state[0,1,2,3] = hi(key) */
-	lw		state0, 16(key)
-	lw		state1, 20(key)
-	lw		state2, 24(key)
-	lw		state3, 28(key)
-
-	/* output[8,9,10,11] = tmp[0,1,2,3] + state[8,9,10,11] */
-	OP_4REG	addw	line2, line0
-	sw		state8,  32(output)
-	sw		state9,  36(output)
-	sw		state10, 40(output)
-	sw		state11, 44(output)
-
-	/* output[12,13,14,15] = state[12,13,14,15] + [cnt_lo, cnt_hi, 0, 0] */
-	addw		state12, state12, cnt
-	srli		state0, cnt, 32
-	addw		state13, state13, state0
-	sw		state12, 48(output)
-	sw		state13, 52(output)
-	sw		state14, 56(output)
-	sw		state15, 60(output)
-
-	/* ++counter */
-	addi		cnt, cnt, 1
-
-	/* output += 64 */
-	addi		output, output, 64
-	/* --nblocks */
-	addi		nblocks, nblocks, -1
-	bnez		nblocks, .Lblock
-
-	/* counter = [cnt_lo, cnt_hi] */
-	sd		cnt, (counter)
-
-	/* Zero out the potentially sensitive regs, in case nothing uses these
-	 * again.  As at now copy[0,1,2,3] just contains "expand 32-byte k" and
-	 * state[0,...,11] are s0-s11 those we'll restore in the epilogue, we
-	 * only need to zero state[12,...,15].
-	 */
-	mv		state12, zero
-	mv		state13, zero
-	mv		state14, zero
-	mv		state15, zero
-
-	REG_L		s0,         (sp)
-	REG_L		s1,    SZREG(sp)
-	REG_L		s2,  2*SZREG(sp)
-	REG_L		s3,  3*SZREG(sp)
-	REG_L		s4,  4*SZREG(sp)
-	REG_L		s5,  5*SZREG(sp)
-	REG_L		s6,  6*SZREG(sp)
-	REG_L		s7,  7*SZREG(sp)
-	REG_L		s8,  8*SZREG(sp)
-	REG_L		s9,  9*SZREG(sp)
-	REG_L		s10, 10*SZREG(sp)
-	REG_L		s11, 11*SZREG(sp)
-	addi		sp, sp, 12*SZREG
-
-	ret
-SYM_FUNC_END(__arch_chacha20_blocks_nostack)
diff --git a/tools/testing/selftests/vDSO/vgetrandom-chacha.S b/tools/testing/selftests/vDSO/vgetrandom-chacha.S
index a4a82e1c28a9..d6e09af7c0a9 100644
--- a/tools/testing/selftests/vDSO/vgetrandom-chacha.S
+++ b/tools/testing/selftests/vDSO/vgetrandom-chacha.S
@@ -11,8 +11,6 @@
 #include "../../../../arch/loongarch/vdso/vgetrandom-chacha.S"
 #elif defined(__powerpc__) || defined(__powerpc64__)
 #include "../../../../arch/powerpc/kernel/vdso/vgetrandom-chacha.S"
-#elif defined(__riscv) && __riscv_xlen == 64
-#include "../../../../arch/riscv/kernel/vdso/vgetrandom-chacha.S"
 #elif defined(__s390x__)
 #include "../../../../arch/s390/kernel/vdso64/vgetrandom-chacha.S"
 #elif defined(__x86_64__)
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
