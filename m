Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4687EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 07:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nj/x6yp85SEMlaoDuYKVe/hw80lM6ouxAmUuJeiABLs=; b=j2li/gRL/4bWV0
	Gb1LuwdP8i0hDYVNfMnD2CD3A38QJBkc9bvBUGbuOY2TXywZ99fjirfQNmk9x3RAn5rXY2P/TgIR4
	bBJZ+Lebuo5LR97f57lYGWhJeixMs+VwvVhF8pQw9jxVZKirDBKXxe1SzGPf4RXOB/qPCEtRg7idh
	g006YByBKy4jMAm59xihRKhGMaqp3OGqpe8OUDUua2gEmrNCwmq2w6vy4Eme4Gk8+wK5lIay6PdRh
	AOBIWXldrPEEjJJC2Un7tx5AMmE/AIBnQMaqVfFntFhf/wnteT9wyEAo71FEjQz3a6QaGQJn2/PrH
	TI9czW9qgPEaPmlmY4gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkyh-00DGEG-1b;
	Fri, 21 Jul 2023 07:55:07 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkyd-00DG94-1s
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 07:55:05 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b8b318c5cfso12301955ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 00:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689926101; x=1690530901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGBsjC7R6pFZ8BRmiJjujTJrCojG0NvQ+VqCGQxFEb8=;
        b=RnYza+kyjQyxCAyVAxBY2RUUF67emk/2HKI8+NDy6jj2xeuaEPS9N1UlbFyXkJD9WZ
         E9LJhQllA1750VprhrUF8OCOg73OmalUAiO1IntMWESCZj5dKA/FAOaea17Eu2Gr8kPm
         yptUsaSa5f4oWu8ffMDgrDMRWtTN+BLVdKMrawVN37ETioRCKGLProts2wF08p/Bd3sf
         fLJJKTzZsyD8R3A7j9jfys6Xq2hHF08XZu+N+fdHDtM9YF9F65gfBSpe6xcbiDFDMb7Z
         KF81zKoI5GbkU+UovILz7A349OhSdCNEUoAHR49KXcMTl7nz0AzfSZeMJWqlA9d2mvDi
         BhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689926101; x=1690530901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGBsjC7R6pFZ8BRmiJjujTJrCojG0NvQ+VqCGQxFEb8=;
        b=jXiPinOebOKxZYHyDtiUjvyHCpifCmX649pAVnE5EK6MRbgz0Unbaa33X5hHMkJtBO
         0/cze1cmGNr026zOnQbaHSsphtDyZMRFBJbVYDPLj8ksLF1N8ieOqdyh8+9/fT/ZbbxQ
         A89FOD+H6ZHWvpv3WxrrZRAsP0eXKVSleR+vqthRg8LBAcdjqVN0tibVn6wNb/dS756D
         vv3w8ee75lfL9ZUGP4BkhdzemTM6ucPT5tqDUWeZAqHQB2pKUxERLY8lXs2ku3V1rT90
         6EKOvgKv9BAbUGvJ7qqXhe0nB9992dYf0rha9LJECbrHf7TCE/qzzfpb0s/ciLf95g6b
         UUhA==
X-Gm-Message-State: ABy/qLb97qfNHcO5Ld//9LuYsxcn2bbtwcgaywzQynY2sIyE2wIyPaKH
	UzV76zsl5cXVvHjeLOAZkHmrZQ==
X-Google-Smtp-Source: APBJJlFskkMmdMiIC4jkpeNR1u8Qiu0tCLX7ktYilZ+2f4tbI5hilxVC5cF1N9Od4zXXQvpmRPpT9g==
X-Received: by 2002:a17:90a:77cc:b0:25b:ea12:a2f5 with SMTP id e12-20020a17090a77cc00b0025bea12a2f5mr810046pjs.35.1689926101134;
        Fri, 21 Jul 2023 00:55:01 -0700 (PDT)
Received: from mchitale-vm.. ([117.99.250.48])
        by smtp.googlemail.com with ESMTPSA id gw15-20020a17090b0a4f00b00267bb769652sm2026354pjb.6.2023.07.21.00.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 00:55:00 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 4/6] RISCV: KVM: Add senvcfg context save/restore
Date: Fri, 21 Jul 2023 13:24:37 +0530
Message-Id: <20230721075439.454473-5-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721075439.454473-1-mchitale@ventanamicro.com>
References: <20230721075439.454473-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_005503_628322_02746C6A 
X-CRM114-Status: GOOD (  11.63  )
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
---
 arch/riscv/include/asm/csr.h      | 1 +
 arch/riscv/include/asm/kvm_host.h | 2 ++
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 4 ++++
 4 files changed, 8 insertions(+)

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
index d3166b676430..37f1ed70d782 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -1138,10 +1138,14 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
  */
 static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
 {
+	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+
+	vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
 	guest_state_enter_irqoff();
 	__kvm_riscv_switch_to(&vcpu->arch);
 	vcpu->arch.last_exit_cpu = vcpu->cpu;
 	guest_state_exit_irqoff();
+	csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
 }
 
 int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
