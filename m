Return-Path: <SRS0=5ZKR=FJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23148C4361A
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Dec 2020 05:42:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9572522D2B
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Dec 2020 05:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9572522D2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SMKrMKZV6wO+YfRkjlQPqScFomqlhac39qHB5GujiB4=; b=2nLxnt2V83RvW30qu9E3YqM6c
	FXcpmoWj53ll/makD7KC9W50TkPxFXnNI3VID55/PvFQMkD+/R4xZq0OM47Hoxjjg/7mSav7bqGlC
	jRe3tvOP6DUhGqD8VP/493/0AvUFamBf2XhR8WYs7Kuo414mT/mY6GSrsL482hSIPQ8gZTBKY0wZ7
	GBjhq92x2tV1fssiNo9bHh5NwvgUll5na+wkKxZBYT8AyNVPMkB5GLECoSou/hPbA/G8PdEls/Uax
	Bk/hgIyP7Ls/g+lJqeIJXbZaXmvfCL3P9npbif/n2oXfmQpRRl9dnK4pEOCOiFrKKaUmG4yam5Hln
	fGz9ztVhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klQKJ-0005t0-7s; Sat, 05 Dec 2020 05:41:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klQKH-0005sg-My
 for linux-riscv@lists.infradead.org; Sat, 05 Dec 2020 05:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607146904;
 bh=1UOM3lyrYNIHNQmUwBpCqtJorNVR7n1hPqtb+XM0tww=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=MA1iZSIwjlf5aB6MkgnstF2EhHg1aeaFegQlC4e4IqyTJ8tHBTyJtoEqe3FJfNGNO
 SoMQf7vq05Tx5xLfWgdSSwaD3ApiFcY9gPsK+XuJNoPygGk9Vpf++d8pAQcwyJw+1u
 LmVGJ7d1+A3R5bGrrZ6de9PGw3vEE8rzwzVQJVA/T3gq41guMRt6U2Gd31BEi9CcYo
 DVoue+GnmE1fpqqoTjLy677Z3Pwj1K0bxjdtGFSMlyNHviuxAjU9LZpz77637a2loe
 qjWqNC+dpcfpjacRZ0DU81hayhdA+dd6PJZmMQYTF2skgyLa62kCzoWajT/wx0aS9K
 5YnYBCzJ/X+MQ==
MIME-Version: 1.0
In-Reply-To: <20201202032500.206346-2-damien.lemoal@wdc.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
 <20201202032500.206346-2-damien.lemoal@wdc.com>
Subject: Re: [PATCH v4 01/21] riscv: Fix kernel time_init()
From: Stephen Boyd <sboyd@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Fri, 04 Dec 2020 21:41:43 -0800
Message-ID: <160714690354.1580929.8976634034112573437@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_004145_852096_389339CE 
X-CRM114-Status: UNSURE (   7.29  )
X-CRM114-Notice: Please train this message.
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

Quoting Damien Le Moal (2020-12-01 19:24:40)
> If of_clk_init() is not called in time_init(), clock providers defined
> in the system device tree are not initialized, resulting in failures for
> other devices to initialize due to missing clocks.
> Similarly to other architectures and to the default kernel time_init()
> implementation, call of_clk_init() before executing timer_probe() in
> time_init().
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
