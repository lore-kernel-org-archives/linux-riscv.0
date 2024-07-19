Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F9AC3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tF51WGBOUAPRpOPqH0Rx7vH92kZMt6AerN4j8R0bo74=; b=wjE2WRyvxH/FBe
	ZYin0J9NpiSN/kPfP4VUMsHcSxQymLuD9mrCswjsvZrtjNoRnR466G6ZIvz10RnGYsBouWIIWSSwH
	HTPNklvdgv8HgFyCfpM2e3dUyaX55bQjsbbHjNWpPEgDTmvIH3X297wzcVz2UQ4BU5rLLNxmH4WqW
	3wkd/VZn7LoDXpLAhzuld4k4stwgPec9ZBMvULDehnHLvsE6WWjlGgWVnE2q3ItRRBQlFh1rA+Ev0
	b0wz+4HVmi0dX1butOyR9/jFJaS5yxtZe4vAcl/5wqugvlsQGuhhbQAX55VD05BWbsJPsg+qiNxLq
	yKB7iJoYDCnqOIlguefA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqAo-00000003B9E-3sZL;
	Fri, 19 Jul 2024 16:09:34 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqAm-00000003B7e-1yd7
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:09:33 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1fc611a0f8cso14689025ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721405372; x=1722010172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGcYsUF3DJYRqNt/bHhanbow+t8gedh1ONp0/95fX0k=;
        b=EsT4isAd9N7sWdecTGD9YwEgP+eN+H3mcRHCrH/YC2EV8B8Ztoyh7GHIvqYWSwLegJ
         0e6oAC7WzcWXmCdUcNwiZsPtVR3qJhXK2e9WqZDwR2HryuRmJ/E17uyAGRNZ+bxSp3c5
         PIjqVVzPUnUVd5z1BVuNIvkFrCB0c/aiZIXkf6m6vgbQYhoQofLoxnbVEASi633MLBDq
         xOP8gByVnZ2UZhcmkBaZwMgkb6DWfc4wFOy/Jj9AGOkam1Enk0qoolerVgk7llNjoFss
         9NKa742B4mD/Vs6SXgxXyEj3Vk51SufiDjAubF0ATFFpe568B7nUyeedpOUY6bMytIov
         IqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405372; x=1722010172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGcYsUF3DJYRqNt/bHhanbow+t8gedh1ONp0/95fX0k=;
        b=c53WRjY0Gtt9ouWnGBl8eE4QF5UaSeWSURf3px2wLcQggHh3m1QSdb4fIWlGKqrK0x
         hfgXQBnFjpTOU3Ak8ZkvTA2ZpujBdHDYYn9ELssi++2H/u9Q4R7nVCOa4Mnw7K8hoLts
         cySdNuYyll74lF71ha5owjIwS7DlZs0NmCFxDP163wW/OYHVBYm490U9SSZmH9u7PGEF
         dlLvjodAMWnb5roZSGHJFDasUz11q7iaXoBSiN9Zjz07gWyHS/tb1P3RLxoWwBjqA23j
         aiawRQI4iKYTelqSR+V/dcXDQvSjhEnBIsBjr06UBjp0ppKmHnT2zHWOR+deOsAMKTJC
         i6/A==
X-Forwarded-Encrypted: i=1; AJvYcCV9um5uLCOp01vVuw5tJE2sxzm6N67WsZbTFacNS2vlBrAUFMHfHyo/moYQd1KtNI4aUng2C4OyjPTmKlOPaBbaZBHv8C2sWFi2qJeukAJZ
X-Gm-Message-State: AOJu0YzuJSI35IjFKPY3FCDHlowuhuyQpEVZa7gC5dbh5mcoLo/kiDfy
	+fI3GgF6rR7S8LmDfn3POtNJcZMSr8BA3g0z6Umfe78oSafP0rojyCpsbhitQY4=
X-Google-Smtp-Source: AGHT+IGPjT8nh2ANsFn3KOth35OvyCH2HUqbnWMJwIQKneQhkQKr1OrfOoTIE7geur0pJijTHCcRbQ==
X-Received: by 2002:a17:903:234a:b0:1f9:f3c6:ed37 with SMTP id d9443c01a7336-1fd74597a55mr4348925ad.14.1721405371674;
        Fri, 19 Jul 2024 09:09:31 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([223.185.135.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f28f518sm6632615ad.69.2024.07.19.09.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:09:31 -0700 (PDT)
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
Subject: [PATCH 02/13] RISC-V: KVM: Save/restore HSTATUS in C source
Date: Fri, 19 Jul 2024 21:39:02 +0530
Message-Id: <20240719160913.342027-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719160913.342027-1-apatel@ventanamicro.com>
References: <20240719160913.342027-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_090932_539090_B7724A53 
X-CRM114-Status: UNSURE (   9.28  )
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
---
 arch/riscv/kvm/vcpu.c        |  9 +++++++++
 arch/riscv/kvm/vcpu_switch.S | 36 +++++++++++++-----------------------
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 449e5bb948c2..93b1ce043482 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -720,9 +720,18 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
