Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C35CCD19A
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 00:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FmNvOXAOqnK6We2KIMts0pqGSo6D9tx+5gwKCFIk/QE=; b=OmSaXAPZG1PnDu
	uyOpL/SWZqXr8BCbm6QuZM4goKisLAApvrRppVB+SGh7uv24nLBzbP8J2yBEcPaw84kc8IMkUhwu4
	DCt7BKJBf8Ld0nI3cnRNGoS0hWHKRQkgqdBgJSdqR8EyFql88CajQ8ZasdTz6bWHQlkqOG++CX1sB
	rcprh/cRWBSNwAuWoDRIAxPITeVVt/bXctj9XU1D4luPnaMcCMC6uDFKUotnq+8W6gLGzwcuyiSRN
	x5yav30Ke6jqYAgVwmpOT0X1a5ATgatriOd31GmDvhUWm767u8cTghD+6/Hu1r/iU5xS3KzPmIFQ9
	jDN+gQgE9EiNCMFJn2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPc-00000006Dfy-3eKI;
	Fri, 17 Oct 2025 00:33:43 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YP1-00000006ClY-3aTg
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 00:33:06 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33428befd39so3313308a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 17:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661183; x=1761265983; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EknCUbF2LHWm0fNDNjp+CKNXYZwTUTGxAjt6VludIpM=;
        b=tiQZ08Lwc+2eaNMCPWsvW/oUCGpIOCWKZRHlxgpKWEM6wu3EhVRVrcWCBX7trp8Sbh
         D0tYRFchQ4OpxsQdg7KlE8ODMH0EPINGdx4PGGdiByJNvlj4Ts7qEYaUg+x2AFRZMRUh
         lZ/F7wIl5E6C/Q4inD44A2KwmxVY4E3o5g7UWW3b+vQQrHUZPs3zDuymUhtbri9VR4iw
         JpjLmRfvP6D59lxFvVPChd46aijNfJQsTr9Pe8UyaQFyetjcbXJewSlD6DZdQfos/Qnc
         N3JDHv+j3TmqI79OPYXsdbGWyxKXBA/3Fewx12sSO6+/cYlFGm0i2Y3FioMJCYlfNt06
         Ra8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661183; x=1761265983;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EknCUbF2LHWm0fNDNjp+CKNXYZwTUTGxAjt6VludIpM=;
        b=A2sYA6tfZdDeS/mGoX2K5EyaDR6cSlAItnvbhGcaT7RpbN2K5JcF8M0lu9Y+Ar9dld
         1XVPmb1MlxSyYyjTOhcx+UYTDYbVNbpY7YlmvNNlO3Mxud0pwRk1nfAvHTnMuSDYV4Hz
         0mydlHjg9L9EnsXB+9xEjmSTpglYRMB+l38Tv9LnYasyRfnXU4zPtI9NohrUUAwQH1X4
         eiHTFTk2JNn5eYvJrb0hYX2OYmPGs5KqWxxATJaSfJ+IjJX2N1jSr+jaa7hhDN1L1Tg1
         NPV49J3kknzVbvGR0KhL5IDdfIf+utlVuvcAT9aX4H58g7kwL3hIgqcys0tVQ1ZrCSjm
         1XhQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3PTtCihFXExcJDudnYeLUzVE1fA4gWxQyHBY8trYmJpjvVgLJssqRKLGgmfhp4Gsk+N/eVWxIfob9OQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6f9s3bejeQgt4Os/SwjSK9YsfO2Zo2dwyawRmTNednbfW4u7o
	jUAOqy2fgstymEx7tu5b0ESKYjsf9U3c6//e7ztYtzKemar1CwYkbWcJhqj41Sd8b/VWyN5ug9b
	z19+HnA==
X-Google-Smtp-Source: AGHT+IHp0VFuMyv8iYOF0K3G5i6Db3pbnaDLGLxvBIGhE/qWOYmJanCMeHz3uAv5TWFd0pF3pAUnMoqPNCg=
X-Received: from pjuy20.prod.google.com ([2002:a17:90a:d714:b0:32f:3fab:c9e7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d44c:b0:336:9dcf:ed14
 with SMTP id 98e67ed59e1d1-33bcf8e3b0emr1878293a91.23.1760661182616; Thu, 16
 Oct 2025 17:33:02 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:26 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-9-seanjc@google.com>
Subject: [PATCH v3 08/25] KVM: TDX: Return -EIO, not -EINVAL, on a
 KVM_BUG_ON() condition
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_173303_959168_5F2DC57B 
X-CRM114-Status: GOOD (  11.25  )
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

Return -EIO when a KVM_BUG_ON() is tripped, as KVM's ABI is to return -EIO
when a VM has been killed due to a KVM bug, not -EINVAL.  Note, many (all?)
of the affected paths never propagate the error code to userspace, i.e.
this is about internal consistency more than anything else.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index c3bae6b96dc4..c242d73b6a7b 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1621,7 +1621,7 @@ static int tdx_mem_page_record_premap_cnt(struct kvm *kvm, gfn_t gfn,
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 
 	if (KVM_BUG_ON(kvm->arch.pre_fault_allowed, kvm))
-		return -EINVAL;
+		return -EIO;
 
 	/* nr_premapped will be decreased when tdh_mem_page_add() is called. */
 	atomic64_inc(&kvm_tdx->nr_premapped);
@@ -1635,7 +1635,7 @@ static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
 
 	/* TODO: handle large pages. */
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
-		return -EINVAL;
+		return -EIO;
 
 	/*
 	 * Read 'pre_fault_allowed' before 'kvm_tdx->state'; see matching
@@ -1658,10 +1658,10 @@ static int tdx_sept_drop_private_spte(struct kvm *kvm, gfn_t gfn,
 
 	/* TODO: handle large pages. */
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
-		return -EINVAL;
+		return -EIO;
 
 	if (KVM_BUG_ON(!is_hkid_assigned(kvm_tdx), kvm))
-		return -EINVAL;
+		return -EIO;
 
 	/*
 	 * When zapping private page, write lock is held. So no race condition
@@ -1846,7 +1846,7 @@ static int tdx_sept_free_private_spt(struct kvm *kvm, gfn_t gfn,
 	 * and slot move/deletion.
 	 */
 	if (KVM_BUG_ON(is_hkid_assigned(kvm_tdx), kvm))
-		return -EINVAL;
+		return -EIO;
 
 	/*
 	 * The HKID assigned to this TD was already freed and cache was
@@ -1867,7 +1867,7 @@ static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	 * there can't be anything populated in the private EPT.
 	 */
 	if (KVM_BUG_ON(!is_hkid_assigned(to_kvm_tdx(kvm)), kvm))
-		return -EINVAL;
+		return -EIO;
 
 	ret = tdx_sept_zap_private_spte(kvm, gfn, level, page);
 	if (ret <= 0)
-- 
2.51.0.858.gf9c4a03a3a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
