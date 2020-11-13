Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F27CC388F7
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 07:31:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D880B208D5
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 07:31:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YqE/ftYX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="a07F7osU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D880B208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z7cvYzxeMoo+FoMqEwl4pUkBlUOgwHfeGIl04LPk0k4=; b=YqE/ftYXt37wuWexjU/DMnEFY
	JQ79iy3+Tvop2PN6wMWaldrn4waYBugnODBJSg0sxoQG30tAAzpcypKgSYvq7rGYj/ASRguVE1Rr0
	3U4Wz3nkVRpo3krlI+wR73jMpOxRKK6MEaQ2B/UA/cPJrttjCvTatiYJ47fF0LpMWc9xOmGp95TeR
	TwfRz5jhjXl9CcrV3mp3r+IIA1E1VY4QepjxPgMi3FwYqv7WQqXrouwKplhpTI871FodAqwpgb6hG
	43lqQuRJDg8atY63wdBrCoGqWEh79UucFA7tGwX4sbB63+6dbICmeWoWuh3qBuazxqrJFn/BWzC4J
	yumsMEyXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdTYh-0005fB-5b; Fri, 13 Nov 2020 07:31:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdTYf-0005el-Dy
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 07:31:46 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DAD6B2085B;
 Fri, 13 Nov 2020 07:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605252704;
 bh=IxHFr+O2Qeh2nbz9XeXyx6Xdc9c/exv2Y07r+qrDnTE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=a07F7osUltHrv80bza86dFbbwqa8o6pChOyptgMVnw1icH731bI5MQBphl5ha1WaP
 iNYgD3I7OohPhTAa1j0APFrCMDttT1nZ4bNLswvIkB3LYLTmKp7o97u370vJthEpkn
 u+DwZUMidzSuJMvo1haBpal+J1XvNDWH1ER1uLUk=
MIME-Version: 1.0
In-Reply-To: <20201107081420.60325-9-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-9-damien.lemoal@wdc.com>
Subject: Re: [PATCH 08/32] riscv: Fix kernel time_init()
From: Stephen Boyd <sboyd@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-spi@vger.kernel.org
Date: Thu, 12 Nov 2020 23:31:42 -0800
Message-ID: <160525270249.60232.12874105352298232293@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_023145_571524_F7C47BB0 
X-CRM114-Status: GOOD (  13.08  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Damien Le Moal (2020-11-07 00:13:56)
> If of_clk_init() is not called in time_init(), clock providers defined
> in the system device tree are not initialized, resulting in failures for
> other devices to initialize due to missing clocks.
> Similarly to other architectures and to the default kernel time_init()
> implementation, call of_clk_init() before executing timer_probe() in
> time_init().

Do you have timers that need clks to be running or queryable this early?
This of_clk_init() call is made here when architectures need to call
things like clk_get_rate() to figure out some clk frequency for their
clockevent or clocksource. It is OK to have this call here, I'm just
curious if this is actually necessary vs. delaying it to later.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
