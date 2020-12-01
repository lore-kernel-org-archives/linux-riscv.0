Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC00C64E7B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 14:14:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC90620757
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 14:14:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O4j+TCfL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bH70aoEg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="i+oV1QvS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC90620757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dxPPgRQT2O+pntrxGi+cmxndm+9vLgcR1QLr1WIi45Y=; b=O4j+TCfLZikjX3MbzfN1xuXiw
	7C3+x4FdmgJ1Vog89m/aaj2LbrIlwy1HE0sa1qjVfRisiVi3FRk7NkftO3UpEIEDS0UrAF67tJi9F
	9mpEpclF6oPB/gMh93qJojzJNqE5SMI/tF//Wp/8z5ZuhEPP0uR74bOiHs+ri0vyHeWkon8pvPvbc
	Zo1Z2EaFXGo8/j21cZjaOdGYJgxlOxAyz4jtss9kgbmvdcIJ1XniZl3Y731M1srV1EfnqtJqy5aSj
	PJy46iuNV5mAvAaKcmNSP+XPNxNgziY6ycB9zRh3dxEliiQNIFzeiCfKIpiqx6xjDALf3Go0bcY+N
	RUYDx1h6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk6Ph-00077Y-Md; Tue, 01 Dec 2020 14:13:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk6Pf-00076U-QH
 for linux-riscv@merlin.infradead.org; Tue, 01 Dec 2020 14:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ObFeS+YWEyzIXNd9gEiNhAIUEsxsirquCx1J9yqajt0=; b=bH70aoEg9YraxSE21QmfxSH9tf
 EcrXhj9nkqvLzZ3WMlexy20GHnn7RWEl/qy94j/vjCT+cE7s4P5kCd6jznPa3ngplNHVelBix1ZLY
 +kp2DWhZnCQjvsiVRKjqe15373BBeJgc5QEaqi4mPwORnZKZQDEejgGaHctfMClZUhW9KrAx06YkD
 t7+dIJwI4qm0gKzohJ+UElke+47R+PEsz9d78SzpLm9vIumOM3+u6td7yelPY6WIFgioCo6tHDkaM
 NUG2HgcVyENAeszZW0e+5IN5SVO6cEMBJlFQedRYEt174yTsuHH1DAW543mS0W0srPTB/t3N34dPF
 tPf6AstQ==;
Received: from mout.gmx.net ([212.227.15.15])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk6Pb-0003DB-KG
 for linux-riscv@lists.infradead.org; Tue, 01 Dec 2020 14:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1606832015;
 bh=l5QbF6xOGKc4x8zAs8vjuIjnCCSeS/QenCxa/1DVlbI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=i+oV1QvSArc/D0OsTzqzu3au1xQ+RB4CLJZ6R1m5FT/P4X0fP5IABHiC4nMLKIKva
 2o0J+14UN1auWK9ulMl93TA0zDhX8dwgU7kxV+F+x41Wg8svew1fhrJ9RVxx0P3U+6
 T4eIgyCXsBaotDRaZZ9qXTLqbSsa8zvQRhxGJyCk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.162]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MjS5A-1kLVy83v7i-00kwOK; Tue, 01
 Dec 2020 15:13:35 +0100
Date: Tue, 1 Dec 2020 15:13:28 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: conor.dooley@microchip.com
Subject: Re: [PATCH v2 1/5] mbox: add polarfire soc system controller mailbox
Message-ID: <20201201141328.GJ456020@latitude>
References: <20201201110242.28369-1-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20201201110242.28369-1-conor.dooley@microchip.com>
X-Provags-ID: V03:K1:37pHlLEsoLHtPL7pyVcuzsHHd8XEuhHoKSZiTsSXcfIpElIfo37
 /z9NgeUST6MhZlvyOSqi2rQxgmcD4qYHWwksr6sBuRnvGEPpu2043vVFoiQ29ZRYxNZkuVA
 DMokTDJXoi93oZLrfJA9gCqrsKE4Bwq/4rlFl650SdsrgAX9EVSck70ODQSUB4Rcxinklv/
 RQ1uYI7TI2a5E10UxHUWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9Y/UJe4bFbU=:43MWcI7119WJd3yzIcJ1UC
 tUNwLdMUDueJ8d5gzH7hBww0c5T3nh9HnRUtOtzLxtfG1MfLWN4NsfljZN5uY3ZlHnXl8bEx+
 +d0psYG8K8ezvIEIbNkFAeKIMjPwzTLozXdKjLADA0nVd4Jy57/qp7wBZe2gTDSojVySt7Jfk
 GsEYUj4kwPaKGaHQqnPylR5tINKBMFO9k56tnylQO6/9Tee2iYdjVbz5t67ezupagqfwfoZF+
 X5Cu2ltmDK+hr6apONjUn1JUOEibPrQorASHBaV+95Shof2ab4clIfOT2UTVP+t2gcfARcRMn
 REqQUVsrTELJty2Pu7sSOn+zO4jW+qV2ktqGwydUO7XGu26SQpEqo915bQ40uH1Kr7Mh7BEDR
 QheL6cnAxMQG3B4KjnD75UIR7/qvj/6aQiIj6SD22S3qmHOBRp6TJtM1Fo+H0ATwbJeaZWK7Z
 VgXaanpFEoxG0wgYVmQrkThfQtBLF7UIgL2ntuCUzDI02/aoGL4dRN+oYf5PWvTm411MkjZ1o
 zdlgjnzf/FhGarqHhe4DMeKiYb3cEPZjsSzXo3/qdQ2gTtqeHy9tqQ+411CfgmU53rgsOAtZ+
 jc38nhHde0gxwqxItpOF//rS5R4OboBa8b69rhPoalaQov6XTo3hpLLOimnoaP3QhtIEaHNOe
 3A8hz0YTTz7oyAZy2IF1nkDxCHYn7/0QVSjX1/pJootgJNpdMQadcOdDevdrqw7ThIiXEoKAe
 WtHATPTeP2Q4ogZa7WjS2mZ/8JKYxWAt46ABCgf6ogHUopfF7odK/gA4mrl8dkz1fdSeJ2vkQ
 Uk+eJ7k1zfSkO6sswU5SyGG7d2kOo2ctVGDLeWbs07I3LOG0QL3jp0drodhDmQTEfpD2vTXw8
 W11PxG2O0zEK2e0STGtQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_141348_177046_8D59730E 
X-CRM114-Status: GOOD (  13.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, damien.lemoal@wdc.com, aou@eecs.berkeley.edu,
 cyril.jean@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, jassisinghbrar@gmail.com, atish.patra@wdc.com,
 anup.patel@wdc.com, robh+dt@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, lewis.hanly@microchip.com,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8032099878016441068=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8032099878016441068==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YrQNB5Deg1WGKZi3"
Content-Disposition: inline


--YrQNB5Deg1WGKZi3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2020 at 11:02:42AM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> This driver adds support for the single mailbox channel of the MSS
> system controller on the Microchip PolarFire SoC.

Out of my curiosity: What is MSS? Is it the Microprocessor Subsystem in
the SoC?

(It isn't quite clear from the PolarFire documentation I could find)

>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
[...]
> +config MPFS_MBOX
> +	tristate "MPFS Mailbox"

"MPFS" in the title seems (to me) a bit too obscure for the uninitiated.
Perhaps you could use something slightly longer that mentions Microchip
and/or the PolarFire series?

> +++ b/drivers/mailbox/mailbox-mpfs.c
> @@ -0,0 +1,285 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Microchip MPFS system controller/mailbox controller driver

The same might apply here.


Best regards,
Jonathan Neusch=C3=A4fer

--YrQNB5Deg1WGKZi3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl/GT24ACgkQCDBEmo7z
X9vLPg/9HXIgvL+0QiHxk0z5m2E2vboBkUMD91d2NyxSgHg3M1m1IObVvevEguHI
ixifEXKpXgMIAnxqwGRZZ66PZCrFvBRfEpumMf1bVnylLfpuFJKPF6PjSDoJXvED
4GsUQhJwkrHxwm3ADPOh4fSqiRl+QSP1h6FckdZnhBabfF/wTZ3whYyJ22pV9brB
5zPLDiRob/LxzRlr9ba22HgpFEn28VZa/kC2OWF9cXfrU5HLA9+63hU44+9yBc2P
d4V1990W0y1nT9GNqJZuB3YZJlps+cSzrghUU1s1FuBTeSZMxJK/dqq18eqLjVtr
UZybZGy0ZUntpYJ2Z5V0/bE1Gb69QW0vR6urR3AdWzkLjGNh7hnCZ8JB61eFHMEH
ucLtV2W6v9utNBWrasbKMrbrxQnjRefEOoMj3XBw8MOOUdu99yiQwa+NVSNxJIZb
0NHJF0KaCAeNRJKEGhYi8WVbxCTNSwwHpg6CW0Ung7OwFKDkXjGyAL9F7gnFKqRO
zM1pzWm55Dro7la/7ZE9Y5oUrjamDKzhVK3VFTYQo+ieREnVnuaUxmtcCtHrp8G0
a8mCmqFQK5k6scsm6YvcFfI+JilklC4jndFc4G9S8oKv9FLwpSbtKe79NnrszUK3
9ZQXg9rRIHTbRxNpMXBJVSFMENDli4W6pieSWM+yNqq+KN/nwzo=
=13L1
-----END PGP SIGNATURE-----

--YrQNB5Deg1WGKZi3--


--===============8032099878016441068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8032099878016441068==--

