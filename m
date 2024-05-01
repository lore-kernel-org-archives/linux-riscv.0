Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CFAC4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 11:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuZCQ/AjqoZvJjVrp7LxevRxw9uQAKrRSBlr2n9DB8Y=; b=ASTOb8cPJCrDpQqf7OcTDXJn/u
	U2Txt3oA2KmXXH3HWzyUrslI1ADkJXxkZViCDNlZe4CdA3man+BF4ggqq8ADAjfIraVlz1fwcBAXT
	ng9jDtGha66xlTFik+LmR9mGCS2ZZ46pFD9iqYf0i56i8QQ09XahYv+iCW+CULWW8P5RmvvdX3Xzk
	GCUp4B617T1TDwm/HFR/xNYQrG+gC/xQT7zxgxYrEZ7ir1RKQjXDiJ2JuOzCH8QS4QpH1jipL8zjs
	XEHRD2yE6l/3czKMqksLFwo41i7539UTDs+KtWUN9O6JBu9GAYJfRtegoXio5/urYrLcNn2LK0b2b
	y6QlQCNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s28H7-00000009E4v-2V1f;
	Wed, 01 May 2024 11:37:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s28H3-00000009E39-3c40;
	Wed, 01 May 2024 11:37:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4751261782;
	Wed,  1 May 2024 11:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EDF8C32789;
	Wed,  1 May 2024 11:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714563441;
	bh=MP62atQMR9QZoG0+ZlmS5Hnq2cah7KkCkJlRp2jaF4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=beA3KVgrsWenCerL/qvg7nGJ1js6iXuqGs3AptzAocKB/boxOcYGnp3XkmaF/2oAO
	 oX/IKgwc3iepDK0HUg4Io2c4i03pdfDpZgk1kcov4Ai/aBxurHiyiAX6HmVvpU/2SO
	 NUgp2LZev45f9DvID3VJ/ctqV7scYd+UBaa9jEA43ipsr+v4I9z5uvqE1vmo0LXCpJ
	 qbaaeWs//uQyrcYV7j53qJtIC7z+cFGAY0qdpMGpg3dAbcmAZGjn0tM0K556QYzqkQ
	 0hJcGqFhq9jdyXi0dahmnkLEGQ+9rxMrR1yFQRySAqIuiMalxkuwm595dFktELebK8
	 aVetVR6dPCr+Q==
Date: Wed, 1 May 2024 12:37:14 +0100
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
Subject: Re: [PATCH v4 07/16] riscv: cpufeature: Extract common elements from
 extension checking
Message-ID: <20240501-probable-unfunded-746ef6ae1853@spud>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-7-b692f3c516ec@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-7-b692f3c516ec@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_043722_005867_5E612893 
X-CRM114-Status: GOOD (  17.63  )
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
Content-Type: multipart/mixed; boundary="===============4485138158328834730=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4485138158328834730==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4cVAmCcvx4abtooG"
Content-Disposition: inline


--4cVAmCcvx4abtooG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 02:29:21PM -0700, Charlie Jenkins wrote:
> The __riscv_has_extension_likely() and __riscv_has_extension_unlikely()
> functions from the vendor_extensions.h can be used to simplify the
> standard extension checking code as well. Migrate those functions to
> cpufeature.h and reorganize the code in the file to use the functions.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/cpufeature.h        | 78 +++++++++++++++++-------=
------
>  arch/riscv/include/asm/vendor_extensions.h | 28 -----------
>  2 files changed, 44 insertions(+), 62 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index fedd479ccfd1..17896ec9ec11 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -98,59 +98,66 @@ extern bool riscv_isa_fallback;
> =20
>  unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
> =20
> +#define EXT_ALL_VENDORS		0

It's not really "all vendors", it's standard. Otherwise, this seems all
grand to me,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--4cVAmCcvx4abtooG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjIpagAKCRB4tDGHoIJi
0nqbAQDotPME6y45R4f68eXuCnbyY4XAOyDUzD3fL8AW4YgGDAD/VCUttdmY/5WW
rxMqmWx1QCw9yGME4Abt8BHVFnG4ZgI=
=cdZM
-----END PGP SIGNATURE-----

--4cVAmCcvx4abtooG--


--===============4485138158328834730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4485138158328834730==--

