Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238C3EE0213
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 03:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eC3ZUXtP18Ai90rJZneul+ELKFqHgHg/YFZEHS+8SWU=; b=nHkE+PRsg5N6Ed
	N39I5E7ei2jtFpkoYMXVhwIxMjkT8sZN9iZvPdMeMAc6aK1zwdgpS1pjXTbHWZ3G2dAIRNz/lWeZ8
	+RqzYe2ohW7xsdObJOGC6Yv5bVxUNiV0c0DvsacYGrGouz4F8Zue667k1mh/L7rtjvLz1alzVIsIs
	LZLfY0WXpIekqpC4sYmmgl7BljFsi2y0HbhPBCgTLcwfIr4GRU0HeTqE6mBRxdQ7TmfuiExzQqQF0
	WqVNi8deM0JGWZVL3EFdEIl+I58s0i8JlJ3k0+kYZJhQUCA0Ey3nZJBJLHBvP+OYed7kvMQL1w/Am
	73GHhZqlLSMTg/16afTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgcb7-007CvZ-2v;
	Thu, 14 Sep 2023 03:00:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbaF-0072x2-1b
	for linux-riscv@bombadil.infradead.org;
	Thu, 14 Sep 2023 01:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ipMZPiP5QxzJYr8+L2XHaFOQ2agfNk5lTTsPLIZe0Eo=; b=nDpIQNIfxXF4T60ERAT0/XK1KP
	3P6+W4Vj3h3VULB+09l+04+PtSVjcPh9abhiMCkDNl+KgWtHLANg2qYvBTIxRDmUPyIGW7Wbq+/UA
	HCATHRLv2R0gF8OyCie+ZnHkupIukKIboZbbUVh0lj3y5z4Bu5IYcJvDge8mKmDaCfa+a80VHi4eC
	cDyU0CWzE1WvDOJ1BL4nMbwFhXD4cQ6ZflFkvhC52eS256dUr0KCxzmivp6FYYCOTFzUyPrHFAqpm
	DLvBHxcDYOKMpOhUViMUOSrOLO9ef0/+ORLOXgPrQaGRerD9Fhw+K3k3+40enQh9np68Tq4wt0+NJ
	OcEeUsdQ==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgba8-007TUC-0S
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 01:55:53 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-58fc448ee4fso6046807b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 18:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656542; x=1695261342; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ipMZPiP5QxzJYr8+L2XHaFOQ2agfNk5lTTsPLIZe0Eo=;
        b=UUEdePQc6LdiklEyt+ky7uEa/9Mv5U2G+hFdszABFMzm+zylTMlAIJv2DRo2y/6nVE
         sDUQLB0C7ZeY2kB1+6cGOTmL+BjgPlVmDY96vsAqczKBsmHNEgyTkiRm3saTQ/aSbtrH
         JzpQzaGx6StZJj/+gCojxZcs53ww/XAh27v1239TxUOWckyWDgFnxtUqTnN19Z/ASRcN
         GxIYMPcGvFUG+VZo7A3g2efNXOtrPabfvb0X3iauXVhkV/mmkyRQJ7zpqOZRXiwsinl+
         4iTyuwz+ilXLvAxBJSOC+qpYhgKt06iRwpVYvZMV5mruLrQVxpG/6YI0s+mzuXiCEcw1
         4fFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656542; x=1695261342;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipMZPiP5QxzJYr8+L2XHaFOQ2agfNk5lTTsPLIZe0Eo=;
        b=vKoL1aFe9s3kk4VXG/DA90DI+Eg2FevyRwWCHEDoxV/BEkIqxMl3u7fAUCq42wWTwC
         vKWrvSActSm/DCBI4cHcRU9rKvN+08dW/AC7NzyMztyb8NbjLxG5XmbnnkSpmAffU+JB
         xtxTvvgT8MOU7UnEY+d3m1O81VU4kYz67/MGJZq9S67UTKakzXu331/FKNU204CT0p7a
         jfZzr/Es+T+5khUk4c2da3iJbHvqra5PjBxF6QC5u3scPUqroPbAsjuASOBfn7dtr9hy
         Qa9u7unRwMyvQT8lTa0pntUD8y7xFmifKZ+tpEgFt82dF3YBDAq9aAEFRfhWzNWtbTT6
         1dTw==
X-Gm-Message-State: AOJu0YyX7fuVNCqr/fHhhxCn7WD1+a9OhQqxN2Dy25NCE2NlRrAplf1c
	7x6+Uva7pfY7/uGuh4QqsyXg0kWp2uc=
X-Google-Smtp-Source: AGHT+IHZ9maMkZbk/mDeS4QG3cCYdpuky8EXqvBvcYXtjkjg3bX1mPxWKIK7RZclMdxYQ1SdoMO1l2xcItw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:b0a:b0:59b:ebe0:9fd6 with SMTP id
 cj10-20020a05690c0b0a00b0059bebe09fd6mr14465ywb.6.1694656542028; Wed, 13 Sep
 2023 18:55:42 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:01 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-4-seanjc@google.com>
Subject: [RFC PATCH v12 03/33] KVM: PPC: Drop dead code related to KVM_ARCH_WANT_MMU_NOTIFIER
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_025551_598144_4F836854 
X-CRM114-Status: UNSURE (   9.89  )
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

Assert that both KVM_ARCH_WANT_MMU_NOTIFIER and CONFIG_MMU_NOTIFIER are
defined when KVM is enabled, and return '1' unconditionally for the
CONFIG_KVM_BOOK3S_HV_POSSIBLE=n path.  All flavors of PPC support for KVM
select MMU_NOTIFIER, and KVM_ARCH_WANT_MMU_NOTIFIER is unconditionally
defined by arch/powerpc/include/asm/kvm_host.h.

Effectively dropping use of KVM_ARCH_WANT_MMU_NOTIFIER will simplify a
future cleanup to turn KVM_ARCH_WANT_MMU_NOTIFIER into a Kconfig, i.e.
will allow combining all of the

  #if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)

checks into a single

  #ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER

without having to worry about PPC's "bare" usage of
KVM_ARCH_WANT_MMU_NOTIFIER.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/powerpc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 7197c8256668..b0a512ede764 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -632,12 +632,13 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		break;
 #endif
 	case KVM_CAP_SYNC_MMU:
+#if !defined(CONFIG_MMU_NOTIFIER) || !defined(KVM_ARCH_WANT_MMU_NOTIFIER)
+		BUILD_BUG();
+#endif
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 		r = hv_enabled;
-#elif defined(KVM_ARCH_WANT_MMU_NOTIFIER)
-		r = 1;
 #else
-		r = 0;
+		r = 1;
 #endif
 		break;
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-- 
2.42.0.283.g2d96d420d3-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
