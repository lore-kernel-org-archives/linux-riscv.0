Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CB5C83F27
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 10:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1N8yYhPSXlSXMy2kQkpblSY4C3sj7d+EToXK08qxKr0=; b=dBOxE03WbiDcj0
	PeF0HzMunzYYoUlHP9guauJ8MfPZ5yOShqAB2JvW+j+EOSxkGsKGQlDruaka807e7bG/enTu2ikdq
	zn3Eg+33c2cQRY1j6VYTbRO3Kdcp66KIhGwuX57XD5xMEWRX9zs+YILytqABY+XGyfCG/gQFegJqf
	u9PTvCAiluH8QzgZ3Y17pbDVDQ7UXNE3EJYd1l8fn43JhHiTzNslwUfbRySlPLP0KfGScXFyLZ/0k
	tu7qpmgEVRjF6C5oGviFrB+YeHgRoOdCd5DnfZSD9+rReIZJcUPirS/0iUjqSckdzio8y+pn4vEyl
	ZlzKaQh7YTzwAqS24Xqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAB9-000000029Kh-452a;
	Tue, 22 Jul 2025 10:24:59 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9wK-000000027O6-0yOG
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 10:09:42 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5A42720D77;
	Tue, 22 Jul 2025 12:09:37 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5IZS-10NB0S; Tue, 22 Jul 2025 12:09:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1753178976; bh=c77M5+AjDGCL+xjZzhin0cl7QZLtfKeuoPcGiiWC2Dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cqeK+berFWewY/R24UqFkJOwkmtREVJwqBwQeUOTVxBn/ydsUG4PZbN3k/Bd8jiPa
	 eqSExBh72YGqJuw+dN6CDwzFivTyXTJpArqUolzDWBlX5jkxX9CqNzGMF8+93Lmo5D
	 0ZWBwqbBQT7cZfsCJIfhNLCph4hBLNFvWshWlRwg3O8PQa/IelDTNkBL5IzQIisswh
	 c/KFKbcHrDslkkU6no5PxUsY2ZNBR2jYAnRGiuz7ApIb1+e9jNrtzaEp8Ka8r5n39O
	 zkMvWni/DJhWRbXQPnmiTpTPsaalSXDnCQzlqPH1IZldD0qIRf0kOkANl4rGI9n96t
	 cYVdg5DFv85cA==
Date: Tue, 22 Jul 2025 10:09:23 +0000
From: Yao Zi <ziyao@disroot.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Alex Elder <elder@riscstar.com>,
	Haylen Chu <heylenay@4d2.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: clock: spacemit: CLK_SSPA_I2S_BCLK
 for SSPA
Message-ID: <aH9jUyzGb53B-aOu@pie>
References: <20250722-k1-clk-i2s-v2-0-2f8edfe3dab4@linux.spacemit.com>
 <20250722-k1-clk-i2s-v2-2-2f8edfe3dab4@linux.spacemit.com>
 <20250722092101-GYB724801@gentoo>
 <B79CAF56E128A7B3+aH9Zb9zNm6y_ovvW@LT-Guozexi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <B79CAF56E128A7B3+aH9Zb9zNm6y_ovvW@LT-Guozexi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_030940_825432_A8989D62 
X-CRM114-Status: GOOD (  24.26  )
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

On Tue, Jul 22, 2025 at 05:27:11PM +0800, Troy Mitchell wrote:
> On Tue, Jul 22, 2025 at 05:21:01PM +0800, Yixun Lan wrote:
> > Hi Troy,
> > 
> > On 15:36 Tue 22 Jul     , Troy Mitchell wrote:
> > > This patch adds macro definitions: SSPAx_I2S_BCLK,
> > this is obvious, so no need to repeat, please add something useful
> > 
> > > to introduce a dummy gate for i2s_bclk.
> >                 ~~~~~~ 'virtual'? if it isn't a real gate clock,
> > 	but I'm not sure it's a good approach to introduce such
> > 	virtual clock if underlying hw doesn't comply with this
> I'll leave this question to others.
> 
> > 
> > > 
> > > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > ---
> > >  include/dt-bindings/clock/spacemit,k1-syscon.h | 114 +++++++++++++------------
> > >  1 file changed, 58 insertions(+), 56 deletions(-)
> > dt-binding patch should always go first
> get it
> 
> > 
> > > 
> > > diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
> > > index 35968ae98246609c889eb4a7d08b4ff7360de53b..6914ccf5be45a1071d5b6eac354cacb67888e00c 100644
> > > --- a/include/dt-bindings/clock/spacemit,k1-syscon.h
> > > +++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
> > > @@ -123,62 +123,64 @@
> > >  #define CLK_TIMERS2		41
> > >  #define CLK_AIB			42
> > >  #define CLK_ONEWIRE		43
> > > -#define CLK_SSPA0		44
> > > -#define CLK_SSPA1		45
> > > -#define CLK_DRO			46
> > > -#define CLK_IR			47
> > > -#define CLK_TSEN		48
> > > -#define CLK_IPC_AP2AUD		49
> > > -#define CLK_CAN0		50
> > > -#define CLK_CAN0_BUS		51
> > > -#define CLK_UART0_BUS		52
> > > -#define CLK_UART2_BUS		53
> > > -#define CLK_UART3_BUS		54
> > > -#define CLK_UART4_BUS		55
> > > -#define CLK_UART5_BUS		56
> > > -#define CLK_UART6_BUS		57
> > > -#define CLK_UART7_BUS		58
> > > -#define CLK_UART8_BUS		59
> > > -#define CLK_UART9_BUS		60
> > > -#define CLK_GPIO_BUS		61
> > > -#define CLK_PWM0_BUS		62
> > > -#define CLK_PWM1_BUS		63
> > > -#define CLK_PWM2_BUS		64
> > > -#define CLK_PWM3_BUS		65
> > > -#define CLK_PWM4_BUS		66
> > > -#define CLK_PWM5_BUS		67
> > > -#define CLK_PWM6_BUS		68
> > > -#define CLK_PWM7_BUS		69
> > > -#define CLK_PWM8_BUS		70
> > > -#define CLK_PWM9_BUS		71
> > > -#define CLK_PWM10_BUS		72
> > > -#define CLK_PWM11_BUS		73
> > > -#define CLK_PWM12_BUS		74
> > > -#define CLK_PWM13_BUS		75
> > > -#define CLK_PWM14_BUS		76
> > > -#define CLK_PWM15_BUS		77
> > > -#define CLK_PWM16_BUS		78
> > > -#define CLK_PWM17_BUS		79
> > > -#define CLK_PWM18_BUS		80
> > > -#define CLK_PWM19_BUS		81
> > > -#define CLK_SSP3_BUS		82
> > > -#define CLK_RTC_BUS		83
> > > -#define CLK_TWSI0_BUS		84
> > > -#define CLK_TWSI1_BUS		85
> > > -#define CLK_TWSI2_BUS		86
> > > -#define CLK_TWSI4_BUS		87
> > > -#define CLK_TWSI5_BUS		88
> > > -#define CLK_TWSI6_BUS		89
> > > -#define CLK_TWSI7_BUS		90
> > > -#define CLK_TWSI8_BUS		91
> > > -#define CLK_TIMERS1_BUS		92
> > > -#define CLK_TIMERS2_BUS		93
> > > -#define CLK_AIB_BUS		94
> > > -#define CLK_ONEWIRE_BUS		95
> > > -#define CLK_SSPA0_BUS		96
> > > -#define CLK_SSPA1_BUS		97
> > > -#define CLK_TSEN_BUS		98
> > > -#define CLK_IPC_AP2AUD_BUS	99
> > > +#define CLK_SSPA0_I2S_BCLK	44
> > > +#define CLK_SSPA1_I2S_BCLK	45
> > just append the clock at the end, instead of doing massive renaming
> The c file is written in the same order as the h file,
> and I don't want to disrupt this order..
> 
> So should I keep this style or just append at the end?

This isn't only a style issue. This patch breaks devicetree ABI, old
devicetree won't work with the change. Please don't modify existing
definitions but only add new ones.

>                 - Troy
> > 
> > > +#define CLK_SSPA0		46
> > > +#define CLK_SSPA1		47
> > > +#define CLK_DRO			48

Regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
