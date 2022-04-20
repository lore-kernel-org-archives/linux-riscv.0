Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E87C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 08:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkhI/fJXgjORojS8/emrLst9IqOoxXFwbe1FMFpY7G8=; b=22Gw2vgvIVC3RP
	Os9CTgpEXz7l/bLdYd7iOBHfEk3hhIwF9IGmPZRVv75uQkr/SzkA7vP8qNeJXSatAlcKLkZInHA9J
	GRmu9WM2FChNmEIcXmerzwVn3Kf/D2hfOVRE6NVeZ1E5kU7WcKYm2NuyMconYv3C+R/FqbtH1XPAS
	EFS+WdU3WmON0ywfq/MSRehZ/8uSJ9M0q/pZkh2o2ojC8gVxYtbsTMM5GC2YJPnR8ONfMz6NMctjh
	Fa19eZUGG/tv+so9TruIdTwr3RHQbTxejcR3sWcNFO9J2CAts5/z8U0uhRBZjhRXXabgic2ur4QWR
	aJ+meF7eaK6HOtj0mQjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh5zl-00899q-Ra; Wed, 20 Apr 2022 08:47:29 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh5zi-00898E-OZ
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 08:47:28 +0000
Received: by mail-lj1-x231.google.com with SMTP id q22so1088036ljh.10
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 01:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tAe7ocOZ0bBrreHF0RxD9R0oEMScj7O80nn6Z0+6mKk=;
 b=l7aPeWemyn/R90hcDdIeAm1ynIy9VHgrdD+aB5XMWSttSYjB3m3nf82oOQL5BO70pf
 yKt3cTG/Y5uxBT8/EdawX4RKgVRideaRv/5Y7f97MbkHjGBbHi0TTrcVApE+ETXXOupq
 dx7KHF8KZaGgXBfzM/A9wSl1a3draGgOOuk7qRps+NYoWW+Mr801M1qRdrSpZXYnojrq
 l+bZqHL70oDSYG7GZTP9rmWgoRJZLsZtCTHdM9k57/gikiSWCDq85aPUMQdI7hCkl3mi
 0k26ZysqwMsgqb8+2Xw+u3S7eUxUwzzJO5pz7PPrlzgKaqvBLXtAs0iQpZ+ktMuhrq00
 cczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tAe7ocOZ0bBrreHF0RxD9R0oEMScj7O80nn6Z0+6mKk=;
 b=g4iriPLR38v1oxv7ky/w9npwiZ+bSFzldbNwK/e0uHNZll/KAq/PJ/+3SS3/S+Wyzv
 04LoAkvS6qgH7uG6zHalkMhLnmY8WirqXuu0c+W3Pi7a1mNDymrlioZD+/m4g4LMCHpC
 +j+hjxsWyKh8TXp7qpVqLW+xfJjHn4JYGoKys8CDNk8q3dWX32ZPnc4ZF+HqE3DX9pPF
 IkChXHq6A3xXYLZFckHRHbzpwTBGX5eX8PvM0Mp0ptGJ8KZ7OGMO2cuIOTMv4tuTnq5g
 qGEPsVXKBpJfptOqMbSH+U3y1aHfzIvI6eg4Q4Wf5dlPF/Muk+EmEOSJxjfOF2PiwiCD
 E+/g==
X-Gm-Message-State: AOAM533AcG20PQVvs7tHziQnRP+lL+tlmGQFEzr6Xk2Rj3zsKjm1z94e
 f/2j4759fQgcLI5hZkPkCVcmg+hOUKp2qzeB2albAIWtXVs=
X-Google-Smtp-Source: ABdhPJzPP6FZmr+6nZr+hzEU+yTnYEzGCQtdmZue5NJ/rrH+3+6fdShgY4mEO9KwAJzNgJeNkdQEkxHQJNmJ6W9b15c=
X-Received: by 2002:a2e:6a08:0:b0:24d:14af:4be4 with SMTP id
 f8-20020a2e6a08000000b0024d14af4be4mr12846312ljc.24.1650444442933; Wed, 20
 Apr 2022 01:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220420013258.3639264-1-atishp@rivosinc.com>
 <20220420013258.3639264-3-atishp@rivosinc.com>
 <CAOnJCU+EPHxD7MqbswKMy=gZhmyyXMiezqaw1+D1h+O+pbYR2w@mail.gmail.com>
In-Reply-To: <CAOnJCU+EPHxD7MqbswKMy=gZhmyyXMiezqaw1+D1h+O+pbYR2w@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 20 Apr 2022 14:17:10 +0530
Message-ID: <CAK9=C2U4s5hC9G0w8ELmZn=YgCJ2hTAU-EfGZsSh=HZy4gQaiw@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: KVM: Restrict the extensions that can be
 disabled
To: Atish Patra <atishp@atishpatra.org>
Cc: Atish Patra <atishp@rivosinc.com>, KVM General <kvm@vger.kernel.org>, 
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 devicetree <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_014726_826442_7D554E57 
X-CRM114-Status: GOOD (  23.05  )
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

On Wed, Apr 20, 2022 at 1:13 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Tue, Apr 19, 2022 at 6:33 PM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > Currently, the config reg register allows to disable all allowed
> > single letter ISA extensions. It shouldn't be the case as vmm
> > shouldn't be able disable base extensions (imac).
>
> /s/able/able to/
>
> > These extensions should always be enabled as long as they are enabled
> > in the host ISA.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/kvm/vcpu.c | 21 +++++++++++++--------
> >  1 file changed, 13 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index 2e25a7b83a1b..14dd801651e5 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -38,12 +38,16 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
> >                        sizeof(kvm_vcpu_stats_desc),
> >  };
> >
> > -#define KVM_RISCV_ISA_ALLOWED  (riscv_isa_extension_mask(a) | \
> > -                                riscv_isa_extension_mask(c) | \
> > -                                riscv_isa_extension_mask(d) | \
> > -                                riscv_isa_extension_mask(f) | \
> > -                                riscv_isa_extension_mask(i) | \
> > -                                riscv_isa_extension_mask(m))
> > +#define KVM_RISCV_ISA_DISABLE_ALLOWED  (riscv_isa_extension_mask(d) | \
> > +                                       riscv_isa_extension_mask(f))
> > +
> > +#define KVM_RISCV_ISA_DISABLE_NOT_ALLOWED      (riscv_isa_extension_mask(a) | \
> > +                                               riscv_isa_extension_mask(c) | \
> > +                                               riscv_isa_extension_mask(i) | \
> > +                                               riscv_isa_extension_mask(m))
> > +
> > +#define KVM_RISCV_ISA_ALLOWED (KVM_RISCV_ISA_DISABLE_ALLOWED | \
> > +                              KVM_RISCV_ISA_DISABLE_NOT_ALLOWED)
> >
> >  static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
> >  {
> > @@ -217,9 +221,10 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
> >         switch (reg_num) {
> >         case KVM_REG_RISCV_CONFIG_REG(isa):
> >                 if (!vcpu->arch.ran_atleast_once) {
> > -                       vcpu->arch.isa = reg_val;
> > +                       /* Ignore the disable request for these extensions */
> > +                       vcpu->arch.isa = reg_val | KVM_RISCV_ISA_DISABLE_NOT_ALLOWED;
> >                         vcpu->arch.isa &= riscv_isa_extension_base(NULL);
> > -                       vcpu->arch.isa &= KVM_RISCV_ISA_ALLOWED;
> > +                       vcpu->arch.isa &= KVM_RISCV_ISA_DISABLE_ALLOWED;
> >                         kvm_riscv_vcpu_fp_reset(vcpu);
> >                 } else {
> >                         return -EOPNOTSUPP;
> > --
> > 2.25.1
> >
>
> Sorry. I forgot to add the fixes tag.
>
> Fixes: 92ad82002c39 (RISC-V: KVM: Implement
> KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctls)

I have queued this for fixes.

Thanks,
Anup

>
> --
> Regards,
> Atish
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
