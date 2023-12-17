Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28EEC46CA2
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 20:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N+/AgHZlntavuiZ9KA6xiRuBu89oMW4rooEnENY+i30=; b=Y89iZVlbk7AbUf
	mG6X4rmGlT6oeg2HIhKrgqAdqimpnKSxA2HmDHlXOutwlgI2ZRudjj9sif9IkPDAiH5VpaafaUNRR
	2q7XZ/4ovCMA0KksD8IKtcaDoQ+GWOjgvArc+hV0cl/XclqQm+L+sAhD1NLdGayi2DQttBxTXiAmb
	Rae9HMgkOoERxGRO7/cJQupMsoHaDJbFRuzwktUFtcO80PJF/9NSBRJuS/CLtggw25tNgouJk2dmA
	iisF5cqHdJd8aPerG5JXqshOrhckWZyYQHgIfenUQOmO8HMAS7AA72pW3B1JRifjBaMFkMyTUwhoJ
	bbMpdAYgL/EHaGRYPAGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rExwU-008QGt-1M;
	Sun, 17 Dec 2023 20:40:54 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rExwQ-008QBe-1J
	for linux-riscv@lists.infradead.org;
	Sun, 17 Dec 2023 20:40:52 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-55193d5e8cdso2713928a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Dec 2023 12:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702845648; x=1703450448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqR2C7zz01TFiIRh8DqKIf6Ieu9BaM0pJyMslNaYBQk=;
        b=SP5jhLmUwBNXLO9aSwXbphngnvgYjtwYzgQ1WnLVbsrDEcwoUaOOvkpGgjy/bzFdmw
         LFYxGyzlHlwZLlzuqjfjJ/Clzm2qs9UfkPMT6l2X8+ks5lpjzmJtNHlZqGJ3vsxmd9t9
         EaApskCQwHtpsutiXqfaywPqCp68hE1FFfoD28hE738USysiYwHPSKWTAMFf2OGuoUgx
         7mFjDLoSjoRV376AwKEiTQyXtQ9YVf4g2ujJ7U726BAOL/vv5+QWu6AQa7RTboHidCQb
         9F1pcSrJN54MUg0Np7cqhaoAOGMYpkPSbGtGBKHLZ1EP9Ywnr9C0bJuIt4FCh9dJ35fQ
         wdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702845648; x=1703450448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqR2C7zz01TFiIRh8DqKIf6Ieu9BaM0pJyMslNaYBQk=;
        b=vZ6OKqCQxHwuz559Cuoh1rKfl79leZHjCUqM6moGKRzGduGC9ARJzB/gdEEW/naZrt
         h5cF2RZxdaFicQAvIM8XK/R2FOxnlrPuhygVpOiZYexjCaopTwhf1w0Deom25S1RLUFV
         BVcwVeo6dO0yF0MHEarOPQZ22Hrsm/dFWaFbSWIOndcBfRqqPLdKxYuDZTCmNWxjoYDM
         /1Bfwk76U7lYhn1qPFgiNAVp6fxSwdk272Ed1RHChvxTkwKLp8Kd2PyrhYRbs9fN0+sv
         oIO0LLcY0vl9+WCWS9lPB1jI782vM2e01rcbwtKJ+XZKgazB35T3SUWVzvQ+INzPms4C
         afag==
X-Gm-Message-State: AOJu0YxZbrcPOLz4yj5J5hbNBZNCDOklPU1Zy5Wh8f+kEZ+CeWdHwq32
	jEgvTqmkzvEO/2xFkVbIkgTkaw==
X-Google-Smtp-Source: AGHT+IEfGs4OQaguX6OAmX8Oe3Y0KxLn+ASdz7H+Iz7dSMU5rXaa7WIYeXOCpVviVKaTjXqSem+pTw==
X-Received: by 2002:a17:906:c20e:b0:9e6:38f2:8439 with SMTP id d14-20020a170906c20e00b009e638f28439mr6546645ejz.60.1702845648676;
        Sun, 17 Dec 2023 12:40:48 -0800 (PST)
Received: from localhost (cst-prg-88-42.cust.vodafone.cz. [46.135.88.42])
        by smtp.gmail.com with ESMTPSA id tk7-20020a170907c28700b00a1d1ebc2206sm13365557ejc.72.2023.12.17.12.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 12:40:48 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org,
	conor.dooley@microchip.com
Subject: [PATCH v3 09/13] RISC-V: KVM: Implement SBI STA extension
Date: Sun, 17 Dec 2023 21:40:29 +0100
Message-ID: <20231217204019.36492-24-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231217204019.36492-15-ajones@ventanamicro.com>
References: <20231217204019.36492-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_124050_452971_AD134118 
X-CRM114-Status: GOOD (  17.48  )
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

Add a select SCHED_INFO to the KVM config in order to get run_delay
info. Then implement SBI STA's set-steal-time-shmem function and
kvm_riscv_vcpu_record_steal_time() to provide the steal-time info
to guests.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/Kconfig        |  1 +
 arch/riscv/kvm/vcpu_sbi_sta.c | 96 ++++++++++++++++++++++++++++++++++-
 2 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index dfc237d7875b..148e52b516cf 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -32,6 +32,7 @@ config KVM
 	select KVM_XFER_TO_GUEST_WORK
 	select MMU_NOTIFIER
 	select PREEMPT_NOTIFIERS
+	select SCHED_INFO
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index 87bf1a5f05ce..01f09fe8c3b0 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -6,9 +6,15 @@
 #include <linux/kconfig.h>
 #include <linux/kernel.h>
 #include <linux/kvm_host.h>
+#include <linux/mm.h>
+#include <linux/sizes.h>
 
+#include <asm/bug.h>
+#include <asm/current.h>
 #include <asm/kvm_vcpu_sbi.h>
+#include <asm/page.h>
 #include <asm/sbi.h>
+#include <asm/uaccess.h>
 
 void kvm_riscv_vcpu_sbi_sta_reset(struct kvm_vcpu *vcpu)
 {
@@ -19,14 +25,100 @@ void kvm_riscv_vcpu_sbi_sta_reset(struct kvm_vcpu *vcpu)
 void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
 {
 	gpa_t shmem = vcpu->arch.sta.shmem;
+	u64 last_steal = vcpu->arch.sta.last_steal;
+	u32 *sequence_ptr, sequence;
+	u64 *steal_ptr, steal;
+	unsigned long hva;
+	gfn_t gfn;
 
 	if (shmem == INVALID_GPA)
 		return;
+
+	/*
+	 * shmem is 64-byte aligned (see the enforcement in
+	 * kvm_sbi_sta_steal_time_set_shmem()) and the size of sbi_sta_struct
+	 * is 64 bytes, so we know all its offsets are in the same page.
+	 */
+	gfn = shmem >> PAGE_SHIFT;
+	hva = kvm_vcpu_gfn_to_hva(vcpu, gfn);
+
+	if (WARN_ON(kvm_is_error_hva(hva))) {
+		vcpu->arch.sta.shmem = INVALID_GPA;
+		return;
+	}
+
+	sequence_ptr = (u32 *)(hva + offset_in_page(shmem) +
+			       offsetof(struct sbi_sta_struct, sequence));
+	steal_ptr = (u64 *)(hva + offset_in_page(shmem) +
+			    offsetof(struct sbi_sta_struct, steal));
+
+	if (WARN_ON(get_user(sequence, sequence_ptr)))
+		return;
+
+	sequence = le32_to_cpu(sequence);
+	sequence += 1;
+
+	if (WARN_ON(put_user(cpu_to_le32(sequence), sequence_ptr)))
+		return;
+
+	if (!WARN_ON(get_user(steal, steal_ptr))) {
+		steal = le64_to_cpu(steal);
+		vcpu->arch.sta.last_steal = READ_ONCE(current->sched_info.run_delay);
+		steal += vcpu->arch.sta.last_steal - last_steal;
+		WARN_ON(put_user(cpu_to_le64(steal), steal_ptr));
+	}
+
+	sequence += 1;
+	WARN_ON(put_user(cpu_to_le32(sequence), sequence_ptr));
+
+	kvm_vcpu_mark_page_dirty(vcpu, gfn);
 }
 
 static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
 {
-	return SBI_ERR_FAILURE;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	unsigned long shmem_phys_lo = cp->a0;
+	unsigned long shmem_phys_hi = cp->a1;
+	u32 flags = cp->a2;
+	struct sbi_sta_struct zero_sta = {0};
+	unsigned long hva;
+	bool writable;
+	gpa_t shmem;
+	int ret;
+
+	if (flags != 0)
+		return SBI_ERR_INVALID_PARAM;
+
+	if (shmem_phys_lo == SBI_STA_SHMEM_DISABLE &&
+	    shmem_phys_hi == SBI_STA_SHMEM_DISABLE) {
+		vcpu->arch.sta.shmem = INVALID_GPA;
+		return 0;
+	}
+
+	if (shmem_phys_lo & (SZ_64 - 1))
+		return SBI_ERR_INVALID_PARAM;
+
+	shmem = shmem_phys_lo;
+
+	if (shmem_phys_hi != 0) {
+		if (IS_ENABLED(CONFIG_32BIT))
+			shmem |= ((gpa_t)shmem_phys_hi << 32);
+		else
+			return SBI_ERR_INVALID_ADDRESS;
+	}
+
+	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, shmem >> PAGE_SHIFT, &writable);
+	if (kvm_is_error_hva(hva) || !writable)
+		return SBI_ERR_INVALID_ADDRESS;
+
+	ret = kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(zero_sta));
+	if (ret)
+		return SBI_ERR_FAILURE;
+
+	vcpu->arch.sta.shmem = shmem;
+	vcpu->arch.sta.last_steal = current->sched_info.run_delay;
+
+	return 0;
 }
 
 static int kvm_sbi_ext_sta_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
@@ -52,7 +144,7 @@ static int kvm_sbi_ext_sta_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 
 static unsigned long kvm_sbi_ext_sta_probe(struct kvm_vcpu *vcpu)
 {
-	return 0;
+	return !!sched_info_on();
 }
 
 const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta = {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
