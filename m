Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730AEC4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 11:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kM0DPRZrOTNXIEFBqvuMlIIXXQ66m7JqDY7FCTrRY94=; b=rQLC7qneE6qkPoCa/5smrj2fu+
	5/eD6x+jzB1J+sGIm6BuANaxtopiGCHrx1eI5/BhGmM6kpfPHTDsGbk9VmYRDP200l9CaHyiAKUHC
	EYR5oHYw/Dg+rPSLrLkccvwtVzAKnVixWNhQsMvc1OtcHRV3x9nyIKvwBwVGOrqw1xVZ7MN7FUUEb
	OaB/s38zVm6qqIfhQPstg2Agr30f0VqM9raX0fcxP35bgbbrfkQ3c2trJfja7uifcr3HLY4x3oF98
	kYYzI4Npcc2sxJycVnJoutDtmMykELk7p5XJub89KS7dKaKh650H2Dvau3Eijkz+YP2gV/LhIKKKf
	w//r+Nuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s28KR-00000009Ezk-196p;
	Wed, 01 May 2024 11:40:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s28KO-00000009Eye-0l9U;
	Wed, 01 May 2024 11:40:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2C177CE12AE;
	Wed,  1 May 2024 11:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9A8C113CC;
	Wed,  1 May 2024 11:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714563645;
	bh=wjSpgVBA1AYrZcgC5XCgSh0SYSTObA/R2PwB5ny4N2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWQrVZmRHD6t4l4m9y9InSm/dWTF32vdD7aRGjavVGSSVvdot/XLB32fC9noC9XwH
	 w+J/4Oat23aTb9B82vofQ22DNvfGaXGWViI6IIKyx8XzeYYtNxaSnfKTrdoEUmDrat
	 aprayiD8//hPgwZ/HgwXG+GzMNQw2c5vb09Dv8FSJApGEjrF/azhi3sA3j0aZXZT4g
	 xix/psYZtkm/Ityc67DQeYgmE9DFcLFuUCkvONgQr7nyNUlKXaZsYg/MKmn7EH2J5t
	 03lQH24dwjGHhRp0t/Jji6+ljB1m1kZeJCXabufwTJmoyHFPw643kpW3V6IOc5CvNW
	 3+fd64QGmZvLA==
Date: Wed, 1 May 2024 12:40:38 +0100
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
Message-ID: <20240501-drivable-deviation-0a493511770c@spud>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-5-b692f3c516ec@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-5-b692f3c516ec@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_044048_585335_E758C593 
X-CRM114-Status: GOOD (  11.47  )
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
Content-Type: multipart/mixed; boundary="===============8559280902866701242=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8559280902866701242==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xHWLnBdUePAybcBR"
Content-Disposition: inline


--xHWLnBdUePAybcBR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 02:29:19PM -0700, Charlie Jenkins wrote:
> Separate vendor extensions out into one struct per vendor
> instead of adding vendor extensions onto riscv_isa_ext.
>=20
> Add a hidden config RISCV_ISA_VENDOR_EXT to conditionally include this
> code.
>=20
> The xtheadvector vendor extension is added using these changes.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/Kconfig                               |  2 +
>  arch/riscv/Kconfig.vendor                        | 19 ++++++
>  arch/riscv/include/asm/cpufeature.h              | 18 ++++++
>  arch/riscv/include/asm/vendor_extensions.h       | 26 ++++++++
>  arch/riscv/include/asm/vendor_extensions/thead.h | 19 ++++++
>  arch/riscv/kernel/Makefile                       |  2 +
>  arch/riscv/kernel/cpufeature.c                   | 77 ++++++++++++++++++=
------
>  arch/riscv/kernel/vendor_extensions.c            | 18 ++++++
>  arch/riscv/kernel/vendor_extensions/Makefile     |  3 +
>  arch/riscv/kernel/vendor_extensions/thead.c      | 36 +++++++++++

I see no modifications to cpu.c here, is it intentional that vendor
stuff isn't gonna show up in /proc/cpuinfo?

--xHWLnBdUePAybcBR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjIqNgAKCRB4tDGHoIJi
0tFmAP9+0phfGvQLL4gYc5HwlKNHCFOZaYtAbKHBrc9NrXK7HQEAqAyjuARwXzQt
BVcKUnRCSkMAcAMLHfb0vHWJR0NQ7QA=
=qPWD
-----END PGP SIGNATURE-----

--xHWLnBdUePAybcBR--


--===============8559280902866701242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8559280902866701242==--

