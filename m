Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B03C71157
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RLJkXqyZuxUeT/9wQTQ43qU0YUVRC/vDo8lrjkZMOn8=; b=M0j2O8neldh3RT
	FMqEsOKtF9r/NBqtO3g4zeqOSTyv2tzPRBboOJTJfFq679P04nwZq3GQWIjf1QoipmWpCzIVWDz20
	7m+bCFadxYPrdZFYu1Xa/bmj7ll4LkgMCAcRL/UpLHb7HQlEuWDSjCDEaW/VapJbZ2HRGmqWMjzdS
	EffBRBNB1SLN6A609iGron6OSNgJLuhQNd3i+6Qbnwu2am664lU+GZ/6o+6Gp21GPLBUQLvaCafjv
	zBIj+ySFm8hoPW3ogqBBeMn9+tBrMxS0ociNOtYJkGCOPG8wnFUdQYbgK5BIvKdC/98Uhadicc7WP
	lzf8m3RGrGbDHNP1Qjfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsWq-0000000AEhf-02jK;
	Wed, 18 Jun 2025 13:08:36 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr5Y-00000009xkR-3blW
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:36:21 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2363e973db1so4873675ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 04:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246580; x=1750851380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YNO98LyRrwhUY0pfR89F0hA4+0elQu2+nOXauL2xzw=;
        b=Xyp9i0TspFU2Do3gMyr0A066m1GAMhp/dFo7fBHHuFV1cpsRO/xcRxlUjS1Iu3Luku
         F2sqzORGAQnttJcc5ohA2s/9WDoR2mzgkyRHsR6fjl0j9i2xMVzXWjNWrPLj9z4UlGCU
         M6q82Q793YcrNzqGDLnban4EO0Usg2J+rckmDrj+sxlJQKaphgQ9jcFMAuW9eOkMo6Cv
         5lpYPm6o6zK1s1NoPlVbDeY/lbW2vCOiZ6RQjGXGG486rrykzn4lOq39mweJVAL3IoJV
         U8KmJkDvor6BjknOS9gB4SvfykaMT8bV4D27Wg5a3RGSGGeTRmMY+SR3cMteaWBoWu1c
         q53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246580; x=1750851380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/YNO98LyRrwhUY0pfR89F0hA4+0elQu2+nOXauL2xzw=;
        b=LgYUF+2QPXEBG4q34zbmi33eJSs6eD2qz0YGvbxRDR+3cjf9ZB0uBKNqA1GJfivkMa
         VZO9jHCTSACV4s0g0S1f1/PbyKTwBetQWmbKa9WAf6nLB5PtiWvOPBrFxKgBH5CVVJqW
         cDHc69SAG1d09GIWSvMIJY0Jg4i/piuI1W0Uggtyb6IT0HxBpjiyBwTswb9K1DqjDBQU
         tbS2hyRkNARvMT6C2xdy7K9sskHCyEQYJXBh9TD7QYahMxN3u+tdx3v/opnp2yAZVixt
         r6vN1AOOIanuT2REUB+h/9apCt3cDi8ZmXCnn2nHncCUGSkNlp2yWYfo6o+jA+Nmdr9S
         dW8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdqhkLmddgqyn3CbedQyykxYn14wIEG3+zJi+NBwx96orO6VwVE4jNVmCe7s5Wlz9CqXhkjKZDQPF7/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlCkk1KZ1yOrL1H78+pXklUzxWFKUGPX5rw+AF8Qz2BNCQGnk1
	3sw7JXzG+CQKZ0x4ihopVngVRVvTyt4sgLd1qRg1C+4a1kNJBlEzrlvu9IfouMdsf3w=
X-Gm-Gg: ASbGncvujMOasBN5ZJiW9bB24Mf1sfYxoz2kIbMrvLZqjAUiU4RhZ9Bd+nRWMO4kZ6C
	k4aao5xfKA00R8iQpkFvqWYjhLMqXMGAJEp5Ab0+pIZ3vobDKEvOx2bXOdVnVyfs+x9g4kOTmvM
	z+02AD74VCIaRB+AurM7xPXvbHTisL3AI3Tii6DLPeqPmraLrCdnWf39ureaq4jVL0SBsPC0CKm
	vVt7a+7EoSqBggKeLSeFgxsfT4uNRZ2ofRfAzmarum+LCmFZ1DyeH3kwZyChN4YgsOTz4eemQJu
	BZn7XfMH16Vv1ZpUnel2poIp59FXjxJXApMxtUXkAUiNwptICEVp2OHo3kSRXFwiV4RJOxJ4gn/
	ehcFYBXt2cfF8ZRAExg==
X-Google-Smtp-Source: AGHT+IGvNMzA4JkJB3Lqq8VqvqJDedOuU5j6cPnr0JPK19aiVhzcYh8cLYvVgF2E++GIf5MLnFvaZw==
X-Received: by 2002:a17:902:ccc8:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-237c210feedmr34862225ad.25.1750246580053;
        Wed, 18 Jun 2025 04:36:20 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:36:19 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 07/12] RISC-V: KVM: Use ncsr_xyz() in kvm_riscv_vcpu_trap_redirect()
Date: Wed, 18 Jun 2025 17:05:27 +0530
Message-ID: <20250618113532.471448-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_043620_896692_9D43AE03 
X-CRM114-Status: GOOD (  10.26  )
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

Reviewed-by: Atish Patra <atishp@rivosinc.com>
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
