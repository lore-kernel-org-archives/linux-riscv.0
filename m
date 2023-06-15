Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B34AEB64DB
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 07:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AFKsuLNKG32EJdPzPxn8MnyQeuqAILnHZmftsBGOj5w=; b=NCB1HNoeAWsiRX
	TEZgO8dbZTrkeRWmGp5Fc7gHbra72eJjhXE1yp4f8gyPL+zvcXSafGrBQw4oTCCRCrCjekcZtO5jd
	reTYAEhepma9m10D9zZm4jpSVCD+6qrpzXte+86CY8qKf/G85y7iLgItIImXMpNBA7k84vWtCgzDO
	ezR7pOixfvgCOK5ccuDS9nk/x4XL4IYV9uzgG5a5AmYD3WNxnrJhndLJtYOynnaqQMGuNkQSx8nf7
	YJcMddRUxtESyLsoE1dvoiG4NQSYAaj+UtILUp3p2wLMttx+X0wVDqj/nkiFcCX8+JX4k5os+G068
	cbuSksRyn2/C45HdCNyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hV4-00E1NY-1T;
	Thu, 15 Jun 2023 07:34:34 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hUz-00E1J3-1L
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 07:34:31 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b517ee9157so2342055ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 00:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686814469; x=1689406469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwO5wYN1w5TATPv4eKfzhxcMf0t/5mA6O0is8eCDj4I=;
        b=kGoN5P2dzjM6VyzhQDtDDPc/RqumyRWRevCZB0lJ0iAkXcz40wAl7+0oMGIq7AnAlQ
         huAZ4qeBAlJRCuH7LA/9/W961J8SKDyrWRWF9DadY+u7ZBcGPBlB90/eLDoU+JzYSwq/
         izmZSPCp4uPS6ZQzQOIOjMzOcajsPGkvcuL+IOW9lpGxBBCJY8Pa2+99VdTY7TK0zAPu
         VEBUlHaPWdEmEOin2hF2vVJ1u9jVGaPmduODLGQ0RYTmlwDr7C3N1j9B/zkDa80qPML5
         shcslfc1jn+3tpU6qPeaOs/QqcnrKXVNfYgfjwxxFg4WLgBKHB2rY9rlJhpiUFm+JaMP
         K0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686814469; x=1689406469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwO5wYN1w5TATPv4eKfzhxcMf0t/5mA6O0is8eCDj4I=;
        b=A926DuI9Ktxu+lCm0K4h+IH5Jt+F0q/UXAUX6Un7AbV6OHGSeF+sPqOX4JaiBwy2NU
         prBYuoTc1sFWg0sm5fe1SnX23obkTbHOjOMiENSsywELvf8CuH11LQv5INl7KUzcD5Tf
         ZHM0Co9dqdkkAfCvBMEK7FjEniyQRaWol6/ho95A4uQW9LaLfx32u02/rDlVQ5aq9TQB
         Um2fiWfm8fivCJHfttNGk5EtA2XZLQQBKh8vRAagNHmerGD9R1OBaIDMD2/6hVFPFkY4
         sa/h1HWRkORW8lY4KE8wuSCrE88Dd1/E1LfwKbw1A/eFeNiMP07Pj0HFYPZJxMsT7Llq
         QuSQ==
X-Gm-Message-State: AC+VfDyLXdbYOCxFR+XMdEcVVLk9Nkg7tfCkcYKCddlKwyUNnIwjtotc
	LKUnoIB5agiB1YShInG2ka/TpA==
X-Google-Smtp-Source: ACHHUZ4+fpw9v3b9+CDDN8KzkgoO92jhEaJj2s2l2W7Nb4/d3WXidiPCblEyGbx2Z4njRPIddKVlzg==
X-Received: by 2002:a17:902:f543:b0:1b3:e77b:f70d with SMTP id h3-20020a170902f54300b001b3e77bf70dmr8718741plf.29.1686814468796;
        Thu, 15 Jun 2023 00:34:28 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id ji1-20020a170903324100b001b016313b1dsm8049855plb.86.2023.06.15.00.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 00:34:28 -0700 (PDT)
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
Subject: [PATCH v3 08/10] RISC-V: KVM: Expose APLIC registers as attributes of AIA irqchip
Date: Thu, 15 Jun 2023 13:03:51 +0530
Message-Id: <20230615073353.85435-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615073353.85435-1-apatel@ventanamicro.com>
References: <20230615073353.85435-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_003429_455876_6A6BC448 
X-CRM114-Status: GOOD (  12.82  )
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
index eecd8f4abe21..39e72aa016a4 100644
--- a/arch/riscv/kvm/aia_aplic.c
+++ b/arch/riscv/kvm/aia_aplic.c
@@ -501,6 +501,49 @@ static struct kvm_io_device_ops aplic_iodoev_ops = {
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
index 7ab555121872..c649ad6e8e0a 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -365,6 +365,15 @@ static int aia_set_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
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
 
@@ -412,6 +421,20 @@ static int aia_get_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
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
 
@@ -448,6 +471,8 @@ static int aia_has_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
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
