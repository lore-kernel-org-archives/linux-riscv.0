Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A88FA3740
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BM8gj54MGJiXOZXK/xALQkMaDvbP39x51d7x6ZE5hUY=; b=Q4htywdsb0Ngxj
	aHxmDV90gWySVMSYvTW/P4YIlIfS7OmTIdblSybRJ8MWL2jvksKRp+mVteDdzSuftk/Ps3+Mpx8pE
	HSL1BMnarijOPRzkgPDD3ItMWx7PZKiSuszIGYszN236eRZ/AsMnEWqBnRNCTq+UwfHk/l6N2iLhb
	VEEcz+V4ClIPXXt5JGmLMz+0PDbPDrudoYCNjRLK/vUjAtaj3wugHMU4ZdhUTs+TO9i3AF5Z3Ws+U
	23b9Ux6Y+EPhAOPVxma1AmitgBp1HI4xDvjVOMO/1yoLayVJQbee6l1jehqTs3CAIVuYeEOiODQkc
	aakQWIN+fS5ugFVASngQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2Yu-00DJsZ-WA; Thu, 27 Oct 2022 13:04:45 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2XI-00DJ6R-7O
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 13:03:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id i5-20020a1c3b05000000b003cf47dcd316so4132312wma.4
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 06:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHol30iu44SieCnbzpUR445EegurXqWLLkR68727Pz8=;
        b=P4Rmb/aKJYj4I/dJnJ+97nCWi9d28PM7o71dsxYkuzKu45hoqGPh2TDljqlRkhHUOe
         eoqfUBSiHKDa2fh6aKUO5Jo9KVQE9wn2uxaeYgjJTdif9mwFofsWzA10kLeJuYV15sda
         ylkejUDWZGgSY83tARiRxdsn77nZZyip6rBdGNjINjrYH+l7v03NcSIztLut4O+lQ+B0
         8GxNMRxzmxEUUgNRQgvB1YGgcbesRtHgD9UMzacQ2PjC9Dc+vwen0jrcKEOf86m/gESZ
         nPtgBXmV38IgA0i92RM69CNVwapwjPQkS2Opn0UjaFzyqtZzS6HJvj7hULsZ6HdMRNO+
         cQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHol30iu44SieCnbzpUR445EegurXqWLLkR68727Pz8=;
        b=NXBkm+YIm4SljjrsbCwowBHCkS7Qxkap25fMm0O6YioqpKNpVO83AKdliDdwbmBWnZ
         XP1KhFkr8eBvxdV0g4lwwGeY/btQSpEVJZRmEwczNNAGZ6AQkZupP97+fp1TRnaBWNyO
         Up9hnBNUOOXToEZMK0O+gJNDdMoVuoz4BMwGL0HFPH9Azr0sPyzQyuq/9XxOBJXWX6w3
         GADEe8en8kTgJSWDcP7K8FEDVMx6xCzl0JPH9qxS0/A9qhBrHNwmnGsk2O2Ulm2Bq2Pq
         p5uMImMsWdmPPqfM0ZkerjgP68vug048/cb35PS4ACIGV+WEEU5rcV1fa0+jWYtujX5l
         Qu+Q==
X-Gm-Message-State: ACrzQf1vVZ6mXN3maPAJdZstndXBqAnsBPflrjNbg7T1tUlb84WcO0t2
	MXk6XevMB8MBorefSeUlEYK9wt0qSPb+Vw==
X-Google-Smtp-Source: AMsMyM5oTmv9IrhDQSVkJF02JpfmYS7iTDg1CKhw9ywqtCc3quIDdLwe0QXTE/CT4hcoU7ucDP6QJg==
X-Received: by 2002:a05:600c:468a:b0:3c6:f84a:1fae with SMTP id p10-20020a05600c468a00b003c6f84a1faemr5697142wmo.148.1666875782181;
        Thu, 27 Oct 2022 06:03:02 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id k18-20020adff5d2000000b002366f300e57sm1127522wrp.23.2022.10.27.06.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 06:03:01 -0700 (PDT)
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
Subject: [PATCH 7/9] RISC-V: lib: Improve memset assembler formatting
Date: Thu, 27 Oct 2022 15:02:45 +0200
Message-Id: <20221027130247.31634-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027130247.31634-1-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_060304_347951_0B75EA6C 
X-CRM114-Status: GOOD (  12.20  )
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

Aligning the first operand of each instructions with a tab is a
typical style which improves readability. Apply it to memset.S.
While there, we also make a small grammar change to a comment.

No functional change intended.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/lib/memset.S | 143 ++++++++++++++++++++--------------------
 1 file changed, 72 insertions(+), 71 deletions(-)

diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
index 34c5360c6705..e613c5c27998 100644
--- a/arch/riscv/lib/memset.S
+++ b/arch/riscv/lib/memset.S
@@ -3,111 +3,112 @@
  * Copyright (C) 2013 Regents of the University of California
  */
 
-
 #include <linux/linkage.h>
 #include <asm/asm.h>
 
 /* void *memset(void *, int, size_t) */
 ENTRY(__memset)
 WEAK(memset)
-	move t0, a0  /* Preserve return value */
+	move	t0, a0			/* Preserve return value */
 
 	/* Defer to byte-oriented fill for small sizes */
-	sltiu a3, a2, 16
-	bnez a3, 4f
+	sltiu	a3, a2, 16
+	bnez	a3, 4f
 
 	/*
 	 * Round to nearest XLEN-aligned address
-	 * greater than or equal to start address
+	 * greater than or equal to the start address.
 	 */
-	addi a3, t0, SZREG-1
-	andi a3, a3, ~(SZREG-1)
-	beq a3, t0, 2f  /* Skip if already aligned */
+	addi	a3, t0, SZREG-1
+	andi	a3, a3, ~(SZREG-1)
+	beq	a3, t0, 2f		/* Skip if already aligned */
+
 	/* Handle initial misalignment */
-	sub a4, a3, t0
+	sub	a4, a3, t0
 1:
-	sb a1, 0(t0)
-	addi t0, t0, 1
-	bltu t0, a3, 1b
-	sub a2, a2, a4  /* Update count */
+	sb	a1, 0(t0)
+	addi	t0, t0, 1
+	bltu	t0, a3, 1b
+	sub	a2, a2, a4		/* Update count */
 
 2: /* Duff's device with 32 XLEN stores per iteration */
 	/* Broadcast value into all bytes */
-	andi a1, a1, 0xff
-	slli a3, a1, 8
-	or a1, a3, a1
-	slli a3, a1, 16
-	or a1, a3, a1
+	andi	a1, a1, 0xff
+	slli	a3, a1, 8
+	or	a1, a3, a1
+	slli	a3, a1, 16
+	or	a1, a3, a1
 #ifdef CONFIG_64BIT
-	slli a3, a1, 32
-	or a1, a3, a1
+	slli	a3, a1, 32
+	or	a1, a3, a1
 #endif
 
 	/* Calculate end address */
-	andi a4, a2, ~(SZREG-1)
-	add a3, t0, a4
+	andi	a4, a2, ~(SZREG-1)
+	add	a3, t0, a4
 
-	andi a4, a4, 31*SZREG  /* Calculate remainder */
-	beqz a4, 3f            /* Shortcut if no remainder */
-	neg a4, a4
-	addi a4, a4, 32*SZREG  /* Calculate initial offset */
+	andi	a4, a4, 31*SZREG	/* Calculate remainder */
+	beqz	a4, 3f			/* Shortcut if no remainder */
+	neg	a4, a4
+	addi	a4, a4, 32*SZREG	/* Calculate initial offset */
 
 	/* Adjust start address with offset */
-	sub t0, t0, a4
+	sub	t0, t0, a4
 
 	/* Jump into loop body */
 	/* Assumes 32-bit instruction lengths */
-	la a5, 3f
+	la	a5, 3f
 #ifdef CONFIG_64BIT
-	srli a4, a4, 1
+	srli	a4, a4, 1
 #endif
-	add a5, a5, a4
-	jr a5
+	add	a5, a5, a4
+	jr	a5
 3:
-	REG_S a1,        0(t0)
-	REG_S a1,    SZREG(t0)
-	REG_S a1,  2*SZREG(t0)
-	REG_S a1,  3*SZREG(t0)
-	REG_S a1,  4*SZREG(t0)
-	REG_S a1,  5*SZREG(t0)
-	REG_S a1,  6*SZREG(t0)
-	REG_S a1,  7*SZREG(t0)
-	REG_S a1,  8*SZREG(t0)
-	REG_S a1,  9*SZREG(t0)
-	REG_S a1, 10*SZREG(t0)
-	REG_S a1, 11*SZREG(t0)
-	REG_S a1, 12*SZREG(t0)
-	REG_S a1, 13*SZREG(t0)
-	REG_S a1, 14*SZREG(t0)
-	REG_S a1, 15*SZREG(t0)
-	REG_S a1, 16*SZREG(t0)
-	REG_S a1, 17*SZREG(t0)
-	REG_S a1, 18*SZREG(t0)
-	REG_S a1, 19*SZREG(t0)
-	REG_S a1, 20*SZREG(t0)
-	REG_S a1, 21*SZREG(t0)
-	REG_S a1, 22*SZREG(t0)
-	REG_S a1, 23*SZREG(t0)
-	REG_S a1, 24*SZREG(t0)
-	REG_S a1, 25*SZREG(t0)
-	REG_S a1, 26*SZREG(t0)
-	REG_S a1, 27*SZREG(t0)
-	REG_S a1, 28*SZREG(t0)
-	REG_S a1, 29*SZREG(t0)
-	REG_S a1, 30*SZREG(t0)
-	REG_S a1, 31*SZREG(t0)
-	addi t0, t0, 32*SZREG
-	bltu t0, a3, 3b
-	andi a2, a2, SZREG-1  /* Update count */
+	REG_S	a1,        0(t0)
+	REG_S	a1,    SZREG(t0)
+	REG_S	a1,  2*SZREG(t0)
+	REG_S	a1,  3*SZREG(t0)
+	REG_S	a1,  4*SZREG(t0)
+	REG_S	a1,  5*SZREG(t0)
+	REG_S	a1,  6*SZREG(t0)
+	REG_S	a1,  7*SZREG(t0)
+	REG_S	a1,  8*SZREG(t0)
+	REG_S	a1,  9*SZREG(t0)
+	REG_S	a1, 10*SZREG(t0)
+	REG_S	a1, 11*SZREG(t0)
+	REG_S	a1, 12*SZREG(t0)
+	REG_S	a1, 13*SZREG(t0)
+	REG_S	a1, 14*SZREG(t0)
+	REG_S	a1, 15*SZREG(t0)
+	REG_S	a1, 16*SZREG(t0)
+	REG_S	a1, 17*SZREG(t0)
+	REG_S	a1, 18*SZREG(t0)
+	REG_S	a1, 19*SZREG(t0)
+	REG_S	a1, 20*SZREG(t0)
+	REG_S	a1, 21*SZREG(t0)
+	REG_S	a1, 22*SZREG(t0)
+	REG_S	a1, 23*SZREG(t0)
+	REG_S	a1, 24*SZREG(t0)
+	REG_S	a1, 25*SZREG(t0)
+	REG_S	a1, 26*SZREG(t0)
+	REG_S	a1, 27*SZREG(t0)
+	REG_S	a1, 28*SZREG(t0)
+	REG_S	a1, 29*SZREG(t0)
+	REG_S	a1, 30*SZREG(t0)
+	REG_S	a1, 31*SZREG(t0)
+
+	addi	t0, t0, 32*SZREG
+	bltu	t0, a3, 3b
+	andi	a2, a2, SZREG-1		/* Update count */
 
 4:
 	/* Handle trailing misalignment */
-	beqz a2, 6f
-	add a3, t0, a2
+	beqz	a2, 6f
+	add	a3, t0, a2
 5:
-	sb a1, 0(t0)
-	addi t0, t0, 1
-	bltu t0, a3, 5b
+	sb	a1, 0(t0)
+	addi	t0, t0, 1
+	bltu	t0, a3, 5b
 6:
 	ret
 END(__memset)
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
