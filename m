Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696B0C27C4F
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jun 2024 13:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHYi17/yydwJ7JumxKoyIJLOmMG2LgvY/Pt4cRrOYk0=; b=BaWjF55TYEm17hzCSAO/+vcuUh
	5a/HUQBUaxwz1n1awbBEEd8LTBRORC/nzGCCnxwf3PjezLqsEyV1os2l49a6y5lE/nRcG6hjspYgd
	a0WwJSXz+J9rKqV5O4XmqvYiRBaby6T/5MYsYYXFM76ab1bPiq/hIPgf0QHNrBYQH4qEJ50JRIEMg
	Elm+/CI6ZUrK04Nkhkr2xPLM64W7DumFURKG8RV1g/UpbKhQaRZM5ZWZig3SwSC2kGuc+ySXQ1NJ/
	uYenhhV/s1mSmJz9ufMLS8hwD6BPwlGBbQX9wuxjjUoCoVF1Q+OAZDehmML/5OrHXHZZWcRNVvhSa
	6swzxbDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNuyP-00000000TCr-012O;
	Sun, 30 Jun 2024 13:52:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNuyM-00000000TCJ-28Dr
	for linux-riscv@lists.infradead.org;
	Sun, 30 Jun 2024 13:52:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A641860B4E;
	Sun, 30 Jun 2024 13:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B0DC2BD10;
	Sun, 30 Jun 2024 13:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719755523;
	bh=cKx0d4ITrHDtw1Yenlz2VXJhqqK9XmmncyP3oHvZX0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NrJ8WKONt6dG+tVGeuXMgTh7uWywa69PQJ9QrRSQYUZcwgL4wN8lrB8wXR1JrWFFN
	 rDaO7LQ82EJlNzzAYWbJlXD+//Q9wFIbbkXpmpFFEfQTXfl6R9ZGhq92zoqENmXOJ5
	 TUvPj5U+lhqRfX5AYIY80ZtZYzlCf80lpHEesGzptfpLDM1LCrqyXTZk62cpjYOBek
	 3Xm/RmluDGf1jpwOM5HM+P896GAvfIEhsw93VHNXIuJnARMD9vvcmMjy0u7ER4VJWG
	 QUoG7OcOpipGktFoGSoE4sPAv+o5lSvrgQ7QpT6xkbbOW/EZNfedbDDstSjJiqZyV6
	 lCIJfO7N08l3Q==
Date: Sun, 30 Jun 2024 14:51:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: kanakshilledar111@protonmail.com, Serge Semin <fancer.lancer@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] arch: riscv: thead: implement basic spi
Message-ID: <20240630-generous-carnation-c534f5d84a8a@spud>
References: <20240630063845.116307-1-kanakshilledar@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240630063845.116307-1-kanakshilledar@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_065206_706793_68FD040B 
X-CRM114-Status: GOOD (  18.73  )
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
Content-Type: multipart/mixed; boundary="===============5608293106799544634=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5608293106799544634==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eVSbUZ+H5PdYupqW"
Content-Disposition: inline


--eVSbUZ+H5PdYupqW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 30, 2024 at 12:08:20PM +0530, Kanak Shilledar wrote:
> implemented basic spi support for TH1520 SoC.
> created a fixed clock and a simple spi0 node.
> updated the matching binding to include thead,th1520-spi as compatible.
> added a spidev device in devicetree which will utilise the spi0 node.
> this is usually reserved for a SPI NOR flash which is left unpopulated
> underneath the carrier board. I performed a SPI self loop test using
> tools/spi/spidev_test.c and tried sending `\xDE\xAD\xBE\xEF` and verified
> it is being received correctly. i updated the of_device_id struct in
> drivers/spi/spi-dw-mmio.c to include "thead,th1520-spi" as the compatible.
> this patch also adds basic spi support on beaglev ahead which shares the
> same TH1520 SoC. i have only tested on LicheePi 4A.
>=20
> Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
> ---
>  .../devicetree/bindings/spi/snps,dw-apb-ssi.yaml |  4 ++++
>  .../boot/dts/thead/th1520-beaglev-ahead.dts      |  9 +++++++++
>  .../boot/dts/thead/th1520-lichee-module-4a.dtsi  |  4 ++++
>  .../riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 10 ++++++++++
>  arch/riscv/boot/dts/thead/th1520.dtsi            | 16 ++++++++++++++++
>  drivers/spi/spi-dw-mmio.c                        |  1 +

This needs to be 3 different patches - one for the binding, one for the
driver and a final one for the dts files.

> +
> +&spi0 {
> +	status =3D "okay";
> +	spidev@0 {

"spidev" is not a type of device, the nodename should match the type.

> +		compatible =3D "rohm,dh2228fv";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <500000>;
> +	};
> +};

I'll put money on you not having a dh2228fv on this board. Document what
you actually have on it please, not what allows you to probe the spidev
driver in linux.

Thanks,
Conor.

--eVSbUZ+H5PdYupqW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoFi+QAKCRB4tDGHoIJi
0p/gAQCLljnYLl8vueT7x7bP7BbxcvpOjPRbZHWtZI7hHpiClwD+IXxTFRklvK2o
7ydwy5gESot6/RpSP9MJ3N+FhDBfTAI=
=Clsg
-----END PGP SIGNATURE-----

--eVSbUZ+H5PdYupqW--


--===============5608293106799544634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5608293106799544634==--

