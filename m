Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BEBC6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 15:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GItg9jVpMn4Mj4okSddnY/dbvS6cn1/kvV3Yv5ex26Y=; b=TtVp8cYYMYe312PTm3JzSEuoA8
	NVkNMFjf2hU5/PZMhmreaS6fX1rD4tHtuy2NT8b5XXjLxMWgJ2+O5vLQsYLrPS+ivniK+l0iLf+33
	CHI2WeLnHmYa7jb6P6s2VGajIGnkaXkP+gQ7B9yFVs70Vp1t4i9qaruYLNkgBJYXcoAFfhvBEQZ78
	qaKhme2mFWT7lk+n5YlqP67VjTPOTWJkLm3D20DtN7VBe+Ysbpu4U7NyzZTBLLfLejQmsf0I0JJYb
	n2cdVOnowXJD81qkQAWfSntCkD5c8fPyTt65eMXpm6zf8KXc1Y76hsd8bF5uBgbQVliQ5yIe2P/4G
	HRzq3g3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phuFZ-004IHt-3D;
	Thu, 30 Mar 2023 15:31:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phuFW-004IG2-0t
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 15:31:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DD71FB82901;
	Thu, 30 Mar 2023 15:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9F6C433A0;
	Thu, 30 Mar 2023 15:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680190295;
	bh=zWpYYIuYTJgHtpRIFKGjq97qGd3ak9fMCXilbjSs6k8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CeZlAwWxbJ/bSZ4un7FNN3IwfDFkF57yLnYL5VB3GqWTc+RtBL1ZbCJKgkCiCyhCe
	 W9bxnsrfYa3nY8YragtJajwGpLOlNq8xCJ1l6N5NW+wggEG2DHJN+mIHJi4BYBgAKi
	 X+3u/R3OTq8wo6QU2I82zI6SaRv2we2sUxJkjfTHyldFPo0uefwu6seN2mMgB/LWTN
	 lZ2HHx84EA4CQrTwxkVnV2r6HHpn4QGib1M01Jyr8EQTyF+xGTfknYGoRuej3EV4v4
	 CM90jK5JiAUGUPj40gfJQsD/wZjyqbdCQ7dOed1fdDTIvoUVFSQYUscQs+BAtuLdYh
	 xmrs4ZPpbL+TQ==
Date: Thu, 30 Mar 2023 16:31:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: add tdm node and sound card
Message-ID: <0d108d6c-e892-418b-b9af-6c2dd133dd71@spud>
References: <20230329153320.31390-1-walker.chen@starfivetech.com>
 <20230329153320.31390-4-walker.chen@starfivetech.com>
 <d455a90a-7e63-2254-75cb-70cb26ae7483@linaro.org>
 <af015701-f1ff-4b1e-9b1b-c635fc684ce6@spud>
 <2d5a8dae-73fd-b1f8-089e-041637d66b0d@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <2d5a8dae-73fd-b1f8-089e-041637d66b0d@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_083138_633156_FF59DF14 
X-CRM114-Status: GOOD (  21.28  )
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
Content-Type: multipart/mixed; boundary="===============3784077352061109390=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3784077352061109390==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="524gvXDbAwMwRBbT"
Content-Disposition: inline


--524gvXDbAwMwRBbT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 11:16:08PM +0800, Walker Chen wrote:
> On 2023/3/30 15:58, Conor Dooley wrote:

> > Excuse me for not following here, but Walker, could you point me at
> > where in the schematic for the VisionFive 2 that this wm8960 actually
> > is?
> > I know ~nothing about audio, but good old Google tells me that this is a
> > dedicated codec chip and I was looking at [1] and could not easily find
> > it on the schematic.

> > 1 https://doc-en.rvspace.org/VisionFive2/PDF/SCH_RV002_V1.2A_20221216.p=
df

> The TDM need work together with external codec WM8960 by plugging the ras=
pberry pie
>  audio board into the 40-pin, which is found in sheet 21 of the schematic=
=2E Because the
>  40-pin of VisionFive2 is fully compatible with the pins of Raspberry pie=
 audio board.=20
>=20
> For more information of the audio board, you can take a look at the follo=
wing webpage:
> https://wiki.seeedstudio.com/ReSpeaker_2_Mics_Pi_HAT/
>=20
> The schematic of audio board:
> https://files.seeedstudio.com/wiki/MIC_HATv1.0_for_raspberrypi/src/ReSpea=
ker%202-Mics%20Pi%20HAT_SCH.pdf

Ahh, I feared that this was the case. If it's not on the board, then it
shouldn't be in the dts (and certainly nothing should be in
jh7110.dtsi!).
I suppose this should be a dt-overlay, but I don't know anything about
the upstream infrastructure for those. Nor do I know what is permitted
in terms of overlays.

Thanks,
Conor.

--524gvXDbAwMwRBbT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCWrTgAKCRB4tDGHoIJi
0thyAP9IOF81Os1a6pA5/JU5Af3gbxCn4Cc3tX9CYpHYnbRm9gD/VG+H1kKtvfr1
pLpzYaEOOfN3raDJEzVDTJIcLmCSJwg=
=ORTa
-----END PGP SIGNATURE-----

--524gvXDbAwMwRBbT--


--===============3784077352061109390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3784077352061109390==--

