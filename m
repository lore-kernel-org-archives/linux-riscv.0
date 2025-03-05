Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4866C19F32
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 14:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rmFR88t5bKdtQBEAOqJen1azsFt5wumic9fSfuPvYwU=; b=gg5NC3PtVE5jWP
	5gYQTnlbaQhIMX7FW4zP6MFQ33b8fjn29ZMSh+LWxpu6U0r2ChDUPTWeinJJNNM4iMXwkS5UorxO8
	qQxrmpRNsEBuM2Vj4AeFjva144hL5GoLTA4y+CpoYDY0dPguJLaPBw/YEeNucG2roiIR6xMlVh56B
	oQq/txJbEIL2LfyOwm6yJHfXZ4M/djaDI/g2iTkxMfEFkHB16wfvGsHqwqm2TITSs4czysVVqZpKJ
	c4Wn2OnmlD+wnHc98bMIohNSho8fJJGI7a4BA9zGv2xHu7Vs19K//RNl1xe5GGwwEsEH7b2UiO1vK
	BES5iDtEqb7FqBzjndyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tppSw-00000008IQy-1cVG;
	Wed, 05 Mar 2025 14:11:18 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tppS1-00000008IN9-1tNp
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 14:10:22 +0000
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id ABAA3342FB8;
	Wed, 05 Mar 2025 14:10:19 +0000 (UTC)
Date: Wed, 5 Mar 2025 14:10:14 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Troy Mitchell <troymitchell988@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RESEND v5 1/2] dt-bindings: i2c: spacemit: add support
 for K1 SoC
Message-ID: <20250305141014-GYB63227@gentoo>
References: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
 <20250303-k1-i2c-master-v5-1-21dfc7adfe37@gmail.com>
 <20250303093506-GYA58937@gentoo>
 <ab10e069-d9e1-4df7-9454-8b0fc910443d@sifive.com>
 <20250305030540-GYA62563@gentoo>
 <eda41d6d-fa08-413b-8f3c-ce044e171615@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eda41d6d-fa08-413b-8f3c-ce044e171615@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_061021_517651_A3C32622 
X-CRM114-Status: GOOD (  21.64  )
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

Hi Samuel:

On 22:01 Tue 04 Mar     , Samuel Holland wrote:
> On 2025-03-04 9:05 PM, Yixun Lan wrote:
> >>>> +        clocks = <&ccu 176>, <&ccu 90>;
> >>>> +        clock-names = "apb", "twsi";
> >>> 9.1.4.61 TWSI0 CLOCK RESET CONTROL REGISTER(APBC_TWSI0_CLK_RST)
> >>> https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb#part594
> >>> from above docs, there are two clocks 
> >>> bit[1] - FNCLK, TWSI0 Functional Clock Enable/Disable
> >>> bit[0] - APBCLK, TWSI0 APB Bus Clock Enable/Disable
> >>>
> >>> I'd suggest to name it according to the functionality, thus 'func', 'bus'
> >>> clock, not its source.. which would make it more system wide consistent
> >>
> >> Also in that same register is:
> >>
> >> 2	RST	RW	0x1	TWSI0 Reset Generation
> >> This field resets both the APB and functional domain.
> >> - 0: No Reset
> >> - 1: Reset
> >>
> >> Which means you need a 'resets' property in the binding as well.
> >>
> > right, there is reset needed
> > 
> > I'd suggest to add it as an incremental patch later, when we
> > implement real reset driver, and also complete the calling reset
> > consumer API in i2c driver
> > 
> > but, let me know if this is not the right way to go
> 
> If you add the resets property later, that's a breaking change to the DT,
> because existing devicetrees will not have that property. So you would have to
> make the reset consumer in the driver optional, even if it's not really
> optional, to work with older DTs. So it is _possible_ to add incrementally, but
> not recommended because it adds "legacy" code that never really goes away.
> 
Ok, that's fair if we want to keep DT backward compatible..

> It's okay to define the binding as requiring the resets property now, even
> before the reset controller driver is merged. You just won't be able to add the
> I2C controller to the DTS until the reset controller binding is merged. But
> since the reset controller is the same IP block as the clock controller, its
> binding should be available soon anyway.
> 
yes, this should work, thanks
I think we will wait for reset driver

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
