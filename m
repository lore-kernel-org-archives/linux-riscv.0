Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810A2C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 17:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZxnsBFOd353Jn07HCulwm+/vRCiBY6UdKdRxUZ+DELY=; b=LgY7SXZF4fo9uf
	4hJeFlS/+jLY2kGb8tWKC65wkRQQkC2x7wEFN1e4u6w2AKTvFCVC8EZwtQczDYHwgnMLUxlxHY2hj
	pN0RP0GVrx4ro9xmftZ37XDt75BLdaH9BpTbnmeyEzRdzJ5Lq/pqaxzqZBRfEkgCytCbyeRZmL1zt
	lsOFIjWsEgMdveNGSdaqOkw3UYvn1hge58M0dyv6S9e/qh/go2qtSdc4zwJP7ThKsYIYFH0X6PloV
	rOM7ZhDX+lDpuky9aO2rTAYJlI4N/Al/AQBPK75pxz6xd/Z3KWf0IqNNY9otPCIQ+LKPACx9SGVg4
	Y1tWhVWesjXpj0mCM5KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSkE-00FY0b-0d;
	Wed, 13 Dec 2023 17:10:02 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSk9-00FXwl-1k
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 17:09:59 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40c2a444311so69525325e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 09:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702487394; x=1703092194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9Njs7+cHDVJgSaOfLR/cygj/GxQjuNzthDMWpioAb4=;
        b=Dk2VEJJQ41VDIgJpPm7DWegsfe19a08LFiaURIrk4OQsUZnf7rpW4IzUuP+obdTxp7
         iX3YhhQMDNTRkWqB/KpO2hffo8q4M6Ng6Rpht7KLOboUT6ViFEhg4xNXfx/8o3fULl4e
         4vG+NBktSa7C1y4ADAZ24zDgE5StObBe60teJz/tR932yeQzeUKmGZ7OZ9qYi+N92aSI
         UCPjJsJqAkpcc9nwuqb7JZcy6Ez1i93nivDHgqZO66B56nh7XtHzvV9seWQ5ymkl9PqQ
         IGrFAfUdW8S/2IrX/ghY56rcDSAhh0vOy/o5zZuWGoUoDHF5Ibxc3OJLqidHfGBJMMMf
         1l3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702487394; x=1703092194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9Njs7+cHDVJgSaOfLR/cygj/GxQjuNzthDMWpioAb4=;
        b=lpkwbwITKfuMxoZGrhuT7+0fNp0CR+mHDtmsG9EAsW05RnDfeYoYRXyfxxWumdf+RT
         O0e6+1ET/uE6KK04AnmWSdTT0YeaTTEXprijdoeQs9bgKOBUZuE8Ddd02h6SMNtSZDdv
         cky/Ov1t5XCF5hpfqmQ1l7B5aNVDq7Ocr5Pfrk6NTMvryvr4N6kX4jAZQXwPDw9iHmSv
         5s5BERfrht6WMFiiLu+XG30zyyhQxgd5EOu4WSqXRPa5JNEVjTlsRbuZ2HV5VM/XIzcL
         6ztsS5c9y2UVAIMEfjAEqNNhnTZyQfwKAvOxcDT9sfsfEryziGC4S3SNNtd5QA1lNueI
         syXA==
X-Gm-Message-State: AOJu0YylZERNJE2vsRPPzHM/Zk2S1yYXMjpFZ5eFa9QZ3UJ26FuE+GBp
	kP8dBlEYAh2avGWNnGZy17V0DzSrVZOsXs6zEDI=
X-Google-Smtp-Source: AGHT+IHsKPQ8QJ5OVDQttR01O/jO2wou+2k2ANOGuWTrqCa2BVKvARPn1wgw/WvDidkSEw9jyinrHw==
X-Received: by 2002:a05:600c:4591:b0:40c:25f7:8da5 with SMTP id r17-20020a05600c459100b0040c25f78da5mr2134591wmo.264.1702487394313;
        Wed, 13 Dec 2023 09:09:54 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id b16-20020a05600c4e1000b0040c310abc4bsm21560863wmq.43.2023.12.13.09.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 09:09:54 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	haibo1.xu@intel.com
Subject: [PATCH v2 1/6] RISC-V: KVM: Don't add SBI multi regs in get-reg-list
Date: Wed, 13 Dec 2023 18:09:53 +0100
Message-ID: <20231213170951.93453-9-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213170951.93453-8-ajones@ventanamicro.com>
References: <20231213170951.93453-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_090957_591220_6AF3ABB0 
X-CRM114-Status: GOOD (  10.72  )
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
Reviewed-by: Haibo Xu <haibo1.xu@intel.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 36 ++----------------------------------
 1 file changed, 2 insertions(+), 34 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index f8c9fa0c03c5..f9bfa8a5db21 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -933,20 +933,12 @@ static inline unsigned long num_isa_ext_regs(const struct kvm_vcpu *vcpu)
 
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
@@ -959,30 +951,6 @@ static int copy_sbi_ext_reg_indices(u64 __user *uindices)
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
