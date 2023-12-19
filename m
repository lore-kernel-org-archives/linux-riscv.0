Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577CFC46CA2
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 17:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=n3xBqyJUKfe2dj+XX4pPLm3wkyVm9dauPTj/uhbyEEw=; b=t3CQxyA8nd9rKznNC1UPVHHryU
	h0Tkm4bWqmLLoELZW4S1KxBkbtuJjxteV1fCl3jzC6G5Q0s2Iqd/GpMFwSS9WUjPQ6qlKZTGJheRw
	v+35Q6/yzZU1opPLulIFgizPGsPFsO5i2zV2YEVk20W/TPsq8dO4MTGg7a6dq5Ca/82yDu5CEoXO1
	eQWfyYLWfzvbRsx47n2/O/vC1qw3Mrl9pswoNmMxrikNXHjMOpi8/I7j22UQ+Lnzp9Fjgdg3BhohY
	KGQ43HTG3HlJ/pQaZGJuj6cx2nqR3x/MBmiP5ZAX3pum4cCBU52xSpC8Tq+ni4Fe8BLyNj3Xizmgr
	duvNlJ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFe4d-00EycS-1W;
	Tue, 19 Dec 2023 17:40:07 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFe4Z-00Eyax-15
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 17:40:05 +0000
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AEC843F2C4
	for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 17:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1703007596;
	bh=5lC8up460sffE6lEtHTKhMldznfJD/U8bnCN2AOssbw=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=NIk/btTggmsoU7KnngSya2BmNYOw8UcyKpNvpsdIocn/imra7c3LVucBGrQaDK0Tv
	 024Bm14hQuQ+9RuR9eOHnFGO2m+7S2W/JAzpULahFytSc9p/iQtNhPdNCczzGS8GVP
	 S3vZ1W0uKnrpqsnan07Q148iMJMTGIbHQxxpMGBq6v/eVnd3tv/wpKfJh9RAmMx1m1
	 bKq3HnYoY79Fhbl9Zzc2WjPkEZIZ8G20BeHhOUusTXztPhT+aejmCYiC1GONI3yWZM
	 TeB12qqdBH0Ftt2h5gFsbgUmbV056lS3WQZ35FHGURDHBlS/BwkI1M7o1N8sYNFCGS
	 /UXvPMh04s2Fg==
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-77f396b51b5so729679485a.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 09:39:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703007595; x=1703612395;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5lC8up460sffE6lEtHTKhMldznfJD/U8bnCN2AOssbw=;
        b=YtrLYpcLGXcRAymmk5iI261px04mdvY0ZkQ+yqAldZYaA2pXKgeUdyzaAdDz2eOo3z
         /+LiKVA6qRjm6lgEXLOkx/wYX/a2ElxkpS62EEHYlUWDOdWOsOvaK1LqLNA4iyGMHDb1
         axmjTYw/yTpLQB6b7dgq4tPAXooxwMZTnAsj4b4Cd5iCq72+5eIXveNnC9RSSeYY/tt4
         mh6pq94jsRx4YfSQaEXWFCsEF1QiT0ae30Jbcn7QluIy41rGv1nU9ZTQivITTvBLyadI
         Y+MLNgGt/kDXGaZpp9yBDnZe/0YD5/zRiXn2nmVVoZtXgZiRp8V9zmdgzRLLnCaYuOAP
         zT3Q==
X-Gm-Message-State: AOJu0YzbaMX7G/wqQiOe9cfTI3Guy7ZsG9rnfajwvdIEQ79eOyRZygDg
	dPg7hht5207Z1tuMuPGTzOkGwmZwAwb4gz9smpYQgZkeHILXEkKEqIB5OrFBzw9vBxA0iyPhx4y
	W5v8qy810Lwj3pzNWG4c9ekLJYTwEXGT3lPjkFFA6ntvqY41FRp+WN32AUkeAmw==
X-Received: by 2002:a05:622a:19a9:b0:425:a117:90ec with SMTP id u41-20020a05622a19a900b00425a11790ecmr23114932qtc.66.1703007595442;
        Tue, 19 Dec 2023 09:39:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDTi89p4XgTEJbjNfwK+23dRywS9hQShScl1IpS3D4x4FXvIT3lk//qypTp5LCDwvH0SoDqu6Meoi8IDWfUkI=
X-Received: by 2002:a05:622a:19a9:b0:425:a117:90ec with SMTP id
 u41-20020a05622a19a900b00425a11790ecmr23114920qtc.66.1703007595184; Tue, 19
 Dec 2023 09:39:55 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 Dec 2023 12:39:54 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <d35d3cf480064c69b1125ba07d615446@EXMBX066.cuchost.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
 <20231206115000.295825-7-jeeheng.sia@starfivetech.com> <CAJM55Z_VgBGvCPuvwmQahMcMfuWKnOKpZ9bBbbhei_Teu5Apeg@mail.gmail.com>
 <9ae86c6786bc4ac7b93c971ba00084a6@EXMBX066.cuchost.com> <CAJM55Z9GVFGuwqe=zLXQvBwDfVSz4eA2EXDd4sqWVCKJF2J+fg@mail.gmail.com>
 <d35d3cf480064c69b1125ba07d615446@EXMBX066.cuchost.com>
Mime-Version: 1.0
Date: Tue, 19 Dec 2023 12:39:54 -0500
Message-ID: <CAJM55Z_XZVBKr05X4QeCeDO_iMZh-FbKsikcNsDPK7iKuVEodw@mail.gmail.com>
Subject: RE: [PATCH v1 06/16] clk: starfive: Add JH8100 System clock generator driver
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, "kernel@esmil.dk" <kernel@esmil.dk>, 
	"conor@kernel.org" <conor@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "mturquette@baylibre.com" <mturquette@baylibre.com>, 
	"sboyd@kernel.org" <sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_094003_802968_B60DD1F2 
X-CRM114-Status: GOOD (  22.34  )
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

JeeHeng Sia wrote:
>
>
> > -----Original Message-----
> > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > Sent: Wednesday, December 13, 2023 7:57 PM
> > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; Emil Renner Berthing <emil.renner.berthing@canonical.com>; kernel@esmil.dk;
> > conor@kernel.org; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; paul.walmsley@sifive.com; palmer@dabbelt.com;
> > aou@eecs.berkeley.edu; mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; Hal Feng
> > <hal.feng@starfivetech.com>; Xingyu Wu <xingyu.wu@starfivetech.com>
> > Cc: linux-riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org; Leyfoon Tan
> > <leyfoon.tan@starfivetech.com>
> > Subject: RE: [PATCH v1 06/16] clk: starfive: Add JH8100 System clock generator driver
> >
> > JeeHeng Sia wrote:
> > > > -----Original Message-----
> > > > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > > > Sent: Saturday, December 9, 2023 12:25 AM
> > > > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk; conor@kernel.org; robh+dt@kernel.org;
> > > > krzysztof.kozlowski+dt@linaro.org; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> > > > mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; emil.renner.berthing@canonical.com; Hal Feng
> > > > <hal.feng@starfivetech.com>; Xingyu Wu <xingyu.wu@starfivetech.com>
> > > > Cc: linux-riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org; Leyfoon
> > Tan
> > > > <leyfoon.tan@starfivetech.com>
> > > > Subject: Re: [PATCH v1 06/16] clk: starfive: Add JH8100 System clock generator driver
> > > >
> > > > Sia Jee Heng wrote:
> > > > > Add support for JH8100 System clock generator.
> > > > >
> > > > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > > > > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > > > > ---
> > > > >  MAINTAINERS                                   |   8 +
> > > > >  drivers/clk/starfive/Kconfig                  |   9 +
> > > > >  drivers/clk/starfive/Makefile                 |   1 +
> > > > >  drivers/clk/starfive/clk-starfive-common.h    |   9 +-
> > > > >  drivers/clk/starfive/jh8100/Makefile          |   3 +
> > > > >  .../clk/starfive/jh8100/clk-starfive-jh8100.h |  11 +
> > > > >  drivers/clk/starfive/jh8100/clk-sys.c         | 455 ++++++++++++++++++
> > > > >  7 files changed, 495 insertions(+), 1 deletion(-)
> > > > >  create mode 100644 drivers/clk/starfive/jh8100/Makefile
> > > > >  create mode 100644 drivers/clk/starfive/jh8100/clk-starfive-jh8100.h
> > > > >  create mode 100644 drivers/clk/starfive/jh8100/clk-sys.c
> > ...
> > > > > diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> > > > > index 012f7ee83f8e..6cb3ce823330 100644
> > > > > --- a/drivers/clk/starfive/Makefile
> > > > > +++ b/drivers/clk/starfive/Makefile
> > > > > @@ -10,3 +10,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)	+= clk-starfive-jh7110-aon.o
> > > > >  obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
> > > > >  obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
> > > > >  obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
> > > > > +obj-$(CONFIG_CLK_STARFIVE_JH8100_SYS)	+= jh8100/
> > > >
> > > > I don't really see why do you need a special subdirectory for the JH8100? The
> > > > JH7110 drivers do fine without it.
> > > Each subfolder can represent a different platform, making it easier to
> > > locate and maintain platform-specific code. Since the code is expected
> > > to grow in the future, let's start organizing it in a folder-based structure
> > > for easier maintenance at a later stage.
> >
> > Yes, but that's not what you're doing here. You're making just one of the 3
> > almost identical drivers be different for no good reason.
> I will restructure it for the other 2 platforms.

That would be less bad, but you still haven't explained why you need to move
everything around like that:
https://lore.kernel.org/linux-riscv/CAJM55Z_3Mty2LftPVkQC1wbwtGeznMMAk9mAjH_GoNuL7CKtaQ@mail.gmail.com/

I don't think just "too many files" is a very good argument here. Just look at
drivers/clk/sunxi

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
