Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB54C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 17:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n1a9kzVZ7iY0fozPtNhzhIY/VgM/wadbhFimGAf7piM=; b=KPwbkt2AWANmxP
	ILeU0QJMHfYLFv9Lrh5CTbnuXgn8dbQEHGLp3GGlM6d8qqdWvkXGjSHCd/YbkDAbF30VJGwO3Br3b
	AudVnj6tZ9DmEjErNriIXeQ9wzLGg5UBE6WLrIQ65hrj1Q0sXWrQ6XTaSVnsH68Q9w3LyMjU7pPM0
	KCILBg1mHlgVx66wWZEan68XUKgXpHz/Tgxu0li/Ciq360nqYbh7dJm2/U+sz1UwQVZCjFk/qiFSL
	GamhXrNrSebiWUM05H2P8XOFtoYh0eIiDx6BPRR5NnpTgtce+zvDgQIijQaEUDDPwfEADMe0Otlbs
	YUpZQTvkALOxl77aF+9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2DZo-0000000AI4y-0LCj;
	Wed, 01 May 2024 17:17:04 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2DZk-0000000AI2Y-1MEM
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 17:17:01 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-51ef64d04b1so345662e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 10:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714583815; x=1715188615; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MOHqyTk2nsRZy88pDJJ/quBzrqb3UUPa7Yn14ZhLib4=;
        b=TW/OW0iwtuFnQesi+BVgZorYtOJ+7/DZNAhNxG2BIjl55pdfhbxb8HPBru8kBbCTey
         Hjbvoi4nWM+cvePYNNCLm3cBgL8t4dd4e7FZdk/sS6jMEsymk007KfcLqy8scsiHFeFz
         NgYWWExgs6xvB6f7sHRIi5amiVNkDE5t4VrJq9ZM+4bgUxAGxx3LDgoeIWm0YY5WKRnq
         4FjMItZUC3x0rF10QbM64tzxbyndBmBCvD1XeemF+S3fniRmxvj1+HptbFagVlh4hAKk
         rOvXFiQ8VLbwl9XkydfYiGnyORN6yk1lQwCYtrlPwLcMeQcyFsV2aUwxrEvqAm7v3vrn
         2bjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714583815; x=1715188615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOHqyTk2nsRZy88pDJJ/quBzrqb3UUPa7Yn14ZhLib4=;
        b=Kksc6fxZ1FF00cEMND/Km3OFAd/8cdrLLhYyufAGTXuW4BgLb9hWT8pvjXLiuIiZZC
         1droQxhvyHbCZExNu6z1z/Jk2J90MdQEGhCiclR4tjnoELcOK5e5ILJc7tC+lab2xhY7
         yBqeGGrWbNCYLHKnARWltGZeb3fWbSW8rB6DweD1NfPeBOK2z2CoqPQ+g2ejBokZw3Hd
         svpcmSJIywFf8ke2Npa9bGgk6R9NEyWbybXnCbrSKgOH0JpQu2+eiy2MGplhsIkAnWD+
         pnrvcWjxhPehY0XV69EuN7oVf+RaOvAmAGz/rcdH91mpWo5DuYi8CV/Dw6PLAohHvCtc
         L3nA==
X-Forwarded-Encrypted: i=1; AJvYcCUVZhNtpKY+Diwr23xDTCZDvW89WxA0V+OD7za+EpygBNFxzMa48+Y1RMuKmlyeM8wKJ3QAOeCtYC6LqpUNsmdgajHO98iNTTtB1FSIObAu
X-Gm-Message-State: AOJu0Yzqhtt+TcgaPdb7aMCi7LX/DK8xIu3EAgPX0rhX+fotiutnwOVv
	q6H5R4TjWu/Fpf/MH04MzP/peOnIInpbykbrsLULBZMHQ0dXD2/DZTJa4ZW1USY=
X-Google-Smtp-Source: AGHT+IGQV4KLhJUah5uwpDXzYUszrhPNSItjqkYS07RJilfCu8tUsg9Dz64nf2enkLVMqtqy/1k75Q==
X-Received: by 2002:a05:6512:12c7:b0:51f:196:d217 with SMTP id p7-20020a05651212c700b0051f0196d217mr197144lfg.63.1714583815158;
        Wed, 01 May 2024 10:16:55 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id t10-20020a192d4a000000b0051d5616c3e1sm1524897lft.231.2024.05.01.10.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 10:16:54 -0700 (PDT)
Date: Wed, 1 May 2024 20:16:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 10/21] pinctrl: st: Use scope based of_node_put() cleanups
Message-ID: <f6aa3a17-90d2-42e3-8c55-639dfcdbf8ca@moroto.mountain>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
 <20240501-pinctrl-cleanup-v1-10-797ceca46e5c@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501-pinctrl-cleanup-v1-10-797ceca46e5c@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_101700_384828_711B50AA 
X-CRM114-Status: GOOD (  10.58  )
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

On Wed, May 01, 2024 at 08:56:08PM +0800, Peng Fan (OSS) wrote:
> @@ -1224,8 +1221,7 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
>  	grp->pin_conf = devm_kcalloc(dev, npins, sizeof(*grp->pin_conf), GFP_KERNEL);
>  
>  	if (!grp->pins || !grp->pin_conf) {
> -		ret = -ENOMEM;
> -		goto out_put_node;
> +		return -ENOMEM;
>  	}

You could delete the curly braces as well.

regards,
dan carpenter



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
