Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEC4D3C92F
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 19:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7n/cxhwimaIHd6SVLIvLI4KcRek/9wCDmkd7l7bV60=; b=l5RMXA5TJusNz/
	BlCMqgAy/jds+WRUdCDUvyfRiA7I04/l28T01ufnJvJ/XPWscPhj0pk3ux8Ob7jGAsqYFE2oOMRso
	77jLlB1zpZYTW7aUfGdGitOdKdKf1zgQ/UU2qc9KQpUQknUdD7RYu2wtEQ83ujzzp9f7m9FniFs3L
	v/YB3rKONK+eZvg7NdrszUufhBL35Bwsfr2KP7k+JoPQQ8b7m2ETYxo/MiyfKVXBcHF1M/Q04NHir
	8q5VXCT8ZErqdMAo/DoHoO4jy35YUhfyG44Un4meKho/8hxVUFMWZpMTfi/l/3FwGlSwCRPUC1Z/Z
	/L0OTeNvosL/7THMtVUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2bu6-00000005Miu-3zM5;
	Sun, 20 Oct 2024 19:47:54 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2bu2-00000005Meu-2uhJ
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 19:47:52 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2e2b9480617so3064395a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 12:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1729453670; x=1730058470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjxqRhm7xrGjz8Ovok1N736zyKzdvbsEt213nSnt+BI=;
        b=IAQkoqaWFx7il69pEH7RPb5GDOh7NWYfAkrCOR+BcASssXHaQJil9Qd9dp0byN7h+2
         jK7CuYGgCz15r0G1ny7tq9+cAKo5RW4Gbg6y+HUGbCnKaptcFDLjkMPqoFiTQMZnQr3s
         UuP/vIpQfwMcfZPYAo1jKI3U3QFDi8NgoVuF8JNXBpcCjwmGLf5TIuetnI61xtyd4HXe
         UJOJIkbUSTVzem64mqPPz9x6i9NcyBvAves/yc2emT00D8cxpL/+LariZF2ZIoTLzFvp
         npAKB0tuUiye9UyqzF+X0IxRr5yjVyN5NTnND+tQ06ymWeRNjcS1g2k2TevwLdPxvj7N
         WuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729453670; x=1730058470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YjxqRhm7xrGjz8Ovok1N736zyKzdvbsEt213nSnt+BI=;
        b=Wtc4iFHsHApjNGIS8aX3Is/qqLad0g7wM799snkPzBXFGcsfDe5P0ZcH120hNsXNkF
         hrdjjxQTWH6rmMp1s2i558iMc2Lvbi8io3WbnIXsu0ppn/+AQogQ9yeFKOPeY/U6EfgK
         7DWgnpI64TOj43othbNzeh3L97lWjKcKxlY+ltQKF7EZz7xsNm/w1UBVsenyV5qOZo/Q
         Sl2GnGp7Btq4Fuwui4Uwi8Kq7ApMwCNyxiv2aoMjbLA1zHstqQK2qlK9sogD/N832UG3
         8tAU/FpsJOCTzytS5WacphYsEoG7nl2jId28XbjcmT6WvnQtJy3Ir0puZpQESyVZKqgs
         rf+A==
X-Forwarded-Encrypted: i=1; AJvYcCWY7sUH3S4rBVKViqRLE0glDf9+zLn6DayTEc5+09cmYi5On0XNzQRra8Wf/+NT6oOJKcBF3b18fgzDBA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1A9KOp4D+bQ/tAIiGsVTtJVDlXtQCaSA0RFP784PnvRCxmQA+
	Yhl3lD8jLqjC/ar8Ugu9GkVvuUlyEnMwQWA1Yyicl1oNclwImhqC76kqKkyzjO8=
X-Google-Smtp-Source: AGHT+IGSbrFfEsCiKKrMtJuowc85sYHNI6rlNZmFsVNLUA0j4KKYlpfFIvbCLDM9xKhydrTr8zEK0Q==
X-Received: by 2002:a17:90a:7086:b0:2e2:c421:894b with SMTP id 98e67ed59e1d1-2e561726f19mr11200428a91.14.1729453669660;
        Sun, 20 Oct 2024 12:47:49 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([50.238.223.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad365d4dsm1933188a91.14.2024.10.20.12.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 12:47:48 -0700 (PDT)
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
Subject: [PATCH v2 03/13] RISC-V: KVM: Save/restore SCOUNTEREN in C source
Date: Mon, 21 Oct 2024 01:17:24 +0530
Message-ID: <20241020194734.58686-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241020194734.58686-1-apatel@ventanamicro.com>
References: <20241020194734.58686-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_124750_743135_1D8871DB 
X-CRM114-Status: UNSURE (   8.96  )
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

The SCOUNTEREN CSR need not be saved/restored in the low-level
__kvm_riscv_switch_to() function hence move the SCOUNTEREN CSR
save/restore to the kvm_riscv_vcpu_swap_in_guest_state() and
kvm_riscv_vcpu_swap_in_host_state() functions in C sources.

Also, re-arrange the CSR save/restore and related GPR usage in
the low-level __kvm_riscv_switch_to() low-level function.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c        |  2 ++
 arch/riscv/kvm/vcpu_switch.S | 52 +++++++++++++++---------------------
 2 files changed, 23 insertions(+), 31 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 53ee29490c7f..a972dd46e7e4 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -702,6 +702,7 @@ static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
+	vcpu->arch.host_scounteren = csr_swap(CSR_SCOUNTEREN, csr->scounteren);
 	vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN) &&
 	    (cfg->hstateen0 & SMSTATEEN0_SSTATEEN0))
@@ -715,6 +716,7 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
+	csr->scounteren = csr_swap(CSR_SCOUNTEREN, vcpu->arch.host_scounteren);
 	csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN) &&
 	    (cfg->hstateen0 & SMSTATEEN0_SSTATEEN0))
diff --git a/arch/riscv/kvm/vcpu_switch.S b/arch/riscv/kvm/vcpu_switch.S
index f83643c4fdb9..3f8cbc21a644 100644
--- a/arch/riscv/kvm/vcpu_switch.S
+++ b/arch/riscv/kvm/vcpu_switch.S
@@ -43,30 +43,25 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
 
 	/* Load Guest CSR values */
 	REG_L	t0, (KVM_ARCH_GUEST_SSTATUS)(a0)
-	REG_L	t1, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
-	la	t3, .Lkvm_switch_return
-	REG_L	t4, (KVM_ARCH_GUEST_SEPC)(a0)
+	la	t1, .Lkvm_switch_return
+	REG_L	t2, (KVM_ARCH_GUEST_SEPC)(a0)
 
 	/* Save Host and Restore Guest SSTATUS */
 	csrrw	t0, CSR_SSTATUS, t0
 
-	/* Save Host and Restore Guest SCOUNTEREN */
-	csrrw	t1, CSR_SCOUNTEREN, t1
-
 	/* Save Host STVEC and change it to return path */
-	csrrw	t3, CSR_STVEC, t3
-
-	/* Save Host SSCRATCH and change it to struct kvm_vcpu_arch pointer */
-	csrrw	t2, CSR_SSCRATCH, a0
+	csrrw	t1, CSR_STVEC, t1
 
 	/* Restore Guest SEPC */
-	csrw	CSR_SEPC, t4
+	csrw	CSR_SEPC, t2
+
+	/* Save Host SSCRATCH and change it to struct kvm_vcpu_arch pointer */
+	csrrw	t3, CSR_SSCRATCH, a0
 
 	/* Store Host CSR values */
 	REG_S	t0, (KVM_ARCH_HOST_SSTATUS)(a0)
-	REG_S	t1, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
-	REG_S	t2, (KVM_ARCH_HOST_SSCRATCH)(a0)
-	REG_S	t3, (KVM_ARCH_HOST_STVEC)(a0)
+	REG_S	t1, (KVM_ARCH_HOST_STVEC)(a0)
+	REG_S	t3, (KVM_ARCH_HOST_SSCRATCH)(a0)
 
 	/* Restore Guest GPRs (except A0) */
 	REG_L	ra, (KVM_ARCH_GUEST_RA)(a0)
@@ -145,31 +140,26 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
 	REG_S	t6, (KVM_ARCH_GUEST_T6)(a0)
 
 	/* Load Host CSR values */
-	REG_L	t1, (KVM_ARCH_HOST_STVEC)(a0)
-	REG_L	t2, (KVM_ARCH_HOST_SSCRATCH)(a0)
-	REG_L	t3, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
-	REG_L	t4, (KVM_ARCH_HOST_SSTATUS)(a0)
-
-	/* Save Guest SEPC */
-	csrr	t0, CSR_SEPC
+	REG_L	t0, (KVM_ARCH_HOST_STVEC)(a0)
+	REG_L	t1, (KVM_ARCH_HOST_SSCRATCH)(a0)
+	REG_L	t2, (KVM_ARCH_HOST_SSTATUS)(a0)
 
 	/* Save Guest A0 and Restore Host SSCRATCH */
-	csrrw	t2, CSR_SSCRATCH, t2
+	csrrw	t1, CSR_SSCRATCH, t1
 
-	/* Restore Host STVEC */
-	csrw	CSR_STVEC, t1
+	/* Save Guest SEPC */
+	csrr	t3, CSR_SEPC
 
-	/* Save Guest and Restore Host SCOUNTEREN */
-	csrrw	t3, CSR_SCOUNTEREN, t3
+	/* Restore Host STVEC */
+	csrw	CSR_STVEC, t0
 
 	/* Save Guest and Restore Host SSTATUS */
-	csrrw	t4, CSR_SSTATUS, t4
+	csrrw	t2, CSR_SSTATUS, t2
 
 	/* Store Guest CSR values */
-	REG_S	t0, (KVM_ARCH_GUEST_SEPC)(a0)
-	REG_S	t2, (KVM_ARCH_GUEST_A0)(a0)
-	REG_S	t3, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
-	REG_S	t4, (KVM_ARCH_GUEST_SSTATUS)(a0)
+	REG_S	t1, (KVM_ARCH_GUEST_A0)(a0)
+	REG_S	t2, (KVM_ARCH_GUEST_SSTATUS)(a0)
+	REG_S	t3, (KVM_ARCH_GUEST_SEPC)(a0)
 
 	/* Restore Host GPRs (except A0 and T0-T6) */
 	REG_L	ra, (KVM_ARCH_HOST_RA)(a0)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
