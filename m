Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CA9C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 04:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lRLFVncp+QV+QpLYb86gUQJCZMfHf1TDsWfJVETMl/E=; b=plMAdjYF2YcYIX
	ZK9kpoK2LlENy8N1ZYGkqeSBSUXidyyBFAQ2RW8w+25aD7DUTeVHEO8PwKBuSjIZ0WwdLbrAZ0DfN
	6p0rry7TJa6KTiMI1YoNI7Al+rrqW7Jc7zJKzV2y/xIiucvrIUEcO2W6XUCMtTLx+lLSyXZogDrcf
	hl8Nvnaty30hULC8utfklBmtptfiF6SpcCXBV5Iq2te/RpcKdzbEMNU3L+45yjI8ZNh3xha2YexFU
	dZxz4FKiZBZ6jcLmBSPWtqrv0j7hDZURYyG01SnRd4DU/GPjjUAFKzYvz6dm2eAPW3uEXPWbUMe3m
	RHUFPXH9B4oucyQKRy5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDHzt-00Aojb-3y; Mon, 18 Jul 2022 04:04:41 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDHzq-00AohF-J4
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 04:04:39 +0000
Received: by mail-wm1-x32a.google.com with SMTP id r203-20020a1c44d4000000b003a2fa488efdso430220wma.4
        for <linux-riscv@lists.infradead.org>; Sun, 17 Jul 2022 21:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EsNHa5a7SYRE73Woad1Pm7o9hAag7TsYX0J/jHgYB7o=;
        b=g4VJ8tJfoUHwr0f7YDkQKkA2v6ULPwzVFzxffb3/pOBGZWeRc9VcpfIi8GgVh01apL
         EGkJik7CdGhR9BPWa8mqiVzx5QYd+vhhGjykJBI6EjIqzuxCyhDcApT2gdAhndSkjmOw
         Y7lydZUx1es+7aBOqRlgDjEGmQRUYTYX+YnrfmwWmdUkf1v5HHFLlFcVogRKXs4Vs9hj
         n8grMRfAXob3+G2SMsba001Dfuvtk27dCCVgZrkl2Xg8piE993Ccs7hvVSfUJFX6I87C
         ZGxeMqyKG9exBMjSphCcDQKjtwHGfSlKZz9HTxj9Cj9ApFho6snHsD+u7VXjKwpwzqJc
         OzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EsNHa5a7SYRE73Woad1Pm7o9hAag7TsYX0J/jHgYB7o=;
        b=aYlD8vgd59rp55e4T+g0QGueYnwnMY4PZ+h6LTfD5dd+9QlzG16M52fGvE6GHxvr2k
         3c0X59B73pk8OCVJP3KmmTZW5tHzMK7Bar2H6Akn/bxlwvwMvFUbhDI2jpQ9osWK5L/2
         bLcNrVC1hxl5qKnoAxxx3vTpOm6O+AYGmlVRGQwXqs+0VdKciql9hNnNaKYj0FecW/VA
         /OvCog2wk+kUmINd279Ya/PehFoytboyPQQGoCg4nhukS0OOczw4CnR5V+vwzcPooCnr
         t2GFb/rA/lC+ZkaGq1t467vkdSbiezM7MGIPF6cPjw0qLV1M78At7G8j+FRmZEbZg5Tj
         NhdQ==
X-Gm-Message-State: AJIora+slN4ftIRbu9wU2Qnfa6b0ylP3FE4+6q/GCg6coQtYp4emKedy
	l92Y61K6qU9BX53J1JTqlWUv7ZReU9Il3JnrN5e/Zg==
X-Google-Smtp-Source: AGRyM1uPK2XPDB2+i2fdHzYggyrdGIUO/R1IO1YCkIEJGgYoGsS7JVP4puAb7bkgO7oZNrpuaDKO9lthTTbezmNv0GQ=
X-Received: by 2002:a05:600c:3caa:b0:394:8fb8:716 with SMTP id
 bg42-20020a05600c3caa00b003948fb80716mr30056082wmb.105.1658117067083; Sun, 17
 Jul 2022 21:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220707145248.458771-1-apatel@ventanamicro.com>
 <20220707145248.458771-2-apatel@ventanamicro.com> <CAOnJCUKNaNz0iF5dfS9quRyDS_ZD1adWWAFjOnBPwqKEefpS8Q@mail.gmail.com>
In-Reply-To: <CAOnJCUKNaNz0iF5dfS9quRyDS_ZD1adWWAFjOnBPwqKEefpS8Q@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 Jul 2022 09:34:15 +0530
Message-ID: <CAAhSdy2rN4rrKep=P4W_hen_OsHR8USQ7xGH5=fKd-5_t8NTew@mail.gmail.com>
Subject: Re: [PATCH 1/5] KVM: Add gfp_custom flag in struct kvm_mmu_memory_cache
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_210438_650302_FA9C3677 
X-CRM114-Status: GOOD (  20.95  )
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

Hi Paolo,

On Wed, Jul 13, 2022 at 6:57 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Thu, Jul 7, 2022 at 7:53 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > The kvm_mmu_topup_memory_cache() always uses GFP_KERNEL_ACCOUNT for
> > memory allocation which prevents it's use in atomic context. To address
> > this limitation of kvm_mmu_topup_memory_cache(), we add gfp_custom flag
> > in struct kvm_mmu_memory_cache. When the gfp_custom flag is set to some
> > GFP_xyz flags, the kvm_mmu_topup_memory_cache() will use that instead of
> > GFP_KERNEL_ACCOUNT.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  include/linux/kvm_types.h | 1 +
> >  virt/kvm/kvm_main.c       | 4 +++-
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
> > index ac1ebb37a0ff..1dcfba68076a 100644
> > --- a/include/linux/kvm_types.h
> > +++ b/include/linux/kvm_types.h
> > @@ -87,6 +87,7 @@ struct gfn_to_pfn_cache {
> >  struct kvm_mmu_memory_cache {
> >         int nobjs;
> >         gfp_t gfp_zero;
> > +       gfp_t gfp_custom;
> >         struct kmem_cache *kmem_cache;
> >         void *objects[KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE];
> >  };
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index a49df8988cd6..e3a6f7647474 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -386,7 +386,9 @@ int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
> >         if (mc->nobjs >= min)
> >                 return 0;
> >         while (mc->nobjs < ARRAY_SIZE(mc->objects)) {
> > -               obj = mmu_memory_cache_alloc_obj(mc, GFP_KERNEL_ACCOUNT);
> > +               obj = mmu_memory_cache_alloc_obj(mc, (mc->gfp_custom) ?
> > +                                                mc->gfp_custom :
> > +                                                GFP_KERNEL_ACCOUNT);
> >                 if (!obj)
> >                         return mc->nobjs >= min ? 0 : -ENOMEM;
> >                 mc->objects[mc->nobjs++] = obj;
> > --
> > 2.34.1
> >
>
> Acked-by: Atish Patra <atishp@rivosinc.com>

I have queued this patch for 5.20.

Please let me know if you are not okay or need changes in this patch.

Thanks,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
