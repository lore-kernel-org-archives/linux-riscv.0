Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51044C77B7C
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 21:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nacb8RcOHwtGZvl4y69qTcWtHzsy1bY3Eehkk4g+y8o=; b=lmRCwT8j9ZMG+Jh/Nd1W+dDwWD
	BQdTK0RRyg+rzJV6kZgB4qKCqTgGbfzb0EdefgwJ6xuGbQYdtSvMU6GdG+JEsMCAgrM4r9EbuqL2p
	lEn9fSUeM6jj9Mr5J3iUrAHqkz9gLhK9TxSp1FkGcd4r87wFlUI5dsuGpAuhAja3gqVnlReG4LiYp
	dHhPqWy5FPswQUVZES+EsgL8EkibyuKQWDSERzyFfKgOtZDZBkRsqLSOb7E4fftqD0VZLC/odYub+
	HZfAQqH4R4xFLCd+Ds6a1fPvqC7NwUl6WmmmZyPRfQwrc4wlacFChobi1BQoVC3AOyLz1PDKJFiI0
	58DMuZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvlp2-00Ghl7-16;
	Sun, 07 May 2023 21:21:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvloz-00Ghkj-0t
	for linux-riscv@lists.infradead.org;
	Sun, 07 May 2023 21:21:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9BF6E60E06;
	Sun,  7 May 2023 21:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77952C433D2;
	Sun,  7 May 2023 21:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683494492;
	bh=clnO7AEkW4tSMcED4bSRmePf7YYp7OwuCNoz2foxxKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UoJWOWKW7Fdf0O1FX8agKw7fkKTemhNTwr3aG9wWfxm/l16CXgqNTirCQeL/Nrq7S
	 izsov4GvAy6nHzgpdWrmvzMTyiQFie/KIg9v7B6bnfn42EZhFBe3AhOYY5EOwiMug1
	 xBjIMcEdZt2AErspoo4dWXY2FZ9Pu0D+HW2bQctnij5hyhgJZ/WLyNTIGmN8eAEx5D
	 JRRI3uFV8xwrlpaQpdYsGWqpFN6tibBobyJt9k3Yzo0vakCmyu8bLoh7lHNy1jC65d
	 LOuCK5FfwcwgfBTGe2KL2pi63kClSEOMferAVn9ain1j2NpkZgSUaz7GjdMEjzh+0P
	 KWC1mSDH2rdwg==
Date: Sun, 7 May 2023 22:21:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH 5/5] MAINTAINERS: add entry for T-HEAD RISC-V SoC
Message-ID: <20230507-woof-eldercare-f1323b10bde6@spud>
References: <20230507182304.2934-1-jszhang@kernel.org>
 <20230507182304.2934-6-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230507182304.2934-6-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_142133_362458_F6DE8A36 
X-CRM114-Status: GOOD (  14.76  )
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
Content-Type: multipart/mixed; boundary="===============2442601326292731837=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2442601326292731837==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q5vBHBzSkO7wX8v6"
Content-Disposition: inline


--Q5vBHBzSkO7wX8v6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jisheng,

On Mon, May 08, 2023 at 02:23:04AM +0800, Jisheng Zhang wrote:
> I would like to temporarily maintain the T-HEAD RISC-V SoC support.

What does "temporarily" mean?

>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7e0b87d5aa2e..e1e51accec4f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18155,6 +18155,12 @@ T:	git https://git.kernel.org/pub/scm/linux/kern=
el/git/conor/linux.git/
>  F:	Documentation/devicetree/bindings/riscv/
>  F:	arch/riscv/boot/dts/
> =20
> +RISC-V THEAD SoC SUPPORT

Miniscule nit, "T-HEAD"?

Cheers,
Conor.

> +M:	Jisheng Zhang <jszhang@kernel.org>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +F:	arch/riscv/boot/dts/thead/
> +
>  RNBD BLOCK DRIVERS
>  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
>  M:	Jack Wang <jinpu.wang@ionos.com>
> --=20
> 2.40.0
>=20

--Q5vBHBzSkO7wX8v6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFgWVgAKCRB4tDGHoIJi
0tCdAP962Sjs0r22MIRXpkuEO+owajWsrPMAC5JdjNIjVoJT2AD+M53WjTZHRFzy
hsq80PfTplWqHa590DogB9gCVUc8Igk=
=KW65
-----END PGP SIGNATURE-----

--Q5vBHBzSkO7wX8v6--


--===============2442601326292731837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2442601326292731837==--

