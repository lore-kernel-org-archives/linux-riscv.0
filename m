Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BFDC3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UxTjJ/EsGhSleSm72SVJuRIXQJ8NTCaKKkpvwt65YDU=; b=qnWn5t5Hc8Ufrd
	s3Gd7lmrVrYQHJqztJZmJyPN0u2cJTwPsl6deLZCVmEVMdzu5S1BxQy5GUz7AaON5atM8CxgJaIBV
	aKLO5sNaGrtdS5x/mp5wlnjO0mEKFxrYdiJbkxkhTuxaEThnFjFLV4kLOAChP+B86NIcnW4hCA+G/
	oZoMdgTctd6etqjI9UshHeuTx0HrY/M7UpJh2l/BOa+GgYBKrVfU54FWR+dpIlb1CG1knsG/l7Cbg
	yltDrUBYBKshK6EsZDZaBNFkcZcRJBJoJMcOglIGN8/BSfd8daFsMvKIOVQr1Qld6lyxEO22DPn0D
	r6XL1aml2PbO26B6lt5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUxv-00000005Xf9-092u;
	Sat, 27 Jul 2024 00:07:15 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUkx-00000005Q6R-05sW
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:53 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-70d1df50db2so1368134b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038030; x=1722642830; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Xse5B7AOfcqAOlY7bR5VB/olShqjuvoHnQg+aILML2Y=;
        b=h7J9kfzruyv2/4kKVm58ZGH4y0IlNudqVeWE6/BepGyMXbF/2OSz2HQIaYFgzPANsE
         xUcLEO9JpXjPzZzr74/E8L1Q7IEpvD6ANmdk5UbfbbWAlZLUCJTkYhWqczOc1RhQYJA9
         PBi0olLVJERvd5wQ8y0FyJwNCQMU3T1+RQkknHc+nNwgu1eVXXzaqI6UhfcTzzULaelf
         vaX+ktifoVrRrEM9eYyCjfvMpgch7a9lXURCHm1I3L40OJDTuBXOc3HroasjaJB0Cor6
         PWJaGmwNbDAykEgtJcOhcLdg43TWWBCwmBxZ0xnKLx1lz/VB0XEzkiEasQyUFJ2b0VLx
         p09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038030; x=1722642830;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xse5B7AOfcqAOlY7bR5VB/olShqjuvoHnQg+aILML2Y=;
        b=vSLDAMZoER6MHK1S6tB5lSM9kSoftE/NLqX7wwsyk3HpSrZWUD1nZjWbxyB9EkNmrg
         9OoYVjtW30K0I3Yn4OyOES0dzQoTk1j069bnKmPDndLQaFMI3RodH7be+xMke7UILZkw
         fLUIN3Gu7EjfkqekF0Hiv6PuU00EODR82jIb+UXhgDcOVB/Au0ahdFy/P+NFBFIjkrI7
         scEWhA9jBMOUY666f+14thywhDUi738TH5eFBIqUchVZex/JPmPkR4w08k35lkhXuuxz
         HaPZdp64nrs8QGs6aoANoBzx3uEZhv6WtGRfFTYRAdw0rVoqa03tODd9u9TB9cq4Ntlt
         W4Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWkX1tbWB8NeCu+LE8nbspr1A0miNkPiJYDcnUdqvlQUddhAEGzsgkEnei7cRdexbAMt0GLWhn1ULVu2te+t+plrTQEfHwYz7+gro2hIJPW
X-Gm-Message-State: AOJu0YylyVdB4luMcnljC+gPmh2JdejJsabKpOihH8Y6vbiUAONSQ2SV
	DSAbfcble27xROh9Q12L6pYskwJRd+ITddi4tLI3MhpHcxnYlny4H+aIUO4b9vrQNNHwayCc5FA
	BLw==
X-Google-Smtp-Source: AGHT+IEFcNwoZPtxzQ32cLJ1vxa7gkQJVcgltXDXIuLlGv+WV+Ss10kIc9nwtzcNKm3zIIgT6vAGf5Ndk9o=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2e2a:b0:70d:9a0e:c13b with SMTP id
 d2e1a72fcca58-70ece7f0562mr55820b3a.3.1722038029490; Fri, 26 Jul 2024
 16:53:49 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:44 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-36-seanjc@google.com>
Subject: [PATCH v12 35/84] KVM: x86: Use kvm_lookup_pfn() to check if retrying
 #PF is useful
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
X-CRM114-CacheID: sfid-20240726_165351_320071_125191C5 
X-CRM114-Status: GOOD (  14.72  )
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

Use kvm_lookup_pfn() instead of an open coded equivalent when checking to
see if KVM should exit to userspace or re-enter the guest after failed
instruction emulation triggered by a guest page fault.

Note, there is a small functional change as kvm_lookup_pfn() doesn't mark
the page as accessed, whereas kvm_release_pfn_clean() does mark the page
accessed (if the pfn is backed by a refcounted struct page).  Neither
behavior is wrong per se, e.g. querying the gfn=>pfn mapping doesn't
actually access the page, but the guest _did_ access the gfn, otherwise
the fault wouldn't have occurred.

That said, either KVM will exit to userspace and the guest will likely be
terminated, or KVM will re-enter the guest and, barring weirdness in the
guest, the guest will re-access the gfn, and KVM will fault-in the pfn and
mark it accessed.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index af6c8cf6a37a..59501ad6e7f5 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8867,7 +8867,6 @@ static bool reexecute_instruction(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 				  int emulation_type)
 {
 	gpa_t gpa = cr2_or_gpa;
-	kvm_pfn_t pfn;
 
 	if (!(emulation_type & EMULTYPE_ALLOW_RETRY_PF))
 		return false;
@@ -8892,22 +8891,15 @@ static bool reexecute_instruction(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 	}
 
 	/*
-	 * Do not retry the unhandleable instruction if it faults on the
-	 * readonly host memory, otherwise it will goto a infinite loop:
+	 * Do not retry the unhandleable instruction if emulation was triggered
+	 * for emulated MMIO, e.g. by a readonly memslot or lack of a memslot,
+	 * otherwise KVM will send the vCPU into an infinite loop:
 	 * retry instruction -> write #PF -> emulation fail -> retry
 	 * instruction -> ...
 	 */
-	pfn = gfn_to_pfn(vcpu->kvm, gpa_to_gfn(gpa));
-
-	/*
-	 * If the instruction failed on the error pfn, it can not be fixed,
-	 * report the error to userspace.
-	 */
-	if (is_error_noslot_pfn(pfn))
+	if (is_error_noslot_pfn(kvm_lookup_pfn(vcpu->kvm, gpa_to_gfn(gpa))))
 		return false;
 
-	kvm_release_pfn_clean(pfn);
-
 	/*
 	 * If emulation may have been triggered by a write to a shadowed page
 	 * table, unprotect the gfn (zap any relevant SPTEs) and re-enter the
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
