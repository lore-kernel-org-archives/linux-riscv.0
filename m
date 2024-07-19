Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78FBC3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXQLJNX47QDO8WriiV7rJ4z6U5rGoecLNZWbcjP/jik=; b=vrjHMWHR5fCaGi
	tBbTFMx3ELksYwjPaQvFkxUJtRKU6ySlygWN4VoWntJnxFZ/22a3MA0tL88u6RIbEpgJQ+wAuyfjh
	wj4m5YZ5v1+SsioO37jOqXvdeUUQ2Q+08OMyOe1DBAsqQZ+gOXc3d07uzco8DObcUW6HUHof5X80k
	Avhy6K6Yg8cxabW7KR00U5uVCyGMgK1bP8L49EQaCsK/V1wkybzRTURrJavPyu41S+gEaVhIvLTfM
	UkXpV866Doz3qF3JCv6WwEUaK50X1HbPFfePBsTmbx84VyYOf6DORfB/wBSQd9UaDSLlMD1flYEry
	G2adiOjNSMBU5xJSb07A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqBe-00000003Bta-1g3b;
	Fri, 19 Jul 2024 16:10:26 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqBM-00000003Bca-1q2j
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:10:10 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-70b31272a04so688360b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721405407; x=1722010207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4NP08UX/w85iYkbIVPDnOkRGbucYck2yHjBnwqEXTo=;
        b=Te2RD60wDYPKy0QqWcfSFAtQIBksL8LEVIXBNymarOMwrz2vaoW2yUWTb6/jgEdu1v
         LqE7TgVCPPMseQvOtByoEHyGkHrXv0dM7JvTcq/oNyUT+zWFL8lb7pLbr4MTGxIs6k5k
         ro2bVX87iaQnL1ZEk0YKq0wYsXBPTxfxKTZ5OrS6RfxfAnejQSjdnHTm/0lFYnxwjMHu
         DLw7z/NVxw4e2dqvh90u5cPQtSL7sQ7VqxqobrybhuAVk5tChko/Az7l4KHNCVfB3ZIc
         2iioyU/XG7J12lo4ZX4PyzVvGDH6d9T/yZo/hlHED8HNNqDtGc8PXHD/QkvdVLDEZY9B
         7zRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405407; x=1722010207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4NP08UX/w85iYkbIVPDnOkRGbucYck2yHjBnwqEXTo=;
        b=moiE63vHfOP6Aku/sVUuI/KLFQvLHDJvTQ9vYCf8R161LwP/bxQNd3cB6jQEVLMkVZ
         7b/Be2XqtAyWDEJ/wUVCtsoBnCUcrSDPTl+N+h55hx/sUTjRiQH/h8glDEALoNgguRN9
         YHqsHfSG4fa2poyMbaEhxqWSk5uzI+Ixwj2Oyfxwgfi3PMMjYh6UdfHR25FbsVvJ4K1V
         XPugrh942ZbT8QHrQPFrR07Z+4/8/IB4FraAvvVSmPsfDH4sCNXyhtYN+69Y/KjAjSMl
         NNEqc9sGe1QaYz1fa+nvrIQCgcBasx7K40sP+s/qYhPLdha5Z+3UYAe/C9sLriS4JrTx
         ibYw==
X-Forwarded-Encrypted: i=1; AJvYcCWkoSr6Uv5rNdBMGx8oNC317euxHdIQlOSk42dPjYfrtfVHTKl6yHAGGGY0Rh2jumF6OODwbZSqP+xLoD+qRGeVq2/tBDgavdXB6B+xsaDW
X-Gm-Message-State: AOJu0YykDl+um5bFQRR0ZdL6eHEsCKn4rv0PbdFxM9rGSt9a3f10CoFv
	pKexfwjiOc7GWpe56wqCFmyqEwlG8jeIX3ITFGkQLNDDzlNQTXs7bqrnfwZDYBo=
X-Google-Smtp-Source: AGHT+IE+xJaOF5e+dz9ph4mEQcMOaOJS+xXUFim+WrfebsgXUwhG7R+IIRODL08tQgBfyTXBjU6Aqg==
X-Received: by 2002:a17:903:32c5:b0:1fb:80a3:5826 with SMTP id d9443c01a7336-1fd74cff03bmr2252485ad.4.1721405406717;
        Fri, 19 Jul 2024 09:10:06 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([223.185.135.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f28f518sm6632615ad.69.2024.07.19.09.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:10:06 -0700 (PDT)
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
Subject: [PATCH 12/13] RISC-V: KVM: Save trap CSRs in kvm_riscv_vcpu_enter_exit()
Date: Fri, 19 Jul 2024 21:39:12 +0530
Message-Id: <20240719160913.342027-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719160913.342027-1-apatel@ventanamicro.com>
References: <20240719160913.342027-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_091008_519341_CE5931E5 
X-CRM114-Status: GOOD (  12.52  )
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
---
 arch/riscv/kvm/vcpu.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index fe849fb1aaab..854d98aa165e 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -757,12 +757,21 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
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
 
@@ -805,14 +814,24 @@ static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
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
@@ -929,22 +948,11 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
