Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23F5C3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hp4xLeb+yGc5e+Q132b8snfik0mrdi4l1dPCwcSeMVI=; b=Bd8VIYkQorO+pH
	YwTn2tJOszImbo+kKU7khBFf6LqvkQHzOkhDmYX/fz6hphw/V3mZg3zKsSwvdKO3UFDQEuewFODKr
	1fY+ghz8HNzlI33gdmMZ9AxJvSHQNTs2tymcVSON2YH+ZuYCQnC12OsMmIK+Jn7seR2emPYvnliLc
	ApqPoOYelTzv6829fOvLMqqb5uIAp/UgmxxIuWUIKPxHZT5bJF5gADrfeTguRga/FiDHzLi3R1CqH
	gfnkuZqDeHEwokeMZRfHYOrvjTaPGIRiERY+FZCK6pGGXxvxr0UV4Cva1L+tnF2ovloXnQ094GLnT
	jzb5g4DgSL2v4I2S+rqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXV8B-00000005cZB-1SdH;
	Sat, 27 Jul 2024 00:17:51 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlK-00000005QPO-1juf
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:17 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2cb63abe6f7so1690664a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038053; x=1722642853; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IbuNIltU7tfSlkccHv78LPGh6NGiPV3XEW5ZkU/rXdY=;
        b=AAQ+rehMPwP1OaP8ajf7vbU3PO1kZAl2spdFSlBxoYr3LbQ+iICjpK3yIoyEGAv8DH
         q0yDVZVH+xEc92179z3XgUH0JkPGl63jfUxXw9dsr7cCgALDDIjBOVXchYiy5l78JlbH
         GFAD0HUBjd1GdkVC8bLkvb0kX0hPhAngRamZMTTHs2D2fWeXePqDtbu5Eqy45Yqmi+Lm
         jee4Fh/8LY3u705ZgLQbPeAe3wUOU/eBgu1hn+qF2gmBKVP9a7/TOha+WPTZ6Nm3QM5m
         XpbNY0lYrJclSXY4HCrfnAO+B4Op7A/LkRboWsfxxmSj+XYt09W3wfpgTfRnch1YWGAb
         zLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038053; x=1722642853;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbuNIltU7tfSlkccHv78LPGh6NGiPV3XEW5ZkU/rXdY=;
        b=GARvRfD9Fpq5+blfas32V0zqR/9+LpaphNT27/WWRIzQb8kWbfWdOnKeGH00EmKqMC
         YKn4m9BMZ/PlX/+sVNqz326/faWZ6UtrKFFb1LJTRkHJCga3IT6joYadRHDLuFkJ45go
         c5JyynupxE7VyrbgV2ptSYh+FY0F3YsqnSjzEYTGGz0+Vrds+kmsIGR9SQeQ//82nsdg
         6slwrST5Ab/54pPknjx2++RJIxFux16t4WUZiZuDL4f8hppihCX9O7JKADCqXullhKPr
         Bn8u/jlsX+MDGpfkKauazTHCTH5ingQ4HNRLlaQtEg39MnmTcPa8EmJ7FuC1hyRO8Q4E
         yXUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGoEgWK4Cwyv6mT/dDGTpQhaCA3saI+betXs/kkleIt0xH9yPErSypmlTcbvBMRxhTfI/VxhHzyTg9Bs98YIt7lJJLPkmYJ4dfqWrTTMQV
X-Gm-Message-State: AOJu0Yz5LT8XdRYaECywmAF1Cl8pXsIWs2HlRwkvOF3vobGp8mKJzAsy
	lRfvxXMOR42qff0CzX+gLVpWRAxvAR0lhDZ3KBS+CkpDweaWD4Yfi5y/MXKOWMB/84+7JvDcnYN
	zYg==
X-Google-Smtp-Source: AGHT+IF1WA3mVZXk9S93pEq2eXLardKUPi+yfLeicmT6epShCKMtCcCE54tvymeWkFnvdj0Qbejb/rqSUKM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:41cc:b0:1fd:87a7:1445 with SMTP id
 d9443c01a7336-1ff0489344bmr935735ad.9.1722038053119; Fri, 26 Jul 2024
 16:54:13 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:55 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-47-seanjc@google.com>
Subject: [PATCH v12 46/84] KVM: x86/mmu: Put refcounted pages instead of
 blindly releasing pfns
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
X-CRM114-CacheID: sfid-20240726_165414_648091_648AF4BA 
X-CRM114-Status: UNSURE (   9.93  )
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

Now that all x86 page fault paths precisely track refcounted pages, use
Use kvm_page_fault.refcounted_page to put references to struct page memory
when finishing page faults.  This is a baby step towards eliminating
kvm_pfn_to_refcounted_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 146e57c9c86d..3cdb1bd80823 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4326,6 +4326,9 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 	lockdep_assert_once(lockdep_is_held(&vcpu->kvm->mmu_lock) ||
 			    r == RET_PF_RETRY);
 
+	if (!fault->refcounted_page)
+		return;
+
 	/*
 	 * If the page that KVM got from the *primary MMU* is writable, and KVM
 	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
@@ -4337,9 +4340,9 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 	 * folio dirty if KVM could locklessly make the SPTE writable.
 	 */
 	if (!fault->map_writable || r == RET_PF_RETRY)
-		kvm_release_pfn_clean(fault->pfn);
+		kvm_release_page_clean(fault->refcounted_page);
 	else
-		kvm_release_pfn_dirty(fault->pfn);
+		kvm_release_page_dirty(fault->refcounted_page);
 }
 
 static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
