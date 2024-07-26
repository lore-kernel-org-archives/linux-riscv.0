Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0289C3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xMI9TAE9Mh/lxhDOPmE7rc//cEKBuWuVwcTxs8PPBSs=; b=izp0ClPRXfsvZV
	hyMnoSR7/z7J0/44OSPmEZT+2Z+RJys1T5pIB78AVwTSAspNatWpLT7JdKRxVTt6u4zej2xQuAvde
	mXwA6BZGPX+Wh1VIWAS9VP5mrCHRU+3K7NUlD/3J5KgYWIsHPCS1Vn7wp56bKmajoPBNcl87qJL+o
	3K+iv7j9gkulKSbnTRddizKcwPeFITwrOhIY1A3UAIZZeQd6cJGa/NHQoeA41pd9MHWMzklonWHKy
	nK9O5zySOSPqWmPHDlise/7Xe9QmtlIXx8StAOt+Zukzfc+elOkJURxjAnJ0iwo8Rl/J1fgoYuv85
	1atnv+JhiW/THHNvj2XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVId-00000005i0p-0rwL;
	Sat, 27 Jul 2024 00:28:39 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUm5-00000005R3d-26ko
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:55:04 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-649731dd35bso1375101a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038100; x=1722642900; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EmsAuvL8HQXwYqsGGesvXxhYre2Gu8OeDMQE+hBNppI=;
        b=UfGQyyD3vq6j6kdku9TuM0lVETgP2Gx9PLJcBddmimczlR/92NTCV8JBanvDkn0VyW
         tkUpNxwhs2rqDe9AeYtCkFi0c9BL6/wQs41+x5hTOCgr0KWgTgIKdyQThTDilvWtt66o
         7Q+HXsjzpMWObpUqE5lZe6fsL9CNIBcWF1GhSVq1nLvIwQccrvx97vl4bK5xV3/66k8Y
         +OiHB/tIDt+vyeCWcRMXAr2U4uf5k0adbru5mqt94PmgJknDkxDDt3V+SNO39kgJngOM
         0UyNKEEgZsJ7Zxzqlj2pZpmoRWn/+OjCncoW/6LbaovHQaxSec0ANSLpI39TZLIlzv9R
         NquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038100; x=1722642900;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmsAuvL8HQXwYqsGGesvXxhYre2Gu8OeDMQE+hBNppI=;
        b=ZF1tyKXSr1GNPyQFqK/GwcIChTyjyfNQ5Hd3PYnxci1sAIX5KmFowctNZ0sXt2C0Tm
         ijlzhT2iXK418pmkDxyTmJ/4YV7mFod176IBHwXqXdP6mLLHgBMB1PV4+U0mG3JYOu7J
         ovuP5XCJ+Pha0cCPvNgb+ZwCFWXdAyMWOZXlOS5xqtLgO4wIM2NsIeZilwMiiIAM/Eeo
         VEXRGrKKhfMM998L01JtYULaFJ2yo9nU16j9LUQWAA2DpOf1G2pI05YTkqtUvV40yo93
         1Zp8LqlSkODPC2SSvufCDlaSd2GH/QgVrmZiZ4NmRshosQi4QHt3YA9GERqHTCCit0yU
         QCcw==
X-Forwarded-Encrypted: i=1; AJvYcCXyG5n20CRMyXivWGoNNeYpdjKUjA558V+NxSLC0k1qKDt+H5fFe9pgeuUAH+b26yFlVcEvGS2HaywRbSElK4pmCaJsTJyk0QSrPYANRiRK
X-Gm-Message-State: AOJu0Ywj9g7+FY2m9yaHj2JEyQKhxbssYpKFjuDvR6Zn0ys3ig0K5tBB
	/rroLLpx+Iuoo3oWy03FGr/REX11kDvBuUqAmi4nDWUsUOqyKpNDICeUQJ5XthOGuvazdT5IpDM
	K2w==
X-Google-Smtp-Source: AGHT+IFixvL6M1c2YXLcj1uim9WdRxJ+9f/3q289x5sMH5Ueo8TBf7rPuOmHjx69h4l0El/Ee2ditwF800M=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:fca:b0:72b:5113:ec05 with SMTP id
 41be03b00d2f7-7ac8e39fc8dmr2096a12.5.1722038098497; Fri, 26 Jul 2024 16:54:58
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:17 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-69-seanjc@google.com>
Subject: [PATCH v12 68/84] KVM: MIPS: Mark "struct page" pfns dirty only in
 "slow" page fault path
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
X-CRM114-CacheID: sfid-20240726_165501_739947_C29CB0C3 
X-CRM114-Status: UNSURE (   9.86  )
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

Mark pages/folios dirty only the slow page fault path, i.e. only when
mmu_lock is held and the operation is mmu_notifier-protected, as marking a
page/folio dirty after it has been written back can make some filesystems
unhappy (backing KVM guests will such filesystem files is uncommon, and
the race is minuscule, hence the lack of complaints).

See the link below for details.

Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index c17157e700c0..4da9ce4eb54d 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -514,7 +514,6 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 		set_pte(ptep, pte_mkdirty(*ptep));
 		pfn = pte_pfn(*ptep);
 		mark_page_dirty(kvm, gfn);
-		kvm_set_pfn_dirty(pfn);
 	}
 
 	if (out_entry)
@@ -628,7 +627,6 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 		if (write_fault) {
 			prot_bits |= __WRITEABLE;
 			mark_page_dirty(kvm, gfn);
-			kvm_set_pfn_dirty(pfn);
 		}
 	}
 	entry = pfn_pte(pfn, __pgprot(prot_bits));
@@ -642,6 +640,9 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	if (out_buddy)
 		*out_buddy = *ptep_buddy(ptep);
 
+	if (writeable)
+		kvm_set_pfn_dirty(pfn);
+
 	spin_unlock(&kvm->mmu_lock);
 	kvm_release_pfn_clean(pfn);
 	kvm_set_pfn_accessed(pfn);
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
