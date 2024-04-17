Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0999C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 13:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09hQLweAm9Bon3y5HDArHOd8Ba2cu0UgLnUPPZxdFZQ=; b=ypRtvVr6IWmDZudswnJdydzwJl
	W7rfw1DuRdFy6J90dAYUNSJ01oNnsEum7U9RoEaZgXn/V9VZXT5c6hxnbgB4zV/0LOUO88ZoODj1E
	CRA1DusEw06jxiAR33ZIIFOFtRh4JcBVpFeudqW7RiFKP0eboi9ym7AI3KZW6vthzrRBQU8kewvQZ
	+7ejGa37bvz4UPny7E9HCXspCi3pnsCYX/l4rAGFpbpwZf+pMqiWqiLagVgENpimTemJ+v7WvkU9H
	aEh1IGYarqi27lScczdUoT9nc/XDXxWLXPTtOAhjHNv0sJkxZZNt9Eastp+SWVwBJda6/0X9Sct2s
	89b2SsOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx5Yt-0000000GCxG-03BN;
	Wed, 17 Apr 2024 13:42:55 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx5Yp-0000000GCvX-0eOq;
	Wed, 17 Apr 2024 13:42:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 65D1CCE1286;
	Wed, 17 Apr 2024 13:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D799C3277B;
	Wed, 17 Apr 2024 13:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713361368;
	bh=exPu4RcMsk/1+QRfafTnptMZ6ljl6Uz5WGS7JHUbSG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uxe+qeP1yFDPT1hD9RgNKZpz03zbMYoYMhxqPRwisGF9SsPrzxEkUxX75wQv3zBhA
	 BRx4qPfoMxWPdmJwOIK9wFA+qQYzEG1dHt/VODsEgTHspeEyo2FRzPdK/fhuAus2Q8
	 ylR0jMTstUpWiASwRHCg56D+AUdM2rw88Zawp5HQxNXB+vJajPhhiKr+NK9Y/hMrkH
	 P5SN9ZALpHHXlYBftOidVumzDmLewTgO400T9jwqyCuXvtQ/odwwW1dahLq0xrtTMx
	 KE+MFqbTrbccApemLfMPMIb0sr3ngW/lgmXlnzVM1lPk7ua6IcTNR3De9KsJ29aUhp
	 8KxeJSNxWvmBQ==
Date: Wed, 17 Apr 2024 14:42:41 +0100
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
Subject: Re: [PATCH v2 06/17] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <20240417-automaker-baton-bd816e1bd975@spud>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
 <20240415-dev-charlie-support_thead_vector_6_9-v2-6-c7d68c603268@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-6-c7d68c603268@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_064251_538394_DB5ADEFE 
X-CRM114-Status: GOOD (  12.32  )
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
Content-Type: multipart/mixed; boundary="===============4893394491441560689=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4893394491441560689==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p0QSKblu8bR1+Anb"
Content-Disposition: inline


--p0QSKblu8bR1+Anb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 09:12:03PM -0700, Charlie Jenkins wrote:

> @@ -351,6 +343,14 @@ static void __init riscv_parse_isa_string(unsigned l=
ong *this_hwcap, struct risc
>  		bool ext_long =3D false, ext_err =3D false;
> =20
>  		switch (*ext) {
> +		case 'x':
> +		case 'X':
> +			pr_warn("Vendor extensions are ignored in riscv,isa. Use riscv,isa-ex=
tensions instead.");

Was looking for something and noticed this - pr_warn_once() I think.

> +			/*
> +			 * In canonical order, the remaining extensions in the
> +			 * isa string will be vendor extensions so exit.
> +			 */
> +			break;
>  		case 's':
>  			/*
>  			 * Workaround for invalid single-letter 's' & 'u' (QEMU).

--p0QSKblu8bR1+Anb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh/R0QAKCRB4tDGHoIJi
0vzZAQCEhpBLtL/EDT9fUbss6os6B1Bq+MiUtQnftDZaXWVoyAD+LTrtP2tTsvuJ
r6qruyvOjKVA6j/gDB5rHH3TKzICzwk=
=MO+X
-----END PGP SIGNATURE-----

--p0QSKblu8bR1+Anb--


--===============4893394491441560689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4893394491441560689==--

