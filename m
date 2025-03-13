Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B67C28B28
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 01:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VO97wTeuaIFOxxTwk4pbAeqQ+HtW44Pwx9Y31zfRIcc=; b=i8xGV+aDJr2ChEn5GchAOsDpER
	NPNsSo+O6zbJlO382cvYn1VWoEPjWYvmeP6HuyrU8d+MB63Ceoz0bO4SZnj43qydPCpKyRzi2OQYx
	leXGx3OXv5wl0PJX9bmSCWwGCDZoMO/7494DvHiCUwVQ0wrtPJVEnIxFMUmQzvbxmSSOkLYVvYicC
	2H4aoAN8sq+MLwwj5Bypy6K+L8mwINx2QBlPBERTgwkW42MVLeNrpOcWM3qh4r3bVJz1x0AZIZjnr
	m4A1R9u/VHeLTq11kzVN3hqd6rOFGlos8J9+CNxAo/eoYsjmcNd/OZ1PL2+9sN4LZ/33jB5j3ChRi
	hD4YxzLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsXEK-00000009rlH-2RXY;
	Thu, 13 Mar 2025 01:19:24 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsXEG-00000009rjT-1Gzz
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 01:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=DB68
	pVaJJ4VS0y+Z+2ellm8XL9+PFw9fg9mxEwWFP1s=; b=BXPR9wXNEzGvWgE7maOj
	Z2BxD7vbxL5FWMIlcQDzKY6qPnmNui2p07GkK87cf/jjk29HLYbAWaXPU3ER+sDM
	i0P6cPvK7yKnKYa4mIBQBqaLBzdk/604S+QyMH1OOTDgd5zi5y9c1aVc2opvsBvI
	gS/TWPT2PIbOuXN72teTk/P5XiPjOcnU239brcOqE6jKiSM01odL0bmoJL8QRubv
	5ujbeytgi6TngDyzZI/z/2dPtNGTgOKqQzakbf5QgdiltMCnDavT7edmW7Qz4RB7
	5NHfIEokx5q9y49JMBAhiOKciVhe9yl5Nqz7U+HQBsVZPbzzBPpxE8UssewYCJqv
	3Q==
Received: (qmail 1441578 invoked from network); 13 Mar 2025 02:19:13 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Mar 2025 02:19:13 +0100
X-UD-Smtp-Session: l3s3148p1@OGcbHC8wPJcgAQnoAFAeAGR2+CrWUxoz
Date: Thu, 13 Mar 2025 02:19:13 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
Subject: Re: [PATCH v6 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <Z9IykQgaOL8_Yh_Y@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
References: <20250307-k1-i2c-master-v6-0-34f17d2dae1c@gmail.com>
 <20250307-k1-i2c-master-v6-2-34f17d2dae1c@gmail.com>
 <7d9e90ba-8c23-44dc-b64f-80213216faf7@riscstar.com>
 <nrmoj7gookedlz2e3fgu3hvn3s5fc6vrxgjueynyp5orj63k4b@cqlhflioxv7h>
MIME-Version: 1.0
In-Reply-To: <nrmoj7gookedlz2e3fgu3hvn3s5fc6vrxgjueynyp5orj63k4b@cqlhflioxv7h>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_181921_230875_456D729E 
X-CRM114-Status: GOOD (  10.27  )
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
Content-Type: multipart/mixed; boundary="===============7200175243982113141=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7200175243982113141==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CpEyUD+s7U217eGg"
Content-Disposition: inline


--CpEyUD+s7U217eGg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I checked the two drivers last night and I can see some
> similarities, on the other hand I also understand that it might
> require some extra effort.

I think it is okay that it is a seperate driver. If register sets are
too different, the resulting combined driver would be a maintenance
nightmare.


--CpEyUD+s7U217eGg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfSMo0ACgkQFA3kzBSg
KbYCDxAAkhFVL8kRdmj5c8fja6ix5dc1ANAZJYGlh/G5aNdbj9MhxbQn1OgWSvxZ
Ap7DZ/G1dkvv/CN7mjMUjqQOaOJzuNdL4m8+pzbVjWwt9odvqe2dzlx2f1Odn/Nj
g+3FTwbctyi+W4sxkYsv9Fvu6+Z4VybShwmwBzai8HcLvDYrMCTXYUFefX4xodi7
ZD9mvoGSzRGEKiOITWxDaR6u/6YDZ9fQE2LDEbqGluz6ecDE4YHjIOa/tH6HBx9y
ut8KLeze7qRvFbkKTVSAXzTnICPRzhE74arEscNQgJDAa0HjJaTPCHT26Z+dS8ne
+uyF37G/pzBw21/78IEmvaPr40YYn0oJ6nYL8Z6hankoJPA2MpCGhEPFqv1zxRMo
fnD/CkZSrarzdzZ/5hWPau5cTiqfhvJXOHGXy1Qc0ZT95lAKoynxpmqSxKsFBjmr
wUZ3fEcR07oMH4NibpI+pTW/q6ah9aUpESH7SDEZrhJ5UQ1Iqhs3Abym02cNc31z
XckFbHTT3ED1NNvImxNx7lH0AD8rWwWJiiCHTM3SPPAuCjXX01nwCOYhUu0s53iK
jXmQq8IFMQ8w+QFpVJ52yzlSoTzWB4QRpoztES4C74EWEznf/azvRi3GGQKCdfEK
k7yd47ORfzrtVqrCNKJQLsODzFbAvo1is5nfxcWpD2KOttuXI28=
=2C6g
-----END PGP SIGNATURE-----

--CpEyUD+s7U217eGg--


--===============7200175243982113141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7200175243982113141==--

