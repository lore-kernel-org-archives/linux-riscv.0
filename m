Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93649C3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 23:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CI8qbNEz/MrvxEYVIoyw0x94Z81QkK/OYFIk4cdhN0M=; b=HiDZymbCAN9LHl
	J793delOWas7fSqJ3aPPiigke56473TCmf1QlqTCI7H+gfYQ4lYcnVZpXV7lcMwEO5r0aUV8N03Ui
	a+m2RohdG2UwgjxyZ4159+q9hItEn7QSUKR5DhaR3KpMBd5EcrwcIe3F8Pd9FoiHEtM6oU36DocsL
	h5N134b35zs7+1cuKC0TmWM5N2XwYetjpeQHciv+wopWctR91yMUNrGQCv4V9uIqDx9efpmKGJJAl
	CL1cyPJUaCrf/0vdQixoaub3rfZ/YDNqR3XFEkV8kpmiD/dghwC1iwuInQeYgeUABM1cNA9DCN8Ep
	uqq49Rd3SS39VWtvYfSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUjv-00000005PCy-3alm;
	Fri, 26 Jul 2024 23:52:47 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUjp-00000005P8A-2g4G
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:52:43 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1fc52d3c76eso12293385ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037960; x=1722642760; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=B44llYCZd4EZ9BiHApjJ5QQ8CK6GbkfpTxw4rYmbmqk=;
        b=zm3Q8cbxYWgV/ICg/XpBQIFA5ZZrUheT5124qEoiaiXcrddyX94DdP0qUCzD45kwt+
         RDlY5TVAitXGwXPxoMn4gWERtB7jj3o6wCuMtvorUh8FXdD3LZLuBHIerNymmFjUchg1
         B2UugSa8CQzLCMz2F6aMXicsUkh0+Xcxf0jP2sGH5MLm8U9TlZifNMbg1YfjCkWmdmWm
         WIbu6BHnysY/udvO2+MxiwruCh2amZM0c3IBBl7dJT129UFrBxRyeE7pdUIf0U7+UKMb
         DP23v07HGXZL/WrCAcfDvW6hjnes8bdkxeQU2b9s8xm0sEA3icUbvNCUKBcl2jbmHEIt
         Phsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037960; x=1722642760;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B44llYCZd4EZ9BiHApjJ5QQ8CK6GbkfpTxw4rYmbmqk=;
        b=qtkGfHcVPFLrB65HaRnSfIiZAsbNqyj9mWD7XDCCC6mysFoCjYYsRRjZtZpZi80wt5
         gyU1xb6sCOuPugT1kLDjE6bDOHuWqGPYWK6WresfiyVieru8Ms9/dwwGOyK9mP4nWdhQ
         0x4Ogw3+Zz6BKkoTKGqCV1FbbNIBaq173Tc2mqokWTUak4fpeMMGQYapQqrBoIzAamtH
         A0135isCiAyzfq6H7yjOwVXSM5pGqoGZ3X1N4RLXZEs47SgERSchoyr1G8Zjh+DQDMXY
         SGJhr25yqyr08/OF2VXtyjyjtXgNNVuG/nf7J896ZoTeo+Y14ktr007R3yFkGF2RzAtI
         aIAg==
X-Forwarded-Encrypted: i=1; AJvYcCWNZWCJcguU+5TtNmkY5pu/GclNnASS5xwH0z0aNfJNEeAR07qMjHN7pC75tYQSjCYhMZIfw8SBFKOalaGMy7UxP+yMRNJ3BnxhXVFtBLuw
X-Gm-Message-State: AOJu0YyEiFrqZRUtd95wF6BT3HVbaLrauwBS4OTE30XXJ9Hx9p7NpF2F
	Ur23EGy3Hv1rSe59FXlcf59TiusKmEFpySGVXPwDt7S8VumRULWJsLrWXr/yLAd3qvJb9UKoZOT
	lMQ==
X-Google-Smtp-Source: AGHT+IEjG0ZQEVlDvyCmqtjyibvaIBPxkBHQDdDjj94pZYYC/xb/lJ2iSbTktb4rvu/gOGNYLlpIc1q2Vcw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2b0e:b0:1fd:7097:af5c with SMTP id
 d9443c01a7336-1ff048d8505mr410065ad.11.1722037959655; Fri, 26 Jul 2024
 16:52:39 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:10 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-2-seanjc@google.com>
Subject: [PATCH v12 01/84] KVM: arm64: Release pfn, i.e. put page, if copying
 MTE tags hits ZONE_DEVICE
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
X-CRM114-CacheID: sfid-20240726_165241_725246_9ED4E247 
X-CRM114-Status: UNSURE (   8.04  )
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

Put the page reference acquired by gfn_to_pfn_prot() if
kvm_vm_ioctl_mte_copy_tags() runs into ZONE_DEVICE memory.  KVM's less-
than-stellar heuristics for dealing with pfn-mapped memory means that KVM
can get a page reference to ZONE_DEVICE memory.

Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/guest.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 11098eb7eb44..e1f0ff08836a 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -1059,6 +1059,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 		page = pfn_to_online_page(pfn);
 		if (!page) {
 			/* Reject ZONE_DEVICE memory */
+			kvm_release_pfn_clean(pfn);
 			ret = -EFAULT;
 			goto out;
 		}
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
