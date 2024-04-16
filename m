Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987CFC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 15:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrlD74iO3Fa3cxikq/2Ee1Ga7OymHLBL18nuqADk+k0=; b=q24necrjbK4xJz7Cp/MS+sWup0
	/O3i7qBQnpfDQzvxEBEFt7eC2Uu0I/j44AKO/e51aKQV/hMrFqTZxnERxpIKuRPGbllH8gxVDMNn5
	N0dCsUlwKll334sBkB2iLsg2fO/WeS7jEHa0O5oiSPbzgE9c+Sn0iNHnN6VfjlXow3+p3ujHLZY8L
	tUjj7bSx0Ew7y+X8JZGgQfpY4ZZvTmCltzHR6ZCZdb7mMD9GsBWUJOVbsR7bNKvGW5uHGhm7UgdhL
	+WpfQ7dNTvAxAa0sDjcCxBg29npeuAsCmvW36PWcDqSiRZidwJLwUr+VsGsalMvBYQCI8SmWMx1C0
	/Ue6+97w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkY6-0000000CheP-0kxX;
	Tue, 16 Apr 2024 15:16:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkY1-0000000Chcx-3Nml;
	Tue, 16 Apr 2024 15:16:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 31DFD61226;
	Tue, 16 Apr 2024 15:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D578C113CE;
	Tue, 16 Apr 2024 15:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713280596;
	bh=InnM2wKHZDVJcxsb32eryq9FZ+eyYPiDT6PDeAxmkcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bmi+PdFUk+pqNCmA5Tv0nMe1Rms4QVLfeQiS3gEo2aznB+h0Md9qBqkDmhELSwa1R
	 t9+iuyni43iZdovlFAk11+AliTSkSgGoT7H+mgYODHPu8nasGgUL/zmkpkE7+oMI7c
	 tbBKUook+UHjhFPKv5g/OCrVnSoawHnjFg49vkvTn2jz+m8UcHyt5Nw26siTYzx7eJ
	 eZ2Cwrvr5w4QWb7V5ibYtiglDiMzL7ydyDO+/rEuFwcxbkYvGyNFgKvAQrlLSigLVW
	 pnhgn1uhMYYILoGbd6MAWFg4yBXocjTlf6qJEdzTRMQ4G9kzfE82E9lw08ZzbXwk2v
	 GYvtZW1LJtf1g==
Date: Tue, 16 Apr 2024 16:16:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 02/17] dt-bindings: riscv: Add xtheadvector ISA
 extension description
Message-ID: <20240416-underwire-bright-b2ab0fa991ec@spud>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
 <20240415-dev-charlie-support_thead_vector_6_9-v2-2-c7d68c603268@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-2-c7d68c603268@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_081637_950325_726539C9 
X-CRM114-Status: GOOD (  16.94  )
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
Content-Type: multipart/mixed; boundary="===============1698864448328744532=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1698864448328744532==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FdN+IanOF5jba0gw"
Content-Disposition: inline


--FdN+IanOF5jba0gw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 09:11:59PM -0700, Charlie Jenkins wrote:
> The xtheadvector ISA extension is described on the T-Head extension spec
> Github page [1] at commit 95358cb2cca9.
>=20
> Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cc=
a9489361c61d3
> 35e03d3134b14133f/xtheadvector.adoc [1]

This should not be wrapped btw.
Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 468c646247aa..99d2a9e8c52d 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -477,6 +477,10 @@ properties:
>              latency, as ratified in commit 56ed795 ("Update
>              riscv-crypto-spec-vector.adoc") of riscv-crypto.
> =20
> +        # vendor extensions, each extension sorted alphanumerically unde=
r the
> +        # vendor they belong to. Vendors are sorted alphanumerically as =
well.
> +
> +        # Andes
>          - const: xandespmu
>            description:
>              The Andes Technology performance monitor extension for count=
er overflow
> @@ -484,5 +488,11 @@ properties:
>              Registers in the AX45MP datasheet.
>              https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-=
5.0.0-Datasheet.pdf
> =20
> +        # T-HEAD
> +        - const: xtheadvector
> +          description:
> +            The T-HEAD specific 0.7.1 vector implementation as written in
> +            https://github.com/T-head-Semi/thead-extension-spec/blob/953=
58cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
> +
>  additionalProperties: true
>  ...
>=20
> --=20
> 2.44.0
>=20

--FdN+IanOF5jba0gw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh6WTgAKCRB4tDGHoIJi
0sMWAP4+aeJt178cyWMEA9Mn4d+S37RsUbed8NjDYrowtrQETAEAti61pmdoJgct
1P4NAn7MiJAgxQW6b5m82/RPqoVkTwo=
=Ucx5
-----END PGP SIGNATURE-----

--FdN+IanOF5jba0gw--


--===============1698864448328744532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1698864448328744532==--

