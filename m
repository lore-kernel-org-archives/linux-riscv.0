Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61CCE68958
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 07:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U7NsYenOMTV1/EoJ6BY/pcnZcukSvrnao6POlHhch3g=; b=g/JjXXIF//dneC
	bkvl90xqYt/c95o9PiJxD5gLs1pLVugOI+0huAw3CvJ8b3gw+swWTNYPg9/IcyIvA/+Tu/eWq7w0c
	qfHJEhI/cCgzu8OOz+Fmt5K6i1gEDszp55YJBhpkm6rJmtaaqi9W3SXERrYilHw9Ev/C9zLm/MmLF
	4EP2iuLHMOoTdn3wsENACIQLCfhP9rLWliFNcj5Ljw2Hk5eGh8JKG5zvCHylCbS5hkX4CxKY0zBf3
	Uv3VZAQDR66sVd/7kuOL9zol/JBrhbLUKZkxm4IWMN5YsCzGll5YHhPq/fg/iE9L3v0UADvhBiK5k
	GgnoHerYf4beyO+KaQtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Pdx-00000002oQS-3Ogn;
	Thu, 31 Oct 2024 07:30:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6OWY-00000002ffH-46zR
	for linux-riscv@bombadil.infradead.org;
	Thu, 31 Oct 2024 06:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bl02seAhFeSZSgXn8G8HesYy2zdJG36tpIiCaOJ58KE=; b=GtIJo+qOlliV2daQFRJtsK/ots
	G0jyMViFCru7xFW3PQJ0uCxyxoSmuXiWoPgMTo/8usWmVOlWs75DFgE7Bg2OQauZ12d/7gm1bftTI
	aPYRGT03l66oZ/4s02Vm5UTumMml5kJADSfKlXF6OOivTgxTiTVEHjktI8RvFETCbW0udQ3pk6Asv
	cpIxoJWWZOd2qlwnjt5ZDTR9pBOU2QZgKzNe4GB0c+pVI+Hot+FcfEIK6pWahsPY8kIZ0hNTeJlax
	mzEIwp3iWspEv2qdyDUic2Ds9cYoyR6xyx1BXNS4KdSzyEK5ysVjCX8BkC6dNOZiYaZ33Kggy33eO
	6GBqrT4Q==;
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6OWV-0000000AOtQ-0q1J
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 06:19:13 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-71815313303so283464a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Oct 2024 23:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730355548; x=1730960348; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bl02seAhFeSZSgXn8G8HesYy2zdJG36tpIiCaOJ58KE=;
        b=X/2WbP1joHPbhqpQsyi/8J1zflToT/qqLXItXuVazAwzXpOlWMueZIkuwB/DQKAiNW
         1XdufTLYSGubrADXSvFEX9DT1fcYaqi65pRypfg5pS8akvYREEzz1UTABpAZ+Eh23d8/
         LiLpS6pbaLzM0Ul2PSgR0E/bN/9lHLGo/gligu3xxJcyKgORBccLxelF2EjIuKXigrfc
         VpaWbWiGqQ7L+3dDI3fJhu1hd+I+hxw+mQoknEjRhmeKPRxxYFSl9+1cDSvI+2eLS6qj
         XL7FD6fP8pykH7FZBCDt57BVtDUy1W6h9OboZEJvslRV0JoK2+QYJdinIwkeDpCnhJif
         UMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730355548; x=1730960348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bl02seAhFeSZSgXn8G8HesYy2zdJG36tpIiCaOJ58KE=;
        b=XNoiU8i7HPDt7jelTk7xAzaaLurK9hXWuiJ+CdZcqbCuhZsw+NS6lp4PeXYLEtiipv
         R2cEUj/Co7yBAEfgP5e7JCm7QyPX6LWX/jc2Izt0pbJ6jKtwI8KnDoNRP3oz8irCrfVl
         HAV5arFkkW0pfXlLvdFHg0s7dyyBlLPi9NRBwV1NnUhhal+6l/3wpxlIRbX2vRg2b7KK
         uiS1vb3kTWM9FhdQPukzHx2+93LpLaNkojL2Wp53CtUK24K+eKsJBHYc3XFyIMFcnSYi
         sKQIbbAJGtpHWyGljXz/tqKaNWbAcuWHCvkBN1Luz7mOiXHePEx/KoTmgtuIcc7jc3ET
         JGLw==
X-Forwarded-Encrypted: i=1; AJvYcCXZrEW/hF8G0jAaCG33oQBZes/GDckOdzJGKEZZnpb2fZC+53d4Xw51WFD4tkykxNwWkgN98qXFwTUT1g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0tUoCFD0erfKfScZLoTH4HreFkjz5PSHspfVmfR3QFAo9uhyD
	WONN1HvBaRFlmfn3k0ON1AzOnyxuYyPSyc8zOsmL8BD2ZEdP5imV
X-Google-Smtp-Source: AGHT+IH+yIWABoBo9Y8/riPdmGozM5MRcQuOYYbZGmtix58loibt8/a/SmR1ACqJJrBlrL2IPX7jTQ==
X-Received: by 2002:a05:6830:6309:b0:717:fab7:f7cb with SMTP id 46e09a7af769-71868285d37mr14892097a34.21.1730355548594;
        Wed, 30 Oct 2024 23:19:08 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2ebb6bsm587807b3a.176.2024.10.30.23.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 23:19:08 -0700 (PDT)
Date: Thu, 31 Oct 2024 14:18:39 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Richard Cochran <richardcochran@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Liu Gui <kenneth.liu@sophgo.com>, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: Add ethernet configuration for cv18xx
Message-ID: <ftfp2rwkytqmzruogcx66d5qkn4tzrgyjtlz4hdduxhwit3tok@kczgzrjdxx46>
References: <20241028011312.274938-1-inochiama@gmail.com>
 <87e215a7-0b27-4336-9f9c-e63ade0772ef@lunn.ch>
 <wgggariprpp2wczsljy3vw6kp7vhnrifg6soxdgiio2seyctym@4owbzlg3ngum>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wgggariprpp2wczsljy3vw6kp7vhnrifg6soxdgiio2seyctym@4owbzlg3ngum>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_061912_265271_EA3CD258 
X-CRM114-Status: GOOD (  17.98  )
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

On Tue, Oct 29, 2024 at 06:43:03AM +0800, Inochi Amaoto wrote:
> On Mon, Oct 28, 2024 at 02:09:06PM +0100, Andrew Lunn wrote:
> > > +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > > @@ -210,6 +210,55 @@ i2c4: i2c@4040000 {
> > >  			status = "disabled";
> > >  		};
> > >  
> > > +		gmac0: ethernet@4070000 {
> > > +			compatible = "snps,dwmac-3.70a";
> > > +			reg = <0x04070000 0x10000>;
> > > +			clocks = <&clk CLK_AXI4_ETH0>, <&clk CLK_ETH0_500M>;
> > > +			clock-names = "stmmaceth", "ptp_ref";
> > > +			interrupts = <31 IRQ_TYPE_LEVEL_HIGH>;
> > > +			interrupt-names = "macirq";
> > > +			phy-handle = <&phy0>;
> > > +			phy-mode = "rmii";
> > > +			rx-fifo-depth = <8192>;
> > > +			tx-fifo-depth = <8192>;
> > > +			snps,multicast-filter-bins = <0>;
> > > +			snps,perfect-filter-entries = <1>;
> > > +			snps,aal;
> > > +			snps,txpbl = <8>;
> > > +			snps,rxpbl = <8>;
> > > +			snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
> > > +			snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
> > > +			snps,axi-config = <&gmac0_stmmac_axi_setup>;
> > > +			status = "disabled";
> > > +
> > > +			mdio {
> > > +				compatible = "snps,dwmac-mdio";
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +
> > > +				phy0: phy@0 {
> > > +					compatible = "ethernet-phy-ieee802.3-c22";
> > > +					reg = <0>;
> > > +				};
> > > +			};
> > 
> > It is not clear to me what cv18xx.dtsi represents, 
> 
> This is a include file to define common ip for the whole
> cv18xx series SoCs (cv1800b, cv1812h, sg2000, sg2000).
> 
> > and where the PHY node should be, here, or in a .dts file. 
> > Is this a SOM, and the PHY is on the SOM? 
> 
> The phy is on the SoC, it is embedded, and no external phy
> is supported. So I think the phy node should stay here, not 
> in the dts file.

There is a mistake, Some package supports external rmii/mii
phy. So I will move this phy definition to board specific.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
