Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9FFC3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IULoMU62cUr9xVkiBCpCQN39qF9ZEi/2E/An37AQr4o=; b=MYl2hpABD5t5QY
	iZYfHpOPwI3ipO38NwoNe5GcaV33KlFzo67RlQ1qweDDUjg32v2aSqblDDbYOXgUU5MY6RT1CRMiI
	WJquLKUbA6oJR44mbAQf8SNScbEVoELXDO3DvIUWXRsXmtCmZLO7kslsGkaYkPa7iO/ZL9Zc+5Cpk
	xj8+g1dgdl96O6BbnsG6bI+M8uoMWEKMVU3EmEIl7w4pec0OqI8hHLXrYioO3pFd9SIvazfwBsAtv
	IWKv6so2y7qmMhgT6K2Wzwe79A0n0iXUMww3+7EMva1hfWkEpH5sATHRN0MXbrM5mhNRK0vmqoG5+
	/v/7SeTjMQMQbZZn7Fuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqBQ-00000003BhA-33V7;
	Fri, 19 Jul 2024 16:10:12 +0000
Received: from mail-pl1-f173.google.com ([209.85.214.173])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqBF-00000003BWX-47Jj
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:10:05 +0000
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fd70ba6a15so2630425ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721405400; x=1722010200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtNFL5zw6IBLLvkGdXCYkboBqItL+86jnTgFrfDdkSg=;
        b=nkPlPS5nsTabTmySHy2/cC7qk6i7Zvq3gAYxKEkvDiHmNWnML4s6SmfCt5UGnzfJ57
         36K1UzV27hYXuQiDgmTi0fWG8xM8Gh0gONnA0VTif9hNFHoSZMEoPMyyUByxSzk741Nr
         qt6KD3cHXUABRrOe3ESVNyXVhrx8MeV6vS6mKEagCsxRtYe2XwlmBnCn/qvNLXUsjkfT
         8h52t0MXp0h4puex8hqqBriUkddy9i+OOSW7xKYFVOddVu2H3UvkuODMiIuTop5G/Zfv
         9AgkldpNGSGoCdTfWByvO4/PCcVSjnDfMVCDDsWnwMzp3MrZ11spsCONg9jhYB/8tIbw
         bZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405400; x=1722010200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtNFL5zw6IBLLvkGdXCYkboBqItL+86jnTgFrfDdkSg=;
        b=Z5lqxWhILFlHwPa2MmE83TTRs5MERt7xpGxCb1xzkyCpOHUC/kCYL7bfXToRNhUs8Q
         ubNlWepYspopgweV1Jnl6NHFEnrZrmQ4UdvtjquXSK8Sgztr5S4b20YnylyoFQLDb+IC
         FJ5PxP+UjWsLJn7Ok1jdKLIw2oYqpcJ+meu3hYpoLWZOCyO7pWFjFBxTwpgECMQeQxpy
         3vFZUcYm+h5/8G09qeyYk+rGO1XYR2odQPpPJ+3qkZBpzG5OavnFB25WTa9DjG/OebOb
         akNZOx/fYzaTPywrA7psQaGWL0/a7vW1BTa733OnU2Nirz9QQ2uIDi1txRYoeMOFGVjG
         ILkA==
X-Forwarded-Encrypted: i=1; AJvYcCXGnC+CQENGt4kxU5x1Yp+GMmKoLVEtLyWh6TmUiVHzFgUPPaXJPOLPimozUaaHkKfQ9cGnLhePcf3uOVvV+lVVJfWGoHNBjP9V6Jv2nES9
X-Gm-Message-State: AOJu0YzH1yX38ao/pNLZ6/U1I86d48NJjpI/g9gbwgPUxsBQgSjZawW2
	M1qybtuyQoScI8CkOrbZ5Srljj8nkQh1sT+pBlfAVC0P6QiyiaH3q/7mgrjclMo=
X-Google-Smtp-Source: AGHT+IE6FYkmm8DMa+wcmCi2mhwqT2Wr9Wnby8aQ4da6gYfYdk6hWAZmI/41ReZ874E3E8C4iOimbQ==
X-Received: by 2002:a17:902:fd48:b0:1fb:74b3:53d5 with SMTP id d9443c01a7336-1fd7457c7dcmr2679895ad.35.1721405399762;
        Fri, 19 Jul 2024 09:09:59 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([223.185.135.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f28f518sm6632615ad.69.2024.07.19.09.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:09:59 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 10/13] RISC-V: KVM: Use nacl_csr_xyz() for accessing AIA CSRs
Date: Fri, 19 Jul 2024 21:39:10 +0530
Message-Id: <20240719160913.342027-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719160913.342027-1-apatel@ventanamicro.com>
References: <20240719160913.342027-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_091002_706464_4B969758 
X-CRM114-Status: GOOD (  13.02  )
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

When running under some other hypervisor, prefer nacl_csr_xyz()
for accessing AIA CSRs in the run-loop. This makes CSR access
faster whenever SBI nested acceleration is available.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/aia.c | 97 ++++++++++++++++++++++++++++----------------
 1 file changed, 63 insertions(+), 34 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 8ffae0330c89..dcced4db7fe8 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -16,6 +16,7 @@
 #include <linux/percpu.h>
 #include <linux/spinlock.h>
 #include <asm/cpufeature.h>
+#include <asm/kvm_nacl.h>
 
 struct aia_hgei_control {
 	raw_spinlock_t lock;
@@ -88,7 +89,7 @@ void kvm_riscv_vcpu_aia_sync_interrupts(struct kvm_vcpu *vcpu)
 	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
 
 	if (kvm_riscv_aia_available())
-		csr->vsieh = csr_read(CSR_VSIEH);
+		csr->vsieh = ncsr_read(CSR_VSIEH);
 }
 #endif
 
@@ -115,7 +116,7 @@ bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
 
 	hgei = aia_find_hgei(vcpu);
 	if (hgei > 0)
-		return !!(csr_read(CSR_HGEIP) & BIT(hgei));
+		return !!(ncsr_read(CSR_HGEIP) & BIT(hgei));
 
 	return false;
 }
@@ -128,45 +129,73 @@ void kvm_riscv_vcpu_aia_update_hvip(struct kvm_vcpu *vcpu)
 		return;
 
 #ifdef CONFIG_32BIT
-	csr_write(CSR_HVIPH, vcpu->arch.aia_context.guest_csr.hviph);
+	ncsr_write(CSR_HVIPH, vcpu->arch.aia_context.guest_csr.hviph);
 #endif
-	csr_write(CSR_HVICTL, aia_hvictl_value(!!(csr->hvip & BIT(IRQ_VS_EXT))));
+	ncsr_write(CSR_HVICTL, aia_hvictl_value(!!(csr->hvip & BIT(IRQ_VS_EXT))));
 }
 
 void kvm_riscv_vcpu_aia_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
+	void *nsh;
 
 	if (!kvm_riscv_aia_available())
 		return;
 
-	csr_write(CSR_VSISELECT, csr->vsiselect);
-	csr_write(CSR_HVIPRIO1, csr->hviprio1);
-	csr_write(CSR_HVIPRIO2, csr->hviprio2);
+	if (kvm_riscv_nacl_sync_csr_available()) {
+		nsh = nacl_shmem();
+		nacl_csr_write(nsh, CSR_VSISELECT, csr->vsiselect);
+		nacl_csr_write(nsh, CSR_HVIPRIO1, csr->hviprio1);
+		nacl_csr_write(nsh, CSR_HVIPRIO2, csr->hviprio2);
+#ifdef CONFIG_32BIT
+		nacl_csr_write(nsh, CSR_VSIEH, csr->vsieh);
+		nacl_csr_write(nsh, CSR_HVIPH, csr->hviph);
+		nacl_csr_write(nsh, CSR_HVIPRIO1H, csr->hviprio1h);
+		nacl_csr_write(nsh, CSR_HVIPRIO2H, csr->hviprio2h);
+#endif
+	} else {
+		csr_write(CSR_VSISELECT, csr->vsiselect);
+		csr_write(CSR_HVIPRIO1, csr->hviprio1);
+		csr_write(CSR_HVIPRIO2, csr->hviprio2);
 #ifdef CONFIG_32BIT
-	csr_write(CSR_VSIEH, csr->vsieh);
-	csr_write(CSR_HVIPH, csr->hviph);
-	csr_write(CSR_HVIPRIO1H, csr->hviprio1h);
-	csr_write(CSR_HVIPRIO2H, csr->hviprio2h);
+		csr_write(CSR_VSIEH, csr->vsieh);
+		csr_write(CSR_HVIPH, csr->hviph);
+		csr_write(CSR_HVIPRIO1H, csr->hviprio1h);
+		csr_write(CSR_HVIPRIO2H, csr->hviprio2h);
 #endif
+	}
 }
 
 void kvm_riscv_vcpu_aia_put(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
+	void *nsh;
 
 	if (!kvm_riscv_aia_available())
 		return;
 
-	csr->vsiselect = csr_read(CSR_VSISELECT);
-	csr->hviprio1 = csr_read(CSR_HVIPRIO1);
-	csr->hviprio2 = csr_read(CSR_HVIPRIO2);
+	if (kvm_riscv_nacl_available()) {
+		nsh = nacl_shmem();
+		csr->vsiselect = nacl_csr_read(nsh, CSR_VSISELECT);
+		csr->hviprio1 = nacl_csr_read(nsh, CSR_HVIPRIO1);
+		csr->hviprio2 = nacl_csr_read(nsh, CSR_HVIPRIO2);
 #ifdef CONFIG_32BIT
-	csr->vsieh = csr_read(CSR_VSIEH);
-	csr->hviph = csr_read(CSR_HVIPH);
-	csr->hviprio1h = csr_read(CSR_HVIPRIO1H);
-	csr->hviprio2h = csr_read(CSR_HVIPRIO2H);
+		csr->vsieh = nacl_csr_read(nsh, CSR_VSIEH);
+		csr->hviph = nacl_csr_read(nsh, CSR_HVIPH);
+		csr->hviprio1h = nacl_csr_read(nsh, CSR_HVIPRIO1H);
+		csr->hviprio2h = nacl_csr_read(nsh, CSR_HVIPRIO2H);
 #endif
+	} else {
+		csr->vsiselect = csr_read(CSR_VSISELECT);
+		csr->hviprio1 = csr_read(CSR_HVIPRIO1);
+		csr->hviprio2 = csr_read(CSR_HVIPRIO2);
+#ifdef CONFIG_32BIT
+		csr->vsieh = csr_read(CSR_VSIEH);
+		csr->hviph = csr_read(CSR_HVIPH);
+		csr->hviprio1h = csr_read(CSR_HVIPRIO1H);
+		csr->hviprio2h = csr_read(CSR_HVIPRIO2H);
+#endif
+	}
 }
 
 int kvm_riscv_vcpu_aia_get_csr(struct kvm_vcpu *vcpu,
@@ -250,20 +279,20 @@ static u8 aia_get_iprio8(struct kvm_vcpu *vcpu, unsigned int irq)
 
 	switch (bitpos / BITS_PER_LONG) {
 	case 0:
-		hviprio = csr_read(CSR_HVIPRIO1);
+		hviprio = ncsr_read(CSR_HVIPRIO1);
 		break;
 	case 1:
 #ifndef CONFIG_32BIT
-		hviprio = csr_read(CSR_HVIPRIO2);
+		hviprio = ncsr_read(CSR_HVIPRIO2);
 		break;
 #else
-		hviprio = csr_read(CSR_HVIPRIO1H);
+		hviprio = ncsr_read(CSR_HVIPRIO1H);
 		break;
 	case 2:
-		hviprio = csr_read(CSR_HVIPRIO2);
+		hviprio = ncsr_read(CSR_HVIPRIO2);
 		break;
 	case 3:
-		hviprio = csr_read(CSR_HVIPRIO2H);
+		hviprio = ncsr_read(CSR_HVIPRIO2H);
 		break;
 #endif
 	default:
@@ -283,20 +312,20 @@ static void aia_set_iprio8(struct kvm_vcpu *vcpu, unsigned int irq, u8 prio)
 
 	switch (bitpos / BITS_PER_LONG) {
 	case 0:
-		hviprio = csr_read(CSR_HVIPRIO1);
+		hviprio = ncsr_read(CSR_HVIPRIO1);
 		break;
 	case 1:
 #ifndef CONFIG_32BIT
-		hviprio = csr_read(CSR_HVIPRIO2);
+		hviprio = ncsr_read(CSR_HVIPRIO2);
 		break;
 #else
-		hviprio = csr_read(CSR_HVIPRIO1H);
+		hviprio = ncsr_read(CSR_HVIPRIO1H);
 		break;
 	case 2:
-		hviprio = csr_read(CSR_HVIPRIO2);
+		hviprio = ncsr_read(CSR_HVIPRIO2);
 		break;
 	case 3:
-		hviprio = csr_read(CSR_HVIPRIO2H);
+		hviprio = ncsr_read(CSR_HVIPRIO2H);
 		break;
 #endif
 	default:
@@ -308,20 +337,20 @@ static void aia_set_iprio8(struct kvm_vcpu *vcpu, unsigned int irq, u8 prio)
 
 	switch (bitpos / BITS_PER_LONG) {
 	case 0:
-		csr_write(CSR_HVIPRIO1, hviprio);
+		ncsr_write(CSR_HVIPRIO1, hviprio);
 		break;
 	case 1:
 #ifndef CONFIG_32BIT
-		csr_write(CSR_HVIPRIO2, hviprio);
+		ncsr_write(CSR_HVIPRIO2, hviprio);
 		break;
 #else
-		csr_write(CSR_HVIPRIO1H, hviprio);
+		ncsr_write(CSR_HVIPRIO1H, hviprio);
 		break;
 	case 2:
-		csr_write(CSR_HVIPRIO2, hviprio);
+		ncsr_write(CSR_HVIPRIO2, hviprio);
 		break;
 	case 3:
-		csr_write(CSR_HVIPRIO2H, hviprio);
+		ncsr_write(CSR_HVIPRIO2H, hviprio);
 		break;
 #endif
 	default:
@@ -377,7 +406,7 @@ int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
 		return KVM_INSN_ILLEGAL_TRAP;
 
 	/* First try to emulate in kernel space */
-	isel = csr_read(CSR_VSISELECT) & ISELECT_MASK;
+	isel = ncsr_read(CSR_VSISELECT) & ISELECT_MASK;
 	if (isel >= ISELECT_IPRIO0 && isel <= ISELECT_IPRIO15)
 		return aia_rmw_iprio(vcpu, isel, val, new_val, wr_mask);
 	else if (isel >= IMSIC_FIRST && isel <= IMSIC_LAST &&
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
