Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F96D4661F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 20:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HgU5CShtlCXgcz+IlAQQ2xBFacZBdR+zRRsD4BBQDQ8=; b=mzZy+cYN2Ymc5B
	55hkAJC8Rud6sVRTmUeZcJ+64IAkGcwQyUSHc5yykH2nnCYuj8Yj6y1oe7g9KeF5bilsOdN5aJdhf
	KkgbzcGY5TD1kHY9H3o6++Bm+PuhzDEJO5phGy8WVv/bwUIDq3/GwlZk6ydkhHO9kkRfuiligdxhC
	gKmA7XF1a+BsVqwo4U3VAfbQm3kHmNrSHcj1lYmKPbIAaP+OxHcatKD5c+Zi7joVuw3qeBk7vuEDN
	shpybi+OoRnKSLO0JIdm3QwA8aMa5oI7qTlqTetSJgBK/AqFddzYX/ZeKUQyciGvdwkQv/5A5SHDO
	QejGur7KnXOQu4HXB8ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgU1i-0000000D8o9-0X17;
	Thu, 15 Jan 2026 20:33:06 +0000
Received: from mail-qk1-f195.google.com ([209.85.222.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8ct-00000001zYV-0e6h
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 09:17:48 +0000
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8b2d6df99c5so285738285a.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 01:17:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950266; x=1768555066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiQ5XxZuQA23XgqzTfwN/M3quzujtTsdQBOQmuJCqAs=;
        b=r7fL52pmCWy3X70STD9I/y9pJPmkNdR1IpuNIHwuiQh5+JbOUpFfCLOAGleys82Y+O
         0zFwJ6QJoLPru1qfgCg42T6q3y6uSZTM1cq9iN4z2nbpcJVxkDN+lAD9DQvhJ6LVqUyR
         8itNKxQSwfhXbseBKhLTFlSSzQf3GBzrcq56Tj8GAdi+hD0I3HCPOEwpzGv3G3dm1Xor
         1nW7y9xfQd4gbzktcSJjVB35mRnHzqW0Nu4QC2cNt42KuvfVmm9czxRGtLuxq4bSvZcW
         2pmer7CQ6y0aHh4il67jdUNcfcZIXemZFPt6ZePT/ARHyELefCi9px3FNVUiI3SueeoE
         XSfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ2y7p4prFh9CMG4zyBFIGCHUgG8yXMPvTZeQPClF2LlwZVRGCL93dG1X457EbWUlbLaRtK040AfkvAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAzpXYBmVjtOM8BBxrka1Q9bFBNfbTdpvUSsNwzKamZZgdd2di
	MtJ2UTV8IAr7RQ+GfNtid0RcG6oU/qoCLWQCGG8TisSothnoUMOb8BX06ar23GHjtI8=
X-Gm-Gg: AY/fxX4f9YweMbHrkiWpvhlrdEDZaQyowsPi8NH36XHFyKiB27UIJmyO8/L2yHS2oXp
	aT3WrU1GtdF+MMp6tQzkYpI059cPhsLyDvk35qaqTEkfYbPSACWVy224pOLhm9rO6eozJOgjF98
	I2hUtw4KwHX7O1DAVXqeGVrqj4c6w7FQhthSD0Oha3E05Eg1D9026rb95YqOoapALsKzvbcnvWp
	YOwOeTs5EFELzpMKPR2ZLB8NoOzwJR/owc8CjqG5M5EghZgJOBE5M3tWKlULCD/Woxmtj677DZb
	5exBd5I43rpcI3S7Bk5tkc39zyPn59r6qUcRNux5vvFMKjprqbZoIjVCE5Yk+GyCt0LYbGXkhWm
	lSQRI7Nf6wtilYA9xykHZh1DP7aOnKe3qoXQ+T1FyUWdqVNGgcJ6U2ywbPFLGOkZ4/Fq+xY8HYf
	zExi8dxPizVw16FBiwEVvrBSAo9aJpU7M8+qd+LSG701Rxv9a7yxGE
X-Google-Smtp-Source: AGHT+IFpCvrGTyPTeCrzPS6NM7m0zVPnqzvSLbAC/S87jg+nJRnz7AmI1zYTfJgefnEIqB25DjiIGQ==
X-Received: by 2002:ac8:7c4e:0:b0:4ed:a6b0:5c14 with SMTP id d75a77b69052e-4ffa84d4aa6mr184968851cf.23.1767950266035;
        Fri, 09 Jan 2026 01:17:46 -0800 (PST)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffb9e97ef2sm39985141cf.10.2026.01.09.01.17.45
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:17:45 -0800 (PST)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8be92e393f8so309134385a.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 01:17:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJp5Sgkp2K167KpHr8qiUmF+OpQE7z7xa7dpsjFgouDeCWDHyIL2fGt1g5UZ+AidezUciYrdrSavV4ZQ==@lists.infradead.org
X-Received: by 2002:a05:6102:2b92:b0:5dd:a0bf:8c89 with SMTP id
 ada2fe7eead31-5ec755c2d49mr4919224137.7.1767949880413; Fri, 09 Jan 2026
 01:11:20 -0800 (PST)
MIME-Version: 1.0
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com> <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 10:11:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV2B9sRmy-k5ucmo6WukvNFq3QqxM0BkB-qS=+-AP4M3Q@mail.gmail.com>
X-Gm-Features: AZwV_QjXHpmtcr0h8pnp_-HCv95C85A8pbrG70DRu5Hp0BWpB8DvCNd7K_eVFa4
Message-ID: <CAMuHMdV2B9sRmy-k5ucmo6WukvNFq3QqxM0BkB-qS=+-AP4M3Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] spi: Drop duplicate of_node assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, Varshini Rajendran <varshini.rajendran@microchip.com>, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sunny Luo <sunny.luo@amlogic.com>, Janne Grunau <j@jannau.net>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, CL Wang <cl634@andestech.com>, Manikandan Muralidharan <manikandan.m@microchip.com>, David Lechner <dlechner@baylibre.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>, Jun Guo <jun.guo@cixtech.com>, Philipp Stanner <phasta@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, Shiji Yang <yangshiji66@outlook.com>, James Clark <james.clark@linaro.org>, Jonathan Marek <jonathan@marek.ca>, Carlos Song <carlos.song@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Huacai Chen <chenhuacai@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>, Sergio Perez Gonzalez <sperezglz@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>, Gabor Juhos <j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>, Rosen Penev <rosenp@gmail.com>, Luis de Arquer <luis.dearquer@inertim.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Longbin Li <looong.bin@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, Alessandro Grassi <alessandro.grassi@mailbox.org>, Chen-Yu Tsai <wens@kernel.org>, Darshan R <rathod.darshan.0896@gmail.com>, Aaron Kling <webgeek1234@gmail.com>, Vishwaroop A <va@nvidia.com>, Haixu Cui <quic_haixcui@quicinc.com>, Darshan Rathod <darshanrathod475@gmail.com>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org, patches@opensource.cirrus.com, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Wanner <ryan.wanner@microchip.com>, Michael Hennerich <michael.hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Kamal Dasu <kamal.dasu@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, William Zhang <william.zhang@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Yang Shen <shenyang39@huawei.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Han Xu <han.xu@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Linus Walleij <linusw@kernel.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Chris Packham <chris.packham@alliedtelesis.co.nz>, Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Li-hao Kuo <lhjeff911@gmail.com>, Masahisa Kojima <masahisa.kojima@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_011747_199530_CDBAE364 
X-CRM114-Status: GOOD (  20.71  )
X-Mailman-Approved-At: Thu, 15 Jan 2026 12:33:02 -0800
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

On Thu, 8 Jan 2026 at 21:30, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> The SPI core provides the default of_node for the controller,
> inherited from the actual (parent) device. No need to repeat it
> in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

>  drivers/spi/spi-rspi.c               | 1 -
>  drivers/spi/spi-sh-hspi.c            | 1 -
>  drivers/spi/spi-sh-msiof.c           | 1 -

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
