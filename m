Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69A4C3DA41
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 10:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fp9Vc5nLuieRYDysISPKYwKq46K2HzGeXDqReJEMwWM=; b=C2/92CmmG0IkjFYe/3aQdV020T
	XgVOLyolR5ikl9evf/RYThrnnU4PZoscXKqzfIrs8j0JZ2nLlUTmRgGTFdE1b0KrFnjGTmwoDp+0e
	fx1aIFC01LuUsPrA2TDx/ujW95RVFFcK8AJmpnRUQYM5f3PzKKaZ6jE/YY8BFADXTOqnoOke/3YGD
	j17TCIbzH/I/13cSCN4+jeoALDNnMXFjKxl4wcUYWSzc/L4bS9tnIAuQqPWhB+Gv5vx+rjMFm6RmV
	lEvEwv/yJgTLarci3nS4cApvvDVZChUy1Kz25qqaHW3WBwQHH+ICUmwkEvnTqWe9Jxqb6vn8MsAwc
	ef40XeCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRqed-0000000DSA7-0lCX;
	Thu, 11 Jul 2024 10:03:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRqea-0000000DS8b-1COY
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 10:03:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 91BB5CE181C;
	Thu, 11 Jul 2024 10:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579A5C116B1;
	Thu, 11 Jul 2024 10:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720692233;
	bh=bytiMLPV2lOGNSZcnjRWSwf1EM6gvvVUhRuOoOG5GjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SHC/rmrkFJBNnhHWjhfBtFBIlh534rct1k2taOIkDKk+101uvfPXDBsNvBncJHH69
	 6xokRbwj/7Hx+p9lts6SZYwBYKDaQFm/D9krohWerkboJeYKAu3Ase4YYznVo3nOCb
	 mCmvMl7jOA7ZiKV/Hjz2oyXNYDjjECFA7WTQKbMlc3j9Lp5A03CDYohnrx9+4o8aef
	 5qim+/+1Flo7OSlt2K842XSmwyuZoWHFmv1Y9hmSIWRXyMAd0d/Lkc27CwiVcAiF3a
	 xK4wzF9ezHzSwAp+P4h//HqsCb8jyjokeyil3cMRtNyoEjssQTWqOrR/buY2gMj9PV
	 ubTvHOsL3Xy/g==
Date: Thu, 11 Jul 2024 11:03:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Inochi Amaoto <inochiama@outlook.com>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 08/10] riscv: dts: add initial SpacemiT K1 SoC device
 tree
Message-ID: <20240711-legwarmer-repent-b88851e1eefc@spud>
References: <20240709-k1-01-basic-dt-v4-0-ae5bb5e56aaf@gentoo.org>
 <20240709-k1-01-basic-dt-v4-8-ae5bb5e56aaf@gentoo.org>
 <668f8cb0.630a0220.0385.4d00SMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <668f8cb0.630a0220.0385.4d00SMTPIN_ADDED_BROKEN@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_030356_516545_7644967D 
X-CRM114-Status: GOOD (  10.17  )
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
Content-Type: multipart/mixed; boundary="===============4576405424433417922=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4576405424433417922==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ofIF/HTzLj1NJtwG"
Content-Disposition: inline


--ofIF/HTzLj1NJtwG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 07:40:53AM +0000, Yixun Lan wrote:
> Hi All
>=20
> On 03:18 Tue 09 Jul     , Yixun Lan wrote:
> > From: Yangyu Chen <cyy@cyyself.name>
> >=20
> > Banana Pi BPI-F3 motherboard is powered by SpacemiT K1[1].

I seem to have got this message in my inbox 4 times.

--ofIF/HTzLj1NJtwG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZo+uAwAKCRB4tDGHoIJi
0npnAQDSIwrWnFT4oPX+7BLubmQIPoFzlorP/nRxCD2Rk1JVWgD+N7hX/QS8vNkV
AxFOywvGmQe87lC62pC5eCo2LGpc8w0=
=Mq4f
-----END PGP SIGNATURE-----

--ofIF/HTzLj1NJtwG--


--===============4576405424433417922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4576405424433417922==--

