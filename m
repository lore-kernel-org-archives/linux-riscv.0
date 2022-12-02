Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6EEC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 18:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emcLdlL7ozxhzx+NY7zFeqwcI/XSDoGJQuvocgofZh4=; b=zYAkaYgql3QV6zb0YYestrCbX3
	z3l1pTSWpCb67wETUF4EAg9xTEpJ778dRK6B0WwkHCgO3DMTV/zKyJ/4YnrxungDya3xq1ScuOBmf
	XIS1Pm5lqpbrc0rBReYY7tjuRG6AkMLwp1E8X1SAS4S5X0OCiz+wgq6g8JvuNTY37bHwNvD0MPqyP
	2OhniaHDiywTjZqgQ54rZFtGWCrloBNivXm65BDTAwG6PI/PmjZta24ZeoZMtlhOf75xmr5I6eH/o
	Z9vQLiu7CvUvEh7dAPJp8L2/7tGGD7E6UunyxowGs26nKHODdBNB41k8DuZP6gQadd1OiZD16BxVw
	bcVOPvHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1AcI-000bFt-QA; Fri, 02 Dec 2022 18:18:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1AcF-000bEv-Vj
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 18:18:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 893D862396;
	Fri,  2 Dec 2022 18:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7ECBC433D6;
	Fri,  2 Dec 2022 18:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670005107;
	bh=618QCeGYc1P0CY4DPHXZA0uTvw1dOOkdz6+4oVk0xFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bLnk/7ZNIHd/Y+LS+H+p+CpmAiouw2VmGjUQA58jE3LYvHY+bjkLkpfJwgfDeWOx6
	 40Yh5dYiOzzK6R7w/sL85DD6MSloEXJeJlvAgmkS4V8C9ARtOhHZzoXxJVauDUc6Jv
	 ZXwQVo3FyN5NErssDwGuF6f2fowzXqRBOUdyo4pILXel0Foq/IimHalCERKNdh7BxF
	 wj8JJBXJTxAU8xOdKJx3ZRtWPAHkjwzD59tiwFhfzxobxeJyo7B8//S708psPk7xTV
	 +GQ7cvl8MDDrcnmUeL6nIuFSMtO1IUFEn2GFnmfvJqoxZhQ6GuodkFw+DnkSo6Wzyh
	 ggs9e/JBzAjNA==
Date: Fri, 2 Dec 2022 18:18:21 +0000
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
Message-ID: <Y4pBbVQgcTmS7NLa@spud>
References: <Y4o+5ayW0vHcmvo6@spud>
 <mhng-2ff22bb7-a48a-4434-b498-1f928e75cd01@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-2ff22bb7-a48a-4434-b498-1f928e75cd01@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_101828_085702_CBE97280 
X-CRM114-Status: GOOD (  19.67  )
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
Content-Type: multipart/mixed; boundary="===============5382385603176934181=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5382385603176934181==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7L3VJsXTTTjO0p6i"
Content-Disposition: inline


--7L3VJsXTTTjO0p6i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2022 at 10:13:40AM -0800, Palmer Dabbelt wrote:
> On Fri, 02 Dec 2022 10:07:33 PST (-0800), Conor Dooley wrote:
> > On Fri, Dec 02, 2022 at 10:00:35AM -0800, Palmer Dabbelt wrote:
> > > On Thu, 17 Nov 2022 17:17:14 PST (-0800), hal.feng@starfivetech.com w=
rote:
> > > > Add CONFIG_SERIAL_8250_DW=3Dy, which is a necessary option for
> > > > StarFive JH7110 and JH7100 SoCs to boot with serial ports.
> > > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > > > ---
> > > >  arch/riscv/configs/defconfig | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > > diff --git a/arch/riscv/configs/defconfig
> > > b/arch/riscv/configs/defconfig
> > > > index 05fd5fcf24f9..a23d022974ad 100644
> > > > --- a/arch/riscv/configs/defconfig
> > > > +++ b/arch/riscv/configs/defconfig
> > > > @@ -122,6 +122,7 @@ CONFIG_MICROSEMI_PHY=3Dy
> > > >  CONFIG_INPUT_MOUSEDEV=3Dy
> > > >  CONFIG_SERIAL_8250=3Dy
> > > >  CONFIG_SERIAL_8250_CONSOLE=3Dy
> > > > +CONFIG_SERIAL_8250_DW=3Dy
> > > >  CONFIG_SERIAL_OF_PLATFORM=3Dy
> > > >  CONFIG_VIRTIO_CONSOLE=3Dy
> > > >  CONFIG_HW_RANDOM=3Dy
> > >=20
> > > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> >=20
> > Hey Palmer, could you take this as v6.2 material instead of Acking it
> > please? It applies to the jh7100 stuff that's already in-tree.
>=20
> Ya, no problem.  Just this patch, or the whole series?

Just this one defconfig patch please, the rest is not ready.
Sorry that that was not clear,
Conor.


--7L3VJsXTTTjO0p6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY4pBbQAKCRB4tDGHoIJi
0okIAP9ezsc7DcLYtKQL0YkiR3kU1YHRvLyrceTr5zvR4AdD/AD+Jakh5oJMOQZs
TT+FQynSHpyucTXuOOlHyDjvaiZKNAM=
=tjcn
-----END PGP SIGNATURE-----

--7L3VJsXTTTjO0p6i--


--===============5382385603176934181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5382385603176934181==--

