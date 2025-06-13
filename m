Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD71EC61DB2
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 06:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRSeOxMHGfXL4C3xLOIsoERMrXiBb67xht/6MBdyoSI=; b=k7uP78vAQKEGMd
	yKVukVsD6N/DCDyMM409CJhgBC4DmjJo+87D5bPXy6ZCFZ/xTdmoakMgFQzy1qLeYwW5NHpG/7Qic
	bE7t1oGrnB4/4N8HOgHMDan3kQDaYFEoRdTRiLGxgWI3h5cP4SDoLv6iHr7DOqzILe6SFLyH88MZL
	XFG/mXk2Id+O96xC/hskk89JsYgBBx2PUxpRndt9HnYC5XvCE+HzO7Fbao6ri3lH0FvcSA8KUIb7f
	B9BW6vTExSbFARLGHQCyvoJOPWYFimUglgYO1Aea1AIpMSRNC74aVO/+UkTth1zDktHPWV+wW86qd
	mP8BGIln836KXEP9ILFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMe-0000000FXMV-19nD;
	Fri, 13 Jun 2025 06:58:12 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMb-0000000FXKq-3ETx
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 06:58:11 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3135f3511bcso1598836a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 23:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797889; x=1750402689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3W7Bv8eoCvTNzkNO4nvyVAxgoupNAJKpC3g9nF1nD78=;
        b=dBgUC6BYmpwAji4Urv0gQKDMVxOk13kZLKed6gWaaI7iIXkMJQj+RxEhONr4DPCUYJ
         OpFsdq30m8rUvd71IL805fw/SO6bFHaey6ME1ACxXnr4U63ZpsG/qTGEjSxzXy9Zs9fD
         TdSO0ZW0hQKQnIMzzVY7+UEQk102fqaB6YPEIO+kQoSshQSFMwO+QCbRNwAC2WVaGj0y
         j40+3ebqQZhxXcS7wK5S6cFsjnxFWx5RxZwos04sDGPf5kRz08KkPYaYidpG3zDCbaU7
         ZLrATHrqVzNCqp6IUZxxWF/ztc7ZmIfHiHva3DQ+2aoVXhd2rRyFwPYRgRLz0hiDjiGS
         HmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797889; x=1750402689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3W7Bv8eoCvTNzkNO4nvyVAxgoupNAJKpC3g9nF1nD78=;
        b=kmwAWg2e5dizFI21j5+5pmxs+BKU8JkROOTTjM+MbgjKlbjWpVtlyD7idpUDMjAyke
         4dkQfMHTVR8//ePCnt0qQp1JWe+HQ81OZNW1sYOOdCZxfXzkCURyKWGZVuxRIQTwpOTI
         un2RU1RkXO3temv4K04JNQWU5LuSRXGZIjkZNai7va/h4I2SVXKaw9ru64OAdVv4snbt
         S9L3cf5A26qi+9zcONfBFOqUWW47J6EH4xsWoYBGYyn/svTdSgpgOSVX38k7HvB99I/P
         MumNFLWN9fnZGbc//UfOf3eyctrW0XkOWj9zWwecxoHPhqxyVN/IzhnhsIyX5i6Qi9BC
         bS6w==
X-Forwarded-Encrypted: i=1; AJvYcCWHYhlzXYZXpiixJgdFdcL7g4Toqg/PZ9yrbaXlpoh3G22+mPSwPXxT3bpjpVxWaYYhfbgxy3LYI1NXaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMtbnU9DsQ2S85iPJhEVgDbuMHvUA8+8KKLdTC8n3HTepPu1Qa
	55giOQ4w1f+WjXfWcfiBUqQjK9KnNa+XuxTxCHfLfLxDuQS2MfpKrhoNtRbPaH4qqlo=
X-Gm-Gg: ASbGnctyamkMF1qLgFIHLX3GqFs6cznNt8Qmjtb4S6vasj/R3yCyam0088kDoGKbuuK
	VKjxC5gcZVTb7vtVjRlVoc60f3p8dEycWCLTRmpFHqq+NnVZ/vCJPqq+Yetugpmye8cc4L2xZg6
	c/jdoyJ68jxuX9FPqTBSQYBK5CaH3lWiSKftTTbeVrSSxjp+D7dSZxC7fpsOToMYL+zYs5QC/g0
	/keaHHr4z15zq9K1YChLrpo5fv0WmVPhLNwscYm7bglJZHpalGqks/O3jF4DQldeClRuBEYqU0r
	1TS8gx1cLa7wRZS1OCRa7SXxiE5Wxh0hgD5LWNI0hlQaOdJ8mp2DC5J/J9YiPCyGJZ9mLbf2fPd
	J7+FeEAcjuWXYSbaXUsQ=
X-Google-Smtp-Source: AGHT+IECSuEdfJ3+vv5ZN/l8SWOjIXMckOPoSZF/gGT301HnuJfIR6kjlfzE08KH38AjoOLcOVtXeQ==
X-Received: by 2002:a17:90b:4c89:b0:311:c970:c9c0 with SMTP id 98e67ed59e1d1-313d9e926f7mr2384987a91.22.1749797888863;
        Thu, 12 Jun 2025 23:58:08 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:58:08 -0700 (PDT)
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
	Atish Patra <atishp@rivosinc.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>
Subject: [PATCH v2 03/12] RISC-V: KVM: Rename and move kvm_riscv_local_tlb_sanitize()
Date: Fri, 13 Jun 2025 12:27:34 +0530
Message-ID: <20250613065743.737102-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613065743.737102-1-apatel@ventanamicro.com>
References: <20250613065743.737102-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_235809_810597_3C7701C3 
X-CRM114-Status: GOOD (  12.91  )
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

The kvm_riscv_local_tlb_sanitize() deals with sanitizing current
VMID related TLB mappings when a VCPU is moved from one host CPU
to another.

Let's move kvm_riscv_local_tlb_sanitize() to VMID management
sources and rename it to kvm_riscv_gstage_vmid_sanitize().

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h |  3 +--
 arch/riscv/kvm/tlb.c              | 23 -----------------------
 arch/riscv/kvm/vcpu.c             |  4 ++--
 arch/riscv/kvm/vmid.c             | 23 +++++++++++++++++++++++
 4 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 9a617bf5363d..8aa705ac75a5 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -331,8 +331,6 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
 				     unsigned long order);
 void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
 
-void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu);
-
 void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
@@ -380,6 +378,7 @@ unsigned long kvm_riscv_gstage_vmid_bits(void);
 int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
 bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
 void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu);
+void kvm_riscv_gstage_vmid_sanitize(struct kvm_vcpu *vcpu);
 
 int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines);
 
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 2f91ea5f8493..b3461bfd9756 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -156,29 +156,6 @@ void kvm_riscv_local_hfence_vvma_all(unsigned long vmid)
 	csr_write(CSR_HGATP, hgatp);
 }
 
-void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
-{
-	unsigned long vmid;
-
-	if (!kvm_riscv_gstage_vmid_bits() ||
-	    vcpu->arch.last_exit_cpu == vcpu->cpu)
-		return;
-
-	/*
-	 * On RISC-V platforms with hardware VMID support, we share same
-	 * VMID for all VCPUs of a particular Guest/VM. This means we might
-	 * have stale G-stage TLB entries on the current Host CPU due to
-	 * some other VCPU of the same Guest which ran previously on the
-	 * current Host CPU.
-	 *
-	 * To cleanup stale TLB entries, we simply flush all G-stage TLB
-	 * entries by VMID whenever underlying Host CPU changes for a VCPU.
-	 */
-
-	vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
-	kvm_riscv_local_hfence_gvma_vmid_all(vmid);
-}
-
 void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu)
 {
 	kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_FENCE_I_RCVD);
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index f9fb3dbbe0c3..a2dd4161e5a4 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -962,12 +962,12 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		}
 
 		/*
-		 * Cleanup stale TLB enteries
+		 * Sanitize VMID mappings cached (TLB) on current CPU
 		 *
 		 * Note: This should be done after G-stage VMID has been
 		 * updated using kvm_riscv_gstage_vmid_ver_changed()
 		 */
-		kvm_riscv_local_tlb_sanitize(vcpu);
+		kvm_riscv_gstage_vmid_sanitize(vcpu);
 
 		trace_kvm_entry(vcpu);
 
diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index ddc98714ce8e..92c01255f86f 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -122,3 +122,26 @@ void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu)
 	kvm_for_each_vcpu(i, v, vcpu->kvm)
 		kvm_make_request(KVM_REQ_UPDATE_HGATP, v);
 }
+
+void kvm_riscv_gstage_vmid_sanitize(struct kvm_vcpu *vcpu)
+{
+	unsigned long vmid;
+
+	if (!kvm_riscv_gstage_vmid_bits() ||
+	    vcpu->arch.last_exit_cpu == vcpu->cpu)
+		return;
+
+	/*
+	 * On RISC-V platforms with hardware VMID support, we share same
+	 * VMID for all VCPUs of a particular Guest/VM. This means we might
+	 * have stale G-stage TLB entries on the current Host CPU due to
+	 * some other VCPU of the same Guest which ran previously on the
+	 * current Host CPU.
+	 *
+	 * To cleanup stale TLB entries, we simply flush all G-stage TLB
+	 * entries by VMID whenever underlying Host CPU changes for a VCPU.
+	 */
+
+	vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
+	kvm_riscv_local_hfence_gvma_vmid_all(vmid);
+}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
