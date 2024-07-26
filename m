Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE02C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xtjN+TA7LXp9mB2PNhg6Ins1lCYi1/M/RP8J1yEQ71E=; b=xxmsmtEtCR9nz1
	2OukEPPurTzGy0ENbgnLjDNSAAJMGW3YC2duKNtor7ljOBRgSldyikhk0o17j8ZBt4rKqoRMaJfmk
	lbBml+Q+I+GyKDDuryS9QhGe/w3+IknRl8hoT4Ch1GlEDJ7usmCqFsAEpeLwIwWQBp2AYQVf9nKzT
	x8HWHQ3sSwZyd3kgJTzCaiNJ6m/oIXkOy0MbiHApcqjAVosGQ2j3mz/quCwKMDuxLbyM6it6BD5q7
	3+sZY7HCcfJWAaiBf0vRnThIg3+yCuvNxieGhcchEymqqM8BgUDDSCOhEs8jCLnhVBGOs+3+xZ2yc
	2G9vafVPBtc1gnZz+o2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXV7h-00000005cHj-30ZA;
	Sat, 27 Jul 2024 00:17:21 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlG-00000005QMM-2Arc
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:13 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-76522d1dca5so1517878a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038049; x=1722642849; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kZSI1KNdqk//fOFhZYsFCszCldNWPUNapLOmZmlQ+ic=;
        b=s4wASBRKd6BS3GoU1RdqDdxBDalyKO12lNqDuIYh4MVTNjAuLy36JY84ZLVgdcEGMb
         YvI4e0Ofx6jKjpuqwTowN8nJ/Ab2zvOh4hk8KjGaCt2ZHMUwHYVbpBxwM3dhOgVPuC/a
         oai1U9/6QbhjLtBFtQVVhKp9YroEuFbePchwAp+3FWJmVytWvPBVkBTXePTVhwo7PFq7
         85qPm5S8VQbcp+nizVjn79vVSXmv3qKwpcOG5APokn/f22Lr8/VryJ7Qfse7pxAWF7LJ
         8F+dbCjoZw9VX/Uh5JFVzoFS5DlLpOo9VGO/UwJ67EszDXRqY39U3gd1vhmYJYQEPraG
         BhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038049; x=1722642849;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZSI1KNdqk//fOFhZYsFCszCldNWPUNapLOmZmlQ+ic=;
        b=HvknMFWgaPu2smm2uy16uqpWT3R6i0u2jiB1X0WiRPpw227MLFRADjgu3WXM7OGo+k
         azWluTss5qIunZsSMDrOIb5eoHc6qotc6xV+QUzGmqewTtPQrz8Cc++1sNugSdm1A+xR
         6tWTbVuouNGGQ4+2cG0oD4exivQWt4OeM6Yk1yhL3nw268JyXkH3x+nraZ26NLxy3qJX
         bwPZmUOnlNfw8z6rJUqVXZg1PVp2xW2jnk6yM+1eHujYK2+L0GSTF2QZtQqlcZ1jHcXn
         X9A9s7IDy9Vi/hUZNQjuT7abUe6krvI5M1wYYDXI0mpULhIII4MdC1meVmkWMa0mO/GQ
         ZTLg==
X-Forwarded-Encrypted: i=1; AJvYcCWRflroVGlITbrs8WkwU5Ev74blITPhQCrUIdRE8MFZKfaJh8NMA8eaF7yJLUVklrihKBwp3gkjhL4H9CvLiR5k8mMk85D9AM35+tBUQTBh
X-Gm-Message-State: AOJu0Yw4IieRQFcUpphHVKdUGatVMF744RuFUcije6HJsnKLBn1lxInx
	tJLZLvXFG1BcWe/cOphtVFnwHj9NRFeSqgi74UMVm/mlc7lKQqwXBs4QHy25SdwuTRowbtKLET5
	nyw==
X-Google-Smtp-Source: AGHT+IHwPJ/UM6h8kXfIVs09j5bz4zlDvOcU2rq/epWSbhMGMPOGMhlwxlAMNu8ktgd9HGr+mJ5fl7Shz2c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:360a:0:b0:7a1:4462:412e with SMTP id
 41be03b00d2f7-7ac8fd30864mr2218a12.9.1722038048851; Fri, 26 Jul 2024 16:54:08
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:53 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-45-seanjc@google.com>
Subject: [PATCH v12 44/84] KVM: x86/mmu: Convert page fault paths to kvm_faultin_pfn()
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
X-CRM114-CacheID: sfid-20240726_165410_619064_DA44C635 
X-CRM114-Status: GOOD (  13.27  )
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

Convert KVM x86 to use the recently introduced __kvm_faultin_pfn().
Opportunstically capture the refcounted_page grabbed by KVM for use in
future changes.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 14 ++++++++++----
 arch/x86/kvm/mmu/mmu_internal.h |  1 +
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 7e7b855ce1e1..53555ea5e5bb 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4369,11 +4369,14 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
 static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
 				 struct kvm_page_fault *fault)
 {
+	unsigned int foll = fault->write ? FOLL_WRITE : 0;
+
 	if (fault->is_private)
 		return kvm_mmu_faultin_pfn_private(vcpu, fault);
 
-	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, true,
-					  fault->write, &fault->map_writable);
+	foll |= FOLL_NOWAIT;
+	fault->pfn = __kvm_faultin_pfn(fault->slot, fault->gfn, foll,
+				       &fault->map_writable, &fault->refcounted_page);
 
 	/*
 	 * If resolving the page failed because I/O is needed to fault-in the
@@ -4400,8 +4403,11 @@ static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
 	 * to wait for IO.  Note, gup always bails if it is unable to quickly
 	 * get a page and a fatal signal, i.e. SIGKILL, is pending.
 	 */
-	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, true, true,
-					  fault->write, &fault->map_writable);
+	foll |= FOLL_INTERRUPTIBLE;
+	foll &= ~FOLL_NOWAIT;
+	fault->pfn = __kvm_faultin_pfn(fault->slot, fault->gfn, foll,
+				       &fault->map_writable, &fault->refcounted_page);
+
 	return RET_PF_CONTINUE;
 }
 
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index a5113347bb12..e1f8385105a5 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -238,6 +238,7 @@ struct kvm_page_fault {
 	/* Outputs of kvm_mmu_faultin_pfn().  */
 	unsigned long mmu_seq;
 	kvm_pfn_t pfn;
+	struct page *refcounted_page;
 	bool map_writable;
 
 	/*
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
