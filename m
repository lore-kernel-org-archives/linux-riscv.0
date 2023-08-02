Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BD4C001DE
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 09:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBjLdi0ie7YrWSTXL5+1NhOQggjY4DmkWrluQgnhvOA=; b=cZzjZbynbkFIa4IBGzPn3FMxSR
	0UMrPbUsem6vZ8KsueoBCfP1qsehnAVo6bcbxz1aP0Kmbnt0J6TnUx5tqoJhvA7SQTgBWAvSZKJtk
	FbRGb6BBHY57eQ8TMW/2lUM3fdzbun3e/0McYZi4JRsJCMVDJAuc5EalCVx5zpavx/dTcVmr7SH2P
	hbnRA2liME2qHH7Vjtv7zacrqANq/1y1YZgVO9VzuTakzrm9ofW/h+gpsevbwMsdMUhmyd+sSMVqg
	JVsyGZBamVAq/P/lgYOVF0FLYIIN0XPEGf3Jbzy7+IaWHKuUPb7OEYxAjV6/Jk1KH7+9tykRjFpf1
	88xmmMaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR7mR-004R6z-34;
	Wed, 02 Aug 2023 09:04:31 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR7mN-004R5t-33
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 09:04:29 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51d95aed33aso8721143a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 02:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690967065; x=1691571865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ouPK2KJi67vZ4+DazLQNIekPlY+Em6WKOY3ll8nIJTo=;
        b=avRoIvITiCXaNDk1V0Q8ow5ADNYjeOQ/Y78OYvsXOLXA93mYhtTLx+lPqw+ZBHEIk7
         6Qgh4SnghY7kb0rBhiwJGsmS1CQM0YJZIwAmVzP9thskxv/vu0MlS8auA+RAj9bPW3AK
         hOULmqVdness1Evx1Ap6XmvAPljldPmiIyV4C37kdci+DPXYuD7JgwjXRot0B8RHoeFP
         8x1DU3Wbt85sC0a0wTmJ8WgWBHckAWMDNIn/bZ/PLSRIjXns/Qp8AoCRg1+smbEk54+j
         ZVbXg0MDcCYvq5fo/2vhEdgH+me6QDtAhFiRy+YgeATAnmnJMmKYfR7/G8Fk1ertz5Gf
         Wr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690967065; x=1691571865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouPK2KJi67vZ4+DazLQNIekPlY+Em6WKOY3ll8nIJTo=;
        b=fEZYZJi4NQmN+Gbsx2uErJ/uz4+s/LkURKu6MpPxcdHl72pA3yt49u7TC4/ekjvWMe
         9OR7E4yyFBGkX8B+2kXG6h4EbJldNg27NLNoaPdV8XF92r7YNBtBNsGaWdqCIFzIgsul
         DNWoust408Mj0+JnCSu6lZUgaYBRemkCN7rAXpR6EvoDXCnLEqtCv01WJa1inlIXLpG7
         mCIwdwjr7nMDuMwzIjtqYD6FwmhGgHZbADP7hSAZhEfHLPHcG7aKuKifOu3V84fg2USn
         A9YJ8m04eV1YMNXk743odZ7/XJdTJ3bwQGClxYjl8jyEtutHjlRnnpEOYaaXt1Q1tnl3
         Ov3w==
X-Gm-Message-State: ABy/qLZUwp4CAb2VHwDXYMg9wdGDs5YMLEPARU6bmZfq2H3HzjFY5nKM
	jF3Zgg5qleXMSPusB3uVgDbGeQ==
X-Google-Smtp-Source: APBJJlGQchtF2nEzUyzuxibZJ09Ooz5deEtspRMuzg6Fizy0i+L0zWRLZBxu3ArgSWn2Kdd+golNLA==
X-Received: by 2002:a50:fa8d:0:b0:522:38cb:d8cb with SMTP id w13-20020a50fa8d000000b0052238cbd8cbmr4052708edr.20.1690967065461;
        Wed, 02 Aug 2023 02:04:25 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
        by smtp.gmail.com with ESMTPSA id ba4-20020a0564021ac400b00522572f323dsm8110660edb.16.2023.08.02.02.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 02:04:24 -0700 (PDT)
Date: Wed, 2 Aug 2023 12:04:22 +0300
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, anup@brainfault.org, atishp@atishpatra.org
Subject: Re: [PATCH v2 0/9] RISC-V: KVM: change get_reg/set_reg error codes
Message-ID: <20230802-c76d712d088bc4b3057e3095@orel>
References: <20230801222629.210929-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="yl3c3zcid6wp62ty"
Content-Disposition: inline
In-Reply-To: <20230801222629.210929-1-dbarboza@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_020428_009333_B536C6FE 
X-CRM114-Status: GOOD (  30.62  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--yl3c3zcid6wp62ty
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 01, 2023 at 07:26:20PM -0300, Daniel Henrique Barboza wrote:
> Hi,
> 
> In this new version 3 new patches (6, 7, 8) were added by Andrew's
> request during the v1 review.
> 
> We're now avoiding throwing an -EBUSY error if a reg write is done after
> the vcpu started spinning if the value being written is the same as KVM
> already uses. This follows the design choice made in patch 3, allowing
> for userspace 'lazy write' of registers.
> 
> I decided to add 3 patches instead of one because the no-op check made
> in patches 6 and 8 aren't just a matter of doing reg_val = host_val.
> They can be squashed in a single patch if required.
> 
> Please check the version 1 cover-letter [1] for the motivation behind
> this work. Patches were based on top of riscv_kvm_queue.
> 
> Changes from v1:
> - patches 6,7, 8 (new):
>   - make reg writes a no-op, regardless of vcpu->arch.ran_atleast_once
>     state, if the value being written is the same as the host
> - v1 link: https://lore.kernel.org/kvm/20230731120420.91007-1-dbarboza@ventanamicro.com/
> 
> [1] https://lore.kernel.org/kvm/20230731120420.91007-1-dbarboza@ventanamicro.com/
>

I found three missing conversions, which are in the diff below. Also, I
saw that the vector registers were lacking good error returns, so I reworked
that and attached a completely (not even compile) tested patch for them.
Please work that patch into this series.

Thanks,
drew

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index c88b0c7f7f01..6ca90c04ba61 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -506,7 +506,7 @@ static int riscv_vcpu_get_isa_ext_multi(struct kvm_vcpu *vcpu,
        unsigned long i, ext_id, ext_val;

        if (reg_num > KVM_REG_RISCV_ISA_MULTI_REG_LAST)
-               return -EINVAL;
+               return -ENOENT;

        for (i = 0; i < BITS_PER_LONG; i++) {
                ext_id = i + reg_num * BITS_PER_LONG;
@@ -529,7 +529,7 @@ static int riscv_vcpu_set_isa_ext_multi(struct kvm_vcpu *vcpu,
        unsigned long i, ext_id;

        if (reg_num > KVM_REG_RISCV_ISA_MULTI_REG_LAST)
-               return -EINVAL;
+               return -ENOENT;

        for_each_set_bit(i, &reg_val, BITS_PER_LONG) {
                ext_id = i + reg_num * BITS_PER_LONG;
@@ -644,7 +644,7 @@ int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
                break;
        }

-       return -EINVAL;
+       return -ENOENT;
 }

 int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,


--yl3c3zcid6wp62ty
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="vec-errno.patch"

From b1472501677ea6bd73689e0f947149f5f86da9cc Mon Sep 17 00:00:00 2001
From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 2 Aug 2023 11:52:04 +0300
Subject: [PATCH] riscv: KVM: Improve vector save/restore errors
Content-type: text/plain

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


--yl3c3zcid6wp62ty
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--yl3c3zcid6wp62ty--

