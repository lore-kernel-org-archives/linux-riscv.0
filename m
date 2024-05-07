Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1B0C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 17:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhzc1wfzq1v1z4sQoT0Gt2VYyV92FNH5AR3zaE8q67M=; b=qb6TyO4EGScmekCqlIYzdKuNJa
	1l7yTtZ0R72WXa7zBNLSsYC13esiYBWE/KoTe2K7BFez6+FSRSIv6qDG1kaTddtSzpGHj0sn2vuz9
	zru83WE4QsHD0ScuVMcquD2yT4skF2kJRl8wCUvetW6ZL6VUl7JbvoicYpNCC0UFRRozehE+bnCzS
	Lb8Rfdqyf4n2XlgECgyvTkcdwcebo9wN0qA2d8qVbKFkisPoFBN3qtTyQW+9zXtQ+JVmPIaT0Irn7
	IjC8HgHn6P3jHqcTnFucS1DL6H5WdfaYFtRH0rM2XNtQUW50kt5ym0XFKyA6BoixKpYDiVj+k7hjb
	2LYPTxBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4OVT-0000000CBxG-1XVa;
	Tue, 07 May 2024 17:21:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4OVP-0000000CBwC-1TwK;
	Tue, 07 May 2024 17:21:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 95B7A61826;
	Tue,  7 May 2024 17:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75529C4AF66;
	Tue,  7 May 2024 17:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715102490;
	bh=IDMR67aL+FJpg70JOZa/YqXPWKIXWABsZiy55mqfzgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NHpaEv2jt8RdYDITiy9cW34apA5GulWZo2VGWPOY6kGTB/MLm0oZRf9vNRf+yh1t0
	 nnLFMUAroOpck8gryD83BDIOqV5B1JNQSOHDEgBHku2e0v6SzhePDRTyap9EHC0c0t
	 GLri1U62zVHUBw5Pk+C1zOD3GHkzQWJ63cFDa6XaovjXV/JtqfJCFND6TXfwjy//iX
	 NnB/0+FdFpHCosbJlZsey2qMVPWvlegX/tZ/k9kWNqjSZAbrOQzZ2UMJyxvM4iGfV5
	 LgZ7lVefiDXtvO/aRum2TckSTKmJkPwiSjVXVKOaNrjhjkbeEo/bfNLouO1uapMu4q
	 iSiielqQjuNmw==
Date: Tue, 7 May 2024 18:21:23 +0100
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
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>, Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH v6 00/17] riscv: Support vendor extensions and
 xtheadvector
Message-ID: <20240507-rising-ricotta-1be648c095ed@spud>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_102131_458440_AC6FB5E2 
X-CRM114-Status: GOOD (  12.55  )
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
Content-Type: multipart/mixed; boundary="===============6310423491267991301=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6310423491267991301==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vh6wbBhSwXsR2Sa9"
Content-Disposition: inline


--vh6wbBhSwXsR2Sa9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 03, 2024 at 11:18:15AM -0700, Charlie Jenkins wrote:
> This patch series ended up much larger than expected, please bear with
> me! The goal here is to support vendor extensions, starting at probing
> the device tree and ending with reporting to userspace.

I think I've reviewed all the bits I care about, so thanks for all of
your updates. It'd be nice if Andy could look at the actual vector parts
of it, so I'm adding him to CC.

Cheers,
Conor.


--vh6wbBhSwXsR2Sa9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjpjEwAKCRB4tDGHoIJi
0szIAQDf5iSG/bM8HfBvrIsA44lVF79BoLK1Zcf3ndnVkXn1hQEA42EjkAPJta9g
WY59vTOFOsAcXRSCDp9JbTmwIoNyvwM=
=UC2O
-----END PGP SIGNATURE-----

--vh6wbBhSwXsR2Sa9--


--===============6310423491267991301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6310423491267991301==--

