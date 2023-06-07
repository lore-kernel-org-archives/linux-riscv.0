Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1485C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 08:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/fCvVsLMex61h5H4nLQIzO0YzfzILyAXAFBuPKLxfk=; b=YYraWPmZiZcEsv
	hxtg6VFYU5VYKMEtb1Z6IJY5L6ut4taDmCLD0/VMua8XOex89MJu0TBxReZxSiLqHfYMVnHCCNLCd
	ZJxGf5EH8i6ia4jf6aTf5pDSEaBpgPEFsSSFbJKsJ3V9jUMXNGG8SSZlW9XbDG1NVDmFG474anLa+
	71iVykOa7OngK+iMZlxir72cW+I1MuiJ5kmY4nmoVwrADr+aCSIcgyaYf8wMTr7xdNPTdrMLapdT8
	fiBteziRJHI3rcqox2lHNmcS9Kxc/Lg9n1kkSnBE7+i2zSugJZaFsy+4zNuDtuNlSNuc0fCOls5F4
	Xlc3OQdnxPvijhqwJCUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6oiI-005105-2R;
	Wed, 07 Jun 2023 08:40:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6oiG-0050yL-2r
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 08:40:18 +0000
Received: from ip5b412278.dynamic.kabel-deutschland.de ([91.65.34.120] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1q6oi6-0006LM-Ch; Wed, 07 Jun 2023 10:40:06 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>
Cc: Keith Zhao <keith.zhao@starfivetech.com>,
 Shengyu Qu <wiagn233@outlook.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
 Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, Chris Morgan <macromorgan@hotmail.com>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH 1/9] dt-bindings: display: Add yamls for JH7110 display subsystem
Date: Wed, 07 Jun 2023 10:40:04 +0200
Message-ID: <3560873.iIbC2pHGDl@diego>
In-Reply-To: <20230606-geometry-blurb-1f0f07d4bf6a@spud>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <1991848.PYKUYFuaPT@diego> <20230606-geometry-blurb-1f0f07d4bf6a@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_014016_924295_B425E576 
X-CRM114-Status: GOOD (  33.51  )
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

Am Mittwoch, 7. Juni 2023, 00:37:53 CEST schrieb Conor Dooley:
> On Wed, Jun 07, 2023 at 12:22:33AM +0200, Heiko St=FCbner wrote:
> > Am Dienstag, 6. Juni 2023, 20:41:17 CEST schrieb Shengyu Qu:
> > > > On Fri, Jun 02, 2023 at 03:40:35PM +0800, Keith Zhao wrote:
> > > >> Add bindings for JH7110 display subsystem which
> > > >> has a display controller verisilicon dc8200
> > > >> and an HDMI interface.
> =

> > > >> +description:
> > > >> +  The StarFive SoC uses the HDMI signal transmiter based on innos=
ilicon IP
> > > > Is innosilicon the same thing as verisilicon? Also
> > > > s/transmiter/transmitter/, both here and in the title.
> > > =

> > > I think that is not the same, I remember Rockchip has used a HDMI =

> > > transmitter from
> > > =

> > > Innosilicon, and there is a existing driver for that in mainline.
> > =

> > Yep, I think Innosilicon is the company you turn to when you want to sa=
ve
> > a bit of money ;-) . In the bigger SoCs Rockchip most of the time uses
> > Designware hdmi blocks and looking at the history only the rk3036 ever
> > used an Innosilicon block.
> > =

> > Looking at the history, 2016 really was a long time ago :-D.
> > =

> > > So Keith, if that's true, I think it is better to seperate the HDMI =

> > > stuff and reuse existing driver.
> > =

> > I'm not so sure about that - at least from a cursory glance :-) .
> > =

> > The registers do look slightly different and I don't know how much
> > the IP changed between the rk3036-version and the jh7110 version.
> > =

> > At the very least, I know my rk3036 board isn't booting right now, so
> > I can't really provide help for generalizing the rockchip-driver.
> > =

> > At the very least both the binding and driver could drop the "starfive-=
hdmi"
> > and actually use the Innosilicon in the naming somewhere, so that it's
> > clear for future developers :-)
> =

> Seeing "based on" always makes me a little bit nervous to be honest when
> it comes to using a compatible from the IP. Is it the IP? What version
> is it? etc. Perhaps "starfive,jh7110-hdmi" & falling back to some sort
> of "innosilicon,hdmi" would be more future/IP-silliness proof.
> Driver can always be generic & bind against "innosilicon,hdmi" until
> that becomes impossible.


what Connor said makes a lot of sense. Just name the compatible
after the actual implementation - aka "starfive,jh7110-hdmi" .

This is similar to what the rk3036 does with its
"rockchip,rk3036-inno-hdmi". That way you're nicely independent
and future proof.


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
