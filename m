Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1F8EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nj/x6yp85SEMlaoDuYKVe/hw80lM6ouxAmUuJeiABLs=; b=QW5N+2cs5686jD
	xuBkhjY2NJUEk3gDAtRX+gMejPRhvn72e2Ee1DnE5h2UrmDTBx8J8DXYbqaktiyvrFi3mZdX8gaVx
	TRsFcZloa+u4lTUJfY6Azkg2f+tSBLaHNGDTfcHJGnOCNVTD4E0Vm2I+U8cwSQuk/MymAfuQ6+KEU
	MhIb5E5hyIKOhKm3VNKFcrg6iaI3Fb1Yv5CVtYBgCWdv3m6DOmzalGM9qDOWjc8nmLBuHwiyLWO1B
	PXUcwkb1R1NYAzHt0zseTS4c2veTex6N5Q23jFOdy9dNk9eMEvh+vWvXlEQRHfgONJrqTRz8zC3AJ
	DHRG5ZUTeutXeSJXSS4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9ew-0083Qt-1s;
	Wed, 19 Jul 2023 16:04:14 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9eu-0083PC-08
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 16:04:13 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-666eec46206so7054237b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 09:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689782651; x=1692374651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGBsjC7R6pFZ8BRmiJjujTJrCojG0NvQ+VqCGQxFEb8=;
        b=pVVXmz//gIRMjpvjJmxVdSJ2+VWsdLuphUtZhp7qUR95DRgMAppJQ2fWxVz+dMaXYR
         DUK9ZyNlrF7+Pj6fRZcV2ruJSwtWa1iZzgIZa91MAhNZA0N/MgDmWZhQsUZN8YjYVGtC
         yzSSP5E1h3wK3Gk/CBZESwYZrW+5WiPI7avrGuc/ioH3TsTBvTjk/R92zhROED/X+CWB
         uVPayujX4ffJwxBk34FlU/e7CEvPeliyy4kxL7oHLSZEMtGEhdFNASaomn49ICg4g4kP
         uLTPaba3nryF+pZrvu1BPvvzhJ/ND0IPNZEKiHSIx0tp6OZI49L7Fw5FU4jPBqvniy/S
         V+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689782651; x=1692374651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGBsjC7R6pFZ8BRmiJjujTJrCojG0NvQ+VqCGQxFEb8=;
        b=PmaW9ysbgGa/2vbeggeWhKl7715Gf9CGirKMlzDIyxwULFJUXpyiv+O8FQPuyTF+qG
         dPBfV4/h/l1G7ZYgF9NFP4fcTscNwhwBZbDBwOdJ/d9raT7QbAnty08v8qfLdHn7sH2C
         GMdbZ9Px1pzxTMPEUk+mvEWcrgbqInwEqYgvkBop7klrA1qIra+cW3CpyqHCTHv1diqL
         RjRvyopMcmjtwBWWSdqWDuIvDf9aJK6cKBkT1ueWLBSLtZXa29C9cadCgQXi0ipGNPv9
         Uvu/0X9M9Mrv0G9qTM7RnmqWHgU25+bRDHe9dXUCmbITDFiUbU8pWNFp+0KM0HLpQJnc
         M5Vg==
X-Gm-Message-State: ABy/qLbM055mekgv8a5D/MEObOrDh3plNQnKCN1uNrFjxEiocjyI97Eu
	mVJqu2HBW/fR/9dCQ3t/+KNNCqPNOW40mIP0FOXuKg==
X-Google-Smtp-Source: APBJJlFrlbugSi+Ex5e2yWjifLQC3UCF6GLONAl/twAFTSZyj+j14Mdehi/k+BJ1Ht9kOhmGZxkPtw==
X-Received: by 2002:a05:6a20:385:b0:121:e573:3680 with SMTP id 5-20020a056a20038500b00121e5733680mr2536311pzt.62.1689782650920;
        Wed, 19 Jul 2023 09:04:10 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id i22-20020aa79096000000b00682936d04ccsm3447023pfa.180.2023.07.19.09.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 09:04:10 -0700 (PDT)
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
Subject: [PATCH v1 4/6] RISCV: KVM: Add senvcfg context save/restore
Date: Wed, 19 Jul 2023 21:33:14 +0530
Message-Id: <20230719160316.4048022-5-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719160316.4048022-1-mchitale@ventanamicro.com>
References: <20230719160316.4048022-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_090412_160209_7D7F5969 
X-CRM114-Status: GOOD (  12.03  )
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
