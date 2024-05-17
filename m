Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730D4C25B79
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 17:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80BVM2D/a+9HcuJKRmd/D+4VVt3uCtpHkwZjxTG7DKw=; b=Lx5pJrs0wdzAc4WczJCW47kR5P
	hFM9vEvUHXrKQDUrjKNOPi2TszLvycJpWcbfI83klqk5+PrTXFhk9BQtsdeh6y/v70DAA1X6FbaJV
	aRocaBFFLQVOTv0ZvthcFl8v7qUEs/R2pbpl42Az0dmA/IMGNrawFBeL06cgf3DzUEV7PdxSpn5v9
	x9zvo5Xd0cgjNp2DzC9+4nwXkGrRZUorBzRqaLufUl7vTVmYH9UcDtdaJPxgmEItHdwZkhZZnOK7+
	fYMZ6SSZoLAm9Xo/GyUwqMqR7nZzqqlCgPZ2gh+sPRqOwGEwL7SbqNCrlfnotHlE/CmiA7plGD/V3
	AhgLrBbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s81D3-00000008VCg-2zUO;
	Fri, 17 May 2024 17:17:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s80Ek-00000008M4c-3nYl
	for linux-riscv@bombadil.infradead.org;
	Fri, 17 May 2024 16:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0f3VHO7RMXtFaZP126+RB4mZ3zyGDNwOOkBNFAvaZv4=; b=DLekCzIRlFnu3hI6XSqemQLuiR
	LnwzkrONWjg/2Jk6MJ7f5V4Qr3ju7oJZj8e4u7QY/u1vQ4AuDOsfHoo0wFhp2vx2WykyWNR6Oq8Nd
	8/M3HfkE6TEQjy6mMYGCSYLT6CARKWQdERz4swzjIedFPZH4XSPd+VcEDV2P8oj1PzOgwWnU20OUw
	4Tbm489stuGg/8P8GXEvf2H9/AGkKiLH61iixx8v0qDTpNadjtOjnkMS8nKGVcuEELBZDpHTQNdEF
	ZLJmZJBW3n3aEejB1C2O/qTrDDqRrBX7O9YVjFzqOLEFU9S5CQ+51nswONYY9D6Eb5ZO75gQSSo0j
	R/FGxxmA==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s80Eh-00000005jvr-0W1X
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 16:15:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1F5D4CE1AB3;
	Fri, 17 May 2024 16:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE84EC2BD10;
	Fri, 17 May 2024 16:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715962502;
	bh=0f3VHO7RMXtFaZP126+RB4mZ3zyGDNwOOkBNFAvaZv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qGBhi2/R7jd5bbFZeGp93256IL1NfP37VfriCxbtPRXXBM/UO46rHwSnkq9GwlT7q
	 1/WifOsWUEVrtOv9GvCbaan5KIZUTW2zbkqnR3CzZ2ArvVQ/eXxBibJ1Icsfoji45y
	 BLUczPx09k4B1wDNUELj2utnlqphZu+y2aPFhhVwlAeDdcEqHmqbJFeQfVvAFz6J6a
	 5jqZvhaJXFfqXcs3skFv/wyRkIIjoAJfroTVgvOzMRj1StYwDRGUG/ef62SqONbrGV
	 KzVvPlmpXiGtlLJbU4BXpV5m5xFcci1jkUfOMgHdzt5VZgTh03xNbEHmntBd0zQWN7
	 yhCFadwIohJTQ==
Date: Fri, 17 May 2024 17:14:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Drew Fustini <dfustini@tenstorrent.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: dw: Document compatible
 thead,th1520-i2c
Message-ID: <20240517-mummified-judicial-3e25bf4b760f@spud>
References: <20240517-i2c-th1520-v2-0-d364d135ccc6@bootlin.com>
 <20240517-i2c-th1520-v2-1-d364d135ccc6@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20240517-i2c-th1520-v2-1-d364d135ccc6@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_171511_610605_B7C6B6BF 
X-CRM114-Status: UNSURE (   8.79  )
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
Content-Type: multipart/mixed; boundary="===============6882978113852662134=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6882978113852662134==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="71HbPEXGH1oiwxL1"
Content-Disposition: inline


--71HbPEXGH1oiwxL1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 11:09:53AM +0200, Thomas Bonnefille wrote:
> Add documentation for compatible string thead,th1520-i2c which can be
> used specifically for the TH1520 SoC.
>=20
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--71HbPEXGH1oiwxL1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkeCgAAKCRB4tDGHoIJi
0gf6AQCpyToQ+uzYUl89vhM5TD0TeV1Wj/3Dy1R7kpdK3ljLMwEAl/QQkdxlsEzs
53qFdL5/5XDkqkdArBN22iyImZG/1gs=
=1DWo
-----END PGP SIGNATURE-----

--71HbPEXGH1oiwxL1--


--===============6882978113852662134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6882978113852662134==--

