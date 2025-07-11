Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D81C8303C
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 11:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qH8BIDZmiO49kvHelbSba6/7ZZdbtWAuICizpGwfrrs=; b=C6jsEvzLCycrqY
	yh+u9dBpqKwhieTZAvTCraqDGX5045UpwVolRUTOKoMeJTwmy06YAk6e+L7bvMq1UWfoOhwol6sjG
	TPsNMJ+9D24QjolQBxo+PhAYi2Djwb9dlrUilFw0Aw+gQheJg1j5ofXqjszq4MUhp67y3TaHLm84B
	DLTM40WJ/EtCVYZlH7ytsjWKKYvYiH6fWLLfJ2Md8nBHQJWniIOm8KH6VzOuVzsGUDkVQaDqKuvz+
	6oBaQxdC5ZYqwU5xP3RFpuxfzSVjtHo81daufVtN4HiVGyKLc0YNp0m/kD2xnUaghTGQHDXSdpALU
	R2z3dCyssFrqsslpksPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBpY-0000000EahT-1gmT;
	Fri, 11 Jul 2025 11:22:16 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAnE-0000000EShy-1OMB
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 10:15:50 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-748feca4a61so1250348b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 03:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1752228947; x=1752833747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EooS1f2JEaJ0MSXv8Pftab8ZGwzW6brdtxNMV0U2ebo=;
        b=UoJKmBFudvci2/PQJkYx1m3JLHGOoV52l+bNMoan5dIo9yQRykuH6KG+HyViJ9Bxhc
         rbTK8Xb0QfmXkE4XloMdLEdzWgEtXJflVQCnOx1LhxbvZPj/bql3HYTT1s2cb2bCf4ji
         w7inhjDAs5c6jcfV7mXLnGlli820ChMIIYRtZElVj1WiQpN5qXxILT0VYhobX3fudIHW
         uHNQHzTq/J2eeOficyKRlliQVdnuXffxUhZ/nnltKfJLaSx2KBxRz/vMnn1/1afDPH92
         pKyGEi7x2r7Yv2g3jdiwci9PoK5x5wGbLXPc6Zee4v3kuV7XKv6ksM8Q/mEfWGxYvu9G
         hSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752228947; x=1752833747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EooS1f2JEaJ0MSXv8Pftab8ZGwzW6brdtxNMV0U2ebo=;
        b=AngUAsf7rJQ53Yk3WMd68hQ4lppf0AXAaDAqggKIEGuiyvh+9fcdy+FDVA+K4yC5Xs
         K6KJvNkqo80SZ6hk2n+dMT0jqvQ0sO5yuT5mW1voW5Pdut4d0aCMKmgDyRVlT8w1s190
         +pxxc1pf4nQAcceNclmb91xWantWB/T4hSQpqM5oY6vZUGHIlUc3e3myA0YeBPeiawUv
         2ZBEE+FsOrQQxBBGFuUD/i8OQLAnIUvnS1g1vsTbCFpEI6Z7GmHotGbLVr5HUahsIhNN
         PpuWk/JEfAwNXZSDdfzD6wjcSva8rYUzmdGsu4bjMcE7DrQPW3id0sqOzkzk1PkKSNzL
         6bsA==
X-Forwarded-Encrypted: i=1; AJvYcCVdW4XVRSk0lmS0gYP7EcIAz/LCoMqT23I91uFf3m4y4Cp1xl+WsCxMa5wTJAAk6abfTfBzmXlRkSv7gA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi/4IpadjhcIm/BdXwu1Q5m2v8CQGnK9j6AQ9L4s7fa0XQvvfp
	zmCHYdaevTt+EV2gFzTTYKhkbCGCiUQ0tqkXeJLVIl5LWxE7Rru5afUgIuYK6+lJFNA=
X-Gm-Gg: ASbGncv7afCiDD8ee7dVE0wfzw/LVFpX0OLGwWBqMyiFZoF0gjJ6ezpjyfhxcwLgYPW
	uNSBTmIakyW7WCoG74iyyZPH+yvi85I5xCabrAhCCwsMowD9MRxmQROivMSx5Zc0Tw6qLrAXt0U
	Gev9aFavh4yssQlxtuk8LWohwh9f0gKxuhjeAA5CmDrk9g0Xdad9xLDxPqjDeqZEDPXbBcAnYtL
	y9KcFv4zHDVYlYW845BwARsVuWa8v/GtROomPa58PuFN6TtOfFaE90eEaHJjClvsdtQCLFUhVNN
	MrbHCv2tymWiUan30u0mr/pOt5+yTRbE21vmwdESsPdG3hvPV+znVPOuNnePoKgUv52U3KxWIME
	NH9GlZOP+xRIlAsEbVBd7N6J0ZC8DeJxzR9eVvpywVomQs2iZQ+Tt0IcDAMdgX+B29ZMdm8K5uc
	GobP5NR0X3IQ==
X-Google-Smtp-Source: AGHT+IGpj33BleFxzAPRm55+ECQhrqvsjdgnGSCUQSi44RJyUsIBajs+sZylsyU6wVkfs3hyvw0WQw==
X-Received: by 2002:a05:6a00:2789:b0:748:ffaf:9b53 with SMTP id d2e1a72fcca58-74ee274ca0emr3090929b3a.16.1752228946640;
        Fri, 11 Jul 2025 03:15:46 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd73d1sm4974855b3a.10.2025.07.11.03.15.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Jul 2025 03:15:46 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: rkrcmar@ventanamicro.com,
	cleger@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3] RISC-V: KVM: Delegate illegal instruction fault to VS mode
Date: Fri, 11 Jul 2025 18:15:37 +0800
Message-Id: <20250711101537.16308-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_031548_691048_76E470E6 
X-CRM114-Status: UNSURE (   8.33  )
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

Delegate illegal instruction fault to VS mode in default to avoid such
exceptions being trapped to HS and redirected back to VS.

The delegation of illegal instruction fault is particularly important
to guest applications that use vector instructions frequently. In such
cases, an illegal instruction fault will be raised when guest user thread
uses vector instruction the first time and then guest kernel will enable
user thread to execute following vector instructions.

The fw pmu event counter remains undeleted so that guest can still query
illegal instruction events via sbi call. Guest will only see zero count
on illegal instruction faults and know 'firmware' has delegated it.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/kvm_host.h | 1 +
 arch/riscv/kvm/vcpu_exit.c        | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 85cfebc32e4cf..3f6b9270f366a 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -44,6 +44,7 @@
 #define KVM_REQ_STEAL_UPDATE		KVM_ARCH_REQ(6)
 
 #define KVM_HEDELEG_DEFAULT		(BIT(EXC_INST_MISALIGNED) | \
+					 BIT(EXC_INST_ILLEGAL)     | \
 					 BIT(EXC_BREAKPOINT)      | \
 					 BIT(EXC_SYSCALL)         | \
 					 BIT(EXC_INST_PAGE_FAULT) | \
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 6e0c184127956..cd8fa68f3642c 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -193,11 +193,6 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	ret = -EFAULT;
 	run->exit_reason = KVM_EXIT_UNKNOWN;
 	switch (trap->scause) {
-	case EXC_INST_ILLEGAL:
-		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_ILLEGAL_INSN);
-		vcpu->stat.instr_illegal_exits++;
-		ret = vcpu_redirect(vcpu, trap);
-		break;
 	case EXC_LOAD_MISALIGNED:
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_MISALIGNED_LOAD);
 		vcpu->stat.load_misaligned_exits++;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
