Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDB0C04A6A
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 14:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsxmpGL0d+SU4lMLVeBhrJWf7ge/ZVZHLXaKvoc82ho=; b=QJ393Ma1U9XsGgMWzYhwDJp52E
	TExKVvXGT6FmCOw9D7tcsWIk4TyLuA9ig8CEfqJ8ffCZU6+u2wpZ6aygfeEOzOlsDk4oCjyCN8vEC
	gWhv+UUu8h+mdAMhh2evi9I+DpsF+A+z7T5FWHb0EmnoHolBb2QMPdb5x+3nDbaLIk49oNjx9KaYA
	QXQjRH3DV3203WT6KKW28RS6GtU1CIhrW1lopdmaeo4b3UOZJT9vwoATod45ZP5t/t6Z8oSEwuN2H
	kDMm0U0bqvrZATOFbqQqgrorouCE107UNqqnqqs9UxZfl4ApJaMjSPLWNlJVtlQs8JFc7GZoo7AWS
	TDQUUpqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRCli-0054ug-1P;
	Wed, 02 Aug 2023 14:24:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRCld-0054uI-2n
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 14:24:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 51957619BA;
	Wed,  2 Aug 2023 14:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19625C433C7;
	Wed,  2 Aug 2023 14:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690986240;
	bh=alQXP1plDlIzOdPZ+hOczPUVcy4kkL/UaJLqAUyH47g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BMIJi8fm3pMwHyeqUDAsjK403YwJY+Tk2UDg/cRjWERPxVBabUYf8ZGBtafjdbz0y
	 h4BiZNQvWMtw8LN3tiWKc1tyYt67nReqTy9A4DYUfpdfb9LhCjvalzgJGrYUvMJeVI
	 HKDJtxoBUGeZdGVxgH+Ve4CVskJLaftkrqukzYQHK7tS+Z5RNwgNku8WOZS7ciBrv1
	 bH1PP3N0y83HZPz/Szfpk5xKlaPP9qWZCdsrV8Q1pRrVQ8SX8dWC3neCWYTHT4HsGK
	 Lw6iTj9tLp4Dj3uABG2RBq0UWrPYGJJjuLZQaCpswgbMXoyrpBFl9UNwcssZX+hhiB
	 QzQ+X/HqgPvsw==
Date: Wed, 2 Aug 2023 15:23:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Laurentiu-Cristian Duca <laurentiu.duca@gmail.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: dts - linux,usable-memory
Message-ID: <20230802-palpitate-defection-4908b4cbd142@spud>
References: <CAPm8-H43P4WrgibV2MGNFZt7ommkchAeom4m0Kt3N-CsG6D9RA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPm8-H43P4WrgibV2MGNFZt7ommkchAeom4m0Kt3N-CsG6D9RA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_072401_947195_7445E0AE 
X-CRM114-Status: GOOD (  13.30  )
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
Content-Type: multipart/mixed; boundary="===============6797283013612178944=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6797283013612178944==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d7ZWR+zi0uZWHrll"
Content-Disposition: inline


--d7ZWR+zi0uZWHrll
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, Aug 02, 2023 at 04:51:47PM +0300, Laurentiu-Cristian Duca wrote:
>   my name is laurentiu-cristian duca and i am an open-source enthusiast.
> lately i have tried to use the linux,usable-memory in the dts memory node
> and linux freezes.
>   if i use only reg, linux boots fine.
>   does anybody used linux,usable-memory and can you show a working exampl=
e.
>=20
>   here is what i tried
>         memory@80000000 {
>                 device_type =3D "memory";
>                 reg =3D <0x0 0x80000000 0x0 0x700000>;
>                 //linux,usable-memory =3D <0x80000000 0x700000>;
>         };

What are you actually doing when you freeze? A normal boot? Kexec?
What hardware is this?
Are you using OpenSBI, and if so what version?
What version of the kernel is this?

Thanks,
Conor.

--d7ZWR+zi0uZWHrll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMpm/QAKCRB4tDGHoIJi
0q7OAP9tpQzMroAOoOl45vL7M1/GEOT2AOrec6qWy1kv73vY8AEAuWG/c5yq478n
AFZCmi1f2o4oMMi2xXHCBCy8naipOQs=
=KdHt
-----END PGP SIGNATURE-----

--d7ZWR+zi0uZWHrll--


--===============6797283013612178944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6797283013612178944==--

