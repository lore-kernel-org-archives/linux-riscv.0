Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAB4C04A6A
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 16:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mlxOqwvM66uKvQMO+6Ra9GdHMMgnoPTbMEKG8x5CbEA=; b=oJMJ5tRXxOvonox+I2/LHBslmd
	aH3l+eGBDeKep5MDe2BLV57TGgsVPGYHZOVX+1g5GUxLszdRdVZ3M2jCeUb7nsQonsb0AVyVXZg/S
	W79bhlmg36OY9+PsP37KpHtxn1OGqWP1mwFRXFviqU0/9iIhSXLUIi09jR+fOWMccWbNqUKHGyn6W
	ya8Zhvbj+QlATEUVpgnA6hyQ0gbS6nzJaFme7LLxeH4G6Rgr6l0GWhYnZKA1x/iljPAUnOKlsgVhs
	KEM05zD0hdFu9MeeduR+iluqiqFHOzXmaa3iknqmrvpCuU5+/e0cKMT4Nn9KMUgRbiNeSc7RaYH7B
	F/vSTeoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRER5-005KFp-0h;
	Wed, 02 Aug 2023 16:10:55 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRER2-005KCo-0Y
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 16:10:53 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c6dd0e46a52so7152859276.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 09:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690992647; x=1691597447;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J4aKHKt7aK1dph2vrDmFCSsCX7pNGRd0NMwM4bEJgp8=;
        b=zT0xCNei+dnr4osudv9CAX0NFIvpN9o/MM9DYDQ2quRiRk2ySEcgwiLx53XnB1e+LY
         cWfI4OmX27mBOaJ58zlzT26+ZLcNHSkLH9hi8/662YILNSSO1QkU4G145NcnSjse7Tfi
         xrBWi/aY8NG6dUaFl22owtMyugIfQwHdkO/hgFnA80wpzq4X517qJXwcuOIoXxcIvofm
         vONKX+ciK2E9BoSSjIdQ67NLAviV68y9PDQBJ3S/jrfYmNcLzOoOg269tqqWjlilRydM
         bYWsCmY8tkmpgydfPs6qY/prFitzHw68WvsqFmR4BcVKfrWapat3cp0d7IklIiRVq+z3
         Zr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690992647; x=1691597447;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J4aKHKt7aK1dph2vrDmFCSsCX7pNGRd0NMwM4bEJgp8=;
        b=gChlYyyOlamOIUAK+ajxaVXGTCL/nkQoBoqmEObGZ4MP8bnNeRSwDc9FrxFG/YdSMT
         rNS9jPRWVoPDLanKV8NZ3bcW8ANCS52WnwkTfCXa53YRpx+iAgdSM9zNoA57wti9AAsa
         EhiJeTxEDu8FdYGgKnH0nUDIKLB4RJoZOT6Ff/D+N7GWYgg3mIgq/ulrO0vkCvStnxxn
         NGSAWoX3o3zUip/mGPKoo+8ZwT4F5gSz5q9nsnzCaLqTwr8yiBYIGSuXoxi7C5rjPalD
         A/Qv4jsAghfX/tDGhARX9fN5WtWY2imrR2SNBNrHST2420gmbP0imWNApO6hwjb4RRQM
         o1Ww==
X-Gm-Message-State: ABy/qLbD0uZLfkDfLOxCh1kC+7isYNXW9MlzEveU7U+jv936/z5ohLNu
	rObEC4uTLe7XGcmeNZzHagC/bPdSa6M=
X-Google-Smtp-Source: APBJJlEeZC4NdvQKtmvRvpxiJWd4xeVqmT7pbWiugvK9iOofl4skg4f0sy48sXdlWulLCE9MeEDt/9unkzk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ab0b:0:b0:d0e:e780:81b3 with SMTP id
 u11-20020a25ab0b000000b00d0ee78081b3mr101602ybi.2.1690992647424; Wed, 02 Aug
 2023 09:10:47 -0700 (PDT)
Date: Wed, 2 Aug 2023 09:10:46 -0700
In-Reply-To: <878ratqw2l.wl-maz@kernel.org>
Mime-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-2-rananta@google.com>
 <87v8e5r6s6.wl-maz@kernel.org> <CAJHc60wtc2Usei3hKj1ykVRvBZFFCBOHMi9HCxnNvGK2dPFApA@mail.gmail.com>
 <ZMgqueePlmKvgUId@google.com> <CAJHc60xM+KsUKxtoqORnpzrRke4T-sob2uLJRMvBKwruipxnpw@mail.gmail.com>
 <878ratqw2l.wl-maz@kernel.org>
Message-ID: <ZMqABp6OdrgOtsum@google.com>
Subject: Re: [PATCH v7 01/12] KVM: Rename kvm_arch_flush_remote_tlb() to kvm_arch_flush_remote_tlbs()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Ananta <rananta@google.com>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Gavin Shan <gshan@redhat.com>, 
	"Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_091052_207096_9DB0A2AA 
X-CRM114-Status: GOOD (  14.09  )
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

On Wed, Aug 02, 2023, Marc Zyngier wrote:
> On Tue, 01 Aug 2023 01:42:54 +0100,
> Raghavendra Rao Ananta <rananta@google.com> wrote:
> > Thanks for the suggestions; I can go with a common declaration. Along
> > with that, do we want to keep defining
> > __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS in the arch code that supports it or
> > convert it into a CONFIG_?
> 
> This isn't something that a user can select, more something that is an
> architectural decision. Maybe in a later patch if there is a consensus
> around that, but probably not as part of this series.

+1.  I agree it's annoying that KVM uses a mix of Kconfigs and manual #defines
for the various "KVM_HAVE" knobs, but we have so many of both that one-off
conversions without a real need don't make much sense.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
