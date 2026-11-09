Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B923F606A322
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 03:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UmvWkTHM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=GMalY5k0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Wh4Kh/v7r5nd3me03LiD0TeGU9zmktXI6wCNCWauyfU=; b=UmvWkTHMUXRqeeMntrmQK395SC
	lQBtMZcyVsJcDe4VpId9UTg6P+ZqnC8XeN4FbbEErWAif29Uwj133tdJsKvsJybBHPppfAR8gypQW
	v//U6FUop/u9mn8nuajuUgmoE/4gvrpWfQ05aSvyDN+PpI1JQ0TPBEMqPxBe2ByMCPRz4t957W4Q8
	lt9WY5nWjs9rIzksTzaFpOu4pP/H0in1oC4PuSfQBjvgJ8Ir3dSOBRhT/J8efDQ9MFK7FnFHPvi9B
	/EZWaQN8AAgAM9nVf1DHTB81AcbzbZzQjB9N0OiQePokL9vYTWY26Cx5l2ccALYn581W4VD96M/QV
	6FPu9j+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGCq-0000000HF9c-19ol;
	Mon, 09 Nov 2026 03:38:04 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGCn-0000000HF91-0mRK
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 03:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1794195460;
	bh=r9ZKzXuZtQWjeq42Wbv24eyX0v+3OyYtV/ft7hHMkhQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GMalY5k0UDK0UJgj4WPBefvGt7gSR1qoGF3Bcu57NvUhYCAnjfq7rF7JFZ5uBBZpT
	 Xoie046+rfwvm5AqLWRz5Iw0j/A6NPzVdLJxJI2Y2kuc6dRXGu4neDmZabJ+w4Sx6L
	 jJu6+RLtvbgieuWeR7fqVxQ63I9EswAqRbrWki0f/7rZfDlWZ4x6xJ3ERgeqAwD4+x
	 lVChlnpQvjkU+mYttBRzEz6Kh/2aMcx2U8kY3gtra/jzFYudTCqT7Kz7mFztnSNWXx
	 A8SQAkMUJ17/83EWtbzkQqD1st/4rF9XD24fev2qy1idrMQ1WlcRqEt8zzkFAAezsF
	 9kdYMLC1Fk08Q==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 88606B221A6B;
	Mon,  9 Nov 2026 04:37:36 +0100 (CET)
Message-ID: <d9f4a750-5f9d-4749-929e-330c8776971e@freeshell.de>
Date: Sun, 8 Nov 2026 19:37:34 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] riscv: dts: starfive: jh7110: Add the RTC node
To: Owen O'Hehir <oo.hehir@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Hal Feng <hal.feng@starfivetech.com>, "ziv.xu" <ziv.xu@starfivetech.com>,
 Conor Dooley <conor@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20261108212826.15890-1-oo.hehir@gmail.com>
 <20261108212826.15890-5-oo.hehir@gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261108212826.15890-5-oo.hehir@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_193801_724668_9ED1ACAA 
X-CRM114-Status: GOOD (  12.33  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Owen,

On 11/8/26 13:28, Owen O'Hehir wrote:
> Tested on a VisionFive 2 v1.3B.
> 
> Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 82ea63f71..14f92b942 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -1206,6 +1206,20 @@ pwrc: power-controller@17030000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		rtc: rtc@17040000 {
> +			compatible = "starfive,jh7110-rtc";
> +			reg = <0x0 0x17040000 0x0 0x10000>;
> +			interrupts = <10>, <11>, <12>;
> +			interrupt-names = "ms-pulse", "sec-pulse", "rtc";
> +			clocks = <&aoncrg JH7110_AONCLK_RTC_APB>,
> +				 <&aoncrg JH7110_AONCLK_RTC_CAL>,
> +				 <&aoncrg JH7110_AONCLK_RTC_32K>;
> +			clock-names = "apb", "cal", "32k";
> +			resets = <&aoncrg JH7110_AONRST_RTC_32K>,
> +				 <&aoncrg JH7110_AONRST_RTC_APB>,
> +				 <&aoncrg JH7110_AONRST_RTC_CAL>;
> +		};
> +
>  		csi2rx: csi@19800000 {
>  			compatible = "starfive,jh7110-csi2rx", "cdns,csi2rx";
>  			reg = <0x0 0x19800000 0x0 0x10000>;

Is status property applicable to SoC rtc? If not, then is 'rtc' label
appropriate when there's no status applicable?

Note that Mars CM / CM-Lite System-on-Modules may be used commonly with
board carriers which implement a battery-backed RTC on the I2C bus, and
so another 'rtc' label may be applicable, something to consider. The
initial Mars CM / CM-Lite dts ignores this because there is an
inconvenient I2C bus device address conflict of the SoM EEPROM and some
carrier boards' RTC, and the SoC RTC driver was not then present;
problems for a future self.

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
