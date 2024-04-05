Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90B9CD11C2
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBjr4xv62TgLrmuqprcAqskb+nbkf38rAH68R1XAMgc=; b=akpRTqDfERSLumyaPWUE6GC6Mi
	w0XDXXtdfkd2eZXreV9SiQF/aNPPfdhPFppIEJt9Xn5K7m11ocG9WCAeiGiiuww2kbMxtEbamSQ5P
	qxuluaIFl8LtWPBGrn+2hIaRc8ySEuR28Ozr9zmC0xZcJz0VHL8tuzvJheb5LQtTlUExW+Q7QVUCW
	QrbzKK/7ebhXW559+MrOlXr9vs3i1VnUp+O8IyOZpu2iZjhhGDP7jjKqZFZg+Pa/zCkNRbfT4iIc1
	BTG9R+ya6OGq1dXRukp2nsi8vgwDd5mfNsS3uSCJUoogoVDP7PlTuHEW4Dkf7+YdNnBuF8PqljeRz
	HFnyuM0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rslrn-00000007rn0-2Lix;
	Fri, 05 Apr 2024 15:52:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rslrl-00000007rlg-1zda
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 15:52:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD8FF612E3;
	Fri,  5 Apr 2024 15:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C456C433F1;
	Fri,  5 Apr 2024 15:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712332352;
	bh=1TYQ2nOf7m5eWfWsRNd18xHaQuIeo9EkWggomHT0qUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Om3T7B+XSv2dLDaDtUMT1+Bj89NktWuLG9ZRiHO6pDXJCKOFbWt3CuoJPum7E3X2j
	 TWI7MtUFfRcF7Mdq4DvRdXsYGbaMY2y8A53XSgX6Wr06fq4MvfRcCohMT/67DUID7J
	 jn9BmSmUHZ5xj+761vczmdGa3K6e386tRbc4MsOnT11ooeZlA5p18lWpvUUq4Ljj6T
	 Y5/S5MbstQZLh48LDyA8yYRFhk+Y3YmpoD9RevHhIJuUa7C1CecIPzSAkWhza6DnPK
	 RlmUbsLkYrUKL8Nxk0yFvPuDgLFb64V2/yFNrQ/Zyj7TvtVGTJYWQJ3iNjxsB06OXr
	 IxlcVyAXZ0RvQ==
Date: Fri, 5 Apr 2024 16:52:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH v6 10/11] riscv: dts: add initial canmv-k230 and k230-evb
 dts
Message-ID: <20240405-election-stubble-6b7e3d530d3c@spud>
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
 <tencent_DF5D7CD182AFDA188E0FB80E314A21038D08@qq.com>
 <c052918c13069cfcf768d03518560c65c990b220.camel@icenowy.me>
 <tencent_1C21558D2A7C7B8251DA4E8E08B82E313C08@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_1C21558D2A7C7B8251DA4E8E08B82E313C08@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_085233_643892_95E9155F 
X-CRM114-Status: GOOD (  20.99  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: multipart/mixed; boundary="===============8745669490043032375=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8745669490043032375==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zGrM3zVsiNMs8DNg"
Content-Disposition: inline


--zGrM3zVsiNMs8DNg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 11:10:49AM +0800, Yangyu Chen wrote:
> > On Mar 25, 2024, at 00:23, Icenowy Zheng <uwu@icenowy.me> wrote:
> > =E5=9C=A8 2024-03-23=E6=98=9F=E6=9C=9F=E5=85=AD=E7=9A=84 20:12 +0800=EF=
=BC=8CYangyu Chen=E5=86=99=E9=81=93=EF=BC=9A
> >> - Svpbmt and T-Head MAEE both supported
> >>=20
> >> T-Head C908 does support both Svpbmt and T-Head MAEE for page-based
> >> memory
> >> attributes and is controlled by BIT(21) on CSR.MXSTATUS. The Svpbmt
> >> is used
> >> here for mainline kernel support for K230. If the kernel wants to use
> >> Svpbmt, the M-Mode software should unset BIT(21) of CSR.MXSTATUS
> >> before
> >> entering the S-Mode kernel. Otherwise, the kernel will not boot, as 0
> >> on
> >> T-Head MAEE is NonCachable Memory. Once the kernel switches from bare
> >> metal
> >> to Sv39, It will lose dirty cache line modifications that haven't
> >> been
> >> written back to the memory.
> >=20
> > As MXSTATUS has a S-mode read-only mirror known as SXSTATUS, maybe the
> > kernel should detect SXSTATUS to decide whether to use Svpbmt or
> > Xtheadpbmt (BTW Svnapot conflicts with Xtheadpbmt too).
> >=20
>=20
> Thanks for this hint. I may need to change some code in the T-Head PBMT p=
robe.

For now, I'd rather we just focused on supporting the standard
extensions on this SoC in mainline. I've applied the patches re-doing
the Kconfig options just now, feel free to resend these patches
whenever.

Thanks,
Conor.

--zGrM3zVsiNMs8DNg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhAeOgAKCRB4tDGHoIJi
0s3NAP9jV2FX5X2ERdKTaT8zG4y7prr8i8ld575p2m0u1mmbNQD/SIHdnbGSOOp0
XurrRRps4Y469JrQ/R9fmQG+RFel5AY=
=Xusz
-----END PGP SIGNATURE-----

--zGrM3zVsiNMs8DNg--


--===============8745669490043032375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8745669490043032375==--

