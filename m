Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2A2CA1007
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 22:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7drwRyh71gc5YJ8d3vQddOYkOA1CKLE6zr3W81Ir6ds=; b=C47eOdqNYlQQQtsi4Lfx2/UE70
	GG2dhlutKX5BMF++aRf/SUGyF8JFqBtHuklT2CIxSH3TwfmVFu7iasJ3S3Kx53vsECwtOkYE7m2Lp
	sG9GYwaHeFymiK8Xv/QPp96H8N3H+wT24QZqbcFRvrxPv+RhIxVWchQm21bR/3AqlosUIhdKtobw7
	X85y+AwTsOk0QDFUlCFKT31E+hvPD+uOZTpX1C94HusEIWp8jzpn18s2RMFmqzJOGWhxhhFUH++zt
	zCdag8L0LwKu0C0bdUUIzUowsNcAx798mgxT0lq4sWPVhRXyqvyLTdTXmIPaz6D5FBDSnl54u4mIN
	Hb+kl4ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utZwk-00000002UY7-12L6;
	Tue, 02 Sep 2025 22:57:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utU1z-00000000zrB-0k5Q
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 16:38:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 073C341A85;
	Tue,  2 Sep 2025 16:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8D2C4CEED;
	Tue,  2 Sep 2025 16:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756831129;
	bh=SOwG/JggJkNLJ7PLQmoB7+r3ga5C1jVReif7jB291cU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MLeTeQSbDbxWwofKraRIxLA8TMJY5DKSbNCb8FZ0IBY5QNkB7ozq2DS9yJTzz2rQc
	 KVPqViua/jWAMzHNFiggZ4v0O61XyT1DTX4u04muwo3mJOqvKg/4CALoypYOv9pK/H
	 CcwCo2mcfgna2YoDzpOyF1VBnZRWXWczviWsgRgLu0CK4SXt5m0AiVUp0oSYssKQgi
	 3mLTRtRHYy6z4n76zByagohFvyZwLZaoViuNCvZNNUW7qRFfeizqDjacRYF336wja1
	 gxODHHYjQ/7Xrvcsw8keMoWTzyvo51anIGHeoZgCMmLve//mRX01I+WIQle9WbdKPX
	 yOM4HPNkGNtng==
Date: Tue, 2 Sep 2025 17:38:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Valentina.FernandezAlanis@microchip.com, Conor.Dooley@microchip.com,
	Daire.McNamara@microchip.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, robh@kernel.org, krzk+dt@kernel.org,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1 5/5] riscv: dts: microchip: add a device tree for
 Discovery Kit
Message-ID: <20250902-crucial-hankering-193be936a139@spud>
References: <20250825161952.3902672-1-valentina.fernandezalanis@microchip.com>
 <20250825161952.3902672-6-valentina.fernandezalanis@microchip.com>
 <2b1eb8fd-2a64-4745-ad93-abc53d240b69@kernel.org>
 <bb5b0d71-41b1-48a0-82fc-bdb362cc3db1@microchip.com>
 <0d90eeb4-e6ac-459c-a6b1-26368f102e0e@kernel.org>
 <20250902-affair-scrambler-2771df16372e@spud>
 <677aad27-66b9-4c4f-8fbe-6b9aabcd375a@kernel.org>
MIME-Version: 1.0
In-Reply-To: <677aad27-66b9-4c4f-8fbe-6b9aabcd375a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_093851_233530_5047467B 
X-CRM114-Status: GOOD (  18.25  )
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
Content-Type: multipart/mixed; boundary="===============3457984158521811266=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3457984158521811266==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cfy5KQiTquK7clHG"
Content-Disposition: inline


--cfy5KQiTquK7clHG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2025 at 03:47:56PM +0200, Krzysztof Kozlowski wrote:
> On 02/09/2025 10:31, Conor Dooley wrote:
> > On Tue, Sep 02, 2025 at 08:22:02AM +0200, Krzysztof Kozlowski wrote:
> >=20
> >>>>> +     refclk_ccc: cccrefclk {
> >>>>
> >>>> Please use name for all fixed clocks which matches current format
> >>>> recommendation: 'clock-<freq>' (see also the pattern in the binding =
for
> >>>> any other options).
> >>>>
> >>>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml
> >>> The fabric dtsi describes elements configured by the FPGA bitstream.=
=20
> >>> This node is named as such because the Clock Conditioner Circuit CCC'=
s=20
> >>> reference clock source is set by the FPGA bitstream, while its freque=
ncy=20
> >>> is determined by an on-board oscillator.
> >>>
> >>> Hope this clarifies the rationale behind the node name.
> >> No, because there is no style naming clocks like this. Neither proper
> >> suffix, nor prefix. Use standard naming.
> >=20
> > So you want all fixed frequency clocks to be named "clk-foo" when
> > "clk-<freq>" is not suitable? Fine if you do, but I didn't realise that
> > it was required and haven't been keeping an eye out for it.
>=20
> Recommended is to just use consistent suffixes or prefixes. Binding asks
> for "clock-" so that's what I propose to use here.

Okay, I'll keep that in mind.=20

--cfy5KQiTquK7clHG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLcdlAAKCRB4tDGHoIJi
0naiAQCA8RkE9d4x3vSDRj7Kp9DvNgViBknLJEn4NtKmLmp/LgD/QsstMwVI9pFE
OMOYdXSwcCVahsURInTVKGD8lpIeqgk=
=xt6D
-----END PGP SIGNATURE-----

--cfy5KQiTquK7clHG--


--===============3457984158521811266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3457984158521811266==--

