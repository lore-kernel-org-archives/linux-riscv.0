Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9B6C001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 17:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xu5wO78tDbhT+HVvoPQ7UDhA0EA3igsrdSEIbB+jDOg=; b=1WROtZ5ITPeqMPEMiJnwY+HGdV
	liGkkynwbPb2GMTurQ6bxUKUGJIhFml+mYQFbdFti+b6ULkNFhPjr6um6/izPC6JE2JN9kis58l8d
	xNLGqaOy2A3WEIx4+ZgnH2SHCe3vsAexxCDJTtml8aoW2w+T8g+CbmwsAR4puPfEGqY+FP7M9ggN6
	e5WP8dr+PyEvmCmYm+37inn00D1zJ4nMS1gM2VGXedDagFkNYIpVktg/Go6/W5ubqeGcys7G9CAac
	96hyY5C0Zl/a01HRCc2hhOQXk7LkBBPCZmHPH2x1ZScTKc1+dLSk9oAbiQU+gpcM0M8bRnX12+k9K
	oWtTcuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQWtj-00GsQz-0J;
	Mon, 31 Jul 2023 17:41:35 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQWtf-00GsOS-34
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 17:41:34 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1bba5563cd6so29907265ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 10:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690825289; x=1691430089;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SmEubc/b5+1ukKHmZiUP8NXK6ZmTPwRGFOIZRTSZ3Gc=;
        b=KsPWb1bI8OHDu6mex8qxqciyU59VHcBE8c/TrFQtscgcFzTfxWbsxZ86iRaaNxYAl+
         uKEGEpPVr5RuACHnIFFoR51eaJEUed2t4e+cwXrQF1OxjVWfGiA2bHAktTjJx/3Kigv1
         aLf1g5txUjo6a56/6JBCnjOVbIAtJXUjDTEeDz/pdOQeXJbHmEsKASOemdZt5AKhHcRJ
         S2YeZdows1O/MtzAgbL+cL7HEWn6oTFY7iHvHMe9wPN+oc+AtA23+j+qV9lSjxcBksWz
         h1pEu0KmsBggaeJ5Qw/klASWUgGhTVJCRwUn+0br0etDmh0uWPcCt7wt/xET1lxd0bfl
         P5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690825289; x=1691430089;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SmEubc/b5+1ukKHmZiUP8NXK6ZmTPwRGFOIZRTSZ3Gc=;
        b=YmXkljydBVQD44te+l4hZIRJyMpmVfWH7ft/ttiGMVpjST7k9esC1WwbXhCJyQxv31
         OvPhgnTgmU8EKCyyv/FjxPCQOIazPmqifvtY67mu1iPOl0uNRgZ3aUUbK9hbJM8nV5wV
         RUFSYmO9EgaYabOodXqZ1QWFVgBOEYqXELcpeVNLUg13DKWP3+tTXHNb4yTqNry+bSm+
         snLcZFUPxaYTr2HJA3n3s9/0k+Yi99ZH88YDEfmvrKL/dPqEh0Gopl4SlgLRempK/Hl/
         FC6S+2Xbq0Hovi3iDjn8ybSqIl1lF39RvBmFGCkPp99nivlGGZFpabMmQYJuAHJqRVAz
         T20g==
X-Gm-Message-State: ABy/qLZC4f/xxAnbK9TRM+K8Eog7U0iwAq+WPUybIwrpTlnciBkfehFU
	iLVhuxEMZUmGSOVis8cbxLoq5Pe19kA=
X-Google-Smtp-Source: APBJJlGf7HZFyR3bDyVIouwwAN332PvEDe58O6oPRM2xmpXKj1o/qbd27/Xr8AZ4gMLnHXhphSiN3o4xpSo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e74b:b0:1b8:a56e:1dcc with SMTP id
 p11-20020a170902e74b00b001b8a56e1dccmr42348plf.13.1690825288754; Mon, 31 Jul
 2023 10:41:28 -0700 (PDT)
Date: Mon, 31 Jul 2023 10:41:26 -0700
In-Reply-To: <ZMfxYR41K71UV/84@linux.dev>
Mime-Version: 1.0
References: <20230729004144.1054885-1-seanjc@google.com> <ZMfxYR41K71UV/84@linux.dev>
Message-ID: <ZMfyRnROXNeu4tnS@google.com>
Subject: Re: [PATCH] KVM: Wrap kvm_{gfn,hva}_range.pte in a per-action union
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yu Zhao <yuzhao@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_104132_002286_79D97D4B 
X-CRM114-Status: GOOD (  18.95  )
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

On Mon, Jul 31, 2023, Oliver Upton wrote:
> On Fri, Jul 28, 2023 at 05:41:44PM -0700, Sean Christopherson wrote:
> > If this looks good, my thought is to squeeze it into 6.6 so that the MGLRU
> > and guest_memfd() series can build on it.  Or those series could just
> > include it?
> 
> Eh, I'm not a huge fan of having two series independently reposting a
> common base. It can be a bit annoying when the two authors have slightly
> different interpretations on how to improve it...

That suggests that there's something to improve upon ;-)

> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index dfbaafbe3a00..f84ef9399aee 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -526,7 +526,7 @@ typedef void (*on_unlock_fn_t)(struct kvm *kvm);
> >  struct kvm_hva_range {
> >  	unsigned long start;
> >  	unsigned long end;
> > -	pte_t pte;
> > +	union kvm_mmu_notifier_arg arg;
> >  	hva_handler_t handler;
> >  	on_lock_fn_t on_lock;
> >  	on_unlock_fn_t on_unlock;
> > @@ -547,6 +547,8 @@ static void kvm_null_fn(void)
> >  }
> >  #define IS_KVM_NULL_FN(fn) ((fn) == (void *)kvm_null_fn)
> >  
> > +static const union kvm_mmu_notifier_arg KVM_NO_ARG;
> > +
> 
> I'm guessing you were trying to keep this short, but it might be nice to
> use MMU_NOTIFIER_ (or similar) as the prefix to make the scope
> immediately obvious.

Yeah, agreed, it's worth the extra line in kvm_mmu_notifier_clear_flush_young().

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
