Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A26BC0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 08:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OeilCiCnwXox9a/imztxggwB4eE7CkghtZGgyxzXCRI=; b=rdFyQ/+IbcMYco
	76dVPM/27Q2a4PdtaMB67dBmjhF7MlvL+R1Fch8E+8Oab02bX/fQXkwR7nOGBpdWVXY3TSvDzF62x
	MtZ1wlP5vjbQwcarf/ppecxlLcsd6XG8/OwHyDOlq7ArFPN/zDVbIgcQt6hKPyxlVp88nD/B/gTDg
	v0MSe5MMQ37lqbqhx3sClMdcvAGpADL65IsDS28D7UtBIU+BE9pOu3F4pacpXeYkCTkgtJp4M4OMJ
	tmPspx26mkCKzYEKZjsP2TsrLuuvCJ5zEUKb4GW5k50TZTqTCCPeqf0cPt7BR9d8LdN5y/3ikB0Hd
	f1bwSS5hh7QXHwvBIajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOa8H-009cEr-1T;
	Wed, 26 Jul 2023 08:44:33 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOa8D-009cCh-1H
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 08:44:31 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b9e9765f2cso34265085ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jul 2023 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690361069; x=1690965869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xkwt55ASzalurZDhelB085cYknOoaxiIqUh90s6et6s=;
        b=eG630qlQB7KXIlEHP1M7zhLY6CuIH2iNku217voDlUNi4pBNWZwHDFYX3sq2PtfjGW
         GrZ8BIeEsbR7+gZdEwo6KiBr2w64+E1sr+f400qWzSiRL75idQbOMMYQeGrUqwa9TLAo
         ZEsL1FP43CCXvd1cB8txpwcibQabdlBKIeIkOFXAXa4mJQDnvYCso4xQpb/ZphCYcx8R
         x2LeDRSMb8Yf44ZfvmWKqlhPY3ugrDLp2Bu/WaEkM6Lo4BfuOplbgXMjuzKwBlFbscYn
         5jL2+8466PpVe9n7u12pa571CH+zGwpiek1m/cdzK4L0wXdVz3yqRE+VZeDzXAErTxsX
         +i+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690361069; x=1690965869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xkwt55ASzalurZDhelB085cYknOoaxiIqUh90s6et6s=;
        b=FYuCQfuvCobsxXDdgDzS76De2TN0LwAeI++qKodHDM+mzZfr3WHcsk4aM+VYTcdgeQ
         9vfu7y7shTXa5lT4Zszy+Uzrud5xJHbFp5BDaXeRXza03sA3lRu7g/druTV0MHal0kAu
         b3GL65IhkYfA5Ho3dqZgghXB4rHb3B2IGPVE3UWRA62h9vE1qiWSq8cNt0LKgQMsBmd1
         +pEUqHgNK5iSpsqjVPFNhkeP+ooPMVZ2KtJ7ax080+x4U1KFaIKyJW1r+dnE7lnUxIRE
         fqTQQCDLO9ij9TBxHlA6OjlzhYSI8izrF+TboEhcfxAYoGXnSkEqJFXmA+3sPq87kwiQ
         V1tw==
X-Gm-Message-State: ABy/qLbwMi6VFn3Crg6kCha7DQQk/htTeLC83zgubQDINY20zOMGbgZ9
	liI4zzx6PdVWATGTldgvkCZtUA==
X-Google-Smtp-Source: APBJJlE3K7rG2ZbmVz2XlDZyVkQYtuoWgWvqT+MC5/m/wIva7uAAwsTNT0Zp52al8a0wgpSLotCZPA==
X-Received: by 2002:a17:903:50e:b0:1b8:50ae:557 with SMTP id jn14-20020a170903050e00b001b850ae0557mr977806plb.36.1690361068391;
        Wed, 26 Jul 2023 01:44:28 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id y19-20020a170902ed5300b001b3bf8001a9sm3978637plb.48.2023.07.26.01.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 01:44:28 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v4 5/7] RISCV: KVM: Add senvcfg context save/restore
Date: Wed, 26 Jul 2023 14:13:50 +0530
Message-Id: <20230726084352.2136377-6-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726084352.2136377-1-mchitale@ventanamicro.com>
References: <20230726084352.2136377-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_014429_826089_293D1EF9 
X-CRM114-Status: GOOD (  12.49  )
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

Add senvcfg context save/restore for guest VCPUs and also add it to the
ONE_REG interface to allow its access from user space.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/csr.h      |  1 +
 arch/riscv/include/asm/kvm_host.h |  2 ++
 arch/riscv/include/uapi/asm/kvm.h |  1 +
 arch/riscv/kvm/vcpu.c             | 16 ++++++++++++++++
 4 files changed, 20 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 38730677dcd5..b52270278733 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -285,6 +285,7 @@
 #define CSR_SIE			0x104
 #define CSR_STVEC		0x105
 #define CSR_SCOUNTEREN		0x106
+#define CSR_SENVCFG		0x10a
 #define CSR_SSCRATCH		0x140
 #define CSR_SEPC		0x141
 #define CSR_SCAUSE		0x142
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index d00b61620f54..53d1c7e1eea4 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -162,6 +162,7 @@ struct kvm_vcpu_csr {
 	unsigned long hvip;
 	unsigned long vsatp;
 	unsigned long scounteren;
+	unsigned long senvcfg;
 };
 
 struct kvm_vcpu_config {
@@ -188,6 +189,7 @@ struct kvm_vcpu_arch {
 	unsigned long host_sscratch;
 	unsigned long host_stvec;
 	unsigned long host_scounteren;
+	unsigned long host_senvcfg;
 
 	/* CPU context of Host */
 	struct kvm_cpu_context host_context;
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index dc185e7875ce..7a43d08c3eed 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -79,6 +79,7 @@ struct kvm_riscv_csr {
 	unsigned long sip;
 	unsigned long satp;
 	unsigned long scounteren;
+	unsigned long senvcfg;
 };
 
 /* AIA CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 7ce250087aed..0f4f0d6032cc 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -601,6 +601,20 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_aia_update_hvip(vcpu);
 }
 
+static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+
+	vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
+}
+
+static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+
+	csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
+}
+
 /*
  * Actually run the vCPU, entering an RCU extended quiescent state (EQS) while
  * the vCPU is running.
@@ -610,10 +624,12 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
  */
 static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
 {
+	kvm_riscv_vcpu_swap_in_guest_state(vcpu);
 	guest_state_enter_irqoff();
 	__kvm_riscv_switch_to(&vcpu->arch);
 	vcpu->arch.last_exit_cpu = vcpu->cpu;
 	guest_state_exit_irqoff();
+	kvm_riscv_vcpu_swap_in_host_state(vcpu);
 }
 
 int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
