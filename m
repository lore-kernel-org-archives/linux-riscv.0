Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1BAC3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v6od6wrsYI0K+lvHgHDLCKV27POS3k0v4888gA4sRwk=; b=qEr/OZ8v60XH1v
	VwZ/W+7otiZ0CDhZgJIDvB3nnN43hT03pmeSBupNBrkv0BssTNfcCfFMafIuizKUIKlB94MmWSZMm
	oLjG+OmfxzlItZhLUEkFQDFTE7GSdqp2l64sw09zR64m3cMxLnlPfCwAR/8ZtrTLQVPTNDXPZ6CAb
	0MRDQBmyK7p5ADqssa9oHY+Xmg50ola88MV/9c9QK0R+HdMUTxEOir16kPxVgUMurskF+re0SwXKR
	7b9NKb+bxG8nw38eyyaWdw+ThxIwXgJnRG/uJ6OHyfXsA6Vk6aGmSGaAYN2fOloGfxXfxwKLucXHu
	WoOT1MulNpRDO2r7EZWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqAu-00000003BDy-2LGo;
	Fri, 19 Jul 2024 16:09:40 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqAr-00000003BAn-24ML
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:09:38 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-70af22a9c19so823414b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721405376; x=1722010176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3NWlthcoywMVunFB4+gvIDJc/eJtmciuSUTOqnPM9U=;
        b=EuARneD4xzpdKScyCkD9ZK6DA/XcxtsDWjYY1htF917NhxWQbTNUa30J+iJ2GldSVj
         bIoJ+w532/V6wub2gdU7k+8+ciFecVIglOZ+cv9UpFVyfIvgTC3FEjBnr4uLe4iFdygs
         hajAlMuW3wkIHsQamyfVKVQcYYTEdqY+HBsK0G0uLDYz04Q5/0qav4auiH8p6SSN8uLv
         ag56wZ3nP7oc++nlssrQGTcvwiOw43XEzFc09UxA0HnIP5Q2aECorTdh+zJNxnPe/XW+
         0bb7tWvVd5uxRkS7vWI6gGsDEijH8xpqM3fdWs3SpXgNaETOfTYsyz9kpXum/VjmAY/3
         h17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405376; x=1722010176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3NWlthcoywMVunFB4+gvIDJc/eJtmciuSUTOqnPM9U=;
        b=q/l6PPiof47zL101lr+J7Ks8+GYa/Vlpq5lEALBPHMXJgmzjRTsTag8MynsaRBMAzg
         252BDQwLnbSFT4LjI9tQP9lB7hWrn6we1Xm24leL56TZ4lkSGcodY3NvBLND2R33jaAU
         SQ/VoF885Xka0cIIeVORow69CEuX4P+97uk+hhpXuVWJk0Cw5ptkCh+4zdFdnK4ArGw1
         6ivdBSuJgL0nc6GxAVb689UZjlCGFckUdJ6oMqYk5VyyxRc0d5XH6FkZAs+x5u9J7c5s
         qYfE7TussTHhq3F5DjKuNeGnA+myQnd2z5QKabWxLOFW8aBPMDEnkhPDGyNUrdmCblao
         6eug==
X-Forwarded-Encrypted: i=1; AJvYcCUokSDIrzrq3McjfUEtFRYA1ycZfxnPjEzhLqJ3b10GwHgLcSF6AwgHziPLxBSIXhjyM10fesNHOGdRo0tMGBV/o42xCxMGOIhkjdHL9w9l
X-Gm-Message-State: AOJu0YzOwZPzPFyLB+5oYgSeSGl7w5ph/HQqNlsRB2tnAjqguOePFW29
	PRphWCxaEg88uXq+xEHQ+WNslyLx4tlCwaPefgcom6ghKN48LGBjcESuTXlUHqY=
X-Google-Smtp-Source: AGHT+IHSyLP6BUKo5Y6kcqhYNpaqUtXlIEUBiGZ3Sff8ZSea+zDXaY9Z5yRlxXFAYJK3pPW05CR8DA==
X-Received: by 2002:a05:6a20:9145:b0:1c0:f1cb:c4b2 with SMTP id adf61e73a8af0-1c3fdcbfff9mr10900609637.4.1721405375471;
        Fri, 19 Jul 2024 09:09:35 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([223.185.135.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f28f518sm6632615ad.69.2024.07.19.09.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:09:34 -0700 (PDT)
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
Subject: [PATCH 03/13] RISC-V: KVM: Save/restore SCOUNTEREN in C source
Date: Fri, 19 Jul 2024 21:39:03 +0530
Message-Id: <20240719160913.342027-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719160913.342027-1-apatel@ventanamicro.com>
References: <20240719160913.342027-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_090937_564526_2A594AF4 
X-CRM114-Status: UNSURE (   9.57  )
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
---
 arch/riscv/kvm/vcpu.c        |  2 ++
 arch/riscv/kvm/vcpu_switch.S | 52 +++++++++++++++---------------------
 2 files changed, 23 insertions(+), 31 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 93b1ce043482..957e1a5e081b 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -691,6 +691,7 @@ static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
+	vcpu->arch.host_scounteren = csr_swap(CSR_SCOUNTEREN, csr->scounteren);
 	vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN) &&
 	    (cfg->hstateen0 & SMSTATEEN0_SSTATEEN0))
@@ -704,6 +705,7 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
