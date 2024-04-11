Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4E5CD128A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 10:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6yCV9mqdTq/33tCMjdYINPn9Adz1uEon+i+Cc1a9Rc=; b=IhEcw6jfRLNKTLLPPjLtliW75P
	zz4/t9IfDcks5BI8+cpR/jON7WGWkAzvJK24ufbwllhayfvLfA5ZOkPv7szwrDHifSQegqw6LGBYr
	kwZn7hTd/K+udi0oMk4gxKOlQyZ5c5htuu6H8gkixwRe27ZqnIjW8bMDHNONnoWGvDC5dbYc8LaCD
	qklASJzqdWQUKAY43YOc5bIrh0nVpSbS14ht48F5ImI68c610hUKSQSIZoreBsOza+8OrF35Fv6VF
	kGOwIF+SBiDHRHfMd0LwpCRaoTFCysAZxNJCZr3nTtuCeq8U/sNvrLslnRb0jWywiYYKo5cSUtB1o
	J8wGzDig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rurht-0000000BWcJ-1YSn;
	Thu, 11 Apr 2024 10:31:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rurho-0000000BWah-3aCp
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 10:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1712831457; x=1744367457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wRis+jvLiwfcvURS3pt9dGRgB6cIii2qwGUUMZpjF6g=;
  b=LglLyFBRB8LUWeToc9OEwI+TfTVMyXWKE451+TOR0otVCs/eni+Q4qBn
   JTSLBOIr84kRTqDEZVeCSqVw8Mda7R3vQXT403zYc9Rf2z3zWA0Nr674/
   GfmZgTVqk+cJ2VyIJE1nkf28QBNYNBu6/IQbgn1j3iP6donXOkGkNr9z/
   nSU60R8NoUd9xiFiIj4/h91gFtF51PF5Fk5ooAmg8DW2iy9oOjA2ruMxA
   ovdVmV4mgpBiiQg3n7HJtaaEt4uFFxuym31V2J58j5qbnS1SBLj0Wso6U
   DK/30lrYcph50uoMKG2BqzK4fVURyPAyHwPUIoJn0NQ7FlUeWokzDOPbW
   w==;
X-CSE-ConnectionGUID: 0of7XxqXRZujtHuEzDEvOw==
X-CSE-MsgGUID: 5pyW+N2xTlub9U791V2XWA==
X-IronPort-AV: E=Sophos;i="6.07,193,1708412400"; 
   d="asc'?scan'208";a="251346984"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Apr 2024 03:30:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 03:30:44 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 11 Apr 2024 03:30:41 -0700
Date: Thu, 11 Apr 2024 11:29:51 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Stephen Boyd <sboyd@kernel.org>
CC: Sia Jee Heng <jeeheng.sia@starfivetech.com>, <aou@eecs.berkeley.edu>,
	<conor@kernel.org>, <emil.renner.berthing@canonical.com>,
	<hal.feng@starfivetech.com>, <kernel@esmil.dk>,
	<krzysztof.kozlowski+dt@linaro.org>, <mturquette@baylibre.com>,
	<p.zabel@pengutronix.de>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<robh+dt@kernel.org>, <xingyu.wu@starfivetech.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<leyfoon.tan@starfivetech.com>
Subject: Re: [RFC v3 00/16] Basic clock and reset support for StarFive JH8100
 RISC-V SoC
Message-ID: <20240411-euphemism-ended-706f23d4a5ca@wendy>
References: <20240110133128.286657-1-jeeheng.sia@starfivetech.com>
 <a83130157adf70f6f58f4d2e6b9d25db.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <a83130157adf70f6f58f4d2e6b9d25db.sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_033057_332267_5686F73E 
X-CRM114-Status: GOOD (  19.87  )
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
Content-Type: multipart/mixed; boundary="===============4354090580164708717=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4354090580164708717==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lisQmnqROX183EFJ"
Content-Disposition: inline

--lisQmnqROX183EFJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 12:40:09AM -0700, Stephen Boyd wrote:
> Quoting Sia Jee Heng (2024-01-10 05:31:12)
> > This patch series enabled basic clock & reset support for StarFive
> > JH8100 SoC.
> >=20
> > This patch series depends on the Initial device tree support for
> > StarFive JH8100 SoC patch series which can be found at [1].
> >=20
> > As it is recommended to refrain from merging fundamental patches like
> > Device Tree, Clock & Reset, and PINCTRL tested on FPGA/Emulator, into t=
he
> > RISC-V Mainline, this patch series has been renamed to "RFC" patches. Y=
et,
> > thanks to the reviewers who have reviewed the patches at [2]. The chang=
es
> > are captured below.
>=20
> I don't think that's what should be happening. Instead, clk patches
> should be sent to clk maintainers, reset patches to reset maintainers,
> pinctrl patches to pinctrl maintainers, etc. The DTS can be sent later
> when it's no longer an FPGA/Emulator? Right now I'm ignoring this series
> because it's tagged as an RFC.

Since this comes back to something I said, what I didn't want to happen
was a bunch of pinctrl/clock/reset dt-binding headers that getting merged
(and therefore exported to other projects) and then have those change
later on when the chip was taped out. I don't really care if the drivers
themselves get merged. If the JH8100 is being taped out soon (or already
has been internally) and there's unlikely to be any changes, there's not
really a reason to block the binding headers any more.


--lisQmnqROX183EFJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhe7ngAKCRB4tDGHoIJi
0oN8AQDJCMKWJWymNQyrXdSAIbIQWmLkJXGtohqPQ27J6cA5rQD9FaZ3m59i+b/i
qcLnFDJe8daHP7ulI/YtwBRLJ+WBHAs=
=Bkv+
-----END PGP SIGNATURE-----

--lisQmnqROX183EFJ--


--===============4354090580164708717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4354090580164708717==--

