Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E50EC27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 16:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RysommrDKYSHkhzc9SPUoSMQ2PEb2UOIvZUDYhDRNfA=; b=BFvwiigWw+wjsqkNZEXK2OZUAr
	GEvkUoYVKsX0o16D8u5MaMZzYV3rp67nsNjSrp/H0x3q8GSkqoxmCcrv5AQJq0v478gJapAcl6dQm
	9Ejv8qOrKzclv2YIKFRNRFGgjl6WgDIkxfZAyfVJU1u2zal6TqLTyLXvuliidFS9EbITCdjh/eIPW
	5SDZsfOWAvwNBCP0b0jx44V8FeTPHAuQ/beYAEQhSYU1HjDSwUSAPtQ/YmHlgkux5fKQjlowmBtAA
	/PbImPZ4cH2ai6/LZWyqec+fiL63KEAuRLBYrS9dQegHieMd5jc3agcyJYX7BoDu3cza2fmLmzM7v
	zH78NUCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKKg3-00000005rcw-0FBr;
	Thu, 20 Jun 2024 16:30:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKKfz-00000005rat-196z
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 16:30:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 87FEB621F2;
	Thu, 20 Jun 2024 16:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75CCC2BD10;
	Thu, 20 Jun 2024 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718901018;
	bh=2nApdRW4uFWIFKAeWO48GxrtOn9CEoIKmUrYIKGLbhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2ERoqHjMVj7J7iiKKY7CLQUQBWT2OD0KPDkExlb1q0FDGvMI83NKfoiUqNPrmfX0
	 mEH4QJ1t9ti1FWWszJppGi3GHjWQq+47H+ZIBffNIHvtZJYWEUV+KLcSbWjUTMKR6f
	 16lRiHf9HH3RbI+dskTpxeHYV+JWqU4VXvy/r5ReRto5xqMW7VRF3V0XYU5QzgoMHA
	 kv0eeU1THmYjLlrIPAd95+WwPAkKfdYl9bypTX+2j7Qiwkk2xQqarsV+Jl8qHF45xy
	 6u/Hpbes8H4kqOXj6LuNSUpsV56jF/modm9ZJ+zB0w0cTAF/QLIseVigYVpT2zVkJ/
	 0V1a6nNYDRC0Q==
Date: Thu, 20 Jun 2024 17:30:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] clk: thead: Add support for TH1520 AP_SUBSYS clock
 controller
Message-ID: <20240620-pregame-statute-2b43c0547064@spud>
References: <20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com>
 <20240619-tapping-jaundice-471811929d96@spud>
 <ZnMgKs/dUcYXiisk@x1>
MIME-Version: 1.0
In-Reply-To: <ZnMgKs/dUcYXiisk@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_093019_462885_01279FB5 
X-CRM114-Status: GOOD (  21.22  )
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
Content-Type: multipart/mixed; boundary="===============2663110144148936098=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2663110144148936098==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HSewvxSgds9cd/HB"
Content-Disposition: inline


--HSewvxSgds9cd/HB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 11:15:06AM -0700, Drew Fustini wrote:
> On Wed, Jun 19, 2024 at 12:12:30PM +0100, Conor Dooley wrote:
> > On Sat, Jun 15, 2024 at 06:54:29PM -0700, Drew Fustini wrote:
> > > This series adds support for the AP sub-system clock controller in the
> > > T-Head TH1520 [1]. Yangtao Li originally submitted this series in May
> > > 2023 [2]. Jisheng made additional improvements and then passed on the
> > > work in progress to me.
> >=20
> > One thing I noticed on the dts side is that the GPIO controllers have no
> > clocks provided. Does the AP sub-system clock controller provide their
> > clocks too?
>=20
> Good question. I see that dwapb_get_clks() in drivers/gpio/gpio-dwapb.c
> does call devm_clk_bulk_get_optional() for "bus" and "db". There doesn't
> seem to be to many in-tree examples of clocks being defined for gpio
> controllers with compatible "snps,dw-apb-gpio", but I do see that
> k210.dtsi defines K210_CLK_APB0 for "bus" and K210_CLK_GPIO for "db".
>=20
> From the TH1520 System User Manual, I do see the gpio related clocks in
> Section 4.4.2.2 AP_SUBSYS. The peripheral clock gate control register
> (PERI_CLK_CFG) has:
>=20
> Bit 20: GPIO3_CLK_EN
> Bit  8: GPIO0_CLK_EN
> Bit  7: GPIO1_CLK_EN
> Bit  6: GPIO2_CLK_EN
>=20
> I will add these gates to the clk-th1520-ap.c and reference them from
> the gpio controller nodes.
>=20
> Since each gpio controller will only have one clock, do you think I can
> omit the clock-names property?

Sure, thanks for looking into this.

>=20
> Thanks,
> Drew
>=20
> Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main=
/docs

--HSewvxSgds9cd/HB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnRZFAAKCRB4tDGHoIJi
0jhfAPsFxSm+IHVQdarF1A8PQAiZE2P45kwvHpTzuUOpbO41gwEA3g6fNgbFnrZT
cPWAqmEQpUXzmehcdcTKzTlP4ETGrwQ=
=Y3Yf
-----END PGP SIGNATURE-----

--HSewvxSgds9cd/HB--


--===============2663110144148936098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2663110144148936098==--

