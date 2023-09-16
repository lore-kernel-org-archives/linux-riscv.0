Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653F3CD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 15:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xzckqE5CO7cVxwvLEG/1pAm23xBPcdVwKNigHezr/eM=; b=BgQOI+EqasStVr
	yi/qNvS24UiIQ4IujaYmpLaGAY7qS547AJDF9jZwmlIiZIFiPTB6umJzVBJeMWMXw2pO7fRIZ0a79
	DaNanAMprybyqclQqiQdUs6DkLfdj5AwNIkwb3Zjt/Xaf2wg259vIy6hPEsd8T2Njg8TCJdogYxz8
	oXRN90Rtdc7UNm4NpPfbD+eTLg5roPzPSdpMDtsbiyG6xWTSQDwYuMAglrNqAvQLrXPm6XnnVDlw6
	xHP2cFi1sm1E+ipCKlxF2NdNumnweZIilvEeD0FhU/cwm8bZhhJSqMERFdSrQuoYu13YAj+YV2CQT
	LCdOXrYsz5/u5Hp+PSUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiFkJ-00Fhfs-1e;
	Mon, 18 Sep 2023 15:01:07 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhaul-00ClTR-1O;
	Sat, 16 Sep 2023 19:25:13 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1694892303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a8n0XjUZ6thKLzBg4zGbfNoI7edHQdzShat04z4KQ9g=;
	b=1595OreDibrVkdt7HvKfIXGBRdDhpkYF4va8Y5P7THyGu6IKEtBOpeRp+5ix70xySRzy43
	asMvQZecCOmGMWRYcu080G+L9CWyUXq6Ici0UHMCmWNOFiA6J0kEtVZfLTLrvZ/B2J0Oc+
	wDGYuaobj/tfH9xqGfogbuUFtjeQGmKtjsJ1qU43qxM7Pjppc2jZQ32ZjMFlthF2SQaBJj
	O2JwVy7ARL8HzUSjoago9x/w5z5h6ZhUSr40SKlB14BW6OAMzGEzY18YoDWTdX6sLf2nUI
	TP8oLq2rZdl72SNz3pZDP6UC9LErJsogIkFN6HkmJFqBPd5i6OONJrz7mxpLzw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1694892303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a8n0XjUZ6thKLzBg4zGbfNoI7edHQdzShat04z4KQ9g=;
	b=UAIBu/8YLJZNb8MQTJRU7mPKHsPbGztf8IDiPVKNv8oW2oQvlyr/pxxvzQH6JIayVVmAHv
	JW7Glm3VPddLt6AA==
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, Thomas Gleixner
 <tglx@linutronix.de>
Subject: Re: [PATCH tty v1 00/74] serial: wrappers for uart port lock
In-Reply-To: <alpine.DEB.2.21.2309151739290.57368@angie.orcam.me.uk>
References: <20230914183831.587273-1-john.ogness@linutronix.de>
 <alpine.DEB.2.21.2309141959100.57368@angie.orcam.me.uk>
 <87il8b1w3l.ffs@tglx>
 <alpine.DEB.2.21.2309151739290.57368@angie.orcam.me.uk>
Date: Sat, 16 Sep 2023 21:30:54 +0206
Message-ID: <87edixncop.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_122511_777026_B71A4BB1 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 18 Sep 2023 08:01:06 -0700
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Alim Akhtar <alim.akhtar@samsung.com>, linux-stm32@st-md-mailman.stormreply.com, Karol Gugala <kgugala@antmicro.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Hammer Hsieh <hammerh0314@gmail.com>, Jiamei Xie <jiamei.xie@arm.com>, NXP Linux Team <linux-imx@nxp.com>, Vineet Gupta <vgupta@kernel.org>, Thierry Reding <treding@nvidia.com>, Petr Mladek <pmladek@suse.com>, Arend van Spriel <arend.vanspriel@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Nicholas Piggin <npiggin@gmail.com>, linux-unisoc@lists.infradead.org, Andrew Jeffery <andrew@aj.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>, Xiongfeng Wang <wangxiongfeng2@huawei.com>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, delisun <delisun@pateo.com.cn>, Fabio Estevam <festevam@gmail.com>, Ruan Jinjie <ruanjinjie@huawei.com>, Matthew Howell <matthew.howell@sealevel.com>, Jonathan Hunter <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>, Hongyu Xie <xiehongyu1@kylinos.cn>, Tobias Klauser <tklauser@distanz.ch>, Yangtao Li <frank.li@vivo.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org, Michal Simek <michal.simek@amd.com>, Sherry Sun <sherry.sun@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, "David
 S. Miller" <davem@davemloft.net>, Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, Lukas Wunner <lukas@wunner.de>, Sergey Organov <sorganov@gmail.com>, Mukesh Ojha <quic_mojha@quicinc.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, Lino Sanfilippo <l.sanfilippo@kunbus.com>, Tom Rix <trix@redhat.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Al Cooper <alcooperx@gmail.com>, Yuan Can <yuancan@huawei.com>, Isaac True <isaac.true@canonical.com>, linux-tegra@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Mateusz Holenko <mholenko@antmicro.com>, Kevin Cernekee <cernekee@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Joel Stanley <joel@jms.id.au>, Chen-Yu Tsai <wenst@chromium.org>, Ilpo =?utf-8?Q?J?= =?utf-8?Q?=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, linux-snps-arc@lists.infradead.org, Patrice Chotard <patrice.chotard@foss.st.com>, Jacky Huang <ychuang3@nuvoton.com>, Arnd Bergmann <arnd@arndb.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Vladimir Zapolskiy <vz@mleia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>, Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, Timur Tabi <timur@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Konrad Dybcio <konrad.dybcio@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Baruch Siach <baruch@tkos.co.il>, Valentin Caron <valentin.caron@foss.st.com>, Tony Lindgren <tony@atomide.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, sparclinux@vger.kernel.org, Shan-Chun Hung <schung@nuvoton.com>, linux-riscv@lists.infradead.org, Marek Vasut <marex@denx.de>, Lech Perczak <lech.perczak@camlingroup.com>, Russell King <linux@armlinux.org.uk>, Nick Hu <nick.hu@sifive.com>, Andy Gross <agross@kernel.org>, linux-serial@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Johan Hovold <johan@kernel.org>, linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, Taichi Sugaya <sugaya.taichi@socionext.com>, Bjorn Andersson <andersson@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Lucas Tanure <tanure@linux.com>, Andrew Davis <afd@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Takao Orito <orito.takao@socionext.com>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2023-09-15, "Maciej W. Rozycki" <macro@orcam.me.uk> wrote:
> Maybe dz.c shouldn't be touched by this series then?

Correct. This series is only wrapping the uart port lock, which dz.c is
not using.

> Though obviously both drivers will have to be eventually adapted for
> the ultimate console rework.

Correct.

Thanks for clarifying how the hardware works.

John

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
