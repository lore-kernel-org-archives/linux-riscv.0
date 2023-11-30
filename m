Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5589C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 19:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDxs/YXgHA6vQutyiQFXbTIZMKaif34VQdb1oM8Suu4=; b=cQ1XX5KrHEhyeB
	xN7SU4Cggd4aHKQc/ptH0d7KqRWgvwCKKDXihlCzdTTx0hCAI1L4GqSa2jza67VtciQAj0YG85YeC
	Chrb+W7HfcEYoOW+4tbECWIW4psrefE6ZyLlwpZ66u+LGQt5xcZ5dx/ZplGl4m5UvtWBzuPMn2y7h
	loo3WXrSTnMJcG2jcXRu2tN5yyquLO5od4Smta7pPidoYQmOdntC6bn+2hPJTraBQ2ey4iyghs2AE
	sDJM+8DbsRTCEwvRlx25lA2kTWGL7yPDGT4+n2RJg0uCJ/bH75P9Lbe7nY0cctRVvBZ/iVcz/OrTG
	TLp/qFmn5GFSQPw6Wf9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8mqZ-00Bkrx-1X;
	Thu, 30 Nov 2023 19:37:15 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8mqW-00Bkq1-0O
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 19:37:13 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50abb83866bso1906377e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 11:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701373007; x=1701977807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQI/Uuj8S1lbOuX/QagNJrWvhr7cmuDjXxUaREWHLvQ=;
        b=ae/IVfMabTYuDPP7Ax1b3rEftDM7wnFD4JhQ0OgfNsdpahinNH+UlcN3y8iUYj/yF2
         zj0OPLo+LnF3HVE9hlXVStvaKmp6wRRUi2ECsvayojxHgRFM7SaZA6053Goh0Tiw7hzf
         5gRgKq5iBpgVVfW98IbVbeNrfi89aMQQ83xmubKkqaMriRHtkKMGLvBqR0//xqst32XE
         GC4AiYEzjNcHEAztjGLJa7XtpTVI1jY/35nK9yD6o9guy/krZs3spIcw9RTJB1BY+T2d
         A5QngXZQiemSDD8sfp2wy0CF4oLMOLdGnceYpa6s8r8whKvAhqePjzIkjtOB8ElWSZ8X
         wWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701373007; x=1701977807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQI/Uuj8S1lbOuX/QagNJrWvhr7cmuDjXxUaREWHLvQ=;
        b=Zxm4CreVV06Qt6qIVIT3DQG8ks0ZAX99kEBp45oT0hsrhTKb2hZcYB0DYGqC8Ey8uM
         Au+ybbEXjMxlZ0cqj2HAbX37vv+h0U4sghISpyMva4B3p3mM5atEOATb17e2PVDqvQQD
         Q90deTTHtpLIO66a8+SDmDpNTUx1J4jBN81/ikBd3FyNsJsH5QZs7+qAhxS1uODXiEt3
         23qtZmolrMOu89cvZ9rdvHiu1T+JUXxS9gOuEyu5gQIATWTaM+WtbiyfS6ynkhcwcCB5
         G+v3LsafdBIKGmru5xU3RflqdP98v0C2tJ6iFBb3zmKFLLY9fyOzHSON8u4kwrXLAiUS
         5d4g==
X-Gm-Message-State: AOJu0YyKuylyvm15sxcRPoq+JYKklssJSTbeANys5u4wB1ObxpUs/X6a
	Is5He1k59r/hVsIxIXl1+Fj1Yp3C1d3pcO78dbo=
X-Google-Smtp-Source: AGHT+IEM1/rimhJ0MgmeE3IH9UzU8B2IkCcpOHDOun3NMJbLtLz98y1nNGYvsO+xdY4boCSbq65q4w==
X-Received: by 2002:a17:906:2a4a:b0:a11:d380:7d with SMTP id k10-20020a1709062a4a00b00a11d380007dmr1782eje.45.1701369341940;
        Thu, 30 Nov 2023 10:35:41 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id gg6-20020a170906e28600b00a1848bc033csm958407ejb.128.2023.11.30.10.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 10:35:41 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	haibo1.xu@intel.com
Subject: [PATCH 1/6] RISC-V: KVM: Don't add SBI multi regs in get-reg-list
Date: Thu, 30 Nov 2023 19:35:39 +0100
Message-ID: <20231130183537.55203-9-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130183537.55203-8-ajones@ventanamicro.com>
References: <20231130183537.55203-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_113712_162518_C2F27CC5 
X-CRM114-Status: GOOD (  11.43  )
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

The multi regs are derived from the single registers. Only list the
single registers in get-reg-list. This also makes the SBI extension
register listing consistent with the ISA extension register listing.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 36 ++----------------------------------
 1 file changed, 2 insertions(+), 34 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index ba18587ae8c7..0ec265a107b5 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -987,20 +987,12 @@ static inline unsigned long num_isa_ext_regs(const struct kvm_vcpu *vcpu)
 
 static inline unsigned long num_sbi_ext_regs(void)
 {
-	/*
-	 * number of KVM_REG_RISCV_SBI_SINGLE +
-	 * 2 x (number of KVM_REG_RISCV_SBI_MULTI)
-	 */
-	return KVM_RISCV_SBI_EXT_MAX + 2*(KVM_REG_RISCV_SBI_MULTI_REG_LAST+1);
+	return KVM_RISCV_SBI_EXT_MAX;
 }
 
 static int copy_sbi_ext_reg_indices(u64 __user *uindices)
 {
-	int n;
-
-	/* copy KVM_REG_RISCV_SBI_SINGLE */
-	n = KVM_RISCV_SBI_EXT_MAX;
-	for (int i = 0; i < n; i++) {
+	for (int i = 0; i < KVM_RISCV_SBI_EXT_MAX; i++) {
 		u64 size = IS_ENABLED(CONFIG_32BIT) ?
 			   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
 		u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_SBI_EXT |
@@ -1013,30 +1005,6 @@ static int copy_sbi_ext_reg_indices(u64 __user *uindices)
 		}
 	}
 
-	/* copy KVM_REG_RISCV_SBI_MULTI */
-	n = KVM_REG_RISCV_SBI_MULTI_REG_LAST + 1;
-	for (int i = 0; i < n; i++) {
-		u64 size = IS_ENABLED(CONFIG_32BIT) ?
-			   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
-		u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_SBI_EXT |
-			  KVM_REG_RISCV_SBI_MULTI_EN | i;
-
-		if (uindices) {
-			if (put_user(reg, uindices))
-				return -EFAULT;
-			uindices++;
-		}
-
-		reg = KVM_REG_RISCV | size | KVM_REG_RISCV_SBI_EXT |
-			  KVM_REG_RISCV_SBI_MULTI_DIS | i;
-
-		if (uindices) {
-			if (put_user(reg, uindices))
-				return -EFAULT;
-			uindices++;
-		}
-	}
-
 	return num_sbi_ext_regs();
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
