Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CB9FA3740
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 13:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3RpwdJz1FNf84foG3AZQ/6abHPU5KPfsYSkGvE+lB0=; b=SJJ4kc3qD21ud7
	m5z21WMIbLT8zD4wFaluRM/fPTYJ7T5J7buY1lzZ6DzD4qmYIssvSBp95yLbqCd1SxYgpE1+RGepf
	rn35ukgkPbxeo+aK7qwTfGPJUtZevV+PPjx16Gb2mVt/QHC4mf/zaVFhkT5pX/Zb7l6gX/X52aB9L
	RZxW/MGvs7stI8HvrKs0x/Xp0plFwFU0wAmFGoCbUiqOCmBFlDSbkd3mwQrtgLMM2hC+/QNtUKYPm
	/zHhojyGUsPMaE+T2fEMWKcOFQn33JpD5l0QQp5SAyixw2RsVrJNYCapHY7wmQf61WETKaVS8cTO3
	guTS7BMp2vXmmbSEY35A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2ZL-00DK8T-90; Thu, 27 Oct 2022 13:05:11 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2XI-00DJ4X-IL
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 13:03:06 +0000
Received: by mail-wr1-x433.google.com with SMTP id o4so2049024wrq.6
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 06:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obHF+5YDsySvdPBRcVj0srfYU63GXDl3O8xwcIRgRzw=;
        b=XEjt/ZvArDPmY4O3ubEf3FujxIx+hIRcqEDq9rTYRI9KTMRAuRngXTxCm3EVoXc/yN
         g0Fv4acWyGLzdWsbIVaf2fJu5cEFo0Kar0WYS5SbqUP8k4ygFRculFyTlwiQ45mwSHy/
         ZbzKEw3RPP5c0g3DVgSOjnOwELOkg11dT+Gru8oWW5P2MBtieV1vZ6ppDGbilq8LzLy2
         kO8iY1j0Dvovbex6DXyP7v2fhh/r22aSobVWXo7ETdQj0dHQ3NVLkdGG3iXU4plFpJoT
         MosssL5GjYPK6DAVPCGNwo4NNvrS2Bcz0oI13Yp0jUXSkDFyBdiuDda5kJaeZQWiaYqE
         uK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obHF+5YDsySvdPBRcVj0srfYU63GXDl3O8xwcIRgRzw=;
        b=jRelK+pm3Bi2HHk7/o64hSkqa7KwHE2Vj0bxkeuJIZHn8AGqAlZTYUoM7GOSiqd9Mi
         mzjlJGmCpqTXyP7RHrRuXUJRXqLPy0CMPiumWR6Zp+YDJprVQa/mvxse9aWZFrCcR70p
         iNqjKMnwzNticZd8uYp+VHMj0eP2vU0fz2amxYPemQgztnKMpU1+OQte5lFKXTv15kcH
         ASDgtaItqCEYCMjzfYndkF5YA0Zd8sIuEkwEzrjKZItvszTiQGdd5N/IjRksqx8HMY1O
         54wPbdhs9qiKdAOjk4gz+NmJ20uvREgnIXDznjVTgtUqr6PowpmWq7euwiSmwXHnejr4
         UdFg==
X-Gm-Message-State: ACrzQf1NzkJjOVtYS9mPXhUMQi66MsBZcWx599UOOPoanB4Efcmu8VSM
	RWCMGNkwrFAzCjvcjMe5V32POogVdFjYcQ==
X-Google-Smtp-Source: AMsMyM7eLuv8Ea9bPqNxCBUDLH2ursMZDlUftRfPXYQUA+OGiuSj1yFkGbXboPh33UxYspEn7WiHOA==
X-Received: by 2002:adf:e446:0:b0:236:773b:c6f0 with SMTP id t6-20020adfe446000000b00236773bc6f0mr12575244wrm.55.1666875780398;
        Thu, 27 Oct 2022 06:03:00 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id j21-20020a05600c42d500b003b492753826sm1399176wme.43.2022.10.27.06.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 06:03:00 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH 6/9] RISC-V: KVM: Expose Zicboz to the guest
Date: Thu, 27 Oct 2022 15:02:44 +0200
Message-Id: <20221027130247.31634-7-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027130247.31634-1-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_060304_640682_915D9F4A 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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

Guests may use the cbo.zero instruction when the CPU has the Zicboz
extension and the hypervisor sets henvcfg.CBZE.

Add Zicboz support for KVM guests which may be enabled and
disabled from KVM userspace using the ISA extension ONE_REG API.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 4bbf55cb2b70..8dc21ceee7aa 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -103,6 +103,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_SVINVAL,
 	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
 	KVM_RISCV_ISA_EXT_ZICBOM,
+	KVM_RISCV_ISA_EXT_ZICBOZ,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 18a739070b51..7758faec590a 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -62,6 +62,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SVPBMT),
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 	KVM_ISA_EXT_ARR(ZICBOM),
+	KVM_ISA_EXT_ARR(ZICBOZ),
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
@@ -821,6 +822,9 @@ static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
 	if (riscv_isa_extension_available(isa, ZICBOM))
 		henvcfg |= (ENVCFG_CBIE | ENVCFG_CBCFE);
 
+	if (riscv_isa_extension_available(isa, ZICBOZ))
+		henvcfg |= ENVCFG_CBZE;
+
 	csr_write(CSR_HENVCFG, henvcfg);
 #ifdef CONFIG_32BIT
 	csr_write(CSR_HENVCFGH, henvcfg >> 32);
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
