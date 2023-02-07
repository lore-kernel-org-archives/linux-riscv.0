Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E9EC636CC
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 11:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4tDRJaQKTuHxZDMOZjrxXR7PsC0zm/Y8758d12bAYg=; b=jMshNuPksIODvz
	VnriN6NPZIEaWrwSdtT6yoDsRkRgtqJ9J1UQ6WdrXHb3TnyhWkLJ12rzZ7I1eY7YGCkYdcUv7GudC
	cLDt7hZz3EMS0n7wC/1cHFPWUiEZWJKJJZeIweDLgEYmAGQDdAugx9GjqAJaptGVh+nod0dVJBg/e
	ttvd0CApHNCjbfCPgs2hqmMc06mqEuEPk+xXCt8hDerf8wmEweQI0vV2RtwnOpjzjadVZy6m/8mGY
	855s7CMebGYmXTo2OMPZxoE1JNZVyXDNhU7dp9pWfLTUyUBrYOmrLpemRVFlkBMr+xsAF61BdqzLl
	Qdb9PzvGfp4ljYe++ENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLiL-00Bqf2-IY; Tue, 07 Feb 2023 11:00:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPKiT-00BbWC-5S
	for linux-riscv@bombadil.infradead.org; Tue, 07 Feb 2023 09:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=16iMGPpvEnuS3c0dPnPwj+7kUcc1R6qNdww8oitMdu0=; b=Sr3Jn0840C/5OkXxHQVGGapHbH
	Z1JuFRkoxixNrntRf5x+X7KbBdkUDh+Zq0dTNLtsunLT9OP8M1l3Q1ic7LuKw+4p61V3f9LOy/IP5
	vmUVwAk4+VVYcZf0Ly80syGWQV9RSU/WchupTvnQGTGGihCXySofYKuJFHuZyr2t6Pl9MFcDlhbjg
	5dW4rBan2l2Xslq3nvkIo38hqaoHq39/Iq0imjkLSu59V4L7I9Ez2EC3g51tpE7nUaCUddaHp5g1D
	zPzwcAGa3n+A8SvS+pA5mQ/VD21cXKIR589Z8UqFXhSWediV0f+yTVn4hWTEb5TLH30qVqxKZszBM
	VeOVOYvw==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pPKhl-006qt6-0B
	for linux-riscv@lists.infradead.org;
	Tue, 07 Feb 2023 09:56:04 +0000
Received: by mail-pj1-x1031.google.com with SMTP id pj3so14438780pjb.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Feb 2023 01:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16iMGPpvEnuS3c0dPnPwj+7kUcc1R6qNdww8oitMdu0=;
        b=zHrBCSuS7vuO+wfhPSy2R5mWkU98Ej4EbPIAJYMtSwYNE30RsbPiI+ZFGYmu4Oh+eu
         77Q25J5zQOyPpTHhgUjRAyyI5bBkU6cFvu3C+0xrs9wbB92eXwLU8O8brG/hGDgX8OjH
         osDZX8HSyVZcMPP3MFU31U0bjQOA3PFMcEAaWiuoJL1aYSmLFsVKV+egZJgSSMqBFFA5
         VJhWU+0UmEyci/qbuEpkE38+5UXioseArWBvqUoJqDEgQOHi/Z7bOASwjcQayR/50chH
         952IJrB5nYxEuTSp8MH074s6vMkfHodrGe0rGpXr+aumBVb2SXStE+Cl5deQRecnJBDp
         XfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16iMGPpvEnuS3c0dPnPwj+7kUcc1R6qNdww8oitMdu0=;
        b=BhPjVHyuO7CZx/v6QoE0knYSdILnN8rOhySZAnpEqOaWsok5hAMI2ssYO2wt9lWs6V
         f06B5vxI3B5Fv78WrQHOnW4FHR7pbUxvkFPshYsZ62z/kTQwE6SdpYIFA61fyabAXaCr
         jKm+wVRQGV2LaxL8v5NCcpTWM4DkPI/S/jIXG7FJztl55vjy5Vq971I8pXyF2k0xhOWM
         1Y+DsPv+mvLZ3yw9XZsha/+G9xolXLEbwXmXqXp2UYkD20i+JgutieRY/UFQeXoED0uX
         m1RKCwBwEb/geAchf9+x+gKqh6lIH8LlI6AOUyf6J+3MxiIFJLQJnQmrN5n1Z8xLB86G
         zJsg==
X-Gm-Message-State: AO0yUKV02Gp/qS09DS+w/0r9nrY28ui1iwahbJtwFNaO8SEoDLayRqcC
	p85XHi8WYg7fDwC3QzQhZ1d11g==
X-Google-Smtp-Source: AK7set+CURig+ktH3WlV7EnqzFklFbVOAZwjjFNFVrszT7hj2WkS9Lx/69A8CjK1ABaYaHx6Rftt6g==
X-Received: by 2002:a17:902:f2cc:b0:199:2932:6175 with SMTP id h12-20020a170902f2cc00b0019929326175mr1993161plc.20.1675763794923;
        Tue, 07 Feb 2023 01:56:34 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id w8-20020a1709027b8800b0019602b2c00csm4030598pll.175.2023.02.07.01.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 01:56:34 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v6 8/8] RISC-V: KVM: Increment firmware pmu events
Date: Tue,  7 Feb 2023 01:55:29 -0800
Message-Id: <20230207095529.1787260-9-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207095529.1787260-1-atishp@rivosinc.com>
References: <20230207095529.1787260-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_095601_576177_0572A5E2 
X-CRM114-Status: GOOD (  11.30  )
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

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
index 38fa4c0..7c4d5d3 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -11,6 +11,7 @@
 #include <linux/kvm_host.h>
 #include <asm/sbi.h>
 #include <asm/kvm_vcpu_timer.h>
+#include <asm/kvm_vcpu_pmu.h>
 #include <asm/kvm_vcpu_sbi.h>
 
 static int kvm_sbi_ext_time_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
@@ -24,6 +25,7 @@ static int kvm_sbi_ext_time_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		return 0;
 	}
 
+	kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_SET_TIMER);
 #if __riscv_xlen == 32
 	next_cycle = ((u64)cp->a1 << 32) | (u64)cp->a0;
 #else
@@ -55,6 +57,7 @@ static int kvm_sbi_ext_ipi_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		return 0;
 	}
 
+	kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_IPI_SENT);
 	kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
 		if (hbase != -1UL) {
 			if (tmp->vcpu_id < hbase)
@@ -65,6 +68,7 @@ static int kvm_sbi_ext_ipi_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		ret = kvm_riscv_vcpu_set_interrupt(tmp, IRQ_VS_SOFT);
 		if (ret < 0)
 			break;
+		kvm_riscv_vcpu_pmu_incr_fw(tmp, SBI_PMU_FW_IPI_RCVD);
 	}
 
 	return ret;
@@ -87,6 +91,7 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 	switch (funcid) {
 	case SBI_EXT_RFENCE_REMOTE_FENCE_I:
 		kvm_riscv_fence_i(vcpu->kvm, hbase, hmask);
+		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_FENCE_I_SENT);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
 		if (cp->a2 == 0 && cp->a3 == 0)
@@ -94,6 +99,7 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 		else
 			kvm_riscv_hfence_vvma_gva(vcpu->kvm, hbase, hmask,
 						  cp->a2, cp->a3, PAGE_SHIFT);
+		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_SENT);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
 		if (cp->a2 == 0 && cp->a3 == 0)
@@ -104,6 +110,7 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
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
