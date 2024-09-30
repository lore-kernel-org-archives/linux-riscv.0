Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39EBCE834A
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYaa/bY8rqoymN+4JRgZOTkKifuU8Ukrh2tiP45jtyU=; b=NVrG3MFXMyULFsrt0dLYQHG4Vb
	fHu2ZEf36ndhK8Lwq1cK7aXtg9jGyJmSc45lF+khfpZRQyNj++YvYLRXADkdWqTc+Bd7vslpz4sN3
	5F72nuoeCnzoO7qH+yjYmO8YOivEYfKBTbHdt44knFTHreRhQ0/cT30iz5ibCsgtCmcmanJ9x6bnu
	o2lFYvatS5TQ9/X/9ilgQUJaP5wYrKUaNIcfg1tA4l3Xm/5p9TcqGvsdoC6Oe/2TQ6OI3KyaYkOLu
	UgT56MiKn5p0MHhTQ4OFQjcSRSKNo1sAkiK2pGeFtK6cwTaWaR3lovtsr0nPaJUpaxq54gdQof76F
	9/GY802A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHAP-0000000HT64-3W1g;
	Mon, 30 Sep 2024 14:14:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svGpo-0000000HOYc-3C1S
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 13:53:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 91311A420FE;
	Mon, 30 Sep 2024 13:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9C2C4CECF;
	Mon, 30 Sep 2024 13:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727704387;
	bh=IVbbaE/GIT9RrXhfSo36FUKPNUq7GI5PpkcP9RyVysI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rE8l+AW/ev6vEpAHKR2WC4QEXYNs3hT6guF09tK8fUmPpr7f5MTgRhhgdEHQM5HNW
	 uBOdna5ZPT3FbI12W63Xz76mxB7HGapWHhjgkP4mFIvSi+R9zODIcPRNBVlSpW2X34
	 gr1BeEIUHZ+/FyWFz/Zjsg4goMxZXAr/UZwLMuI66WUsyOpEHKn+ahVp3nHF7hb2Ej
	 VVnz0xpYa3L/VCc/ALl+XG6tceAQsCvR2NG+Nf/JZmiD4csPFWc/9tUqeTYkBj1/G7
	 Z069eM3WBeuiOD5eSW6H0rzg+yQI+c987yuHlC6znSuN9UIqZh0244NU8fhcpDStm5
	 QxDhvCSRUU5Ug==
Date: Mon, 30 Sep 2024 14:53:02 +0100
From: Mark Brown <broonie@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 04/20] dt-bindings: spi: add PIC64GX SPI/QSPI
 compatibility to MPFS SPI/QSPI bindings
Message-ID: <fbad3270-b6c1-4b9b-8a08-a66be80e7156@sirena.org.uk>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-5-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240930095449.1813195-5-pierre-henry.moussay@microchip.com>
X-Cookie: My EARS are GONE!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_065309_298394_255A7F0E 
X-CRM114-Status: GOOD (  10.04  )
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
Content-Type: multipart/mixed; boundary="===============5603997964833263073=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5603997964833263073==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="usUdwGt1tk5eoW0S"
Content-Disposition: inline


--usUdwGt1tk5eoW0S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 10:54:33AM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX SPI/QSPI are compatible with MPFS SPI/QSPI, just use
> fallback mechanism

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--usUdwGt1tk5eoW0S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb6rT4ACgkQJNaLcl1U
h9Cylgf/SeKuUdqmIkH+cHNwBAWWRYyTEeqpUfZwfyyjxHpdrGqUQjadvhIrxKD5
+qrhBGBLCMXstynEo9BNUp0hcDk1nymSPYDQDzB/ZMSPheVHZE0EI6BpiY0/fYJO
d5oKcrC3wWNqJCdl9Yp2bJh95Ivm/4BmqoYay3vcIHKweyfgEBRrEq3DM1vknzTJ
9ou8L7M4+7syL7PMKeE8mCjhV/B2tW90OvK2m1J0Z1P5q2pDIVB6dQGz3y+6CDlg
/9OLCYuDK7YwhE1uTbpkx0q8D0otd0kuUJRpbYun4mTcd8HhlloYEch7U2fSk+cP
dw/45fsCzNOFyRmSspFhmkfgtfLvzA==
=Fi9v
-----END PGP SIGNATURE-----

--usUdwGt1tk5eoW0S--


--===============5603997964833263073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5603997964833263073==--

