Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4344BEED609
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 13:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+i3c5XNl3b9jBmrU2t0MkgQwX74uD2eK60qz638vfqA=; b=Y7W+wgwgiTxJDjzbg7nXJ/nNC6
	Ph3eQCaJGH/DVVkJqcz2/iIl/X9B4SdH/pl5/UxHambJykh+wDFEx5TmP2Orw6ci8bgQ0WglZRuai
	P0DccQBsNM1dMVXe9A2HuPTg+YmZvV620YXCDD9Ks67g6vGkCd32/R4boozQMFgwmIn5Arrbq/gCT
	WCvzhEcDVvp5djUFWszhT2kVlmV2Bmr+3FnXKubZAXKtdYeMVeXkRsDiqmQanGkFjsYl7bpOVDYjc
	gvdVpsbDTfhPhgs/HZFVFxfLLYm+zzvxwlRfz/8CUXffkH8v2aUwgSHUUjh8i6P7AzzaOgq0sgabA
	uORlSnTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sokCi-0000000DFxb-0d1V;
	Thu, 12 Sep 2024 13:49:48 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sokCe-0000000DFvh-3GHD
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 13:49:46 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6d6bb05f2e9so16964737b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 06:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726148982; x=1726753782; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XqdrXm4ZcBhMxArHEVqbh0H8bhyUvIJvDn8m8Oi5KOY=;
        b=in/y3j60C8V6vYhGbe68wT1jl28Yk238sPDcC5L6Ml6Mn+wg3OhXdxy9x6WxP8dg+K
         Tuv2sdAxndtEoEKdDEdkmq8evvhFyTgSD7ekHgJ/webWEk52zidSbdixBG7t1OYT+/OQ
         B4pa/hz0opTRZl0VxLtlddfl+iXp0fegyD5afmtXra9/3CZPkAcDP9vJSFkxDw7dVEYE
         BkD4kS6SbBcjonhwIEmZzZXAZu8ihfcYBFE31yf/RykJqhtVsEHPsSvZNCbHG7Imj6LX
         UX+Cxk7IFZFE9ht0pzKxtQmEsBcCx/Jja08Pdqh+cJ03XoNeyeJROChrCXK+rsGniOqH
         OkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726148982; x=1726753782;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqdrXm4ZcBhMxArHEVqbh0H8bhyUvIJvDn8m8Oi5KOY=;
        b=l3bPJBEaqS/iJkLDoxwjhl2ytC/jOBryqtKrET++27Auc+HkVnJkVVeZDhB7JWdc/O
         R6uCCT4wvG4hTW08JUf0GaZYdd2UEI/v4+dWunJaMVhK/b1U7sCss0PeRd4uZXlDVnsm
         Qf9v5hNVKpciltPyHV7eH2BOnTwgn2EhYrfWFFltM2QyzhOdebDXXOZ/EJ5TPJvM9VH0
         HFwj8/rp0OQVbxNcCPctXir9riqjb31CwngUrHJyIPdlN1kHtG7Aho9fc5wWguJpsxgy
         azpAvTZVmU3FpkeyjkapukZUhvVVG8hIm+evbskf4fHxr2CZ9KbJa9ATeewrToXG9Cxk
         MeFA==
X-Forwarded-Encrypted: i=1; AJvYcCVFLg4Bs+GVMOJ0GM7U8xiMPrqBKoa36ycKjuGc5Ewqb4BJWZSUPV/mYHDBSrrm92VUBizzLbqua8F+qA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUonn5Nz4+yyiNhcGZDBxNRyPSofGhfziMl2w/WENOgoCUWUGv
	xZl22HPaSLtEDykSR7lTBZAQ/Lz95gLeIt1sXA9AKgrfm+vpOfr6NfBSAx1G2OAYNRCKSR6OLNm
	NzQ==
X-Google-Smtp-Source: AGHT+IERWDyZH0lw1THIMdF1ZNEMNfNEpIHjvdgU0tin44x4h90whZRVuXvE3+8fuo4JVbUfWmxTfJ+4tEs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:50c:b0:e1d:a616:602 with SMTP id
 3f1490d57ef6-e1da6160834mr2247276.7.1726148982380; Thu, 12 Sep 2024 06:49:42
 -0700 (PDT)
Date: Thu, 12 Sep 2024 06:49:40 -0700
In-Reply-To: <20240912-a3894135370bf3fe551ed018@orel>
Mime-Version: 1.0
References: <20240911204158.2034295-1-seanjc@google.com> <20240911204158.2034295-3-seanjc@google.com>
 <20240912-a3894135370bf3fe551ed018@orel>
Message-ID: <ZuLxIjMT4QzrUaad@google.com>
Subject: Re: [PATCH v2 02/13] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_064944_837172_FED66DEC 
X-CRM114-Status: GOOD (  10.15  )
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

On Thu, Sep 12, 2024, Andrew Jones wrote:
> On Wed, Sep 11, 2024 at 01:41:47PM GMT, Sean Christopherson wrote:
> > Return a uint64_t from vcpu_get_reg() instead of having the caller provide
> > a pointer to storage, as none of the KVM_GET_ONE_REG usage in KVM selftests
> 
> "none of the vcpu_get_reg() usage"
> 
> (There is KVM_GET_ONE_REG usage accessing larger registers, but those are
>  done through __vcpu_get_reg(). See get-reg-list.c)

Doh, right, which was also part of my reasoning for making the conversion (tests
can use __vcpu_get_reg() if they need to get a larger register).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
