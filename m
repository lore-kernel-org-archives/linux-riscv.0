Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EADCD8C8C
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 08:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9XbP5QAgu1uxpLfzuiJ/rwOk7MxgTPGUtmSRqNZ4aY=; b=xxykd0wtx18g59
	JqMxxaBbc3h2BkJgVpuux7os0w7IZzvCHAT/Mhqh/92oM33vBZQwvKMPvnR69ZNUt4Uz8kyM9YEDJ
	6JR4F8ELaAEK+tMA6ikxhc1Dqu6psskM0EE6cIDgTFn5yyVnjvW6GV+6w4P9uJsciSzj/K2qrn4oZ
	Li6sfZq/QuCN7d2h2WyLZlJfPKjP6p+eN0O5EJyRRSpC2CGjJ5N6mQrpqEV7rPHZhL0qf3Q4vN24Z
	1hhbv6GHieMEigSdLxQECG6HSv7SABs0D2DwHlgAQGlsXCbPSNtNPUsC4CArRzJb8QWy1r7fmcmgk
	6MZJX23hwpOtBunueVVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8bK-000000027EO-3Gxd;
	Sun, 07 Jun 2026 08:11:23 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8bI-000000027Cy-2AMD
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 08:11:21 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c0c2a68d01so22349685ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 07 Jun 2026 01:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780819879; x=1781424679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxlUMIwlGQesl8B7Mf1wKdsN0uUMSbOOYMToVqO4zKQ=;
        b=Awinzv8vcTUyRsBdofboJyZbRqhgL8w6CeJYVOWlZzTedhps/8FjUOpoje2YP6PAzs
         aPR1kjWswaNNhTAlod7H3UgVwrlK0ivy1/nWqqbx9A1Y32oZGep7QU5IfHUb6P48gLC/
         sbQ7mNW66vRb6tsgRVz+M4ibGswkt8qQEllNlSUv/Iz1S2j98ToRcDUdDl0ughuqdj2/
         3WmOHJCusbmDxcvK1CzhUqFBaZiuCkCO5wuwbZDtx7AjRNsh3/bR+6xnxaHgwwlvPwXW
         zs3bAk6E1C7gerdJyG8L4OlU8h4EImf3ud0TjK2MMFXWaHvOEm12+bH++UxQnKAl+C4o
         JkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780819879; x=1781424679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mxlUMIwlGQesl8B7Mf1wKdsN0uUMSbOOYMToVqO4zKQ=;
        b=dS0yBmj8J8JBi43IzJH1Wr0WbEdbXDmYyNdqJ+VYauW6+EkOFKBv84bdsGzYPS3y3s
         NrNodPjtWB4wKHgNvewMkxgpHA9zjBdCuzAcHL1NEVJyf9Z4mg0bSjRpqS9eyR8mu2D3
         hhWKqEPwR8l5kjIqcySWDQ8V7lTKBkB+0jR32PpryHxViEjp0M41OWrPZvSFCVDMWrgN
         1VZiBAKxnNKq1qHMwnQZyxSt2hwAkzJ+aSOd2wxdP37inWzRIm06plJoVpZBcRCNT4Gy
         X4OsI3ns13nd3PidHp3smDbc0pQGhIqZ0EHftbk+DO0xejhblWclLGSydJx+pkKmPsak
         tLXQ==
X-Gm-Message-State: AOJu0YwgVpChgXLYvLksXzF3blyd/Y1Fl4/H3/VUHqui57y0TowRQbiP
	HmqOa+uZ3OFjN6HdI4xwLyW63SFhQORXSBJXyS13XcGVFYBd/IQ913o0
X-Gm-Gg: Acq92OGQ5G7oAxOCAMzGk9LPwNIviD5jPM6Fpnke1uz5GRPK5NBmO6VcULqhufClzEY
	0L+wxQxJ9B0/d8UXVt5TEM43dnS45LIDFiFuDXU52CwG449jaOzQj2GfIU8BAQxw8m3tYzQrQrb
	cIoAKt4V/tBQ3P9Kvl1pSfNd6ugKlCgKCP1xlVkUk2HJ1vruUgLZECO6MqfFi986Mhi3IfMyFBy
	tmJY2mQF7bU9os63eHTMoOT7VSMymlbLOMd+MN14YajXT+w52uquYfNgXkJfU2phXntbnm5lvwy
	QRF3ljoQh+Iu6XTghINdEo2csq+SNvjNQQwIaU9L4j24cUO+8no/VUA4pwMZDkoLz3EuwenS2LR
	qGkz+Z2aV4tiutWf0iWJ8kQbU6h8U9yy49SW9hne0AWaULF+Wdc4C/g8wXirF6AMvUP2Pep/yYK
	4aKK+mluEJdtMVQ336QO1gZR/F545ARfRpAg==
X-Received: by 2002:a17:902:ccc3:b0:2b4:59bf:5728 with SMTP id d9443c01a7336-2c1e80ec2abmr114527255ad.25.1780819879527;
        Sun, 07 Jun 2026 01:11:19 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm145520575ad.80.2026.06.07.01.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 01:11:19 -0700 (PDT)
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
	Deepak Gupta <debug@rivosinc.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v3 1/8] RISC-V: KVM: Add support for Svadu FWFT features
Date: Sun,  7 Jun 2026 16:10:57 +0800
Message-ID: <20260607081105.993908-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607081105.993908-1-inochiama@gmail.com>
References: <20260607081105.993908-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_011120_559505_C3D7A01C 
X-CRM114-Status: GOOD (  14.18  )
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
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
