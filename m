Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C07C77B6E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Apr 2023 18:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d26TVdWoCTiaK25CnGyfl8HgK2qct4j0W5Ce2YH19L4=; b=qn0jds/S14TeaQ
	yjl1shFGp7XyF79HEVrM6/0Hc6dnUvXuBufGOvpznlebEuH7BuPRLS9o6xzaIJMppQzwOBDBGmkl0
	LXhgFMIVIZ53uNata75oa6PCyANMwyax2RiByP7tmIqkR9M9JN0oZiYx6mK8P8AM361TGkGzrSnw7
	O6NxacDy6CAO9oxQGlTlxAple0xk0j2/8FRwmI9WlHKG6bMRJYNSOCYFf1nwN/Lg8qZBrI4wECmv2
	UYJkqT8hGQcv1CC4Pi4s6hN0/AOPl4gn2nTxLQv5gWgWutyuEAZmDm4RU57UrQGM5dEMFR+v4Zoz6
	ua5vSbpcuYlhetWme8fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn1qP-006vK9-2I;
	Thu, 13 Apr 2023 18:38:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pn1qM-006vJZ-2H
	for linux-riscv@lists.infradead.org;
	Thu, 13 Apr 2023 18:38:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4FB92640D1;
	Thu, 13 Apr 2023 18:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BBE7C433EF;
	Thu, 13 Apr 2023 18:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681411128;
	bh=dzjuCgvj32gFNE1zyb8VjhG7HjDoQx2QthY/c2I2Lpg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iwJvM8gYpu2NK3VPMKGHwKdDmGZiFn5eJ3XrHZUH00mPtJ5Cum9Rb/YsWI2GCjjxh
	 +037VF3OBpkjeEqhoutZ7cvsZSPH1tAVQsOwLf2FkUcI/MoD2BU/BJMdrnn1Egx245
	 aWZ1RLbknn9BvgxDVUI5cC7yn+oz8f59i6+/9588tFGnaZpiD7lg8o+KDhPmZs4cB2
	 uNj/Mww9nsbepDK6X1rV81xlz+yiBTr4Uso9tGeaAxNTbypavIAArg5Z4VpQqeEUj6
	 td2BEgRsAuRxsqzGoNJY9gBCntBELonP42VwdDhR0gVC5wOxkPRwreWM/gkpU/IP24
	 tw52FMK+b25Mw==
Message-ID: <d70886f6ee13e70845a72354fe9a2b7d.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <4ed4d0e6-8da5-7eef-8713-44854b8d4a9b@starfivetech.com>
References: <20230411135558.44282-1-xingyu.wu@starfivetech.com> <20230411135558.44282-8-xingyu.wu@starfivetech.com> <683cbe934d1df9436e003466d2a419ef.sboyd@kernel.org> <463ee23c-f617-bed0-27a8-56c6fb40d092@starfivetech.com> <cd4a11ae65e186799145410969d40421.sboyd@kernel.org> <4ed4d0e6-8da5-7eef-8713-44854b8d4a9b@starfivetech.com>
Subject: Re: [PATCH v4 07/10] clk: starfive: Add StarFive JH7110 Video-Output clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu <xingyu.wu@starfivetech.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Thu, 13 Apr 2023 11:38:45 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_113850_841418_C27DFF38 
X-CRM114-Status: GOOD (  16.98  )
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

Quoting Xingyu Wu (2023-04-13 06:31:12)
> On 2023/4/13 12:04, Stephen Boyd wrote:
> > diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> > index 5ec210644e1d..851b93d0f371 100644
> > --- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> > +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> > @@ -11,6 +11,9 @@
> >  #include <linux/init.h>
> >  #include <linux/io.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +
> > +#include <soc/starfive/reset-starfive-jh71x0.h>
> >  
> >  #include <dt-bindings/clock/starfive,jh7110-crg.h>
> >  
> > @@ -335,26 +338,32 @@ static void jh7110_reset_unregister_adev(void *_adev)
> >       struct auxiliary_device *adev = _adev;
> >  
> >       auxiliary_device_delete(adev);
> > +     auxiliary_device_uninit(adev);
> >  }
> >  
> >  static void jh7110_reset_adev_release(struct device *dev)
> >  {
> >       struct auxiliary_device *adev = to_auxiliary_dev(dev);
> > +     struct jh71x0_reset_adev *rdev = to_jh71x0_reset_adev(adev);
> >  
> > -     auxiliary_device_uninit(adev);
> > +     kfree(rdev);
> >  }
> >  
> >  int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
> >                                    const char *adev_name,
> >                                    u32 adev_id)
> >  {
> > +     struct jh71x0_reset_adev *rdev;
> >       struct auxiliary_device *adev;
> >       int ret;
> >  
> > -     adev = devm_kzalloc(priv->dev, sizeof(*adev), GFP_KERNEL);
> > -     if (!adev)
> > +     rdev = kzalloc(sizeof(*rdev), GFP_KERNEL);
> 
> Can there use 'devm_kzalloc'? Are you not using this because the struct is public and clock driver
> and reset driver both use it. But I think the both clock driver and reset driver are the same
> device and can use 'devm_kzalloc'.

No. The release function for the auxiliary_device is supposed to free
the memory. It shouldn't be tied to the lifetime of anything like the
lifetime of the clk driver being bound.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
