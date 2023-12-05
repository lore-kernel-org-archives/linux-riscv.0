Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D38C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 18:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MS3JOlCGiEMIwYhqkUCDK8qRYNNuw+0qBQRPQFuB0uQ=; b=YRg5Cog/uGWVk2
	Qg1rZdTD9DVFPgq3HsSz95XMSD9cZ356tdnNdCgwvXvpiPO+NMhRkVp3qW6DZpFStydlpIuW5cOlv
	MAsyDITiQvORnx5y1D62XKp/GTwibjbYoqCdZqH1eyF9b423ini0nKVJuXx13+xnezqARtmIcszGa
	f+gA/t7nyMpq7v+p4/0MxOa4N1KeSDJp/HBtECI5JC5qPBkuQqee7HD1f0jnkT8BKBBJlwLc31BZG
	p8o2fOl3pVNt1LYrL+w94QEcVte7mGkGYeWmyyvpC/fZ4zAcmCtRz66XWK0cJ4LsyFGVS+JXLZZZp
	PLzDQ/Vtqgyi39X4/XJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZta-00872j-27;
	Tue, 05 Dec 2023 18:11:46 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtP-0086mW-38
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 18:11:38 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a1b68ae40ffso361194166b.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 10:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701799892; x=1702404692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6h85CYq2H3Bjzoic/rnr1HxTS56+iOncT279HVmrGAo=;
        b=EOCVIMqSks1xJh26Tce37lC9RP49naSqDylOeahknhtBUzUCIy2fxkCdoCOSd6uVSY
         TxWu6bZNqL2zCxXViYQLSz3weHQ4D3tgB0zcDlzoFUhRjNnCoUesZSFuCoXRNj1zQgyY
         X7oJx37IUWpeM70s9ZL9zq0/Rz2mGZVxn6pnZHY1Kna0628T9Mtn3uYnGCeCyZOhHx00
         O5r5SuPLKtw52mowJqFVo7688bzXfWPs5YY+eodULOEkEKkdmj26zE5jNSDp9l/5ffZM
         Lb2wf+9dt/Ktg4+yGdbBI0c0ovtEPp3EJO+A8/bv5/38ARW/t8qAC5VFnvZMw/6C9ydH
         bA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701799892; x=1702404692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6h85CYq2H3Bjzoic/rnr1HxTS56+iOncT279HVmrGAo=;
        b=WxImfIMpXznSP0b6lBrByUk+/kS987WjIz5Yb8go/AWbr0ZH/LolvzQ3Wf5RCRQ80E
         jLxkCAhwBmHe3MIZQQ7MSdu6OaitXN2vR/p/cQQxpiptm4IzplFYygPg7IalCFr9WG9d
         UgRyV0fSHBWyFnwlMhA6KvN6w0Oa7DXCcvYgKV9oME2KONVITBnp0zFI2eFIlqvzLHiH
         kHJscIwSwfXZ+7YJuvvvq4pvfj8lm3Tjq4HAyvFyjieSvYThbd5yZRvo94AcccgTrOW/
         UFx70ChgGLZHKVhCeWko6jBGYyoK7p0wpU4VAbryAaXsPoUhOySTJpb1faqSkNKWPQoA
         lE+Q==
X-Gm-Message-State: AOJu0YxLwbhNfdFTpp57XtVzksNVr9c3X6eipcX9chYEQeBxq1IWZIwh
	dsx8TiA2tdzGW2IAYe2UFMfVaMkQcVgMm0i6UQ0=
X-Google-Smtp-Source: AGHT+IER/2CAuqh6Z8btx+hMbI7wTr23oYfEqmvRl1QXxp3ynKfAd3uxyZ8YM9016kMOwyB/0+BT2g==
X-Received: by 2002:a17:906:c5b:b0:a19:9b79:8b41 with SMTP id t27-20020a1709060c5b00b00a199b798b41mr567854ejf.82.1701799892243;
        Tue, 05 Dec 2023 10:11:32 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id cb26-20020a170906a45a00b00a0958af2387sm6986924ejb.201.2023.12.05.10.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 10:11:31 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org
Subject: [PATCH v1 08/14] RISC-V: KVM: Add support for SBI extension registers
Date: Tue,  5 Dec 2023 19:11:28 +0100
Message-ID: <20231205181119.207204-24-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205181119.207204-16-ajones@ventanamicro.com>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_101136_010984_8C01B3D1 
X-CRM114-Status: GOOD (  13.88  )
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

Some SBI extensions have state that needs to be saved / restored
when migrating the VM. Provide a get/set-one-reg register type
for SBI extension registers. Each SBI extension that uses this type
will have its own subtype. There are currently no subtypes defined.
The next patch introduces the first one.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  3 +
 arch/riscv/kvm/vcpu_onereg.c      | 92 +++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 85b979f7d2bd..86df125ef17f 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -269,6 +269,9 @@ enum KVM_RISCV_SBI_EXT_ID {
 #define KVM_REG_RISCV_VECTOR_REG(n)	\
 		((n) + sizeof(struct __riscv_v_ext_state) / sizeof(unsigned long))
 
+/* Registers for specific SBI extensions are mapped as type 10 */
+#define KVM_REG_RISCV_SBI		(0x0a << KVM_REG_RISCV_TYPE_SHIFT)
+
 /* Device Control API: RISC-V AIA */
 #define KVM_DEV_RISCV_APLIC_ALIGN		0x1000
 #define KVM_DEV_RISCV_APLIC_SIZE		0x4000
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 62c7334f74cf..dbd8cedfd556 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -1015,6 +1015,87 @@ static unsigned long num_sbi_ext_regs(struct kvm_vcpu *vcpu)
 	return copy_sbi_ext_reg_indices(vcpu, NULL);
 }
 
+static int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu,
+				      const struct kvm_one_reg *reg)
+{
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_SBI);
+	unsigned long reg_subtype, reg_val;
+	int ret;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+
+	reg_subtype = reg_num & KVM_REG_RISCV_SUBTYPE_MASK;
+	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
+
+	switch (reg_subtype) {
+	default:
+		return -EINVAL;
+	}
+
+	if (ret)
+		return ret;
+
+	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu,
+				      const struct kvm_one_reg *reg)
+{
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_SBI);
+	unsigned long reg_subtype, reg_val;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+
+	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	reg_subtype = reg_num & KVM_REG_RISCV_SUBTYPE_MASK;
+	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
+
+	switch (reg_subtype) {
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static inline unsigned long num_sbi_regs(struct kvm_vcpu *vcpu)
+{
+	return 0;
+}
+
+static int copy_sbi_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
+{
+	int n = num_sbi_regs(vcpu);
+
+	for (int i = 0; i < n; i++) {
+		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 |
+			  KVM_REG_RISCV_SBI | i;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+	}
+
+	return n;
+}
+
 /*
  * kvm_riscv_vcpu_num_regs - how many registers do we present via KVM_GET/SET_ONE_REG
  *
@@ -1032,6 +1113,7 @@ unsigned long kvm_riscv_vcpu_num_regs(struct kvm_vcpu *vcpu)
 	res += num_fp_d_regs(vcpu);
 	res += num_isa_ext_regs(vcpu);
 	res += num_sbi_ext_regs(vcpu);
+	res += num_sbi_regs(vcpu);
 
 	return res;
 }
@@ -1082,6 +1164,12 @@ int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
 	ret = copy_sbi_ext_reg_indices(vcpu, uindices);
 	if (ret < 0)
 		return ret;
+	uindices += ret;
+
+	ret = copy_sbi_reg_indices(vcpu, uindices);
+	if (ret < 0)
+		return ret;
+	uindices += ret;
 
 	return 0;
 }
@@ -1110,6 +1198,8 @@ int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 		return kvm_riscv_vcpu_set_reg_sbi_ext(vcpu, reg);
 	case KVM_REG_RISCV_VECTOR:
 		return kvm_riscv_vcpu_set_reg_vector(vcpu, reg);
+	case KVM_REG_RISCV_SBI:
+		return kvm_riscv_vcpu_set_reg_sbi(vcpu, reg);
 	default:
 		break;
 	}
@@ -1141,6 +1231,8 @@ int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
 		return kvm_riscv_vcpu_get_reg_sbi_ext(vcpu, reg);
 	case KVM_REG_RISCV_VECTOR:
 		return kvm_riscv_vcpu_get_reg_vector(vcpu, reg);
+	case KVM_REG_RISCV_SBI:
+		return kvm_riscv_vcpu_get_reg_sbi(vcpu, reg);
 	default:
 		break;
 	}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
