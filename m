Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2D0C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 13:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BhzorVqsoeIwPkQ083gJVptrbTKUg7srfu2zoUZ65A=; b=PYfwwo3as2ovzFOV1jaqoCQFwv
	QyGgX6wkp2PylGVhHfw9p2pvVaWzsmeTCL+h5D6TKq43JNU2Bg7OueaNtoOiJiM8suyjuqcqHjcE5
	hqcj4JinnzBiuPWYePyYwzqxkUi6MQBeihzxThem9hKpEOq2tcN3NWl8Dupz7S0BQIe6JZzD4s0kE
	LL3qpNn34PeaeXoBFEW5ZubBLLdsyvZvA+cKfv3J8UKhNqqoloCm1HJSQeNB+x9OecU6p+8Tc4Jeb
	wyC3fByGH8z0en5iaQ+x2z928DBlFJVpNBNcIU7hetQThGcao8NVyxr68HCcM7rQmj9RqIf5dZblP
	R5PVhy4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx5AA-0000000G4j5-0EDh;
	Wed, 17 Apr 2024 13:17:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx5A5-0000000G4hq-1vam;
	Wed, 17 Apr 2024 13:17:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A65AFCE1390;
	Wed, 17 Apr 2024 13:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E54BC072AA;
	Wed, 17 Apr 2024 13:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713359834;
	bh=alhGN+BKV7wgbVup4sXt3hrvumvenMTPAR+TvP2En3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rqLKBuk1m5MKL9KVN45H3pwRnjDOdWra/5JlEDljYsjkHbjtEluLcRSZBvoTD4uG5
	 yqoGOZx3DST5aACiilAzj5Ee05RFDVT0orpP3CQDULHkWy/EJkytIowN71HyADeZyX
	 2ozOcx2clYuILK7rSdtJ8mFAo4ZyyL9LsFG4/gGPZdNVnEhSdG2n/bkZ7khozcTb9x
	 ts0aVnzhznRHNSuoxk48yCiB1y8DEOnN1t8VldlHNMk1wzwJRhZri6sw5mNlcEhR3E
	 unRMZMrSMeEt6G+OSSmOnGFKgDQhwi+EcxX5QhwO4RMbJ1x8wpCnHzvg0XacSVmIWH
	 rs08zpsoxouUw==
Date: Wed, 17 Apr 2024 14:17:08 +0100
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
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 00/17] riscv: Support vendor extensions and
 xtheadvector
Message-ID: <20240417-rubdown-ferment-c07abead4edc@spud>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_061717_703774_4C995342 
X-CRM114-Status: GOOD (  11.41  )
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
Content-Type: multipart/mixed; boundary="===============7697418930984555378=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7697418930984555378==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YH2gLI+t3mGjNp/D"
Content-Disposition: inline


--YH2gLI+t3mGjNp/D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 15, 2024 at 09:11:57PM -0700, Charlie Jenkins wrote:
> This patch series ended up much larger than expected, please bear with
> me! The goal here is to support vendor extensions, starting at probing
> the device tree and ending with reporting to userspace.

btw, patches 7 to 13 (inclusive) have compilation issues, eg:
  ../arch/riscv/kernel/sys_hwprobe.c:16:10: fatal error: 'asm/vendor/thead.h' file not found


--YH2gLI+t3mGjNp/D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh/L1AAKCRB4tDGHoIJi
0siXAQDBDEKygyQs+AVjskeLlKrUS4PfJcdGnHVWOEesZlMVawEAx9vUmP2ewJ52
ZeM2jwhjqH1xTmob4w9HdNOB+io3vgM=
=p6Hb
-----END PGP SIGNATURE-----

--YH2gLI+t3mGjNp/D--


--===============7697418930984555378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7697418930984555378==--

