Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5793C4332F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 12:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuyXO+4XEuz4pFE+nV7FufKgvQlOBOHecjZuOATQSxQ=; b=elFRCWdDcuiIXH
	zI0zT7TghKZKb2Fp4EsZTJRJV0MYggE0V5t0RRvwjeEsq/NelFkBRSdf2apC8EMU3Z2LQhQnWkog/
	D8OSDupQe+oDrC2mHxO1433v26o3hq+c1JlMcwXkIM+a+6KDxiyR0pkkJpjOYQQs4RB+8AidFoG45
	6mJmc6od6ZuOaxOnfOBrf8dFqkqrLBr5j7iYj45zpcTkCsnwwU25xWQjPB63vWsWBW6dyicYCmWTj
	vJi2PvaENhX+dJ4lRanrLeyVKxltBsyYvMYx+ET0IaEI2M86i9Bt6i5tN+V7lzlTR3EfJo7QqaQJG
	ToMrrZKcKFVmpwJztFkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1RU8-003RHM-Qf; Sat, 03 Dec 2022 12:19:12 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1RU6-003REG-Fm
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 12:19:12 +0000
Received: by mail-ej1-x631.google.com with SMTP id n20so17398524ejh.0
        for <linux-riscv@lists.infradead.org>; Sat, 03 Dec 2022 04:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VJ2kBMQnTepOO13Yg4zjy23GC+GH4PK0ByMWiXCv1l0=;
        b=EelzAQi3ycgYepqgRvsBBEs+oyuo1oGZME9colgRqhzm23WFvFS9xLfmZ8oRofI4T9
         tG76KxqFYz67nxCILvi6RtIGKP9Y1mAooEB8cQcY9PAYt0IVg6NcyQ0qYKS7WgEgRsQe
         jLW7ZzdtpjL7iwQeN8jZOZ6MGHWYfCVTz+1Jr5CL4xp9LHnkh1Sx6e356qHRyRQ9QMjw
         j2GjAK844p3DdwnenZfa/u90h73CeajspKfPG88u4eOK4ePvYcAvA8h1ra1qe12w2EAA
         /iB35lWi++12T+9Y2PnnsmQVXr8D5ARFQNAXIWK/hCMYNOOfaQ8i3sU9tz4r+zZHqIgZ
         w2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJ2kBMQnTepOO13Yg4zjy23GC+GH4PK0ByMWiXCv1l0=;
        b=d8HBMuZ/Yn7GaSI9nJ0vev8oguEBUnkQqNEZ7oUSNj5YBHwVQHisDGfbz7r8w5f7fE
         go2DdlPDdj1IvlPRaUdS0M18eV9C8tYyaMJujQy+gZxVjKCDh4MvXOjPE3rA+P9Z+DR+
         Ea2FWO3+lSU/eusI8AD1HsoNtrkUSzj15ijAOEJlaAY7AxcbtA27F+Sn3Rq/mauLVyMH
         iGeKU0K9V55xeNY4hn4cx2URG55LbZ4lH1VCsCw0xZ63s+9CUI9UhzZ/MLYug6xcBe2a
         Z8moT2UvAryY9VeCHV3/pnx9ML8xRyxkLZEGLIODALY/s76oyM0aAwt+k3E//v40BaYm
         vr5g==
X-Gm-Message-State: ANoB5plCe+H/jg1d6FGjqEhCZ5f9qxdANpG0C82n5KnRoOjb/jAli34n
	fITb5Iq9yu1UV1peH1lyshr63+abryEhtJpwzuVivQ==
X-Google-Smtp-Source: AA0mqf42U73DS4TfDbhqtcz7mgFaF9usPI8rxDs5j07XpjMEhRSkYS6lYQXtiByWoSeu+cChyKsuwtNQAO6afy9uE+o=
X-Received: by 2002:a17:906:6dd5:b0:78d:a633:b55 with SMTP id
 j21-20020a1709066dd500b0078da6330b55mr66234095ejt.106.1670069947041; Sat, 03
 Dec 2022 04:19:07 -0800 (PST)
MIME-Version: 1.0
References: <20221128161424.608889-1-apatel@ventanamicro.com>
 <20221128161424.608889-9-apatel@ventanamicro.com> <20221129054616.4zju5z7ipg6wki7l@kamzik>
In-Reply-To: <20221129054616.4zju5z7ipg6wki7l@kamzik>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 3 Dec 2022 17:48:54 +0530
Message-ID: <CAAhSdy3CnkK7=zombN4zH=g8+buz_rEhgXCzOE-WdSTYtcfdMA@mail.gmail.com>
Subject: Re: [PATCH 8/9] RISC-V: KVM: Add ONE_REG interface for mvendorid,
 marchid, and mimpid
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_041910_776614_DB619D07 
X-CRM114-Status: GOOD (  24.53  )
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

On Tue, Nov 29, 2022 at 11:16 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Nov 28, 2022 at 09:44:23PM +0530, Anup Patel wrote:
> > We add ONE_REG interface for VCPU mvendorid, marchid, and mimpid
> > so that KVM user-space can change this details to support migration
> > across heterogeneous hosts.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/uapi/asm/kvm.h |  3 +++
> >  arch/riscv/kvm/vcpu.c             | 27 +++++++++++++++++++++++++++
> >  2 files changed, 30 insertions(+)
> >
> > diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> > index 8985ff234c01..92af6f3f057c 100644
> > --- a/arch/riscv/include/uapi/asm/kvm.h
> > +++ b/arch/riscv/include/uapi/asm/kvm.h
> > @@ -49,6 +49,9 @@ struct kvm_sregs {
> >  struct kvm_riscv_config {
> >       unsigned long isa;
> >       unsigned long zicbom_block_size;
> > +     unsigned long mvendorid;
> > +     unsigned long marchid;
> > +     unsigned long mimpid;
> >  };
> >
> >  /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index 312a8a926867..7c08567097f0 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -276,6 +276,15 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
> >                       return -EINVAL;
> >               reg_val = riscv_cbom_block_size;
> >               break;
> > +     case KVM_REG_RISCV_CONFIG_REG(mvendorid):
> > +             reg_val = vcpu->arch.mvendorid;
> > +             break;
> > +     case KVM_REG_RISCV_CONFIG_REG(marchid):
> > +             reg_val = vcpu->arch.marchid;
> > +             break;
> > +     case KVM_REG_RISCV_CONFIG_REG(mimpid):
> > +             reg_val = vcpu->arch.mimpid;
> > +             break;
> >       default:
> >               return -EINVAL;
> >       }
> > @@ -338,6 +347,24 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
> >               break;
> >       case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
> >               return -EOPNOTSUPP;
> > +     case KVM_REG_RISCV_CONFIG_REG(mvendorid):
> > +             if (!vcpu->arch.ran_atleast_once)
> > +                     vcpu->arch.mvendorid = reg_val;
> > +             else
> > +                     return -EBUSY;
> > +             break;
> > +     case KVM_REG_RISCV_CONFIG_REG(marchid):
> > +             if (!vcpu->arch.ran_atleast_once)
> > +                     vcpu->arch.marchid = reg_val;
> > +             else
> > +                     return -EBUSY;
> > +             break;
> > +     case KVM_REG_RISCV_CONFIG_REG(mimpid):
> > +             if (!vcpu->arch.ran_atleast_once)
> > +                     vcpu->arch.mimpid = reg_val;
> > +             else
> > +                     return -EBUSY;
> > +             break;
> >       default:
> >               return -EINVAL;
> >       }
> > --
> > 2.34.1
> >
>
> At some point we should patch Documentation/virt/kvm/api.rst to describe
> the possible errors we have. It's missing EOPNOTSUPP and EBUSY.
>
> Also, I see a couple places were we use EOPNOTSUPP that would be better
> as EBUSY. And finally I wonder if we shouldn't use ENOENT when the reg_num
> is wrong/unknown, which would allow us to differentiate between bad
> reg_num and bad reg_val in set-one ioctls.
>
> I can send an RFC series to better describe these thoughts.

Sure, go ahead.

>
> And for this patch,
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>
> Thanks,
> drew

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
