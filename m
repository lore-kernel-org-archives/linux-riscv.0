Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAA9C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s1HX8+9BT/+y6Rs0BhNPJQ5H/NNOK+n7gMQFZwnjS2k=; b=rP4vXlOyPWGifj
	31IlG+2BePC0b6B/aBSw913DnWis0KJb7XXQIvx5VJImoBw0G0VXCxqbMAqkJIucrVBJiX/qzeyw3
	YgY4W/REuZbpx/bekspFZqMj0ds/kTuOFd1YwrONeyPcmhbsv+AdIbSPvM9NfMZFXagA7Uny8AWk9
	xqArBSR5XKL5coR9yjAZSKs6mWYTa7Xdmr4U1NxLRXm+alhntoM4hRcF5x9IRk+qcVpgRxKvsUiXJ
	JnIUEpqY0ESESk9Vfb69QDbyP4lECgqEVNWGKdcHpWbchztUw09qnpch9CPdS5swNyzTLZ4my6UOt
	obziJeNQniJO6vbI89pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVEK-00000005g0a-3w4T;
	Sat, 27 Jul 2024 00:24:12 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlk-00000005QmD-1cnG
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:43 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-66c0f57549fso7716097b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038079; x=1722642879; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=lKpu7mXAQaRbYxbEDOwpqeV9V2sn6fCg4Pm2+RclqqE=;
        b=amvRF73sojBrVVsixwqf2/BTc3bqumQhPW+sDePsVGJusquJ7TcLb6QEfGXt9RJFYN
         HWcfA9/LtYq8FSlBNnWwDNCNw8NkHuLUQQAO+ycvurxUJiBhvQ2s3nZ0FxbZH7+Iet4q
         1VYkHMq4I6d200hyXPNbapazBzkOwBpAoUL4ePzap0J1zvyN7aqMkXV3gqg7TPA3ubyf
         7blcbUoEhVJmuTiqdO1jLNTpW59smLZoHWjLSuDwARZZTFIraUcYGAUjRcBLGVM6jOrc
         KOU5v+CP0CbCvBIv4i7W0n9rWSrJwlY6RccvQIvvYl/xij+lXugvB1//9odswzNQtLM3
         BIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038079; x=1722642879;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKpu7mXAQaRbYxbEDOwpqeV9V2sn6fCg4Pm2+RclqqE=;
        b=KHjI9rNv2z27jCHmkX7sJIMdmFUZCdvZD0zo97OgvuldzHG/6Iun4gHXk5oTPZowrn
         RFiqaAYjphLPFenVVQGiZ5eDDNLMIeMzYFxspow3QeBhYZ6zcccfe7tRzYLW2PIqbap4
         vz1IbDjFxITOlCgW0ADzNnVczcqdCzpQkEU5tOmysNtbNeiidp8Pq/70BTKc4lwqS7kT
         67Bwvg7EksepF3ZNvU+qZtpgG5U53/aCGvK4Zm/oZG6ly/I1MGMlH4O7h99gzJ7IenYO
         NsoyTuZ+jyqtl36ADxzjbqD6ktqwClHZfMRp1Ckj5rz5JgmTSI8Ml1G/4lA2FWbuX/q6
         OZkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr0Cvigk6aLItuJUxiWPQiCD0c8fPsJwGkF4JUQcKMD3yfVR2gdSwqBPKuKxLIxzzAuKIfxuwtebOyKlcQAVfw5a+R+Ll2z3ZLSdAkKfCo
X-Gm-Message-State: AOJu0YwrRIiIv04PHG3OG0Ny8QAVHX7if9AXnvpussMW8WoWQx92Hg6A
	5+lYh8gVFDKCvA0dWR90ukchr8NFvCoVejYiN2RygZ+7XsVibqLJvdznOycF3NNP7Bs1L1YobaD
	FIA==
X-Google-Smtp-Source: AGHT+IHhzhjU3Z65Ec9zcL96WqENi83QMIcwPrprR++iZTSrPH87Hnrc6/v3lgb0Tgsr4AkAwll8yu22uIk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:ec3:b0:663:ddc1:eab8 with SMTP id
 00721157ae682-67a088f07bfmr790257b3.4.1722038078515; Fri, 26 Jul 2024
 16:54:38 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:07 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-59-seanjc@google.com>
Subject: [PATCH v12 58/84] KVM: RISC-V: Use kvm_faultin_pfn() when mapping
 pfns into the guest
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_165440_478366_09CFDBAA 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

Convert RISC-V to __kvm_faultin_pfn()+kvm_release_faultin_page(), which
are new APIs to consolidate arch code and provide consistent behavior
across all KVM architectures.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 806f68e70642..f73d6a79a78c 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -601,6 +601,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 	bool logging = (memslot->dirty_bitmap &&
 			!(memslot->flags & KVM_MEM_READONLY)) ? true : false;
 	unsigned long vma_pagesize, mmu_seq;
+	struct page *page;
 
 	/* We need minimum second+third level pages */
 	ret = kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
@@ -631,7 +632,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 
 	/*
 	 * Read mmu_invalidate_seq so that KVM can detect if the results of
-	 * vma_lookup() or gfn_to_pfn_prot() become stale priort to acquiring
+	 * vma_lookup() or __kvm_faultin_pfn() become stale priort to acquiring
 	 * kvm->mmu_lock.
 	 *
 	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
@@ -647,7 +648,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		return -EFAULT;
 	}
 
-	hfn = gfn_to_pfn_prot(kvm, gfn, is_write, &writable);
+	hfn = kvm_faultin_pfn(vcpu, gfn, is_write, &writable, &page);
 	if (hfn == KVM_PFN_ERR_HWPOISON) {
 		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
 				vma_pageshift, current);
@@ -681,11 +682,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		kvm_err("Failed to map in G-stage\n");
 
 out_unlock:
-	if ((!ret || ret == -EEXIST) && writable)
-		kvm_set_pfn_dirty(hfn);
-	else
-		kvm_release_pfn_clean(hfn);
-
+	kvm_release_faultin_page(kvm, page, ret && ret != -EEXIST, writable);
 	spin_unlock(&kvm->mmu_lock);
 	return ret;
 }
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
