Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9336C48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 17:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G685PxmOgmSEWT08tO+TKNZmw9WTodqlzWOQiFuaxLk=; b=gZ5kDTi7AJtK6KTJGTJv40bLTq
	h9ZS86orjzvV5ZtCbAbzopa7hXfNvoZyabc0AekrHdE+nEtOxJd4ZbYkaQx6dqbnB8loK+dNAN01u
	WNZh888OILbl0c3SnDrUefr6CTR4GB83o5eSKgAoM4UUZCyK5VsyZkAUTWEoQWavA9ejd/AH578Sl
	UNykG2h9euLZxNILLn9p9+9JzRkWiAldgP2VaBIli/2N6OQMdjBudmmjN5WdT1KvLLSQdudK9MCw4
	IhIFkC75+t937zbZzoSxD66pn0/76sx5x5742o95dMFAu25UUA+f8+SIUUYYaBHclcGMsW8vszwk+
	SY5sOOLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwCH-0000000A4u0-263V;
	Tue, 13 Feb 2024 17:03:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwCF-0000000A4ta-1QrD
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 17:03:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9CE28615AE;
	Tue, 13 Feb 2024 17:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9EBC433C7;
	Tue, 13 Feb 2024 17:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707843830;
	bh=q7+xWVE0I6osa/gPF+FQiuUXTh5GqT+0KjgOI2Rb03w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UgBqo9TxxkDM/5KYqNsrdYxH3cTyb5AnwH9smKkDkQ7xah1lYkkTfDnWx0hnN4Ydo
	 nMn2KKmPAukiw0crNK3sddD33o17oyd80x7x7Z7nW/1vng2CNwPge0Lw3yiygXLy4y
	 +SLg1lKw/XBoFDF5eRd+sYnUBYpKe+G7snQp4LC/CTemZ6m6LWb3Z0hr8lNO7RVZLv
	 wAN9IHeTcvY4yHxTXb7BJcIXAkSN+hw12d5M82WI8QKF341slR7m39jc3+dxN+Of/H
	 BJoO0OQjq8VLAmRjPhoZGZ37hNv0w945z5XuJQy9zQX+iRu9Uvg5COw0HwARh+5gtQ
	 2C9fuA1+BRNeQ==
Date: Tue, 13 Feb 2024 17:03:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan O'Rear <sorear@fastmail.com>
Subject: Re: [PATCH -fixes v2 2/4] dt-bindings: riscv: Add ratified
 privileged ISA versions
Message-ID: <20240213-limping-ether-adbdc205ebc6@spud>
References: <20240213033744.4069020-1-samuel.holland@sifive.com>
 <20240213033744.4069020-3-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240213033744.4069020-3-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_090351_494219_997720DC 
X-CRM114-Status: GOOD (  19.24  )
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
Content-Type: multipart/mixed; boundary="===============5530580133345966076=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5530580133345966076==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yUxwhrkO4imUANZK"
Content-Disposition: inline


--yUxwhrkO4imUANZK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 07:37:33PM -0800, Samuel Holland wrote:
> The baseline for the RISC-V privileged ISA is version 1.10. Using
> features from newer versions of the privileged ISA requires the
> supported version to be reported by platform firmware, either in the ISA
> string (where the binding already accepts version numbers) or in the
> riscv,isa-extensions property. So far two newer versions are ratified.
>=20
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>=20
> Changes in v2:
>  - New patch for v2
>=20
>  .../devicetree/bindings/riscv/extensions.yaml | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 63d81dc895e5..7faf22df01af 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -121,6 +121,16 @@ properties:
>              version of the privileged ISA specification.
> =20
>          # multi-letter extensions, sorted alphanumerically

> +        - const: sm1p11

Why are we beholden to this "1p11" format of RVI's? We have free choice
of characters here, what's stopping us using "machine-v1.11", for
example?

Thanks,
Conor.


> +          description:
> +            The standard Machine ISA v1.11, as ratified in the 20190608
> +            version of the privileged ISA specification.
> +
> +        - const: sm1p12
> +          description:
> +            The standard Machine ISA v1.12, as ratified in the 20211203
> +            version of the privileged ISA specification.
> +
>          - const: smaia
>            description: |
>              The standard Smaia supervisor-level extension for the advanc=
ed
> @@ -134,6 +144,16 @@ properties:
>              added by other RISC-V extensions in H/S/VS/U/VU modes and as
>              ratified at commit a28bfae (Ratified (#7)) of riscv-state-en=
able.
> =20
> +        - const: ss1p11
> +          description:
> +            The standard Supervisor ISA v1.11, as ratified in the 201906=
08
> +            version of the privileged ISA specification.
> +
> +        - const: ss1p12
> +          description:
> +            The standard Supervisor ISA v1.12, as ratified in the 202112=
03
> +            version of the privileged ISA specification.
> +
>          - const: ssaia
>            description: |
>              The standard Ssaia supervisor-level extension for the advanc=
ed
> --=20
> 2.43.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--yUxwhrkO4imUANZK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcug8gAKCRB4tDGHoIJi
0thLAP9cXpHvg9SDbU0RqNcZc4VWrOyPfy1boWluL81Vs60v2wEA+cADBm70GqWU
6KjORhTQX5dBoW0MJ3C7R5KpKm/oegU=
=0J4l
-----END PGP SIGNATURE-----

--yUxwhrkO4imUANZK--


--===============5530580133345966076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5530580133345966076==--

