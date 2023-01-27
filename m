Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E805C61D97
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 19:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffOXjvyiNwH4rlNrWInkJfxS+knmy4HTKXVlRE7Chhc=; b=309lMBLv0vp6RB
	bW4sltzKIfiueOpca/Qdg02Az6IaJqrQ6rkVyLtJrlPkOofxk+glg9FMDijMIeDyY0Z2AMdhg/V08
	09kARds/nSrFhFbyO5//tA3pz48GStfiW/3DgSseMqju3NZsraltgDqAdxZM3FaXRQyyhcav/qyNI
	ZfF++vl1pNdIlnVK0CGcXlzTcekEvA/dDCYUT3FDN3IHQEYy3/sL74MvfN1r/uGii/1NBVqKCTL5e
	BEI/BDjDcdxzCVcNqGmXjUaVWjISw+LrS9ANcSuaasyW4gaisFQKia/twZNh7kbRcW3xXplzySaoC
	9ZWqSI3zVFtzlOqSzWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLTze-00G5fE-28; Fri, 27 Jan 2023 19:02:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLTzc-00G5dY-1B
	for linux-riscv@bombadil.infradead.org; Fri, 27 Jan 2023 19:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+UCsgdBat0A/X8QbgW8UxlHki/znQOwLUkBQOZIZWgo=; b=haXnhlkFJRon0saF9GCv+wPtV5
	Rz2C6QsI3fJpA1Ns7/mOdBfI5CezG4yytmRZNGbGWUhTDxpWRG+iRj2WbOf6PmWEHvY9V2Aafq4oR
	pLr8Qcz09dydl7JWEhyt1XEx6fFtWjYwjW7/EmZqDtuenERYqBOqmaQwh7sJMHBWakm6WhtFOWz+v
	ApJJupygAZFa+I9QVWuTUqm+HgMrLLeE8pbLUS9MmRCNVIvCSNVIflHJ/qUOYFFoPQRvDMdL6InO7
	/yNGpIFpt065G1katK21kHer8LPVgUoRv3ZePnm7U2tKA61P/ec+nzYZW5OVhaUM6ljiWgmPhJyJD
	KQY6FmxQ==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pLTQE-002vek-22
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jan 2023 18:26:03 +0000
Received: by mail-pj1-x102b.google.com with SMTP id w6-20020a17090ac98600b0022c58cc7a18so1043298pjt.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 10:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UCsgdBat0A/X8QbgW8UxlHki/znQOwLUkBQOZIZWgo=;
        b=qTZC1QY7AeVzJn+28DVAop48QwDUY48K0u17ecV9zQxbYCz8Bg0s0HQDbQQdG3i41g
         v5X9wikUTMaYjBauUozPB+4ZVT9+zlxxRx2QVnto/2ZSqEoEJmJJvGXq93/NWmNM7qty
         iyCV3IWGqunMwM2I0qqk/L2qU/CbnX27dkHi0Tj+ci20TWqvQq40vIYzLE4pAndkjDkA
         +esrjVhQT9YpuS8LApEcU6yXB8A7qt0g5+RlwG6LwG3XsiKOzFZM8V0bgCeGoE9p7Dd5
         fOs1D/B65zdExuEvvvu7GjNNTmZkd0G73g3i8rKtDa47KKPlK3mBmyTY/KuRBKY4dNWj
         FNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UCsgdBat0A/X8QbgW8UxlHki/znQOwLUkBQOZIZWgo=;
        b=tzNlgYqMXyct1HimyP76zsIJOtwcbGon58lb7zDa+kPmuOD6bjtdevJcyflMiT6RdL
         26/Eg2cNanJVMSRRUHJ2unhZBK4VAvkVGNRdFAlq/abZylxeIpcaCWPCha6fJ5tBGjVs
         I4JmvQlHHKOL3/EyVKovP7dHwWwD9br3cuTwZoh5Qu5n/dy8KBqhdkb6TY7wLikLmPgb
         hjEPEOUv8AJw5eDzMVKc8YCGxezitSw7vNl56E4fcg6uXDwhFftJrNcPrV30fnh04MWY
         tqxXNUeD/hWWGpVb6gzfFdSAQttDqEv25H+aaeEXbDA9XbOz5XceforLfhP5sgKGK04K
         dIkw==
X-Gm-Message-State: AO0yUKVYZsVgH0sRWdEo/SDap6EBo/o0/xZPPuf21/PpfxxdzzVU6li7
	+2Q5FsTbAeC3qCskMX7JzaMDJA==
X-Google-Smtp-Source: AK7set8tCZddvibqDFZRfz+6EOq+DZgY/T/9oZk6ciwnoibDCr3ANI/hoO5lvwjf7m4N8O2RA+sG2g==
X-Received: by 2002:a17:902:da8e:b0:194:6f3b:3aa1 with SMTP id j14-20020a170902da8e00b001946f3b3aa1mr7245179plx.55.1674843986465;
        Fri, 27 Jan 2023 10:26:26 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jc5-20020a17090325c500b00189d4c666c8sm3195219plb.153.2023.01.27.10.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 10:26:26 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 14/14] RISC-V: KVM: Increment firmware pmu events
Date: Fri, 27 Jan 2023 10:25:58 -0800
Message-Id: <20230127182558.2416400-15-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127182558.2416400-1-atishp@rivosinc.com>
References: <20230127182558.2416400-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_182559_089208_D86D5211 
X-CRM114-Status: GOOD (  12.22  )
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

KVM supports firmware events now. Invoke the firmware event increment
function from appropriate places.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/tlb.c              | 4 ++++
 arch/riscv/kvm/vcpu_sbi_replace.c | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 309d79b..b797f7c 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -181,6 +181,7 @@ void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
 
 void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu)
 {
+	kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_FENCE_I_RCVD);
 	local_flush_icache_all();
 }
 
@@ -264,15 +265,18 @@ void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu)
 						d.addr, d.size, d.order);
 			break;
 		case KVM_RISCV_HFENCE_VVMA_ASID_GVA:
+			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD);
 			kvm_riscv_local_hfence_vvma_asid_gva(
 						READ_ONCE(v->vmid), d.asid,
 						d.addr, d.size, d.order);
 			break;
 		case KVM_RISCV_HFENCE_VVMA_ASID_ALL:
+			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD);
 			kvm_riscv_local_hfence_vvma_asid_all(
 						READ_ONCE(v->vmid), d.asid);
 			break;
 		case KVM_RISCV_HFENCE_VVMA_GVA:
+			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_RCVD);
 			kvm_riscv_local_hfence_vvma_gva(
 						READ_ONCE(v->vmid),
 						d.addr, d.size, d.order);
diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index abeb55f..71a671e 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -11,6 +11,7 @@
 #include <linux/kvm_host.h>
 #include <asm/sbi.h>
 #include <asm/kvm_vcpu_timer.h>
+#include <asm/kvm_vcpu_pmu.h>
 #include <asm/kvm_vcpu_sbi.h>
 
 static int kvm_sbi_ext_time_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
@@ -25,6 +26,7 @@ static int kvm_sbi_ext_time_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		return 0;
 	}
 
+	kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_SET_TIMER);
 #if __riscv_xlen == 32
 	next_cycle = ((u64)cp->a1 << 32) | (u64)cp->a0;
 #else
@@ -57,6 +59,7 @@ static int kvm_sbi_ext_ipi_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		return 0;
 	}
 
+	kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_IPI_SENT);
 	kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
 		if (hbase != -1UL) {
 			if (tmp->vcpu_id < hbase)
@@ -67,6 +70,7 @@ static int kvm_sbi_ext_ipi_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		ret = kvm_riscv_vcpu_set_interrupt(tmp, IRQ_VS_SOFT);
 		if (ret < 0)
 			break;
+		kvm_riscv_vcpu_pmu_incr_fw(tmp, SBI_PMU_FW_IPI_RECVD);
 	}
 
 	return ret;
@@ -90,6 +94,7 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 	switch (funcid) {
 	case SBI_EXT_RFENCE_REMOTE_FENCE_I:
 		kvm_riscv_fence_i(vcpu->kvm, hbase, hmask);
+		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_FENCE_I_SENT);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
 		if (cp->a2 == 0 && cp->a3 == 0)
@@ -97,6 +102,7 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 		else
 			kvm_riscv_hfence_vvma_gva(vcpu->kvm, hbase, hmask,
 						  cp->a2, cp->a3, PAGE_SHIFT);
+		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_SENT);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
 		if (cp->a2 == 0 && cp->a3 == 0)
@@ -107,6 +113,7 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 						       hbase, hmask,
 						       cp->a2, cp->a3,
 						       PAGE_SHIFT, cp->a4);
+		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_SENT);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA:
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
