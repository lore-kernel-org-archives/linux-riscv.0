Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D14E606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZcK+PWoo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=chWayecA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kBZNU1/HzC5t4ILTI0K57Y7AZS09qN494S9104LAhv8=; b=ZcK+PWooskpBsPhkFgnlWJKWth
	q73RiXygBpKJv2mno7vI9qGlWz1ObUDBw/yJgQZifwHV1ZV6dgHRFbV+LZGgg7sqI0LW//89XM5ck
	JCdM/ZvWJphlrwyCgHRBk7SykRENo5/6npGgsgT4GZmj394pSjQounIyZC3HDOAuSf6BXNAMwKCK/
	u+7DUY0Nyn3CPzo6B/sFcSNGT4+6BMlJXIkhbOlyJUWMuw26yZjLsU5AgO7MQAOknKSleXo4LP4zW
	wMBFue4cr+kXaGYfIXhizGimbIaq99n6t3kxnF8aLmxQpJD20Aex+2HVYe/AXxJAbK7I9lyuviHZM
	nwT7ZEag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFJt-000000052z2-2T0r;
	Tue, 17 Nov 2026 09:17:41 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFJT-000000052xU-31zP
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 09:17:40 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D9B082010F9;
	Tue, 17 Nov 2026 10:17:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794907032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k9mD4d+6c6e9/oQ4Pzb2k3qI5yqg28FGpyq/0WXhWNs=;
	b=chWayecAi761d/qTajeLnDr8F4kqev3ZHMeFzu8gqUI/mklE4f4fBFC2YZ1QrKsJYW7NRO
	l/Qu+E3MbNjUFZr6T+exMUJBRwoLcCaXj/aPbr+Drk+LKCKlQe9DJHUzqakiHj+J5+SLwX
	iK669IpRLB0qevJQ22Wk5E9TTArf6nDNqTCOglwuzLaYq4gRB3sp3ZtyCCCj9zkhbri0k6
	P69Kg/IMsNChB1MhIBAjnrftXEo8PIfj3gT02gaoOCCUqFd9NS2rmYduGdivTGlOJRKLOB
	LydMaVl5pVrt9iHrKxFViPN+KMzOXnqdMhlkQTeVf2Bqp88/RG+rM8Z3yIBdYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794907032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k9mD4d+6c6e9/oQ4Pzb2k3qI5yqg28FGpyq/0WXhWNs=;
	b=cfu4B6QbQ8M/XuEjrajuGubsHXfuJKjqNkbmH53hsr5AgWu/CqfzM227YpnJvC7XNZsw4I
	mNWsvYhcQnnfi2BEjOypMdG2J+7MclgrVLn0nixcbx8ZjQOpNvYMIq8fbuXPo4sAzgWZR/
	qgjCz2JxVB/oeBxcZzg699rqeEd/tZ1FXgGTIsbt3Ft4nmRMQFtHWqTES/nj3t3iZo9v8u
	t20nDUw09UnkoPJVf84jLESWCcIP0r1bnWUXeuOt6RO/OTLMY0e96uLWNYka2HhLqqga58
	liA1T6U734kx/xfl6eE6vyVKVJ0LyMrL4Bdjbh90T0wc2BRrDYkXB9xPZGFH+Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794907032; a=rsa-sha256;
	cv=none;
	b=PSzNgg8HJ/BDAI/32V8IDWV82XEzb1aT4jFAzF/UuvBrLVjekLFUz9h4nPSR3wWPG9Gn8l
	3O0aSA9W6IHOPXqjYRxKctiSS00phHkmGf088elT1+Wpb3nwDWBv+shRpd89RNBrLVHgAb
	ed/jun/qQC1X44lu2bOgTpBWuKjEDzSrsmxTnnCgCkXeTv01W23V0N+QSbCCa0vKwdP52d
	mFI5SttflO34wR8RuGWTptEI+dWrx9miesaqVoNxeDmVr896hHjy//SlQILAEZ4++a9S+U
	+qRCMh+40/8jphc9vJ91iyWzaKPVOHQB9m7cTXbzGGMxc5FGzpcUbrizTWQz4A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <f1b6889a4200720b91296168815533876c907674.camel@pengutronix.de>
Subject: Re: [PATCH v1 2/6] clk: starfive: jh71x0: Move reset controller
 registration to jh71x0 common code
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 "linux-clk@vger.kernel.org"	 <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org"	 <linux-riscv@lists.infradead.org>, Hal
 Feng <hal.feng@starfivetech.com>,  Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 17 Nov 2026 10:17:12 +0100
In-Reply-To: <ZQ4PR01MB12027C86A7EC92969661032CF27B2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
	 <20261013102707.9207-3-changhuang.liang@starfivetech.com>
	 <179475230833.3873592.13070196353304136001.b4-review@b4>
	 <ZQ4PR01MB12027C86A7EC92969661032CF27B2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_011715_917716_D67233F0 
X-CRM114-Status: GOOD (  30.76  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Changhuang,

On Di, 2026-11-17 at 01:23 +0000, Changhuang Liang wrote:
> Hi, Philipp
> 
> > > jh7110_reset_controller_register() is only tied to the JH7110 system
> > > clock driver by its location. Its logic is generic: hand the CRG
> > > register base to the reset driver through an auxiliary device.
> > > 
> > > Move it to clk-starfive-jh71x0.c as jh71x0_reset_controller_register()
> > > so that the clock drivers of other StarFive SoCs can reuse it, and
> > > make
> > > CLK_STARFIVE_JH71X0 select AUXILIARY_BUS accordingly.
> > > 
> > > While at it, replace the open-coded auxiliary device allocation, init,
> > > add and release handling with devm_auxiliary_device_create(), which
> > > already implements all of it. The register base is now passed to the
> > > reset driver as platform data of the auxiliary device, so struct
> > > jh71x0_reset_adev and the embedded auxiliary device go away.
> > > 
> > > The auxiliary device ID is dropped: every CRG already uses a distinct
> > > auxiliary device name, so the ID is not needed to keep the device
> > > names unique, and it is always 0 now.
> > > 
> > > Since the helper now lives in clk-starfive-jh71x0.c, the auxiliary
> > > device names are prefixed with "clk_starfive_jh71x0" instead of
> > > "clk_starfive_jh7110_sys". Update the auxiliary_device_id table of the
> > > JH7110 reset driver in the same patch to keep the tree bisectable.
> > > 
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
> > >  drivers/clk/starfive/Kconfig                  |  2 +-
> > >  .../clk/starfive/clk-starfive-jh7110-aon.c    |  2 +-
> > >  .../clk/starfive/clk-starfive-jh7110-isp.c    |  2 +-
> > >  .../clk/starfive/clk-starfive-jh7110-stg.c    |  2 +-
> > >  .../clk/starfive/clk-starfive-jh7110-sys.c    | 59 +------------------
> > >  .../clk/starfive/clk-starfive-jh7110-vout.c   |  2 +-
> > >  drivers/clk/starfive/clk-starfive-jh7110.h    |  4 --
> > >  drivers/clk/starfive/clk-starfive-jh71x0.c    | 24 ++++++++
> > >  drivers/clk/starfive/clk-starfive-jh71x0.h    |  2 +
> > >  .../reset/starfive/reset-starfive-jh7110.c    | 19 +++---
> > >  include/soc/starfive/reset-starfive-jh71x0.h  | 10 ++--
> > >  11 files changed, 45 insertions(+), 83 deletions(-)
> > > 
> > > diff --git a/drivers/clk/starfive/Kconfig
> > > b/drivers/clk/starfive/Kconfig index bd29358ffeec..51716655554f 100644
> > > --- a/drivers/clk/starfive/Kconfig
> > > +++ b/drivers/clk/starfive/Kconfig
> > > @@ -2,6 +2,7 @@
> > > 
> > >  config CLK_STARFIVE_JH71X0
> > >  	bool
> > > +	select AUXILIARY_BUS
> > > 
> > >  config CLK_STARFIVE_JH7100
> > >  	bool "StarFive JH7100 clock support"
> > > @@ -32,7 +33,6 @@ config CLK_STARFIVE_JH7110_PLL  config
> > > CLK_STARFIVE_JH7110_SYS
> > >  	bool "StarFive JH7110 system clock support"
> > >  	depends on ARCH_STARFIVE || COMPILE_TEST
> > > -	select AUXILIARY_BUS
> > >  	select CLK_STARFIVE_JH71X0
> > >  	select RESET_STARFIVE_JH7110 if RESET_CONTROLLER
> > 
> > You've switched to imply for the new controller you are introducing later in
> > this series.
> > You should probably be consistent and align this one too. Not in this change
> > though, it would be unrelated.
> > 
> > This change otherwise looks good to me. It requires Philipp's opinion as it is
> > touching reset too.
> 
> This patch touches the reset subsystem. Could you please take a look
> and give your opinion?

struct jh71x0_reset_adev is misnamed now that it doesn't contain an
auxiliary_device anymore. I'd call it jh71x0_reset_platform_data or
similar. Otherwise,

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
