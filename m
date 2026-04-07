Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056ABFF5109
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 15:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qG+edsp+QsqUjyXCNMCUyCzcuUlzuNnqkb2tKWEnGMs=; b=BvNJLMAkxGmO37m50eTgcaFLvT
	x5W6bXfmtgjdoiB9KnpLv9q7hrD6cDLR2LAUWT0Un2ImVuRRalpRxTTrOhfcWw/NrLRbk5+qT9sO5
	mEoMSs/vF/axX6+m3mJ3ma2ghJcachU4DAIp/SwhCfsDm+airzcWY6CgAr5NOlUk/0xDhy5GlcUhs
	TH3dihU8MSpBlM2H4YqyvDIV+lu9yoe+PR6mg7esOxfanBRm/cez49qH0TtDFgLL/ygbZgmeSOQpu
	PnI02foV0JoCVuG+2aQZqvy/0/Ci3C6wIWKqOoWTI2xTwTSMelcIBuE7abAKQl76o9ce5wrOf7fjk
	ek/4N4qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8dz-00000006k0t-311R;
	Tue, 07 Apr 2026 15:47:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8dx-00000006jzu-28PA
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 15:47:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 147DC4331B;
	Tue,  7 Apr 2026 15:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD31C2BCAF;
	Tue,  7 Apr 2026 15:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775576828;
	bh=7ZkhLjkG4Tgldo1Tqz/ygd9bzoyC6ImiCL5OXqWPe9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZLTYUOhZLV0JcJ7WhfezFr34+clUqw4nRZW4ypzETr81SO/fn7kPCECkX61XWeq1Z
	 p4ogSkbLp1HmjxNX1AbklH1QaKzum2RfgNcIwOzWt6Hd7k3kQBYlwtg3OVRk4Mma48
	 oeFDuKAupsRkEqd+nq5vhZ+5DQ05dUr6gjEmBwVIc6scYnz/xydqh6PL8olpAHwhFW
	 LRlOfh46Df1Ad/S5VU+1r0i9TaiR7OHWQack1OPJ1mLL4s0Yyd4lPnCTS7rreoGy8j
	 wGTWZAWpWft/ObACVtqOaic43cUStkIMLpa9ThbX9xe3cLOogZ3wDzdbYkve7wONn7
	 3rA7jA+xrFSmw==
Date: Tue, 7 Apr 2026 16:47:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 12/13] soc: starfive: Add socinfo driver for JHB100 SoC
Message-ID: <20260407-captivity-psychic-d2ee5c9109d1@spud>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
 <20260403054945.467700-13-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260403054945.467700-13-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_084709_568115_4EE0BC90 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6092812082713767045=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6092812082713767045==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0RgIb1E/R/WiM3PU"
Content-Disposition: inline


--0RgIb1E/R/WiM3PU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 02, 2026 at 10:49:44PM -0700, Changhuang Liang wrote:
> Add socinfo driver for JHB100 SoC. Currently available for distinguishing
> between the two reversions, A0 and A1.

Maybe a silly question, but do we need this? Are both revisions
available outside of Starfive?


--0RgIb1E/R/WiM3PU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadUm9gAKCRB4tDGHoIJi
0mx3AQDDIeNtlngb0YbX9JeCQZq8JKeN1yutHGXtTooj6sgkCQD+IYw4zBK5Q4FY
f7FsBY9dSZxILE70UqmD4xWC9lrDjQ4=
=yPUH
-----END PGP SIGNATURE-----

--0RgIb1E/R/WiM3PU--


--===============6092812082713767045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6092812082713767045==--

