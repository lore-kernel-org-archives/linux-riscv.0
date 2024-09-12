Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300CAEED617
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 16:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZzKd1yohNdBXwCG00n7E2WneHCeP1kMtnWEZQOLm6S4=; b=UrE14422RVsr0drGjhjGCHAZ1j
	JRUQpGD423giHv21pQx+CrbORsDvPsTQtPRndhbnUktIeD1HxV8ljr4hgeAIPuGZ485WV2IJZXLOX
	hIkABe+Uti0mWhiVqJFsVCPOzj2n6x6CxscA3RdJRh7m+Lmd4kltexAmcmSPN7OvCa8QrRroYzB9u
	9sG2dXSGnz4Kto0z10FhuTccw8wqsVG3CCWIHi7lJ7OI8DmxUdYYXzAGOtGIDe03Yi66ck26rLyi6
	Rv3EgE27GwDllxOT5CJr5A/9ZmCspNIYQ3Bhur1g9t2JhXlfpG57l2ng9b7UnSOY29nM7LCSK5r8l
	TNN6Z9GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1somWt-0000000DgHb-1EyW;
	Thu, 12 Sep 2024 16:18:47 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1somVo-0000000DgB7-1g4e
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 16:17:41 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e1a6d328eacso2146667276.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 09:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726157858; x=1726762658; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CHc8H+AgFlKGz9oROxRBwufdfanAh7CzUD+9HRa3+GA=;
        b=uq33ZtgMtdGAvJWfftdEpk1qFrmZx3KrPAHQ6mm7hm1TlilU90A2dcYaPboMDJwxPH
         i6f+uYwNnPjrBqK9PvyXEUroCDmuKkTaeDbsUzmu9E16SntRxWNpaSpvT+fnbN9EnjT+
         dpHBRh4lrMSVn1jAqqz+dCxVypOFhQV03cYv0aTZwn3bDNt/HzM8aTbDjN8GScSOhPHn
         uepcwSNzA/4HhLL1ws2qwBqQUs5EqbI+qIunhQ+zJ5hmE1DDwh8H5EdP1+6WmduyAmFs
         XW8yYV1f6LIqogExyNF9qG0OSnYQZZVfpsuSG6vzVoZrLHz6Wcomr92CH+f1YUdI/Tde
         pmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726157858; x=1726762658;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CHc8H+AgFlKGz9oROxRBwufdfanAh7CzUD+9HRa3+GA=;
        b=bs6jXmB2f/IMp0sFdhVjQgfEuJhhE0LFejRiPoEF4RblYHFlNQNo4y0IKLENPDithd
         icJra2JQ1lCe4anIuo+jzexenLCVihH71nmR+dIPY63qIFpLiNjtb/ugnm17BaAEWu0h
         b81K67z8R8Ro8m/mMzsccJ1i51n/RmgDqc4zXzjDM2NsRTzQ88vqCegIYAKV5qC4mg+Y
         VbRYfYdZnlhkgG8mTz9uzY5e6ZvnTnXkXP3BWACQrzzhVSrWHIY3GBO/RzMsaLjsQ44N
         dXvjfXy/Nmxr8CxOGI9ca9uwTNS8m/t1DCU06NjkiZ8NrJs0YpG4LBKdfvHGgJMWcP0w
         qyAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnz2O2r/EcelRxbkbzXYyTxz1NG9B5VnSKnKpDxZgec7AaZR/LdiLZxRHkJimkLsZCeXcWFEh3t5RHUg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/d9YG6c4yeI0uIa+8TSm5FTGKbG/sFDWlEUthnx9/fXBvMMdl
	3z5TP6Vcum2h3bEPhMD16QJ9pAwKhCq3PtGPGZm9PYSTLZQ82cZoxVK0slRpVWxSLtcEsM8uBdi
	NPA==
X-Google-Smtp-Source: AGHT+IEJVscKJvuinHeLuj6Vk0WsuDDxtUgSvi9YqWgJNhdyRuKGPX9aioKoGnIVhZDgsM2BQvZ5JjUQZqU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:86c4:0:b0:e11:5e94:17dc with SMTP id
 3f1490d57ef6-e1d9dbd0464mr4681276.5.1726157858129; Thu, 12 Sep 2024 09:17:38
 -0700 (PDT)
Date: Thu, 12 Sep 2024 09:17:36 -0700
In-Reply-To: <20240912-75f992936cd9878d0e507498@orel>
Mime-Version: 1.0
References: <20240911204158.2034295-1-seanjc@google.com> <20240911204158.2034295-5-seanjc@google.com>
 <20240912-75f992936cd9878d0e507498@orel>
Message-ID: <ZuMUIPIu5iRuxLCC@google.com>
Subject: Re: [PATCH v2 04/13] KVM: selftests: Assert that vcpu_{g,s}et_reg()
 won't truncate
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
X-CRM114-CacheID: sfid-20240912_091740_444929_6C21FEFF 
X-CRM114-Status: GOOD (  19.16  )
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
> On Wed, Sep 11, 2024 at 01:41:49PM GMT, Sean Christopherson wrote:
> > Assert that the the register being read/written by vcpu_{g,s}et_reg() is
> > no larger than a uint64_t, i.e. that a selftest isn't unintentionally
> > truncating the value being read/written.
> > 
> > Ideally, the assert would be done at compile-time, but that would limit
> > the checks to hardcoded accesses and/or require fancier compile-time
> > assertion infrastructure to filter out dynamic usage.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  tools/testing/selftests/kvm/include/kvm_util.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> > index 429a7f003fe3..80230e49e35f 100644
> > --- a/tools/testing/selftests/kvm/include/kvm_util.h
> > +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> > @@ -683,6 +683,8 @@ static inline uint64_t vcpu_get_reg(struct kvm_vcpu *vcpu, uint64_t id)
> >  	uint64_t val;
> >  	struct kvm_one_reg reg = { .id = id, .addr = (uint64_t)&val };
> >  
> > +	TEST_ASSERT(KVM_REG_SIZE(id) <= sizeof(val), "Reg %lx too big", id);
> > +
> >  	vcpu_ioctl(vcpu, KVM_GET_ONE_REG, &reg);
> >  	return val;
> >  }
> > @@ -690,6 +692,8 @@ static inline void vcpu_set_reg(struct kvm_vcpu *vcpu, uint64_t id, uint64_t val
> >  {
> >  	struct kvm_one_reg reg = { .id = id, .addr = (uint64_t)&val };
> >  
> > +	TEST_ASSERT(KVM_REG_SIZE(id) <= sizeof(val), "Reg %lx too big", id);
> > +
> >  	vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> >  }
> >  
> > -- 
> > 2.46.0.598.g6f2099f65c-goog
> >
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Shouldn't patches 3 and 4 come before patch 2 in this series?

Ideally, yes, but for this patch, it gets weird because the output param of
vcpu_reg_get() isn't actually restricted to a 64-bit value prior to patch 2.
E.g. if this patch were merged without that rework, then the assert would be
confusing and arguably flat out wrong.

As for the hack-a-fix, I deliberately ordered it after patch 2 so that it would
be easier for others to (try to) reproduce the bug.  I have no objection to
swapping 2 and 3 in the next version.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
