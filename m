Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C60FE7717D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 06:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=JoxYo85LRuBTe2HF6kY1C+yVR9UshempjhHOPoL14vE=; b=1FSW0d6mo/Ks5g
	UCtEGVs9cqlf78fRDibQbJ7PWltjCIY9uvs1mZg/UlG451jDlruMEABGH4W6qfNHayVZux0TT31y6
	orUFViGuGJXfIV8Spncl7QfIJ/4Z1EX+QZLINBclY7Ms9rvcAd7Y38jwoQtxk4lmYlVyr5LeSugCD
	dvMOZbFSjSf2jb5iZYnurcNmrpPtypM1n0taM6HtqZhf0RLfYjwAewaewbdRaS6/YKVLubq4Z+Le9
	9LUXKOQ36YXkyqCOk7DW77bg79h1OKv7BLC+wR0qtUst7tVA2FwrE8beYCdnbX0yf9qftHKC0x617
	j5Jg7RZXPEKJHli+O2Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKXcc-00000006ctF-3JtO;
	Mon, 09 Dec 2024 06:51:58 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKXcZ-00000006csi-1jM3
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 06:51:57 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-434acf1f9abso38940085e9.2
        for <linux-riscv@lists.infradead.org>; Sun, 08 Dec 2024 22:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733727113; x=1734331913; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UU+rFrYBqU+HyZU9fxW7fsHHwD25k+Ib4ntmd1sD3tw=;
        b=wJS8rQQmM6Zx6ACn3FYkGOvqwZlfz4f5Llbe9vnP7C0zdcWgvE3mNONJDr0dFCVWV1
         YjLA+8YqVADAhiewFmOJxhC34ASy7kTpZtDkFS/ZNMPA9zmFKGanCGzEeq5T5s/ZF0h0
         S9OTI44lRS1eer/LYj3rttdcbfHQO26urwT/6Hw2du12Cp50Jo2X1A9cb2J5A3GfjFr2
         0OWHDcH/Z1eF0p2+xGLrBZl5f9KRmU4N4NWfomVqRGvqucRIVdQi2I4OHcasSjHAaM8j
         mOZsEtE0Gl7ClRZv4dI6OEZnxVZi0N+ZYXcJGl5rZ76ZFIbL4GOC6RDqsmtH3HFgRzj6
         lS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733727113; x=1734331913;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UU+rFrYBqU+HyZU9fxW7fsHHwD25k+Ib4ntmd1sD3tw=;
        b=uZIPElFKYFEaxYC5ibLG01TXf41+6cfkIQ40tzPK6kRsyDFvntRfnAtB5/cSb9f0vm
         PfddrI3fKAqBsiNsuFWFg+0BzxEO11Z8rlmLMAz3iJxDutXkaDkF7HrfFKQCuTMZCOqh
         hoGy2JhI3RT9dxjYJAI8BH6txVmpWD0dQRTI1fvIp9kRmIrtoX5sdTv9kvca17GrYrpL
         PRlktc+7g0Viy+RGAgYyYAbRcWEqZksPtqcpP4Y7JO+kKDiS08loMUfQbFwLm6Y+/QKZ
         bfefowceUeoXqQZSgYZw8MiFevIakbmAWRFYqexYZBf8wNxPeDD6KRF4Npsp2qRacY8I
         +B2g==
X-Forwarded-Encrypted: i=1; AJvYcCVLL367u0jzYnLQxLdjU8DXbY9VwVhR68o+t99kd0GWN87xHbHKPaM9f6vUebm6wL+OWlWvN35dcNR+sQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzM9wMT0jmL2DfeOjX9a/AWw5HLEEvA9rFhiWxL/p5lEeG1kJUE
	5fMAiMMNbwfnrLt4UPbNJUcwQwvbyxttcfdIRxFk87k19iLzsZAtkpVvOKtTuQM=
X-Gm-Gg: ASbGnctIoo24KlE65TXpUFXPAVE1g6bsQ6CZCqUDi2YMnkIH/VGL/4MxzsKANXfx/aP
	trsdPGoOanZJPhgRHFp0K62o7/XjxwE/8uQ1Hcjz0F8bUf20hhWRXudA02Gh59qgYOvxENbCX8j
	X3kstYiKyCdUxznrCl50CEioOq3KwZheDbs+3sTIAGCAvINxM0CZP2JsiNnjiA0+RpGNtf7AiBQ
	N5Y26WF3pODnFBak4csGjhunKw1L9eCam4SIeC/mDQxCC7zPLiaxO4=
X-Google-Smtp-Source: AGHT+IGEzc4vwHmaIfvTMIfIV37e15tsohqeHODjPaefoObT5Iz92AFnPqv8LysQYDOG0yI6+qlhwA==
X-Received: by 2002:a05:600c:3155:b0:431:52b7:a499 with SMTP id 5b1f17b1804b1-434dded67b1mr79239335e9.20.1733727112718;
        Sun, 08 Dec 2024 22:51:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434eb8f18fcsm72397395e9.24.2024.12.08.22.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 22:51:52 -0800 (PST)
Date: Mon, 9 Dec 2024 09:51:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v3 3/3] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <9a3f6975-d99d-430b-9a09-697638667e97@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241126143125.9980-7-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_225155_456484_2295C56A 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

Hi Haylen,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Haylen-Chu/dt-bindings-clock-spacemit-Add-clock-controllers-of-Spacemit-K1-SoC/20241128-101248
base:   2d5404caa8c7bb5c4e0435f94b28834ae5456623
patch link:    https://lore.kernel.org/r/20241126143125.9980-7-heylenay%404d2.org
patch subject: [PATCH v3 3/3] clk: spacemit: Add clock support for Spacemit K1 SoC
config: arm64-randconfig-r073-20241207 (https://download.01.org/0day-ci/archive/20241207/202412072123.ne7GnRyJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412072123.ne7GnRyJ-lkp@intel.com/

smatch warnings:
drivers/clk/spacemit/ccu-k1.c:1686 k1_ccu_probe() error: uninitialized symbol 'lock_map'.

vim +/lock_map +1686 drivers/clk/spacemit/ccu-k1.c

e71e4621b06cd42 Haylen Chu 2024-11-26  1651  static int k1_ccu_probe(struct platform_device *pdev)
e71e4621b06cd42 Haylen Chu 2024-11-26  1652  {
e71e4621b06cd42 Haylen Chu 2024-11-26  1653  	const struct spacemit_ccu_data *data;
e71e4621b06cd42 Haylen Chu 2024-11-26  1654  	struct regmap *base_map, *lock_map;
e71e4621b06cd42 Haylen Chu 2024-11-26  1655  	struct device *dev = &pdev->dev;
e71e4621b06cd42 Haylen Chu 2024-11-26  1656  	struct spacemit_ccu_priv *priv;
e71e4621b06cd42 Haylen Chu 2024-11-26  1657  	struct device_node *parent;
e71e4621b06cd42 Haylen Chu 2024-11-26  1658  	int ret;
e71e4621b06cd42 Haylen Chu 2024-11-26  1659  
e71e4621b06cd42 Haylen Chu 2024-11-26  1660  	data = of_device_get_match_data(dev);
e71e4621b06cd42 Haylen Chu 2024-11-26  1661  	if (WARN_ON(!data))
e71e4621b06cd42 Haylen Chu 2024-11-26  1662  		return -EINVAL;
e71e4621b06cd42 Haylen Chu 2024-11-26  1663  
e71e4621b06cd42 Haylen Chu 2024-11-26  1664  	parent   = of_get_parent(dev->of_node);
e71e4621b06cd42 Haylen Chu 2024-11-26  1665  	base_map = syscon_node_to_regmap(parent);
e71e4621b06cd42 Haylen Chu 2024-11-26  1666  	of_node_put(parent);
e71e4621b06cd42 Haylen Chu 2024-11-26  1667  
e71e4621b06cd42 Haylen Chu 2024-11-26  1668  	if (IS_ERR(base_map))
e71e4621b06cd42 Haylen Chu 2024-11-26  1669  		return dev_err_probe(dev, PTR_ERR(base_map),
e71e4621b06cd42 Haylen Chu 2024-11-26  1670  				     "failed to get regmap\n");
e71e4621b06cd42 Haylen Chu 2024-11-26  1671  
e71e4621b06cd42 Haylen Chu 2024-11-26  1672  	if (data->need_pll_lock) {
e71e4621b06cd42 Haylen Chu 2024-11-26  1673  		lock_map = syscon_regmap_lookup_by_phandle(dev->of_node,
e71e4621b06cd42 Haylen Chu 2024-11-26  1674  							   "spacemit,mpmu");
e71e4621b06cd42 Haylen Chu 2024-11-26  1675  		if (IS_ERR(lock_map))
e71e4621b06cd42 Haylen Chu 2024-11-26  1676  			return dev_err_probe(dev, PTR_ERR(lock_map),
e71e4621b06cd42 Haylen Chu 2024-11-26  1677  					     "failed to get lock regmap\n");
e71e4621b06cd42 Haylen Chu 2024-11-26  1678  	}

lock_map not initialized on else path.

e71e4621b06cd42 Haylen Chu 2024-11-26  1679  
e71e4621b06cd42 Haylen Chu 2024-11-26  1680  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
e71e4621b06cd42 Haylen Chu 2024-11-26  1681  	if (!priv)
e71e4621b06cd42 Haylen Chu 2024-11-26  1682  		return -ENOMEM;
e71e4621b06cd42 Haylen Chu 2024-11-26  1683  
e71e4621b06cd42 Haylen Chu 2024-11-26  1684  	priv->data	= data;
e71e4621b06cd42 Haylen Chu 2024-11-26  1685  	priv->base	= base_map;
e71e4621b06cd42 Haylen Chu 2024-11-26 @1686  	priv->lock_base	= lock_map;
                                                                  ^^^^^^^^^

e71e4621b06cd42 Haylen Chu 2024-11-26  1687  
e71e4621b06cd42 Haylen Chu 2024-11-26  1688  	ret = spacemit_ccu_register(dev, priv);
e71e4621b06cd42 Haylen Chu 2024-11-26  1689  	if (ret)
e71e4621b06cd42 Haylen Chu 2024-11-26  1690  		return dev_err_probe(dev, ret, "failed to register clocks\n");
e71e4621b06cd42 Haylen Chu 2024-11-26  1691  
e71e4621b06cd42 Haylen Chu 2024-11-26  1692  	return 0;
e71e4621b06cd42 Haylen Chu 2024-11-26  1693  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
