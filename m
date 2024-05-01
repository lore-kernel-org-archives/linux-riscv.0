Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C7FC4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 11:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6k4X4cVtWhMJhNYE2+UzqdD2VZgfJcpSVfO5Jx9D6ns=; b=MmsCgtWJPZ3P6aygShsQz4htMM
	2e5rpJOiZNXu2Eu3/v5L0jlqJIxdo4Z57u4ah0qd9q8oMdQsR6Ww5W+EY/dfUb3idc7OmPX57IAyo
	nO+3LpoO0veqR4JXFChkvijmoDjhDCHADROXv3TCCXBGGW/8hP3njyBqpW8nzjcIv6kNVH9uuzVs3
	h3OVHoOH91xWVuOKXG33S10uq3bwdrqdxKnytwcSRqvBsjIRWtYLExCQXr7O2mW2cUYy4W9Lcajm6
	BiyTqh6zQNz9kCD6EVWNPgpjuqwC4teY80JlDEn2zI1RPFfDBHBjwWZixgIdTYoQZdt3+iToBkUua
	yHHyMN/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2802-00000009BlK-3ZsH;
	Wed, 01 May 2024 11:19:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s27zz-00000009Bka-1AC1;
	Wed, 01 May 2024 11:19:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B6E8A61892;
	Wed,  1 May 2024 11:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7021C113CC;
	Wed,  1 May 2024 11:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714562381;
	bh=NdA764WJcGvt8lXly8jeVIEutQMXNgk81JN1Ta7vWVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r1GBh8g178zlWYlSPyVe2IH0YcLY8mAJwRU9UH6hXxlYt1gtua7k+rREM54kTau8v
	 Y7H5zBcJuIl+SZda1BS1vSVtZAvg3vHs7pYF6qdrJGk5t2JULK+jPJSDUbfF/lFJnH
	 mMet8WFbpQw6okf2wyuvVSnse3Sy2Je/ak+0cQNHc1F2ZLmFtcIkEnjQMc3awKM1RT
	 oo9KexsvtcE8/ZSxRErW4WHCu/GL31Ut8GKqV/Ce4A1OlM4v/AttF/xsFREivm2Y6/
	 d2oip2TN9cSMH8U+W9EJskrejkG8sx4vcgkggrLIEBTr5l8AiJx7BN4XblhE8sNr8g
	 yR40X/LPEX0Ig==
Date: Wed, 1 May 2024 12:19:34 +0100
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
Subject: Re: [PATCH v4 05/16] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <20240501-pelican-throwaway-da84be7dac30@spud>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-5-b692f3c516ec@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-5-b692f3c516ec@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_041943_429959_0FA64324 
X-CRM114-Status: GOOD (  19.86  )
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
Content-Type: multipart/mixed; boundary="===============8797037328653037664=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8797037328653037664==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p3ofyY8PZFrt+4od"
Content-Disposition: inline


--p3ofyY8PZFrt+4od
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 02:29:19PM -0700, Charlie Jenkins wrote:
> @@ -353,6 +336,10 @@ static void __init riscv_parse_isa_string(unsigned l=
ong *this_hwcap, struct risc
>  		bool ext_long =3D false, ext_err =3D false;
> =20
>  		switch (*ext) {
> +		case 'x':
> +		case 'X':
> +			pr_warn_once("Vendor extensions are ignored in riscv,isa. Use riscv,i=
sa-extensions instead.");
> +			continue;

Yeah, so this is not right - you need to find the end of the extension
before containing - for example if I had a system with
rv64imafdcxconorkwe, you get something like:
[    0.000000] CPU with hartid=3D0 is not available
[    0.000000] Falling back to deprecated "riscv,isa"
[    0.000000] Vendor extensions are ignored in riscv,isa. Use riscv,isa-ex=
tensions instead.
[    0.000000] riscv: base ISA extensions acdefikmnorw
[    0.000000] riscv: ELF capabilities acdfim

kwe are all pretty safe letters, but suppose one was a v..
I think you can just yoink the code from the s/z case:

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 20bc9ba6b7a2..4daedba7961f 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -338,8 +338,19 @@ static void __init riscv_parse_isa_string(unsigned lon=
g *this_hwcap, struct risc
 		switch (*ext) {
 		case 'x':
 		case 'X':
-			pr_warn_once("Vendor extensions are ignored in riscv,isa. Use riscv,isa=
-extensions instead.");
-			continue;
+			if (acpi_disabled)
+				pr_warn_once("Vendor extensions are ignored in riscv,isa. Use riscv,is=
a-extensions instead.");
+			/*
+			 * To skip an extension, we find its end.
+			 * As multi-letter extensions must be split from other multi-letter
+			 * extensions with an "_", the end of a multi-letter extension will
+			 * either be the null character or the "_" at the start of the next
+			 * multi-letter extension.
+			 */
+			for (; *isa && *isa !=3D '_'; ++isa)
+				;
+			ext_err =3D true;
+			break;
 		case 's':
 			/*
 			 * Workaround for invalid single-letter 's' & 'u' (QEMU).

You'll note that I made the dt property error dt only, this function
gets called for ACPI too. I think the skip is pretty safe there though
at the moment, we've not established any meanings yet for vendor stuff
on ACPI.
I think breaking is probably better than using continue - we get the _
skip from outside the switch statement out of that. And ye, I am lazy
so I kept it as a for loop.

Cheers,
Conor.

--p3ofyY8PZFrt+4od
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjIlRgAKCRB4tDGHoIJi
0ugAAPoDPa6ArkzDoKOdltjV690jUcxJanZcOTddmqK/7OVlEQEAxQBqLmw0FIrU
vufC89X3QQxXx0ONQsmNnf3NeXJ//QU=
=Ec6E
-----END PGP SIGNATURE-----

--p3ofyY8PZFrt+4od--


--===============8797037328653037664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8797037328653037664==--

