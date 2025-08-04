Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1808C87FCB
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 10:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xeTR4bSDyMmXYEdIUGQPphfgmHTCNouFx7RZMIjDC6s=; b=qU5s1APuVmh8OKdt5kzzVp9YVl
	YDbYYr7TMunm0/eHeHx9T7bo7wnIegulUqUrY1gcLiD0VdCmzU+Pz4sremmKTWDaaYgX+g6IfOnMh
	y6GV6/XiOJxpJOIfwYbXtRAb8gvvOI/OynR8uQU2CB0uTJ7vH8m3T0Pa2X0QSw+MH/66jyGdTD8gj
	13afQJr1uyiOaBVJ6oadkFuGYW0NixRrJtzCUntt3U1OPpSlTmd2lNV2hBQv3njYSvE5PcvIMuV3H
	SnGRoLvkeYG9flXuLqUvJcbxCcdELDJ8IfYOXtF2/SX68Ly9gMamYbzGVtg5PPMmMSor4nwuooevk
	wYFbaagw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiso6-0000000AE3i-3AWO;
	Mon, 04 Aug 2025 10:52:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiscl-0000000ACh4-4ABi
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 10:41:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6123D43F56;
	Mon,  4 Aug 2025 10:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C4DC4CEF0;
	Mon,  4 Aug 2025 10:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754304059;
	bh=g6Pc1jt80zUNyigjtjPmetjph8U+d/ALmshuwTo1blw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gF0VwUBncPEVjDm60cK9QeuDQAQh/UAeCaEeDCYhhnem8PO3Qzov/uFsUachpHSqJ
	 qRxBhMe7wa39FpP3Rncj/jeQyCCABW+W5Ch9GwdIKntxtFzm6K1wEITtHtLdNi6+h5
	 PYP77fzEikTXqIm0ipFTbWtXMdrjtgKWdrQOUv6+NsG740GmVextqXQzgqpvo2wo+y
	 AEqIWXgiXJkzloLK0EuTHLVQHPT2oXYt2jvl5PTVMD7bwUDI9k4z3cekHCKLoRxMau
	 JgXzbk/otSEvD2gkdGfssBHE2Z/kZgQbw+CA8niovYc1UN19fk8A/RhebqGQWVTzsg
	 U/ThgQuNo9zAQ==
Date: Mon, 4 Aug 2025 12:40:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org, 
	Nylon Chen <nylon.chen@sifive.com>, Zong Li <zong.li@sifive.com>, 
	Vincent Chen <vincent.chen@sifive.com>, paul.walmsley@sifive.com, samuel.holland@sifive.com, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 6.15 40/80] pwm: sifive: Fix PWM algorithm and
 clarify inverted compare behavior
Message-ID: <7frg2elz76idsw53z6abohdtzp3z7xzdteohcvonzevjkkduox@lusetfiecucl>
References: <20250804002747.3617039-1-sashal@kernel.org>
 <20250804002747.3617039-40-sashal@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250804002747.3617039-40-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_034100_071266_99A79070 
X-CRM114-Status: GOOD (  11.86  )
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
Content-Type: multipart/mixed; boundary="===============5068878575625903929=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5068878575625903929==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yrqyiuodvptb5j2y"
Content-Disposition: inline


--yrqyiuodvptb5j2y
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH AUTOSEL 6.15 40/80] pwm: sifive: Fix PWM algorithm and
 clarify inverted compare behavior
MIME-Version: 1.0

Hello Sasha,

On Sun, Aug 03, 2025 at 08:27:07PM -0400, Sasha Levin wrote:
> From: Nylon Chen <nylon.chen@sifive.com>
>=20
> [ Upstream commit 7dbc4432ea6bf9d709391eb57f1e9fb44e99845a ]
>=20
> The `frac` variable represents the pulse inactive time, and the result
> of this algorithm is the pulse active time. Therefore, we must reverse
> the result.
>=20
> Although the SiFive Reference Manual states "pwms >=3D pwmcmpX -> HIGH",
> the hardware behavior is inverted due to a fixed XNOR with 0. As a result,
> the pwmcmp register actually defines the low (inactive) portion of the pu=
lse.
>=20
> The reference is SiFive FU740-C000 Manual[0]
>=20
> Link: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b=
16acba_fu740-c000-manual-v1p6.pdf [0]
>=20
> Co-developed-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> Link: https://lore.kernel.org/r/20250529035341.51736-3-nylon.chen@sifive.=
com
> Signed-off-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---

As for the 6.1[1] backport, please don't pick this change.

Best regards
Uwe

[1] https://lore.kernel.org/all/52ycm5nf2jrxdmdmcijz57xhm2twspjmmiign6zq6rp=
3d5wt6t@tq5w47fmiwgg/

--yrqyiuodvptb5j2y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmiQjjUACgkQj4D7WH0S
/k50gAf/aJ3iHL1QQzh1R/HNLEoCmaFNxl13MeiA7J44Qy3vWXYq61akDV/C+81n
IP/Ek7ZL8FKLTPW8b6ZYQFh8rJ7e+TJMOdxTj+WUHCJNFkt/jfvEbeVmafzlrQmX
QB5Ry/KKM4H+X1G9J4gSvHziB9e5Nwjh9VE76x8P3A1sqT9HLSEJw/3GnqW7H9sx
a/gD4EFEH1pM/cCMN+bEs3B3/l6F9aa96yVhIiV3ZzclcAg73W9scBVxkTJ+VvuP
zHUW5e3eyt4Boq0IjIow/opCc+dXpBJlf9usvJPKWuMhdIWAiKAiynxCvQc4AVhm
9E+A1LCzeYO5a5i+cqF6S9+uk81nbw==
=UUTY
-----END PGP SIGNATURE-----

--yrqyiuodvptb5j2y--


--===============5068878575625903929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5068878575625903929==--

