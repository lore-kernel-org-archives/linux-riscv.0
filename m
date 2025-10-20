Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7938DCCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 18:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSoW3Tzu4l5sA1IutH5PWOrNpfz4DAja9j80mMl8wW8=; b=lru+IGUeRj9Vzom6/NaLmN4rlg
	UJXlYOyZJh116vARZ3N0W9akp5lZjfa5V8DG9yTJ5+YOoUMPyuZ8+IGk5JUtet9em+H4a6jwvwNpe
	1pKXPdwr73XgjUIJeucUQEuVvIgA/V5NjkwR8RZyQoVIxsiFx2qvoPHvJTdHUFs1ECK4XnLsr/hWn
	RocRQQZJ6/ysdS2GxtsgOZmq1pMx5ttsxhn2E8AoCfU1R6DSjG1yJI7/hODPBW7sUVM84OsKkFecj
	mTIS+TOO9xvuKrDWT7pQIfdR3wLdmQIhPSyEa5lhJiryqpVIwGEKYrZfNtYhMYvxxQ19l7O6AkyED
	6jU3Ar2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAupP-0000000EeVH-43OY;
	Mon, 20 Oct 2025 18:41:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAupO-0000000EeV5-2v3E
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 18:41:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE3C2602C7;
	Mon, 20 Oct 2025 18:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2113C113D0;
	Mon, 20 Oct 2025 18:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760985711;
	bh=KC5ynBTKwAPPm0Ypk6n9KoPtmJH7cvFRh2ciSY8Lgx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ivXVHfp5mcc7Qs6T2dGRR3qWo5mpwJ/C2T3UqyXTZjjUdnK8XTbgGKD1yNGbzRcIW
	 gw1B/EaRizweTxKV2AvTHc85QcneaAaaiw3DQOOXBBFDwFzjXPWL1Ff4yPd7DF+TC1
	 rpHpJRTUxBmbLk9I7TLdorms7cO23bo5322qnKSt6S8+W8wrC8XVq2dTSqozQrc6QS
	 1E5NA0nu018nP4UMwxaTEQ8wHg4ySQaY0UcPIs93sM0qYQrGLNxGG1wcoVV+NDwugD
	 QXr9UdmZGeiY+MZb0KRiDguDywmupXimWUuO/OkULdKE/R7ntbykjAVwvXnLMF83K0
	 hZ3RiJWg1+h3w==
Date: Mon, 20 Oct 2025 19:41:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: han.xu@nxp.com, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] dt-bindings: spi: fsl-qspi: support SpacemiT K1
Message-ID: <20251020-unwound-cake-21799c9522a1@spud>
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-3-elder@riscstar.com>
 <20251020-utility-remedial-4b4dfc716409@spud>
 <08d99fcd-4d0c-4d81-a314-7e1a8bfaa64c@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <08d99fcd-4d0c-4d81-a314-7e1a8bfaa64c@riscstar.com>
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
Content-Type: multipart/mixed; boundary="===============1057446190476048846=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1057446190476048846==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S9zWXF20ApbbyoB6"
Content-Disposition: inline


--S9zWXF20ApbbyoB6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 01:06:50PM -0500, Alex Elder wrote:
> On 10/20/25 12:41 PM, Conor Dooley wrote:
> > On Mon, Oct 20, 2025 at 11:51:45AM -0500, Alex Elder wrote:
> > > Add the SpacemiT K1 SoC QSPI IP to the list of supported hardware.
> >=20
> > Also, you should really explain why this spacemit device is the first
> > one to be in what's been an fsl-specific binding for now in the commit
> > message.
>=20
> I'm not sure how much of an explanation you're looking for, but
> yes, I agree with you, it stands out that it's the first one, so
> I at least should have acknowledged that.  I'll add something
> here in the next version.

Even just mentioning that the register interface etc is nigh identical.
Otherwise this just looks like picking a random file to put the
compatible in. Remember, this is independent from the driver change and
must be justified in its own commit message.

>=20
> 					-Alex
>=20
> > pw-bot: changes-requested
> >=20
> > >=20
> > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > ---
> > >   Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 1 +
> > >   1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.y=
aml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
> > > index 0315a13fe319a..5bbda4bc33350 100644
> > > --- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
> > > +++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
> > > @@ -22,6 +22,7 @@ properties:
> > >             - fsl,imx6ul-qspi
> > >             - fsl,ls1021a-qspi
> > >             - fsl,ls2080a-qspi
> > > +          - spacemit,k1-qspi
> > >         - items:
> > >             - enum:
> > >                 - fsl,ls1043a-qspi
> > > --=20
> > > 2.48.1
> > >=20
>=20

--S9zWXF20ApbbyoB6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPaCagAKCRB4tDGHoIJi
0ohiAQDQx8/ngIErenJDLWY4lU6RY+0qmrL51bMTNVAHh7sOwAEAghs7YSCh8Sjd
Sp5Y5uHh2P8M3xL2JiAL026goVBQXAg=
=a65U
-----END PGP SIGNATURE-----

--S9zWXF20ApbbyoB6--


--===============1057446190476048846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1057446190476048846==--

