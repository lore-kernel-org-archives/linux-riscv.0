Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269A0EE01E3
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 16:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzJKXIrxhNFa3dQ70av1GpNzuNPJ/G/ESlV5xBK2690=; b=n6m3T1nm92S8/J
	85NEc7YdqgDnPDUgQ2iPqMzSaw7dypC3t17/HMsyGj5Kxn7JhaOIGtP1PijOJOq1ofzZud/8TyKij
	q6Zn6rG0AVXAtbHaqacDGVAe4Uc53jeOBVgPUQW91sIWuc3zW54tRpDR3GbcY+xUosYLCXuBelmDq
	nU+Br0FfmjnzOCF8+ajwCMFnE/kwvlXUf/Xf7U+xYOphgTp3nsGMoQjTj/UeELSkbhN4+wJLz6CzT
	hlJqNasvC6fwNv/110GSTt/+kmaWonWfMmXxNT+A0918gkiJ5SKuWU+SoS+mV2my72fzCrivMzHuc
	StCqSWKhpsp9HsoUuMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSwu-006OqL-1B;
	Wed, 13 Sep 2023 16:42:44 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSuL-006Lpl-3B
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 16:40:11 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c364fb8a4cso63979635ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 09:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694623204; x=1695228004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpDGxdAkaTix/lMebh/AJw7X+2Z+zb9n7VJIfbFHEeU=;
        b=k8zm3adGra9C+jAPhnvoCeWGG2XkfBHX1/EeZOslYWbz4+0Cog2A0I6YWyl7Z1OwKt
         FFwB/Q67S+mSjzda5GtftI4ghYQwLg8tDFPD0z5pf7xdYBcvbIcjGEYJoUYceaUwv6Sa
         ad+DI1Ia9IZfFJk5mB+BTZFGehvIn+LAv/vAveOiuN8kLljuqOLraa5k2nLdMpK3jJjg
         rsmaxlBMuKh1ICKpzONUCLsrN8Pk0zL99/TAurRNxUGbFMVHwKqZmn9QWm5S5O2jPB2G
         Y/uHwRk4LYXv8o/Cpq7lM0vnrC97qSl+K8tC3WzBveA/7b4FHM8fNkKwC/PMAL+uO3U8
         UqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694623204; x=1695228004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpDGxdAkaTix/lMebh/AJw7X+2Z+zb9n7VJIfbFHEeU=;
        b=N+yZVWJ/d88F16PWP9CXwzr+cRTzK6is3RNY0CL5S4+ekZgfLwDTNKCDMeuEX83VjN
         369dhyjpSmiXJEiHQhfinol8CaSvi2rg/r3z/LUP3dlCHnRPnlAyCRXaMO/JdazgNeMz
         GPj8kb8rIbyjFHRCShWbm/08+WEMo+0tfbYnFb6KSI6NIaZMoqijNeYhE7Sx86HapcO7
         Kh9DQs6cpkuuFwH1SrQHvGcgN8I0shXuti/K5KqK8u+UkpKMJ145/+UNok+R2WqfZ1TX
         8GL2JTDhwbwV8w1C1F0BuE7O/GmvESPbTZxGJ7xPuyqziE8riJTXKwOojH/nUJEVlBNn
         GR5w==
X-Gm-Message-State: AOJu0Yzutb14P+hPoB1TdyeHPSHHFOVuYsgbOmum6hwY/9VsaVLe4PX1
	nt8LY+DAyOSpf0N9jV7ldUa4jiqjBCOYMIkga1CvkA==
X-Google-Smtp-Source: AGHT+IGA1WOJYLDGQUomcSSw3guS1RSAiU4giKEeopu9k/Z85Fhy1fzcPdSwpomLBiS1MCh86s+LfA==
X-Received: by 2002:a17:902:e84e:b0:1ab:11c8:777a with SMTP id t14-20020a170902e84e00b001ab11c8777amr4237227plg.13.1694623204096;
        Wed, 13 Sep 2023 09:40:04 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id je15-20020a170903264f00b001b243a20f26sm10577756plb.273.2023.09.13.09.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 09:40:03 -0700 (PDT)
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
Subject: [PATCH v5 5/7] RISCV: KVM: Add senvcfg context save/restore
Date: Wed, 13 Sep 2023 22:09:03 +0530
Message-Id: <20230913163905.480819-6-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913163905.480819-1-mchitale@ventanamicro.com>
References: <20230913163905.480819-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_094006_145103_CC27BFD0 
X-CRM114-Status: GOOD (  12.27  )
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
index 5717004d80fb..65b871dbf7e8 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -287,6 +287,7 @@
 #define CSR_SIE			0x104
 #define CSR_STVEC		0x105
 #define CSR_SCOUNTEREN		0x106
+#define CSR_SENVCFG		0x10a
 #define CSR_SSCRATCH		0x140
 #define CSR_SEPC		0x141
 #define CSR_SCAUSE		0x142
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 50f3d6393d50..1980be6a3e79 100644
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
index 12c17656c156..c161791f55cb 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -80,6 +80,7 @@ struct kvm_riscv_csr {
 	unsigned long sip;
 	unsigned long satp;
 	unsigned long scounteren;
+	unsigned long senvcfg;
 };
 
 /* AIA CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 417e257e05e1..3013ae30c3af 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -619,6 +619,20 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
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
@@ -628,10 +642,12 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
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
