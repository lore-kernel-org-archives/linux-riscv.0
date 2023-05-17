Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81584C7EE2A
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 11:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5DShWGv3DygzrsPzQn0NFKW5pBtar7oRqkXQGnIGFY=; b=eQK1Ay14C09Xw2
	v9pR+HQqBixGVGeM5qywjJnPEqhJD7T7ZjsX3R1HQmsOHtsjvGG0qAYh8h23vgNH6NdOa7wuIaYmk
	bSmOvScsD2c9j/M8oKn5O0iTIU2X1Ja5gWYSzU/ySoc45k+nJROHkODYTZFNH0ADImtIHSmhMg4cS
	8eMExdrbd4QTTvyKVonABHt8HmDDlmLklTEqfbgl6PDKERA4tlhBVxPTNT/GIc2+qSpP9V14hw1xJ
	4bLlAHfwE5DKIe796KEoFWdxuFzvQbYQCgPbCw/78JfDgL0janH+qY/5bgS2bi3Vz8ZT7Tu/Cx4G1
	1np6+uvBbWeGsowM5rLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFW3-009dqn-1t;
	Wed, 17 May 2023 11:40:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFW1-009dpQ-0V
	for linux-riscv@bombadil.infradead.org;
	Wed, 17 May 2023 11:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kUsqFBRSizZOBbNz09TlCKcbFhTjGXkGkHhT7XXk9dc=; b=TW0u+zaZOPD6dAT8YPnlwWM+M9
	W0PONAkdbwKQ7Q2RUcsyiBXEjN2VBNheYhA/dQkxrURVAkRz9P2I9GbEAabrqrLLa77mOA+Iu4S7X
	uCvhvhyln6DTFs0JivdJrDE5sYbz3mzwYUfVJeNU90g2O1mduzBFpnbMNgp6vE5DJ3QOvF0nQodCG
	TIUPp/1qmTKuriLFBEhhsDgwzranaS5JKlWXwumpYMsRbPDvXVtipnW0BtibXMedIzVGxwB4O94IY
	slg9wa53AHVFTvYCRCC4wqa4t7JP9ILwv6sIVbm0AcLIfVKvgsTHgVp05nazCxl6iVeUozGhKkJ4Z
	/Xo3cq9w==;
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzElf-00DCI5-24
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 10:52:29 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6aaef8ca776so262890a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 May 2023 03:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684320747; x=1686912747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUsqFBRSizZOBbNz09TlCKcbFhTjGXkGkHhT7XXk9dc=;
        b=UbgZS/Tz5hnb69o2g+omOdrV7tfYg+sEssYVWHXO/bJ+7Blf4jWHzp7/ULMtpNODbx
         ewic8n6XLnfOl2E9hv0RmHdpHNd7uFFnl+LYnKVUnqmOry4HBNI71om8UMKpRSss7/nc
         a1FEZ2C0SEs9Q129ddmu1hKZVe4YlPc31Bzvwnsb2WCTgHlk5QlsR86abLM+AjoNcniH
         Bv2xJUPQXogOqUkidVXnHfidhDGrHvW/s/iZ06W/7zChZry7rtJsQa6mL8A2QFj/JL/O
         zJA3+GU6TC3ke6HHZk+rgcErvZh2GpTsjVra2i0Km4eQNZ4tnLL6hzfedT2xPEKGLpr3
         cWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684320747; x=1686912747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUsqFBRSizZOBbNz09TlCKcbFhTjGXkGkHhT7XXk9dc=;
        b=Mh959Z5oEexs83R3yvBmkATHv8Rk03CZl8ytHA3FFXBM2eeNiomTB3s4zz80IgN1Gm
         olux93OzittRoOWfykRvftzJT/8+QUhSmHcmWxcPEFdx2f1FVChELhPp36Rc44FNerwj
         99+Gq+43pkQ57/pGxd+Pd/qRjePkAcx5y0AbasZlAaZOYU+yHznMOhmDMSb3m3O5WBET
         ktO2ziQRpOo+MOWQaK5ipe987zOLNVK/x9trvowvrpludsqnBcp62GJ91xhyXoPlS34f
         9S2GGz2qwkgCHKFnjq7/5b9LXfl4uGKK9s9nuGcVPsKx34IEPY22c/Nui0yb4cJy2U0r
         WRpA==
X-Gm-Message-State: AC+VfDyqIVmLRo+G3sEq2GQncDbnggX4uRh/UD6Gm0WgHQlZFKyEBu1N
	CpwGoWC4v+ZRY7d4J16v7ho+EQ==
X-Google-Smtp-Source: ACHHUZ5ofDP1vXCukQa6GbbjvjT2ZVP8jTk8TIE1d+Gh1bRqzPLNCYWotHjDi0hHaPUREQ1i3EvT4w==
X-Received: by 2002:a05:6830:55:b0:6ad:8322:7460 with SMTP id d21-20020a056830005500b006ad83227460mr6048951otp.9.1684320747057;
        Wed, 17 May 2023 03:52:27 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w1-20020a9d77c1000000b006ade3815527sm2279896otl.22.2023.05.17.03.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 03:52:26 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 08/10] RISC-V: KVM: Expose APLIC registers as attributes of AIA irqchip
Date: Wed, 17 May 2023 16:21:33 +0530
Message-Id: <20230517105135.1871868-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517105135.1871868-1-apatel@ventanamicro.com>
References: <20230517105135.1871868-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_115227_903552_47DDAB93 
X-CRM114-Status: GOOD (  11.97  )
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

We expose APLIC registers as KVM device attributes of the in-kernel
AIA irqchip device. This will allow KVM user-space to save/restore
APLIC state using KVM device ioctls().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_aia.h  |  3 +++
 arch/riscv/include/uapi/asm/kvm.h |  2 ++
 arch/riscv/kvm/aia_aplic.c        | 43 +++++++++++++++++++++++++++++++
 arch/riscv/kvm/aia_device.c       | 25 ++++++++++++++++++
 4 files changed, 73 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index f6bd8523395f..ba939c0054aa 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -129,6 +129,9 @@ static inline void kvm_riscv_vcpu_aia_imsic_cleanup(struct kvm_vcpu *vcpu)
 {
 }
 
+int kvm_riscv_aia_aplic_set_attr(struct kvm *kvm, unsigned long type, u32 v);
+int kvm_riscv_aia_aplic_get_attr(struct kvm *kvm, unsigned long type, u32 *v);
+int kvm_riscv_aia_aplic_has_attr(struct kvm *kvm, unsigned long type);
 int kvm_riscv_aia_aplic_inject(struct kvm *kvm, u32 source, bool level);
 int kvm_riscv_aia_aplic_init(struct kvm *kvm);
 void kvm_riscv_aia_aplic_cleanup(struct kvm *kvm);
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 57f8d8bb498e..e80210c2220b 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -240,6 +240,8 @@ enum KVM_RISCV_SBI_EXT_ID {
 #define KVM_DEV_RISCV_AIA_GRP_CTRL		2
 #define KVM_DEV_RISCV_AIA_CTRL_INIT		0
 
+#define KVM_DEV_RISCV_AIA_GRP_APLIC		3
+
 /* One single KVM irqchip, ie. the AIA */
 #define KVM_NR_IRQCHIPS			1
 
diff --git a/arch/riscv/kvm/aia_aplic.c b/arch/riscv/kvm/aia_aplic.c
index 1b0a4df64815..ed9102dfba77 100644
--- a/arch/riscv/kvm/aia_aplic.c
+++ b/arch/riscv/kvm/aia_aplic.c
@@ -499,6 +499,49 @@ static struct kvm_io_device_ops aplic_iodoev_ops = {
 	.write = aplic_mmio_write,
 };
 
+int kvm_riscv_aia_aplic_set_attr(struct kvm *kvm, unsigned long type, u32 v)
+{
+	int rc;
+
+	if (!kvm->arch.aia.aplic_state)
+		return -ENODEV;
+
+	rc = aplic_mmio_write_offset(kvm, type, v);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+int kvm_riscv_aia_aplic_get_attr(struct kvm *kvm, unsigned long type, u32 *v)
+{
+	int rc;
+
+	if (!kvm->arch.aia.aplic_state)
+		return -ENODEV;
+
+	rc = aplic_mmio_read_offset(kvm, type, v);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+int kvm_riscv_aia_aplic_has_attr(struct kvm *kvm, unsigned long type)
+{
+	int rc;
+	u32 val;
+
+	if (!kvm->arch.aia.aplic_state)
+		return -ENODEV;
+
+	rc = aplic_mmio_read_offset(kvm, type, &val);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
 int kvm_riscv_aia_aplic_init(struct kvm *kvm)
 {
 	int i, ret = 0;
diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index a151fb357887..17dba92a90e1 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -364,6 +364,15 @@ static int aia_set_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
 			break;
 		}
 
+		break;
+	case KVM_DEV_RISCV_AIA_GRP_APLIC:
+		if (copy_from_user(&nr, uaddr, sizeof(nr)))
+			return -EFAULT;
+
+		mutex_lock(&dev->kvm->lock);
+		r = kvm_riscv_aia_aplic_set_attr(dev->kvm, type, nr);
+		mutex_unlock(&dev->kvm->lock);
+
 		break;
 	}
 
@@ -411,6 +420,20 @@ static int aia_get_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
 		if (copy_to_user(uaddr, &addr, sizeof(addr)))
 			return -EFAULT;
 
+		break;
+	case KVM_DEV_RISCV_AIA_GRP_APLIC:
+		if (copy_from_user(&nr, uaddr, sizeof(nr)))
+			return -EFAULT;
+
+		mutex_lock(&dev->kvm->lock);
+		r = kvm_riscv_aia_aplic_get_attr(dev->kvm, type, &nr);
+		mutex_unlock(&dev->kvm->lock);
+		if (r)
+			return r;
+
+		if (copy_to_user(uaddr, &nr, sizeof(nr)))
+			return -EFAULT;
+
 		break;
 	}
 
@@ -447,6 +470,8 @@ static int aia_has_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
 			return 0;
 		}
 		break;
+	case KVM_DEV_RISCV_AIA_GRP_APLIC:
+		return kvm_riscv_aia_aplic_has_attr(dev->kvm, attr->attr);
 	}
 
 	return -ENXIO;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
