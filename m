Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEEBC3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oBIR8XN+pp7mdI0WYNv1r9E7uDmP84gLCH1vLtH/NJo=; b=ciGdC5YAzLiO9j
	Kn3V/qbiZOn2mloHFsiZfa9+lKNMRsS4Cr6ur8l4xiZzHHmKtHrJSfh4mY2VoBtEngYYJBfCNLR5d
	0wr3/uvamrrGg/O1clAqfF/SfRCE8OZBhvclXxT/s0Idvm+t1v+x2sCBBT37EtYQLCPrwtt1PBjkl
	rRV8wua8pDA7lziRv+bW/TPtwhETGaiFwT7LO1d+aWVHp6SlCFN6xJcqEBsvfIj1e/Gnl/TAk2XrU
	MnrSZvOz9zQ8Tb9qIqLngBPJdmisMMbXjZe2p1aZYDIfHZ0/gaE4QAs7v4xmgdee+HcO+duYJC9k6
	bhQIfooHkpbAU8uhk4dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVLk-00000005jZX-3ktt;
	Sat, 27 Jul 2024 00:31:52 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUmL-00000005RKH-045C
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:55:22 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fc5e61f0bbso13367845ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038116; x=1722642916; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gSJgbeqW0EjFVjI/rvx0LQaQxVZn1dW4kzDKJHwZpGY=;
        b=dKLp4urTYxrMqWnh5jJzqr/fuqAAiRZmLGEYFfqMSjamPxxYI/rYGNYvxyFrPOfisz
         AFBinzC0qq1IayWZHdNsSTTRlU47sfBlyOb65kgFIAAAUR0dF+6ZjQHJZO4hbcEa7vdE
         It0VKyTq2bCDLg8Qj/LjbQyx/G9rcUHA2ZDOLP1GhivjReHm734NvWYNT/J4WKLBHCok
         1xaPTSvMEDkHqOfC5FxlXcTPlzjfhKCwxeQJ/KvcPQrO1i+Xc2QSUt0nvkdqp+qkQNHl
         ytEUxKgq6APH6ehph8mxslmoJn4srt8DHQ3NejdesJriaNo/nKumleAAlQSLkbTRZLqF
         WsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038116; x=1722642916;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSJgbeqW0EjFVjI/rvx0LQaQxVZn1dW4kzDKJHwZpGY=;
        b=ad8Ym2qfHOy1I+vPWzbzoOju21RccNySEF3ygFIQL7N6TicdlFLiQwATsTUrY7qeu2
         LiqiaTfQ7G9krh84qb19AAOTcXww+ApjiEDdzkGeL7DGa2TWgpjzFAeBrThP7OBbHoLN
         CHbv+bk4XMihtJlaiU+RI9AqOpBOwpMhw3CAl8dTRTDnnk30TR9uZj+Xmb0H5F6XPyrg
         ffECQjFhbQ6CTsNc9qCY4wwOxqMDt38dqxysXkj1QgmdTbC1osRoEhLEVfp6dUiCRNmy
         Px4itpAmnhi7Wr4ScE6ZFbgyhxEoajzRkDrJ5xEJagwZgXHWlRIur/VuSPchf0dpYRhL
         8EPw==
X-Forwarded-Encrypted: i=1; AJvYcCWxX6lyAB8juaF+ofX/BQM5EUbVOzw1r965w0Z/+Xmdz4Sq/CxSKGtiSwDfoBzojlnilvCOFKbc6f4mouQxg/9UC0CL/BvwYSo/EeoHlwIK
X-Gm-Message-State: AOJu0Yyejb9zH5hLSN225JnsYVJWzj0Lujy4XRepVu4Ne5fSQ6hKlwVa
	AvW1VpbQDEIKfs772c9V+QfVhS+y5+E+SFoNoo1gvmhiispDaEGFyTJhXnohUkdPtatuWgxhPYV
	YMQ==
X-Google-Smtp-Source: AGHT+IHxrkKUWCeUEpiaW8aWqxkJkE+eVd4nhH8cGKa9NS3y3LrlRDBQyz/B78NptpquvhhjWf0asoH4ivY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c945:b0:1fc:733d:8465 with SMTP id
 d9443c01a7336-1ff0488cadamr599925ad.8.1722038115596; Fri, 26 Jul 2024
 16:55:15 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:25 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-77-seanjc@google.com>
Subject: [PATCH v12 76/84] KVM: arm64: Use __gfn_to_page() when copying MTE
 tags to/from userspace
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
X-CRM114-CacheID: sfid-20240726_165517_399319_135A7F3B 
X-CRM114-Status: GOOD (  11.43  )
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

Use __gfn_to_page() instead when copying MTE tags between guest and
userspace.  This will eventually allow removing gfn_to_pfn_prot(),
gfn_to_pfn(), kvm_pfn_to_refcounted_page(), and related APIs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/guest.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 962f985977c2..4cd7ffa76794 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -1051,20 +1051,18 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 	}
 
 	while (length > 0) {
-		kvm_pfn_t pfn = gfn_to_pfn_prot(kvm, gfn, write, NULL);
+		struct page *page = __gfn_to_page(kvm, gfn, write);
 		void *maddr;
 		unsigned long num_tags;
-		struct page *page;
 
-		if (is_error_noslot_pfn(pfn)) {
-			ret = -EFAULT;
-			goto out;
-		}
-
-		page = pfn_to_online_page(pfn);
 		if (!page) {
+			ret = -EFAULT;
+			goto out;
+		}
+
+		if (!pfn_to_online_page(page_to_pfn(page))) {
 			/* Reject ZONE_DEVICE memory */
-			kvm_release_pfn_clean(pfn);
+			kvm_release_page_unused(page);
 			ret = -EFAULT;
 			goto out;
 		}
@@ -1078,7 +1076,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 				/* No tags in memory, so write zeros */
 				num_tags = MTE_GRANULES_PER_PAGE -
 					clear_user(tags, MTE_GRANULES_PER_PAGE);
-			kvm_release_pfn_clean(pfn);
+			kvm_release_page_clean(page);
 		} else {
 			/*
 			 * Only locking to serialise with a concurrent
@@ -1093,8 +1091,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 			if (num_tags != MTE_GRANULES_PER_PAGE)
 				mte_clear_page_tags(maddr);
 			set_page_mte_tagged(page);
-
-			kvm_release_pfn_dirty(pfn);
+			kvm_release_page_dirty(page);
 		}
 
 		if (num_tags != MTE_GRANULES_PER_PAGE) {
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
