Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A8AECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 13:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M2sDZSXUS9S+fDI6xREbT+dgNAgeYdym5MlqP/1XNnQ=; b=b+wPaDLsDxR442
	m5xVycK0+4wMaM8E8rOHKsYnU9dgxnweQkp4vvNXTTd09TBVgg/0atHZYsnogKlq4FdLG05eLHkoL
	tSuk55qB3zBah/vxtgxLNwJOeZ1YAHXFniSjWF0puJ2crT9Cf0vxWDpqcCl5U+OqJSWB+OgPrIl2w
	ElXllMSlUGv+9AlyDm19WpzNmxqSRq5UHd1lKt8IUGM0aby3TOtrZFz5MLlf0mxxuvV5FDmDlked6
	E4tUpLJdGDjxHH/DgwrzFRPOXEB5IhjxWN5hJWvIlZDdgnx0z44093E09vifoJDcjyugJ+0rkFJ32
	P5etA8EdvEGD4A8K2x3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2Zt-00DKRH-9L; Thu, 27 Oct 2022 13:05:45 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2XK-00DJ5R-St
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 13:03:08 +0000
Received: by mail-wm1-x32e.google.com with SMTP id l16-20020a05600c4f1000b003c6c0d2a445so1146281wmq.4
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 06:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAX0DbNejfkrqb/S2+c7OCAri1uVnAqmCEyoErzwy+w=;
        b=nicqwmHcGSd/cPEoKhB2mITBUJDVsZIpcBjUeRu/UNeejWFxAbVCbiXvQNCBT1U+RT
         GKpBsNF4KSut9TthK82igyPHqyeWQtpvOVaHpHNqpax8QG89meINxY+BIqWWSpZzfylo
         2bmdt/+48kjj7k2d3Kk59pZ6Pl/Nz6CDqQsirFrFij058JSsHZoNZLRlunZEimKhejsj
         i1CVWsLdrvywT3e8/rPByTZ6F46agQ4ANm0wafDnbfyFKQSkqtbwHeoL6AlCV5tVRafs
         Y+t2okAsaU19qg1wwAEsy4GV3NYke+Y80WB8ACVSYvOMx5WMJsz9ggUN/GUDCcfJT9Vm
         uBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAX0DbNejfkrqb/S2+c7OCAri1uVnAqmCEyoErzwy+w=;
        b=TNiLgavnrjvWABRNhaNYG0ss0rG+g0UBMde+zvdPB8OWYcwk10Xl1TfR9c1pKN3onn
         rPpqW78I4etLJ0wscZFd7JOxMsUywrY+MyhzslKr/f6lWA9VjlkEoCAJ4gq1HOaQ7KyM
         /DgKAmuD/so5zVjN1Opw5QjyXhgrItH7FMwW8gUvtFGd6lPwTRz/tZdTngf3ttEGAY4e
         YdZk8tXcSZptBaFzBkSKnLjaQ0OJT4OQM7q4ZHdSVFXl9rh83NAALNwvHOUt+MJZgOKZ
         xvBJHaQti3LMJnCs8KHgWm12cgBMifx4D329X6UBK+T80Q+4UOEfZnUus0xJQiqJUOc6
         uGkQ==
X-Gm-Message-State: ACrzQf1DlCZg16NxjgP5IxN0zQD0ReKOW8oph08rFUQWTN5vCng382HI
	DaenyY1ihxUKH4t8HU7MavSREgtBT/bMQQ==
X-Google-Smtp-Source: AMsMyM7ARWH3OcOCRtZrDUXW7Z8rm9Eg/J7+KLXEhlq6z0XD8gxE/KqKxtjNZJgJbPW14RpQGr+eQA==
X-Received: by 2002:a05:600c:3147:b0:3c6:f860:9610 with SMTP id h7-20020a05600c314700b003c6f8609610mr5950330wmo.170.1666875786146;
        Thu, 27 Oct 2022 06:03:06 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d5004000000b0023655e51c33sm1119677wrt.4.2022.10.27.06.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 06:03:05 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH 9/9] RISC-V: Use Zicboz in memset when available
Date: Thu, 27 Oct 2022 15:02:47 +0200
Message-Id: <20221027130247.31634-10-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027130247.31634-1-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_060306_986709_BDDE0A94 
X-CRM114-Status: GOOD (  15.66  )
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

RISC-V has an optimized memset() which does byte by byte writes up to
the first sizeof(long) aligned address, then uses Duff's device until
the last sizeof(long) aligned address, and finally byte by byte to
the end. When memset is used to zero memory and the Zicboz extension
is available, then we can extend that by doing the optimized memset
up to the first Zicboz block size aligned address, then use the
Zicboz zero instruction for each block to the last block size aligned
address, and finally the optimized memset to the end.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/lib/memset.S | 81 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
index 74e4c7feec00..786b85b5e9cc 100644
--- a/arch/riscv/lib/memset.S
+++ b/arch/riscv/lib/memset.S
@@ -5,6 +5,12 @@
 
 #include <linux/linkage.h>
 #include <asm/asm.h>
+#include <asm/alternative-macros.h>
+#include <asm/insn-def.h>
+#include <asm/hwcap.h>
+
+#define ALT_ZICBOZ(old, new)	ALTERNATIVE(old, new, 0, RISCV_ISA_EXT_ZICBOZ, \
+					    CONFIG_RISCV_ISA_ZICBOZ)
 
 /* void *memset(void *, int, size_t) */
 ENTRY(__memset)
@@ -15,6 +21,58 @@ WEAK(memset)
 	sltiu	a3, a2, 16
 	bnez	a3, .Lfinish
 
+#ifdef CONFIG_RISCV_ISA_ZICBOZ
+	ALT_ZICBOZ("j .Ldo_memset", "nop")
+	/*
+	 * t1 will be the Zicboz block size.
+	 * Zero means we're not using Zicboz, and we don't when a1 != 0
+	 */
+	li	t1, 0
+	bnez	a1, .Ldo_memset
+	la	a3, riscv_cboz_block_size
+	lw	t1, 0(a3)
+
+	/*
+	 * Round to nearest Zicboz block-aligned address
+	 * greater than or equal to the start address.
+	 */
+	addi	a3, t1, -1
+	not	t2, a3			/* t2 is Zicboz block size mask */
+	add	a3, t0, a3
+	and	t3, a3, t2		/* t3 is Zicboz block aligned start */
+
+	/* Did we go too far or not have at least one block? */
+	add	a3, a0, a2
+	and	a3, a3, t2
+	bgtu	a3, t3, .Ldo_zero
+	li	t1, 0
+	j	.Ldo_memset
+
+.Ldo_zero:
+	/* Use Duff for initial bytes if there are any */
+	bne	t3, t0, .Ldo_memset
+
+.Ldo_zero2:
+	/* Calculate end address */
+	and	a3, a2, t2
+	add	a3, t0, a3
+	sub	a4, a3, t0
+
+.Lzero_loop:
+	CBO_ZERO(t0)
+	add	t0, t0, t1
+	bltu	t0, a3, .Lzero_loop
+	li	t1, 0			/* We're done with Zicboz */
+
+	sub	a2, a2, a4		/* Update count */
+	sltiu	a3, a2, 16
+	bnez	a3, .Lfinish
+
+	/* t0 is Zicboz block size aligned, so it must be SZREG aligned */
+	j	.Ldo_duff3
+#endif
+
+.Ldo_memset:
 	/*
 	 * Round to nearest XLEN-aligned address
 	 * greater than or equal to the start address.
@@ -33,6 +91,18 @@ WEAK(memset)
 
 .Ldo_duff:
 	/* Duff's device with 32 XLEN stores per iteration */
+
+#ifdef CONFIG_RISCV_ISA_ZICBOZ
+	ALT_ZICBOZ("j .Ldo_duff2", "nop")
+	beqz	t1, .Ldo_duff2
+	/* a3, "end", is start of block aligned start. a1 is 0 */
+	move    a3, t3
+	sub	a4, a3, t0		/* a4 is SZREG aligned count */
+	move	t4, a4			/* Save count for later, see below. */
+	j	.Ldo_duff4
+#endif
+
+.Ldo_duff2:
 	/* Broadcast value into all bytes */
 	andi	a1, a1, 0xff
 	slli	a3, a1, 8
@@ -44,10 +114,12 @@ WEAK(memset)
 	or	a1, a3, a1
 #endif
 
+.Ldo_duff3:
 	/* Calculate end address */
 	andi	a4, a2, ~(SZREG-1)
 	add	a3, t0, a4
 
+.Ldo_duff4:
 	andi	a4, a4, 31*SZREG	/* Calculate remainder */
 	beqz	a4, .Lduff_loop		/* Shortcut if no remainder */
 	neg	a4, a4
@@ -100,6 +172,15 @@ WEAK(memset)
 
 	addi	t0, t0, 32*SZREG
 	bltu	t0, a3, .Lduff_loop
+
+#ifdef CONFIG_RISCV_ISA_ZICBOZ
+	ALT_ZICBOZ("j .Lcount_update", "nop")
+	beqz	t1, .Lcount_update
+	sub	a2, a2, t4		/* Difference was saved above */
+	j	.Ldo_zero2
+#endif
+
+.Lcount_update:
 	andi	a2, a2, SZREG-1		/* Update count */
 
 .Lfinish:
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
