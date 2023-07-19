Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9589C001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 15:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t2VInEWq8/XEEPoqvZv0i8TI4TvBjRbkEY8o10J6jS4=; b=CYoiTAcPjPkTqnI7W1NZZi+djw
	cYCZRWy7vTGmLSGgAFaLij5l+/80rfvncQNvbXNzbFpNS9OGXQzZBPcW5qx365QhoCPmcn9HNhTwL
	NITvD1rXM1sClq1me+c+Wqij13ccjs5LaVx63PMklY861oH3kY5e+X3sgvq0bOIiBixhI8fo697sc
	yvzE8YaY11ddKceaHqw9M24w6MwlR+RfQ0sBjcXTT8M2vhQX+6l5ZB6P/Oa3sFBjU7ZoARhh8Pj3L
	sQqd1f1hekaX1iW1jyBsMECC7lAp0nDGK6pZwhx0bMWdIM7GOzPTW7h0t2szMSawt06sf+DrsjSCa
	Ev+QIbkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9Gn-007xzz-2E;
	Wed, 19 Jul 2023 15:39:17 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9Gj-007xxU-1f
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 15:39:16 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-c4f27858e4eso6392036276.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 08:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689781150; x=1692373150;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3uTGEOgXGgjS1mpy4uY8Zn88ggwsAyaWY3/MU5WFUXU=;
        b=zuZWZV29hv7HoMETiCkSKGIHZcpHTMG8TKF9qduMPPS/E1c0SfFLVA6kGEOoP5U9qq
         U77CuEsLMMxKIxLMFnjtp2hpB+IIMkYXVFGsPC5bapP3nIk/nGTrjqlCGcZf5+xPpr8T
         q16/aDqhEkgnoKMdGaA5rz+Gt+5uK6D6P1fr5Zm7R4i7YF7l973NWOrr+c3kq7IzyS9M
         gLZmugAwtecTQMKF7z0UBcPf86RbNReN6ZSKfaBS2Zp8N7kJnMwhsDMUzBHIndlxccW1
         lnFRHUcOrryTZsXwruMmKL2jJUIvic1/Jzr/kaZBJYZOlvirf0tEwgFNXnc0yrJBGF6s
         gFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689781150; x=1692373150;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3uTGEOgXGgjS1mpy4uY8Zn88ggwsAyaWY3/MU5WFUXU=;
        b=BNPhBV3WF/CsF6juo9g6B+RoztvV2G9onK6+qjNGqhGrnjj3kei6oJftY5i2UaDGCc
         qn+DOHJ2hN/IQptJ416OMFMhC01Dt2mrYTZAGgzTaOQy16nKwBqfhXl9SdMplKES9/uk
         zrRl6aX6aL01sNEqLrOyhz2O+fXjO13pAUQX5JLsy5Z+C+wwQ//L+mzCeg2enbJ8lcnF
         PlpH2lEg29Ek8p+jT0F7Lq0lxzl/dzMl+XsLDtwIKAvPC5VpPBxyEFKOsvC8n3LNxMOk
         jcF6AB941lyYTKyqrbwo1Q3PW82rYOAnDajZS4HCRGmKkfiQywyjpKvw5o8lp5WJwj85
         +c8g==
X-Gm-Message-State: ABy/qLYv3Vgph4UlSvgTliJbhe0clcg2JI0MeGtUJworKT8Ype+J1w5Z
	M+jmPfcBWfUgZM5Nls+sUaVGf8S4Ru8=
X-Google-Smtp-Source: APBJJlHKX/op8BIXr6hrdN4x6RovTyUJBoPmA+F//tB9wdB4uZjaG/yxyF0KPogxnGD6eEZAy2DX7qXfLUE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:868b:0:b0:c4d:9831:9712 with SMTP id
 z11-20020a25868b000000b00c4d98319712mr26898ybk.0.1689781150625; Wed, 19 Jul
 2023 08:39:10 -0700 (PDT)
Date: Wed, 19 Jul 2023 08:39:09 -0700
In-Reply-To: <CU66VMG4IKSD.33KF2CEZJ2I1@suppilovahvero>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-2-seanjc@google.com>
 <CU66VMG4IKSD.33KF2CEZJ2I1@suppilovahvero>
Message-ID: <ZLgDnYJUX/QR9UJi@google.com>
Subject: Re: [RFC PATCH v11 01/29] KVM: Wrap kvm_gfn_range.pte in a per-action union
From: Sean Christopherson <seanjc@google.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_083913_605512_B761C335 
X-CRM114-Status: GOOD (  11.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 19, 2023, Jarkko Sakkinen wrote:
> On Wed Jul 19, 2023 at 2:44 AM EEST, Sean Christopherson wrote:
> >  	/* Huge pages aren't expected to be modified without first being zapped. */
> > -	WARN_ON(pte_huge(range->pte) || range->start + 1 != range->end);
> > +	WARN_ON(pte_huge(range->arg.pte) || range->start + 1 != range->end);
> 
> Not familiar with this code. Just checking whether whether instead
> pr_{warn,err}()

The "full" WARN is desirable, this is effecitvely an assert on the contract between
the primary MMU, generic KVM code, and x86's TDP MMU.  The .change_pte() mmu_notifier
callback doesn't allow for hugepages, i.e. it's a (likely fatal) kernel bug if a
hugepage is encountered at this point.  Ditto for the "start + 1 == end" check,
if that fails then generic KVM likely has a fatal bug.

> combined with return false would be a more graceful option?

The return value communicates whether or not a TLB flush is needed, not whether
or not the operation was successful, i.e. there is no way to cancel the unexpected
PTE change.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
