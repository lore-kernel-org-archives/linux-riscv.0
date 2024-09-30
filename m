Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50627CE8347
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrtvltvA0YmUq+pcLIvInbKWNpZhNKf54wdhBHx6sOo=; b=FBmp7K9eeAboKdNmK04tRTEgvf
	/EcTwbxRUiGfjSxciH4zlK08NlPg6aj3Wl7FqIHUVeu1M+OnBGAc3zcrAzE4Y1fNwqn/2dzvIcHjZ
	AQCx2a0wb3qt0+3WUmKyP2YehlzC9yoChLmo3d9AkFrPqiR2S/fedez8VWsSQt/RXKtK6JFy0nrN3
	kpMSwCO8F/Hww/gCsCH/bpbCdWLE7eaS07PkJ3hEjtV4FyzaNVhQf0+QHFhpD4Qdc9so6A2JcPq5d
	Hy9Lm4sEsx4Tv0Y4Z097B1NiiXPO6NY99Al9cJGYhH1HadSjSMw5ZSi3cF3dxfnTbmmSe4yRM/xiT
	zZ7R7Q1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHDF-0000000HUGe-2uXJ;
	Mon, 30 Sep 2024 14:17:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svGzw-0000000HRTM-16Nr
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 14:03:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F4735C368E;
	Mon, 30 Sep 2024 14:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9EC5C4CEC7;
	Mon, 30 Sep 2024 14:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727705015;
	bh=n9FmQC/+ud4ALP/dei2PvvmBb/ep9cvZ55TARYIhK3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EMmTUZkeLd2uEQYEJvvhabRZf6fBLb8oRAeinOCmCA7ft+KbDBzOhWA3zqoO3j4c9
	 whxPrbrl42KRAOsBRjUMXKKY2OqXcBLj0zojK/uFMxDh2bSVW5eS577LPO8MF2VOpO
	 jWWuGmyoPf6MYA9fpHOGJJ4JHfnrMRNtKLu5vJZZTIv72ahOzZ+0M0sIDdBqD4DdKn
	 NVjsO5OvfbJo25TB1B/GvBcTTR/y/z2kucF25sW3CLbs/i1qB14sM5YeeXGJbHXdpF
	 C1oDM4VC7P5gd6YSNMqJpqe/qZceiq8CTEPfJIexE09FMQpBuQ2lKqPXd0cw8B83te
	 P8YhxzfyOKKsQ==
Date: Mon, 30 Sep 2024 15:03:31 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [linux][PATCH v2 00/20] Add support for Microchip PIC64GX
 Curiosity Kit
Message-ID: <20240930-anointer-pork-ff98fd24bb2f@spud>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_070336_367446_8F2E1FC4 
X-CRM114-Status: GOOD (  15.21  )
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
Content-Type: multipart/mixed; boundary="===============6580573983142201672=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6580573983142201672==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Bi4Iy04meFpjwUlk"
Content-Disposition: inline


--Bi4Iy04meFpjwUlk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 10:54:29AM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> Changes since v1:
> - Limit sdhci to HS (High Speed, 50MHz at 3.3V) mode max
> - Fix I2C dt-bindings, remove microchip,mpfs-i2c fallback
> - remove duplicated pic64gx-clock.h
> - Update Microchip dts Makefile
> - Update PIC64GX dts and dtsi (fix model, sort node)
> - Remove microchip,pic64gx-clock.h present in previous patchset
> - Reword commits messages
>=20
> Hi all,
>=20
> This V2 patchset is incomplete and doesn't address all the
> comments from the V1 patchset. More precisely the request on the following
> commit have not been addressed:
> [PATCH 08/17] dt-bindings: clock: mpfs-clkcfg: Add PIC64GX compatibility
> This will be fix in a V3 coming in due time.

It's not really clear from this comment that there are other problems
that were in the v1 that have remained in the v2 - the mailbox and
system controller feedback that I gave on v1. I've pointed all three out
again here against the relevant patches, and will hopefully have a
non-RFC implementation of what I want the pic64gx based on w.r.t
clock/mailbox sent this week.

Cheers,
Conor.

--Bi4Iy04meFpjwUlk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvqvswAKCRB4tDGHoIJi
0ux+AP44g8SVRPTsEtBUrGT8sjJzQD/PNX1CI6t3A915K4DUiwD/Wk/Re+Lvh1/J
JT/13uf5wiEqAoqNLvCj2nEPMK/55gQ=
=sQEy
-----END PGP SIGNATURE-----

--Bi4Iy04meFpjwUlk--


--===============6580573983142201672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6580573983142201672==--

