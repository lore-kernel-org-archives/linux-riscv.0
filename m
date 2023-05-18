Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BE4C77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 21:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5H6LwA1KTK6rZh7fwa9FHkwTVoo/cHQyJfARf7yo0x8=; b=R5olLosVyWMcMUOD2tKeMWXAn/
	R2/IyNzDNsSq8wSb/ExOFOG+HDo7ewEbYEOgg4weCTv9NbCigpGO4kKgkt6wGCt8RPWSGeEz4eeYS
	aCVfGlb5FxoC7m+xpaWvXYK/nSzZ6uABvpx3ebqO0fk1bKPJms9Y3q/j9L7Qicn4eOe0mi3JBGsrT
	0TxjJt1YDtmajf7ukdb8NBAq8EMUA0PErhJvbEbz0V/DUVe1hfpAkkiS2cCAkinjexWzk/8ibDnF6
	lorPlEtuzMSOhyeluX5Y5wNNxys8JcJyyofw+dOc1ZjdBuPZkkQ3pP4MFt3eJcJcPoyrknBnoNFpc
	Ke7hk7YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzkmw-00EBls-0t;
	Thu, 18 May 2023 21:03:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzkmt-00EBkt-30
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 21:03:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 32E156157F;
	Thu, 18 May 2023 21:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73627C433D2;
	Thu, 18 May 2023 21:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684443828;
	bh=vLaaNAsorEnigaIcnHbox5e9MfLDFmPSL02ltL0CThc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xtfyc3AH/Z4bEiPI2/cIIfL4R/TXTfp1LMdaPofy66BKsxmK4BCSsQ4y9ljtMcfxF
	 kiPtieucFB3+htqZZzE2+x7w6bMzdTS8OScM2OSUePfozVQmEbJ4MiQy3mRQS2QDyM
	 hSajpT4Y/gKJln3eeXNnXi2dXN16WKenTYIXeZLD93ioxks1aOUWklJWO5QGEBOvBr
	 4ciez26YDs11RzI09tLT/dNpqo2bowWtux2dSgZsKncTH66zDDXOnrFOSybBddT1bi
	 mtHqNwvSNWp6fY5Jik894EPfliNLso6ZfCWrpGB7kPLZtbz3ajBSggLqIq53Ma0XQr
	 /0M/q9yNr05lw==
Date: Thu, 18 May 2023 22:03:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 7/9] riscv: dts: thead: add sipeed Lichee Pi 4A board
 device tree
Message-ID: <20230518-prewar-supervise-847839c67626@spud>
References: <20230518184541.2627-1-jszhang@kernel.org>
 <20230518184541.2627-8-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230518184541.2627-8-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_140352_007699_7BEAD0D8 
X-CRM114-Status: GOOD (  13.11  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Yangtao Li <frank.li@vivo.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============1314320735517865155=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1314320735517865155==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LH4wKagUCviZfHUG"
Content-Disposition: inline


--LH4wKagUCviZfHUG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 02:45:39AM +0800, Jisheng Zhang wrote:
> Sipeed's Lichee Pi 4A development board uses Lichee Module 4A core
> module which is powered by T-HEAD's TH1520 SoC. Add minimal device
> tree files for the core module and the development board.
>=20
> Support basic uart/gpio/dmac drivers, so supports booting to a basic
> shell.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

> +	compatible =3D "sipeed,lichee-pi-4a", "sipeed,lichee-module-4a", "thead=
,th1520";

This patch, modulo my comments elsewhere about the compatibles, seems
fine.

--LH4wKagUCviZfHUG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGaSrgAKCRB4tDGHoIJi
0utXAQCaXuE/e3Se/xdiaQYsIeHovF8GgSLB6XrLFIXpCZiVxwEAvGsxWRFkwJv4
dQph4g75ONu0jX6GjCPQowUalTW/iQc=
=2zzp
-----END PGP SIGNATURE-----

--LH4wKagUCviZfHUG--


--===============1314320735517865155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1314320735517865155==--

