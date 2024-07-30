Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54ACDC3DA70
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 19:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0ML53r44ESTR3swtfuNAnJa5wLYKOq4/G9IjwDSDxfc=; b=se/yleWc3JjfEjLC0ai8ENqI9j
	zkE1OTaKmrVaBJt9znWHfBzJSjmEGlyQ9aol81AK9B6DTI2wpV4+KxcJnwtHG5PpOAt5StbAPeJuI
	cUZueXEzZfjLgaoD9K/pfwtnKZ5yRPDGicbJ54uBUd8Stp5qWSyTBLv3mBQX/ONsovvwJj65C/0vh
	kpEHW/aeQSd/hYpVFy1oIgd82YFGuJBVJy73UFfYGQxmYUvZ2foLHAdSvTVdskJmNOOnE2dd45JCC
	IFokjaS5GMn6xOgU5G6h+/8lgFYm0lXUhViIjw7sLUTX+rc/cHjCZqggmWMec+h6Z0QjtjijG8jad
	m296mDdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYsKg-0000000GFIn-0i0Z;
	Tue, 30 Jul 2024 19:16:26 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYsJx-0000000GF4t-2u4A
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 19:15:43 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e02fff66a83so5947902276.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jul 2024 12:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722366940; x=1722971740; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ISzuCdCQ1ApBdrb/imzREuT+CY1/CgtGbhMTtqRUAc=;
        b=XNSzqjgr39C4KdlMJ52C1CncMTMvmyg/zR3zqIMwHB75IN4T43c1wtj+wmirgumifc
         tpyfzr15/NrIxHgqUGHKALxBnuZG6W8+ut8KIM6myuedUeI8jFIUzs5y3SMPy2+N/Xyt
         47keeUhECj+jHi6RKOzLcyVYP6+86pP/FD1KUoIrz1BXMcT26ERvHyd3s46cZTb3nShY
         lKgLUZVPJDCgij6dnbbg2ZoEgjRqCemx7IbjTOW8w3luH9soUZ5Sbrr+JV9qNXtA/hyv
         tRvbYfH4jNREmn/a4pIgyQOjwuzzj7FbGP9dPgSpc8sy2TqJMtmeDL16/CJE3MHQx7Am
         zzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722366940; x=1722971740;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ISzuCdCQ1ApBdrb/imzREuT+CY1/CgtGbhMTtqRUAc=;
        b=GW556gqd3STCWt2RbO0hWYjMXoxkdXlro1up/G59XMMB+/GLku8+UmwLyqWS4Tt8PZ
         9hotovWt2JpcwK0KFiPoLcDQ4pMAZr/KH9vNesCUFdDgrgvMmyX424I2KzjaGJyV1TS4
         lIc4Wa0VJ0J/HB0TPIWe7AIqjSDk/hkYKgvmUMPEQdWH6zyURSEgb1bcNva1adddHjLJ
         QNZgL1qJDqrAtp/6iYsK/Vkd6kH9ckoao2e/mg/O27VOySwpEikJKbvEt8oPRdMIPdNC
         jzlCtbiKcUY+2lEGX+zoY6Lex+AvN7izwhQFSEdIvPhu3YJxqplx+T7PdQ5lrtbknsDZ
         Ttwg==
X-Forwarded-Encrypted: i=1; AJvYcCVJDrSWgRQ2alRvGfdnxOU2uTs6656WSALhkMMZ3g3upOwvgw9dCPJmdXNuZaRHGUcDHrIZ7mRF6lA6poSTIEm4GdUFLtKa9ZxcCqC2o9Hj
X-Gm-Message-State: AOJu0Yxek3vjb7fRqi847sNEPMllHbmVj4GkpQYBjEoJUIAknvnGviSN
	bw0Pb4DXO7HnsUbHx3FdwN0ESkjad5b8+77t5tLMEyaNR13iQ44HbJp0h16H9TfDw00YWSACw0w
	vjg==
X-Google-Smtp-Source: AGHT+IG9SmfuMb4gtd0Ao4BPZkLVByP1qx5TNQuKOL4wYDlOLmXqkqaZZiuA2JFi0z3WenSC5NZXiGCdyNk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:2b8f:b0:e03:59e2:e82 with SMTP id
 3f1490d57ef6-e0b545a3f3dmr19046276.10.1722366939560; Tue, 30 Jul 2024
 12:15:39 -0700 (PDT)
Date: Tue, 30 Jul 2024 12:15:38 -0700
In-Reply-To: <96df1dd5-cc31-4e84-84fd-ea75b4800be8@redhat.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-49-seanjc@google.com>
 <96df1dd5-cc31-4e84-84fd-ea75b4800be8@redhat.com>
Message-ID: <Zqk72jP1c8N0Pn1O@google.com>
Subject: Re: [PATCH v12 48/84] KVM: Move x86's API to release a faultin page
 to common KVM
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_121541_741698_4528371A 
X-CRM114-Status: GOOD (  23.21  )
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

On Tue, Jul 30, 2024, Paolo Bonzini wrote:
> On 7/27/24 01:51, Sean Christopherson wrote:
> > Move KVM x86's helper that "finishes" the faultin process to common KVM
> > so that the logic can be shared across all architectures.  Note, not all
> > architectures implement a fast page fault path, but the gist of the
> > comment applies to all architectures.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   arch/x86/kvm/mmu/mmu.c   | 24 ++----------------------
> >   include/linux/kvm_host.h | 26 ++++++++++++++++++++++++++
> >   2 files changed, 28 insertions(+), 22 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index 95beb50748fc..2a0cfa225c8d 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -4323,28 +4323,8 @@ static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
> >   static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
> >   				      struct kvm_page_fault *fault, int r)
> >   {
> > -	lockdep_assert_once(lockdep_is_held(&vcpu->kvm->mmu_lock) ||
> > -			    r == RET_PF_RETRY);
> > -
> > -	if (!fault->refcounted_page)
> > -		return;
> > -
> > -	/*
> > -	 * If the page that KVM got from the *primary MMU* is writable, and KVM
> > -	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
> > -	 * may mark a folio dirty even if KVM created a read-only SPTE, e.g. if
> > -	 * the GFN is write-protected.  Folios can't be safely marked dirty
> > -	 * outside of mmu_lock as doing so could race with writeback on the
> > -	 * folio.  As a result, KVM can't mark folios dirty in the fast page
> > -	 * fault handler, and so KVM must (somewhat) speculatively mark the
> > -	 * folio dirty if KVM could locklessly make the SPTE writable.
> > -	 */
> > -	if (r == RET_PF_RETRY)
> > -		kvm_release_page_unused(fault->refcounted_page);
> > -	else if (!fault->map_writable)
> > -		kvm_release_page_clean(fault->refcounted_page);
> > -	else
> > -		kvm_release_page_dirty(fault->refcounted_page);
> > +	kvm_release_faultin_page(vcpu->kvm, fault->refcounted_page,
> > +				 r == RET_PF_RETRY, fault->map_writable);
> 
> Does it make sense to move RET_PF_* to common code, and avoid a bool
> argument here?

After this series, probably?  Especially if/when we make "struct kvm_page_fault"
a common structure and converge all arch code.  In this series, definitely not,
as it would require even more patches to convert other architectures, and it's
not clear that it would be a net win, at least not without even more massaging.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
