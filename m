Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF237C3DA7F
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MvwqTywn4VlHBjP+mwrMoobyqZy7+t2DJO3uBEdVlig=; b=nKgWROnwHN+U6s
	Yvpu1c/GSHWPxIc0Xvu/44JiJc7V5AhhTWRWFvpEXd4NQAs6aMi/r/hQ68Qh3NJx0FejVOkg1v+PU
	D80G5TXtwnM2pNvQGoZNzTihr5a+xSWERFviB4HXeA39oEz7VWmB4RT+bEhA5g5EBTydOxb9RSh7d
	hmSRI9syXS39SbW8LJXuWHj8mrpgM2U0mVARaOvsXEvfnBpWi/ljfT4mkayWZy4qRw5bxW0vAcEyv
	L0eMWrdNWcsSA1QaniZRnS1PhtZSwdhCWFq1934h7OhyInSdToStTkDRsOxRa+QoSP/ImuxXiQWAY
	3yAZI2t6PbIE8P0he4EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVCz-00000005fMV-3xbl;
	Sat, 27 Jul 2024 00:22:49 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlf-00000005QjF-2jXl
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:37 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2cb4bcdd996so1365956a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038074; x=1722642874; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EmJI7mCwitfWH+6LwHkJyXugWKEFSS3lkF1NSC2iA8Y=;
        b=z/sWPq8X0VYqLhknX9wnJ8pXC+1A7eAW2aJnlwjy8GR1ksgusnC8d3Yb1Huny3aFac
         AcUaSzDAR7VC+YPqYT3xPg789wnEtxX5ItNPiIFAU4F/tnWH1dBId8uvmpXq31g29WHf
         95aAzf1GbIJkdyBKFP3XLYLig6eH9JMoweZ5GwVq3kw+ibUKp9L7wb3ts/13u73m4IeQ
         klaLUmKW3xsswtoFMkd/I728xnRThLuJIIEdpVSFfbezLZ+IStWfiBB+5kuV9ejmxVcg
         Fo1UV230/5WOg+ScK+qEBEjhOWG1qclEXxyvMaAW8IFYQmo900uqR5SyuF42EviuNDmO
         jDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038074; x=1722642874;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmJI7mCwitfWH+6LwHkJyXugWKEFSS3lkF1NSC2iA8Y=;
        b=YWo4CNL7ixon1baGwf2hkgGvJCs36omE0gsp4WxLIVPNAEObo+klpgHZJr1LGZGydy
         Lc/1gjhzN0M+eSEMZnPrn6JfCjWQ9JmmNib+sr06VQ9Ck8+xTFT9ivOdDKK2bmu0dvXn
         i34tLJ+50teFtbttlTi2kei6gmSm0br8Pfou6WKBzSt8Il13l5XRvfgyTMin5nX27tcz
         6KONBqTfcFkntPgJIpvt8JYYtMWrYZM5rL2w3vvICDuCYqdxqmYqLjZcfg9oICQrJoQ9
         lGu8BXrdfwn2jNKrOfQsbsG7LkP/dzXDq5vbb9TWrndRi9L8z+dw/Enu0ulW++A+XOdR
         WmwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM01OR4CT7JK50CysjPK8Mzrenu6TMDeJSgtSFgVu/fjqNyGfZBhmvwC/NITw9+xrEJbBuSc7ampsBP1JVnKGPvQqrxHdiiyN65ezRgVPt
X-Gm-Message-State: AOJu0YwfLTwe2FEFuuM0Zi9pfYUFUh97pKZfV4ZcHsAniiGJFsEcPg49
	IhEKFnvHATagkIIjxK7LEAq6vQAqOz5//7mRfb9N5Qrk2vsYEnJpeR5ShbelLreAfHRurmsv1kP
	h6Q==
X-Google-Smtp-Source: AGHT+IG4DskQJpICSO/7ZhzoCwUBvTBXkkJhFyAvydTVcsfBboV7ccXE3z2KESMy5r+D4xCglFGTF0FLhYg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:470e:b0:2c8:632:7efe with SMTP id
 98e67ed59e1d1-2cf7d1673aamr10630a91.4.1722038073062; Fri, 26 Jul 2024
 16:54:33 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:05 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-57-seanjc@google.com>
Subject: [PATCH v12 56/84] KVM: RISC-V: Mark "struct page" pfns dirty iff a
 stage-2 PTE is installed
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
X-CRM114-CacheID: sfid-20240726_165435_713598_C0FC6151 
X-CRM114-Status: GOOD (  10.62  )
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

Don't mark pages dirty if KVM bails from the page fault handler without
installing a stage-2 mapping, i.e. if the page is guaranteed to not be
written by the guest.

In addition to being a (very) minor fix, this paves the way for converting
RISC-V to use kvm_release_faultin_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index b63650f9b966..06aa5a0d056d 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -669,7 +669,6 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		goto out_unlock;
 
 	if (writable) {
-		kvm_set_pfn_dirty(hfn);
 		mark_page_dirty(kvm, gfn);
 		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
 				      vma_pagesize, false, true);
@@ -682,6 +681,9 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		kvm_err("Failed to map in G-stage\n");
 
 out_unlock:
+	if ((!ret || ret == -EEXIST) && writable)
+		kvm_set_pfn_dirty(hfn);
+
 	spin_unlock(&kvm->mmu_lock);
 	kvm_set_pfn_accessed(hfn);
 	kvm_release_pfn_clean(hfn);
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
