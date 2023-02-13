Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235C9C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 10:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zxmquo+c6HwUSbehInR7GHJ1jXTBLenR63uPypIqf/0=; b=nMcR0dbr9Ate7LD0FOJpKwB36t
	ZrolUrWGE7bSfb0CZ0rulwdbF5imEcDY4NZXBoPzcacDzpZax+HEjv262jYsH004fm71R3CtFsoA9
	r46NQ9U29lRi0fz1YEp8tqqDx+4zqGlZYuIf+I5By/axVO+5CLsHO8O9lHv58phUznir+eFzcuYLX
	/QyjxRELe0uXGgdubS4gDLPvMD8SyEHDsyTalvMy5JoeuxQoT591q4ByU88aot4EziEHmuYiGQQ1F
	t+9MxbQN86KAHOrzNvxhpyHvXbo6Q64a4wYSqdEGJMITHJvGcgY2kLQr7/4HfD8ieVJfY5hku9wK4
	5nAj5QeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRVkx-00E28T-8e; Mon, 13 Feb 2023 10:08:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRVkt-00E26N-Fo
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 10:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676282895; x=1707818895;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8IEvyvdzF4hdku/PoXA4dO4yeE7VYSBZGT6sDoFGFCc=;
  b=0soJmwBK+DSb/3v3crtPePmtIIIWeBI8pZuLDhTy+4aqul6UUKQoOEN1
   7SZWkKT2CCEGUQ6T3QPSoFQX2r/Bfqy2oRAwb5fJWmQ1WFbKoeZ4R/Oaz
   J5mJGuomULke5sGFLWu7ohlU5sJgQrvQCsBISNynUKkcu4GzUtgWbT/G1
   CIR2iloUT/dXm/iumbtyuvLJAooxXi/WpliKmIK6ziT8mJ0OCluE4GeZb
   Sastz3zC1fHDsXHGN3PnHNgApdJz2QcRp1oOwm5vljP2RCKOuYpAzmV9x
   19LiNpx3m5T/B5gukENCNfU31WRlU/pNmds8MdngnxJgq7BRaXIK6FV6l
   A==;
X-IronPort-AV: E=Sophos;i="5.97,293,1669100400"; 
   d="asc'?scan'208";a="136861283"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Feb 2023 03:08:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 13 Feb 2023 03:08:07 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 13 Feb 2023 03:08:04 -0700
Date: Mon, 13 Feb 2023 10:07:38 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Hal Feng <hal.feng@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 6/7] riscv: dts: starfive: Add initial StarFive JH7110
 device tree
Message-ID: <Y+oL6l5LzUyAzOgC@wendy>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-7-hal.feng@starfivetech.com>
 <Y6zHy9oL4xzl+6Rd@spud>
 <c507e0b2-5ca3-cffe-55d2-873ed8c24e3d@starfivetech.com>
 <Y9og8Q2UnJ452KH/@wendy>
 <df6755ed-a358-ea01-d89e-f3c004b9c297@starfivetech.com>
 <Y9wR7Up+iObw5qoE@spud>
 <Y+TU98PLIvtkD8/R@wendy>
 <e1d2646e-b5de-298e-bb91-19ad12fd31af@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <e1d2646e-b5de-298e-bb91-19ad12fd31af@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_020815_657186_DC63323D 
X-CRM114-Status: GOOD (  29.85  )
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
Content-Type: multipart/mixed; boundary="===============7840601688433837723=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7840601688433837723==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rhM8DKzjf3f6ScnN"
Content-Disposition: inline

--rhM8DKzjf3f6ScnN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2023 at 05:41:02PM +0800, Hal Feng wrote:
> On Thu, 9 Feb 2023 11:11:51 +0000, Conor Dooley wrote:
> > On Thu, Feb 02, 2023 at 07:41:33PM +0000, Conor Dooley wrote:
> >> On Fri, Feb 03, 2023 at 02:56:41AM +0800, Hal Feng wrote:
> >> > On Wed, 1 Feb 2023 08:21:05 +0000, Conor Dooley wrote:
> >> > > On Wed, Feb 01, 2023 at 03:21:48PM +0800, Hal Feng wrote:
> >> > >> On Wed, 28 Dec 2022 22:48:43 +0000, Conor Dooley wrote:
> >> > >> > On Tue, Dec 20, 2022 at 09:12:46AM +0800, Hal Feng wrote:
> >=20
> >> FWIW, the deadline for getting material in for v6.3 has already passed,
> >> so you can send the next version of this series without waiting for
> >> clarification on the compatibles & ISA string. We should have plenty of
> >> time to get those fixed up before the series gets applied.
> >=20
> > Also, as it looks like the pinctrl driver is going to land in time for
> > v6.3, that leaves just this series and the clock driver required for
> > base support.
> >=20
> > In the original submission, you sent the clock driver and dt in the same
> > series & I think it might make the process a bit faster if you sent them
> > both together for the next version again.
> >=20
> > That way, both the drivers and dts can go together as their have an
> > inter dependence.
> >=20
> > That's my opinion anyway, will make trying to sequence things between
> > trees easier.
>=20
> Good idea. But how can I write the change log if we do so? Will it make
> the history confused? Thanks.

I'm not sure what you mean w.r.t. history.
Both series are on V3 I think, so just make the next version v4 title it
something like "Basic clock, reset & dt support..."
For the changelogs, just mention you merged the two series again in
the cover letter & add the changelogs that you would have made for each
series to the cover as a single changelog.
Say somewhere in the cover that I suggested merging the series together
so that they could go via the same tree as the dt-binding headers are
required by both driver & devicetree.

Cheers,
Conor.


--rhM8DKzjf3f6ScnN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+oL3gAKCRB4tDGHoIJi
0jbRAP95x2zkUZvFw1YCpEFVOqhQvRxMiQEwlNUJ+z3xrb49yQD7B9nLpAXoI2ju
wALK/sIo2qLLAsfeQJjfMgK1AvXYQQc=
=64kU
-----END PGP SIGNATURE-----

--rhM8DKzjf3f6ScnN--


--===============7840601688433837723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7840601688433837723==--

