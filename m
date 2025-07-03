Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADF4C83F07
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLQQr3qoWLLwO92blUGZetzxJeJtl/ApGcSRGGw//o4=; b=GerEkkStY1mNKp
	mjQhNBioHJOWbqa2y5ivzkM1kIoBk79xpGVoeVWUAU3+aRHIMy33vAQgTgNyctapQAGcm2iUJcqj7
	ZmxYxAz4Wwc78yvZw6cnDilJUCn9ZicDASGFbxw21dOq9j+VRVcTfb5J/Vo4wVxjFe0ua6HjxPQZQ
	pbKP7JDVt9dUMIoHh4hzwWGjHUf7cEOE6YusmawexSyvc6aQTwxOYdAZzL2Ys8fqdP38gN9406oUn
	SWudfss2WeChHf4Y0DnmDuJuVqh2H5muusbXY6N69cIf6FQoKxBcKf8CZqrPt89jdSYg4pyvfiGOQ
	oxthQ015cnCIMd/HEkUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzi-0000000CTPa-0qqh;
	Thu, 03 Jul 2025 20:57:22 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLka-0000000Bns6-1teD
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 15:21:25 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1E8013420E5;
	Thu, 03 Jul 2025 15:21:21 +0000 (UTC)
Date: Thu, 3 Jul 2025 15:21:17 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
	guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/6] reset: spacemit: add K1 reset support
Message-ID: <20250703152117-GYA312388@gentoo>
References: <20250613011139.1201702-1-elder@riscstar.com>
 <20250618111737-GYA157089@gentoo>
 <20250702061717-GYA304216@gentoo>
 <0580d4e254705be3765be168ce17c8a1c2e12f8f.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0580d4e254705be3765be168ce17c8a1c2e12f8f.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_082124_517287_CADA0338 
X-CRM114-Status: GOOD (  27.95  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Philipp,

On 12:14 Wed 02 Jul     , Philipp Zabel wrote:
> On Mi, 2025-07-02 at 06:17 +0000, Yixun Lan wrote:
> > Hi Philipp,
> > =

> > On 11:17 Wed 18 Jun     , Yixun Lan wrote:
> > > Hi ALL,
> > >   As the reset driver going through several review cycles,
> > > it becomes quite calm down now, I'd like to request to merge
> > > it into v6.17, because various drivers (pwm, emac..) will depend
> > > on it, even in the worst case if there is problem, I believe Alex
> > > will help to address..
> > > =

> > > Hi Philipp,
> > >   I'd like to query if you willing to take the reset driver -
> > > patch [5/6] through the reset tree? It sounds more intuitive,
> > > which also will avoid potential conflicts with Kconfig/Makefile..
> > >   I've created a prerequisite immutable tag which could be
> > > shared between clock and reset subsytem. It's tag -
> > > spacemit-reset-deps-for-6.17 at SpacemiT's SoC tree [1], which =

> > > effectively are patches [1-4] of this series.
> > > But, to make your life easy, I've also applied patch [5/6] at tag
> > > spacemit-reset-drv-for-6.17 [2] which has a small macro adjustment
> > > requested by Alex at [3]
> > >   Let me know what you think of this, thanks
> > > =

> > Just want to ping this, what do you want from my side to proceed?
> > =

> > or do you want me to send a more formal Pull-Request for [1],
> > then you can apply patch [5/6] (still need to fix the macro of [3])
> =

> Please send a v12, so that the latest modifications are on the list.
> =

> I'd prefer=A0to either pick patches 1 and 5 from the list, or, if you
> provide a tag with only patch 1 to be pulled into both clk and reset
> trees, to merge that and then pick patch 5.
> =

I will prepare a tag of only patch 1, and leave you to pick patch 5.

So in this way, I can handle the reset - take patch 2-4 via clk tree,
and patch 6 via SoC tree..

I've sent a PR here
 https://lore.kernel.org/all/20250703151823-GYA312602@gentoo/ =


-- =

Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
