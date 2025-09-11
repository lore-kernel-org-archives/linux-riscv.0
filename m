Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D290CAC587
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 18:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PUHY0e2S7fTW6+sbLiih8kfp6Vhh68NTiN3y2QgAaE=; b=T/MLyeMjO+0LKVGhRED3p3cYRN
	/wSrod5Jv1wMW61f6/8ShPQs/MDWOZGD1nTNJvA4aP8F2IhRIFT7psvhEzV6vE1waJj7OzcTMf44Y
	JL3G/DR/ZsHPQjODO9lxfHzDxHjWmewlzX++kRonHYNMwH0ReD+K1MqTkW2Mw5jrMlLNOGiQLo0LZ
	cOVyDHJnn219lW95aDDx9U6qiIqR63u3Zc5ewAzaB1utn7fw3/OKxYfurcZXqbVFKxb5HK1gQQFen
	OOzznvRQGn51MeIMN0X0e3KA0FeJQqk1gOT5nHrYchpI93cIVsV+mjMkgRKhO+u+BJllItQRSl234
	WcABYgXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmU4-00000004rv3-0cGz;
	Thu, 11 Sep 2025 18:57:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmU2-00000004rtq-2HpC
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 18:57:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0890601DE;
	Thu, 11 Sep 2025 18:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20F6C4CEF0;
	Thu, 11 Sep 2025 18:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757617045;
	bh=KCkueulLNti5rMZqCXMGdCyFB/dsr9EyeiTawIyR368=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hPXe2a0dGVS5459STIEhC4WAQbQAl+LplIH20+wlU2UYWvUDO0EblzkRyRechR4mS
	 WdXrsqBRlRj+l+d2Q5dFenY4suqR7RiuMRXdql/ZZ1ogtq+ZjyMxRogPGmc287RywJ
	 jhHXN4aU6miVRnmJ7bPF8uW0oFtp7FL8bHwOpWkOx6SZKAXp48DDII12uv/kF9RRRS
	 DQZ0zE7cslJpdPOEgMeGLPhJrIE/cACzpr3I9DNUKVbN+14tOy211IvgRiZXtgYF/g
	 KUSFrIEH71s5ufhQXmpEWJmobiYtYpo2+nj/hbg+A9+wH16xFGyAp0aO5wRwm0ft3b
	 PG22aPHf2Sopw==
Date: Thu, 11 Sep 2025 19:57:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: Lee Jones <lee@kernel.org>, lgirdwood@gmail.com,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mat.jonczyk@o2.pl, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v13 0/7] spacemit: introduce P1 PMIC support
Message-ID: <7aba368e-709b-49b0-b62c-f2f8250c8628@sirena.org.uk>
References: <20250825172057.163883-1-elder@riscstar.com>
 <175690199980.2656286.5459018179105557107.b4-ty@kernel.org>
 <ec882a78-9604-45b1-9405-8f2f958f307c@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <ec882a78-9604-45b1-9405-8f2f958f307c@riscstar.com>
X-Cookie: Your domestic life may be harmonious.
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
Content-Type: multipart/mixed; boundary="===============6320103891148925211=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6320103891148925211==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="66pqKUP3ZIOBeGN0"
Content-Disposition: inline


--66pqKUP3ZIOBeGN0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 11, 2025 at 11:36:41AM -0500, Alex Elder wrote:

> That leaves patch 3, which enables regulator support, and patch
> 4, which adds RTC support.

> How should these two patches be merged?  Mark has reviewed the
> regulator patch 3 and Alexandre has acked the RTC patch 4.

We'd both have been expecting them to go via MFD.

--66pqKUP3ZIOBeGN0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjDG40ACgkQJNaLcl1U
h9AXdQf+IdRJpWhqD0mkQabeBSF65aLfa+7LECsPIv5ruSPrNRMsy61871+68Cyf
XSkwNm0j+n9bp3BKgf2siTNQJP7avTj7SEn3DAwkK8o9ADoOezTymr27J++8fQBu
TejL9xAOdrFLn1hx2wthV5GtW63+q3xaM2FECQUfabMy5q7FsBXi9iKNQzfrE2td
+1BpNUyYqqBf2HZekcEGmsD585KvZ3boJo21s4RPl9IIS4cjKpcDC+rCHuf5bg4H
SXousx1d16uFhqMQ56sHRrtX2cc34nPL2baF3bun4otN0OH+y0R+Xj5U8tlXS7y9
rjXUS6wQJWZ1XE3BbYVgWPfdIvxPhg==
=I2Nw
-----END PGP SIGNATURE-----

--66pqKUP3ZIOBeGN0--


--===============6320103891148925211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6320103891148925211==--

