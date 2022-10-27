Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17384FA3740
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m96kgmGIilyUqeD++YeQFocMzgc8NGLZKA2l8ytQxiQ=; b=Vfujp/HWP1r0Xx
	YdVAC2oK8j3MjBm3MdMrPtTK4G0/jkryMgfA96Lm4aEmCa3FGBUwbLnnFdF5Ic1YIeZ/Z5ISdKmv8
	bTI8x2djY2q5xGiO02BvQpqIQwx4VLGsCKPfbxF7V/XlzQZRcCnBNT3QQ36aiAeVA2VHJAnzc/oci
	hKOSAeWJy8gW8kwIR96CE+B5E+Z5GjZabQpK/hK2utD0S/eJ5IM/mHqxtHSTApX6nttPe+id1YypL
	NorgYyN5ipBcp4rBSK+zuWq7LNkMshnRnzVjkUCriWkFrfBNj9hg+zs/FS2GIL2wOR6tQLtsHdpH6
	5J5ceb+A+2Iwq2YqftYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2ZY-00DKFa-RN; Thu, 27 Oct 2022 13:05:24 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2XJ-00DJ39-Rg
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 13:03:08 +0000
Received: by mail-wr1-x431.google.com with SMTP id h9so2098014wrt.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 06:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEd63VkcdB1NsGmp6u1XxlrgxZv1boF1F6ofZVnsAx4=;
        b=oTmS6SGE95EGgR+AsNmA0GQUZ/mSautMKrVhTV+HabUzbDAYBEMdEk/AJlAqYrjiQ8
         6jDQnAcw825tkqEUj86AXfmUd0Dsyy/2Rk3lwW7mU2MScIlyCZWIgKIVGcDdsPzHZm7t
         OSm/iU2XzZ1ybglxDX8suf7Ca+Bflp3AXl/zsrAvARZe9fiLG18SKamqYETOfqjT9zFZ
         6IgLm1po1z5ZHP0m8YyAarCd9sS6Iqkw9w9CbkWMXghPeQfBU5m5asAtRxTz1uZp71I7
         Urn3uqBJUL/8XBHtZutakAPLqabPakTML25wZ8uf4mvh/+ez//W0s0zJ5VllP2Yls723
         aDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEd63VkcdB1NsGmp6u1XxlrgxZv1boF1F6ofZVnsAx4=;
        b=CYoueK5svm5W9hTsZcuNpkbou0GiH6xFUYNIO3/u/jTP0BjTSwfR87aS+YyNREPVl+
         +MpYZRjhCO0831mfGGOcEu+Pjkvcz0g4yCqsf+2zMfZ1gG0xweejuxA8TL7H9Xsifc56
         SNDGI/Q8cFc7vPE10kBzs4oCuAuUkqxsmfeYuoiUImb0VbYQLhA6aQYWLh1GoLJk7bqn
         938N8tw0SiW+Msh1NeU23+2bb8JKeXPhJR2G1INrRm2SgmNNjsnNhaWMXulOtf5BUpQw
         95QFS3RNbZX8AqDUHi7+E8TVlNIe7ySjZDxCMB6hCm78Af9WosebzBWVGJZpcKt8msRS
         yzaw==
X-Gm-Message-State: ACrzQf0c0Xjtk012qLM2cbOiRLobHvvL8DL54f/d32xCGT5LB/KA29YF
	1mOr/K0FoKJ5Qvj08ep/poWlOOBxhdT1vQ==
X-Google-Smtp-Source: AMsMyM6HI/rqwTzlHsKApbQwPIKac0TnBA+k85KqTvvBnsdLq4iX0AyKZmCmNJi5p4UgKkIy8qI9vQ==
X-Received: by 2002:a5d:4846:0:b0:236:64b1:50fe with SMTP id n6-20020a5d4846000000b0023664b150femr17354643wrs.672.1666875783732;
        Thu, 27 Oct 2022 06:03:03 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c500700b003b47ff307e1sm1680939wmr.31.2022.10.27.06.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 06:03:03 -0700 (PDT)
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
Subject: [PATCH 8/9] RISC-V: lib: Use named labels in memset
Date: Thu, 27 Oct 2022 15:02:46 +0200
Message-Id: <20221027130247.31634-9-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027130247.31634-1-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_060305_928616_28E86C2B 
X-CRM114-Status: UNSURE (   9.74  )
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

In a coming patch we'll be adding more branch targets. Let's
change the numeric labels to named labels to make it easier
to read and integrate with.

No functional change intended.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/lib/memset.S | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
index e613c5c27998..74e4c7feec00 100644
--- a/arch/riscv/lib/memset.S
+++ b/arch/riscv/lib/memset.S
@@ -13,7 +13,7 @@ WEAK(memset)
 
 	/* Defer to byte-oriented fill for small sizes */
 	sltiu	a3, a2, 16
-	bnez	a3, 4f
+	bnez	a3, .Lfinish
 
 	/*
 	 * Round to nearest XLEN-aligned address
@@ -21,17 +21,18 @@ WEAK(memset)
 	 */
 	addi	a3, t0, SZREG-1
 	andi	a3, a3, ~(SZREG-1)
-	beq	a3, t0, 2f		/* Skip if already aligned */
+	beq	a3, t0, .Ldo_duff	/* Skip if already aligned */
 
 	/* Handle initial misalignment */
 	sub	a4, a3, t0
-1:
+.Lmisaligned1:
 	sb	a1, 0(t0)
 	addi	t0, t0, 1
-	bltu	t0, a3, 1b
+	bltu	t0, a3, .Lmisaligned1
 	sub	a2, a2, a4		/* Update count */
 
-2: /* Duff's device with 32 XLEN stores per iteration */
+.Ldo_duff:
+	/* Duff's device with 32 XLEN stores per iteration */
 	/* Broadcast value into all bytes */
 	andi	a1, a1, 0xff
 	slli	a3, a1, 8
@@ -48,7 +49,7 @@ WEAK(memset)
 	add	a3, t0, a4
 
 	andi	a4, a4, 31*SZREG	/* Calculate remainder */
-	beqz	a4, 3f			/* Shortcut if no remainder */
+	beqz	a4, .Lduff_loop		/* Shortcut if no remainder */
 	neg	a4, a4
 	addi	a4, a4, 32*SZREG	/* Calculate initial offset */
 
@@ -57,13 +58,13 @@ WEAK(memset)
 
 	/* Jump into loop body */
 	/* Assumes 32-bit instruction lengths */
-	la	a5, 3f
+	la	a5, .Lduff_loop
 #ifdef CONFIG_64BIT
 	srli	a4, a4, 1
 #endif
 	add	a5, a5, a4
 	jr	a5
-3:
+.Lduff_loop:
 	REG_S	a1,        0(t0)
 	REG_S	a1,    SZREG(t0)
 	REG_S	a1,  2*SZREG(t0)
@@ -98,17 +99,17 @@ WEAK(memset)
 	REG_S	a1, 31*SZREG(t0)
 
 	addi	t0, t0, 32*SZREG
-	bltu	t0, a3, 3b
+	bltu	t0, a3, .Lduff_loop
 	andi	a2, a2, SZREG-1		/* Update count */
 
-4:
+.Lfinish:
 	/* Handle trailing misalignment */
-	beqz	a2, 6f
+	beqz	a2, .Ldone
 	add	a3, t0, a2
-5:
+.Lmisaligned2:
 	sb	a1, 0(t0)
 	addi	t0, t0, 1
-	bltu	t0, a3, 5b
-6:
+	bltu	t0, a3, .Lmisaligned2
+.Ldone:
 	ret
 END(__memset)
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
