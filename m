Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341DDC41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 08:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HloZAW9w+F0rfBwX+NIy2hVHoUdsH9iiOInNWpyOicM=; b=UQK50z8qQpjGQ5
	IPoieP6d6GySlu5SdTwKk8lQTS+fmLbQb4V2RNeD5f4nR+alZDtFnAsrHOKZ9nuV9uUGoyYP18lZX
	ZpC0ztDTnOXNLilhOid6737KyoOVlJnHjR1bDTAYlVbhxvUttIRlAHrKEoaBZKK1HzCZlj6I0l5L+
	D7uPG/Z2nA2Hwml0Kx1DNybrId/pKBTptVqwES5CbrR3YIx9QsahM6+oj8ExVdhJf1UVsbXLvAaoy
	1dWcaS1g/9y0MIcH4F+dnsVBslTBtm/oNaX8fw9WEbHoOtZMxZZM9ImEiFxieYvqthOZKAv8JyZVt
	awWzqySeiXnmRkObIs7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFVwL-00DNjD-04;
	Tue, 19 Dec 2023 08:59:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFVwI-00DNiJ-1r;
	Tue, 19 Dec 2023 08:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mApDO3T9Xz1helbAZSFet16out2mW7MWySk8mjZ5wDE=; b=kZwHzqjKiWEgoZn1veK4cqHCKR
	SerS327V6zs7qE4E6zPYWmsCCljxHbsbPRP8PnWbjTURrTEHbkjZ8o2iz5NzhD8JA+Ff7VkMuDU7y
	IuyEa1zVHU6FlNhAMzyxTvwbEkuOczsw1MpSllM/sbokb9AG9DcNbi1v0/8T47H9dxsI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rFVvb-003JjA-OP; Tue, 19 Dec 2023 09:58:15 +0100
Date: Tue, 19 Dec 2023 09:58:15 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Samin Guo <samin.guo@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v4 6/9] riscv: dts: starfive: visionfive-v1: Setup
 ethernet phy
Message-ID: <962691a4-993d-44c0-861f-d0fd5bbc2da9@lunn.ch>
References: <20231218214451.2345691-1-cristian.ciocaltea@collabora.com>
 <20231218214451.2345691-7-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231218214451.2345691-7-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_005858_614931_6270F390 
X-CRM114-Status: GOOD (  11.90  )
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

On Mon, Dec 18, 2023 at 11:44:46PM +0200, Cristian Ciocaltea wrote:
> The StarFive VisionFive V1 SBC uses a Motorcomm YT8521 PHY supporting
> RGMII-ID, but requires manual adjustment of the RX internal delay to
> work properly.
> 
> The default RX delay provided by the driver is 1.95 ns, which proves to
> be too high. Applying a 50% reduction seems to mitigate the issue.
> 
> Also note this adjustment is not necessary on BeagleV Starlight SBC,
> which uses a Microchip PHY.  Hence, there is no indication of a
> misbehaviour on the GMAC side, but most likely the issue stems from
> the Motorcomm PHY.
> 
> While at it, drop the redundant gpio include, which is already provided
> by jh7100-common.dtsi.
> 
> Co-developed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
