Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C5ACA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XebLrXjfuvFvWRCkN4ouGvJ691rhDO7oggajAWcHEYc=; b=0dT1J/XXnW7FLt
	iAuO4ylETmFCXWBJA/ieutj9458gMm/lw+AEvIIxHTfVUq3jMW5bXSlQrU0Mlr2bR/4S7foAaUoFQ
	UqRSNyFTG7FpPzYDHcpQWgEBntRdyef+n4kzbJfFM0OyBLLohgBtQipXrjWh/exk8D5AAvfhpTaG4
	GE8f8ocOLXapMk913zdX7w0pJyLq/SvrJl8vwUg8RmZ6W0l+2a+x5j/pLuvs236dMHhiXe0Heye6d
	F6nCSdeSjk54aMlS2DfzunJUlTsOGbjVu+Oil688BfxDE04TXhWJuk2vkWh/dWkDtklFrT9mtby2R
	D1gBxGu9aC6BGpJM6jVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphlp-00000003yqx-1KBd;
	Sat, 23 Aug 2025 06:30:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRW9-00000002aIq-1DED
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 13:09:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755868156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a26YwWriI/cAZNSFk7MZK1EJDFmLtTh5uMUvUQRBu1c=;
	b=e5JcKPQpMPpiORnmnxJoAeuLPnzAdfa90NM9JK3H273fWWIkszLJ1cdgJfpOAIfErssA3O
	ETkMAbC/gje/pEudqa7HDbMI/IV3Kn8ISjloK2IlvSvWxobn9O+gH6L3UnAKbfVvwryZoN
	Kc2EaAF84ycUCbdFN7fs2NIZDJXV564=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-WdZSO17VN9Kwjm5sWllm3A-1; Fri, 22 Aug 2025 09:09:13 -0400
X-MC-Unique: WdZSO17VN9Kwjm5sWllm3A-1
X-Mimecast-MFC-AGG-ID: WdZSO17VN9Kwjm5sWllm3A_1755868153
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e9fa5f80e7so503709085a.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 Aug 2025 06:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755868152; x=1756472952;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a26YwWriI/cAZNSFk7MZK1EJDFmLtTh5uMUvUQRBu1c=;
        b=A9hfRPt9E6RaXHuHqdd1CcJ1z9aENBQhF8uRDEo88t4HRbXcFcTv207L3sPoKkasoV
         DzvguuQynrb9RWff19E7O/WMnUzB3V74oWMQg413tHB90qDsCOL00NZABA1CPpL9c6IV
         IdI5ZMno5h5Cux7sA2vIhWSUB8fNKETDAFzZE+n+yCVGqU4F+/vt9C04ScKQRpn74ovH
         hdZaU4UNfI45MorWRIKRI1ob6pzxAJTerezwXgmIiNiPrYCfhfHA1XXIQSSf3po0t+ML
         JTkVGAAuVVbvodUGpiLDHqpEWn/XSda4dKDzLdOCeqldxh8I/YtwJdVMLg+CEK/SEVOW
         9c8w==
X-Forwarded-Encrypted: i=1; AJvYcCVcNeqp+AMPbKBft9KExhUempJmgVk7AQORbWI7AsTmLXHN5lbssATBscxbNOtUbC0A0LA7f5K5AKcC1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGF4CqT/U79ZM+4hFrFQVLE0wq2eo4PnFZLilNA13D/LYYZNMI
	CgnDUSJ1yV7c/cdp0Y3Xg8wHoILppc4aMA1f4I9UhL28uTCQyZhn1nY/jyvdKxGzJU85TipnlMe
	p1qyUbeuAD2rKMgKPyxowb9szFmei/ABd2EYZyM+gmda5lZb0hJjyLtqIriKOBnYCxaXYSA==
X-Gm-Gg: ASbGnctBQ4OaZkJ1Y1Kef74t5MDl9x27+dcfwTE/OPLbcHolc8AgaYjDvf9WkzV8bdP
	cDVtfx3qY6KctaP4d3wPfhJGZHRm8cYcXXBu45fq3ZBLVhNtE1u5U8hzHZiJoylfli+IVoZRo+a
	mOK8hEAwiO05RKWGZ4ZmzkLiLPmQ2J+28b+uNBOBIrz9BmyFwnbcserCmzZILuJuNY0vrKqzm69
	CZiWwF96yRP4233u3feWScElPq5ILx+tZZ4opN48JnhsJMWFyOtkWBAORIj6GGKKg5AqNTbUvZ1
	6YVgdG093p49ATBm1VNswGyayl+H6ss4FyGmJP4kAyfkyT9KBhcGg1XCnJf9Jye3mnSeTOEj1WI
	b8oTiJ8O2Vmj8Tc4Equ0=
X-Received: by 2002:a05:620a:6cc2:b0:7e3:6a01:e6ba with SMTP id af79cd13be357-7ea10f538ddmr299223785a.8.1755868152248;
        Fri, 22 Aug 2025 06:09:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW1uvjDvOlgb0eZoGZSzJHV+ZTat1aB9dEJTqNDB/h4VuJNJ3Q109+V4G1CkIe7Ilb4zQPqA==
X-Received: by 2002:a05:620a:6cc2:b0:7e3:6a01:e6ba with SMTP id af79cd13be357-7ea10f538ddmr299210885a.8.1755868151398;
        Fri, 22 Aug 2025 06:09:11 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e1c9b9dsm1332247685a.70.2025.08.22.06.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:09:10 -0700 (PDT)
Date: Fri, 22 Aug 2025 09:09:04 -0400
From: Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
	asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 000/114] clk: convert drivers from deprecated
 round_rate() to determine_rate()
Message-ID: <aKhr8NYhei59At0s@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <1907e1c7-2b15-4729-8497-a7e6f0526366@kernel.org>
 <aKhVVJPEPxCoKKjI@x1>
 <4d31df9e-62c9-4988-9301-2911ff7de229@kernel.org>
MIME-Version: 1.0
In-Reply-To: <4d31df9e-62c9-4988-9301-2911ff7de229@kernel.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: krK6S54yrI9P-COT_jMO6hUYeIS-DY818rmN_iQqMO0_1755868153
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_060917_390643_2C014271 
X-CRM114-Status: GOOD (  21.81  )
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

On Fri, Aug 22, 2025 at 02:23:50PM +0200, Krzysztof Kozlowski wrote:
> On 22/08/2025 13:32, Brian Masney wrote:
> > 7 of the 114 patches in this series needs a v2 with a minor fix. I see
> > several paths forward to merging this. It's ultimately up to Stephen how
> > he wants to proceed.
> > 
> > - I send Stephen a PULL request with all of these patches with the minor
> >   cleanups to the 7 patches. Depending on the timing, Stephen can merge
> >   the other work first, and I deal with cleaning up the merge conflicts.
> >   Or he can if he prefers to instead.
> > 
> > - Stephen applies everyone else's work first to his tree, and then the
> >   good 107 patches in this series. He skips anything that doesn't apply
> >   due to other people's work and I follow up with a smaller series.
> 
> Both cause cross tree merge conflicts. Anyway, please document clearly
> the dependencies between patches.

This series only touches drivers/clk, so it shouldn't cause any issues
with other subsystems, unless there's a topic branch somewhere, or I'm
missing something?

There are some drivers under drivers/clk/ where there is an entry in the
MAINTAINERS file that's not Stephen, although it wasn't clear to me if
all of those people will send PULL requests to Stephen. I described on
the cover how how the series was broken up.

  - Patches 4-70 are for drivers where there is no clk submaintainer
  - Patches 71-110 are for drivers where this is an entry in MAINTAINERS
    (for drivers/clk)

For the clk subdirectories that had say more than 3 patches, I sent
those off as separate patch series. The ones in this series have an
entry in MAINTAINERS only have a few patches for each maintainer.

As for patch dependencies, patches 111 (clk/divider) and
114 (clk/fixed-factor) should go in last. It doesn't matter the order
everything else goes in.

Brian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
