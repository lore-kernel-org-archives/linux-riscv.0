Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC91FC46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 07:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EsoZFdVEuhDmdzLlLUaA3JguF8d9bFml57YZCi1JCYc=; b=MUEy6KLlRxIOEc
	UPA3eHGsqDOzxuIEoVLVyWMiH89qmwIe3SulWbcXMVoKBGa/mS+L2wyZMfDD+Kjr2B6k4w2MUTQKK
	J8C+j4GxbynOBQNFfsB/Wuf01YdOhVfUbKSwrft9ZalV9Zb3WPJQ9WcMvpW52bphglbf5Vrf/dwhD
	jsyyJImWZFU7G9LlL6SnT+AJd7rwP4HzwivFOGkgoHZrWTn/tCEsiAEA45nBwMTZHF/F4sI0GUDDk
	telw3x/B0vsIV2vEp70KKPTtQNaJBs/HYQfNdioISKPZ2I9FFK/bFXO7Vx+i/ovr1iSMRW04ors1n
	hWgACrZPnL9LgdZEiBlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF9CW-005dGP-31; Tue, 10 Jan 2023 07:37:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF9CS-005dFw-HC
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 07:37:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9F3BE614B0;
	Tue, 10 Jan 2023 07:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F676C433EF;
	Tue, 10 Jan 2023 07:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673336254;
	bh=yyBOKFhrCvYd11DKsv7H9EdXoPHAesnTP8S2RO2fISM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=V63Eu2pOQj2CNEJEp7UxZxAmbxUNKrHlTIeriGOqqdUZbZPdzgD5kz078zJkTycPs
	 VMc8vDYmBzyjQVGnzZj4W0Lkzd14+vcOVAMCwIewgcrXG1MDaeF1YZH2wEZGp7RTlB
	 wuYYTo/+oSKYpFJM1Jww1QxPboFpc85nU6IjecaT4ifVGWWe/lYyB7wIsXBH1KHjLr
	 4I8/5suum23hAIwuZJX83JJd0cvWocvrn1t9rdft9Bo12OudKlcLPG2ldOe7N/NuzV
	 qut4qEpX6n46Vxn627A4sy/Y9zA8kxcSiPGFdo7rrBZzWfkHT5ThF1nnvn44Uc019r
	 oj68fsnDJ1j/A==
Date: Tue, 10 Jan 2023 07:37:29 +0000
From: Conor Dooley <conor@kernel.org>
To: JiaJie Ho <jiajie.ho@starfivetech.com>
CC: Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor.dooley@microchip.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: =?US-ASCII?Q?RE=3A_=5BPATCH_v3_3/3=5D_riscv=3A_dts=3A_star?= =?US-ASCII?Q?five=3A_Add_TRNG_node_for_VisionFive_2?=
User-Agent: K-9 Mail for Android
In-Reply-To: <31f6c05b2836450d86560c3efda4abf2@EXMBX168.cuchost.com>
References: <20230109165249.110279-1-jiajie.ho@starfivetech.com> <20230109165249.110279-4-jiajie.ho@starfivetech.com> <Y7xWtFZO/Y7GaYRQ@spud> <31f6c05b2836450d86560c3efda4abf2@EXMBX168.cuchost.com>
Message-ID: <50178BB5-4698-4A52-AD89-7235C3802411@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_233736_689856_8FADA146 
X-CRM114-Status: GOOD (  19.88  )
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



On 10 January 2023 00:59:58 GMT, JiaJie Ho <jiajie.ho@starfivetech.com> wrote:
>
>
>> -----Original Message-----
>> From: Conor Dooley <conor@kernel.org>
>> Sent: 10 January, 2023 2:02 AM
>> To: JiaJie Ho <jiajie.ho@starfivetech.com>
>> Cc: Olivia Mackall <olivia@selenic.com>; Herbert Xu
>> <herbert@gondor.apana.org.au>; Rob Herring <robh+dt@kernel.org>;
>> Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Emil Renner
>> Berthing <kernel@esmil.dk>; Conor Dooley <conor.dooley@microchip.com>;
>> linux-crypto@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-riscv@lists.infradead.org
>> Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: Add TRNG node for VisionFive
>> 2
>> 
>> Hey folks,
>> 
>> On Tue, Jan 10, 2023 at 12:52:49AM +0800, Jia Jie Ho wrote:
>> > Adding StarFive TRNG controller node to VisionFive 2 SoC.
>> >
>> > Co-developed-by: Jenny Zhang <jenny.zhang@starfivetech.com>
>> > Signed-off-by: Jenny Zhang <jenny.zhang@starfivetech.com>
>> > Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
>> > ---
>> >  arch/riscv/boot/dts/starfive/jh7110.dtsi | 10 ++++++++++
>> >  1 file changed, 10 insertions(+)
>> >
>> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> > b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> > index 4ac159d79d66..3c29e0bc6246 100644
>> > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> > @@ -455,5 +455,15 @@ uart5: serial@12020000 {
>> >  			reg-shift = <2>;
>> >  			status = "disabled";
>> >  		};
>> > +
>> > +		rng: rng@1600c000 {
>> > +			compatible = "starfive,jh7110-trng";
>> > +			reg = <0x0 0x1600C000 0x0 0x4000>;
>> > +			clocks = <&stgcrg JH7110_STGCLK_SEC_HCLK>,
>> > +				 <&stgcrg JH7110_STGCLK_SEC_MISCAHB>;
>> 
>> Which clock source is this? I see syscrg and aoncrg in the v3
>> devicetree:
>> https://lore.kernel.org/linux-riscv/20221220011247.35560-7-
>> hal.feng@starfivetech.com/
>> 
>> Have a missed a patchset which adds support for this particular clock
>> controller? At the very least, I don't think one has reached the linux-riscv
>> mailing list.
>> The clock driver patchset only has aoncrg & syscrg:
>> https://lore.kernel.org/linux-riscv/20221220005054.34518-1-
>> hal.feng@starfivetech.com/
>> 
>
>Hi Conor,
>
>Thanks for reviewing the patches.
>Yes, the patch for stg domain hasn't been submitted yet.
>In this case should I drop this patch from the series until the related patches reach the mailing list?

Since it doesn't apply anyway, no harm keeping it IMO.
Having the dts can make it easier, although not in this case, to look at the binding and driver.
Just mention it in the cover letter if/when you send another version.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
