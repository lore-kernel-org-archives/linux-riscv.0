Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EE3C07E9D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Sep 2022 10:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Efqi0YigKZluWL4/Sy3xJ+GtGROwhqTqdKm8AwHca48=; b=leq1BIl/hmesKi
	r1YTgMMlPQeYNFxVreGLTiWgQxOITUHV5KFGBV5ii7HDKxdGATo8NuBy78xDY0ZT+mU/XMqUKuns+
	DQc0+7kiJs5RV41/BSf5dKAtkzjE22Ik1I8y1IumU/7ly51K4F/nyq7EYBVzxETN7Xlh9jG/5z8Nn
	BSZLV2RD1qgft8ZTh/eZgGQjnaSVAGZ/5IjhVgi+UNyhBJpEJEqKWnpXbkHcMawCc5gGNTPzXx/Pd
	hkfnGIln/DXBTJdA0DiK/5nxclWiHYKy+5a5TLIKii19WDR7aUkSsFaigj37K/JQoN8kO0S1DDm/w
	+lve721zjXc/JVR9iSuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocl01-003w50-V6; Mon, 26 Sep 2022 10:06:06 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ockzY-003vps-9x
	for linux-riscv@lists.infradead.org; Mon, 26 Sep 2022 10:05:37 +0000
Received: by mail-ej1-x632.google.com with SMTP id lh5so12895948ejb.10
        for <linux-riscv@lists.infradead.org>; Mon, 26 Sep 2022 03:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=LQyNgcP7hvaQh44MxsK++cT2+NdoJVVgZBVizkcng4M=;
        b=Nybr3LwWVYyqUFkJ05/qC+TzFYBCutz/9YWc/CgJH4YbXUqpySLCLM7tKVy9WR594C
         zNm/0uUFmaXUMxaqJKtql82f/wsxWjMo8QBJdojAAjWsMkleQEFW+3LKRcFQ1+Rkd2I+
         VPU+/pY5ni/KyVLQGWgOaaC+GjM5L7SDVyd6I706wKRAJYFhHmUbII7xk4J55h5hM93X
         CyynZXnPduG0nyYpeEEBdMzS7Rtzl2lDg6aehwVl5sPAxLESZGbzMzCzjMQ8anV5lvBx
         b7fF8lMYwNLjfnqIC2SypKK7wfqgRFQ07SdSJesRaiy/pOYXG75TbLux5ZagT1aCVGGD
         b7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=LQyNgcP7hvaQh44MxsK++cT2+NdoJVVgZBVizkcng4M=;
        b=eWy1LbaOaVnENh13JXx3i7H/xoNj7kszO8ZjkU6VcSqcKsiQMoVmSN//+pneRYsfrb
         8bKshUO8UhJWc2j8RYz5saN+u6zdWhu46hNhGn9YjavnqemQNMTcfkX5nEVcsT6yYa8a
         i1kUvHM3MMTTJO7OPIPWHIXlqXlgmHFFMTlUYQLCTOglEdAERZnfLnWYLD/3v2T3CIs4
         bPW8T+akNhlUYhChZd481rxcsRN/TtQizFgujmYM4X0e7Ef51tg8FYRdZo6Qj5aFS0Fv
         NQ67oe7SWhw47IaXomrWXThCt/gBU+4SgwiJSTOIqd3Xu/uNg4hZixSKJAmz8IykGSUs
         /xjg==
X-Gm-Message-State: ACrzQf1Yz/b6DAFZVW76XI0i4O4ji8BtkeZcnV4uszNqj8c5yajq4BkE
	CCBRyU825nZbpYVJFXuWjhLFhNxNJ0fX3Iz8cKOung==
X-Google-Smtp-Source: AMsMyM5TqbZOSnNZYCLf0S2aGKv8/tKNNFaD2bj5VwajZ6h0h7xQoGX+oeh0/iI8zKk131/y8tAn+H5LrF+7kRvW2oY=
X-Received: by 2002:a17:906:eec7:b0:733:189f:b07a with SMTP id
 wu7-20020a170906eec700b00733189fb07amr18211913ejb.230.1664186732477; Mon, 26
 Sep 2022 03:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220909144400.1114485-1-ajones@ventanamicro.com>
 <20220909144400.1114485-3-ajones@ventanamicro.com> <CAOnJCU+meVE_A=ki1bTMNCf-CHMwCQvTn-0aaHydREAH=OdcFw@mail.gmail.com>
In-Reply-To: <CAOnJCU+meVE_A=ki1bTMNCf-CHMwCQvTn-0aaHydREAH=OdcFw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Sep 2022 15:35:18 +0530
Message-ID: <CAAhSdy2PajD_dLFBgrVkqVbk5oqrExLndzhRgnZLXvC4z589ew@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] RISC-V: KVM: Expose Zicbom to the guest
To: Atish Patra <atishp@atishpatra.org>
Cc: Andrew Jones <ajones@ventanamicro.com>, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_030536_367189_18322597 
X-CRM114-Status: GOOD (  22.38  )
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

On Sat, Sep 10, 2022 at 12:07 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Fri, Sep 9, 2022 at 7:44 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > Guests may use the cbo.inval,clean,flush instructions when the
> > CPU has the Zicbom extension and the hypervisor sets henvcfg.CBIE
> > (for cbo.inval) and henvcfg.CBCFE (for cbo.clean,flush).
> >
> > Add Zicbom support for KVM guests which may be enabled and
> > disabled from KVM userspace using the ISA extension ONE_REG API.
> >
> > Also opportunistically switch the other isa extension checks in
> > kvm_riscv_vcpu_update_config() to riscv_isa_extension_available().
> >
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/uapi/asm/kvm.h | 1 +
> >  arch/riscv/kvm/vcpu.c             | 9 +++++++--
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> > index b9a4cf36be4b..ed37a4a6e5cf 100644
> > --- a/arch/riscv/include/uapi/asm/kvm.h
> > +++ b/arch/riscv/include/uapi/asm/kvm.h
> > @@ -99,6 +99,7 @@ enum KVM_RISCV_ISA_EXT_ID {
> >         KVM_RISCV_ISA_EXT_M,
> >         KVM_RISCV_ISA_EXT_SVPBMT,
> >         KVM_RISCV_ISA_EXT_SSTC,
> > +       KVM_RISCV_ISA_EXT_ZICBOM,
> >         KVM_RISCV_ISA_EXT_MAX,
> >  };
> >
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index 2ef33d5d94d1..74d1532b26c0 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -54,6 +54,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
> >         RISCV_ISA_EXT_m,
> >         RISCV_ISA_EXT_SVPBMT,
> >         RISCV_ISA_EXT_SSTC,
> > +       RISCV_ISA_EXT_ZICBOM,
> >  };
> >
> >  static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
> > @@ -792,11 +793,15 @@ static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
> >  {
> >         u64 henvcfg = 0;
> >
> > -       if (__riscv_isa_extension_available(isa, RISCV_ISA_EXT_SVPBMT))
> > +       if (riscv_isa_extension_available(isa, SVPBMT))
> >                 henvcfg |= ENVCFG_PBMTE;
> >
> > -       if (__riscv_isa_extension_available(isa, RISCV_ISA_EXT_SSTC))
> > +       if (riscv_isa_extension_available(isa, SSTC))
> >                 henvcfg |= ENVCFG_STCE;
> > +
>
> Ideally, these should be in a separate patch.
>
> > +       if (riscv_isa_extension_available(isa, ZICBOM))
> > +               henvcfg |= (ENVCFG_CBIE | ENVCFG_CBCFE);
> > +
> >         csr_write(CSR_HENVCFG, henvcfg);
> >  #ifdef CONFIG_32BIT
> >         csr_write(CSR_HENVCFGH, henvcfg >> 32);
> > --
> > 2.37.2
> >
>
> Otherwise, LGTM.
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

I agree with Atish's comment but this being a very simple change, I
have queued it as-is for Linux-6.1

Thanks,
Anup

> --
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
