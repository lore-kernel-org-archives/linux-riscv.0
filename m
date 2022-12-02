Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65161C47088
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 18:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgWsqQWi9O/LEwpLPN6nOQpMOjxG44MF3pZwSad7s78=; b=QMvaePzgkdMz3eqquWmWHM3JTb
	rk8iwl9bebHpd8y+EUmM/rBo1HumDXmmDU9gljKx58lBLX1QfvrIR1rvkG4t7LRjJH5sSAalv6Ypw
	oMkeE63mABSmFOPx2BBrc2ocFEaF3Y/OSYNFUT3ZOfIog0CXr1rK6PFNeU47cdOZSOvH8oY/nULYz
	CbFel45xQ1eLl3GuvtMXwD3MJIcKntPbZ/yeju7nmVnVEVXZWAENxtY1WuPvfbiiGrz3tK9eUH/MI
	Zwa/ZcIaI8J2EBbOKAWl/37IxKXI/GKX6vGH9RQWlPNIohbEXtNxxUNJFicFlvLrl+G55OFBRaHmd
	UWzkP5Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1ARt-000XkU-84; Fri, 02 Dec 2022 18:07:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1ARq-000XjT-RG
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 18:07:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E455EB8221F;
	Fri,  2 Dec 2022 18:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49153C433D6;
	Fri,  2 Dec 2022 18:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670004459;
	bh=hmBVhSbPpSMvNZz4kaHDw8/rhmXitCHA11QWlM1A7yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iB5t/edar9Z8+CMkvTdc1FFOtMtirl3BE1km8FNy3DVv6aIdjhRLiSLK/F9M28Ego
	 9aXg+gY1PlCFpw2UcLeTlFIHPFdxIjSaW5kaBGXyg5jpOQo/+9NWzR50zYEZIOWc7x
	 HkbnVPTVO94ec0CeVn4cj2r/56SVw4PGXLLMh3sGsYR8ewcZjFjB5CnvQnZSKVL1eK
	 QxPruoypwCt4bBjWwaKSmVWMOlb1dU7QsYyT1vSKfWzpkanunUl41dx/jJedOsK+Bg
	 GyDbgO0VJk8oqRuDURBqbHP5mp/L81BDLmXbYQJo+HQAoJp164WS7lm9R7+s3QMn+R
	 wIrpflIApgMew==
Date: Fri, 2 Dec 2022 18:07:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: hal.feng@starfivetech.com, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	ben.dooks@sifive.com, tglx@linutronix.de,
	Marc Zyngier <maz@kernel.org>, sboyd@kernel.org,
	mturquette@baylibre.com, p.zabel@pengutronix.de,
	linus.walleij@linaro.org, emil.renner.berthing@canonical.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] RISC-V: defconfig: Enable CONFIG_SERIAL_8250_DW
Message-ID: <Y4o+5ayW0vHcmvo6@spud>
References: <20221118011714.70877-9-hal.feng@starfivetech.com>
 <mhng-cf616c36-e110-4274-9bbf-cc6a22b75ed5@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-cf616c36-e110-4274-9bbf-cc6a22b75ed5@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_100743_046243_37D5DE67 
X-CRM114-Status: GOOD (  16.30  )
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
Content-Type: multipart/mixed; boundary="===============0287017348782733623=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0287017348782733623==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JhNtFton+bzlOv4O"
Content-Disposition: inline


--JhNtFton+bzlOv4O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2022 at 10:00:35AM -0800, Palmer Dabbelt wrote:
> On Thu, 17 Nov 2022 17:17:14 PST (-0800), hal.feng@starfivetech.com wrote:
> > Add CONFIG_SERIAL_8250_DW=3Dy, which is a necessary option for
> > StarFive JH7110 and JH7100 SoCs to boot with serial ports.
> >=20
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  arch/riscv/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 05fd5fcf24f9..a23d022974ad 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -122,6 +122,7 @@ CONFIG_MICROSEMI_PHY=3Dy
> >  CONFIG_INPUT_MOUSEDEV=3Dy
> >  CONFIG_SERIAL_8250=3Dy
> >  CONFIG_SERIAL_8250_CONSOLE=3Dy
> > +CONFIG_SERIAL_8250_DW=3Dy
> >  CONFIG_SERIAL_OF_PLATFORM=3Dy
> >  CONFIG_VIRTIO_CONSOLE=3Dy
> >  CONFIG_HW_RANDOM=3Dy
>=20
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Hey Palmer, could you take this as v6.2 material instead of Acking it
please? It applies to the jh7100 stuff that's already in-tree.

Thanks!


--JhNtFton+bzlOv4O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY4o+5QAKCRB4tDGHoIJi
0kyvAP96/etRU8MHV+TJop+MIh7YJPGSSh3PcSxER+l04TgwHgEA4hyLBxQuQu2J
bjSGcD9MlcnjCPczYWEZ5JkuvOxhOQQ=
=zgbf
-----END PGP SIGNATURE-----

--JhNtFton+bzlOv4O--


--===============0287017348782733623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0287017348782733623==--

