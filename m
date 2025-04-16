Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF761C369B1
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 05:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcAyRWq4RlJoz3Ko6+CFX242/on9PDX6+MNsFJ8aB08=; b=b+seMhgwkfDZVvkEDAdT9+XZ5J
	a98jBZCEgXCaIM6jb4omTe4EYE+aSf2IYBMqdlQVcumxurovn2EKWSO+pTyELtuUswR+2fT3JUIS2
	TUUyZSRDUx0hxzORC7D9gT06VA15Rm5p6RAxzBIJucmFJvHOhTwbJJO3fnf36UWdVaAj/k39/eZhN
	f64tCsdmUip7x96IdSE2BNv8Pa62oLQFRSzFSnQdSj7A9mB5YybTrwYb2Jvr9znN8j42tgh924OL0
	Hf0L+/xR4U+bXwdzRK/ifQaei2aUIPAYdlws7V5RHRjTOU3WjP48oQ4D2kghxeEfm7eB+a4zLNd8U
	mVwReBXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4vAT-00000008FDW-0H1H;
	Wed, 16 Apr 2025 05:18:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4vAN-00000008FBm-3oqX
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 05:18:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 287A143D9E;
	Wed, 16 Apr 2025 05:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A5DC4CEEC;
	Wed, 16 Apr 2025 05:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744780711;
	bh=CmNtU/Ng9a+Jh4xKHpsC8mx2FxYmD+EiYZC+QuZh9+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4YsDyhl2RK//iQoGDJ4oxeuQ2oGCVN46wS8ndM2H1q8BTeAJYZse3I3Hpeb6+MNu
	 PqY6HWPYLsznjFBt6m8JzrR/fXLChkABbOeyyF9rGB6uco9jqrCgPgnGAGePFdDDfH
	 2ly5/wQBDFv785hDObgMrmIc59qEosIpIkxaACm3mgk6ZnAo/yI9Y9O2VnT4Z30ZTU
	 vfQO4X/IPfT+u5J11+3LXI283MB3NthqovTArwv6n/Ohmz6DU2T6BfuQTpv4J8GFW3
	 rV4VppRCG/NS8cr68X0Kp8MDwEI6Y2ZaNvlqjBQwSFwnGvxC+v7LZsHIScZHcg+T5l
	 W1z+KsnM770wA==
Date: Wed, 16 Apr 2025 07:18:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, drew@pdp7.com, 
	inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, 
	hal.feng@starfivetech.com, unicorn_wang@outlook.com, duje.mihanovic@skole.hr, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/9] dt-bindings: pwm: marvell,pxa: add optional property
 resets
Message-ID: <hogqotzzpzcow2xjrwh34qcuiu7ooc2qnvlhuvexzvqkrcsfop@mhz26t5vu35p>
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-2-guodong@riscstar.com>
 <20250411-confider-spinster-35f23040d188@spud>
 <89b6142bacecd4a7742341b88dc1e28c4454527a.camel@pengutronix.de>
 <CAH1PCMZnJDcYKJR35WirQT95hte0NWvGBe4fjDuyZEgagvunAA@mail.gmail.com>
 <20250415101249-GYA30674@gentoo>
 <0bbd2842-72bc-47a7-832a-fc8833163e32@riscstar.com>
 <20250415122807-GYA30943@gentoo>
MIME-Version: 1.0
In-Reply-To: <20250415122807-GYA30943@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_221831_966912_336DD2E8 
X-CRM114-Status: UNSURE (   9.31  )
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
Content-Type: multipart/mixed; boundary="===============1191063775334145430=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1191063775334145430==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="drktpjdibffse2jk"
Content-Disposition: inline


--drktpjdibffse2jk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 1/9] dt-bindings: pwm: marvell,pxa: add optional property
 resets
MIME-Version: 1.0

Hello,

On Tue, Apr 15, 2025 at 12:28:07PM +0000, Yixun Lan wrote:
> maybe there are cases that users don't want to issue a reset..
> so, want to make it optional.. I can think one example that,
> display controller is up and working from bootloader to linux,
> reset it will got a flicker picture..

Agreed. You can just deassert the reset at probe time. That shouldn't
interfere with a PWM that is already producing an output.

> GPG Key ID AABEFD55

If you advertise your OpenPGP certificate, I recommend using the long
id. See for example https://keys.openpgp.org/search?q=AABEFD55.

--drktpjdibffse2jk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmf/PaEACgkQj4D7WH0S
/k6ooQf/d4DhhdyM4QPOcTmcUpZ8HOxH7CFCD701mRLpmOlq1dz3/Mtz5tO4wLL2
nvfA4N7zRagUW8grFQIpENy3IFx5DP3Rdg5PtVELqlqPrOW+NqTTJGslRBeIAoQ3
0rybTAJEutOM0DPeL7Ay6iGy78VV/Qosh7dhFUWmzxeF1IBHry2tm+euAw5wKOzP
PNPY/S0CfuOhb2G1ivYYVTBV3fsgYT5G+VfTJyR9/Gkf7F9yKMbX0LRYcG1LM8Ox
0ilgkvwEu9kt2Au+q6PivMLURHJ28CtG1Fl+Qn50PZm0witW6kFfQqSA3WN4z6rz
ueBYfIz0tcqYQIjClrgXnesRcLI+KA==
=8FCS
-----END PGP SIGNATURE-----

--drktpjdibffse2jk--


--===============1191063775334145430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1191063775334145430==--

