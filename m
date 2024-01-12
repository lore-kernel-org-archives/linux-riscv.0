Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5902BC4707C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 07:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YhHSaKGjxuGGj5D6PHuB25OlgZFqXQflkNSseMmg9sg=; b=Jy2GoGhhJOZtAR++YpUqO+7yWa
	y8/Pk/aPNOgBIN4VmGby/B/cTDR+yOkGnCVNdLyF/qa5+mBVROg70uRnzuv8FxqXtErmgaz0kLpR5
	/NJQMFfAmoGxNO9WybzjFx7/3i7eDUbS0tGcC/nwcZA83h/ui/IM20iFbO8K8dpCnyuISHzhf52mo
	elst9gE/mcvv0/yzlCvD3FcjTvg7dFyADLkL/KG8BdVxzlxKfI0fGnuPk+BCfVg06W9g4kdRsvpz/
	57fYcUNhqbJkom4pP3K6O8GKxFae8bU+jWChGwB+4HybyohXc8Ej+4NsA4d4cF0QmwUPUhaEfW38H
	OHlX91ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOCCH-00279o-0I;
	Fri, 12 Jan 2024 07:43:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOCCE-00278y-1q
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 07:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1705045398; x=1736581398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1T3tgkH4iijZDYGTTzAf0IpYzhHY6enp+pqFzjuGwdw=;
  b=JU4mTdVn0RUJEDAydYu+pqu5ac+ukXYPkZyxY4GJ6oyfUpShhwjaZJxn
   QL8IRJ2ooXOyD19YahWatFBoY9Kz/1arseLhptCEZI4a7rqcxMeE8Ae1e
   FRQHBzYEPrEYJ7Rwjx4e4OX769Rbf+hPTg0B3hTxxs/XIcD3x89ixQ6fL
   E2aU1o/1r7yOvqDcBtbLxJ2yr1OI9fMLhttxscNOeIAobwK00bL7xROw0
   DM7WoTydpQ6FG1EFpvsrTMhxX52S1JnbS6nDbgA50vE164DEXEOvzfXH2
   2hQEKHK6QPC8gP8FEgRN27AbcmAEuZ4s3UiGWsHyoCH3lxkC/V3+e2eVh
   A==;
X-CSE-ConnectionGUID: tOc90VrxTfqk6wus7ohuMw==
X-CSE-MsgGUID: sHvIQsA7RM2ZtlC6VGTG9w==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600"; 
   d="asc'?scan'208";a="15111438"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Jan 2024 00:43:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 00:42:53 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 12 Jan 2024 00:42:49 -0700
Date: Fri, 12 Jan 2024 07:42:14 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Wang <unicorn_wang@outlook.com>
CC: Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Chen Wang <unicornxw@gmail.com>,
	<aou@eecs.berkeley.edu>, <chao.wei@sophgo.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <mturquette@baylibre.com>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <richardcochran@gmail.com>,
	<robh+dt@kernel.org>, <sboyd@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <haijiao.liu@sophgo.com>,
	<xiaoguang.xing@sophgo.com>, <guoren@kernel.org>, <jszhang@kernel.org>,
	<inochiama@outlook.com>, <samuel.holland@sifive.com>
Subject: Re: [PATCH v7 2/4] dt-bindings: clock: sophgo: support SG2042
Message-ID: <20240112-overhead-disallow-8c2a4b97c36c@wendy>
References: <cover.1704694903.git.unicorn_wang@outlook.com>
 <925d99d5b4ece01337cb3389aaea4b631894dd1d.1704694903.git.unicorn_wang@outlook.com>
 <f88b79c3-e44b-4136-ae56-10e1f2502e2d@linaro.org>
 <MA0P287MB2822C7A3C1DC7786708E860BFE692@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240110-untoasted-underfed-fe81479506f6@spud>
 <MA0P287MB282224A6097B4FCCF721C89AFE682@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240111-jolly-prize-930931cc648a@spud>
 <MA0P287MB28229BCC9EA83507B99A9F3BFE6F2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB28229BCC9EA83507B99A9F3BFE6F2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_234318_814707_0D6068DA 
X-CRM114-Status: GOOD (  14.24  )
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
Content-Type: multipart/mixed; boundary="===============7128669721856746381=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7128669721856746381==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IJiafrCvNW1u7xS0"
Content-Disposition: inline

--IJiafrCvNW1u7xS0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 08:08:15AM +0800, Chen Wang wrote:
> On 2024/1/12 0:58, Conor Dooley wrote:
> > On Thu, Jan 11, 2024 at 04:00:04PM +0800, Chen Wang wrote:

> > > There are four types of clocks for SG2042 and following are where the=
ir
> > > control registers are defined in:
> > >=20
> > > PLL=EF=BC=9Aall in SYS_CTRL
> > > DIV: all in CLOCK
> > > GATE: some are in SYS_CTRL, some others are in CLOCK
> > When you say "some", do you meant some entire clocks are in SYS_CTRL and
> > some entire clocks are in the CLOCKS? Or do you meant that for a given
> > clock, some registers are in SYS_CTRL and some are in CLOCK? It's the
> > first option, right?
>=20
> It's the first option.

Then the gate clocks that are fully contained within SYS_CTRL are
outputs of SYS_CTRL and gate clocks fully contained within CLOCK are
outputs of CLOCK. You should not use a phandle to SYS_CTRL from the
CLOCKS node so that you can pretend they are part of CLOCKS just because
that makes writing your driver easier. That said, obviously you can
share the routines for turning the gates on and off etc.

Cheers,
Conor.

--IJiafrCvNW1u7xS0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaDtUAAKCRB4tDGHoIJi
0nxTAP9CrpCZwpKaT/G47Q3VE/Iop0YxDp0B26eM0tRrfqHaLwD/cs6kxe63wPej
jDHoKl/useqwla8QveRde8FpitXfYwE=
=y7/T
-----END PGP SIGNATURE-----

--IJiafrCvNW1u7xS0--


--===============7128669721856746381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7128669721856746381==--

