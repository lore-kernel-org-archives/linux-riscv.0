Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487C7C04E69
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 16:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y40hNxT1YH+6swgVTyNDEv89unwcREGnsR+v49jtIvM=; b=39o9ZDho1Aqzh6
	m46oVySf2MPPHMI9G9QrXr3u4BkCrKl0LZMRGo6WCwtRPECq7xLzS3CwhVsi4Q+fv7RAKlrmf0v0c
	XDt94N7uYSCDorkLB9tBNNA8YhD2ppoTR0/JWkXTLFxPJQlqpT9xSb8QVUHG3sEzr1zDWVMyKX/mo
	HeWMypiR93MTX1IwnwBZoiO74w83gfmhe/nio8IGVgA3a0POngwOp9hKUhFOlgNZEZwPknvXYIJox
	dZr/mxqNCWZs5XfJsQKXoVWgBs4zTxWSY03G5/n4Q2SXypLXhxMW8Ienf4GTRSLwlpi0JtuV3EyTQ
	rxFi4EogGsZiDszY8r7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbGb-00AKq2-2A;
	Thu, 03 Aug 2023 16:33:37 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbGY-00AKjI-1F
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 16:33:35 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3a74d759bfcso888728b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 09:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691080412; x=1691685212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkwDk8dXju8I9w7KpYFAws21Qd1+OBzn/0afxgdVQLI=;
        b=N6eD3D+2ZGDTGKs0uoKUQflxUg0CRszU0wYcEX1ODl11fo+EjpZB5bT8npzJM5ItSe
         9OKx0XMOTuDUsslrgxtturtBHw7YNozWeasDIk+elGxIOUREq4cDP0XBzmmlL5qkMagz
         niXg4nabm1nFAYLle3gbBiYpYT0CLVnpxBCdVwDAr3xvO+nlp6ptob8r90iCHhj9yFro
         RqLfhQ3aC5xruAhvY5WjGP1ejgj93gqrtelZcVdCGOBvrNJ6W2G5BjRt53sfnu/biBJC
         UOrdkP+U29Ha2CplC/nEgI07aZRZUB+umL+Tzw9iDcAyE04EC1VPn8aZ4KvMRqqkT39v
         L7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691080412; x=1691685212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkwDk8dXju8I9w7KpYFAws21Qd1+OBzn/0afxgdVQLI=;
        b=f89crrwXY1ea1sLgZeApkV4AJUEgGCTLIZ/4jtJUmRZbaSJJPuNw6YxarJkd/vxYiV
         HA8CVgAO9pz49p9WkBUa68i8z57rIGOFuTV+cLL9nildw2lgd5Txj++8CantQdnu5FGG
         M0ySA8R8bakq71F9o31USrdgDggpNEDV+VbhnAia2h+hdNf98yZcEG/lmPs9z00/+RYM
         tli0DG6m/bV/sfnjcXfaoJYF+EPypto7m2+wiRWvXPabmr+baL8m5LnQCF/rjTLqEWw4
         1TyYjCiI0lOIBdX8/1zZn46OiPTSgcf28xnMCGxo+gou8w+fWd0Gku1DvyQi8iqp22Xv
         GBOQ==
X-Gm-Message-State: ABy/qLYkh1Sjbxv3FUIUkycyJS1gDLzbVRGy3Ginas3DTFya7oNrfmUt
	Ng3+knpI2SBvY9FKlXtsgF3iag==
X-Google-Smtp-Source: APBJJlEq0uC7OWZ+6nYyMbSifB7fjfEM6gJvhiWUQN3f23VfZ00dVOJUMOBYDODSu4FG2ATfbt524w==
X-Received: by 2002:a05:6808:f11:b0:3a1:dd99:8158 with SMTP id m17-20020a0568080f1100b003a1dd998158mr23751679oiw.6.1691080412183;
        Thu, 03 Aug 2023 09:33:32 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id y5-20020a056870428500b001bb71264dccsm152929oah.8.2023.08.03.09.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 09:33:31 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com
Subject: [PATCH v4 09/10] RISC-V: KVM: Improve vector save/restore errors
Date: Thu,  3 Aug 2023 13:33:01 -0300
Message-ID: <20230803163302.445167-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803163302.445167-1-dbarboza@ventanamicro.com>
References: <20230803163302.445167-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_093334_477737_A293D660 
X-CRM114-Status: GOOD (  12.41  )
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

From: Andrew Jones <ajones@ventanamicro.com>

kvm_riscv_vcpu_(get/set)_reg_vector() now returns ENOENT if V is not
available, EINVAL if reg type is not of VECTOR type, and any error that
might be thrown by kvm_riscv_vcpu_vreg_addr().

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_vector.c | 60 ++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index edd2eecbddc2..39c5bceb4d1b 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -91,44 +91,44 @@ void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
 }
 #endif
 
-static void *kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
+static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
 				      unsigned long reg_num,
-				      size_t reg_size)
+				      size_t reg_size,
+				      void **reg_val)
 {
 	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
-	void *reg_val;
 	size_t vlenb = riscv_v_vsize / 32;
 
 	if (reg_num < KVM_REG_RISCV_VECTOR_REG(0)) {
 		if (reg_size != sizeof(unsigned long))
-			return NULL;
+			return -EINVAL;
 		switch (reg_num) {
 		case KVM_REG_RISCV_VECTOR_CSR_REG(vstart):
-			reg_val = &cntx->vector.vstart;
+			*reg_val = &cntx->vector.vstart;
 			break;
 		case KVM_REG_RISCV_VECTOR_CSR_REG(vl):
-			reg_val = &cntx->vector.vl;
+			*reg_val = &cntx->vector.vl;
 			break;
 		case KVM_REG_RISCV_VECTOR_CSR_REG(vtype):
-			reg_val = &cntx->vector.vtype;
+			*reg_val = &cntx->vector.vtype;
 			break;
 		case KVM_REG_RISCV_VECTOR_CSR_REG(vcsr):
-			reg_val = &cntx->vector.vcsr;
+			*reg_val = &cntx->vector.vcsr;
 			break;
 		case KVM_REG_RISCV_VECTOR_CSR_REG(datap):
 		default:
-			return NULL;
+			return -ENOENT;
 		}
 	} else if (reg_num <= KVM_REG_RISCV_VECTOR_REG(31)) {
 		if (reg_size != vlenb)
-			return NULL;
-		reg_val = cntx->vector.datap
+			return -EINVAL;
+		*reg_val = cntx->vector.datap
 			  + (reg_num - KVM_REG_RISCV_VECTOR_REG(0)) * vlenb;
 	} else {
-		return NULL;
+		return -ENOENT;
 	}
 
-	return reg_val;
+	return 0;
 }
 
 int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
@@ -141,17 +141,20 @@ int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
 					    KVM_REG_SIZE_MASK |
 					    rtype);
-	void *reg_val = NULL;
 	size_t reg_size = KVM_REG_SIZE(reg->id);
+	void *reg_val;
+	int rc;
 
-	if (rtype == KVM_REG_RISCV_VECTOR &&
-	    riscv_isa_extension_available(isa, v)) {
-		reg_val = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size);
-	}
-
-	if (!reg_val)
+	if (rtype != KVM_REG_RISCV_VECTOR)
 		return -EINVAL;
 
+	if (!riscv_isa_extension_available(isa, v))
+		return -ENOENT;
+
+	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_val);
+	if (rc)
+		return rc;
+
 	if (copy_to_user(uaddr, reg_val, reg_size))
 		return -EFAULT;
 
@@ -168,17 +171,20 @@ int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
 					    KVM_REG_SIZE_MASK |
 					    rtype);
-	void *reg_val = NULL;
 	size_t reg_size = KVM_REG_SIZE(reg->id);
+	void *reg_val;
+	int rc;
 
-	if (rtype == KVM_REG_RISCV_VECTOR &&
-	    riscv_isa_extension_available(isa, v)) {
-		reg_val = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size);
-	}
-
-	if (!reg_val)
+	if (rtype != KVM_REG_RISCV_VECTOR)
 		return -EINVAL;
 
+	if (!riscv_isa_extension_available(isa, v))
+		return -ENOENT;
+
+	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_val);
+	if (rc)
+		return rc;
+
 	if (copy_from_user(reg_val, uaddr, reg_size))
 		return -EFAULT;
 
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
