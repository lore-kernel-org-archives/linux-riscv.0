Return-Path: <SRS0=vGTX=24=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D184C33C9E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2020 10:43:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45A7F2077B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2020 10:43:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="igprsW/5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45A7F2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4PzHqazNjAdApWEC4CjMde+kTl/fdldPAZDRamp4ZXc=; b=igprsW/5Dqm4GWPWa/L28g4G9
	m8eyP2BDDTTAU6C96U+we9/sIC06t7lhOOJPpcH0dGHoN7lDNXxSx+xdYt3Y2akmPUCF6a2zfvb5M
	kqEz/8HChWdz/fLOpeZjyK2uxbuIqxmoOLJVP/46TvWkVAsvs8eNhUBwFRGoVxvxYYVQNCju2NZ0l
	vWgCKoKA6rPATfsPScj3GmFkLlyvDkQyo3uDrN0lcT3nRBcTkWC8tJC9jMAsqeCdmX5GERJf8fBgP
	1BrvIVOk4EYGsIhUElFBZUuNcFSPKRkup+8guwggMx75Ca6P7QXRm0uGObxKWcfi12C1h1OXZZRR9
	BuhBsxF9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iomKE-0000Zs-By; Tue, 07 Jan 2020 10:43:02 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iomJx-0000KX-Kl
 for linux-riscv@lists.infradead.org; Tue, 07 Jan 2020 10:42:48 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1iomJn-0005TW-KM; Tue, 07 Jan 2020 11:42:35 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1iomJm-0004iE-4c; Tue, 07 Jan 2020 11:42:34 +0100
Date: Tue, 7 Jan 2020 11:42:34 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] pwm: Enable compile testing for some of drivers
Message-ID: <20200107104234.wq74fska3szrg4ii@pengutronix.de>
References: <20191230172113.17222-1-krzk@kernel.org>
 <20191230172113.17222-2-krzk@kernel.org>
 <20200107072645.ko247bwhh3ibdu73@pengutronix.de>
 <20200107082539.GA31827@pi3>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200107082539.GA31827@pi3>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_024245_789148_F9786F9C 
X-CRM114-Status: GOOD (  17.87  )
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
Cc: linux-pwm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 kernel@pengutronix.de, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Krzysztof,

On Tue, Jan 07, 2020 at 09:25:39AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Jan 07, 2020 at 08:26:45AM +0100, Uwe Kleine-König wrote:
> > On Mon, Dec 30, 2019 at 06:21:13PM +0100, Krzysztof Kozlowski wrote:
> > > Some of the PWM drivers can be compile tested to increase build
> > > coverage.
> > > 
> > > The Meson PWM driver requires COMMON_CLK dependency.
> > 
> > I'm surprised that there are not more that need this. Is HAVE_CLK not
> > enough?
> 
> Nope. E.g. for alpha architecture, HAVE_CLK is not set and without
> COMMON_CLK:
> 
> drivers/pwm/pwm-meson.o: In function `meson_pwm_init_channels':
> (.text+0x244): undefined reference to `devm_clk_register'

I see. devm_clk_register() only exists in include/linux/clk-provider.h.

> I guess other solution would be to add stubs for few clk functions...
> 
> > Also HAS_IOMEM is a typical requirement, but I tested with an ARCH=um
> > config (which does't have HAS_IOMEM) and they all compile fine.
> 
> Because of !HAS_IOMEM, since some time ARCH=um does not support
> COMPILE_TEST. Therefore HAS_IOMEM dependency is not needed for compile
> testing (and for regular build it is selected by ARCH).

Hehe, I didn't notice because for testing I just dropped the "depends on
..." lines in Kconfig instead of adding "|| COMPILE_TEST" :-) Still they
compile fine on UML.

Ah, since bc083a64b6c0 ("init/Kconfig: make COMPILE_TEST depend on
!UML") == v4.8-rc1~52^2~83 COMPILE_TEST cannot be enabled on UML, but
later 1bcbfbfdeb00 ("um: add dummy ioremap and iounmap functions")
== v4.13-rc1~8^2~6 UM got a dummy implementation. So maybe we could
revert bc083a64b6c0 today? (And if not, a comment about why near the
"depends on !UML" in init/Kconfig would be great.)

Orthogonal to that, I wonder if depending on HAS_IOMEM is right even
though the compile testers won't notice it missing. Or should HAS_IOMEM
be dropped?

> > > @@ -318,7 +319,7 @@ config PWM_MEDIATEK
> > >  
> > >  config PWM_MXS
> > >  	tristate "Freescale MXS PWM support"
> > > -	depends on ARCH_MXS && OF
> > > +	depends on (ARCH_MXS && OF) || COMPILE_TEST
> > >  	select STMP_DEVICE
> > >  	help
> > >  	  Generic PWM framework driver for Freescale MXS.
> > > @@ -328,7 +329,8 @@ config PWM_MXS
> > >  
> > >  config PWM_OMAP_DMTIMER
> > >  	tristate "OMAP Dual-Mode Timer PWM support"
> > > -	depends on OF && ARCH_OMAP && OMAP_DM_TIMER
> > > +	depends on (ARCH_OMAP && OMAP_DM_TIMER) || COMPILE_TEST
> > > +	depends on OF
> > 
> > I'm surprised that OF isn't required for PWM_MXS but is is for
> > PWM_OMAP_DMTIMER. pwm-mxs compiles without CONFIG_OF, didn't test
> > pwm-omap-dmtimer.
> 
> Since some time !OF has all necessary stubs so OF is actually needed
> only for binding, not compiling.

That doesn't explain why you handle PWM_MXS and PWM_OMAP_DMTIMER
differently though.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

