Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695A8C44532
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 15:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTepchb1A6dXBVqZuNL7e1tiBn37tiu+b43T2TmbxLk=; b=mlsLZR5JbNHlrkXVWciLJ2kWGY
	SUlwVVoF7JDefYX6NPZuz9Wd6NKJuwvJBx8OgTSNsDYi1UU4s/upMyD1b69LySlvK+ykXZy1S8TfK
	oTgBI+tc1iYajcggHUUW/qOQ3LIdaQCpr0Y+Tt/FNGdFOm15U3lNQr0/b6zetoz5VQ8VR9Yc34h3p
	i2jNYF5QlemorJ5qQ6lSQ505oe1sF6L3ykkxqgzfdVwK52hdolo1JCLdyq7kfqD3xyurZLgF/ybyA
	NNsjDXq5NjPGljTIMStDhRk1Gkg6O2NfE76Nx/xsJCIjLF8hfAgd5glof3QAi+4HEQBMZzOEa6QL3
	XsWQG8zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCjE-00000009pmH-14fS;
	Tue, 21 Jul 2026 15:49:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCjC-00000009pmB-2DB5
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 15:49:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A91FB600FC;
	Tue, 21 Jul 2026 15:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D611F00A3A;
	Tue, 21 Jul 2026 15:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784648993;
	bh=iNKKMfd2qGosuONW6vQOFUvocvWbDP1gm7vIlrl2QBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lwjp08oBJsYYjgpvLKt4LE1icTycwWsgd1B401Rjl1TJknSR33XVyovNEk5KbM2qy
	 ihTj4IxuzccCKQJ7+h1S6JQiXqnjTxGi4PRSNgQyLOfPJ0wZpC4R8yyNR/bUqgn3fd
	 M3W/ndnXpUKf2O5kL3AtRCLWRr5Wjy291N/1DkvRUc5hIhCWBeT9Uf0gRZc2I7WTa/
	 0glO1lIPCrsUUCNcbmU2WbDEHxtBuAjXy/CLJd0hGhtCsLa9V5U40xt+fWqca9WsHJ
	 IsAPtWwSAT2gxSMDmmm+bC2t1Ck63aYmiHNAtXP2mPPq5VivAMtjLHd/tZx15xR3qo
	 0ilm4K/Oeso9A==
Date: Tue, 21 Jul 2026 16:49:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: vendor-prefixes: Add Sensylink
Message-ID: <20260721-dill-dab-df15585090d2@spud>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
 <20260721-ctl2301-v2-1-ef5fb342872a@linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260721-ctl2301-v2-1-ef5fb342872a@linux.dev>
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
Content-Type: multipart/mixed; boundary="===============7940336722997605613=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7940336722997605613==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DW7VXcYUmFQ8ylSM"
Content-Disposition: inline

--DW7VXcYUmFQ8ylSM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 02:48:27AM -0700, Troy Mitchell wrote:
> Add the vendor prefix for Sensylink Microelectronics.
>=20
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 396044f368e7..22d0d26f1bbd 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1467,6 +1467,8 @@ patternProperties:
>      description: Sensirion AG
>    "^sensortek,.*":
>      description: Sensortek Technology Corporation
> +  "^sensylink,.*":
> +    description: Sensylink Microelectronics Technology Co., Ltd.

Googling the company to see what their website is, I seem to see a
different name for the company: Shanghai Sensylink Microelectronics Inc.
Their website has that with the Shanghai dropped.

Also, probably the commit message should contain
Link: https://en.sensylink.com/

pw-bot: changes-requested

Thanks,
Conor.

>    "^sercomm,.*":
>      description: Sercomm (Suzhou) Corporation
>    "^sff,.*":
>=20
> --=20
> 2.55.0
>=20

--DW7VXcYUmFQ8ylSM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCal+VHAAKCRB4tDGHoIJi
0sX2AP4oo3z9DROVtk1PKea0erVM6Ksfz8ObAp2ab2TndL/oVAD+MZjpOMyvH3M0
gvY2tGnXvqqP3J4jicrK7OmfAVU3cgc=
=KjUj
-----END PGP SIGNATURE-----

--DW7VXcYUmFQ8ylSM--


--===============7940336722997605613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7940336722997605613==--

