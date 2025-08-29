Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F183FCA0FF0
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 03:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHzq+wdrfJ1ij7I2Chm4clwHkec9tUjVEl+9uc8tM44=; b=oR98BvCOcZ0cDd
	z7za5/TTL4jCBQHMlULG4COw4K07K80/KVcYJV/iT3yagP6pJ6eRdvJUL7dwtCGAWyckCTORDQ/RO
	C/wC6O0kLPSfwGhTmtPjxXIZb1FLtssk6tjtNwxVXGhznRgaBsR8jFLdxLx/6zD65qEbtK78sjgVl
	RK9ukRS6extUkpZWN7yStuYwfhW/ht0KjDCUCHIBP1rZNVglF5hm1AtX784nVTIUKNIWqZuWT2S+y
	JOBLgIgTAx421UvmMvZ1jPDWA2t8zeUSuk0/9jVHprPeLLUvy91UcVbTQr2tKP5d9cpX4AeFFvcQy
	akPQd/0m43jkTiuzvTPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urpxA-00000004Ev7-3yOt;
	Fri, 29 Aug 2025 03:39:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urnHe-00000003uzW-0S6c
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Aug 2025 00:48:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MySjf1dNQ+QFblxbzgcBLucxms+md0OmiOz5lWF0b/w=; b=X9aj+0nRiHwdeNqT8/IKc8ZcAI
	xtfJ/xcsmXOKoj42wt/kpNNMtSZzhfJfFnOlgiji8xopBzovFh2Um9m9Gec9v8NuzgVjexcZ2yDUj
	GdKrTrF8dOPwrWHNxv1temZCYTM/Z9vLwT8VwpZpnOPsEleWOqu662aTrXwMsvjYRGafFM1UanrNr
	ztVjA38uDXJ/5A10/7UEpTZo+2Xn3M7ysKRPLb84SOFZQ0bdhXLcrkW40bLy922YAg3nqXXgpupKj
	IlWzJVPoGn96vEI7kfyDSS1NRUZGUpfLB0x4iK/7+lYGe5pkwwWFeNACVY3RgqykXyPRDU+I4TjNz
	BRv882ZA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urnHa-000000030Yu-2cov
	for linux-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 00:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756428477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MySjf1dNQ+QFblxbzgcBLucxms+md0OmiOz5lWF0b/w=;
	b=eRIyUMrsdAYkfHt4XKCp6uZVcaF8eYVW5PQTWDPnRfcFh/fZ/OCQknkdaU2gTo+kNSqclk
	KzFj050q9fo6aXu7Xs7kbYSaiSI49YudDmWSTgD9iJoxx+XvlV4TYN/0OL56J4V7l+IoYq
	yJFrdmdnuvJZ5NGYRkAj9b78M2tCnOs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756428477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MySjf1dNQ+QFblxbzgcBLucxms+md0OmiOz5lWF0b/w=;
	b=eRIyUMrsdAYkfHt4XKCp6uZVcaF8eYVW5PQTWDPnRfcFh/fZ/OCQknkdaU2gTo+kNSqclk
	KzFj050q9fo6aXu7Xs7kbYSaiSI49YudDmWSTgD9iJoxx+XvlV4TYN/0OL56J4V7l+IoYq
	yJFrdmdnuvJZ5NGYRkAj9b78M2tCnOs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-07FInZF1Oa2rrKXhf_FuBA-1; Thu, 28 Aug 2025 20:47:55 -0400
X-MC-Unique: 07FInZF1Oa2rrKXhf_FuBA-1
X-Mimecast-MFC-AGG-ID: 07FInZF1Oa2rrKXhf_FuBA_1756428474
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e88f379fafso527058185a.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Aug 2025 17:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756428474; x=1757033274;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MySjf1dNQ+QFblxbzgcBLucxms+md0OmiOz5lWF0b/w=;
        b=QCvmOv7hyKLEBLpUBV/cAsGejUcq8uhm6HtuAvbkg1USrFTGfQeJ1N1bgcct9j5lJj
         06ZEHBoE/oe59VmEh9udWpqLdpQHXryfjjkHJZqiUyunqba6Kl36NbMGMp821fkxbXNr
         OkhsEmss6FOM1eoBr3r0qSkrPDklm+MwNt5GlqNNQpAlGTjks7MtHrQTi+PI9lEqLdi5
         N6H9iODBiUgrisDtNp1Jsc4EEL7yxhhockTMB7Unlzi2sP2t35sHWnP9Lo14rUkuvClt
         zBMzaPAsii/y/zl4OF2emrpaTRzlln5xqK6czz1svveWD4SVeoJSeK3UZkz1RwsvRcER
         clXw==
X-Forwarded-Encrypted: i=1; AJvYcCX3Vw+PfeS6Qbxw7qdaP+bhPJiALC3jelESRnw6iwvpjVdM7j34kPeZis5ggsiLrQU53JJ5PwnyaQMxKw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg3rvTnciGo5GZciwMitYyg4XONuLweFerXwZbRufZdHrisRsk
	0c3u/5PWaEBshjQSqqfTHOV/xzBhpFp8OGx722zERRzKlxdmkSaV6Y0eVihqMc38fY0jn4SaKH+
	E/4/gR3V7d3uOxIoDrS0mVjFsjyBcFxsuqZZ4rRtWVMoeZLym934tQiZwkYF+ttmW3DWWiQ==
X-Gm-Gg: ASbGncunCznxPr1PUtKbYNska0a0F3PobPlq+vDP/YF79qwA/p4rK2jWzT0uVQ7GvDd
	rTmEWJTMxhE1atjgPCmkRjlnqmyjpsqtCAfGKWOmqIunGHU+zqK7qUd1tNdc67+cpeYBOw1JSlK
	wksNVtQ0nPnRGZjLvZKrXxSATWLJ9PxJ5cbHWwnaZVHO4SRnUQjDXt5gG64OWLj+8XkmDn+H4UZ
	kX/37+OzOb3v38XLsj0c+lfwjV+qQolKy5/+6Vb5GiHzLKwvNnZr52ekmG5kWFzPBlLuvWj92Ak
	wcJXzfifPj75vH2v5rFL0dG/NN2a6Tju4YF36pYMe9lP4Phdr2VwZB0JvSz5uYrwK41yJRINW+j
	ab9d4NLJCCicasXhinIo=
X-Received: by 2002:a05:620a:408a:b0:7f3:caf0:8412 with SMTP id af79cd13be357-7f3caf08452mr1587635085a.46.1756428474360;
        Thu, 28 Aug 2025 17:47:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjCgf4If/yLnG9xLRPpSvaRiEUxzvfevF39cHGHA+NM0Oih06WQG6xkNf8xHsAsX5EmFe8lQ==
X-Received: by 2002:a05:620a:408a:b0:7f3:caf0:8412 with SMTP id af79cd13be357-7f3caf08452mr1587627285a.46.1756428473789;
        Thu, 28 Aug 2025 17:47:53 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc14754ee8sm80548485a.32.2025.08.28.17.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:47:53 -0700 (PDT)
Date: Thu, 28 Aug 2025 20:47:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
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
	Krzysztof Kozlowski <krzk@kernel.org>,
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
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
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
Message-ID: <aLD4s0sGEaQKD9PQ@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 43dLSctqih75FpuZmk0Lu6whSp_8nfviK9NVJyOHYik_1756428474
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_014759_009845_14F33D2F 
X-CRM114-Status: GOOD (  13.80  )
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

On Mon, Aug 11, 2025 at 11:17:52AM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> various clk drivers using the Coccinelle semantic patch posted below.
> I did a few minor cosmetic cleanups of the code in a few cases.

I posted a v2 patch series with 8 patches from this series that needed a
v2 to:

https://lore.kernel.org/linux-clk/20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com/T/

Sorry I didn't put PATCH v2 in the subject. I noticed as soon as it
started to send.

In summary, it fixes one merge conflict introduced in linux-next, remove
one case of &*, fix a comment, and removes unnecessary space after a
cast on 5 patches.

There are currently 7 patches from this series that's currently in
linux-next (renesas, spacemit, samsung). 

The relevant remaining 99 patches from this series waiting to be merged
can be grabbed with this command:

b4 am --add-link \
	--cherry-pick 1-37,39-47,52-63,65-67,69-89,91-91,94-94,96-96,100-112,114-114 \
	20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com

There's no dependencies with the other series.

Brian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
