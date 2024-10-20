Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CA1D3C930
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 21:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/0kJG8qWipDqmc8dgQn5rVBt9QAZTMcB3xpP9KpUFY=; b=BGOl+JxxpJlKxS
	o2lF5t457RX6V/NRZ0fs9uxBP/rTKLkab4NSSvyY9Oo38rOAcbqSz4uDprzcnwP4OJE5/UKe8AR1o
	3cx9ok1/ZYlwMtbVJm2n7trMVbrXblAx5WIofhzuozzigo8aMDIRbN7PQDiIeHiPAhu22AJC35iWa
	AI5t/ggoQADKT66gfcWVqkBNgndWKSkLtjeMiij1pj1h4ICCYTiVOV99iYwbRck/HWXPPb+aKx9Ht
	WuQ4hMeUF4e8cBNS7/FfwJ5dcnAO9At0N8hCdo44J8RI5DbEORMGQVay/rpcsrjb35PinYrfD+LMD
	NbtQhEPVOzfhYwyJXBOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2d29-00000005SKp-0WKe;
	Sun, 20 Oct 2024 21:00:17 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2buJ-00000005MuW-31C2
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 19:48:12 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2e2bd347124so2731335a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 12:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1729453687; x=1730058487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yr2xZkoHB0nVswj42oFFwW3NpuvwZ9N4MbvDwoyulOQ=;
        b=miDqsvxzE94SWGpC5ftuo+1hiPwrRyMVVg3W6JO6Zg4Wa35BxQnmg/NcZZBtUVgKAn
         HFT5/vsPpg623ZFAka6ZN9sufni+U9VVpoh6esp3UWm5KJVyVjrYwz7nHhlR4Vck+SkU
         7677z1FoUUG/PLvc972G8t9KGIp/doc/WY2wl5GuCj1itcg3cWS5PbWVo942RVg/zm/4
         ar/VR/mHgYIFVD12aMfoArQCL7JJSOuVLBkpnL4YeT8U8kvcO2MOfp0s+Ao7+ksJWVNG
         A2pX/hMIXZ6IcUd8rhsjCcATvBhQdhtNvp2GRhnBNc5W5e27N9t5mdu+R8VuQuUK9WBz
         YyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729453687; x=1730058487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yr2xZkoHB0nVswj42oFFwW3NpuvwZ9N4MbvDwoyulOQ=;
        b=JPaT0C7wp7KGgzbqzzwZUbfV0dAzaHku1KGCwzBd38VzdYPX+h/RmDx4Jm9f85vyt6
         6vS86Dk/maVgxMCwrFFYg91cP1an/SJ1SHMkTA923hypE8UXP/XBb3T5sQQ4/Y8hTwEG
         0XaNfOa9d9KqwEC8czkmGYzH1udvR2cjSfIo9d87pop2LA6QJYXejGvWWQmpw98lBl3R
         qwnIMESq8UXa5Hl9oYlNGFvtliwiFV///jhZNpqeh4mvZYHvq8ViRdAoPAHhjynH/9Z3
         04YTNg0rCcro63jqlkQaPmNI8PhKoSJwh+7Yk4bzD5fw8an1xtijGSFwleAXGMGBWvfI
         7pKw==
X-Forwarded-Encrypted: i=1; AJvYcCUr2z3/bc8VOv4I3rqGhDLIFcdCrQuK3C0cSk3OSeb0pUcrNQRvaMUeTrvxKaPj4uzhM5iYfc2MVgb8VQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkGUGofLgBcVtZ3UauhDInrKQdJfYc/Hg1Dv5I/Ydw5HBaSyLo
	l0WJ7LtDebfJf1IyHWR+IY2dEASpNR6NJE/qzRl074vuYDEcIkzmBhTI6geJv0U=
X-Google-Smtp-Source: AGHT+IGOwsMImEEUFZ7X9qPpWtzyIIzNSFMp0fMdMzDbnnBwV6JmeAnM7Csv5DyXHIZDDlryM2Wx1g==
X-Received: by 2002:a17:90a:5147:b0:2e2:c6a6:84da with SMTP id 98e67ed59e1d1-2e5617269c6mr10776191a91.34.1729453686738;
        Sun, 20 Oct 2024 12:48:06 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([50.238.223.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad365d4dsm1933188a91.14.2024.10.20.12.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 12:48:06 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 12/13] RISC-V: KVM: Save trap CSRs in kvm_riscv_vcpu_enter_exit()
Date: Mon, 21 Oct 2024 01:17:33 +0530
Message-ID: <20241020194734.58686-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241020194734.58686-1-apatel@ventanamicro.com>
References: <20241020194734.58686-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_124808_334812_96A73D50 
X-CRM114-Status: GOOD (  11.87  )
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

Save trap CSRs in the kvm_riscv_vcpu_enter_exit() function instead of
the kvm_arch_vcpu_ioctl_run() function so that HTVAL and HTINST CSRs
are accessed in more optimized manner while running under some other
hypervisor.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e191e6eae0c0..e048dcc6e65e 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -768,12 +768,21 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
  * This must be noinstr as instrumentation may make use of RCU, and this is not
  * safe during the EQS.
  */
-static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
+static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu,
+					      struct kvm_cpu_trap *trap)
 {
 	void *nsh;
 	struct kvm_cpu_context *gcntx = &vcpu->arch.guest_context;
 	struct kvm_cpu_context *hcntx = &vcpu->arch.host_context;
 
+	/*
+	 * We save trap CSRs (such as SEPC, SCAUSE, STVAL, HTVAL, and
+	 * HTINST) here because we do local_irq_enable() after this
+	 * function in kvm_arch_vcpu_ioctl_run() which can result in
+	 * an interrupt immediately after local_irq_enable() and can
+	 * potentially change trap CSRs.
+	 */
+
 	kvm_riscv_vcpu_swap_in_guest_state(vcpu);
 	guest_state_enter_irqoff();
 
@@ -816,14 +825,24 @@ static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
 		} else {
 			gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
 		}
+
+		trap->htval = nacl_csr_read(nsh, CSR_HTVAL);
+		trap->htinst = nacl_csr_read(nsh, CSR_HTINST);
 	} else {
 		hcntx->hstatus = csr_swap(CSR_HSTATUS, gcntx->hstatus);
 
 		__kvm_riscv_switch_to(&vcpu->arch);
 
 		gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
+
+		trap->htval = csr_read(CSR_HTVAL);
+		trap->htinst = csr_read(CSR_HTINST);
 	}
 
+	trap->sepc = gcntx->sepc;
+	trap->scause = csr_read(CSR_SCAUSE);
+	trap->stval = csr_read(CSR_STVAL);
+
 	vcpu->arch.last_exit_cpu = vcpu->cpu;
 	guest_state_exit_irqoff();
 	kvm_riscv_vcpu_swap_in_host_state(vcpu);
@@ -940,22 +959,11 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 		guest_timing_enter_irqoff();
 
-		kvm_riscv_vcpu_enter_exit(vcpu);
+		kvm_riscv_vcpu_enter_exit(vcpu, &trap);
 
 		vcpu->mode = OUTSIDE_GUEST_MODE;
 		vcpu->stat.exits++;
 
-		/*
-		 * Save SCAUSE, STVAL, HTVAL, and HTINST because we might
-		 * get an interrupt between __kvm_riscv_switch_to() and
-		 * local_irq_enable() which can potentially change CSRs.
-		 */
-		trap.sepc = vcpu->arch.guest_context.sepc;
-		trap.scause = csr_read(CSR_SCAUSE);
-		trap.stval = csr_read(CSR_STVAL);
-		trap.htval = ncsr_read(CSR_HTVAL);
-		trap.htinst = ncsr_read(CSR_HTINST);
-
 		/* Syncup interrupts state with HW */
 		kvm_riscv_vcpu_sync_interrupts(vcpu);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
