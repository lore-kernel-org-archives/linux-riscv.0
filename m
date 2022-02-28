Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29874C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 09:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1aoOrBe4L7aHEqQ7M9yKrJMEPqKVsQOrCyAK4gokgE=; b=JakwJOrEUdT29z
	IfSthEcKFFBePea79gRZSfPUiqcUpBpVM4W+GA6PlVW9NopYURiNreetEpGW4PifuPFG9vQRuOXA1
	Vz1QHjmGwUfMLBgqBNFteVsf71HHiThVKYU8yTUDKzSd7QLNRIDvHW0Kw5fhcztf8B8/0hv84KS/+
	YG/SfsVi+YMieskqoYYjzNljey6VcI4v9uZeD6jZamrSVDT1ccO///391eUbYIdRQ3Lkp4CvH/jJ8
	aSB9YF7dlIjmzeQERkGWNUtqleCwh8PY/MLukGeBalRD8bkl9GbVdlgG6qaZAYa27H7AoANAPbHxp
	zVCfmK5w/ay4tyXXlZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOcYc-00BIXg-80; Mon, 28 Feb 2022 09:43:06 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOcYN-00BIMR-SS
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 09:42:54 +0000
Received: by mail-oi1-x232.google.com with SMTP id j24so12597563oii.11
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 01:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XFrpl5446IcZeaBBGAxYAn+iPFCIWeU+jYaFG83Q4F0=;
 b=nUz5oGOGwkjD8q6eoZBh47WhGFMt1M5X6sBLyUZp+npRx62JpWftYvp9Dlw8SW7sUg
 9nBeX7Bzu0Hz8ZHQQpo11h6qZR/9MMJJKKmDsR9FS81MAfPMyIQjqw98famYPaOPzuKR
 LfTPILFeIaPXrVz9lOvp859fJd/UXITHlTxHwiZxuBkfRSBpJAy+HKg8mamyrSPRJd1L
 bedTqDDUI15n7Qw0RMA/XmPUtfx1AMfdxW8stkZXdwaXZCdsSc34yU0PORw5SEZEKHzA
 fXuIukIKVOxQF/DrgZzIKHruFqGsAkKGqwJkhc/Nfgg1iKIpJo1hNBr6jWM/qSaSdk5k
 q5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XFrpl5446IcZeaBBGAxYAn+iPFCIWeU+jYaFG83Q4F0=;
 b=CrwNs5WnDGayPFiwmE/e/zmvlkvWZhXnPxaEU30zIJRXeBA87bOGTSYyP9ihgeqbkB
 +vqJZhCFKC+5+7hv/suuAqrcllW5YgwDaTtGv33uNkpIz9/Zvns8Z/dJaWaIvFOgzkrs
 qsCop54ThbF6PHq3OgCmfwQxCJ60y2ZkO7wluoJtwLLsISJDxFemnF6HwLIZDZ9kQ1OJ
 ljrrK2n1jN28QHtcCB+S/kzQuZlqPGlV+k/DXsUM/YTNEjQiO4kyDufPo0zZVcXv54j/
 xr/xl8uHeNzCgdpVvw49MsvBDNR6cT8qh95leIFeOrZW0tQKzmKNP4hI6Q/uP2gj18B4
 HgRw==
X-Gm-Message-State: AOAM530UCKTsi5HlaSO4qcYgSV1wKFdmLcnR0O6I7cZ7TA9VKZQcmmO3
 Mq0DF3eCnx/jW/MWbwdIcxRwGw==
X-Google-Smtp-Source: ABdhPJwZNoOfJ9C7fZHdiBbbvjhrpJyYh2oOGF92RPVfvPs8hhXN43YR6nQQoPTOVwhyYo/QuY3ZeA==
X-Received: by 2002:aca:ba83:0:b0:2d4:13f1:8530 with SMTP id
 k125-20020acaba83000000b002d413f18530mr7607779oif.169.1646041370972; 
 Mon, 28 Feb 2022 01:42:50 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 bx10-20020a0568081b0a00b002d70da1ac54sm5936852oib.19.2022.02.28.01.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 01:42:50 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, kvm-riscv@lists.infradead.org,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH 5/6] RISC-V: KVM: Introduce ISA extension register
Date: Mon, 28 Feb 2022 01:42:32 -0800
Message-Id: <20220228094234.3773153-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220228094234.3773153-1-atishp@rivosinc.com>
References: <20220228094234.3773153-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_014251_943528_17DB96E2 
X-CRM114-Status: GOOD (  22.49  )
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

Currently, there is no provision for vmm (qemu-kvm or kvmtool) to
query about multiple-letter ISA extensions. The config register
is only used for base single letter ISA extensions.

A new ISA extension register is added that will allow the vmm
to query about any ISA extension one at a time. It is enabled for
both single letter or multi-letter ISA extensions. The ISA extension
register is useful to if the vmm requires to retrieve/set single
extension while the config register should be used if all the base
ISA extension required to retrieve or set.

For any multi-letter ISA extensions, the new register interface
must be used.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  20 ++++++
 arch/riscv/kvm/vcpu.c             | 101 ++++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index aa9f5a5c57d8..e01678aa2a55 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -83,6 +83,23 @@ struct kvm_riscv_timer {
 	__u64 state;
 };
 
+/**
+ * ISA extension IDs specific to KVM. This is not the same as the host ISA
+ * extension IDs as that is internal to the host and should not be exposed
+ * to the guest. This should always be contiguous to keep the mapping simple
+ * in KVM implementation.
+ */
+enum KVM_RISCV_ISA_EXT_ID {
+	KVM_RISCV_ISA_EXT_A = 0,
+	KVM_RISCV_ISA_EXT_C,
+	KVM_RISCV_ISA_EXT_D,
+	KVM_RISCV_ISA_EXT_F,
+	KVM_RISCV_ISA_EXT_H,
+	KVM_RISCV_ISA_EXT_I,
+	KVM_RISCV_ISA_EXT_M,
+	KVM_RISCV_ISA_EXT_MAX,
+};
+
 /* Possible states for kvm_riscv_timer */
 #define KVM_RISCV_TIMER_STATE_OFF	0
 #define KVM_RISCV_TIMER_STATE_ON	1
@@ -124,6 +141,9 @@ struct kvm_riscv_timer {
 #define KVM_REG_RISCV_FP_D_REG(name)	\
 		(offsetof(struct __riscv_d_ext_state, name) / sizeof(__u64))
 
+/* ISA Extension registers are mapped as type 7 */
+#define KVM_REG_RISCV_ISA_EXT		(0x07 << KVM_REG_RISCV_TYPE_SHIFT)
+
 #endif
 
 #endif /* __LINUX_KVM_RISCV_H */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 7a07dba504f8..c314c40be313 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -364,6 +364,103 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+/* Mapping between KVM ISA Extension ID & Host ISA extension ID */
+static unsigned long kvm_isa_ext_arr[] = {
+	RISCV_ISA_EXT_a,
+	RISCV_ISA_EXT_c,
+	RISCV_ISA_EXT_d,
+	RISCV_ISA_EXT_f,
+	RISCV_ISA_EXT_h,
+	RISCV_ISA_EXT_i,
+	RISCV_ISA_EXT_m,
+};
+
+static int kvm_riscv_vcpu_get_reg_isa_ext(struct kvm_vcpu *vcpu,
+					  const struct kvm_one_reg *reg)
+{
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_ISA_EXT);
+	unsigned long reg_val = 0;
+	unsigned long host_isa_ext;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+
+	if (reg_num >= KVM_RISCV_ISA_EXT_MAX || reg_num >= ARRAY_SIZE(kvm_isa_ext_arr))
+		return -EINVAL;
+
+	host_isa_ext = kvm_isa_ext_arr[reg_num];
+	if (__riscv_isa_extension_available(NULL, host_isa_ext))
+		reg_val = 1; /* Mark the given extension as available */
+
+	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
+					  const struct kvm_one_reg *reg)
+{
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_ISA_EXT);
+	unsigned long reg_val;
+	unsigned long host_isa_ext;
+	unsigned long host_isa_ext_mask;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+
+	if (reg_num >= KVM_RISCV_ISA_EXT_MAX || reg_num >= ARRAY_SIZE(kvm_isa_ext_arr))
+		return -EINVAL;
+
+	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	host_isa_ext = kvm_isa_ext_arr[reg_num];
+	if (!__riscv_isa_extension_available(NULL, host_isa_ext))
+		return	-EOPNOTSUPP;
+
+	if (host_isa_ext >= RISCV_ISA_EXT_BASE &&
+	    host_isa_ext < RISCV_ISA_EXT_MAX) {
+		/** Multi-letter ISA extension. Currently there is no provision
+		 * to enable/disable the multi-letter ISA extensions for guests.
+		 * Return success if the request is to enable any ISA extension
+		 * that is available in the hardware.
+		 * Return -EOPNOTSUPP otherwise.
+		 */
+		if (!reg_val)
+			return -EOPNOTSUPP;
+		else
+			return 0;
+	}
+
+	/* Single letter base ISA extension */
+	if (!vcpu->arch.ran_atleast_once) {
+		host_isa_ext_mask = reg_val ? (1 << host_isa_ext) : ~(1 << host_isa_ext);
+		if (!reg_val)
+			vcpu->arch.isa &= host_isa_ext_mask;
+		else
+			vcpu->arch.isa |= host_isa_ext_mask;
+		vcpu->arch.isa &= riscv_isa_extension_base(NULL);
+		vcpu->arch.isa &= KVM_RISCV_ISA_ALLOWED;
+		kvm_riscv_vcpu_fp_reset(vcpu);
+	} else {
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
 static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 				  const struct kvm_one_reg *reg)
 {
@@ -381,6 +478,8 @@ static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
 		return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
 						 KVM_REG_RISCV_FP_D);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT)
+		return kvm_riscv_vcpu_set_reg_isa_ext(vcpu, reg);
 
 	return -EINVAL;
 }
@@ -402,6 +501,8 @@ static int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
 	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
 		return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
 						 KVM_REG_RISCV_FP_D);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT)
+		return kvm_riscv_vcpu_get_reg_isa_ext(vcpu, reg);
 
 	return -EINVAL;
 }
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
