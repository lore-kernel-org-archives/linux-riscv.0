Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB4EE64012
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 04:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wo5ljtUADLJB/1W5HQ2pnkHCssvKHYQi4fo/QPhmHcw=; b=30ZP7XvHNqBW8Z5Q2EdW5wmbIO
	8PspwdJcUt8EISD4nGA4CUSTY3zfnmp7uu5zMKlk77Rr9d15hLZzB6tR8iIGenti+vwAjHB3iOohl
	915ubS2RITi0NFA3HSDXxKvH3c5fw72NX17qaJ4s1Tc+izs+lTUNUhqypcF1eVeIdFXLkw34+w5V5
	IkxJlgwLhTKuTTseZD5HMDdBhgaFNoVdAuzyDCiUzS/6X9S0m+H//7w8PPWOTnFX4YUoYskcTSk7r
	UHgDkPaDGhWnr9quTg1zTN9AP893XG4GDnFSChSEIrLnlrTg0GpfZBx5im7g8EQhIhBfkktZZiKJD
	JN4t7+Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9FL8-00000003xQX-1t5s;
	Sun, 05 Apr 2026 04:44:02 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9FL5-00000003xQC-0E78
	for linux-riscv@lists.infradead.org;
	Sun, 05 Apr 2026 04:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1775364227;
	bh=y7CXeBOuYe7WW5GdJ5bUQa9x8GPB//iu+ag7v6WwImM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CkxUvMHERx8K+4quCntCV8tA+ksMqAuXA21UMHBASyuWyc7WPF5uaLSY6HVtiLsa7
	 FLNsPC//21tEB44uSbO6/Ck0ilqvcf4IJEhpfd6iWx+ba+5S18NN1qK8rcJhQq/lMW
	 vPzM63K2ytFabUDmmpMekBOzl7AzK4NexdULEn62xyBE2V9kFimoGMRWgNgClwttEY
	 RXGgIOkx/EZAQNz/atdVrcVkKHK/qoz/EWWtCkkjdket3471Bl8qmumi8kuFn3Ifvq
	 R8Kl0kxeLbikpbCJQVylOzi/As5z3hzFeQawv59/d2uDfLa4hJOp86wcXp16qWEijY
	 WxHlmQGnBBIjw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4fpKbl6rR1z4wHv; Sun, 05 Apr 2026 14:43:47 +1000 (AEST)
Date: Sun, 5 Apr 2026 14:43:41 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: devicetree-spec@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev
Subject: Re: Devicetree spec: Specifying /cpus/cpu@* unit address format?
Message-ID: <adHofcKAr7C5YCSA@zatzit>
References: <00ddad5a-02f5-474e-af9c-11ce7716ddfc@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <00ddad5a-02f5-474e-af9c-11ce7716ddfc@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_214359_548064_E53FCA4C 
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
Content-Type: multipart/mixed; boundary="===============6118866234855213412=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6118866234855213412==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F/G3fJTJhrM6n45B"
Content-Disposition: inline


--F/G3fJTJhrM6n45B
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2026 at 06:06:17PM +0800, Vivian Wang wrote:
> (Also posted at: https://github.com/devicetree-org/devicetree-specificati=
on/issues/86 )
>=20
> Hi all,
>=20
> Presently, there seems to be some confusion in the community about the
> format of unit addresses for "/cpus/cpu@*" nodes for a CPU with ID > 9, e=
=2Eg.
>=20
> =A0 =A0 cpu@??? {
> =A0 =A0 =A0 =A0 reg =3D <10>;
> =A0 =A0 =A0 =A0 /* reg =3D <0xa>; */ /* This should be equivalent */
> =A0 =A0 }
>=20
>=20
> Should this be a decimal "cpu@10", or hexadecimal "cpu@a"? I can't find
> any explicit specification.

It should be hex.  That's a general convention for unit addresses.
Before flattened trees, OF essentially never used decimal
representations of things.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--F/G3fJTJhrM6n45B
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmnR6G4ACgkQzQJF27ox
2GfawxAAniXNBqMHwatrWhZhfnBwYG+zYbBqBPr3X8wjwwpBWhglY0IXR8XkdoUk
Zn0gfxCLzh1cKBLzSlDvXte2b1FFcgIPu6V8jEV9kdYkQrClCknZA7KRjmZlDni7
xpUXHgLW2SZDHT2d9Ao3Rg/MWqrS+DAUPfzwElR1ZLIHXM0FRkREpnJfWFja9m/0
aH1JgDwHz+FUGUieeh9RrdnyWVjl5rdlO8DAogTFNOgrn239rsv7El/fm/7aZSvc
iX+XKowv2EW2xIk6/UzaoHFXQ4FQN00NIZPZnfaxO7txWzpyyqH+NNoKYw9257zC
83/hPTWsIzYQ2jSsXKbRG3WQomA+gpkQ28XW7fPHOCNWLLnleSIYhHAK4iWCwlwH
41VhtpLiB/zn7NiS+t/rto0aGC72AW139lcCoJTtS9BsvOoOVt9PG3Bje23v1NRs
/MsLFAtesDSRj/xNMGQzRag2NK9yRd/yh/Wm2PdmT7LmDHUrukmjHlwGLz85/Ck7
s+2pzKzVRYsiMbqv7m3SPWtWTl6y16tin3KHcBZx+V4eh+oT9ZI6dDTfC1YqvNuk
ywT5aHxWfDeFvPPklQC8TzrTwK55twcgL3SJ3g5RcmORt1T8+nNRI4zkXZmFzn2/
aJ6HgJFHo7XBCRGBtuAcI3A7RXAJieqItx8g+O5ER2SfzPBi8FA=
=Fs1W
-----END PGP SIGNATURE-----

--F/G3fJTJhrM6n45B--


--===============6118866234855213412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6118866234855213412==--

