Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D517EC44501
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 01:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ao8jMFnQ6EYKXfD9Qb9+ISUJDEJx7ltFi2R+AWFyZQ0=; b=IQBvPWGDtvqVXV
	Dpk+pwg2/KQAXszlDShzMryvsy+n+i0Cw5/ouySmpSZ4n2SxQxaF0hRSP5P88U3RwS0y9o6NHsfMi
	VeZSsc9zR30kGMbdoISawB0EG+WdYNxhM/fHRCVgrxgX9OR9g/ZAv1Qov1kW5XetVq8Rny9t8LCzP
	wayMzKgiXBWifQa2rNLdVFS/EnYmtHxqg/Z6ESZHLz8Rid0xsL/3D5FER43PcEvzzp+Z3dACquBNc
	bEOCH2Wz+rtxPE3GUvdGn6Ph4dEEbWOdkwYr1X7cjc67wsF9uxfNyoswviBWnlr+G29OhCeoVOtXE
	NTX2KY+5psDo1D3geJMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55O-00000007tV7-2AcJ;
	Mon, 13 Jul 2026 01:03:54 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55M-00000007tTz-1aan
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 01:03:53 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so2362005a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 18:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783904631; x=1784509431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4wtNmoMKQodXeWiOSWDyChURk6Jt6lHeZLiT5bWjNnQ=;
        b=MYyB6dgrGRGXoRd8OdmgxLYF73zX/YqbO0zfTadIh8XwykBpKCOYvr1hqfNeKejkuO
         P6znDo6P5C8GMsgP7QBI26/Zzx6w2T5iiig/kskyJLfinTJXsU0iLMnpPr7lp8oyzJRf
         kh8qxf36havE+Ew+AvnDW1TFAIbBd1a/i4OZrlAsI8+jcAWDfdKvZrSl0b0ZlGkfAnph
         mCIPHX4x5KWzR1bABi9aR3aDRKr+F+yvv14XB3HRKhDbDyrJFQsi9uf5JIWIWkuuuTu5
         EjOMHR8sn4Cxl9CJUTtbECZeO9Lkvu4xu/J2HgEcm9drSSiZFo2H+i5Z/xXOV/gpKwSj
         81MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904631; x=1784509431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4wtNmoMKQodXeWiOSWDyChURk6Jt6lHeZLiT5bWjNnQ=;
        b=JzI9wicfF5DG9Hx7EizxrF+qMkXk+8pbjhTq0/HhGDkJobw8Az5O6l4gzGNxkNKYju
         T103hMvzqh87AS+oWgI2zY1DXZ6NkSwsZ9G2lzjsdMboHlKIYQ92YDwmmDtOrkau+qpx
         MQ2ljjWeKZDuH7Zsu0HnhwT6RjUnrKpDZJnQsdvBuLBRmuhR3MMp6k66KHcBAcW5nlNJ
         4O3Va/epie63SZa17+tBPUpHaUNOPIHBqxS2o/cgvgNrzLyvuMZq+d944ap1cAeFyyK5
         hVyCT43I97/MyVXXeTlMK1MlzOm7HFZ0tflKv09opyA7snZuXvZr7B64xjHaajRCHYPG
         530Q==
X-Gm-Message-State: AOJu0YyzdNdDPKEOm1NoK0uOYJEMEw60JOuYZjbwjWjGiObDFfXf3qxo
	Q0uAfSMXjrYft0GRPQ9qP6VYM2BUeFSDAHJBQ9VgKNv/XCUwXdrmjYLu
X-Gm-Gg: AfdE7clgKdDdJ9LT249HElq3beB/9NrMzn5KN1vl0Wz3MbbNFUAB5yM27d4aESy3ehX
	eQX9xyfkGr/jNwoUsAbo4vFiD496v3851rF+csIKEuwtXXLgs293g23BqmYdmEjL545fWqlJF26
	T5SPfDXAOqLShXTzgB4YLlCL3KkryrSZh6jyRtggt3KGHkBKOZnYix1juq3IUWrlL8t/7eoBYyU
	KtK1br3OZg6Mnq13Ozn3H0nUKtPBCuUQXE61dkakNfOUEtEHA2rFfjTCZMWh38ricDhtHfZmx5A
	RoUI+ZSZIXvZV7Z2mlgfI0J395YHqmffnWPbYpsDpuzn/tY+KugCzG7KRBl6R7EaKL6L3a1Ja9m
	EoMZ/PlxcFQh+MCnXUHkTKM2pBP91E3Z4N1IyDbWgAdXQAy7GR6ap93eC/C0SdguqwZrVm1uzib
	m512d7fNLNtgU=
X-Received: by 2002:a17:90b:47:b0:37e:b6a:6cdf with SMTP id 98e67ed59e1d1-38dc77ee830mr7343814a91.20.1783904631435;
        Sun, 12 Jul 2026 18:03:51 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a55a47286sm5549380a91.10.2026.07.12.18.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 18:03:51 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v6 1/8] RISC-V: KVM: Add support for Svadu FWFT features
Date: Mon, 13 Jul 2026 09:02:54 +0800
Message-ID: <20260713010302.303278-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713010302.303278-1-inochiama@gmail.com>
References: <20260713010302.303278-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_180352_432320_B6E711B8 
X-CRM114-Status: GOOD (  14.08  )
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
 arch/riscv/kvm/vcpu_sbi_fwft.c    | 76 +++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

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
index ab39ac464ffd..4d474a439b29 100644
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
@@ -137,6 +176,34 @@ static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
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
+	if (kvm_sbi_fwft_pte_ad_hw_updating_supported(vcpu))
+		kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_ADUE);
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
@@ -246,6 +313,15 @@ static const struct kvm_sbi_fwft_feature features[] = {
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
