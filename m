Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDE6CD342A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 17:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hz84XOqzbzGmGgPK8AsMJ7FghfEouVwdcUBlXsLDomk=; b=seW828hrWAcnqlqQevGil4A0dg
	5v2pxdzoQP0FRcsJme/uOUbJXpvGb3grj9dIkA3WFrK0jNFLXMbkl+8fM0sqexYdBo13ffnyUWuFy
	s/uYXs9ry2ovS5gncVI+iBLKXKh+85CBf7f36ngJUrPPTxi82WTEdF+IXzG/6YHOqhuSImjJpjeK5
	tXIDB771nqM+zgMXBe3dvHlvKG/E42t5CA0qN/TS/Alz9opRMZ8fDJmgUpyKV16bljY8wXg9dMtPJ
	a92qQnQW5X4PEhdJRYtIulJ7USRjFgoP5KVhD9JcXLLKF4XQqLgIa8eM1PzTVe7f+3RQt6yYamJWG
	YrnbAdtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJETy-00000009EPF-0MPf;
	Wed, 12 Nov 2025 17:18:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJETw-00000009EOo-03Gl
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 17:18:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38DC3436E9;
	Wed, 12 Nov 2025 17:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1882C4CEF7;
	Wed, 12 Nov 2025 17:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762967885;
	bh=lywOI3ugT5GWb9bwVFXxkmySZuCeiZT6yvSuaKP0HcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwK61djMIzlYVBJc4Z+qj++gbp7r+37xPxbLaPk/yQnLIoBvSOEuXsvHZYOd7uFzw
	 AazikNH2wSTsfKCKQoT4J7Yj/XOt83DkO+Y6752a3ur8rfvKcQyL3Md9GHy8pzJj39
	 a+xb2ppjv/PZ2gTEf+8OjgIlhSFPRC/2nMbtXTH7MVDY4S2OpdWnD88oOqp3hdJ/eK
	 UlUcv0XSDLkriDXp1QKO8YIKuxycCakV/M2WvQfoC9HpoLylVoXc7WuafnKiBDQ7Um
	 EoscBrZSBliWNOgV0rJh+az/NLMf1Yj6U23fykSjLTWGDNWPI5v+dSF4nECmNMLnsz
	 IU5A8BD7Dd8PQ==
Date: Wed, 12 Nov 2025 17:17:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>, sophgo@lists.linux.dev,
	linux-serial@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 00/13] riscv: Add initial support for Anlogic DR1V90
Message-ID: <20251112-bazooka-dragster-cf5c508094e3@spud>
References: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_091808_094984_08830C4C 
X-CRM114-Status: GOOD (  15.22  )
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
Content-Type: multipart/mixed; boundary="===============2581436013858354577=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2581436013858354577==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sV5/agMmM68jKYjx"
Content-Disposition: inline


--sV5/agMmM68jKYjx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 05:41:35PM +0800, Junhui Liu wrote:
> This introduces initial support for the Anlogic DR1V90 SoC [1] and the
> Milianke MLKPAI-FS01 [2] board.
>=20
> The DR1V90 is a RISC-V based FPSoC from Anlogic, featuring a Nuclei
> UX900 [3] core as its processing system (PS) and 94,464 LUTs in the
> programmable logic (PL) part. The Milianke MLKPAI-FS01 board is one of
> the first platforms based on this SoC, with UART1 routed to a Type-C
> interface for console access.
>=20
> Tested on the Milianke MLKPAI-FS01 board with both the vendor's OpenSBI
> and the not-yet-upstreamed mainline OpenSBI [4], as well as the vendor=E2=
=80=99s
> U-Boot. Because the vendor=E2=80=99s OpenSBI is loaded at 0x1f300000, we =
have
> to additionally reserve the DRAM region 0x1fe00000=E2=80=930x1fffffff to =
prevent
> overlap if using vendor's OpenSBI.
>=20
> Link: https://www.anlogic.com/product/fpga/saldragon/dr1 [1]
> Link: https://www.milianke.com/product-item-104.html [2]
> Link: https://nucleisys.com/product/900.php [3]
> Link: https://github.com/pigmoral/opensbi/tree/dr1v90 [4]

Thanks for grabbing the irqchip stuff Thomas.

I've applied this, with myself listed as maintainer. I set the status to
"Odd Fixes" because I will be doing no work on it and only applying
patches that people send in. I'll happy pass the platform off to someone
qualified to maintain it, should that person be willing to do so :)

Patches are here:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=3Dan=
logic-initial

I'll submit as a standalone PR to Arnd et al over in the soc group for
the next release.

Cheers,
Conor.

--sV5/agMmM68jKYjx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRTBRQAKCRB4tDGHoIJi
0m7BAQD1yYi9jfzMwFoKsn729d+GEAmzldurXKdZYtAcmWmIdAEAxWTgsRJKilvT
RFkLQvvfFeBChW/ncbEBG5CxBatGEg0=
=CwfP
-----END PGP SIGNATURE-----

--sV5/agMmM68jKYjx--


--===============2581436013858354577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2581436013858354577==--

