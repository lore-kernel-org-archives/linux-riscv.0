Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE777C761A6
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 09:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OtGbIN8TL3GgpM+PUmHKdcgE/rW56S217vfOpSQkCLQ=; b=NPZaYLkFatlbF/
	2niQ6iAUZ2hyaAoVSHJwY64pncS6UAra+GgU4OOOwG4l8gJTbEqz87RLUf7xbN4z25MElXo1f0ocF
	EAYr5hmIdvsK22w5QSxVfmJuWtoCnGpDEM2X5w/dR3xQ4QUNWpeJ4XHzZ58c5SYIcXPn9pjVbV82v
	hSZ3Avtgqa1chEhxv6CZbXopru2TwJKtrWsCE46h0rlvTx1gW0LwKLjESrFQxJ5gyDSm5G+BGlFo8
	8q6UvuwYTdczwvtzzZfrV3TJxKAt6XHprH5t2ZsmbBpvPiyIJIhm+HweqTVABZt06ln4kmJk1EKZN
	mpS0wAxT2xCd5oO5rQFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGZZ-00Ejj6-0a;
	Mon, 03 Apr 2023 09:33:57 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGZV-00EjSR-1P
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 09:33:56 +0000
Received: by mail-ot1-x331.google.com with SMTP id f4-20020a9d0384000000b0069fab3f4cafso15267871otf.9
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 02:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680514433; x=1683106433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+FKlGY9+fsxmXa+E2ygJ8SqSZPYKfuMuKdW0nBwESI=;
        b=YeO8AtHtNrxFd09O0Kv4XtU6gmmvhqa+32++wYbcO3Sn/g9LxebMLwQypOxMg/6HQa
         yWFYsJL6Fp2RRvTbWgJIaBJYcwB8HDfn2SltCxWI4THa5jjyKaARqZVDUoJYAw8y91rV
         vJ1ww+xXy2iYXmg2RqQ5nkIlUOk5lhbrfvS1F+7LEAa8RjJl2EI+JqCjjozOeOhu8h7d
         Y/EFPrErjSV8Pn/f7I+wNkpuRvQh/jYpEOQprcMVV305V9w+C4M4fQtBpIR5Ngpn8M3B
         OscG6i3382bUuuPHVeCYw6h5DwFafwLLr8FRDbm/0oNi6fU16Q4SIvgU+8FT5Rb/yTTH
         gvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680514433; x=1683106433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+FKlGY9+fsxmXa+E2ygJ8SqSZPYKfuMuKdW0nBwESI=;
        b=FtxPyS6/CcKDrGgB4hBp7c4X0YpxGhB9JefUHo7NA9nSB0+Lrh1cHKEn0Sw7ZeCtdI
         9uGVZc14LCJTXLXf6GAjBYxw72Jzg9LBrmljik33Mi9VoJWOoCtQcfuRy8pDeXETeeUa
         it1ZUuGQmWs3QxQNfkpeF27m2eStK8QH7hsjaKKfRytRUxtFJ+mpJ9ak0TJI/nWfjMlO
         68NF1zNSlDe3HTZd9imMVGhZU8MI/6mcoHa8iu+ptCHCeafQh3+hYb0ipHo76ON5unTa
         zZdvUk2Mpd99nRRATvPFpMmTbzGV+QT/yzox4V7gIJVDkukbSPPe4HtNHPhQjFNNJUXs
         zDbQ==
X-Gm-Message-State: AAQBX9e7pNSFA1joApdwCuSR8wDYAk6PKEDMPfZCWzq1pDyYM1MmDWvH
	SSl+aaeTaKG8zq6TYumyxY4bvw==
X-Google-Smtp-Source: AKy350bRi1WrUjTU9kelZslJWpcjqtZN2JY6TsllxNwi9kovezaUK4RaVAw2QJhClRT0LeVrPvcQwg==
X-Received: by 2002:a05:6830:1503:b0:6a3:2513:c452 with SMTP id k3-20020a056830150300b006a32513c452mr2917922otp.23.1680514433022;
        Mon, 03 Apr 2023 02:33:53 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id f5-20020a9d6c05000000b006a154373578sm3953953otq.39.2023.04.03.02.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 02:33:52 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 5/8] RISC-V: KVM: Implement subtype for CSR ONE_REG interface
Date: Mon,  3 Apr 2023 15:03:07 +0530
Message-Id: <20230403093310.2271142-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403093310.2271142-1-apatel@ventanamicro.com>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_023353_482368_2664658A 
X-CRM114-Status: GOOD (  15.61  )
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

To make the CSR ONE_REG interface extensible, we implement subtype
for the CSR ONE_REG IDs. The existing CSR ONE_REG IDs are treated
as subtype = 0 (aka General CSRs).

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  3 +-
 arch/riscv/kvm/vcpu.c             | 88 +++++++++++++++++++++++--------
 2 files changed, 69 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 47a7c3958229..182023dc9a51 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -65,7 +65,7 @@ struct kvm_riscv_core {
 #define KVM_RISCV_MODE_S	1
 #define KVM_RISCV_MODE_U	0
 
-/* CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+/* General CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_csr {
 	unsigned long sstatus;
 	unsigned long sie;
@@ -152,6 +152,7 @@ enum KVM_RISCV_SBI_EXT_ID {
 
 /* Control and status registers are mapped as type 3 */
 #define KVM_REG_RISCV_CSR		(0x03 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_CSR_GENERAL	(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_REG(name)	\
 		(offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 1fd54ec15622..aca6b4fb7519 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -460,27 +460,72 @@ static int kvm_riscv_vcpu_set_reg_core(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static int kvm_riscv_vcpu_general_get_csr(struct kvm_vcpu *vcpu,
+					  unsigned long reg_num,
+					  unsigned long *out_val)
+{
+	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+
+	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
+		return -EINVAL;
+
+	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
+		kvm_riscv_vcpu_flush_interrupts(vcpu);
+		*out_val = (csr->hvip >> VSIP_TO_HVIP_SHIFT) & VSIP_VALID_MASK;
+	} else
+		*out_val = ((unsigned long *)csr)[reg_num];
+
+	return 0;
+}
+
+static inline int kvm_riscv_vcpu_general_set_csr(struct kvm_vcpu *vcpu,
+						 unsigned long reg_num,
+						 unsigned long reg_val)
+{
+	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+
+	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
+		return -EINVAL;
+
+	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
+		reg_val &= VSIP_VALID_MASK;
+		reg_val <<= VSIP_TO_HVIP_SHIFT;
+	}
+
+	((unsigned long *)csr)[reg_num] = reg_val;
+
+	if (reg_num == KVM_REG_RISCV_CSR_REG(sip))
+		WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
+
+	return 0;
+}
+
 static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 				      const struct kvm_one_reg *reg)
 {
-	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+	int rc;
 	unsigned long __user *uaddr =
 			(unsigned long __user *)(unsigned long)reg->addr;
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
 					    KVM_REG_SIZE_MASK |
 					    KVM_REG_RISCV_CSR);
-	unsigned long reg_val;
+	unsigned long reg_val, reg_subtype;
 
 	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
 		return -EINVAL;
-	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
-		return -EINVAL;
 
-	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
-		kvm_riscv_vcpu_flush_interrupts(vcpu);
-		reg_val = (csr->hvip >> VSIP_TO_HVIP_SHIFT) & VSIP_VALID_MASK;
-	} else
-		reg_val = ((unsigned long *)csr)[reg_num];
+	reg_subtype = reg_num & KVM_REG_RISCV_SUBTYPE_MASK;
+	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
+	switch (reg_subtype) {
+	case KVM_REG_RISCV_CSR_GENERAL:
+		rc = kvm_riscv_vcpu_general_get_csr(vcpu, reg_num, &reg_val);
+		break;
+	default:
+		rc = -EINVAL;
+		break;
+	}
+	if (rc)
+		return rc;
 
 	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
@@ -491,31 +536,32 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 				      const struct kvm_one_reg *reg)
 {
-	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+	int rc;
 	unsigned long __user *uaddr =
 			(unsigned long __user *)(unsigned long)reg->addr;
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
 					    KVM_REG_SIZE_MASK |
 					    KVM_REG_RISCV_CSR);
-	unsigned long reg_val;
+	unsigned long reg_val, reg_subtype;
 
 	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
 		return -EINVAL;
-	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
-		return -EINVAL;
 
 	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
 
-	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
-		reg_val &= VSIP_VALID_MASK;
-		reg_val <<= VSIP_TO_HVIP_SHIFT;
+	reg_subtype = reg_num & KVM_REG_RISCV_SUBTYPE_MASK;
+	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
+	switch (reg_subtype) {
+	case KVM_REG_RISCV_CSR_GENERAL:
+		rc = kvm_riscv_vcpu_general_set_csr(vcpu, reg_num, reg_val);
+		break;
+	default:
+		rc = -EINVAL;
+		break;
 	}
-
-	((unsigned long *)csr)[reg_num] = reg_val;
-
-	if (reg_num == KVM_REG_RISCV_CSR_REG(sip))
-		WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
+	if (rc)
+		return rc;
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
