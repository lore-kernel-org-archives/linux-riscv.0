Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7877C77B70
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 11:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BlgJg1FRzr7zYrm0kJQ7srwgaYI7FWE322N3pTQfW2c=; b=04l766mNgr52Ox
	f6tSDeX3qE0C0uJrQc3x0OV/1xGan1JxZDozT4+1t73Mkez2bqfO0S+3zf2zSY9wcSLYykPi1QW/U
	h51x5Gph6byEJPEs0YIdIEBZUoNQaQfow2X6WQbT6MYfRNyEK5DKMDXG1tgiPlDd+OxK/ZXH2o82y
	aY43I+0+U0AkcWTXuDrjZpEo5MMzKDYiW1qA4/XYYxsKV+11JofOrDdM+mFABYVfVj3Iz05PlVi2Y
	ohGhTk1pESjB31E5+WV1VxPK73F8FVuU4RzCz3vCEe5DN5FGkHQ5ADK7GQisjmgKQFaN1wRtU/SpC
	t7OudK3yRKz7deE8l0vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poNIc-00G1Yz-2x;
	Mon, 17 Apr 2023 11:45:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poNIb-00G1Vz-01
	for linux-riscv@bombadil.infradead.org;
	Mon, 17 Apr 2023 11:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JguuwLrnRDZVaQeraZ2FTHob1t7RGNbDZmydmwnra/w=; b=jIPbJunaeyHU/fSbVl2cfd/uZi
	k9jiDjvxubcVneJsWeiyPBZYHWnu4pRq/nptc7SZ/vFnY9KOridW8jkjXsmqmdzIkIomfwS4j0HTO
	OiuBYXCwocs3cJ4YOsHxMPQmIwT/JrD9XeK2UbvKUhWCEf8qThsU0rIX3YDo9qIEVXItyEysdFOHJ
	/6Xn+njP4iUE4Gr+nOprNF7oqtBuafNaZIJvG3QOmYOrkD5ObYkAJLHR+F93JgHY4TXTRhpC7Olc7
	mkfT8nxcYF6UDlXqq+fchrt+ncSaejI3FIktRIUF27r7V1Y8REJkeVfGzPr82RDHkKKZ19+SpZbYV
	V23H8zqQ==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poMBi-00HICV-1n
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 10:34:30 +0000
Received: by mail-ej1-x62e.google.com with SMTP id q23so53334240ejz.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 03:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681727659; x=1684319659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JguuwLrnRDZVaQeraZ2FTHob1t7RGNbDZmydmwnra/w=;
        b=gRxVHPhKtD6l4OipjTh24gYmsYbf1yp230ZHqGcQ/a2XjfjO1iPxDh+kqd6Q7Fc6lh
         SyF9vw9EIicHhUOWfiTILru0Nwvqo+rXRkYgVa4pYj596Z5fZhQomn4WZavRJ17ReY4X
         ET/wzqSOdsSiA4Tf6BgGZ3Jzdh6SYUX3IG6t7IQv+Ajw43l69tK2rGbpFO399gh0rSCs
         bw4m26TmUvNKUZx9vLqmD+wyosxWBvZM/ni/0ZOuAFmYrF4N/yjocc+O7nePtOtkpzfH
         Trs9/TYEbKfC+Z/X7NJ/CM0qOR6UOEInHdxADzXU/kit30DxNjV614OoVG4wwJObfplI
         1rgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681727659; x=1684319659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JguuwLrnRDZVaQeraZ2FTHob1t7RGNbDZmydmwnra/w=;
        b=X5TzCVGBNfXVtYf2TEI43FLVpXeoxfIMAbHMy+46MSpVVFQ5v8zFzcWa5NF4sKyN+H
         rJtuwaoAOLjw/Kz1puT8u1kl3mzrTQKBQCwzwboYl+OstEUAg+fdbzp+UvR1FqKPBPs+
         d1GtHWxhepsUkBG2HgiwSa2MF832ljgZ16TDb7ypdwDXYY/AczJwwQXXuvwyPIUUa1G+
         VZ9fi/y9JmmlwnM1ncXvl0LzlKMHcLy2oV3R7O6QUlo8oRMz8lHv6HTCU7qnF+jhWWmt
         vjLk6ylCT/Gy1+yWbBB2LFXWBeUGTYq4nJtOnzTIxMliDv/iuad57cN0NqXVaK29ykCr
         UFyA==
X-Gm-Message-State: AAQBX9dYYaILBAUGmjtnKFUEAYJESJqRrTyml+ifToWxlnGmrme1RW9r
	vOux9Wcs3iPS3QI2qq02PMnJbA==
X-Google-Smtp-Source: AKy350an5Xzp+wCvq2zBA35eJ/YNu8pVdgRFnMpDYcWFLla8sjdubm0UwrxWAFWVkjUOE7L0F2CgDQ==
X-Received: by 2002:a17:906:d7b3:b0:94e:8d63:9319 with SMTP id pk19-20020a170906d7b300b0094e8d639319mr7103057ejb.45.1681727659586;
        Mon, 17 Apr 2023 03:34:19 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id wg7-20020a17090705c700b0094fa3deff33sm428796ejb.35.2023.04.17.03.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 03:34:19 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: [RFC PATCH 08/14] RISC-V: KVM: Implement SBI STA extension
Date: Mon, 17 Apr 2023 12:33:56 +0200
Message-Id: <20230417103402.798596-9-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417103402.798596-1-ajones@ventanamicro.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_113422_673311_B82002D3 
X-CRM114-Status: GOOD (  17.33  )
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

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/Kconfig        |  1 +
 arch/riscv/kvm/vcpu_sbi_sta.c | 96 ++++++++++++++++++++++++++++++++++-
 2 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 5bcb2d519b95..7decdec691af 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -28,6 +28,7 @@ config KVM
 	select KVM_XFER_TO_GUEST_WORK
 	select MMU_NOTIFIER
 	select PREEMPT_NOTIFIERS
+	select SCHED_INFO
 	select SRCU
 	help
 	  Support hosting virtualized guest machines.
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index ecf679082007..bc4f7390a9a8 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -3,22 +3,114 @@
  * Copyright (c) 2023 Ventana Micro Systems Inc.
  */
 
+#include <linux/kernel.h>
 #include <linux/kvm_host.h>
+#include <linux/mm.h>
+#include <linux/sizes.h>
 
+#include <asm/bug.h>
+#include <asm/current.h>
 #include <asm/kvm_vcpu_sbi.h>
+#include <asm/page.h>
 #include <asm/sbi.h>
+#include <asm/uaccess.h>
 
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
+	 * kvm_sbi_sta_set_steal_time_shmem()) and the size of sbi_sta_struct
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
 
 static int kvm_sbi_sta_set_steal_time_shmem(struct kvm_vcpu *vcpu)
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
+	if (shmem_phys_lo == -1 && shmem_phys_hi == -1) {
+		vcpu->arch.sta.shmem = INVALID_GPA;
+		return 0;
+	}
+
+	if (shmem_phys_lo & (SZ_64 - 1))
+		return SBI_ERR_INVALID_PARAM;
+
+	shmem = shmem_phys_lo;
+
+	if (shmem_phys_hi != 0)
+#ifdef CONFIG_32BIT
+		shmem |= ((gpa_t)shmem_phys_hi << 32);
+#else
+		return SBI_ERR_INVALID_ADDRESS;
+#endif
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
@@ -44,7 +136,7 @@ static int kvm_sbi_ext_sta_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 
 static unsigned long kvm_sbi_ext_sta_probe(struct kvm_vcpu *vcpu)
 {
-	return 0;
+	return !!sched_info_on();
 }
 
 const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta = {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
