Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FA1C001CC
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 16:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5TjoVXlmApXoO4tPT04XNARdo4oI5+4nOCgi/l8j/g=; b=IZtW9uwFamPp9/XKtCdBSl9ug3
	/rKDzk5OYW2qZO+2/kg8X1LeF5lPuRQJe9oHrLUjzBf79Jr/2jMOe2U+BNnQGos9BS62yP7mYJ/PK
	1KiGXYIozkevpQuFDqFHAoc/OzVSFNXl0OA2s3f0Ox3Qu2CQ7eVomlIBhgUelR3hMbnz2uGXrIcwP
	Srh/jVdnFefP4OB50a6jOIf6Xc+eCUcpBfcmtFI/jZwSVTNvPL/Ln+KfB/EzuOVSw++ZsbxnRuQtV
	K5o0Wj1v72C7/zhCp7oWmi2izrwRsQ7LO86ZNJDj4JrDTq1CHRMMEozC0Jw+i8UCfMF1l6EgDj3wq
	FR+kPnQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rux4K-0000000D0NV-2aDL;
	Thu, 11 Apr 2024 16:14:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rux4H-0000000D0KZ-08M8
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 16:14:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7BB15620D3;
	Thu, 11 Apr 2024 16:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993BDC072AA;
	Thu, 11 Apr 2024 16:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712852068;
	bh=wX+Sb9KE1goHL85Uuw7AAvgTdqo2KwK3euLm9IJTgao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JsEb+ODwVxBzaUD7a4CzBXXIZu92Ml/s0phvhSArvWN9K8QDWmfl8rE6SQnO9qIxM
	 LEFAkYyNgTM1DjmP0BgRKspC1OqZBxTzb/CUCD4gUEC9Nh17eosafmPmgxXXGVoZRG
	 IcRJ20cZH2zCnj5WPf8MmmNuZJrg4p40KW2/QRJ76ztSIIEQpUjOJUYk07Dpbn7uLp
	 iQQnBNC8TFcQ+IIAMywRzJDEGiAicin/+Y3WuQ2JjJ0LwpHeNnror3DZuqSZY3Tvuo
	 MEUaiigaHRtMO0tL6BLQpHCni+rouQwVtdXCDL32BOTBB6B/yjnaB1oLXI0pCWu0dL
	 5UCOWWnzYCPmA==
Date: Thu, 11 Apr 2024 17:14:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: add initial Milk-V Duo S board
 device tree
Message-ID: <20240411-persuaded-symptom-b14a8cfee57f@spud>
References: <20240409064504.4010353-1-michael.opdenacker@bootlin.com>
 <IA1PR20MB49532A8D4294ADCE0C33A654BB072@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240409-prevent-deepness-2d22bf009b16@spud>
 <IA1PR20MB49534E00CAE29D24F7D7E718BB072@IA1PR20MB4953.namprd20.prod.outlook.com>
 <1514d28a-5e96-4531-a972-894e41902efa@bootlin.com>
 <IA1PR20MB4953CA04D33EA0C7902DFA3ABB062@IA1PR20MB4953.namprd20.prod.outlook.com>
 <ZhZo0iJFSn1te-6d@xhacker>
 <5fdda638-21ba-4fa7-b666-33cf2fd69dda@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <5fdda638-21ba-4fa7-b666-33cf2fd69dda@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_091429_196369_DD5F6C2F 
X-CRM114-Status: GOOD (  16.85  )
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
Content-Type: multipart/mixed; boundary="===============7714471389532843701=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7714471389532843701==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MFXo6Ns2Jdu07e2i"
Content-Disposition: inline


--MFXo6Ns2Jdu07e2i
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 10:35:55AM +0200, Michael Opdenacker wrote:
> Hi Jisheng,
>=20
> On 4/10/24 at 12:24, Jisheng Zhang wrote:
> > setting the correct bus-width is necessary for better performance
> > no-1-8-v can be removed, but it doesn't harm anything because
> > the board doesn't supply 1.8v
> >=20
> > no-mmc and no-sdio to make the probe a bit quicker
>=20
> Many thanks for your advice!
>=20
> However, whether I apply these changes or not,
> git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git is now broken for
> me:
> Error: arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dts:32.1-8 Label or p=
ath
> sdhci0 not found

This is probably just because you need to use the for-next branch of
https://github.com/sophgo/linux.git as your base. Palmer doesn't apply
dts patchs to the riscv repo. Usually working on linux-next is fine for
these kinds of activities.

> I was previously testing with linux-next, but it's now broken too, though=
 in
> a different way:
> [=A0=A0=A0 1.306811] /dev/root: Can't open blockdev
> [=A0=A0=A0 1.311200] VFS: Cannot open root device "/dev/mmcblk0p2" or
> unknown-block(0,0): error -6
>=20
> Shall I submit my updates anyway?

This is probably worth investigating by someone, providing a longer log
would help if you don't wanna do so yourself. Did you rebase on a more
recent linux-next and this cropped up?

--MFXo6Ns2Jdu07e2i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhgMXwAKCRB4tDGHoIJi
0izEAP9BMtHM9XrULQAvBFk8Lzjfx7aDOB1RFamiBRseR4yYvQD+LVtg9ja4UyKL
TWkuivznsZkY8kuYquTYOwl8jiAijQY=
=HZD6
-----END PGP SIGNATURE-----

--MFXo6Ns2Jdu07e2i--


--===============7714471389532843701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7714471389532843701==--

