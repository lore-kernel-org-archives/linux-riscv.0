Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41226CE7A91
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 01:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8WndDIeaTPhrAyusQo680ZEzsPoxW88V9NWFI8vXOfk=; b=ngxZ7yqwEuXaOd
	/0Usx9K4KLPsasXypQABGgqjwN+3hjqLAqfpTts9gKJwK6TLm7q4g6QcIh2Pg0pJBx0qZCBtNn9SI
	Pts3YH95n0KrMLyFCDuxBZ/JqTXstGoWgblm1QnP0eZr2edAk/6OFaIqK71F9r0mDLz6J2jO2gLKz
	tkpe7DOUEqVfJx9Zew1PBRZTnUlBmfc7KsmVs9pPiGv/ey6JD+aVCIDd9uxu5CYdG9zwuX8hsBeQJ
	GMrAAHCnIMZsI+fmcg/I+RyZAB7Soj3eUc+5MXOubhwFrAl/6tARZwGymGOZq0V4vGt0SzaIH64Qh
	xRUDA1NnI003JIMrWRTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkZxm-00D3m2-2l;
	Mon, 25 Sep 2023 01:00:38 +0000
Received: from out-193.mta1.migadu.com ([95.215.58.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkZxk-00D3j4-2e
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 01:00:38 +0000
Date: Mon, 25 Sep 2023 10:59:30 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1695603618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WNjNopcEjQfN12kbCSrhwvqbW3WLiiX1nbplJr5QSuY=;
	b=Uy2NbfVfgMCJhxEwf5RUAEi72sP541r0gEtly66WLMFGw+E+GK13+B4eOJO9WBf1kr97pf
	fA8b4PrtfrpEoBBWAM5N4ieLMHYDZgv8sZqx1lJUxBdgEd+puHEvNUOciFuDObBKqqhmHE
	rJwW8j7SfLM+ge56WO2ivx1UcJvlTtf5pE4O0b8mDQiRsGJ/RoPqr5sS8Oui3OZ8YIk7Tt
	+mss1ofxS1mCjnXK7WASDHFdA9bOWMzQB7XCRKqFi6zfjV+o97cFHmrbTqP+yR+zOOXINR
	BLFWywt2VK9Vzz22A3JW5wwVdSL2dmNukowvgN6vflBw2DBKC5f99fVVRMO8Lg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Aleksandr Shubin <privatesub2@gmail.com>
Subject: Re: [PATCH v6 0/3] Add support for Allwinner PWM on D1/T113s/R329
 SoCs
Message-ID: <ZRDbcvhO3Z2G4Elf@titan>
References: <20230824114038.891493-1-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230824114038.891493-1-privatesub2@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_180037_009601_735D4490 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Aug 24, 2023 at 02:40:24PM +0300, Aleksandr Shubin wrote:
> Hi,
> 
> This series adds support for PWM controller on new
> Allwinner's SoCs, such as D1, T113s and R329. The implemented driver
> provides basic functionality for control PWM channels.

I did some more testing of this and it seems to work on my T113, outputting
correct periods and duty cycles.

Tested-by: John Watts <contact@jookia.org>

John.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
