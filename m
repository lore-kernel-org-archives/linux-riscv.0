Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE270C636D3
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 00:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SH+uEQA0+TUspmh+crOti0nC+z348cmU8R+KH2Mq6eU=; b=k/Lo3nIop2mpD5
	De9LAYd7GjyQUmQyd7fuFVunxyTQG3cZriQMrvlixekDZ2zf+QLSi4hfgHPyQwmOi3KBqd7Nwy6Fh
	J0G/3CkBoT0SCJTQswTWOsGAHAreWRVVlLXFXZM7c2+VxjTsb9JWVmVNMm6VX2RhxDNUBNMe3q+xH
	nUdHSoB8JdO4aEacm4WWzW2DYIT20nzgraNGKhsuRAm5lljVjOE4lxg5DdDl2rvzKDLkX7PIMXQi3
	v62VvCPivpXFMm+bWJ/zFdrcsfdB6DDT8IpvSYljbMbYIz1yUwquRA2qDmSgQJcJxTXmD858ISdVh
	t+XCiDy51WW+hylp/CMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNN43-00Dv53-Fz; Thu, 02 Feb 2023 00:02:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNN41-00Dv1u-CY
	for linux-riscv@bombadil.infradead.org; Thu, 02 Feb 2023 00:02:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=w4PFfmkZSVxP2CL/Y5/7wU7Ccip1msranxSM8TWUoW0=; b=IGYLhLueGy3xJAVw/aj4T6D8jh
	N3suTQVFLwQJwnjaknN2fBQC6QXP4WIOJPOSgwWNvmeeW7kKn8j05cvX3fhhDnVZQxHknjH7TW6Uc
	3331SPQCk4DyAfxaLBeY9XPQQAimj3FlytWPKuxQj5cfbAaSdMa93XJQUEeD35qrXdEQUjMrROiUG
	cQrin/5dJ6LUuTgAaIWfmhrRB/AJhHkdV+/9dbdtxD1DsjlR2XU+6gbeSovyP40dsJWHJYCRfffwP
	GiFgwK5T6N7VE9HfJ6YsAi3znvpoyzOU6FyxqusYyXsRDVg5v51lf+nwXimY0Tp6dJSdWIQkFkipy
	GXD9ScBA==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pNMHM-004wix-17
	for linux-riscv@lists.infradead.org;
	Wed, 01 Feb 2023 23:12:45 +0000
Received: by mail-pl1-x62f.google.com with SMTP id h9so74328plf.9
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 15:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4PFfmkZSVxP2CL/Y5/7wU7Ccip1msranxSM8TWUoW0=;
        b=kIXQyht3i57CKFSn/+04cXebNC+MUSmsOhNHYZ3cKfObergGKpN89XiTzd7l3lWOY8
         AYpZfbxp0YnNvuiisIyFygrftgDKx2SRNDvD9HvbMnRuoKkfK9f9bNq6KnKSm+x2ybAO
         TH91VCb+na27hNmF4Pg2CUaYG/pQfSMkxyz0bpKOTIGOO7XRorvW4mBAFeNB2EtnUbRZ
         RScRmRC+Z7kvybsanMZ0b8jXSqvDjq3RAj6NDhaHtvBmOWtVVs7Zv3zPovclfSWC3qDx
         Bxq+bjHenH4bEpW3YtLMMomotk3xjIdfP4O3GkSQ3ojZxgXxtWV0YmFM/vzXu3J+fMOM
         RgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4PFfmkZSVxP2CL/Y5/7wU7Ccip1msranxSM8TWUoW0=;
        b=wDRePg6Ql8Y3cykCsMw2AHZAEYMsI34q9y0CTmGHGCYmGTifohJM3F0wYPW5Za2iTC
         Mh1hQKXcW1EKxwHoq2/INTYq1Nvz31YOW1TrihX2TEv/D/TvtdvQFrDavM9zMJXXqN/7
         vmeJiR7uDB3wOjCFT1Uy/6IvClYRBJgdOV3KF102XkzVOKH9hBQ7jCZZrQ+UpxBGVQLg
         up8o4fjQmWDpbO6URaQ7lfkfqKtuPEBAIbI7YbnRKT/dCQnY9i/hHTA7hVdyBcUtqfWP
         8lXU9lF0CDo4UGB2Ry3IsduSVWbZ6xHG1RtemBCW8JK2zuGAIQGFL16+gA+b8SmBsWXI
         j/ZA==
X-Gm-Message-State: AO0yUKWG1qMsGF40gs6a9TX8faYBHKapnKdouOup8NPpUiveGPFQu0d5
	1l/FvHNZAF4Es/0bbJFp66Bl8A==
X-Google-Smtp-Source: AK7set9bzR6FtKecwfArBIgDrZjKRJdFMBM6PV1Zt6Wll+D0VfT1JPwBh+f9reewicmTdafk6e+Dxg==
X-Received: by 2002:a17:90b:3e85:b0:230:3432:31fa with SMTP id rj5-20020a17090b3e8500b00230343231famr4268494pjb.28.1675293185824;
        Wed, 01 Feb 2023 15:13:05 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id t3-20020a17090a510300b0022bf0b0e1b7sm1861774pjh.10.2023.02.01.15.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 15:13:05 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 14/14] RISC-V: KVM: Increment firmware pmu events
Date: Wed,  1 Feb 2023 15:12:50 -0800
Message-Id: <20230201231250.3806412-15-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201231250.3806412-1-atishp@rivosinc.com>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_231236_477504_EB38907A 
X-CRM114-Status: GOOD (  12.26  )
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
