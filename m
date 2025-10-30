Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF62DCCF9E3
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=35Asbgc6RftkzyOjt8vkWE6seQnG8+V3uhY/Gu2BceE=; b=wN8Qh67BRPEXZw
	GwCZC68n0Gpok9uy7mYB0ki65GRN9U8OtRgxdyuEY8o9pDbdF44pRcFigwRLKbbTZXIpRRo5b/H/f
	Al6nkP7Y38G2QqMPKUXwOf2DcrPYbiYAh/iTARO0145tLCRu1MYLboLh2zYBa9lxin+dsCeZHN2th
	GkBvsP/73oEdosP6DZXra8wZ1eDWvCc+JLuXkxCy33R7AUj9NUbVAXH0R9iMJj+UysvsavNBds25h
	sqcaANxfJvA+/5tYw3M4fgeaQlJPYZR0FzZI59PZYoxUUONV1qxE/BeffO/enPc3O/uXuP/bEdLTY
	ldkk1Y/qq61AbFR5jFjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYyU-00000004jct-1HNz;
	Thu, 30 Oct 2025 20:10:23 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYyK-00000004jNp-223X
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 20:10:13 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b6d0014d416so1046442a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 13:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855011; x=1762459811; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pr+88J8V2FFjpoCz/RKjLuOTT6WQDejtYqs45iSU51c=;
        b=gy8lPejeDVZXNYtzQGTLkNsiqx8JxuTzdiRKtETBXa0hSoCU3umgJkQykwJzpbDpwF
         cPYFPZJhW4pgV+jFRgMcA6te9BwGW+S3b1fI+Ys/PFiPXVHdmetDFu2Gazi6gV1RhV4L
         PajxL2LtJHhA+c0m1YqS40lHH9PQnO/cKjU09Gl30UT3NMPA7UivmlYYC6uPWbUIa9I3
         TyMga+Nn6/zhfjfvrLuVJD71NhNseK4JJeuHqnx7gtOf7qdpgfrB2+VP4cK7bz4/6kLa
         pFcdMPRaI3MBL8r8fTVL57DSFdLZKKls83LZ2g1JwkKQPZmMNsjWTl6BfeEtcKQp26NN
         GaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855011; x=1762459811;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pr+88J8V2FFjpoCz/RKjLuOTT6WQDejtYqs45iSU51c=;
        b=vNk4bwvOPpw2kBjlGvU9Onq1/G3zOdj2xgdlQ5BeT6vi7Va61Eoe9eEy9iDibn5IcH
         tFMmkmrQXULj+Mkzqbt3jyLOuuN0fIzAIO7Ue2mzbiy+PM9OH6ZuF1uq974c278t+XMx
         FHcgxG7doXtwYLrcxskHTXjqdxyQRBbmInxnjg3rYWzuiJ7FmFHucoIM2JjwqHpiCmT2
         MLl2HkFsxU/NM74Tbei7aC2a+hnL1xCvDK3JgvgffS0HBc8RxYaMJwZAxKL3DGCjLAQA
         bPWASa9yaZikug5y6Rsrgyum59Mmj7PzcZXY9GunYi6RPdus03dn78SmSPfWlKKm+Cx+
         eW9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKcdC7Dc8iBNOcR9Ae6+vFlrg9MUV9ki7C3XeE3RHdrS7cPuIDreaPIYjJK16/WBsf0y+Pv5zDaX8HVg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz0b1E52oMNTzKsnF5SUjuAmW6t7ZnPbJXCJhQBue8EJ7JMenC
	cxUkcTlb7BwWUsmtxxjMC8EAfgf1Kk2I0CmnLaSbWYUpa9ra39MPB8OKRSGMDszbyJR3rj4qIXe
	OwAyaWQ==
X-Google-Smtp-Source: AGHT+IHqKKH3jALoT7jRe2OHIQ2mXXV+pELYiJKGwKEjf4ZIM+twJ+5jG3TjV8eGRlfpIUNYgujs+bg0n4E=
X-Received: from pjji4.prod.google.com ([2002:a17:90a:6504:b0:33b:dccb:b328])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c8d:b0:33f:ebc2:63a
 with SMTP id 98e67ed59e1d1-34082fc2cb0mr1192488a91.14.1761855011296; Thu, 30
 Oct 2025 13:10:11 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:28 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-6-seanjc@google.com>
Subject: [PATCH v4 05/28] KVM: x86/mmu: WARN if KVM attempts to map into an
 invalid TDP MMU root
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
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_131012_540471_6F747068 
X-CRM114-Status: UNSURE (   8.53  )
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

When mapping into the TDP MMU, WARN (if KVM_PROVE_MMU=y) if the root is
invalid, e.g. if KVM is attempting to insert a mapping without checking if
the information and MMU context is fresh.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/tdp_mmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index c5734ca5c17d..440fd8f80397 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1273,6 +1273,8 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	struct kvm_mmu_page *sp;
 	int ret = RET_PF_RETRY;
 
+	KVM_MMU_WARN_ON(!root || root->role.invalid);
+
 	kvm_mmu_hugepage_adjust(vcpu, fault);
 
 	trace_kvm_mmu_spte_requested(fault);
-- 
2.51.1.930.gacf6e81ea2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
