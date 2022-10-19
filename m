Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A332C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 11:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jMwDkzOBMCppqArb8voRSthIvQnpfZmiqE8qyhx9l48=; b=VpfdNwm9TFczuS
	34Sl98fq1T8n84RmMEZJZGFwzZgB6SngC+uEvNOxw3UOIiafOuhpMP1pWZH2PVbR4MTQjI1CeJ7tv
	MeiN5KBX1cVr7JzQAZ+dj0G+Hx1vJPjDVCfVw18Kq6N1+Q7S+dD669OxTp1CzH3qFjcGHwIQdhavp
	WcEZ3ien8KpRHX1QVi9B4jaMZ4r4nC2XTH8i1TUL5P1OCK7kLJ/MezuXwvFY2NEpkjdu8zwKgKwgD
	wePf4nAGuWuJvGBLotsbWFbSuTL4sCgeY+fJNg/Mk4aj2tyNSjF9Tyu10fwJvn4YqUBgyXEk90qvS
	D4HquyqEgYgZm0GxwSmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol7Wm-000zol-Bm; Wed, 19 Oct 2022 11:46:28 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol7W8-000zKx-9V
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 11:45:54 +0000
Received: by mail-pj1-x102d.google.com with SMTP id z5-20020a17090a8b8500b00210a3a2364fso62975pjn.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Oct 2022 04:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGoLnZ3sUUjQ6T551O77F/cGWLjVF5P0hXeaCsgTaUA=;
        b=Vskm+yty8cHq30qB1XgOoU1LcXaaEsiDus8pFxuanPbvYIXPc6bX1hGlNQ0jVDCNx7
         eRrfGWJZtsJKhE+FRBodn3GyYJNof9dRTPdWw5kWatcodxLb7pielQnya3aMZ/idFhDz
         vUhdMfRJQRw1mCEpBP+iGQQneQTwaShSGR5vqu6EqaRbpx9/VFR+p4m+mkzBr8pVVLq1
         T6EgPUC/QTeQCwSmc1lS2hjHIohlhAAjTGDGvl5YxbLcF7TflrNID3CGaZSVQtm1pzVi
         FwQErpkGCfvYOQBTLy5ztGY7xHOyWDh7flnFI3HPRO9Iaf8HYeUTDbjlB2mesrR4KVO/
         Xupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGoLnZ3sUUjQ6T551O77F/cGWLjVF5P0hXeaCsgTaUA=;
        b=pRlFA6NUcXhnQvR8EJ5DYKZIPh6VRwca8ihqdHHoFSDEmPbdg5/1rePh3E4JK4CqBl
         7MDTXAlwxCG7aaQMnSKA8kPVGeUuKHxscL4yKrTqoeQPnJ7mEYumYsWcWLpX7Hg74/0A
         OaKUEfw4WiuLgSPen38Q8jHH4tTHkbfc5msVUOJt6oVxijTrbR82hnKOzuX2NcNDIAMn
         c8s9SqMku8e7mlAprrJQY8c3RT4Uimp0gLI2fECA6T7bbp/pDqk0QNsqcdhNUe9qcBqz
         FmzGrWco3fiUegZzFJNpUJDxV3fpkgnAsAfKPugJ/Oh5pWFfSruUOjciYO7x0S/I/40V
         iq+Q==
X-Gm-Message-State: ACrzQf1Nrrnucw97Ynp6NIWcZjLaUZxTD/TkdwKdY7vDU4+i0RAYDkPI
	ZMb9xUiTwLcFTGssnWpBgnkeRw==
X-Google-Smtp-Source: AMsMyM77U4ULWvxjJJOXxoE5nYztOUYKiByZiqSqBWtTwWGz4p8dLYj8lRpsHAlLZdstaJ2qIsHw8g==
X-Received: by 2002:a17:90b:1bc3:b0:20d:75b8:ee74 with SMTP id oa3-20020a17090b1bc300b0020d75b8ee74mr46164266pjb.1.1666179945267;
        Wed, 19 Oct 2022 04:45:45 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.82.102])
        by smtp.gmail.com with ESMTPSA id e15-20020a17090301cf00b00185507b5ef8sm6664148plh.50.2022.10.19.04.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 04:45:44 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] RISC-V: KVM: Fix kvm_riscv_vcpu_timer_pending() for Sstc
Date: Wed, 19 Oct 2022 17:15:35 +0530
Message-Id: <20221019114535.131469-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_044548_402789_56BDF2EC 
X-CRM114-Status: GOOD (  12.56  )
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

The kvm_riscv_vcpu_timer_pending() checks per-VCPU next_cycles
and per-VCPU software injected VS timer interrupt. This function
returns incorrect value when Sstc is available because the per-VCPU
next_cycles are only updated by kvm_riscv_vcpu_timer_save() called
from kvm_arch_vcpu_put(). As a result, when Sstc is available the
VCPU does not block properly upon WFI traps.

To fix the above issue, we introduce kvm_riscv_vcpu_timer_sync()
which will update per-VCPU next_cycles upon every VM exit instead
of kvm_riscv_vcpu_timer_save().

Fixes: 8f5cb44b1bae ("RISC-V: KVM: Support sstc extension")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_timer.h |  1 +
 arch/riscv/kvm/vcpu.c                   |  3 +++
 arch/riscv/kvm/vcpu_timer.c             | 17 +++++++++++++++--
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_timer.h b/arch/riscv/include/asm/kvm_vcpu_timer.h
index 0d8fdb8ec63a..82f7260301da 100644
--- a/arch/riscv/include/asm/kvm_vcpu_timer.h
+++ b/arch/riscv/include/asm/kvm_vcpu_timer.h
@@ -45,6 +45,7 @@ int kvm_riscv_vcpu_timer_deinit(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_timer_reset(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu);
 void kvm_riscv_guest_timer_init(struct kvm *kvm);
+void kvm_riscv_vcpu_timer_sync(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu);
 bool kvm_riscv_vcpu_timer_pending(struct kvm_vcpu *vcpu);
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index a032c4f0d600..71ebbc4821f0 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -708,6 +708,9 @@ void kvm_riscv_vcpu_sync_interrupts(struct kvm_vcpu *vcpu)
 				clear_bit(IRQ_VS_SOFT, &v->irqs_pending);
 		}
 	}
+
+	/* Sync-up timer CSRs */
+	kvm_riscv_vcpu_timer_sync(vcpu);
 }
 
 int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 185f2386a747..ad34519c8a13 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -320,20 +320,33 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_timer_unblocking(vcpu);
 }
 
-void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
+void kvm_riscv_vcpu_timer_sync(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_timer *t = &vcpu->arch.timer;
 
 	if (!t->sstc_enabled)
 		return;
 
-	t = &vcpu->arch.timer;
 #if defined(CONFIG_32BIT)
 	t->next_cycles = csr_read(CSR_VSTIMECMP);
 	t->next_cycles |= (u64)csr_read(CSR_VSTIMECMPH) << 32;
 #else
 	t->next_cycles = csr_read(CSR_VSTIMECMP);
 #endif
+}
+
+void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_timer *t = &vcpu->arch.timer;
+
+	if (!t->sstc_enabled)
+		return;
+
+	/*
+	 * The vstimecmp CSRs are saved by kvm_riscv_vcpu_timer_sync()
+	 * upon every VM exit so no need to save here.
+	 */
+
 	/* timer should be enabled for the remaining operations */
 	if (unlikely(!t->init_done))
 		return;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
