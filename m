Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465F8C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 02:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HW5fwQHkYSjh4duT0bfdXyeBvHhjNXs18RWgNjW2Zv0=; b=t/Nau3BGNmseBj
	DHYBQHqJnASlSMinOsY9iGHSBVxAtr5nNbq7xlzhL9uCApZTY7mWtPvQ+9XxyHSlQErypodPb1P19
	7aMU06VyZhvhyxU+C3bgI2slD4r6c/108QKGjln7SBr2qtqssMTblV6zreDGDcGnETzXks22SK1Rd
	Vv/jH1TXkuCIuVioMuiCphDsKEFPNhXbg/ClHvKMXq1vAT/OlsI5JHxMbDYHFdsD2ssXoCP7BEuFY
	6ZNQcbbWKu4SSCwrIFbIZgSuMTMssD6yaIEQ/QZGY0Vcl2t1RYmTuL33zC9NHF0zglkgr8Tc+ncuV
	pox7nmWnCmqIlVxbtF/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNH-00000000UoE-2nvL;
	Wed, 01 Jul 2026 02:08:27 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekN8-00000000Ujz-0nFy
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 02:08:22 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c969ad04c1dso26033a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 19:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782871697; x=1783476497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xn87s7In+F3eOVUqsrjIa2N2Lz49wpP+uXxKTq7hWQ=;
        b=mReOWGOUxr4M+jmd54R4C6Z6axBCajEJrNAGP2C1n1o12C3ztZmK9NhEajOasZfRr7
         uhxESMUaFTNLbxzv1gHZ9tQ8o3lUveUYKaf9ahcgKKYdoxcK2Z/Fro+HalMU3Rxbz5d3
         BGXMXBVMbVLMEW2MvY19CuY5ePIZbFTCOA97yFdNfSW1mdtSfRX/iXt0HP8AIaPNase3
         YVP7j0ru0NGpSee+Ak9rwbkKOO4kJWyXmWohUYAVN42x7PCWtWWSKB4vyrgk23SH1/mJ
         nGBxmTRzctaOsBXFgZlEKbCOmPNr+pCGtKN2PdYN4sPbaByxUlVrwjBcK4SM8z1yJ/am
         kGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782871697; x=1783476497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1xn87s7In+F3eOVUqsrjIa2N2Lz49wpP+uXxKTq7hWQ=;
        b=gPsPXSfSFAA+yBKPrKrUoD5lL3J2NuCeSlttr/uvmLkXptJwVe2mNGHKMv7qMu8n5+
         62GJE2FGaFaG5sESAF3dSXJb/Omr8VzekHgDt9m2YQBryl86pZrI4Q8n/3FknQWd8qpX
         exA6lt5ToNwEOiuNA4xWx5cwKMhoQRAzjFdoKmCE/ZFvDoLj/jd3gJ6BMPHdwSNZdTJk
         KmEgXLAaARt9D3S6AWrlOi36phcg+a3d6e7n3TWHmMGY+WfEN8WgLrn79QtZqTM6lcir
         HfZPt3LZr5w52FetCvJdN0tzoFmPAZfrZ6hrduABY/z1KV21FrbVb2pJTIw5CNwd8XGO
         z9Gg==
X-Gm-Message-State: AOJu0YyWh6q+enhDLeKyBjDwWqhaMA1THI9bE74sAMCK9WHRFtVd8QrL
	tc2cMOi6YiWpofCrlgB8/0kNef+6LG9xCaQobXzOHFXryyk3nUJqqED0
X-Gm-Gg: AfdE7cnWhMt2q6jP7ToH+JHMBWcegE0XGDKsrZ0rHXnrP9ngrVZCpU9zBAU9qWX+lX3
	xvZpabMtvkExA8+nAhqTP+qeZeCn5KIbScAwR3mSbVPOaH2Z/a52lxGO+7LQoCwB8U/45CLqiUN
	CUZAGWMfUL0cwhAt1xNae5pykDBkU1OJuWohviHbRargBz1FNYCDCa/vKV1/NN6xgJByto6eSYq
	1nCR8JQcP5ie22ZshvAWBvnTWskS+sgOacJSMQBOlP1O9+vFZoHHi5yWj9jPrlXeehlnqjK7nuq
	q6NF+F5VX0rcsU2bWXFVx+Er8DaE6/dYfn+vxv5tw1Iamwj4LUi6sAz4wrrnYbpKuZyD9YVPt+J
	RGFMlm42DyvgkpdwGbHgclE+hzo1C0MhbD7mhv6vn2cUnQOzVvwBhrnmalscxFRrE732wZIL9l9
	alv6x5z4ZueY8=
X-Received: by 2002:a05:6a00:80e:b0:845:eb73:411c with SMTP id d2e1a72fcca58-847adeef6cemr2978992b3a.45.1782871697291;
        Tue, 30 Jun 2026 19:08:17 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479ffff404sm3114718b3a.22.2026.06.30.19.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:08:17 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v4 1/8] RISC-V: KVM: Add support for Svadu FWFT features
Date: Wed,  1 Jul 2026 10:07:38 +0800
Message-ID: <20260701020746.170157-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701020746.170157-1-inochiama@gmail.com>
References: <20260701020746.170157-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_190818_813348_7F13C06F 
X-CRM114-Status: GOOD (  14.15  )
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

Hardware updating of PTE A/D bits is controlled through ADUE bit in
henvcfg Expose the feature only if both Svadu and Svade are supported
for VS-mode.

Allow the VMM to enable/disable this feature by change the ISA
extension state in the guest.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  1 +
 arch/riscv/kvm/vcpu_sbi_fwft.c    | 75 +++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 504e73305343..7bbea8812d92 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -240,6 +240,7 @@ struct kvm_riscv_sbi_fwft_feature {
 struct kvm_riscv_sbi_fwft {
 	struct kvm_riscv_sbi_fwft_feature misaligned_deleg;
 	struct kvm_riscv_sbi_fwft_feature pointer_masking;
+	struct kvm_riscv_sbi_fwft_feature pte_ad_hw_updating;
 };
 
 /* If you need to interpret the index values, here is the key: */
diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index ab39ac464ffd..7192c229a19e 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -94,6 +94,45 @@ static bool kvm_fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
 	return false;
 }
 
+static void kvm_sbi_fwft_env_flag_reset_helper(struct kvm_vcpu *vcpu,
+					       u64 flag)
+{
+	vcpu->arch.cfg.henvcfg &= ~flag;
+}
+
+static long kvm_sbi_fwft_env_flag_set_helper(struct kvm_vcpu *vcpu,
+					     struct kvm_sbi_fwft_config *conf,
+					     bool one_reg_access,
+					     unsigned long value, u64 flag)
+{
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
+
+	if (value == 0)
+		cfg->henvcfg &= ~flag;
+	else if (value == 1)
+		cfg->henvcfg |= flag;
+	else
+		return SBI_ERR_INVALID_PARAM;
+
+	if (!one_reg_access) {
+		csr_write(CSR_HENVCFG, vcpu->arch.cfg.henvcfg);
+		if (IS_ENABLED(CONFIG_32BIT))
+			csr_write(CSR_HENVCFGH, vcpu->arch.cfg.henvcfg >> 32);
+	}
+
+	return SBI_SUCCESS;
+}
+
+static long kvm_sbi_fwft_env_flag_get_helper(struct kvm_vcpu *vcpu,
+					     struct kvm_sbi_fwft_config *conf,
+					     bool one_reg_access,
+					     unsigned long *value, u64 flag)
+{
+	*value = (vcpu->arch.cfg.henvcfg & flag) == flag;
+
+	return SBI_SUCCESS;
+}
+
 static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu *vcpu)
 {
 	return misaligned_traps_can_delegate();
@@ -137,6 +176,33 @@ static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
 	return SBI_SUCCESS;
 }
 
+static bool kvm_sbi_fwft_pte_ad_hw_updating_supported(struct kvm_vcpu *vcpu)
+{
+	return riscv_isa_extension_available(vcpu->arch.isa, SVADU) &&
+		riscv_isa_extension_available(vcpu->arch.isa, SVADE);
+}
+
+static void kvm_sbi_fwft_reset_pte_ad_hw_updating(struct kvm_vcpu *vcpu)
+{
+	kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_ADUE);
+}
+
+static long kvm_sbi_fwft_set_pte_ad_hw_updating(struct kvm_vcpu *vcpu,
+						struct kvm_sbi_fwft_config *conf,
+						bool one_reg_access, unsigned long value)
+{
+	return kvm_sbi_fwft_env_flag_set_helper(vcpu, conf, one_reg_access,
+						value, ENVCFG_ADUE);
+}
+
+static long kvm_sbi_fwft_get_pte_ad_hw_updating(struct kvm_vcpu *vcpu,
+						struct kvm_sbi_fwft_config *conf,
+						bool one_reg_access, unsigned long *value)
+{
+	return kvm_sbi_fwft_env_flag_get_helper(vcpu, conf, one_reg_access,
+						value, ENVCFG_ADUE);
+}
+
 #ifndef CONFIG_32BIT
 
 static bool try_to_set_pmm(unsigned long value)
@@ -246,6 +312,15 @@ static const struct kvm_sbi_fwft_feature features[] = {
 		.set = kvm_sbi_fwft_set_misaligned_delegation,
 		.get = kvm_sbi_fwft_get_misaligned_delegation,
 	},
+	{
+		.id = SBI_FWFT_PTE_AD_HW_UPDATING,
+		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, pte_ad_hw_updating.enable) /
+				 sizeof(unsigned long),
+		.supported = kvm_sbi_fwft_pte_ad_hw_updating_supported,
+		.reset = kvm_sbi_fwft_reset_pte_ad_hw_updating,
+		.set = kvm_sbi_fwft_set_pte_ad_hw_updating,
+		.get = kvm_sbi_fwft_get_pte_ad_hw_updating,
+	},
 #ifndef CONFIG_32BIT
 	{
 		.id = SBI_FWFT_POINTER_MASKING_PMLEN,
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
