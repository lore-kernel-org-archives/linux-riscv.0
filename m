Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FED8D17122
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 18:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4cISCbawxm32eeUwboakdx3dw175FPPZoMibfUmtaBY=; b=ArctgzfcPLhlFs8ZQMc2fmDqma
	r68X1zzxwFA6L+RtdZzKr5Tg3o9UFsts+hFNtrHKL8BLDI+IkscvJXikqO3WkDvT/fe7g9it8sV+w
	Cw+HdBUKzn4vg94Hy7R3DfShq+afhtpZiwdtNzUfkPi/T5vry1VN4VhX8M2Kc7izrDwva0dBbntv3
	T0gkXMYqV0RlnDE4Bg2d4iu6+YVXgFFXGfPSpHAUEEvPkZzPs3CBHxzdysU0JQzJmCSUjOIZjpnBy
	76rKyNPWOUwAYZ8Nn8NGD6CuPkPYv+FrtSR0tYsw3wrlDQYkixaP1xxjdT2V/8nh0IM86TzQBS/AN
	qQadyIYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2wtP-00000008GSC-2DmI;
	Mon, 21 Oct 2024 18:12:35 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2wpp-00000008FMI-0mB2
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 18:08:54 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2e2d396c77fso6060533a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 11:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729534131; x=1730138931; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B4nB5AD8jm9woOflkJu9LaOALYzY3FWUJ+pKW1FSB8o=;
        b=YSkuKNr9XgZadGB/RBBFR2K0sSL70gInVXYWFvXhRhvUKfnuBEW0BriKh+0Iw3eczO
         QagL/9US/5P5yrStdvvqBLPm/AkOwTdkbpuuGDX5WdC4meftFvtKarodDGSnME0lMIOZ
         gTzp+olETvutspnk1F/WH/oBN5E53NbBIiTWaGPVEbiDCZQUfGG63TgKYxnVf7hT2tDq
         ZM0GyKOjhQCYgjLa6VlpBb9/8DHtP20+CNoAzFptyfVVp/KgupeO1cwu5j+gr/F4VnJI
         Rcn/V7SQ+lekX5f+Pa1LRgf3qr6Gk5GNQr16Il5i/L/kJTZnOgxtVPBel1+SnXG85s/o
         gtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729534131; x=1730138931;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B4nB5AD8jm9woOflkJu9LaOALYzY3FWUJ+pKW1FSB8o=;
        b=D9kLYwgo91ocaBAAvlk35CErUpvKBQV3Jw9SNv5ZSw5z++QIJkSO13MH5iVfbgKnts
         II0d3xe0wmgwFuCqn2HAPAX/BT6O37QGeAl9ha4h5D8W8GajULgyljyReN6OUuXjY5Fp
         sEkucsIl7d7ZXXaOWc7DWJqJw9ei9ajaNpGIvKE3PMUyXMAkdW9d2zL8OoIkqoehyTVQ
         O2N60o9nqW7V1NOzs0INx5ufE7thTgqaQerTa/5bsqcTw2vOBxxTd4cNCoYFoullvWC/
         DPTelH5tyV9s5lDHbkvZR5yMAys1wjj1Mvt4Tv8fbMWGycx6RmBQ+2PlUU3rwY6WTRiK
         JiYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRyxm/RzqraGLDBCVwB21747Pygci1GJsdSJuX+8TFkn7UUHyId1kxS3w2N7Ar4RJoSId/TBKE/9nRXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtJ2hifmH0W1qs4BzH1F5ppyZCW/UFC3dCkGBu4iX5GlcyakAJ
	t7XGWKcjVz3RX5aXJ7uAMjBr8NAX3TxFj292gt62OMPtpDTJH1wW5nKwxwoUFV1bmS2DRXzOmtK
	z6Q==
X-Google-Smtp-Source: AGHT+IHz/sqxbIaZMzAhwQE+KHAQ50pc4vGOx7OQ/MlEMfrpYKQ16K4ySzEgLcCV5+myw9EmSbX31Z6uvf4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:e147:b0:2d8:a9c2:2f3a with SMTP id
 98e67ed59e1d1-2e5616d8f42mr22750a91.3.1729534130899; Mon, 21 Oct 2024
 11:08:50 -0700 (PDT)
Date: Mon, 21 Oct 2024 11:08:49 -0700
In-Reply-To: <ZxYVnsW9WF1Wp8mx@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com> <20241010182427.1434605-20-seanjc@google.com>
 <ZxYVnsW9WF1Wp8mx@yzhao56-desk.sh.intel.com>
Message-ID: <ZxaYsfc0m6UHmi10@google.com>
Subject: Re: [PATCH v13 19/85] KVM: Introduce kvm_follow_pfn() to eventually
 replace "gfn_to_pfn" APIs
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"Alex =?utf-8?Q?Benn=C3=A9e?=" <alex.bennee@linaro.org>, David Matlack <dmatlack@google.com>, 
	David Stevens <stevensd@chromium.org>, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_110853_244326_9573B7FE 
X-CRM114-Status: UNSURE (   8.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 21, 2024, Yan Zhao wrote:
> On Thu, Oct 10, 2024 at 11:23:21AM -0700, Sean Christopherson wrote:
> > --- a/virt/kvm/pfncache.c
> > +++ b/virt/kvm/pfncache.c
> > @@ -159,6 +159,12 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
> >  	kvm_pfn_t new_pfn = KVM_PFN_ERR_FAULT;
> >  	void *new_khva = NULL;
> >  	unsigned long mmu_seq;
> > +	struct kvm_follow_pfn kfp = {
> > +		.slot = gpc->memslot,
> > +		.gfn = gpa_to_gfn(gpc->gpa),
> > +		.flags = FOLL_WRITE,
> > +		.hva = gpc->uhva,
> > +	};
> Is .map_writable uninitialized?

Nope, per C99, "subobjects without explicit initializers are initialized to zero",
i.e. map_writable is initialized to "false".

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
