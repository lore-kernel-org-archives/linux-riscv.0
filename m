Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E31C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 23:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bNBFWZVaQd/4//MBfxTNcu1IJ8ZxKgnpcEAXsq5YdQ=; b=PILkut44biK1fd4OdBJ0le1q7P
	/Tc3sdBQbmzxU38MHpEaQ+0gK5Sz+QBx1WyVZY3zDbWhB4wTJsvRev2u6mZTOt4XCbDffJamG/GdA
	ZX+oMGxBCzR9y/3F34m8Gk90wNOz382J+trRyst/oyMfQGfKLYQfIW89GqfkKA4XZjn8me52Kxh86
	vGpgJ397PBIBIKpjQCbKBFGxJVsmJLcJ5tmFl5aWkaCOj0YJfYwtGcI8JvSuSXwUpWyTwYjR0n3+i
	AFXbywLCRTgVLLhQ4HtquwJy2IzSuPd/Vb+KLix1Y7EP0kTbnni3mvZbmUYTkrGMLj5EHhk7/cnHS
	3mM+dhLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7lqq-005k2f-QJ; Tue, 20 Dec 2022 23:16:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7lqn-005k0V-Jn
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 23:16:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 87D5D61501;
	Tue, 20 Dec 2022 23:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89318C433D2;
	Tue, 20 Dec 2022 23:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671578204;
	bh=S2yB6QVUy+DI02cvsnJRJN1BJTKDb8OD04gO/nAdPSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ct+iSgbCvbMczqt/dL0+pl8OTJOs+cWhg5BpysQyODv73pwN/SkDHHzVFGA57BjTg
	 HkZQrB50VWmKYdj3ZtJ/EPFLtwOefFPo1OKpMQS8tY0KCVk7dICC/T3ZCrbn/D7nCc
	 t8zmB726IQITCrC6oiTd7EohXLCAbyvQC4/xIFXzr3C63wIUheWNzfGY7lsz7hFBjM
	 yDzy7pO4ILfBuGzIC63uB+6MFCmeURuG2cpSVy1lFnrS1RsKgk9rKZCMvklPn5srz/
	 esH6HS0F0q6NbSYFlQn0OY4weqwLlL9LoxF2k5eqTOMEkcKhxVAiVzrt6uFsgk6KeN
	 1MnbOl+7hW0ow==
Date: Tue, 20 Dec 2022 23:16:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/11] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Message-ID: <Y6JCVn2nsUi4nTeX@spud>
References: <20221220005054.34518-1-hal.feng@starfivetech.com>
 <20221220005054.34518-8-hal.feng@starfivetech.com>
 <Y6JB37Pd5TZoGMy4@spud>
MIME-Version: 1.0
In-Reply-To: <Y6JB37Pd5TZoGMy4@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_151645_716229_0AB37FB9 
X-CRM114-Status: GOOD (  12.69  )
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
Content-Type: multipart/mixed; boundary="===============5982302329329297953=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5982302329329297953==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KBoiHggTc0xQlLEN"
Content-Disposition: inline


--KBoiHggTc0xQlLEN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2022 at 11:14:44PM +0000, Conor Dooley wrote:
> On Tue, Dec 20, 2022 at 08:50:50AM +0800, Hal Feng wrote:
> > +    clock-controller@13020000 {
> > +        compatible =3D "starfive,jh7110-syscrg";
> > +        reg =3D <0x13020000 0x10000>;
> > +        clocks =3D <&osc>, <&gmac1_rmii_refin>,
> > +                 <&gmac1_rgmii_rxin>,
> > +                 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
> > +                 <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
> > +                 <&tdm_ext>, <&mclk_ext>;
> > +        clock-names =3D "osc", "gmac1_rmii_refin",
> > +                      "gmac1_rgmii_rxin",
> > +                      "i2stx_bclk_ext", "i2stx_lrck_ext",
> > +                      "i2srx_bclk_ext", "i2srx_lrck_ext",
> > +                      "tdm_ext", "mclk_ext";
> > +        #clock-cells =3D <1>;
> > +        #reset-cells =3D <1>;
> > +    };
>=20
> Also, whatever happened to GMAC0? It has fixed-clocks defined in the DTS
> but doesn't appear in the binding or driver?

Ah, I should have looked at the next patch...

D'oh.


--KBoiHggTc0xQlLEN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6JCVgAKCRB4tDGHoIJi
0td2AP9qG5gfg6Ob/N5kAJ8ZjKIE8zJu2TvxPdAOzRTiZWkKRgEA/l0KFau1Ph7E
XZQhhG9nYqDTXbh2i/793XGDS4PdcQg=
=A5iT
-----END PGP SIGNATURE-----

--KBoiHggTc0xQlLEN--


--===============5982302329329297953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5982302329329297953==--

