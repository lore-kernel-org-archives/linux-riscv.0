Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FE2C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 23:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kGx3x4au0GkGeUX+csaRQjSvbRtPJkmh8vW3oWNHLdI=; b=KfdqQx7FtW6MVpS2MipYDLns4+
	xxOxm9p2i+xJQc5WKMHxrMX0Pp7aleureGlsVQKirorz/vkkS4vB0u/CtBj2Va+XQ+QQaJRRiLYmX
	3D6+CyxMkGYKd88jIHlswEv3tHpdSTmLt58qaiOo1i0PY0xshI5HCbnj/8yGRQMCImg7JTlHiU4fo
	GYvWm7bEQMe6ms6rR7hbNOovuiUq89fZJZZWTs/2iMLYi1aRWb4Tjjr9Jidp9d1FfcFqbCIoZ2vDi
	httczPPoXwuBdFkAib6B0A8QGBVagWMclaqVmzsnApGOo2mAlz+lV1X2Rzp1oBSJPomt8MAfoClz9
	f4qcdVzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb7WC-000000001iq-43Oo;
	Mon, 05 Aug 2024 23:53:36 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb7Vj-000000001cc-3DxC
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 23:53:08 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-664916e5b40so4661007b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 16:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722901986; x=1723506786; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8tNxfozveIy4KhK+t6BTSFuKqZ3CnwWBfLDeoqvVNkU=;
        b=cpLhgD4MY4W+vC4yl3ECDEoNsVVCuKx/FYMbqT+P5lz1bFGEJB6L2IQE6ieH1kXSqI
         2Q8VsRuLTSkAhMznCYFoNvV8Ff0nfTap3AhxhfbimfXbDJpliuqmzcCLlodHafkXyzds
         q1dMBo0OzJLKIAIY2/NXtUJrXLM7qkmAQLx1+0E7AXPZzNioRESPfLu74Hkeyr8gUuRx
         AI/K/j6Of/wG7kk6b5FVawk1Gz3F/YtnldC8LfITqXHCo5lz49oQ1McTP2yKDt9ocIU7
         6sH+RXKtH2H+7QRSQlM7Q54LTblNoTXYicjLT47ZVeNdVKc4MKZZgBRbUsX6A8UZRkgY
         4/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722901986; x=1723506786;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8tNxfozveIy4KhK+t6BTSFuKqZ3CnwWBfLDeoqvVNkU=;
        b=j3DWSMDm7CHi28VuHLFn3r63beSDfHge5sljsL6sTy224YB8In2d7sFx/mu/x95AKd
         iEpwenRdx33Qe+39nIIDUKBttqNPntsh/N1iVvMdFHvO3k4+fJ5P+wKqeKjZG67VijVh
         Kfxw7tw/tpo0aYLQ9hVjNlt4MgoVDfNJsxvvrh4/o306ShgW4oLgQhFWQDpk33LoPv2G
         XlFN1TzHx/8wmum84wyR4lSi++rbiYie5cbfaKa5zf6y8yk8GhdigWTaIAbR3/N+hxEI
         QUflZcYmrePkbDf9hSbcX18aVjRx9d2yGufWFgXkFJCy8/aOyxwiI3MVOs6EEsNrpSqL
         Ir7w==
X-Forwarded-Encrypted: i=1; AJvYcCVGyo0yRqqRNf3Et5BDyJYpVLNgLjfkoFxlgbt62mNRN+UVacf1JNOMFZyLt8Q6hxA+OI8KrCzrdtJ79qFbIqPZ9BUY87lSiYEYI9YFAEpB
X-Gm-Message-State: AOJu0YzJ9GbO/FZuxseyS1OKna7L5nDVaoGWNnt9AWrB1l2Ksp7iR6zT
	XGbuwE8JF7SpfK0e7bb64DnJ7RFLos+bu5v+HqEnmJrv2g2ebDGj7TpHiA2B1Td2VrA5RalryM3
	PUQ==
X-Google-Smtp-Source: AGHT+IHjgF0Ca8ethUSfrozdkFUFp0o0AUPtEhLPgrNZWa8lbUZ7qZQp3Z7lR+cNHb6EVM2g/AygpE/k1/Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:f16:b0:691:a38c:a61d with SMTP id
 00721157ae682-691a39bf26cmr3721507b3.3.1722901982364; Mon, 05 Aug 2024
 16:53:02 -0700 (PDT)
Date: Mon, 5 Aug 2024 16:53:01 -0700
In-Reply-To: <ZrFfvjy_-Tyx4xUV@linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-55-seanjc@google.com>
 <ZrFfgzRbiqT-Zi2O@linux.dev> <ZrFfvjy_-Tyx4xUV@linux.dev>
Message-ID: <ZrFl3faiGHQ5oLjf@google.com>
Subject: Re: [PATCH v12 54/84] KVM: arm64: Mark "struct page" pfns
 accessed/dirty before dropping mmu_lock
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
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
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Fuad Tabba <tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_165307_819959_30F29852 
X-CRM114-Status: GOOD (  14.22  )
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

On Mon, Aug 05, 2024, Oliver Upton wrote:
> > > ---
> > >  arch/arm64/kvm/mmu.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > > index 22ee37360c4e..ce13c3d884d5 100644
> > > --- a/arch/arm64/kvm/mmu.c
> > > +++ b/arch/arm64/kvm/mmu.c
> > > @@ -1685,15 +1685,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> > >  	}
> > >  
> > >  out_unlock:
> > > +	if (writable && !ret)
> > > +		kvm_set_pfn_dirty(pfn);
> > 
> > I'm guessing you meant kvm_release_pfn_dirty() here, because this leaks
> > a reference.

Doh, I did indeed.  Alternatively, this could be:

	if (writable && !ret)
		kvm_set_pfn_dirty(pfn);

	kvm_release_pfn_clean(pfn);

It won't matter in the end, because this just becomes:

	kvm_release_faultin_page(kvm, page, !!ret, writable);

So I guess the question is if you prefer to make the switch to an if-else in this
path, or more implicitly in the conversion to kvm_release_faultin_page().

I made the same goof for RISC-V, perhaps to prove that I too can copy+paste arm64's
MMU code ;-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
