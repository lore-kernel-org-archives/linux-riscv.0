Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A13D3C92A
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 19:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mmaE2xCgSZRhXh99vkklPZhm1R88iqEZMxLf3JFI1Fk=; b=VUnrRENRJ8fIqR
	YWVk3VnDe9h2a5Zl2uGx44QGQ9u4B+U4OsljGBFnRhqTtJxQTw5nzfkW/m9/WMXPgQP8r2xNjst8b
	NOvBG8Sadgn2DyWDDNjVf42xk0RKsKljV9pz4eIFxAwkMaw74VkhpBqaPKLrjnU9MG7906WOsZjPU
	yxZsECommSBgnNpJExT2CYHy4dvjNi8UU7tLp7Wtgaiot864lJw1MR2485ZpHtm6YNfcBKye1vk4+
	wet8lpGr7G1Hu1OrzyvBGeoCQGgx6CXzVK+Xx+uAoUi/tUzxd4SeP9xujBXbbkHCeme/NAbX2QcAi
	skpUXUaWvQ5QlrqmTWWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2bu4-00000005Mgo-2eLD;
	Sun, 20 Oct 2024 19:47:52 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2bu0-00000005MeA-3jKV
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 19:47:50 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2e2e8c8915eso3059678a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 12:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1729453668; x=1730058468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FyA7P9FbrHeEPhaW0M7UvJndGkwOjlPhJv2AlIq1GM=;
        b=LUxkXHSclcbz7l9+tRyMdAgrmutqVlSlAiKsbdBLoqnpQnIIc+uBgFUDiNGTN0vpw6
         xpi2HFOu31jQlwMTKCjYYkozMkXjjAEIMPU0uHx58elmazsK8QQ4hlIxv4TLaqaiGLHD
         Idp7uoRipqg9J5VEwb1uWydcmoVYSXPmcyDDhQOYc6MLbzODg5xzzUAEpP3zxaAyp6lo
         PgL4ItB0WLqDhRjjeHP5qZ6cUaMmNaPDKtr6+WCJEf3m+t39Qav6NiJPxwl7M2sAo6i4
         mxDVmo+99oUzoj2Ntt/ZUi9ZiGcWj7BMJY2wvpyU7AjAQDdtWjDEEVDW+cSpmtlZqDoC
         ZZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729453668; x=1730058468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FyA7P9FbrHeEPhaW0M7UvJndGkwOjlPhJv2AlIq1GM=;
        b=gnRFqMEFGpcNVDe6J+0ZZOTjcqVX9F0h7kDRoXbs3/q1V0JxxkkyDs5HBxESIRN927
         KatjubeYJy6mnYARfT9+DyYGjtgdsjlvLuqX8psF6GGiD9q9+YybhIlGX6M1kdx8XwIe
         b43G2OkjEy+/XxS1VPPF0qwgbDQlxFfR0B4dgH3HgXYxUo4uCIaCjEUvXSxd5MxZl5sM
         tkkz5B//eYI2w1/BD7cB9YRiA1AItMsWAIphOL/+VBJrbopk4Q2OlUS98fzy6TCfte8p
         WGGvWvLnURSCPusETukf0BaRqjDW0BkzHaJrpPWqL6tMfkvdj0pzIXl+MhrEzyakS2z2
         5Lvw==
X-Forwarded-Encrypted: i=1; AJvYcCXUh465mAXjuYKHKb8QlWVN/aY/LKNnlk7kSYVyx69hGEIFYcYVfSX1BPnuwQC986bnU9qFxh7DAxZkEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqhcoW3TDQbed6AF25ZLquDfiwGwtzKbi/WigsA7D3nEionljg
	fNXfXtTauutnpVBVeCj9TMaIpHHBBrnC9mnaUQ0evB4zorBASg0sdvTIBZ0smT4=
X-Google-Smtp-Source: AGHT+IF7lE3B8ClzR6qfjFpDCQHpNymbsHf8YVM1zw/aseb8Rk6lioGovC2ybZ0RbWASOBCIDdfN6A==
X-Received: by 2002:a17:90b:4b0d:b0:2e2:de95:34eb with SMTP id 98e67ed59e1d1-2e5616eba4emr12077551a91.10.1729453667879;
        Sun, 20 Oct 2024 12:47:47 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([50.238.223.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad365d4dsm1933188a91.14.2024.10.20.12.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 12:47:47 -0700 (PDT)
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
Subject: [PATCH v2 02/13] RISC-V: KVM: Save/restore HSTATUS in C source
Date: Mon, 21 Oct 2024 01:17:23 +0530
Message-ID: <20241020194734.58686-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241020194734.58686-1-apatel@ventanamicro.com>
References: <20241020194734.58686-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_124749_050665_6E9D95CC 
X-CRM114-Status: UNSURE (   8.66  )
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

We will be optimizing HSTATUS CSR access via shared memory setup
using the SBI nested acceleration extension. To facilitate this,
we first move HSTATUS save/restore in kvm_riscv_vcpu_enter_exit().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c        |  9 +++++++++
 arch/riscv/kvm/vcpu_switch.S | 36 +++++++++++++-----------------------
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index dae12ca3c8b6..53ee29490c7f 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -731,9 +731,18 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
  */
 static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
 {
+	struct kvm_cpu_context *gcntx = &vcpu->arch.guest_context;
+	struct kvm_cpu_context *hcntx = &vcpu->arch.host_context;
+
 	kvm_riscv_vcpu_swap_in_guest_state(vcpu);
 	guest_state_enter_irqoff();
+
+	hcntx->hstatus = csr_swap(CSR_HSTATUS, gcntx->hstatus);
+
 	__kvm_riscv_switch_to(&vcpu->arch);
+
+	gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
+
 	vcpu->arch.last_exit_cpu = vcpu->cpu;
 	guest_state_exit_irqoff();
 	kvm_riscv_vcpu_swap_in_host_state(vcpu);
diff --git a/arch/riscv/kvm/vcpu_switch.S b/arch/riscv/kvm/vcpu_switch.S
index 0c26189aa01c..f83643c4fdb9 100644
--- a/arch/riscv/kvm/vcpu_switch.S
+++ b/arch/riscv/kvm/vcpu_switch.S
@@ -43,35 +43,30 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
 
 	/* Load Guest CSR values */
 	REG_L	t0, (KVM_ARCH_GUEST_SSTATUS)(a0)
-	REG_L	t1, (KVM_ARCH_GUEST_HSTATUS)(a0)
-	REG_L	t2, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
-	la	t4, .Lkvm_switch_return
-	REG_L	t5, (KVM_ARCH_GUEST_SEPC)(a0)
+	REG_L	t1, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
+	la	t3, .Lkvm_switch_return
+	REG_L	t4, (KVM_ARCH_GUEST_SEPC)(a0)
 
 	/* Save Host and Restore Guest SSTATUS */
 	csrrw	t0, CSR_SSTATUS, t0
 
-	/* Save Host and Restore Guest HSTATUS */
-	csrrw	t1, CSR_HSTATUS, t1
-
 	/* Save Host and Restore Guest SCOUNTEREN */
-	csrrw	t2, CSR_SCOUNTEREN, t2
+	csrrw	t1, CSR_SCOUNTEREN, t1
 
 	/* Save Host STVEC and change it to return path */
-	csrrw	t4, CSR_STVEC, t4
+	csrrw	t3, CSR_STVEC, t3
 
 	/* Save Host SSCRATCH and change it to struct kvm_vcpu_arch pointer */
-	csrrw	t3, CSR_SSCRATCH, a0
+	csrrw	t2, CSR_SSCRATCH, a0
 
 	/* Restore Guest SEPC */
-	csrw	CSR_SEPC, t5
+	csrw	CSR_SEPC, t4
 
 	/* Store Host CSR values */
 	REG_S	t0, (KVM_ARCH_HOST_SSTATUS)(a0)
-	REG_S	t1, (KVM_ARCH_HOST_HSTATUS)(a0)
-	REG_S	t2, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
-	REG_S	t3, (KVM_ARCH_HOST_SSCRATCH)(a0)
-	REG_S	t4, (KVM_ARCH_HOST_STVEC)(a0)
+	REG_S	t1, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
+	REG_S	t2, (KVM_ARCH_HOST_SSCRATCH)(a0)
+	REG_S	t3, (KVM_ARCH_HOST_STVEC)(a0)
 
 	/* Restore Guest GPRs (except A0) */
 	REG_L	ra, (KVM_ARCH_GUEST_RA)(a0)
@@ -153,8 +148,7 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
 	REG_L	t1, (KVM_ARCH_HOST_STVEC)(a0)
 	REG_L	t2, (KVM_ARCH_HOST_SSCRATCH)(a0)
 	REG_L	t3, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
-	REG_L	t4, (KVM_ARCH_HOST_HSTATUS)(a0)
-	REG_L	t5, (KVM_ARCH_HOST_SSTATUS)(a0)
+	REG_L	t4, (KVM_ARCH_HOST_SSTATUS)(a0)
 
 	/* Save Guest SEPC */
 	csrr	t0, CSR_SEPC
@@ -168,18 +162,14 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
 	/* Save Guest and Restore Host SCOUNTEREN */
 	csrrw	t3, CSR_SCOUNTEREN, t3
 
-	/* Save Guest and Restore Host HSTATUS */
-	csrrw	t4, CSR_HSTATUS, t4
-
 	/* Save Guest and Restore Host SSTATUS */
-	csrrw	t5, CSR_SSTATUS, t5
+	csrrw	t4, CSR_SSTATUS, t4
 
 	/* Store Guest CSR values */
 	REG_S	t0, (KVM_ARCH_GUEST_SEPC)(a0)
 	REG_S	t2, (KVM_ARCH_GUEST_A0)(a0)
 	REG_S	t3, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
-	REG_S	t4, (KVM_ARCH_GUEST_HSTATUS)(a0)
-	REG_S	t5, (KVM_ARCH_GUEST_SSTATUS)(a0)
+	REG_S	t4, (KVM_ARCH_GUEST_SSTATUS)(a0)
 
 	/* Restore Host GPRs (except A0 and T0-T6) */
 	REG_L	ra, (KVM_ARCH_HOST_RA)(a0)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
