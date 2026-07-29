Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFE3C54FCD
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 12:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HSx4nommalwCqZYaBQiFYj9db/xcXEQlMed2XIiEVUM=; b=0S0T7nHlM/0oot
	wTCnNys01U2fTsADjCQmqIhWH+YNIkz0pPhdZqOTCDa3IeHgBF9oIsFKCh5aGM1OtbESQMhwfA8Uh
	vpv9ER9xHL5JrWmrnvDxn/0y0xuuc8eMDRhzQFDNOyM4nAM7PUlaqL/6M2WYVUudKKFChMcIwL9LN
	wyjlj4caFiZWiNRmuZZZ9rxtxluEgkCk+EZYZAgpNqz9WtaUvgqYcoHHHYNO5FlZzF5pjTCtpgroh
	unbm5NN0v9LURfHYUGiig1x2zQksCtW69cIeJvT+rMeVzBX/fAQepsKz/D34L5omFJxytnDJKUQvK
	A3GNLvUMXYBQRqqJBVHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp34h-00000007pU3-3yLC;
	Wed, 29 Jul 2026 12:07:51 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp34f-00000007pS4-0Yqq
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 12:07:50 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-cbb92a1213fso221739a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 05:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785326868; x=1785931668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=17CsgCdLrjv6bh5C/KKp5JjzHzr2Ra+7+GSbGZ8H4xY=;
        b=AyqVS3OKhUnx9Ce658o1EdoNcdWzGgeMm4wK9ivKrLFSTHacy8EccAJQLEyeSMO2lK
         OH50/JWoFnyRGLdvGuoal1c1wl8E7NjKyid1h9ClgN1O4HJJ5WUomIAPvldoPMdLrU2t
         7NlAdCqT5QRx4etKFFbQKQx21uAvIYnILUkxwj7x/1U4uFQUbSuzFySkRBeT2qQsuyOB
         2rqPqGSjN9/vV5WMCLgytUqffgRD+z0+MLXY15qGiD4uC6IJBJ/qmUlzes+13dwPS0yx
         zHrR2vDTKATLgEHHPn4WhV0Dv4/rE82gImsdFVWzBt+GENMAu7zAOhF8oWkaeE6MgIeS
         qF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326868; x=1785931668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=17CsgCdLrjv6bh5C/KKp5JjzHzr2Ra+7+GSbGZ8H4xY=;
        b=jQl5QWxVM6+f0tgJB8LZQlljonUvOCqRlYLHyyRFLQshxqStG0zynQkgPA8uZYcxT5
         TZqd4tkFGc1OwHjNRJnWfGRBPBmwkEhQqn8E3JrgwW77OAV3BjFpP0RGLLcDQoEiHB5P
         eKqB33xTfP1RWhz4lyOC5sWxkWdOUr5H/4nkZbM7syoYtVTJTt+a7Vl9ypeSnLlMEpun
         3ZNY1n38DhfJ5f2K8sEImkcNgm/LnJnDCuc70UwjV169E1WOkGNBys2VDdo1dTzXKXbA
         p7AnbfNhU3T6+UXTnl+GqXdiS6pDJ9GDj7RgJGDnR5PI0a+OiT9+PvbuHxdMpm8ZYSmZ
         YSHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrwoO88gWaini2yLvb06GxvJ+W3dxAOOyvnbUZzKWQYxhC7agIgA6MI7KfFwswoCP3YGkSLIuzm2SsEnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ1gStf6EsJ083E7Iu1ckfGXy2WNfQfDQ8n+mGrOEJBZH9iu/+
	0Y9PcImMWkUU2eBVWfJ0kJd6BD6TYAzF/FGjHDCoHtJJpmmYHkhZkoD2
X-Gm-Gg: AR+sD13avB+KnfI2e65hQgb+RGrE/B9qCWUvIu5w2nH6GPLQa7cAjvCrWnRi64uFGEZ
	V6p7ZM+yen2fevk+5pnjHuzLXVJvQ8LKaEu8q7Lf9oUMES/245ztLDAzNtdmliT/riEWNj8HMQA
	16jUOV1La9U5WKpebttPVqnBQw1msXyRdGzb4yJeA3t11yQAECNY8z6yKtwcT+U4KcB9/C6fJo0
	99pPNJgTYxCOpjJcC+mWf0cr41lmUH2BSlBbnmVWwQCsAJPVXVnj9AtL1IbfgVMToAQe/Hj1+Qi
	5Vf2TNkzIrU1V96doSQR8/UP+SrlTR0f8gLbiPgC3hMGh2d7Y90Eb1aWRU/PYDAdaOAQu4ggLFw
	DFBcDtjabAcWPSKtKkJIrUp9L/z6wPBsE3BRrSZs1z8Bk1z0ruQbjUJox9nShfDzpNHrW4m9h8L
	WXFnV5YHmzhwd0DVGH7n7cNuQZQy06fgdUpRA4JdOS3CUSyOdqP43QeGPYjYCQnxgfW+1r5NWRf
	aFpqbDQDNv2xQ==
X-Received: by 2002:a05:6a00:1d8b:b0:846:7507:4e07 with SMTP id d2e1a72fcca58-84e9332c2d6mr6938425b3a.39.1785326868402;
        Wed, 29 Jul 2026 05:07:48 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0055133sm1309570b3a.18.2026.07.29.05.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:07:48 -0700 (PDT)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	stable@vger.kernel.org,
	Bingyu Xian <shanbeeyoo@gmail.com>
Subject: [PATCH v3 3/3] RISC-V: KVM: Widen G-stage fault address to gpa_t
Date: Wed, 29 Jul 2026 20:07:33 +0800
Message-ID: <20260729120733.829457-4-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729120733.829457-1-shanbeeyoo@gmail.com>
References: <20260729075230.743030-1-shanbeeyoo@gmail.com>
 <20260729120733.829457-1-shanbeeyoo@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_050749_190361_C4D1A077 
X-CRM114-Status: GOOD (  13.71  )
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

fault_addr in gstage_page_fault() and the fault_addr parameter of
kvm_riscv_vcpu_mmio_load/store() are unsigned long.  On RV32 with
Sv32x4, guest physical addresses are 34 bits, so a 32-bit unsigned
long truncates bits 32/33 at two points:

  - reconstruction: fault_addr = (trap->htval << 2) | ... is evaluated
    in 32-bit arithmetic, dropping bits 32/33 before widening;
  - the MMIO handler call: even with the local widened, the handler's
    unsigned long parameter narrows it back to 32 bits, aliasing
    accesses above 4 GB into the low 4 GB.

Widen fault_addr to gpa_t end to end: the local in gstage_page_fault(),
the (gpa_t) cast before the <<2 shift, and the fault_addr parameters of
kvm_riscv_vcpu_mmio_load/store().  The handlers' internal uses
(run->mmio.phys_addr is __u64, kvm_io_bus_read/write() take gpa_t) are
already 64-bit, so no further changes are needed.

Also in preparation for sharing a common struct kvm_page_fault across
architectures, where fault_addr is gpa_t.  No functional change on RV64.

Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")
Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Bingyu Xian <shanbeeyoo@gmail.com>
---
 arch/riscv/include/asm/kvm_vcpu_insn.h | 4 ++--
 arch/riscv/kvm/vcpu_exit.c             | 5 +++--
 arch/riscv/kvm/vcpu_insn.c             | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_insn.h b/arch/riscv/include/asm/kvm_vcpu_insn.h
index 350011c83581..a5c50dd4a884 100644
--- a/arch/riscv/include/asm/kvm_vcpu_insn.h
+++ b/arch/riscv/include/asm/kvm_vcpu_insn.h
@@ -38,10 +38,10 @@ int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 				struct kvm_cpu_trap *trap);
 
 int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
-			     unsigned long fault_addr,
+			     gpa_t fault_addr,
 			     unsigned long htinst);
 int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
-			      unsigned long fault_addr,
+			      gpa_t fault_addr,
 			      unsigned long htinst);
 int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
 
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 6c8530b9f29e..28cf9b27bb07 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -17,12 +17,13 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 {
 	struct kvm_gstage_mapping host_map;
 	struct kvm_memory_slot *memslot;
-	unsigned long hva, fault_addr;
+	unsigned long hva;
+	gpa_t fault_addr;
 	bool writable;
 	gfn_t gfn;
 	int ret;
 
-	fault_addr = (trap->htval << 2) | (trap->stval & 0x3);
+	fault_addr = ((gpa_t)trap->htval << 2) | (trap->stval & 0x3);
 	gfn = fault_addr >> PAGE_SHIFT;
 	memslot = gfn_to_memslot(vcpu->kvm, gfn);
 	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index f09f9251d1f0..6506411a3f78 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -371,7 +371,7 @@ int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
  * Returns < 0 to report failure and exit run-loop
  */
 int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
-			     unsigned long fault_addr,
+			     gpa_t fault_addr,
 			     unsigned long htinst)
 {
 	u8 data_buf[8];
@@ -494,7 +494,7 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
  * Returns < 0 to report failure and exit run-loop
  */
 int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
-			      unsigned long fault_addr,
+			      gpa_t fault_addr,
 			      unsigned long htinst)
 {
 	u8 data8;
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
