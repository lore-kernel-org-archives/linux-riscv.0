Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1ECC3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 22:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UW5uIbUvtW6Gl1Fmfifo0tcIpHiqclOu6hN3jyNxiGk=; b=jdDM1pc/QtSlppiyGzGyxEpI8n
	6j9UHXt1ev0EnJorUOhR7zjajImG44++8V9UXDqHhPipByshJRVJRTNidX/Wm9LyZo6ZvhWxbIp+y
	Sqzxwlvse3/pPzEk2+tjYdFX04eSxY/A+9QJTVfL0KbNVHkV+b3MXm8kqgyNX+lf0gue4TJm93/Tq
	WXtUSAhpYfmr6JhHLq/gt1vSXKonYsUnssk02LrCU2yyHy5oVOCi9G/p2qCpAjxjarKCYkUFmiFjz
	t0/p7fNrWceZRLwEbBwacJNj1lK8tESatqHIqspKymzOFNMybJFXM9Qz7ZhquhshUbXqtSQe8osx9
	pCEqYwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb5tu-0000000HQHz-3oir;
	Mon, 05 Aug 2024 22:09:58 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb5tM-0000000HQ7W-31AJ
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 22:09:27 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7106fcb5543so3132814b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 15:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722895763; x=1723500563; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C2PiU8MTrEuvmn4oJRZEcNoPreaY/lLc5L+V0JuLroE=;
        b=115nYEdRclej89a+1jgGo7pRGhtbQQfLhl/xoyMti8o6mzKAOYsl+70srkjAaT1ZTc
         8yE1m2vdHqta1EDgYa2f69T9nG+S7WuXj9ZxPPRF9RrXxygTG2u7Wzk61CEP2ZURP41K
         TvkBkU+EYLga5Dkod9iRNw+udFADUOSojnD+u+/m3FAldXSpdyp2p05v9DVrYzHlZVid
         wI67tInY/EENIR1OLNBGdVI99xuj4lekCEhaeDMfRO9pqB5j5b7SU//iBtTC9gBbB2BZ
         YOLbJ5yG0gvMJuCitbLd8zSez2kh6O71y2N1f9+NVQE8eYIhVJKF4L1ZqcUH/KGH/YKu
         IEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722895763; x=1723500563;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C2PiU8MTrEuvmn4oJRZEcNoPreaY/lLc5L+V0JuLroE=;
        b=UwL5QB22ij37rBC7K/3OLFwbUv0bohogAOluP1Eoqk235ePbZXmL2ZPPc0w9MIJItr
         L6UnrIoq8LNDYrgNTUpdxEfrkbNeC/dHTk/FfoXOBwG9Lz7ObzWtgHY+bIUn1E2ovMbT
         GRIx14ZvuTS0DDo+fJc7JgpBQh1bKKiz5PPmRPuv32H1EdZ0A8eLgWlEQw7sZbkvJ2IY
         DBCfQS88vx5kQg+6A/vSswn0nbe7huxPPACcZ3/JOXnun5InDu3y394Eq+TiT3RUETl3
         bhEe6U3cdhvZQlQJl1ek0yEKdJZ9IIDLrOgfXLjFeifqHnK1Hdg3bciXZUjPib6rL40t
         DsRg==
X-Forwarded-Encrypted: i=1; AJvYcCVk5gvLX9TbUl4owa85K1/A9tdiLyuRdXLUDUmmAdugL6bdpOINuB5fJbcBI+9udilWGBQzkB1QgCghLSRtwIDsKhrJm8ywPDEkeIqkTCYx
X-Gm-Message-State: AOJu0Yzzrfhxflnjr3lWY/YJVPr9C7QGfYmXJjM3MSicRwqtcobY/wE8
	SLtN8Vn+l4zGESQlemBCo9zaiH0tINInLqyE4Lv8H7yiX46v7oZqpW6177UXtbC7V0bkZ+HOD8S
	3EQ==
X-Google-Smtp-Source: AGHT+IFHGqnQ2aZELEsNF/YUFUu/OdaSqANvJ2o5+KNT08fnEczrxRkzi5g08NacDnyiiIzp3YSr6oxKzK4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:6f0e:b0:710:4d08:e41f with SMTP id
 d2e1a72fcca58-7106d08296emr87588b3a.4.1722895762937; Mon, 05 Aug 2024
 15:09:22 -0700 (PDT)
Date: Mon, 5 Aug 2024 15:09:21 -0700
In-Reply-To: <yq5a5xsftna9.fsf@kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-3-seanjc@google.com>
 <yq5aikwku25o.fsf@kernel.org> <ZqvNekQAjs-SN-se@google.com> <yq5a5xsftna9.fsf@kernel.org>
Message-ID: <ZrFNkSU4-0Hli7JC@google.com>
Subject: Re: [PATCH v12 02/84] KVM: arm64: Disallow copying MTE to guest
 memory while KVM is dirty logging
From: Sean Christopherson <seanjc@google.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
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
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_150924_782094_3F11091D 
X-CRM114-Status: GOOD (  22.54  )
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

On Mon, Aug 05, 2024, Aneesh Kumar K.V wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > On Thu, Aug 01, 2024, Aneesh Kumar K.V wrote:
> >> Sean Christopherson <seanjc@google.com> writes:
> >> 
> >> > Disallow copying MTE tags to guest memory while KVM is dirty logging, as
> >> > writing guest memory without marking the gfn as dirty in the memslot could
> >> > result in userspace failing to migrate the updated page.  Ideally (maybe?),
> >> > KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
> >> > and presumably the only use case for copy MTE tags _to_ the guest is when
> >> > restoring state on the target.
> >> >
> >> > Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
> >> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> >> > ---
> >> >  arch/arm64/kvm/guest.c | 5 +++++
> >> >  1 file changed, 5 insertions(+)
> >> >
> >> > diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> >> > index e1f0ff08836a..962f985977c2 100644
> >> > --- a/arch/arm64/kvm/guest.c
> >> > +++ b/arch/arm64/kvm/guest.c
> >> > @@ -1045,6 +1045,11 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
> >> >  
> >> >  	mutex_lock(&kvm->slots_lock);
> >> >  
> >> > +	if (write && atomic_read(&kvm->nr_memslots_dirty_logging)) {
> >> > +		ret = -EBUSY;
> >> > +		goto out;
> >> > +	}
> >> > +
> >> >
> >> 
> >> is this equivalent to kvm_follow_pfn() with kfp->pin = 1 ?
> >
> > No, gfn_to_pfn_prot() == FOLL_GET, kfp->pin == FOLL_PIN.  But that's not really
> > relevant.
> 
> What I meant was, should we consider mte_copy_tags_from_user() as one
> that update the page contents (even though it is updating tags) and
> use kvm_follow_pfn() with kfp->pin = 1 instead?

Yes, that's my understanding as well.  However, this series is already ludicruosly
long, and I don't have the ability to test the affected code, so rather than blindly
churn more arch code, I opted to add a FIXME in patch 76 instead.

https://lore.kernel.org/all/20240726235234.228822-76-seanjc@google.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
