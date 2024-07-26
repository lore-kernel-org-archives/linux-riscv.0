Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49A6C3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uFxqWa6hXiR3/HO60gdhkH7Au3qgI6AB5Lo171CgJgA=; b=J4UZhVXeaXh7jl
	sxhpHMshSlvFrDkyNnJoMqWhU8onIMCesVBbemUWhYuNP4f3onrJ3NViPtm/TLfxV6O0rukZauD7L
	fF4qG+vwN/zRA4P83ghiET3egnkkBW/Mqg+4b8H26q1iLGJ83LC+UhxPulUNRRLaK95JJ20K0ijWe
	pk3n3Sh6FwthYxOMcif3DA4L3uIhlZwhKiKgcdqRqkxT7YwL8Em/ezg9ztJwZKTBZfz2wsSagr/w0
	OrcNAHryQVq95dw4jIUT46NLhCH9UGcg0TypqoAEpt1SEecfUh0SzjnlxavlgITXdNHpALDru8IJG
	+oTBHz1tpGIPundJV9og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXV00-00000005Yob-1dpM;
	Sat, 27 Jul 2024 00:09:24 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUl7-00000005QEu-1lUC
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:03 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1fc5e61f0bbso13362515ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038040; x=1722642840; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kjY6k542G0oo6Yjo2zUiSEPku2YJftlYNe05DeRMCZs=;
        b=bRqKG9Wa+MUKW1vCG0J73XcCzMXMHemQIBdaDy1XerJJT1Nij4D3pVb1IRMYADK4ZR
         6Udh+HI0jeMTyGj6eJCw46zuK88teH34OVBVlRvV84TTRpZIE95jwmUD/61b+O5xuzCF
         gxpkllcoDYIVpZKoHBclWNdFGdubgE+Ie3dApqxsz4vESIc+Q3893trXFkF0+gJnrBKZ
         9mKxiR9XdOikVg+BiQb9P/QoIBN0rUuJS1LSOJN0z5VgIK+AZ/XQnGSiqsrjxLdIY9M+
         JAGwdLJEF5qlaoT+UkLpiSW4pUUPSRNfLfDKJzaKh7Qn48IzEvFSVNNqDDxXnWt9zEk2
         yuqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038040; x=1722642840;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjY6k542G0oo6Yjo2zUiSEPku2YJftlYNe05DeRMCZs=;
        b=H4Hb3COigp1P1pnSP95t+eeKAaROkKe19t6MImxNXrjoVb6konvAIu4K4xaIp/haD9
         1daJ9rdIJfOmjZlU/PqSq5e/YY9+KG5yf69G9PJViyy/e4E1B5XZ6IAqy9qRAuRF+hK0
         Q4MvffZE/TeODj6eNaeexf6MzyKNk9TazIGITD1/wXMlUguKkVzol9iE8PALQqBwkQuj
         NtSsRZxrXPM+xeKsnmK+LE5BNeFlIiY+UAJyWzI1TSiCV9YumF6Kj8MeNg86MCo0Hudo
         NFgrsjiQfd2bqTSHKW3v6Ab6dYAwTgYdJfqTy5FFBkLmvmf+2WqPSYLuB5RQf70gpJrr
         N04g==
X-Forwarded-Encrypted: i=1; AJvYcCV+XQiem1FAcUSq/bIaXcOKT+DoFEvZoH8GZ9Af+6Xqcl0UGZdReliqE7pY3Wkja3VYUX7vt+mdl+IcbK2Lt7VQoMM3V7L9ZB9Dg3JcF8z+
X-Gm-Message-State: AOJu0YwEM7lA+/7VjVD9sdfIQ3p0T4vo14oXvHNGcbT9bgml9cu2MmEY
	S1No8InNBFGq4uMZb08jx21tOaTgGyhY4zWYW00Dj4UGUS2GqsYwUlUWiAvsRVIA2fmnQ2PhrE0
	w+A==
X-Google-Smtp-Source: AGHT+IHzv0Ay1s7/D5RlCraUOAPppGpx+9DOe5Wc2TnAqa2oJae5LaRq2mY8TBHhwH7zU/okRdoTzatzS5o=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f60c:b0:1f8:6c64:3575 with SMTP id
 d9443c01a7336-1ff046dcdffmr290425ad.0.1722038040140; Fri, 26 Jul 2024
 16:54:00 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:49 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-41-seanjc@google.com>
Subject: [PATCH v12 40/84] KVM: x86/mmu: Add helper to "finish" handling a
 guest page fault
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
X-CRM114-CacheID: sfid-20240726_165401_525314_87938525 
X-CRM114-Status: GOOD (  10.90  )
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

Add a helper to finish/complete the handling of a guest page, e.g. to
mark the pages accessed and put any held references.  In the near
future, this will allow improving the logic without having to copy+paste
changes into all page fault paths.  And in the less near future, will
allow sharing the "finish" API across all architectures.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c         | 12 +++++++++---
 arch/x86/kvm/mmu/paging_tmpl.h |  2 +-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index e76f64f55c4a..1cdd67707461 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4311,6 +4311,12 @@ static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
 	return req_max_level;
 }
 
+static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
+				      struct kvm_page_fault *fault, int r)
+{
+	kvm_release_pfn_clean(fault->pfn);
+}
+
 static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
 				       struct kvm_page_fault *fault)
 {
@@ -4476,7 +4482,7 @@ static int kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
 	 * mmu_lock is acquired.
 	 */
 	if (mmu_invalidate_retry_gfn_unsafe(vcpu->kvm, fault->mmu_seq, fault->gfn)) {
-		kvm_release_pfn_clean(fault->pfn);
+		kvm_mmu_finish_page_fault(vcpu, fault, RET_PF_RETRY);
 		return RET_PF_RETRY;
 	}
 
@@ -4552,8 +4558,8 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	r = direct_map(vcpu, fault);
 
 out_unlock:
+	kvm_mmu_finish_page_fault(vcpu, fault, r);
 	write_unlock(&vcpu->kvm->mmu_lock);
-	kvm_release_pfn_clean(fault->pfn);
 	return r;
 }
 
@@ -4641,8 +4647,8 @@ static int kvm_tdp_mmu_page_fault(struct kvm_vcpu *vcpu,
 	r = kvm_tdp_mmu_map(vcpu, fault);
 
 out_unlock:
+	kvm_mmu_finish_page_fault(vcpu, fault, r);
 	read_unlock(&vcpu->kvm->mmu_lock);
-	kvm_release_pfn_clean(fault->pfn);
 	return r;
 }
 #endif
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index e1c2f098d9d5..b6897916c76b 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -835,8 +835,8 @@ static int FNAME(page_fault)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	r = FNAME(fetch)(vcpu, fault, &walker);
 
 out_unlock:
+	kvm_mmu_finish_page_fault(vcpu, fault, r);
 	write_unlock(&vcpu->kvm->mmu_lock);
-	kvm_release_pfn_clean(fault->pfn);
 	return r;
 }
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
