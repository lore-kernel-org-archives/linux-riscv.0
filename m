Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A6ECA0FE1
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 16:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XsurN3JZ0AwJHVWWcChanagGCy3NQCpQDUGGV+S74Us=; b=bKrobVN0bsdPR8
	E82vX1MZvSHHHMh1bs5+hEffYagGl8Hz+yYMLq/33NwgqUD+ybotHoEtHX9vhHoQd/qrqlf5eIsQM
	1SnG/xYDlGSnn/DGKP+FiH/oUQYI7sl70KTzUhO8EQWW9pvM8LC9DZrXJD/+iqmmp0LxY4bgGYBC/
	R06ZggjsCjBe4O8enFyix4VUrwP9JOvF0jYCK35x3URUcfdtot0bgjxD9TExNiLAer36AEJYjx/dK
	53dHaSoVcCv9z4CCqDHGjOgwjwJTg9Em5GI3fdcrBo+SkyfskJzlgqqA0NXFTIyGyBSO91BBpDcNc
	ymbWUCQpcOeoGjbEz6cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uprFe-000000052xX-1Ab3;
	Sat, 23 Aug 2025 16:37:58 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqfK-00000004xWO-2b9w
	for linux-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 16:00:27 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-77053017462so80050b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 23 Aug 2025 09:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755964826; x=1756569626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QNTGSl8W9jUKwX1Y5hiHFssIh4zzMlPaIQnsQ0pfko=;
        b=i9DZ6yHyvQAQ68bfENY18MI7lUp93G6BIz/z4/CdsdueXSS9sjzgw2E78pbtdvmDt3
         4ZaiIDwyWz/poI2vS8ftFTD1DBxNSXWkJh1lOKCBMQfLaq2Wx0d5zxWYp71GNoh4bH6o
         z4fQ6wxPsy0WqZ5uS869TzXTEUTxlh1ec9hT5IPdYI+kBcqXAQMmHBmRWhnWzSd/2Vqr
         F9G8WWIsgJX//PHAO5GoIkp66E6JiFvcsdI5A1DPTi8itb0oOsAhjn//8YmRI5VVTFjV
         TkF2SBKDkZOIaUMYGZtMciOzS1j6qCCW2mRLxUfipShR80WODRg2mr5TNFAXTTf2W0bW
         0lAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755964826; x=1756569626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QNTGSl8W9jUKwX1Y5hiHFssIh4zzMlPaIQnsQ0pfko=;
        b=EwFjbgg8hmYIq/7E9lQkRQyQXnmkPiHGtcJdoMh5jh2zHIvMEOamtPL3JbKEsk4JwN
         v2bXMsXGTW4BnfsVhVS2XkDZ+4u0xS3lyF5FgDhsvbwli/JCBcuAXJvsRGavjhN0h/dj
         9q3UUkeWHzQc1ru8y4etsAvLU/nmC5fWMP2Hs7tm2FQ/zM9NQeZc36KXUzncN6Ld1ziI
         7l+9vgMLknS4zaF6mNKJmkYS3HwlSGtJqVWE8J1+qZ6FEr29J6c5I0eANpOlDnZjWEbO
         0Qhv7yvE87kycOH5HTLrOKEuaHnVxcoJp8Zbh3aFNxkio8dvDmFBCpKJSRR2DcGulCak
         ydgg==
X-Forwarded-Encrypted: i=1; AJvYcCWljuKlfPy9eWEjJ0NTAvl7pl0cWjd6M7EkLt/cqBMyqiTN0mZ4XDAziPsEE86SZikP23BdttH52mkr9g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj/HSec5rddpDh3tW1po9+nz+B4kOsQRj3cS3dSWLgg0JA7vLU
	aDAI/V/yJzGTHmO+UQtbmx6kD4oybV/lryV+RGsVQVT3MEE3QzBz4Cqmeea4fFMmctQ=
X-Gm-Gg: ASbGncuELXAl9EjW7JAcxuC4IIqOblt4Bj0b24du35qO/sikcMP8P0ZLB10DAj39XvY
	clwDbxErSixekbFdoWqu+/OGcsY97sanRBSouUjBtu+hXo1tFwRQaIADSTJChzmWVvn0kWoDOJv
	sgRvtIbwUlW0F9144dAblB7gLBPQ9USGQclUcp975nFOQiD9FyUBv3xp2g0fHZv313GBw1QrPx9
	bcuGYDLmWG5CDF8A74MRiA89desyGH7yr2BEVV+a+AoGUMlmzMnuwn3PUquU1p7Gr/70YNOsdsa
	KF41UCYe9SJfJbFKcI30BQ+6f2pkTMYKBqIGM5JtSD3DArIJzCe7QgmTudo3SCw/R4LXmkmSSgf
	RQ3DZtzacJVzm/ptX/eQ2DJq+ZTK8HndsHYanwEIYTYcPkfjD4oC1lLSCrFC31g3m/Rc97vvf
X-Google-Smtp-Source: AGHT+IEo9oLIFiXAIQrZJ7Jw/lL5+vEVJj3YiBwiqokGLrQldRoOB9aEEhSOfywm+FIR5r1fQzfjXg==
X-Received: by 2002:a05:6a00:9288:b0:76b:d67b:2ee0 with SMTP id d2e1a72fcca58-7702f9d7f70mr10308982b3a.6.1755964825622;
        Sat, 23 Aug 2025 09:00:25 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77040214b81sm2804464b3a.93.2025.08.23.09.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 09:00:25 -0700 (PDT)
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
Subject: [PATCH v3 4/6] RISC-V: KVM: Move copy_sbi_ext_reg_indices() to SBI implementation
Date: Sat, 23 Aug 2025 21:29:45 +0530
Message-ID: <20250823155947.1354229-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250823155947.1354229-1-apatel@ventanamicro.com>
References: <20250823155947.1354229-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_090026_660509_7627FC38 
X-CRM114-Status: GOOD (  13.33  )
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
index 0f4e444e5e10..865dae903aa0 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -1082,34 +1082,9 @@ static inline unsigned long num_isa_ext_regs(const struct kvm_vcpu *vcpu)
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
@@ -1237,7 +1212,7 @@ int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
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
