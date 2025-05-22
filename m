Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921E3C54E90
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 20:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sDu6ffGjcYMoefqWGyf/MlCE+fOXLjCtpEE2osCsEfM=; b=V3/YHOye9aFG6q
	4a3IOqr/CYjI1lSGY1+rxhJfqH81m4RSuk+bel3Y2L/gUH4C2X1fdT1+jF3mNUp+GrpWHctWhkwD9
	vQrYI36DhbwJy8oFHydfYOPCBxR2HDwIY2KWTuIMxBgI61bOSyAbzAf6DnXFEFqCxFlIGWNNbJN1P
	mJBkbULA2/kyXkg2zWmoK5Cl//IhRqvi5T83/Rg5eKVQZyBX1A+f4I671xTaIRUfKBKQPE1HnoIkq
	QfUNPd51bypJS571UC5e/0Etq3b6MTNHWvQncPbH6tIRZTUEAesk/9mPNUNzqrhCMh1OgYUfhZbcG
	pRa78ea5Kvxq9goI+5YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICdj-0000000288E-2fRY;
	Thu, 22 May 2025 20:35:43 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICdf-0000000284Y-2lvA
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 20:35:41 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-30e8daea8c6so5360225a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 13:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747946139; x=1748550939; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9U/5M+ajo+Gkj1tgfbc1vbd2oCHGdy+fsgX0VrxxjDQ=;
        b=didGWNJHySOE7lsh1H9FKvn2fDCkgpipOBoN+aWVYl+WDFXTHDD9pZfJPKKaVdFQB/
         hI817czjf6N7WY4Hr/itB9jwRZJC8jR+IuFbvtLlURqQZhBe0LEGjx/Ens2uazkAf75c
         KnUYw2Q1fi7n7p6G3CYPfoLQjWQkBnyyvA3gc1K6N7jP57QwAFQc1U8ybNaSkurX5VfG
         UHUFUhZlK7/7EYJm5+S/Ue5f2qhh4XDJWCh+vaIIwZoypxeAWuRPtjMxhQlCanYadDs8
         PazDa1VJNNbMA1XihdZh+EM10ltROaK1YxflSwOJpMGN8TWRH/kcIRaejSYGRevoJLUF
         bEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747946139; x=1748550939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9U/5M+ajo+Gkj1tgfbc1vbd2oCHGdy+fsgX0VrxxjDQ=;
        b=lkiC4pj7LXpZ0cnsoWHyooSOpzLQb0OWF6bFSk90/4ONLo5hZuxhbdmV30nq9Yg7QL
         7Z5FnJHg7dLLxiHOfOpETOPFKEf+bdlk9gfzdG97jfXvw4ELKmdh52SyoR1IyA2Gd4lu
         K/WMwOLwjN0oBwlCydigayAFHsXeKueX7h7pxorMtrkg4kM3F3mnk73Z90L+jN1J574a
         c3FdSvQOfNwQShULpKug7FXQ1yVRjDxl/gybgYmHEZmd2Ym0pdpFRTJApYF0HZbXKXRm
         tw7thwJeeVMgtNy5VR6ooH+4gpktdUuOIqdhUApxiR5LhhCqiK4y7+Ga91yHGK8mqLX0
         uG/g==
X-Forwarded-Encrypted: i=1; AJvYcCWOKN4wki0yJV5GB1lezcKmcPxCUgLHgWYdb4DGuVCvuD+yXbQxL48CQqrRPqfX/DqrBnwxN2W4l56UWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdPSe9Jx8Sx4WYBanJd2b3RWcPq2kIPyMWJI3nYZyu6ovrpw4A
	avYaUy/m/UC6v5hsdILYwYqkpNhGDfLTvM4Znwxxe//tSmuqDrIzrpkzCDy6FMRKSPvh06gPfrp
	e/COW
X-Gm-Gg: ASbGncsvtFdpyr68Kv8T26csH552t5vttgwXD5ZYMcj8okfWw+K00J37fLba6QZYcN2
	HpyOlnzleyBtyAPE7qZ1Oe6jRDjAKoO4bslPB9nkKRZDlq8WdT5A6WgkEDqImVmcimYJEfIx4CO
	1zMIzybzayLe9qXZ+2EJntoYfpZ/VBEEwcfS2Iz+sRrq6uAolGr8qv/Q1SUYhucPbrKzbGfB41o
	8NP8Qw9cGlBmRLPQ68wubxxD7lrUyTwGf5le0/xfk69bEdHEStxFxViGG6oO1ctCWYqlPunhJyH
	RuOVTFaz8JT6RcjYNgpomiMsVLb8KInzOEc2fR8qivUMAObUWOr8swaPUcCzgAC8
X-Google-Smtp-Source: AGHT+IELwMEFwHhuScHHyQ7/U0noZU5+9NnOKAusz1Utvndq2rvsq/J8AdaP7d6jJo94bLP1ogTjNw==
X-Received: by 2002:a17:90b:17cc:b0:30e:9349:2d99 with SMTP id 98e67ed59e1d1-310e96b5ff6mr767848a91.5.1747946138723;
        Thu, 22 May 2025 13:35:38 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b229csm5932754a91.10.2025.05.22.13.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 13:35:38 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 13:35:26 -0700
Subject: [PATCH v2 2/5] RISC-V: KVM: Add a hstateen lazy enabler helper
 function
MIME-Version: 1.0
Message-Id: <20250522-kvm_lazy_enable_stateen-v2-2-b7a84991f1c4@rivosinc.com>
References: <20250522-kvm_lazy_enable_stateen-v2-0-b7a84991f1c4@rivosinc.com>
In-Reply-To: <20250522-kvm_lazy_enable_stateen-v2-0-b7a84991f1c4@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_133539_708694_8E1F5096 
X-CRM114-Status: GOOD (  13.54  )
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

Hstateen has different bits that can be enabled lazily at runtime.
Most of them have similar functionality where the hstateen bit must
be enabled if not enabled already. The correpsonding config bit in
vcpu must be enabled as well so that hstateen CSR is updated correctly
during the next vcpu load. In absesnce of Smstateen extension, exit
to the userspace in the trap because CSR access control exists
architecturally only if Smstateen extension is available.

Add a common helper function to achieve the above said objective.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_insn.h |  4 ++++
 arch/riscv/kvm/vcpu_insn.c             | 30 ++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_insn.h b/arch/riscv/include/asm/kvm_vcpu_insn.h
index 350011c83581..1125f3f1c8c4 100644
--- a/arch/riscv/include/asm/kvm_vcpu_insn.h
+++ b/arch/riscv/include/asm/kvm_vcpu_insn.h
@@ -6,6 +6,8 @@
 #ifndef __KVM_VCPU_RISCV_INSN_H
 #define __KVM_VCPU_RISCV_INSN_H
 
+#include <linux/kvm_types.h>
+
 struct kvm_vcpu;
 struct kvm_run;
 struct kvm_cpu_trap;
@@ -44,5 +46,7 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			      unsigned long fault_addr,
 			      unsigned long htinst);
 int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
+int kvm_riscv_vcpu_hstateen_lazy_enable(struct kvm_vcpu *vcpu, unsigned int csr_num,
+					uint64_t hstateen_feature_bit_mask);
 
 #endif
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 97dec18e6989..0a7e229cfd34 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -235,6 +235,36 @@ static int seed_csr_rmw(struct kvm_vcpu *vcpu, unsigned int csr_num,
 	return KVM_INSN_EXIT_TO_USER_SPACE;
 }
 
+int kvm_riscv_vcpu_hstateen_lazy_enable(struct kvm_vcpu *vcpu, unsigned int csr_num,
+					uint64_t hstateen_feature_bit_mask)
+{
+	/* Access from VS shouldn't trap if smstaeen is not present */
+	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+
+	/*
+	 * Make sure that KVM doesn't enable any guest visible state via sstateen (lower 32 bits)
+	 * yet. Access is restricted to prevent unintended behavior.
+	 */
+	if (hstateen_feature_bit_mask & GENMASK(31, 0)) {
+		pr_err("Unexpected access from lower 32 bits of hstateen0\n");
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+	}
+
+	/* Enable the bit in hstateen0 lazily upon first access */
+	if (!(vcpu->arch.cfg.hstateen0 & hstateen_feature_bit_mask)) {
+		vcpu->arch.cfg.hstateen0 |= hstateen_feature_bit_mask;
+		csr_set(CSR_HSTATEEN0, hstateen_feature_bit_mask);
+		if (IS_ENABLED(CONFIG_32BIT))
+			csr_set(CSR_HSTATEEN0H, hstateen_feature_bit_mask >> 32);
+	} else {
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+	}
+
+	/* Let the guest retry the instruction read after hstateen0 is modified */
+	return KVM_INSN_CONTINUE_SAME_SEPC;
+}
+
 static const struct csr_func csr_funcs[] = {
 	KVM_RISCV_VCPU_AIA_CSR_FUNCS
 	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
