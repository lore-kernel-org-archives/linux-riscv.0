Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFC9C54E5D
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 23:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8aF1sYo+04dg9+W1hD0TdoAIcfRbhZt4pPIw4A1b08Q=; b=Yih3YzkZB7jCoZ
	/Go10cn5qGbeCBDHnmp1fQ1Ri7NWS7BHf58EeZzVgHJWcy5chr+2PSGtM96skn4fDZSGuKLzj7U5F
	VDahLiCdF7Txq7RGjaLPKeCJJhd4p43ktUccCeNJMCdf+1q81rx3/M43qAk2RCRC9EoQ4CCcVU0jo
	IjDE1phQRvCnqva2lmzAraCpc9k7HiizvYLZCntk6EtGabtz2hPoXgyy0ZYpX3SLxILvemrsaG19h
	lA2gqMco1XfWYymb1Y97IIvjoHOOe97n7eRViQLFI6FdSXFvYQSPkQldnv/If4eNsNgbCzH2SYNZP
	kBGK/ubTkl38XMhaBn9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuWz-0000000G2YJ-1ar0;
	Thu, 14 Mar 2024 23:30:37 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTo-0000000G0JQ-015L
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 23:27:26 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5e4df21f22dso1147169a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 16:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710458835; x=1711063635; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=fVWd/4nHkGU+RZSRNxZTIKvgC6ZcIUosAi3U9bNiK5o=;
        b=QwEJn3MA9pM5ifUwHbk28G4Ef+y07rwNcSdxnjXQKVIz/GaXb2eq+bE3Y8YVw822OK
         8bCz2GVfLsb8rYBHlEN74ZJs3SD6vBZoXUv8ZPkIGjzW3HHjgUY7xqBRO9Y/JrQtnmN4
         f2e4g+5giGcGBmbGQ+bk1saTCPHWPS7Ni/644hgOVz029n2RZ2Us06CEPKyvi0ihVhTo
         a43tP/X/cd12XOQtHYNC7f5CF4khZHo2KG3AdWDV4BnOng7sTnVpFYpOlmZh5V1gTuT9
         tjsZSXgXvtR8NXGWy3VzERTPATa9NvH+QYCuwSKOA/fy8fbncEiZyRpNGbM5cQtFMMjm
         nItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710458835; x=1711063635;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVWd/4nHkGU+RZSRNxZTIKvgC6ZcIUosAi3U9bNiK5o=;
        b=i+ZIFm04YdkKWjJhJ71Biu+51alKpeqDoxRCK5fsXR4qeZ13ynvfZIvB9Z81Qs7DPE
         Ze+6VHHz8wkB/s7cMHsRSdJBBmmtwYopG2/AHZg6gOrhYz1n8tG8yDRP2KoV09etTTxn
         RPZVqSqwDFQ083gtaZqZhM9dlgUKxrYp15bOfq7lCJqLQE8W+ks9lYUSKxKrSd1UKYIz
         lYuUUfB+QJiSwLz72s1APfguvTpwQjUB/Z7A92Bj8aAbaymB+wQHPYGZonwFqTB810l3
         NGUjvRHNsoQ8mBT1bv/CYuX6/74rvXzBuio+E8vQNxmi0b6bPhBHGbI7CexXYGUg8h9E
         CLgA==
X-Forwarded-Encrypted: i=1; AJvYcCV5QDaVXy/fhg4du4j4kMebm/IldFztlYb3605Zn+OsYmUE3tBdSQPHUj8smOyohnq2M4EJ//W3Tx9JSqHPnw5jTcf7X9PRoINGjoClCBok
X-Gm-Message-State: AOJu0YxZprRYutf8UKtNczNozKgBNoe50VwTAgpDD3Qfh6laLYxO+7Dn
	fHyrhwgQ7SudHMzrHsGsfy4Zcwyww8yEbX/BZ6SAYbWz+CIucpEvpLpprOXHSWzHxG/Zp9HphNR
	NZA==
X-Google-Smtp-Source: AGHT+IGRI5hc5CP3CR9IYz2Kmbchzln3C1e7PEoGzqGhInO36w6Nc4buOmgVEVYtprnFqx8Z8ErRa1R6iOg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:6483:0:b0:5dc:2a75:9a19 with SMTP id
 y125-20020a636483000000b005dc2a759a19mr12387pgb.2.1710458834658; Thu, 14 Mar
 2024 16:27:14 -0700 (PDT)
Date: Thu, 14 Mar 2024 16:26:37 -0700
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240314232637.2538648-19-seanjc@google.com>
Subject: [PATCH 18/18] KVM: selftests: Drop @selector from segment helpers
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_162720_550542_06CCAF5D 
X-CRM114-Status: GOOD (  12.61  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Drop the @selector from the kernel code, data, and TSS builders and
instead hardcode the respective selector in the helper.  Accepting a
selector but not a base makes the selector useless, e.g. the data helper
can't create per-vCPU for FS or GS, and so loading GS with KERNEL_DS is
the only logical choice.

And for code and TSS, there is no known reason to ever want multiple
segments, e.g. there are zero plans to support 32-bit kernel code (and
again, that would require more than just the selector).

If KVM selftests ever do add support for per-vCPU segments, it'd arguably
be more readable to add a dedicated helper for building/setting the
per-vCPU segment, and move the common data segment code to an inner
helper.

Lastly, hardcoding the selector reduces the probability of setting the
wrong selector in the vCPU versus what was created by the VM in the GDT.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/lib/x86_64/processor.c      | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index dab719ee7734..6abd50d6e59d 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -438,10 +438,10 @@ static void kvm_seg_fill_gdt_64bit(struct kvm_vm *vm, struct kvm_segment *segp)
 		desc->base3 = segp->base >> 32;
 }
 
-static void kvm_seg_set_kernel_code_64bit(uint16_t selector, struct kvm_segment *segp)
+static void kvm_seg_set_kernel_code_64bit(struct kvm_segment *segp)
 {
 	memset(segp, 0, sizeof(*segp));
-	segp->selector = selector;
+	segp->selector = KERNEL_CS;
 	segp->limit = 0xFFFFFFFFu;
 	segp->s = 0x1; /* kTypeCodeData */
 	segp->type = 0x08 | 0x01 | 0x02; /* kFlagCode | kFlagCodeAccessed
@@ -452,10 +452,10 @@ static void kvm_seg_set_kernel_code_64bit(uint16_t selector, struct kvm_segment
 	segp->present = 1;
 }
 
-static void kvm_seg_set_kernel_data_64bit(uint16_t selector, struct kvm_segment *segp)
+static void kvm_seg_set_kernel_data_64bit(struct kvm_segment *segp)
 {
 	memset(segp, 0, sizeof(*segp));
-	segp->selector = selector;
+	segp->selector = KERNEL_DS;
 	segp->limit = 0xFFFFFFFFu;
 	segp->s = 0x1; /* kTypeCodeData */
 	segp->type = 0x00 | 0x01 | 0x02; /* kFlagData | kFlagDataAccessed
@@ -480,13 +480,12 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
 	return vm_untag_gpa(vm, PTE_GET_PA(*pte)) | (gva & ~HUGEPAGE_MASK(level));
 }
 
-static void kvm_seg_set_tss_64bit(vm_vaddr_t base, struct kvm_segment *segp,
-				  int selector)
+static void kvm_seg_set_tss_64bit(vm_vaddr_t base, struct kvm_segment *segp)
 {
 	memset(segp, 0, sizeof(*segp));
 	segp->base = base;
 	segp->limit = 0x67;
-	segp->selector = selector;
+	segp->selector = KERNEL_TSS;
 	segp->type = 0xb;
 	segp->present = 1;
 }
@@ -510,11 +509,11 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
 
 	kvm_seg_set_unusable(&sregs.ldt);
-	kvm_seg_set_kernel_code_64bit(KERNEL_CS, &sregs.cs);
-	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &sregs.ds);
-	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &sregs.es);
-	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &sregs.gs);
-	kvm_seg_set_tss_64bit(vm->arch.tss, &sregs.tr, KERNEL_TSS);
+	kvm_seg_set_kernel_code_64bit(&sregs.cs);
+	kvm_seg_set_kernel_data_64bit(&sregs.ds);
+	kvm_seg_set_kernel_data_64bit(&sregs.es);
+	kvm_seg_set_kernel_data_64bit(&sregs.gs);
+	kvm_seg_set_tss_64bit(vm->arch.tss, &sregs.tr);
 
 	sregs.cr3 = vm->pgd;
 	vcpu_sregs_set(vcpu, &sregs);
@@ -588,13 +587,13 @@ static void vm_init_descriptor_tables(struct kvm_vm *vm)
 
 	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
 
-	kvm_seg_set_kernel_code_64bit(KERNEL_CS, &seg);
+	kvm_seg_set_kernel_code_64bit(&seg);
 	kvm_seg_fill_gdt_64bit(vm, &seg);
 
-	kvm_seg_set_kernel_data_64bit(KERNEL_DS, &seg);
+	kvm_seg_set_kernel_data_64bit(&seg);
 	kvm_seg_fill_gdt_64bit(vm, &seg);
 
-	kvm_seg_set_tss_64bit(vm->arch.tss, &seg, KERNEL_TSS);
+	kvm_seg_set_tss_64bit(vm->arch.tss, &seg);
 	kvm_seg_fill_gdt_64bit(vm, &seg);
 }
 
-- 
2.44.0.291.gc1ea87d7ee-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
