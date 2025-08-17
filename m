Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B61CA0EDC
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Aug 2025 12:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSRLJDTFnrf3Oow7BcMwuF9eRQ3mHhFBe3bdmEpTjHE=; b=x82W0RFXH3X3p/
	oL1GZxybf+5Foy0ec9HRQu/e8ui72MlG6OdqhUxn6C6XcNYHip/nGhQUaIOsVYU6aa4n6rLy28Byt
	XrRFfUd406apDek79466xov/OLTG6So7W2SdLtttHiwLiqey4skMvQKTt4IzlXWc4JzLCanklZbUc
	e+r/D/PfyfH1J3ZJMhYgXjFuvzwGY+vpFwoSJStat0PVfLbDSIM9ndADhdR4OEBu/LRxGcj4XC2D5
	CRarNyrIwuXrapD+Nk5CAizRYjRV/CgwSpqeEJzvtSue+LG0yHG/DlWblqUhIgLg73yAHTzm4bAEk
	dPViz2UHkB53rn7N6GKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uncaK-00000005f90-2eY3;
	Sun, 17 Aug 2025 12:34:04 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uncaI-00000005f6t-02m8
	for linux-riscv@lists.infradead.org;
	Sun, 17 Aug 2025 12:34:03 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-32326bd4f4dso2916479a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 05:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755434041; x=1756038841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNhy8e+wcu2xj9coMjyL72gmYgwxBYToiGY6Az0bjY8=;
        b=eroSETpiSCEBPFxrSpFUizMkkAzCUojL++VPKUBRB2qz8OgEpaArmkgWxeds/N4m2P
         yrvjJWmxVOZBDLqGitB+GZ1AK4vZUQyVUFHesdkTVK/82/DUjSFU+c/QbbgTdJzGn+BG
         h/mj6N2wm4vUfGpcteSv60KFebvAFYymDTH7bIh3OPT2hh+DLNIlhOuHbS+amvVbpq/V
         dUCt5SGNHyIa7Z3MK1m4LkaWPOhvvxBFUBYTikAqiX9dJc0wlLFohsWIzUjIfqOhC4H+
         J5RMp4lRYN0nWzVtDkpyFSGXOgiw0Y+wfIOZ++B0d9+goiZTVRZMoWvNphiGhhCnhTr3
         zS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755434041; x=1756038841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNhy8e+wcu2xj9coMjyL72gmYgwxBYToiGY6Az0bjY8=;
        b=kH+mvKHQZHTWzzSWMGUx10ufsmQzBd1O5x8R1jKC4iQGdOIGPOWmZRGoHAQD4+EK37
         tELw2yuodImu+S4op0l98fXVKG+QazPmkwaR2+NX7dNtliNftKdnkVhR/m0aYP5jwAqO
         oon338q3kdyFU2EL7hg7Be+C4kLf1fm272kTz2gMXikJO0jo62PZQykRu1FqdDTAEJgt
         aj82hkB09tZLhIzlyz5YrvvCzK1KANNZ9pWKvKwFZkJSiyvwr1eR9ZndUzff1nZvStQk
         V71uAcpQTBKsOdD+ZQO3DtJ+U5xpXgj+FIv7+OYrA5K7pWKr7+qq1pvbqSxMpyMlL3g8
         5vkg==
X-Forwarded-Encrypted: i=1; AJvYcCXw0FdJO/cXFRcNpqlj77QX0Tpxy6PcO410vQfx4NfdqSqyI2KRXQlVsVQBCOu6gUHV1GJaMvPBwRV0Xg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzFVv7sW3JtMciU0DXH73IWqFCDbUqdKg/l4E2dIALUKP/a16e
	HrYjSbphV04hUsvndXEncXVZYOYijRKGXLfGjF1isaidkEiM/SlYzakgBAeaa7PwJoDfwPrW4MB
	+p3fN
X-Gm-Gg: ASbGnctLGzBdxWMAsgqe+C+FsxMh0dYOrxEUwnuYy7CKBYDXrPN57iJJksF0X2o87/a
	qXnGpOAQc5XnKsXMMqvEz7m7vPeAp6iYjC7LRlML74CJy3m9WT0+bUPJf4auzRbLFecl1RvphKu
	YaLAQsgtLiUKVkL34qofB/TP8rL33B7zLiB8Hygl+qSVk9NLel2Yyn4MU/H6RXsiL2oGlfkHGJ2
	YRG0CxTj1glKtsijm2u07YZO5G3cckeOP7KgDCwdbxLsBQyy1zgmLGTUAZ2rl46LL5sV/qjCLLC
	EBMm9B4+PNgZiOPfHbj8TQXmwrXrjJQrxhllYtgywL3VK2Jb0I7C1NWwHPbqzkxNh0uxRvajcKc
	iAtQBRvMGPDkNHdOEYu4A8KxJ9Lc/CRFQQBnegnYgBcI2Q9bfSj2Z6j4=
X-Google-Smtp-Source: AGHT+IHh37iRS02dzFD7p73eZSbpQiOlqNZO1JoyVWCj6beSgZrt2b8qgavkosgeWIhzOEcfJ80ZCA==
X-Received: by 2002:a17:90b:3b4d:b0:321:1348:4438 with SMTP id 98e67ed59e1d1-323296d963bmr17136225a91.7.1755434041279;
        Sun, 17 Aug 2025 05:34:01 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3232b291449sm4480912a91.0.2025.08.17.05.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 05:34:00 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 4/6] RISC-V: KVM: Move copy_sbi_ext_reg_indices() to SBI implementation
Date: Sun, 17 Aug 2025 18:03:22 +0530
Message-ID: <20250817123324.239423-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250817123324.239423-1-apatel@ventanamicro.com>
References: <20250817123324.239423-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_053402_050791_A6D65C68 
X-CRM114-Status: GOOD (  13.68  )
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

The ONE_REG handling of SBI extension enable/disable registers and
SBI extension state registers is already under SBI implementation.
On similar lines, let's move copy_sbi_ext_reg_indices() under SBI
implementation.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  2 +-
 arch/riscv/kvm/vcpu_onereg.c          | 29 ++-------------------------
 arch/riscv/kvm/vcpu_sbi.c             | 27 ++++++++++++++++++++++++-
 3 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 8970cc7530c4..d75ca45c0152 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -77,6 +77,7 @@ void kvm_riscv_vcpu_sbi_request_reset(struct kvm_vcpu *vcpu,
 				      unsigned long pc, unsigned long a1);
 void kvm_riscv_vcpu_sbi_load_reset_state(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
+int kvm_riscv_vcpu_reg_indices_sbi_ext(struct kvm_vcpu *vcpu, u64 __user *uindices);
 int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
 				   const struct kvm_one_reg *reg);
 int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
@@ -86,7 +87,6 @@ int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu, const struct kvm_one_reg *
 int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg);
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 				struct kvm_vcpu *vcpu, unsigned long extid);
-bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
 int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
 void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 5843b0519224..0894ab517525 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -1060,34 +1060,9 @@ static inline unsigned long num_isa_ext_regs(const struct kvm_vcpu *vcpu)
 	return copy_isa_ext_reg_indices(vcpu, NULL);
 }
 
-static int copy_sbi_ext_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
-{
-	unsigned int n = 0;
-
-	for (int i = 0; i < KVM_RISCV_SBI_EXT_MAX; i++) {
-		u64 size = IS_ENABLED(CONFIG_32BIT) ?
-			   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
-		u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_SBI_EXT |
-			  KVM_REG_RISCV_SBI_SINGLE | i;
-
-		if (!riscv_vcpu_supports_sbi_ext(vcpu, i))
-			continue;
-
-		if (uindices) {
-			if (put_user(reg, uindices))
-				return -EFAULT;
-			uindices++;
-		}
-
-		n++;
-	}
-
-	return n;
-}
-
 static unsigned long num_sbi_ext_regs(struct kvm_vcpu *vcpu)
 {
-	return copy_sbi_ext_reg_indices(vcpu, NULL);
+	return kvm_riscv_vcpu_reg_indices_sbi_ext(vcpu, NULL);
 }
 
 static inline unsigned long num_sbi_regs(struct kvm_vcpu *vcpu)
@@ -1215,7 +1190,7 @@ int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
 		return ret;
 	uindices += ret;
 
-	ret = copy_sbi_ext_reg_indices(vcpu, uindices);
+	ret = kvm_riscv_vcpu_reg_indices_sbi_ext(vcpu, uindices);
 	if (ret < 0)
 		return ret;
 	uindices += ret;
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 04903e5012d6..1b13623380e1 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -110,7 +110,7 @@ riscv_vcpu_get_sbi_ext(struct kvm_vcpu *vcpu, unsigned long idx)
 	return sext;
 }
 
-bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx)
+static bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx)
 {
 	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
 	const struct kvm_riscv_sbi_extension_entry *sext;
@@ -288,6 +288,31 @@ static int riscv_vcpu_get_sbi_ext_multi(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+int kvm_riscv_vcpu_reg_indices_sbi_ext(struct kvm_vcpu *vcpu, u64 __user *uindices)
+{
+	unsigned int n = 0;
+
+	for (int i = 0; i < KVM_RISCV_SBI_EXT_MAX; i++) {
+		u64 size = IS_ENABLED(CONFIG_32BIT) ?
+			   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
+		u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_SBI_EXT |
+			  KVM_REG_RISCV_SBI_SINGLE | i;
+
+		if (!riscv_vcpu_supports_sbi_ext(vcpu, i))
+			continue;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+
+		n++;
+	}
+
+	return n;
+}
+
 int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
 				   const struct kvm_one_reg *reg)
 {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
