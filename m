Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DBAD3C92A
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 19:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMHhFE6JsLi+U2ozeyEcoxQBj5N5d6XTRde0cfT0ueI=; b=3Qq7LdUKpR7PLa
	bcJRINCpHRTcyfPV00ueo5tWX6XPnstpKINHbIXNMmW28YUNg41VBhUsGhODcdPZxI29hIHnIrG3a
	CjMhks0qR0Nj4y3FCFUR9ndsTvqaQ/KlKtbDD7L2J03Ws+NnrF9Y6M011Sx6PCdVTPw1ptutSiOpr
	OprVaKQMqdipzCE3tnpV/f+SMA50xY5kFIpIcUWW3Ru/aKSlTXe4ON9PpZkwdCu3iDR3dcdlAPTBU
	AVNNgAyGfauWrkAq6470w0vxbzwgcW629hTA6OMQC9KqubQDBjDhIxaHW6CzI6NMQcNB/Y9MgaaPX
	Wx6zxpTOnO+4xrczc08g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2buW-00000005N3v-26xc;
	Sun, 20 Oct 2024 19:48:21 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2buE-00000005MpF-00d7
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 19:48:05 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2e2dcf4b153so2768410a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 12:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1729453681; x=1730058481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ff+UABGVAF8CyMX5ftgz7r8rHiofHtO4g4dtHWoIbV8=;
        b=HSkfWPyDvHPpsKv9IxbsbUsf5Z8AsUgwcDkncj0O5fgdbMIysfw1r/zIN28Thd4Mha
         3hCBzWpGlHetZUz+ilYeUL7ehJqDIzUVbmjI3F2fOHCkQ1XD0X3unhjK73ZRfOrFA/3q
         TrzOXTojRXzuaS/xE6qEgI42i+2O4rI1ZRIE+AvzQZ5FuotOAxfjUijhhzdXmhk8bsCV
         0VDNwJzMYd76IR8/rCxKvcnA0DausCUODC4FvdQ7fp6B1V8vJYhraLDY56+Ov21Bs3t+
         p43vQVWEReJtJzhFrWrwzuY1fezrxI3xy5o4Ls1fsgoh9k59B/X19GmR65sf0KVBZW7y
         B0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729453681; x=1730058481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ff+UABGVAF8CyMX5ftgz7r8rHiofHtO4g4dtHWoIbV8=;
        b=oN5vQmBMBMjWp94nAIEyusqEgTZadb1a64IiqJs/nnfiefXAzohmGV0HqpiLUvfNO6
         sTRPy3/jxJgQjo0B+zY1mc24xdSEZI3gQF+DeZCufNyryCM6gkyZ/6ywS2e8Ovv90PHU
         M3g/bdhCHED6PwkgBST/EYUbVyusJQwUDx7bYbAzG2OAzd1v891VADkj54utW8Q2iwKt
         1IlfGJBhDNDYzG9EfX6J/7YP588ns7q+Vofh2IlXgDMmW1YEkVawxYixMIvuyOKmLlwm
         DLzi4IBp2BIU0CJ0AfXCu3181w/2AHdXvY6uOSjNIfwVn1uM6XanKujoDC1rmInAO0eX
         G/NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJxq7KHY7AsKRR+mu3dCFt6rIrcPyX9ay8xAQsxg9jjRz7IMdNsvU6D6MNwErC5kPJDXi6Rro0KfbGIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+0HY0j97I6nZLmseYOq6WyEqMJDw6j02j0R6w9aDNcuhLPJi6
	EpmdxYWm7YK6KXQGpTUR/CVZdSAKSriIBLwRResl3K7VpR1SfggeeU1/GDFSJa4=
X-Google-Smtp-Source: AGHT+IF4l6B+I6hyFAY3AFIr33vpTZflrnmvY2Oa86iEJb9FRtrh1tBmUfS3dKy06fjYqz44j4hTMA==
X-Received: by 2002:a17:90b:1d85:b0:2e2:b937:eeae with SMTP id 98e67ed59e1d1-2e5616db601mr11934750a91.5.1729453681266;
        Sun, 20 Oct 2024 12:48:01 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([50.238.223.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad365d4dsm1933188a91.14.2024.10.20.12.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 12:48:00 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 09/13] RISC-V: KVM: Use nacl_csr_xyz() for accessing H-extension CSRs
Date: Mon, 21 Oct 2024 01:17:30 +0530
Message-ID: <20241020194734.58686-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241020194734.58686-1-apatel@ventanamicro.com>
References: <20241020194734.58686-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_124802_231991_3C9FCD29 
X-CRM114-Status: GOOD (  14.30  )
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

When running under some other hypervisor, prefer nacl_csr_xyz()
for accessing H-extension CSRs in the run-loop. This makes CSR
access faster whenever SBI nested acceleration is available.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/mmu.c        |   4 +-
 arch/riscv/kvm/vcpu.c       | 103 +++++++++++++++++++++++++-----------
 arch/riscv/kvm/vcpu_timer.c |  28 +++++-----
 3 files changed, 87 insertions(+), 48 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index b63650f9b966..45ace9138947 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -15,7 +15,7 @@
 #include <linux/vmalloc.h>
 #include <linux/kvm_host.h>
 #include <linux/sched/signal.h>
-#include <asm/csr.h>
+#include <asm/kvm_nacl.h>
 #include <asm/page.h>
 #include <asm/pgtable.h>
 
@@ -732,7 +732,7 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
 	hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) & HGATP_VMID;
 	hgatp |= (k->pgd_phys >> PAGE_SHIFT) & HGATP_PPN;
 
-	csr_write(CSR_HGATP, hgatp);
+	ncsr_write(CSR_HGATP, hgatp);
 
 	if (!kvm_riscv_gstage_vmid_bits())
 		kvm_riscv_local_hfence_gvma_all();
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index a972dd46e7e4..0aad58f984ff 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -17,8 +17,8 @@
 #include <linux/sched/signal.h>
 #include <linux/fs.h>
 #include <linux/kvm_host.h>
-#include <asm/csr.h>
 #include <asm/cacheflush.h>
+#include <asm/kvm_nacl.h>
 #include <asm/kvm_vcpu_vector.h>
 
 #define CREATE_TRACE_POINTS
@@ -368,10 +368,10 @@ void kvm_riscv_vcpu_sync_interrupts(struct kvm_vcpu *vcpu)
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
 	/* Read current HVIP and VSIE CSRs */
-	csr->vsie = csr_read(CSR_VSIE);
+	csr->vsie = ncsr_read(CSR_VSIE);
 
 	/* Sync-up HVIP.VSSIP bit changes does by Guest */
-	hvip = csr_read(CSR_HVIP);
+	hvip = ncsr_read(CSR_HVIP);
 	if ((csr->hvip ^ hvip) & (1UL << IRQ_VS_SOFT)) {
 		if (hvip & (1UL << IRQ_VS_SOFT)) {
 			if (!test_and_set_bit(IRQ_VS_SOFT,
@@ -572,26 +572,49 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
+	void *nsh;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
-	csr_write(CSR_VSSTATUS, csr->vsstatus);
-	csr_write(CSR_VSIE, csr->vsie);
-	csr_write(CSR_VSTVEC, csr->vstvec);
-	csr_write(CSR_VSSCRATCH, csr->vsscratch);
-	csr_write(CSR_VSEPC, csr->vsepc);
-	csr_write(CSR_VSCAUSE, csr->vscause);
-	csr_write(CSR_VSTVAL, csr->vstval);
-	csr_write(CSR_HEDELEG, cfg->hedeleg);
-	csr_write(CSR_HVIP, csr->hvip);
-	csr_write(CSR_VSATP, csr->vsatp);
-	csr_write(CSR_HENVCFG, cfg->henvcfg);
-	if (IS_ENABLED(CONFIG_32BIT))
-		csr_write(CSR_HENVCFGH, cfg->henvcfg >> 32);
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
-		csr_write(CSR_HSTATEEN0, cfg->hstateen0);
+	if (kvm_riscv_nacl_sync_csr_available()) {
+		nsh = nacl_shmem();
+		nacl_csr_write(nsh, CSR_VSSTATUS, csr->vsstatus);
+		nacl_csr_write(nsh, CSR_VSIE, csr->vsie);
+		nacl_csr_write(nsh, CSR_VSTVEC, csr->vstvec);
+		nacl_csr_write(nsh, CSR_VSSCRATCH, csr->vsscratch);
+		nacl_csr_write(nsh, CSR_VSEPC, csr->vsepc);
+		nacl_csr_write(nsh, CSR_VSCAUSE, csr->vscause);
+		nacl_csr_write(nsh, CSR_VSTVAL, csr->vstval);
+		nacl_csr_write(nsh, CSR_HEDELEG, cfg->hedeleg);
+		nacl_csr_write(nsh, CSR_HVIP, csr->hvip);
+		nacl_csr_write(nsh, CSR_VSATP, csr->vsatp);
+		nacl_csr_write(nsh, CSR_HENVCFG, cfg->henvcfg);
+		if (IS_ENABLED(CONFIG_32BIT))
+			nacl_csr_write(nsh, CSR_HENVCFGH, cfg->henvcfg >> 32);
+		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
+			nacl_csr_write(nsh, CSR_HSTATEEN0, cfg->hstateen0);
+			if (IS_ENABLED(CONFIG_32BIT))
+				nacl_csr_write(nsh, CSR_HSTATEEN0H, cfg->hstateen0 >> 32);
+		}
+	} else {
+		csr_write(CSR_VSSTATUS, csr->vsstatus);
+		csr_write(CSR_VSIE, csr->vsie);
+		csr_write(CSR_VSTVEC, csr->vstvec);
+		csr_write(CSR_VSSCRATCH, csr->vsscratch);
+		csr_write(CSR_VSEPC, csr->vsepc);
+		csr_write(CSR_VSCAUSE, csr->vscause);
+		csr_write(CSR_VSTVAL, csr->vstval);
+		csr_write(CSR_HEDELEG, cfg->hedeleg);
+		csr_write(CSR_HVIP, csr->hvip);
+		csr_write(CSR_VSATP, csr->vsatp);
+		csr_write(CSR_HENVCFG, cfg->henvcfg);
 		if (IS_ENABLED(CONFIG_32BIT))
-			csr_write(CSR_HSTATEEN0H, cfg->hstateen0 >> 32);
+			csr_write(CSR_HENVCFGH, cfg->henvcfg >> 32);
+		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
+			csr_write(CSR_HSTATEEN0, cfg->hstateen0);
+			if (IS_ENABLED(CONFIG_32BIT))
+				csr_write(CSR_HSTATEEN0H, cfg->hstateen0 >> 32);
+		}
 	}
 
 	kvm_riscv_gstage_update_hgatp(vcpu);
@@ -614,6 +637,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 {
+	void *nsh;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
 	vcpu->cpu = -1;
@@ -629,15 +653,28 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 					 vcpu->arch.isa);
 	kvm_riscv_vcpu_host_vector_restore(&vcpu->arch.host_context);
 
-	csr->vsstatus = csr_read(CSR_VSSTATUS);
-	csr->vsie = csr_read(CSR_VSIE);
-	csr->vstvec = csr_read(CSR_VSTVEC);
-	csr->vsscratch = csr_read(CSR_VSSCRATCH);
-	csr->vsepc = csr_read(CSR_VSEPC);
-	csr->vscause = csr_read(CSR_VSCAUSE);
-	csr->vstval = csr_read(CSR_VSTVAL);
-	csr->hvip = csr_read(CSR_HVIP);
-	csr->vsatp = csr_read(CSR_VSATP);
+	if (kvm_riscv_nacl_available()) {
+		nsh = nacl_shmem();
+		csr->vsstatus = nacl_csr_read(nsh, CSR_VSSTATUS);
+		csr->vsie = nacl_csr_read(nsh, CSR_VSIE);
+		csr->vstvec = nacl_csr_read(nsh, CSR_VSTVEC);
+		csr->vsscratch = nacl_csr_read(nsh, CSR_VSSCRATCH);
+		csr->vsepc = nacl_csr_read(nsh, CSR_VSEPC);
+		csr->vscause = nacl_csr_read(nsh, CSR_VSCAUSE);
+		csr->vstval = nacl_csr_read(nsh, CSR_VSTVAL);
+		csr->hvip = nacl_csr_read(nsh, CSR_HVIP);
+		csr->vsatp = nacl_csr_read(nsh, CSR_VSATP);
+	} else {
+		csr->vsstatus = csr_read(CSR_VSSTATUS);
+		csr->vsie = csr_read(CSR_VSIE);
+		csr->vstvec = csr_read(CSR_VSTVEC);
+		csr->vsscratch = csr_read(CSR_VSSCRATCH);
+		csr->vsepc = csr_read(CSR_VSEPC);
+		csr->vscause = csr_read(CSR_VSCAUSE);
+		csr->vstval = csr_read(CSR_VSTVAL);
+		csr->hvip = csr_read(CSR_HVIP);
+		csr->vsatp = csr_read(CSR_VSATP);
+	}
 }
 
 static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
@@ -692,7 +729,7 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
-	csr_write(CSR_HVIP, csr->hvip);
+	ncsr_write(CSR_HVIP, csr->hvip);
 	kvm_riscv_vcpu_aia_update_hvip(vcpu);
 }
 
@@ -739,7 +776,9 @@ static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_swap_in_guest_state(vcpu);
 	guest_state_enter_irqoff();
 
-	hcntx->hstatus = csr_swap(CSR_HSTATUS, gcntx->hstatus);
+	hcntx->hstatus = ncsr_swap(CSR_HSTATUS, gcntx->hstatus);
+
+	nsync_csr(-1UL);
 
 	__kvm_riscv_switch_to(&vcpu->arch);
 
@@ -874,8 +913,8 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		trap.sepc = vcpu->arch.guest_context.sepc;
 		trap.scause = csr_read(CSR_SCAUSE);
 		trap.stval = csr_read(CSR_STVAL);
-		trap.htval = csr_read(CSR_HTVAL);
-		trap.htinst = csr_read(CSR_HTINST);
+		trap.htval = ncsr_read(CSR_HTVAL);
+		trap.htinst = ncsr_read(CSR_HTINST);
 
 		/* Syncup interrupts state with HW */
 		kvm_riscv_vcpu_sync_interrupts(vcpu);
diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 75486b25ac45..96e7a4e463f7 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -11,8 +11,8 @@
 #include <linux/kvm_host.h>
 #include <linux/uaccess.h>
 #include <clocksource/timer-riscv.h>
-#include <asm/csr.h>
 #include <asm/delay.h>
+#include <asm/kvm_nacl.h>
 #include <asm/kvm_vcpu_timer.h>
 
 static u64 kvm_riscv_current_cycles(struct kvm_guest_timer *gt)
@@ -72,12 +72,12 @@ static int kvm_riscv_vcpu_timer_cancel(struct kvm_vcpu_timer *t)
 static int kvm_riscv_vcpu_update_vstimecmp(struct kvm_vcpu *vcpu, u64 ncycles)
 {
 #if defined(CONFIG_32BIT)
-		csr_write(CSR_VSTIMECMP, ncycles & 0xFFFFFFFF);
-		csr_write(CSR_VSTIMECMPH, ncycles >> 32);
+	ncsr_write(CSR_VSTIMECMP, ncycles & 0xFFFFFFFF);
+	ncsr_write(CSR_VSTIMECMPH, ncycles >> 32);
 #else
-		csr_write(CSR_VSTIMECMP, ncycles);
+	ncsr_write(CSR_VSTIMECMP, ncycles);
 #endif
-		return 0;
+	return 0;
 }
 
 static int kvm_riscv_vcpu_update_hrtimer(struct kvm_vcpu *vcpu, u64 ncycles)
@@ -289,10 +289,10 @@ static void kvm_riscv_vcpu_update_timedelta(struct kvm_vcpu *vcpu)
 	struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
 
 #if defined(CONFIG_32BIT)
-	csr_write(CSR_HTIMEDELTA, (u32)(gt->time_delta));
-	csr_write(CSR_HTIMEDELTAH, (u32)(gt->time_delta >> 32));
+	ncsr_write(CSR_HTIMEDELTA, (u32)(gt->time_delta));
+	ncsr_write(CSR_HTIMEDELTAH, (u32)(gt->time_delta >> 32));
 #else
-	csr_write(CSR_HTIMEDELTA, gt->time_delta);
+	ncsr_write(CSR_HTIMEDELTA, gt->time_delta);
 #endif
 }
 
@@ -306,10 +306,10 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 		return;
 
 #if defined(CONFIG_32BIT)
-	csr_write(CSR_VSTIMECMP, (u32)t->next_cycles);
-	csr_write(CSR_VSTIMECMPH, (u32)(t->next_cycles >> 32));
+	ncsr_write(CSR_VSTIMECMP, (u32)t->next_cycles);
+	ncsr_write(CSR_VSTIMECMPH, (u32)(t->next_cycles >> 32));
 #else
-	csr_write(CSR_VSTIMECMP, t->next_cycles);
+	ncsr_write(CSR_VSTIMECMP, t->next_cycles);
 #endif
 
 	/* timer should be enabled for the remaining operations */
@@ -327,10 +327,10 @@ void kvm_riscv_vcpu_timer_sync(struct kvm_vcpu *vcpu)
 		return;
 
 #if defined(CONFIG_32BIT)
-	t->next_cycles = csr_read(CSR_VSTIMECMP);
-	t->next_cycles |= (u64)csr_read(CSR_VSTIMECMPH) << 32;
+	t->next_cycles = ncsr_read(CSR_VSTIMECMP);
+	t->next_cycles |= (u64)ncsr_read(CSR_VSTIMECMPH) << 32;
 #else
-	t->next_cycles = csr_read(CSR_VSTIMECMP);
+	t->next_cycles = ncsr_read(CSR_VSTIMECMP);
 #endif
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
