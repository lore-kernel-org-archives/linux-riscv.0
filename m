Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82C8ECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Sep 2022 06:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Brg2B7utbQ1ftlvWqvbEeYYMJcSDS4KdiUz7eEJ6d8E=; b=i16aCajUi+oeqU
	V4+9nUWHh1T5xgFpPe194prtp6v00thRbgg0Wh1c34mjSCskgdhejK1DGqYqa2Ruwi9MNafkyW/m6
	69NfX7G3irseCRjZDMzRMUZYkHa6cqAZa6ZNMi2d4+M5JKqyZSjjvfDHJg+rTiNEz08imsN6tACMJ
	IKp2M6lpbMF77CW0Xb85FllPw5zMwUu1iaAwC0YNOv7kuJQoMm7niizBkxsFUdNRP979gbrE+yRxf
	jjZazKTxc6+l5UAUkXHIK5RcEH48R9LZ9kyKwBjuYoC8hyaTI2wQoCtswWF58WL0uS2HqI8icv4Ii
	ijK1QFxLO9pj6MO9RvAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXd55-007Gmv-QB; Mon, 12 Sep 2022 06:38:07 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXd53-007GlY-0O
	for linux-riscv@lists.infradead.org; Mon, 12 Sep 2022 06:38:06 +0000
Received: by mail-lf1-x130.google.com with SMTP id q21so13298552lfo.0
        for <linux-riscv@lists.infradead.org>; Sun, 11 Sep 2022 23:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=6MMFOsdik3pOVxza5iFw67+zQvf/yIVZHtdOoLDh9XA=;
        b=WBHyt8tStNEomzn+/msR7XqF/ADGnzCqlpOgYyuTl9iS4felZamXZBRCDP0wkg8l4R
         fV0ajIesocWpV+qkZk7ucUVPVljcFmi1gppGcQ39zw/MdY3OaKKpXa2+KAEzcCDsWJCb
         YBFw+HGsnM+pYVt73fG5IHj4mit/jgCc+fc82ai5AYNJ6x38I5qethpk/vJg07qVRFs8
         HZC1Ev/RjvySyWmKUC46gT5n+2+94pblkCEqx98gZ6P4t1Cvz3eLBfjp37QJqhEkr4Zx
         +YlPi400FroQQTn0yRA7lE9kfYLTg7gd4xDoXrAn56m7jJac34t5p/lCI9l10F4KwMHz
         z4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6MMFOsdik3pOVxza5iFw67+zQvf/yIVZHtdOoLDh9XA=;
        b=REVq4LDGXFmsAU5+N3iORYBPg+QGiTzQrKndu2dFIqy3rYbiL5L04DRn1HKk3FiFnC
         Jkfc5qLIFRh9xeoXfCP1BG7bpGBXCfbpFRXOsepEKu78qduMkkbtjyhFobIrDYFTyhpP
         U+umk+CBtVxwmTRCfwHWBSc8uZjuJMsoEr2rS9vavYMff5wrDWYwHXIgRX0wkoZHkh6H
         5C1UnDLvizGs1XnfUCfLDB82wsuVuQ17/LUfV2ZUdIyrbJEhxhGnu/CHvl3S05bHvmSc
         acR+nK9GzstE9EAWg7ROK6lQyPtQYEJQ54ybVR5oDETQuvXHkHjiklCc/2m/vGHvvTdW
         FMZA==
X-Gm-Message-State: ACgBeo2W+Z+3pRzjW7JpMBS3iiS5pL7jOzEYRRDcUy/z1U82eeEVCS+A
	JplLIVWVPYRhCx3fLajq7ByA2/drehj1Ydhm0zvFizp/X+0=
X-Google-Smtp-Source: AA6agR4TNG/RUu6QvTb9n6GXwBlk0k8cBa5EHKOtjXVmvbElP2VBINK++CQPC2Fa7/4D5YPELdVxUs9VgUcSmTm1/68=
X-Received: by 2002:ac2:5681:0:b0:498:f58f:c006 with SMTP id
 1-20020ac25681000000b00498f58fc006mr5016032lfr.428.1662964679707; Sun, 11 Sep
 2022 23:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220908144424.4232-1-zong.li@sifive.com> <20220908144424.4232-4-zong.li@sifive.com>
 <632b2853-1543-e3ba-b34f-39f3f4fdaddc@microchip.com>
In-Reply-To: <632b2853-1543-e3ba-b34f-39f3f4fdaddc@microchip.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 12 Sep 2022 14:37:48 +0800
Message-ID: <CANXhq0rUzyFOF_pShoPf18VrN2YH8AfgKRg438ak_3iMcRfSGA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] soc: sifive: ccache: determine the cache level
 from dts
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Greentime Hu <greentime.hu@sifive.com>, 
	Ben Dooks <ben.dooks@sifive.com>, bp@alien8.de, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-edac@vger.kernel.org, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_233805_129262_33F07591 
X-CRM114-Status: GOOD (  22.33  )
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

On Fri, Sep 9, 2022 at 2:28 AM <Conor.Dooley@microchip.com> wrote:
>
> On 08/09/2022 15:44, Zong Li wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Composable cache could be L2 or L3 cache, use 'cache-level' property of
> > device node to determine the level.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > ---
> >  drivers/soc/sifive/sifive_ccache.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
> > index 949b824e89ad..690c19489317 100644
> > --- a/drivers/soc/sifive/sifive_ccache.c
> > +++ b/drivers/soc/sifive/sifive_ccache.c
> > @@ -38,6 +38,7 @@
> >  static void __iomem *ccache_base;
> >  static int g_irq[SIFIVE_CCACHE_MAX_ECCINTR];
> >  static struct riscv_cacheinfo_ops ccache_cache_ops;
> > +static int level;
> >
> >  enum {
> >         DIR_CORR = 0,
> > @@ -144,7 +145,7 @@ static const struct attribute_group *ccache_get_priv_group(struct cacheinfo
> >                                                            *this_leaf)
> >  {
> >         /* We want to use private group for composable cache only */
> > -       if (this_leaf->level == 2)
> > +       if (this_leaf->level == level)
> >                 return &priv_attr_group;
> >         else
> >                 return NULL;
> > @@ -215,6 +216,9 @@ static int __init sifive_ccache_init(void)
> >         if (!ccache_base)
> >                 return -ENOMEM;
> >
> > +       if (of_property_read_u32(np, "cache-level", &level))
> > +               return -ENODEV;
>
> I think ENOENT or EINVAL are more comment patterns here?
>
> Either way,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>

I will fix it in V4 patch. Thanks

> > +
> >         intr_num = of_property_count_u32_elems(np, "interrupts");
> >         if (!intr_num) {
> >                 pr_err("CCACHE: no interrupts property\n");
> > --
> > 2.17.1
> >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
