Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780D5CC6B08
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 09:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6B1PxXwwrLDVnf4ytLjmjRQVQH1sAaHN4fbdyiWRiU=; b=qVZZ4YF+GwexJR
	hNP//UOjkZMHLy7foG+TCY0Z3j59505ALTuom5r9nRtErJLibuj273sSQE9/HcjYX5DtocTVrhVly
	HjcWa7ZuHhl+I8hzqisGCn9tDSVAu6bkrff5aqmVuSH6kBxyNBykzcd/DZZQYJCdlOEbr198crTDy
	xJn/KeU6Z5mD3yRxWNrruFxRi1hJvF7Q8E2Tv/NMyfbKl39qhi7Ja6KRHMGW9vmY0E0R7AxYgbmjM
	TVwHL2f7GMSrM383cz5YZB2+0qxxsw1BF8+LX8KJ+2QDjMDFTCaY4h6zMo7pWv2aZz5SoQQvPDI53
	NUx16Qbe5TeV8NCKDArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYS1-0000000COn7-3SEb;
	Tue, 13 Oct 2026 09:05:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYRz-0000000COmJ-49XF
	for linux-riscv@bombadil.infradead.org;
	Tue, 13 Oct 2026 09:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iZjRkbq5W/7t5bYSMSsHGWHFlPOzNbExBo1Z2x1DxZ0=; b=gOmtbQARZlf1Eqw7xA6deao/BM
	V6U5xSpLKcXT/+kwlaVOIaRAztHGrGk1yG1snnxMk2lrAUOA66fBDJ0P8E5ha79KcuQhMWVcJ1RtZ
	ybyXOT5lpIdCsqPCyJxlFHc6575ozwrOem2mtDpjDFBBaeDRxeyrLoGjMxUKscj7jsHQ/UNlgm9qD
	fV5dHK9Yr9d0VytEi7nfiwHcWd4FIPGC02mL+RsWqTf8JrebGb8CO5QQobsKJ6sNjEuBOwGe7cupA
	HkVwhWRkrSYtmwHB8JJWYdAxARlun8dgWnAZOGThTadicU+kzNY1uH34xH9zhPaqpWBjX+EP6qs9N
	jSkbRgsA==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGYRu-0000000FJor-00oV
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 09:05:34 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1882921f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 02:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791882328; x=1792487128; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZjRkbq5W/7t5bYSMSsHGWHFlPOzNbExBo1Z2x1DxZ0=;
        b=nCKaYiFb0ABMawkdI+exBYee88v/m0C7vEp5Mmpo3M12qvqUVi2WFh+v5OQ6A9poMd
         oIG/FjbGLepihP3sDcgBP8bdZQJWhwvr9n3oyubgL7V+fwbp7B7FCelYNNwYFs7s75SH
         0wC4uSBUB5rIniIfzRKhL5p6x3Mv0/o45o1XsRm+RbS7fyy26++njdvJBqyMoSn15Vwb
         D1EIOI7TjtN+jocEBQmP+CuPBJelBh80bLQeaPUWVK0qoNHRiYKGWkKrdm6aYnFmCLsU
         djewvV1XMly/z4th3ZvHKPpOxfdF/+WYuTBWY3JhzKyIr3+2amVUx4KHrf0wYJI/UnWk
         h3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882328; x=1792487128;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iZjRkbq5W/7t5bYSMSsHGWHFlPOzNbExBo1Z2x1DxZ0=;
        b=MLgP0DsKuOKo9omJMJao/+zvA4HzKgxwUy5TDkkzh8eQfcvrkEERKmEGVduLhB5nuJ
         m2HWuFc+/G2etoOa8LTRdsxBeY4MAiFftWncELTml1tZ9MXIFjTUED9Qs6ng2okxkdWu
         4YgwR98UBcUPXFOD18Po+WxsrPkk48b7yFM122etHPaYIT6JrEfiu9ktPbNLI3VSWTCD
         kBy8NDTjTydVNUFccQ9lPSVfMcp6JuLq888hvlCu5j+1qd3tFkkRfoN62AXk0rE6iK4P
         itiqbZyfJ6ED6KuP5MSHwtjoQ4vGimEA15dpYALH2EqvrcpZe4YwPO4NNHxxKPzryR43
         jB3A==
X-Forwarded-Encrypted: i=1; AKwUvBzvagTLsz9UjiF5zTA1qHBEFPDFeKElWd3NVGCUMx5utj6mDBubt/LTzhScIK8+ULb1zROJnos9OUxP0A==@lists.infradead.org
X-Gm-Message-State: AFq9FYJCDb3FcIxa9pmNqt1pdNG8YGSAD3+PU91GPy7HgyOg05y7g/cp
	9IXhAR7dKlNk1JpoDjh818QmaZVGKu+ft9Qa8rOTjGSQ5gpV/YmLv/IVYHYSx/hxcig=
X-Gm-Gg: AYBFou39xOd9q+xu9LKqN7m2DDwm8db4ZATT/dAhT7ZTjd5/yqAkrKgJlj/CFQPQCvH
	MkEw8OAR8fb4MKDsJZbziY8fumElNmuTa/9K8WNM2840/J8ralBjs6zG/wikfAyVUV+XFcv5pk1
	9pnB1c9jr5GK0hWyFQwSWDtLk7oxMDv5nsFXKUt/NUYPdHfJD5toTkB+UeWcPjGK98fpfwVVu+7
	DW+zeLxJjAFZNcKip3fJ2xx+i9wxqS3gaHw8/w2TrseKw0xTWXKLxQWhtsDhZqmYWEGeexnPndx
	F7vsBGmDLyiELij16zlyXE8je9Gk8bnrZTqPp3q5fHOdhR/SDOTYJj/jlFKR9RSuoyszxG2ohO3
	76+rveXPM5pcE4O/6J/Ali48Y54ypxXckKfknYzhILUPo1iypkRH1fSaGCd9GCyQhZuHJHDz/m6
	uZeao47p8iEFWSSu9RYZQndc4JiiUpMyI3cgG4Pe/YnD/2iH7bIyLDUgCab6O8i5xBOmtfODw/9
	rOjDpa6FyJvHmU0zw==
X-Received: by 2002:a05:6000:40e0:b0:48c:6a4d:3b67 with SMTP id ffacd0b85a97d-48dbaceb433mr22277898f8f.19.1791882328049;
        Tue, 13 Oct 2026 02:05:28 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab6361sm3495503f8f.32.2026.10.13.02.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:05:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v6 05/15] clk: starfive: Add JHB100 System-0 clock
 generator driver
In-Reply-To: <ZQ4PR01MB1202DE124DED06ECEC948B89F29E2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-6-changhuang.liang@starfivetech.com>
 <179180050742.66744.1321848308971146208.b4-review@b4>
 <ZQ4PR01MB1202DE124DED06ECEC948B89F29E2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Date: Tue, 13 Oct 2026 11:05:26 +0200
Message-ID: <1jzewiezs9.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_100532_513612_0FCB1D74 
X-CRM114-Status: GOOD (  22.03  )
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

On mar. 13 oct. 2026 at 05:29, Changhuang Liang <changhuang.liang@starfivetech.com> wrote:

> Hi, Jerome
>
>> > Add support for JHB100 System-0 clock generator (SYS0CRG).
>> >
>> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> > ---
>> >  MAINTAINERS                                   |   7 +
>> >  drivers/clk/starfive/Kconfig                  |  10 ++
>> >  drivers/clk/starfive/Makefile                 |   2 +
>> >  .../clk/starfive/clk-starfive-jhb100-sys0.c   | 156 ++++++++++++++++++
>> >  4 files changed, 175 insertions(+)
>> >  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys0.c
>> >
>> > diff --git a/MAINTAINERS b/MAINTAINERS index
>> > 66d6c15f1dd2..dff8b819f83e 100644
>> > --- a/MAINTAINERS
>> > +++ b/MAINTAINERS
>> > @@ -26217,6 +26217,13 @@ F:
>> 	Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
>> >  F:	drivers/phy/starfive/phy-jh7110-pcie.c
>> >  F:	drivers/phy/starfive/phy-jh7110-usb.c
>> >
>> > +STARFIVE JHB100 CLOCK DRIVERS
>> > +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
>> > +S:	Supported
>> > +F:	Documentation/devicetree/bindings/clock/starfive,jhb1*.yaml
>> > +F:	drivers/clk/starfive/clk-starfive-jhb1*
>> > +F:	include/dt-bindings/clock/starfive,jhb1*.h
>> > +
>> >  STARFIVE JHB100 EXTERNAL INTERRUPT CONTROLLER DRIVER
>> >  M:	Changhuang Liang <changhuang.liang@starfivetech.com>
>> >  S:	Supported
>> > diff --git a/drivers/clk/starfive/Kconfig
>> > b/drivers/clk/starfive/Kconfig index 51716655554f..cd5b7754403e 100644
>> > --- a/drivers/clk/starfive/Kconfig
>> > +++ b/drivers/clk/starfive/Kconfig
>> > @@ -72,3 +72,13 @@ config CLK_STARFIVE_JH7110_VOUT
>> >  	help
>> >  	  Say yes here to support the Video-Output clock controller
>> >  	  on the StarFive JH7110 SoC.
>> > +
>> > +config CLK_STARFIVE_JHB100_SYS0
>> > +	bool "StarFive JHB100 system-0 clock support"
>> > +	depends on ARCH_STARFIVE || COMPILE_TEST
>> > +	select CLK_STARFIVE_JH71X0
>> > +	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
>> 
>> just imply RESET_STARFIVE_JHB100 ?
>> 
>> It can be disabled if RESET_CONTROLLER is not set, so it is kind of weak
>> already.
>> 
>> > +	default ARCH_STARFIVE
>> > +	help
>> > +	  Say yes here to support the system-0 clock controller on the
>> > +	  StarFive JHB100 SoC.
>> > diff --git a/drivers/clk/starfive/Makefile
>> > b/drivers/clk/starfive/Makefile index 199ac0f37a2f..d2ba83d7d02c
>> > 100644
>> > --- a/drivers/clk/starfive/Makefile
>> > +++ b/drivers/clk/starfive/Makefile
>> > @@ -10,3 +10,5 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)	+=
>> clk-starfive-jh7110-aon.o
>> >  obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
>> >  obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
>> >  obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+=
>> clk-starfive-jh7110-vout.o
>> > +
>> > +obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+=
>> clk-starfive-jhb100-sys0.o
>> > diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
>> > b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
>> > new file mode 100644
>> > index 000000000000..edab54f228ad
>> > --- /dev/null
>> > +++ b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
>> > @@ -0,0 +1,156 @@
>> > +// SPDX-License-Identifier: GPL-2.0
>> > +/*
>> > + * StarFive JHB100 System-0 Clock Driver
>> > + *
>> > + * Copyright (C) 2024 StarFive Technology Co., Ltd.
>> > + *
>> > + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
>> > + *
>> > + */
>> > +
>> > +#include <dt-bindings/clock/starfive,jhb100-crg.h>
>> > +#include <linux/init.h>
>> > +#include <linux/platform_device.h>
>> > +
>> > +#include "clk-starfive-jh71x0.h"
>> > +
>> > +#define JHB100_SYS0CLK_NUM_CLKS
>> 	(JHB100_SYS0CLK_GPU1_NCNOC_INIT + 1)
>> > +
>> > +/* external clocks */
>> > +#define JHB100_SYS0CLK_OSC
>> 	(JHB100_SYS0CLK_NUM_CLKS + 0)
>> > +#define JHB100_SYS0CLK_PLL0
>> 	(JHB100_SYS0CLK_NUM_CLKS + 1)
>> > +#define JHB100_SYS0CLK_PLL1
>> 	(JHB100_SYS0CLK_NUM_CLKS + 2)
>> > +#define JHB100_SYS0CLK_PLL2
>> 	(JHB100_SYS0CLK_NUM_CLKS + 3)
>> 
>> Does this mean that if the you ever find out you've forgot an internal clock
>> (which does happen fairly often) the whole external block will shift ?
>> 
>
> Later, I will introduce the following macros to define the external clock, which can avoid this problem.
>
> #define JH71X0_EXT_CLK_FLAG	BIT(15)
> #define JH71X0_EXT_CLK(_n) 	(JH71X0_EXT_CLK_FLAG | (_n))
>

hummm okay ... still seems hackish to me.

>

-- 
Jerome

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
