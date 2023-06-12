Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A3AC7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 05:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ov/ia0RYdN5AFiPtX4d0/TwVMthoNjzAZspQ2NEcAM4=; b=AMcm9Hoa3rk494
	KVM4n6XV9fAreJgktAeyu3qSKQakW71n+c0pZ7CfLB8sI90GViMaDu0zaddgWyyN0OGcuG1u4a4q3
	sMTqrBxsmugimxoRFniVqQc36O1bHAEM5CLl5REaP4rMHkwipHLWgsBm8A27kU4plcOEjcIi+h3lz
	5kP6RX6TrsW6Py8GsGCJkVs7mDgYsYcMrfy/fNffPuiHg76rqHL0uAWZhPqr//RkN+KITGAGIJZ3+
	x77TAVx4kEBbkEj9biBVK57SW0uEAoou8QBQq1cCrwt7v3Tjjx5YP14NeOAJoPG/kGVAGduvDMHPr
	6XSHNihFHgBMFrjFRe/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8aHx-002fx2-2S;
	Mon, 12 Jun 2023 05:40:25 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8aHv-002fug-05
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 05:40:24 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1a670ac3650so979189fac.1
        for <linux-riscv@lists.infradead.org>; Sun, 11 Jun 2023 22:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686548422; x=1689140422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItzAMJwJhGybL3SYe9JMZRDA2+kADGrO7c+R89TrEXg=;
        b=OT9IxQEs+I6Su7qVZ5TcolzkjpjLjlWzXIX+T7pvI6Fh6rgAlNqs8KIyei4b5QP86d
         r1zKI2PR8AhmgDPNIwFTm111Bk8JK5slsrNqm4KGql5G9ah/nhmqwXvWVRwDxXVD7JCb
         T4lTH4HNgLBlVxs+0YkUZjwGR05msR2WiSMy6BQ8c0rnjRW/0u6bbsxPBbof4TqSk511
         2hC41M3t1qd+waAZL8SFeIdT7EIAFj8DCFzNspop6SC21erHx+o3hg6ltN4zOCd9bmNq
         vWj6jjIrdHjcJJ8gjp3r/2LJG5u4XlSRASKRbqJKW7BczcomMAL/RDdu7L8a0/tdAdaF
         m7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686548422; x=1689140422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItzAMJwJhGybL3SYe9JMZRDA2+kADGrO7c+R89TrEXg=;
        b=h9ZwJmGADP+q4UwBDeJ27wsbHT9jqtyPx4DvFJcNflDFO5hMpcANpAACoEBs4E7RdT
         kyLRT0qvagwO6UwQscWGpl6ext9ZqNTlmysFfr0omSWzH7Iwg1DWV0eil4NtwMt1wwMk
         DGZiV2toBvbC4nvKgFt1afymkpPOx+WQab7bj1V+qb6PfD5Xyh8R8GgEDMZNjwcEp/aM
         T8zXWaffFXCeoJwj1sg8T/Ru2591JQMQ/n5/pdubj/v8lrcp+9MuMcIgZtBSuhBJ1u79
         So4XBBCzZQHA2gqyJQig/k64gryUhR/PaStd0ROo9zbnWn6Ecyf63CzuT1kHWQ0oz/Ob
         F/NA==
X-Gm-Message-State: AC+VfDwOFKXWoZvkzurGm0u5WYHcirMucd8YOXaEdOKiEIafa2/sDJCQ
	R5u6QJocwFuftNnGA0B+8oBqYw==
X-Google-Smtp-Source: ACHHUZ5VhbemlNMa/C96OS5oJq3Hn9nOsmVawnbnBv7JIlC+o7QQG/ol/I8MeD/nz4QiewgDdVf6TQ==
X-Received: by 2002:a05:6870:8645:b0:1a6:4c71:8dd with SMTP id i5-20020a056870864500b001a64c7108ddmr3753337oal.37.1686548422284;
        Sun, 11 Jun 2023 22:40:22 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id lv19-20020a056871439300b001a30d846520sm5534869oab.7.2023.06.11.22.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 22:40:21 -0700 (PDT)
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
Subject: [PATCH v2 08/10] RISC-V: KVM: Expose APLIC registers as attributes of AIA irqchip
Date: Mon, 12 Jun 2023 11:09:30 +0530
Message-Id: <20230612053932.58604-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230612053932.58604-1-apatel@ventanamicro.com>
References: <20230612053932.58604-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_224023_069715_EDE5A6F5 
X-CRM114-Status: GOOD (  12.91  )
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
 arch/riscv/include/uapi/asm/kvm.h |  6 +++++
 arch/riscv/kvm/aia_aplic.c        | 43 +++++++++++++++++++++++++++++++
 arch/riscv/kvm/aia_device.c       | 25 ++++++++++++++++++
 4 files changed, 77 insertions(+)

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
index 047c8fc5bd71..9ed822fc5589 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -249,6 +249,12 @@ enum KVM_RISCV_SBI_EXT_ID {
 #define KVM_DEV_RISCV_AIA_GRP_CTRL		2
 #define KVM_DEV_RISCV_AIA_CTRL_INIT		0
 
+/*
+ * The device attribute type contains the memory mapped offset of the
+ * APLIC register (range 0x0000-0x3FFF) and it must be 4-byte aligned.
+ */
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
