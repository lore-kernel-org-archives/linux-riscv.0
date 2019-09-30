Return-Path: <SRS0=Dw+l=XZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD57C35280
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2019 14:32:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56B5F21855
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2019 14:32:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TMHWL+Cq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56B5F21855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d7hU63aT6VS9BQWYXB6/aNu2SJZj9j02GCaiiIvKsOU=; b=TMHWL+CqWyjjKa
	t43rrqxhcUgYfVw7rYzbwkxqWK9tRYdUNFJDC3y07RIWoyaTfutz3bQb+gfNfOOK8N9paRNSSBZFR
	VyWRNxUQy2Qr4a3Iwx8VkSB344U0VHpWkQfDisQh3YVUcGXqvbGVIZKruhGFLOBCuu6TeluFrPxNI
	rnpPdWF4fhbI6Z6SEKkY2wLNp1M83KSMnRiPYglUFgLuCPcpZi0nf/AgR+s3x6vdpDBOwEFKLY5qF
	OUIXNn2ZVobFOLkTpY4bWy6HdfqwRthar2WBbXM4vy4kclamaptra1VfZqWRE5+pI6wNn+StmlzfL
	ulgyZH1Sx8+NcVKSPuFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iEwjN-0005oh-0n; Mon, 30 Sep 2019 14:32:53 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iEwjI-0005mh-Ts; Mon, 30 Sep 2019 14:32:50 +0000
Received: by mail-oi1-f196.google.com with SMTP id k9so11282585oib.7;
 Mon, 30 Sep 2019 07:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kUMYVmu3XMOxDG5rrYQfwaFPZ00CpUb0hbyz3+BbaG0=;
 b=Lf9o40fcYlA/8zr/t3sBOA30YEwf8ywN2f2CJsVJ0pAXKFPACLBWP04hbS3LC5ZDeL
 N4aljkk2ejuLuxkT1FXdg5JkY6sSs01ZhHPirWqyCvt9VoCjRA0k9Bwr30PvHdICfjGH
 INsw4/6t+PQgrP74R7tlYa2o7Tvyr8QaNQS4wclBTVs6rlVy6Tz4/jjVby3/tFch7PF2
 lMJ3C26QQ5+IGC/VfCe1K+uKCSF18v6SG2TahQBh8pOwaHaVVhSJrc8Z41xQxSzEXK4h
 vRmcEaprwOZxF/HPTyfrpbZJjlmtet1kCzp2rli3MxeJ93ETH/lWNeJehX8FYjq9Iy8F
 Nq0Q==
X-Gm-Message-State: APjAAAWLz4JoYdP1Q7nv6jmv95hZXKPEhFGbFqcKS9oihJZqaitdj+IV
 tW0wiLbCQBnHlSOKiX4QAA==
X-Google-Smtp-Source: APXvYqyWWGHweAxd+epg50sMtp2YxM9KH4bIudckXn/jzkB0T25eaocN5L6p2a1h/laqh+KPJMVjkw==
X-Received: by 2002:aca:c792:: with SMTP id
 x140mr18609373oif.132.1569853967784; 
 Mon, 30 Sep 2019 07:32:47 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t82sm4319977oie.12.2019.09.30.07.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 07:32:47 -0700 (PDT)
Date: Mon, 30 Sep 2019 09:32:46 -0500
From: Rob Herring <robh@kernel.org>
To: Claudiu.Beznea@microchip.com
Subject: Re: [PATCH 4/7] dt-bindings: chosen: Add clocksource and clockevent
 selection
Message-ID: <20190930143246.GA19967@bogus>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-5-git-send-email-claudiu.beznea@microchip.com>
 <20190910143231.GB14966@e107533-lin.cambridge.arm.com>
 <ab43b209-78fa-0cab-b8ea-acd4c550e689@microchip.com>
 <20190910150826.GA18308@e107533-lin.cambridge.arm.com>
 <20190910151055.GX21254@piout.net>
 <CACRpkda4mmpbPWa2nD93CvD6HWzcTUDzyyLdQxC2gNB7XiJF3w@mail.gmail.com>
 <a2aca46a-8eb9-d8a8-de42-9850a8a8f44c@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a2aca46a-8eb9-d8a8-de42-9850a8a8f44c@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190930_073248_964476_4CD284B7 
X-CRM114-Status: GOOD (  15.87  )
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
Cc: tmaimon77@gmail.com, linus.walleij@linaro.org, nsekhar@ti.com,
 guoren@kernel.org, linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 khilman@baylibre.com, Ludovic.Desroches@microchip.com, linux-imx@nxp.com,
 u.kleine-koenig@pengutronix.de, uclinux-h8-devel@lists.sourceforge.jp,
 marc.zyngier@arm.com, s.hauer@pengutronix.de, linux-unisoc@lists.infradead.org,
 khalasa@piap.pl, tglx@linutronix.de, sbranden@broadcom.com,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com,
 kernel@pengutronix.de, mark.rutland@arm.com, alexandre.belloni@bootlin.com,
 jhogan@kernel.org, palmer@sifive.com, eric@anholt.net,
 thierry.reding@gmail.com, manivannan.sadhasivam@linaro.org,
 ysato@users.sourceforge.jp, zhang.lyra@gmail.com, daniel.lezcano@linaro.org,
 jonathanh@nvidia.com, bgolaszewski@baylibre.com, kgene@kernel.org,
 alexandre.torgue@st.com, linux-arm-msm@vger.kernel.org, sudeep.holla@arm.com,
 lorenzo.pieralisi@arm.com, john.stultz@linaro.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, baohua@kernel.org, kaloz@openwrt.org,
 sboyd@kernel.org, patrice.chotard@st.com, wahrenst@gmx.net,
 mcoquelin.stm32@gmail.com, narmstrong@baylibre.com,
 linux-tegra@vger.kernel.org, festevam@gmail.com, f.fainelli@gmail.com,
 benjaminfair@google.com, shc_work@mail.ru, krzk@kernel.org, yuenn@google.com,
 wens@csie.org, bcm-kernel-feedback-list@broadcom.com, orsonzhai@gmail.com,
 linux-snps-arc@lists.infradead.org, rjui@broadcom.com, vz@mleia.com,
 john@phrozen.org, tali.perry1@gmail.com, avifishman70@gmail.com,
 venture@google.com, lftan@altera.com, linux-oxnas@groups.io,
 shawnguo@kernel.org, afaerber@suse.de, baruch@tkos.co.il,
 maxime.ripard@bootlin.com, liviu.dudau@arm.com, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux@armlinux.org.uk, agross@kernel.org, slemieux.tyco@gmail.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 linux-mediatek@lists.infradead.org, ssantosh@kernel.org,
 matthias.bgg@gmail.com, monstr@monstr.eu, baolin.wang@linaro.org,
 vgupta@synopsys.com, Nicolas.Ferre@microchip.com, linux@prisktech.co.nz,
 nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Sep 11, 2019 at 07:18:07AM +0000, Claudiu.Beznea@microchip.com wrote:
> 
> 
> On 11.09.2019 03:03, Linus Walleij wrote:
> > External E-Mail
> > 
> > 
> > On Tue, Sep 10, 2019 at 4:11 PM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> >> On 10/09/2019 16:08:26+0100, Sudeep Holla wrote:
> >>> On Tue, Sep 10, 2019 at 02:51:50PM +0000, Claudiu.Beznea@microchip.com wrote:
> > 
> >>> In that case, why can't we identify capability that with the compatibles
> >>> for this timer IP ?
> >>>
> >>> IOW, I don't like the proposal as it's hardware limitation.
> >>
> >> To be clear, bot timers are exactly the same but can't be clocksource
> >> and clockevent at the same time. Why would we have different compatibles
> >> for the exact same IP?
> > 
> > In that case why not just pick the first one you find as clocksource
> > and the second one as clock event? As they all come to the
> > same timer of init function two simple local state variables can
> > solve that:
> > 
> > static bool registered_clocksource;
> > static bool registered_clockevent;
> > 
> > probe(timer) {
> >    if (!registered_clocksource) {
> >        register_clocksource(timer);
> >        registrered_clocksource = true;
> >        return;
> >    }
> >    if (!registered_clockevent) {
> >        register_clockevent(timer);
> >        registered_clockevent = true;
> >        return;
> >    }
> >    pr_info("surplus timer %p\n", timer);
> > }
> > 
> 
> That was also my proposal for the driver I'm sending this series for (see
> [1]) but it has been proposed to implement a mechanism similar to this one
> in this series (see [2] and [3]).

This comes up over and over, and the answer is still no. Either each 
block is identical and doesn't matter which one is used for what or 
there is some h/w difference that you should describe. 

If you want something that would even be considered to put into DT, 
then define something BSD or other OS's could use too. (That's not a 
suggestion to respin this with generalized names.)

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
