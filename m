Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E87CC001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 14:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8BDoAcYcFl9yINZaVzLEMNFSiMcER9nGVh/Ty0ZxrI=; b=MG67yW+bLpeS8f
	4rjLMU6wWikoxifvlF2QVj+S4bUfKymI8LBrfxrzAl576f1eVa5W8TLf/Zcf6AkXKriUGwWRHENQ5
	8Bot/OuoZZJaIunkR5XUEUxA58WEKGD3bKFQ1VUdJtg4pS9lxQu7sDSS05m8/fVUl6UVakVJKBT4Y
	SZBQTinmU/C5OBivYiOtlWUpe6etxtyfJH5xk6xQfKuLHqnVb7ai0PcMzidF9P9zcmyAWgEeWUb8K
	XquQCJHolZ9dMSUWPmUIAfw3qvIr3dqcBjwA+B9Jck+r9xHL+Esj69IJ3tHhyoszfcsIVuVfFjldR
	zYGFGLL/lLCCvEO9OZeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwR0-004ajX-0m;
	Mon, 24 Jul 2023 14:21:14 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwQx-004ahn-26
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 14:21:13 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bb81809ca8so17845515ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690208471; x=1690813271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWBcboB8FAg6vBr25GMQxT+1AebhzKVOh/ZnCapT0AM=;
        b=GwCKeAuwMXS6oAjq/vrTYy+q9hMY7Sgf2HRFtNraIw3ybHmiZoXVC3nrk8MRWIsNLP
         O5eGN0u7oz+g/RQo5WgHKu0YspuojUGe+BoRVaT7bSw3f+ro/pbpfHUywDfmo1ZSpH8z
         0iAU1z9LfUepTFzWPjiZrIR+mA6t9pIliSHVwx5E6nfXGp9vkSZAGaU2Bv8+5wUVScew
         an4P4XHBQQxrIWkcgup6J1a7MbYLW2WnsYOKqC0y2QxvBXY1gsIJRj8ZxdpM2GnrGe++
         DGvHEOPIF0b2cewgGo8hoPmgQ72Kp5KqyncqT2WhLtU/a/nm3DAclGrOPJzuAhdSw4pj
         0otQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690208471; x=1690813271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWBcboB8FAg6vBr25GMQxT+1AebhzKVOh/ZnCapT0AM=;
        b=Pc4AbAaV0OOZ15bn29ltQR10n238MVqt27DqDcafMwvLJDQQhVcOnrafuqXDmk7AgK
         hzpZSjw3x8cTLKHou08Ktej5vaDCeYdPGV1u+xQ9vGxgkMk56Q+gGat7kU5VRAWpOqay
         eZd+doCyO5Ztu/qcSgU6Da2usQuIFOzSILprfFb6Hx97l0DpGgdwiy2TNge60oGWtXiT
         VyMLwuUSJKGjfDpHRyGLEDvbqVKstWlVtwVlyAJYG7GfDMaxdc4k+1oZYQY3M93f7NM+
         A8uBKmQsPiCMh/xRQLT6Q6WjX52CVtqxXSuiApCfSNBJYxPyCIGec5dPMiKI/SA/XlCX
         O4sw==
X-Gm-Message-State: ABy/qLbsCumNnq3kq9yEWQGzccYYahPsYpC2IRrfD8LqY9tidEUSE655
	gT8yDg2gEzmrdoZPq/0Jmz3LwQ==
X-Google-Smtp-Source: APBJJlF5Wc1/nlIL2etddXdNd4kj854cm697DfDflaN4tDLhlkCN8ioug7vmn37Pl6VoNQ2tctbFNQ==
X-Received: by 2002:a17:902:c945:b0:1b8:88c5:2d2f with SMTP id i5-20020a170902c94500b001b888c52d2fmr13294720pla.64.1690208471129;
        Mon, 24 Jul 2023 07:21:11 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id s10-20020a170902a50a00b001b8307c81c8sm9009821plq.121.2023.07.24.07.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 07:21:10 -0700 (PDT)
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
Subject: [PATCH v3 5/7] RISCV: KVM: Add senvcfg context save/restore
Date: Mon, 24 Jul 2023 19:50:31 +0530
Message-Id: <20230724142033.306538-6-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724142033.306538-1-mchitale@ventanamicro.com>
References: <20230724142033.306538-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_072111_691360_AFA7930F 
X-CRM114-Status: GOOD (  12.28  )
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
index ee55e5fc8b84..c3cc0cb39cf8 100644
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
index 7bc1634b0a89..74c7f42de29d 100644
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
index d3166b676430..5764d22efa29 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -1129,6 +1129,20 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
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
@@ -1138,10 +1152,12 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
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
