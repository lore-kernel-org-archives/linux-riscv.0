Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23C6C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 20:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vOtm5qoHyJnPmtnuHWxkAuDCf7Gd985ZJUBD/bXQC6k=; b=L7D+F23E0ymhFYwwLZTjBanUdK
	m+4Yu3TRwzwrS+7dGf0ZaMObnrYTP+z4+kJ27Y9QZmFE+TlSDhWBL1IPjuvOqfrDkA/xB38Mrybyb
	diVUmZe9TaXzcoDcWrmQxJwgJlMDdTwLgECW7EDdYQzbmZphKExEgxjrOAnvv9gwOHmDB6GkTgiUF
	OO0FFvqRBqIDh3V8FCfgN6jJ3WDSFQDEfKadTcYFznNqy5mGgW+WDI93JohP2H94QwNOACZWPZ5s4
	Q3/pUFD0g8XuCeG3Pz7fVcjCnTG7zzbt5bu3VytZj5e5uTGCWFoQQkeG86XnjRkNhcQNg+/G+vlG+
	T5OThvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYt1k-0000000GN2r-3VBr;
	Tue, 30 Jul 2024 20:00:56 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYt1h-0000000GN03-17WO
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 20:00:55 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-721d20a0807so5080749a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jul 2024 13:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722369651; x=1722974451; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=T1b0dd+u4QtRKmjCQ1fWaclUboiBOp5PBFZF+RqiWy8=;
        b=aidgrk79IyZA/dfmZz8/nJC3+1Dc5dIksEM2TNiJSJKcgHHz2ny8x1tcGMeTPRFtbN
         LN0g2q6teMuUjEoY47vJhXQOINpBVvm9civjNpvYLOkfJtX5at1kErKLxCwwmdE4Lr/N
         TAaYmA2tHYxmkU3KtWHfcN9ZAqCRjxZnRdqLcktNBgWBeMlup44einoS9GlhOfcTV2ml
         Ai09BLmzGcJhq7tMNmt7EO0WRkoSAC9K0S5oHn3AbVoQUgco3OsV1YUNCYFbj52vEk3v
         7hiFvDn1lTOF0tnqr2pGYdyAF2qFqC+ihEfFqIRIaWI7p1KVlUGmGsaumYwNWiSzhj5Y
         H3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722369651; x=1722974451;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1b0dd+u4QtRKmjCQ1fWaclUboiBOp5PBFZF+RqiWy8=;
        b=pxQ0aV6WlpntoA0z52F1MhSGgbw/2JmFpi61uC1Q2OCUqSoY8bavrh7GLH5NP+I+3Q
         ghJ8Gu4jtyyeBk44AghmAwqt1EYcWkTJ+iJCSEdMvDjhpLjiXx8CLW4d7Kl889N+274S
         dr0XNFjyi880HNPhiNEmXBkuOWlptXHpW10nMSW7SHUH+unwY18aWyCgjrwd/EdsKr5X
         FP2tArdVipXf7zA+334TP9jXosP3/NzGEQSXFn1M7L+l1PkADgxc2J2hoSVra3VCvPhr
         IaMVm0hD7XvwGn41N13mkc8kwn6BykQiUGP5SuiRzCI7wAK2iQSKEEL/xJPrhpZtkYKo
         /9Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVSVrff7xJRL0T8yi3EGEX0AVLhWezxG/GPiBTaHpaX7XOpdrCcqKd355CNmHkPv2zrFuLcFO9ciUAnVIYDyrN6Z6NCb0i3de7o6K9iAN9p
X-Gm-Message-State: AOJu0YyfO+tz5vw+bh2DxD5V0usu5NOp1gJxryvlmCbIGU9HvcVZWGOv
	fAi4IUpsGVsyJo+mN4DoQOudPNRrp8wFsZSBuNiR1pXfX1pwujP6iwiZ8YO+U22E2z1R1ZpcnaE
	7Hw==
X-Google-Smtp-Source: AGHT+IFIpN0t9CwDntyaqKmkPJ5cyx3sfG1IwNUw2ka0n2i9gazwPDbMR7YOpYtas1d8Mj8EPxP4qtxT2wA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:5a3:b0:6bc:b210:c1dd with SMTP id
 41be03b00d2f7-7ac8fd2ec71mr34114a12.8.1722369651264; Tue, 30 Jul 2024
 13:00:51 -0700 (PDT)
Date: Tue, 30 Jul 2024 13:00:49 -0700
In-Reply-To: <2da6b57e-d5c2-4016-b89b-d51700eeb845@redhat.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-46-seanjc@google.com>
 <2da6b57e-d5c2-4016-b89b-d51700eeb845@redhat.com>
Message-ID: <ZqlGcaESdxw5vzl8@google.com>
Subject: Re: [PATCH v12 45/84] KVM: guest_memfd: Provide "struct page" as
 output from kvm_gmem_get_pfn()
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
X-CRM114-CacheID: sfid-20240730_130053_408574_A39682C4 
X-CRM114-Status: GOOD (  18.68  )
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
> > Provide the "struct page" associated with a guest_memfd pfn as an output
> > from __kvm_gmem_get_pfn() so that KVM guest page fault handlers can
>        ^^^^^^^^^^^^^^^^^^^^
> 
> Just "kvm_gmem_get_pfn()".
> 
> > directly put the page instead of having to rely on
> > kvm_pfn_to_refcounted_page().
> 
> This will conflict with my series, where I'm introducing
> folio_file_pfn() and using it here:
> > -	page = folio_file_page(folio, index);
> > +	*page = folio_file_page(folio, index);
> > -	*pfn = page_to_pfn(page);
> > +	*pfn = page_to_pfn(*page);
> >   	if (max_order)
> >   		*max_order = 0;
> 
> That said, I think it's better to turn kvm_gmem_get_pfn() into
> kvm_gmem_get_page() here, and pull the page_to_pfn() or page_to_phys()
> to the caller as applicable.  This highlights that the caller always
> gets a refcounted page with guest_memfd.

I have mixed feelings on this.

On one hand, it's silly/confusing to return a pfn+page pair and thus imply that
guest_memfd can return a pfn without a page.

On the other hand, if guest_memfd does ever serve pfns without a struct page,
it could be quite painful to unwind all of the arch arch code we'll accrue that
assumes guest_memfd only ever returns a refcounted page (as evidenced by this
series).

The probability of guest_memfd not having struct page for mapped pfns is likely
very low, but at the same time, providing a pfn+page pair doesn't cost us much.
And if it turns out that not having struct page is nonsensical, deferring the
kvm_gmem_get_pfn() => kvm_gmem_get_page() conversion could be annoying, but highly
unlikely to be painful since it should be 100% mechanical.  Whereas reverting back
to kvm_gmem_get_pfn() if we make the wrong decision now could mean doing surgery
on a pile of arch code.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
