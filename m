Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17D4C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 10:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ioWjFGXNhqD45s1vOkAPq0by62FQaR2gWm/5sH8go0=; b=M2ic33TbgNixwn
	f2cJgSdEee5LqRAIcIAMIh+OYuAUHfwZabPWtUll3JiA0mJqs2pcjZHYs26+oYMlP1yUqOdmDfBJw
	LhntZU5pG+FmRznxW1RSJA5evIkhwvfNvh/bdt+Zll3u3U01TBcEKm8rvW8l33L7bNE/lhamlrmhm
	00ETzvMiGVEPWp7xmjK4gcmC925Flh8GQ6Gn/X30AcBfkmXtWN1/wApJsfhhOt0fAlfdbw32tbMm8
	0miylwTdY3E8WbNO88KwtytTwhFZFR3BsuruDfQp9k8FZa9M9myjmydoWerSCADu2LjGb2xV7leIE
	zPOntBaLJegnJ+otDFLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osicx-00Cmm8-Ak; Wed, 09 Nov 2022 10:48:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osicu-00Cmha-FX
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 10:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667990892; x=1699526892;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OpLpfKgFncaOypu/Y4C5vCxOS6jzJd+feOYi1RLb4lY=;
  b=bmW37CwRgXFuxz8bxaLmgBj/SCeOUjNPfNyd+2sud9Ks4RxhtYxBm1pn
   MRGA3GdbesqPW8e+SmU/eVnvq7miiSmjLj4Ff4bhEcIqkA3lw7KoxVkje
   lUg/MutdUCT8tAscCQhUpn3n8DwPkyOM+dhVHUqdcm6zJ/calOvKf5g3E
   IsbV/3gIZi24YfeOAqTttkBHeeswQ3ex6a8a7POpzgT1bsN9azIVB4QFe
   m55DrvAWygwFIbsvDB41zK3S0mgI1SKTGf3azdvg51FDPvKhOXOOXOam7
   Ma7TQ8Nl7Ey+aWoVCNNKWRgaw8qF3f8tKTPDJ/bFWXdMVhDljceTgWQkh
   g==;
X-IronPort-AV: E=Sophos;i="5.96,150,1665471600"; 
   d="scan'208";a="186093230"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Nov 2022 03:48:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 9 Nov 2022 03:47:58 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 9 Nov 2022 03:47:57 -0700
Date: Wed, 9 Nov 2022 10:47:40 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Thierry Reding <thierry.reding@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Daire McNamara
	<daire.mcnamara@microchip.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v11 4/4] MAINTAINERS: add pwm to PolarFire SoC entry
Message-ID: <Y2uFTM/O0b39greO@wendy>
References: <20221007113512.91501-1-conor.dooley@microchip.com>
 <20221007113512.91501-5-conor.dooley@microchip.com>
 <20221109093525.kx4tyvha7y3sikxw@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221109093525.kx4tyvha7y3sikxw@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_024812_664379_1CC68413 
X-CRM114-Status: GOOD (  13.36  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 09, 2022 at 10:35:25AM +0100, Uwe Kleine-K=F6nig wrote:
> On Fri, Oct 07, 2022 at 12:35:13PM +0100, Conor Dooley wrote:
> > Add the newly introduced pwm driver to the existing PolarFire SoC entry.
> > =

> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> =

> Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> =

> I assume you will rework the series and resend this one with the driver
> patche. Applying patch #4 alone doesn't make sense, so I'm marking this
> one as "changes requested", too, in the PWM patchwork instance.
> =

> IMHO patches #1 and #2 make sense to be applied already without the
> driver given the binding is already there. I assume they will go in via
> the riscv tree, so I will mark these two as "handled elsewhere".

Right. Makes sense to me - I'll take the dt-binding & the dt via the
riscv (or soc, we're changing things up there [a]) tree.

Thanks,
Conor.

[a] - https://lore.kernel.org/linux-riscv/mhng-e4210f56-fcc3-4db8-abdb-d43b=
3ebe695d@palmer-ri-x1c9a/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
