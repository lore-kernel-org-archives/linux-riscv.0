Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD32CDE031
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 18:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djSMP+xUwbG3sgchxmEPSEkGAkKkdWcA7hBhoyw18xA=; b=mkU0WDx/V0/CjO
	ayrmQBz6hhTUAI5YmN4saAECxf31hCsRjgq0R2oE8RAM+0/9lGbEKBGh4MfxyqyKBPkXoOYeJlwoA
	lsIYYsUAacHMcH0GzZBElGz5XndvtU6u2AVBlmXf4beW1ya2l+1lauDfV/1+thLgYIRFdZDPVkWJd
	FHKXP1FCkFKrR3dAXCWHJEpEjNxi5t0goINgKzcZgqWJ+FpmJazE07IU9hnhqotXIkK5pbhb/i0g6
	JS6lSv0v4BS2y9oPKAma6Rx6cSI4TRLs5uHi54zi8SDjZvMpACuTfULMoKgPJ7sZ37S7vvGoV668B
	75olRujl/WmBAfEpBtNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sttd3-00000009Bbl-1z4j;
	Thu, 26 Sep 2024 18:54:17 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sttWp-00000009Aal-1sOX
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 18:47:52 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-205722ba00cso12542785ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Sep 2024 11:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727376470; x=1727981270; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+KusUymBZTpYYnq4WmcbbE/FZsVAjrJbZNZbABf3CAo=;
        b=ANQnlyiK3mqF4HYlZfumLHsUyftJU0XwuEIWlPBFPYums4pPLVTYbB1qV92OSUIZBQ
         iniVJjPyt78lwgW1qzz1hQjzklk9KXIrBqyW3jN2/AVsc4AhXnxl5UCbHJTBwM+yJCDj
         5kPmrYPqkK12gTaHMGQqDtt2JHgiqdoosTmMLX3nwJuCpQDhmD4312U3zEHjpLROQeun
         HHAvHFdfnG/arYSiehI2LBvJIce5r3AUPOUD0ZW+cVtM5XULniWumoPsHwOoLWmUohQG
         7LyFRwCqTwLnuk4YR+2mGA5RolS8KbNjyNsTon/mR+ELqy/fjuEkVdCAs0j78hK2zynv
         TLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727376470; x=1727981270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KusUymBZTpYYnq4WmcbbE/FZsVAjrJbZNZbABf3CAo=;
        b=YP52Fa0cl9nyOVfop9sN5PRSJ42KKqBv4tTB1jK9Orubach9sZIfmUYeMwD75OgSEg
         uSMwTcQeTZ83ZcD7T11QdTrGj0fR7wiwXJ4Vj25RdoFxfGbFvg5m8qgh3Z72UC2hDUyk
         FZJeeCuB0UP0Z5DuCL1q6NoZBhdrJf/5+/wZFJpg3g565EtU4qB4Z6BoKI46hJvCzx33
         YJ82vpkaE0mykgF+k/aLH2ITERcxPJ/N0rK4Q3MCLrF2ld649g20V/h5Fhu2IYXp1kLB
         oVn16pbps56L1LFapmnsUdAwRLDxtEdoT84QTn0O1aRSUg/yGq0MkW0rczpBvU1r1nVO
         AI3A==
X-Forwarded-Encrypted: i=1; AJvYcCWF7uvJ0goPlLqbDrBsD5Cg24p0M24ITep/HsIqESbmbrFP3EsZWTfRGPU30gJLuuQdSTrF0b7ri+apvA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx1lMvPgSgWiRAuIsJIh5rfQLymKFh8JpKWl/3OJIDS9CaWR1k
	Luppw7jIw7w9+t1Zdj19ZOl3lqSb3XKtA+xnFrehWnQ1tqVyyWqYD0yd7v24wxQ=
X-Google-Smtp-Source: AGHT+IGNxuTgkN1leT2RdvlA5PUTH+t79/qJCqmKY/KS0CmrWCtetVvj/vYEI9+Bz4MIXVKD0WkcsQ==
X-Received: by 2002:a17:903:2285:b0:207:7952:e6d4 with SMTP id d9443c01a7336-20b367ca162mr9258295ad.4.1727376469796;
        Thu, 26 Sep 2024 11:47:49 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e4ee7bsm1571565ad.234.2024.09.26.11.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 11:47:49 -0700 (PDT)
Date: Thu, 26 Sep 2024 11:47:47 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/3] net: stmmac: Add glue layer for T-HEAD TH1520 SoC
Message-ID: <ZvWsUxyBoiHws1TE@x1>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-2-f34f28ad1dc9@tenstorrent.com>
 <a64eb154-30b9-4321-b3ef-2bcb1e861800@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a64eb154-30b9-4321-b3ef-2bcb1e861800@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_114751_508528_B45E48FD 
X-CRM114-Status: GOOD (  24.22  )
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

On Thu, Sep 26, 2024 at 08:32:00PM +0200, Andrew Lunn wrote:
> > +static int thead_dwmac_init(struct platform_device *pdev, void *priv)
> > +{
> > +	struct thead_dwmac *dwmac = priv;
> > +	int ret;
> > +
> > +	ret = thead_dwmac_set_phy_if(dwmac->plat);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = thead_dwmac_set_txclk_dir(dwmac->plat);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_write(dwmac->apb_regmap, GMAC_RXCLK_DELAY_CTRL,
> > +			   GMAC_RXCLK_DELAY_VAL(dwmac->rx_delay));
> > +	if (ret)
> > +		return dev_err_probe(dwmac->dev, ret,
> > +				     "failed to set GMAC RX clock delay\n");
> > +
> > +	ret = regmap_write(dwmac->apb_regmap, GMAC_TXCLK_DELAY_CTRL,
> > +			   GMAC_TXCLK_DELAY_VAL(dwmac->tx_delay));
> > +	if (ret)
> > +		return dev_err_probe(dwmac->dev, ret,
> > +				     "failed to set GMAC TX clock delay\n");
> > +
> > +	thead_dwmac_fix_speed(dwmac, SPEED_1000, 0);
> 
> Is this needed? I would expect this to be called when the PHY has link
> and you know the link speed. So why set it here?

Good point.  I've removed this line and the probe still completes okay
and the Ethernet connection is working okay.

> > +
> > +	return thead_dwmac_enable_clk(dwmac->plat);
> > +}
> > +
> > +static int thead_dwmac_probe(struct platform_device *pdev)
> > +{
> > +	struct device_node *np = pdev->dev.of_node;
> > +	struct stmmac_resources stmmac_res;
> > +	struct plat_stmmacenet_data *plat;
> > +	struct thead_dwmac *dwmac;
> > +	void __iomem *apb;
> > +	u32 delay;
> > +	int ret;
> > +
> > +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "failed to get resources\n");
> > +
> > +	plat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> > +	if (IS_ERR(plat))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(plat),
> > +				     "dt configuration failed\n");
> > +
> > +	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
> > +	if (!dwmac)
> > +		return -ENOMEM;
> > +
> > +	/* hardware default is 0 for the rx and tx internal clock delay */
> > +	dwmac->rx_delay = 0;
> > +	dwmac->tx_delay = 0;
> > +
> > +	/* rx and tx internal delay properties are optional */
> > +	if (!of_property_read_u32(np, "thead,rx-internal-delay", &delay)) {
> > +		if (delay > GMAC_RXCLK_DELAY_MASK)
> > +			dev_warn(&pdev->dev,
> > +				 "thead,rx-internal-delay (%u) exceeds max (%lu)\n",
> > +				 delay, GMAC_RXCLK_DELAY_MASK);
> > +		else
> > +			dwmac->rx_delay = delay;
> > +	}
> > +
> 
> So you keep going, with an invalid value? It is better to use
> dev_err() and return -EINVAL. The DT write will then correct their
> error when the device fails to probe.

My intention was to keep the default of 0 if the dt property exists and
exceeds the max value. I had considered failing the probe but I wasn't
sure that was too severe of a reaction to a bad value for the delay.

> 
> If you decide to keep this... I'm not sure these properties are
> needed.

Given your reply to the cover letter, I think it does make sense for me
to remove handling of these delay properties since the units of the
delay bit field are unknown and the hardware I have is okay with the
default delay.

> 
> > +MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
> 
> Please add a second author, if you have taken over this driver.

Yes, Jisheng is no longer working on it, so I will add myself.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
