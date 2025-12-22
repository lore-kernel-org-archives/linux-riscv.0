Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BE4E6ADFE
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 20:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAWOVc4b7J+w35sXCd+ReA1EJcWldle8egU6ntvec/4=; b=Rto5iM/aCpInc54+vVsv3iIlD0
	uGymjFf4LPbeEdT79SH7GRHzTVqvdncvqoD6dMN0P89SetnBPYWeqwVaKw8a7+eGtqaEFfqn3ThLU
	2u/XD7qymNPm/NIfc7PLz0zbpH4EDidmyVXXLPOnV32aJ3seF2AD8N9nSDl+KQxJf5TJg5abSuoCI
	9ZdE2ZyFb5RdAdkyMmB9M1lU6Z8Mm+nGvZyynGDb7hk2zslLujKJBo+0AmcGKJCjwI9NX39m4Ck5R
	fm/ei0ohwXWnFtteoLijkkFLyYtrIKrBkhiFGxDsiqYtGfg65KsRhzkZtOqkus6B/99s7QmOpoHlf
	1/OCa6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXmxy-0000000EA4z-2geL;
	Mon, 22 Dec 2025 20:57:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXmxv-0000000EA4e-44V7
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 20:57:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D315943AEB;
	Mon, 22 Dec 2025 20:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97982C4CEF1;
	Mon, 22 Dec 2025 20:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766437034;
	bh=ntkxToLftiZf604wAYbiqavOt/eAg7o5YWPPmmXiPj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kBjoitIIZTEiX3VNhpJz2I8AsqrGezL012hxQt1cGFzURala68HX0fLW9Ex30Duf2
	 tsz0pn2Okgff1Kxm7npNnsFj+vt25BuZKNE7c/W3fila96vl3H25A8ssbu3bMrTJc1
	 P+p3WcUhfvBZJ2gDa/E7zTpa+q+jER2NJaqilIOaM5tSMCMyS55Mg3Z/YEch1ZhOnm
	 YikraY+HE8or8cWan/NMnyP3aTQ4rBGSvQsoFGvqROjjljKVuc2imTk4Co9sVIfKUl
	 TZuxsYpNd5UuhTPI/y20cejiAGzYLOCIyzveId2VGYj7JYdmh/qgCBlozMbIVbRHqU
	 E5Y84lzZe77EA==
Date: Mon, 22 Dec 2025 20:57:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 11/13] dt-bindings: riscv: Add Supm extension
 description
Message-ID: <20251222-parasail-resolved-f8014165d903@spud>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-11-3af3f3cd0f8a@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20251222-k3-basic-dt-v2-11-3af3f3cd0f8a@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_125716_056479_2E38D597 
X-CRM114-Status: GOOD (  20.65  )
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
Content-Type: multipart/mixed; boundary="===============8920229007469978535=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8920229007469978535==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qNISUK/sx4KO+kox"
Content-Disposition: inline


--qNISUK/sx4KO+kox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 09:04:21PM +0800, Guodong Xu wrote:
> Add description for the Supm extension. Supm indicates support for pointer
> masking in user mode. Supm is mandatory for RVA23S64.
>=20
> The Supm extension is ratified in commit d70011dde6c2 ("Update to ratified
> state") of riscv-j-extension.
>=20
> Supm depends on either Smnpm or Ssnpm, so add a schema check to enforce
> this dependency.
>=20
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: New patch.
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 16 +++++++++++=
+++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 1066b7e65dab89704dbac449db4aa5605c95b9d3..4997f533b2c0defad88fd5941=
3a6885b5b9e109a 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -267,6 +267,12 @@ properties:
>              ratified in RISC-V Profiles Version 1.0, with commit b1d8066=
05f87
>              ("Updated to ratified state.")
> =20
> +        - const: supm
> +          description: |
> +            The standard Supm extension for pointer masking support in u=
ser
> +            mode as ratified at commit d70011dde6c2 ("Update to ratified=
 state")
> +            of riscv-j-extension.

I'm not yet convinced that this makes sense as this describes how the
consumer of the devicetree behaves not the hardware. How the hardware
behaves is already described by smnpn and ssnpm. I'd really like to
see some commentary from Samuel Holland on either this or on
https://lore.kernel.org/all/20251222-dimmer-wooing-db29fe925498@spud/
before I'd be happy with this change.

> +
>          - const: svade
>            description: |
>              The standard Svade supervisor-level extension for SW-managed=
 PTE A/D
> @@ -892,6 +898,16 @@ properties:
>                  const: shvstvecd
>              - contains:
>                  const: ssstateen
> +      # Supm depends on either Smnpm or Ssnpm
> +      - if:
> +          contains:
> +            const: supm
> +        then:
> +          anyOf:
> +            - contains:
> +                const: smnpm
> +            - contains:
> +                const: ssnpm
>        # Zcb depends on Zca
>        - if:
>            contains:
>=20
> --=20
> 2.43.0
>=20

--qNISUK/sx4KO+kox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUmwogAKCRB4tDGHoIJi
0h7+AP4q3MR0wybpLOqCzJYp5ojUqaGxgeOMP/vyYRTlkr79NwEAtjbxOg0Nvbh+
KL+X8G57GAjyye8tZAYNbOZtnSxcqAY=
=LBwj
-----END PGP SIGNATURE-----

--qNISUK/sx4KO+kox--


--===============8920229007469978535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8920229007469978535==--

