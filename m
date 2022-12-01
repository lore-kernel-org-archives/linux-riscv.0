Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8314C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 18:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7NVCs1rFKKsksxMeHtzHWftS2cJ+ehclWGnFMzuzbzI=; b=pSpjmg3WyHitEG
	PYzp7ly8+z+ZVa6faj4US4JC6m8Wrx/34QvLfoVt6gndz5tE0/AjZ5bL9KHFnQp6PY+3sTWNyfOFH
	K57DOvB5ezFxpZ9LCsDnp0mjSwQlImLMegSYxFU3XqCFIuVXp3da8u/Ta5rke9N/blmA+LRSwpS8F
	jWMTJQNHqZaEm3J4UeTGRMh5j0S2Yy4rTsZSIKoCeZJxxG3ey2hGiaxhsWnzwQrPshro07bqvd/DE
	ZJi/aRbvYHSlEBQaqcunlvNqYZwNxrZKUmoocHjAQ61EKF6Z99RCCr+BaPoH9xhxhOjE9YxN7R/lR
	H53RSJDV8YxqR9JudfmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0nwG-009RAX-BZ; Thu, 01 Dec 2022 18:05:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0nuu-009QMS-0c
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 18:04:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6DDA1B81F77;
	Thu,  1 Dec 2022 18:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5CB5C433D6;
	Thu,  1 Dec 2022 18:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669917849;
	bh=WZatvnz+QOr1Ir2g+HfL56qhA6VFEJRpPV2/ZJbog/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t1GcIvhsLwG8OflIApxBP0BGhBjbKkxusBOBYU+eUci5BagGExkIaqsOJqYVlqbjW
	 hMZmt/iuKfySH6DWl4Fxv1HmAW3OPZD0xp0wSUvRX91a5HMxzO/cca+oHFA+bt4BS/
	 jtZRslsgJHsLIDVChwFIthKxhyVdIam8a/qYl9kt9ysUTYlVG+PuXb0k8pk+dbjYHn
	 vsZ/5sXusz+2b6ERv8t76MbqIn/88cQPHYOOzAKk101TvcvYU44QDy++9mT+4pVpk+
	 GF7Kmo1fBfNtsMh5BJ9haY8U6FOaQtGip58H9iMjVHBfZvgEXop0w+xG44IyLXOgVW
	 JYq07JRXWF59g==
Date: Thu, 1 Dec 2022 18:04:04 +0000
From: Conor Dooley <conor@kernel.org>
To: JiaJie Ho <jiajie.ho@starfivetech.com>
Cc: "Conor.Dooley@microchip.com" <Conor.Dooley@microchip.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"kernel@esmil.dk" <kernel@esmil.dk>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 6/6] riscv: dts: starfive: Add crypto and DMA node for
 VisionFive 2
Message-ID: <Y4jslJfTVtQ9cIGm@spud>
References: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
 <20221130055214.2416888-7-jiajie.ho@starfivetech.com>
 <1673ef8b-179e-3b03-b3f8-8d347c70d8c3@microchip.com>
 <4ddddceba3dc437daca27374dd2f6fd7@EXMBX068.cuchost.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ddddceba3dc437daca27374dd2f6fd7@EXMBX068.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_100412_498256_38C6CD81 
X-CRM114-Status: GOOD (  22.07  )
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

On Thu, Dec 01, 2022 at 06:17:26AM +0000, JiaJie Ho wrote:
> > -----Original Message-----
> > From: Conor.Dooley@microchip.com <Conor.Dooley@microchip.com>

> > Hey Jia Jie Ho,
> > 
> > On 30/11/2022 05:52, Jia Jie Ho wrote:
> > > [You don't often get email from jiajie.ho@starfivetech.com. Learn why
> > > this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > >
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you know
> > > the content is safe
> > >
> > > Adding StarFive crypto IP and DMA controller node to VisionFive 2 SoC.
> > >
> > > Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> > > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> > 
> > Out of curiosity, what was Huan Feng's contribution to this patch?
> > Did they co-develop it, or is there some other reason?
> > 
> Hi Conor, 
> Yes, Huan Feng co-developed this driver.

In that case, the SoB block should look like:

Co-developed-by: Huan Feng <huan.feng@starfivetech.com>
Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>

Similarly for any other patches they may have co-developed :)

> > >
> > > diff --git
> > > a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> > > b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> > > index 450e920236a5..da2aa4d597f3 100644
> > > --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> > > +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> > > @@ -115,3 +115,11 @@ &tdm_ext {
> > >   &mclk_ext {
> > >          clock-frequency = <49152000>;
> > >   };
> > > +
> > > +&sec_dma {
> > > +       status = "okay";
> > > +};
> > > +
> > > +&crypto {
> > > +       status = "okay";
> > > +};
> > 
> > In what scenario would you not want to have these enabled?

> These drivers are always enabled.
> Is everything ok with the dts node entries?

If the hardware is always present, why not drop the "disabled" in
jh7110.dtsi & these two entries marking them as "okay" in the .dts?

> > > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > > b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > > index 4ac159d79d66..745a5650882c 100644
> > > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > > @@ -455,5 +455,41 @@ uart5: serial@12020000 {
> > >                          reg-shift = <2>;
> > >                          status = "disabled";
> > >                  };
> > > +
> > > +               sec_dma: sec_dma@16008000 {

> > > +                       status = "disabled";

> > > +               };
> > > +
> > > +               crypto: crypto@16000000 {

> > > +                       status = "disabled";

> > > +               };
> > >          };
> > >   };

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
