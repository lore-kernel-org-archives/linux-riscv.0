Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D94C6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 18:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NY9NRILoIWmJkcih9eoLIfWR3fkxlXrl1BWA0HNXvB0=; b=gbE2nBTV1CNoi96jcy221YsV9u
	ynlwphk++Iu9TpTNRwKDvGxy9057ttVYZ2Fxif7sKgIuDsO/QdpTExAJH7oM3Fl2DcHw12erLenqf
	e+d1yogs2wwTNDoSJUQTBVuxOXEE6uKYaGzumOiNi7vJJg5i9n2GMRRtJ0Pv7kpCQvIW3fi6EiVZ+
	Wv2sOkzwEkKLoZjujf/uz4uZ0QP+SaAG+Zj0qHtanHActqT1TE989gJyqbX93PEaeXiGsypBvNT89
	hJsEfLNq8VBy6pdqk9RatptiWAZBf/LTIPGrMX8yr7UPOZta5SIGkuhZyClA8EIvMPLL8cPvDDVDc
	mZyuZ3YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcVuo-00EEgL-2k;
	Wed, 15 Mar 2023 18:31:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcVul-00EEfv-1v
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 18:31:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1F80961E07;
	Wed, 15 Mar 2023 18:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F0FC4339B;
	Wed, 15 Mar 2023 18:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678905114;
	bh=Ncb0gJdx1/flmrdCUnpBam8TTRy0fLGXaXnanEBF8js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eamlRSsJ27eJUlcEAVpLsYZRacIt4E6Zu5/a6HFgZ9sYbHQdwaUNzw1SsXJXSB+az
	 3ghywPTyRf6b9sdLp8lxpI1pM/eHn0hWYAbBJhBPU6KhDOtJAA76MxGW7QhM6ecIB3
	 AMzNdskUthD0X3PjZ0YdbEnBJV+zOE3j/fEx7l+VMVDUW9OLp7+cLLDo09za5mz2q1
	 LsoUUl7fSpSGCIucwgTpLPYf1c938J3tfSC95fmFxNphBDY8llM26gzaz1Sp4M2QP2
	 nf21rFV7J0MZPKeDmtmbY7LeIfpwNi1GAcVOh75hI6zJHyYlwKFoEBK8a6GJz3nzu1
	 tDd2T8mF7eL5A==
Date: Wed, 15 Mar 2023 18:31:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org,
	samuel@sholland.org, guoren@kernel.org, christoph.muellner@vrull.eu,
	conor.dooley@microchip.com, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH RFC 1/2] RISC-V: define the elements of the VCSR vector
 CSR
Message-ID: <7aac603a-6e9a-4e72-b41b-9412e2fe904d@spud>
References: <20230228215435.3366914-1-heiko@sntech.de>
 <20230228215435.3366914-2-heiko@sntech.de>
MIME-Version: 1.0
In-Reply-To: <20230228215435.3366914-2-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_113155_695426_4A336A01 
X-CRM114-Status: GOOD (  14.53  )
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
Content-Type: multipart/mixed; boundary="===============1914620558470068438=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1914620558470068438==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1grvyHc0dstNVZsj"
Content-Disposition: inline


--1grvyHc0dstNVZsj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 10:54:34PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>=20
> The VCSR CSR contains two elements VXRM[2:1] and VXSAT[0].
>=20
> Define constants for those to access the elements in a readable way.
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/include/asm/csr.h | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index add51662b7c3..8b06f2472915 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -176,6 +176,11 @@
>  #define ENVCFG_CBIE_INV			_AC(0x3, UL)
>  #define ENVCFG_FIOM			_AC(0x1, UL)
> =20
> +/* VCSR flags */
> +#define VCSR_VXRM_MASK			3
> +#define VCSR_VXRM_SHIFT			1
> +#define VCSR_VXSAT_MASK			1
> +
>  /* symbolic CSR names: */
>  #define CSR_CYCLE		0xc00
>  #define CSR_TIME		0xc01
> --=20
> 2.39.0
>=20

--1grvyHc0dstNVZsj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBIPFgAKCRB4tDGHoIJi
0sCCAP9uVtBPvDs3b/mh7wVe0vAWF+NNvUE1PNSr3aXv2QEc4wD9H1mI9C++SCPF
F8E/gmmYVFJxXY3gP63CWtf0+4H39Aw=
=16jT
-----END PGP SIGNATURE-----

--1grvyHc0dstNVZsj--


--===============1914620558470068438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1914620558470068438==--

