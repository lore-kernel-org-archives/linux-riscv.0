Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D51AC61DB2
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 06:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVimj/36Ezcxu/cnWTcLNFM+tpsJ9R/MrBTASe4sqZ4=; b=Oku0XiULZ4PDdc
	tZNAdDIgeGSxQO/bqPjkcw37nHu6h3jmrUfbQGjZ1EO/i+2/jYnxKKac2zdxOWvhH+r5Xz6oQNETJ
	5ui2oiH1avOe8Bq9NUH5X4Y693Wcp6k8rhKbkMuSpxxYjQtC7T5s5FIlw//kCMqDDGBv4A2g8PZPm
	7lj9Xdbls71AcHkzqlor5DvfgXxV/KuDIHof2B2+fUthKAgSuslW89lFxx8NYDspECVd3Y3OmAhRu
	RKO4tLifQzebhtN5djPPV2GSukSE9BdPenntDXMXJx70SA24df8BOxt0Jw6pvaywWQ/ezUn7CB5kP
	iDuEN4nwQKcXUFn6d9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMw-0000000FXa8-1Uq4;
	Fri, 13 Jun 2025 06:58:30 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMt-0000000FXXc-1e3v
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 06:58:28 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-311c95ddfb5so1519833a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 23:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797907; x=1750402707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9NuUqyMjDjOZ8RZ5AE6YpvMfKBxH1jx9BmTdXWsOf0=;
        b=MLK2FEzAUth2dlt7Ji9vLKntlIthLpbTcm8JSk92JjolrqJvCh+v4PFaUt1cSNSlQp
         r5c2wu69MqGAxr64D3Ho1ga3Jxb1YZjQc599clblDvciocyRbNMchMAeaPXepvtIXib9
         981qrIGxdNQPYRBwjV74yte4zXjccwG1/2TYPKguLazcNPjE53p+aZtOuaaDOE2cI7Fd
         6BavD4hgcqBHFyv4fpceWRDCzNM5XzOICNZfloK/dYvUemAluWSAuLib+jF5Rycr08XN
         NFnr8AaYUORFDfvEKLJ8xztwJD1FaufuZ9nidsikNBG/71Vs29Bs+BirAA8OdErzVuIK
         o58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797907; x=1750402707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9NuUqyMjDjOZ8RZ5AE6YpvMfKBxH1jx9BmTdXWsOf0=;
        b=WPmcQhBsdBCyusuhJyz34aOZ8pX9LT/yZRXiXfpx+KuCT7Xy5lfXW+ZGGvBEI8W1VU
         bVsmbZRn7W230mOsSUyr5DnWGWeyRgnHV9Y2HeV+pICnpZuMYmUNxALWgKoHeU7mmmEv
         lmDbfnItyW7EUz1j5Q1adhNFS5bEPYSYnaaZvB1Vh5CxX+owcvdoWan+bmhR9Tuqrhep
         xnWA9dIoUAdLT3fsT+TWtapwDA6Irj3a2OtD3ZUvpP53G3MEycCnpS7wENtoN0ynZa7G
         Jo/eG4JK2hKK6rLYXHx6Mn+ReZL1gygDEnjiwpUndzgUlghOk6/rZnCpRf42FYTp/ZGX
         o77A==
X-Forwarded-Encrypted: i=1; AJvYcCUVBlM8YIdgMr79TQo5B67DzEouX6Qks9Vp78Tor6koF7JuSEPVCF69lrfGRqR2q+6Bn9n1ynkEiSNJPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUxdqRDG0te0dUcffkUNnbG2/9Px/rKRJmadkXhIVmLkr6EmGh
	7oHMkq35ZTYhAoE5Ro9GKgeXY/zpLLIj8oEW5M5x9bGM48PZdNR2+ZmavJpCHt2DC1uK4nrfEDC
	i24xKCrg=
X-Gm-Gg: ASbGncuRwDZv1N1PTpElxarX2OOtTnKu20oTKp3+6wB0pMuEqT4ooXG3dulrd8N1U55
	vcycrxQ20ec60tomfR/KEtXCPrvZtZY5kGWlLpgi0Nf97UcD7WYPJBI2xKAmiUsHgdyQjkWFQDR
	ZFfs9vtoPBvcANgd+T2xKcFebv6x0lOvDfWkjrDmsx3lfsg3DoaSM7jFLBJUs4tHRT4UBtLH+xY
	ayg6nuRhGu4mryJDGXk9OpAomxfGHDFiXGe8EqjpzREwRVVmkIgj7TwcRLhal/EpqWLHRgGemoR
	LaIE2nBbKwW3ZC3InVItiSVx0At2lnTXfmWwg2/0gTf9k506O12BVgnegNo9lnniGHqhSXV0nGu
	WjMn4simdv0xdn/WhtUg=
X-Google-Smtp-Source: AGHT+IE8a5t2vAc7uHbhW52m189RNr8N2yqc2jJGrHdRdfFv50kYLOdkbxH34MMXUkyP4JTNM1l//w==
X-Received: by 2002:a17:90b:2686:b0:313:db0b:75d8 with SMTP id 98e67ed59e1d1-313db0b77acmr2060784a91.32.1749797906744;
        Thu, 12 Jun 2025 23:58:26 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:58:26 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 07/12] RISC-V: KVM: Use ncsr_xyz() in kvm_riscv_vcpu_trap_redirect()
Date: Fri, 13 Jun 2025 12:27:38 +0530
Message-ID: <20250613065743.737102-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613065743.737102-1-apatel@ventanamicro.com>
References: <20250613065743.737102-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_235827_433492_53FDB392 
X-CRM114-Status: GOOD (  10.70  )
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

The H-extension CSRs accessed by kvm_riscv_vcpu_trap_redirect() will
trap when KVM RISC-V is running as Guest/VM hence remove these traps
by using ncsr_xyz() instead of csr_xyz().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_exit.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 6e0c18412795..85c43c83e3b9 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -9,6 +9,7 @@
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
 #include <asm/insn-def.h>
+#include <asm/kvm_nacl.h>
 
 static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			     struct kvm_cpu_trap *trap)
@@ -135,7 +136,7 @@ unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
 void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 				  struct kvm_cpu_trap *trap)
 {
-	unsigned long vsstatus = csr_read(CSR_VSSTATUS);
+	unsigned long vsstatus = ncsr_read(CSR_VSSTATUS);
 
 	/* Change Guest SSTATUS.SPP bit */
 	vsstatus &= ~SR_SPP;
@@ -151,15 +152,15 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 	vsstatus &= ~SR_SIE;
 
 	/* Update Guest SSTATUS */
-	csr_write(CSR_VSSTATUS, vsstatus);
+	ncsr_write(CSR_VSSTATUS, vsstatus);
 
 	/* Update Guest SCAUSE, STVAL, and SEPC */
-	csr_write(CSR_VSCAUSE, trap->scause);
-	csr_write(CSR_VSTVAL, trap->stval);
-	csr_write(CSR_VSEPC, trap->sepc);
+	ncsr_write(CSR_VSCAUSE, trap->scause);
+	ncsr_write(CSR_VSTVAL, trap->stval);
+	ncsr_write(CSR_VSEPC, trap->sepc);
 
 	/* Set Guest PC to Guest exception vector */
-	vcpu->arch.guest_context.sepc = csr_read(CSR_VSTVEC);
+	vcpu->arch.guest_context.sepc = ncsr_read(CSR_VSTVEC);
 
 	/* Set Guest privilege mode to supervisor */
 	vcpu->arch.guest_context.sstatus |= SR_SPP;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
