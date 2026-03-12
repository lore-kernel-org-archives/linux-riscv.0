Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14277106ACD6
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 18:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y84VfnfSzAWGhy1idd4dGopMSJ0F6Sey3Nfs0EiiZYQ=; b=TWKaSESzCCFcJChoSiRY4pJIVd
	x4LeRU2AOvBPXE82sNPqxKg2+jWQI6b6Kr31WLWFXcGEZraEcbfYpbJXfL+vCV4HkKxffO7FCSSNy
	uvdKpZzq8Q3Qs4fTaO40E1GUXLoeDnqUehROf2HWp7cb/HTGVuNnOJAbHrkIed4AhSHj6TQaEagkp
	DFCyIi4naryuq4XteDp4YZPSkuv7n59TYA5DWktQCCFtgvjW5OypWWGPr7+D/xAIiQT5jFLRkoPrD
	i6QF0kxX+H9IYlWVadWtwEPa79oBSYvuEYdwnOm3CscqLHVhLvkYEJST/guUdoFkkQ4bnOYhhQs95
	66tzFuYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kLi-0000000Eowl-2bF2;
	Thu, 12 Mar 2026 18:01:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kLh-0000000EowX-2B5Z
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 18:01:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D399560054;
	Thu, 12 Mar 2026 18:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F50EC4CEF7;
	Thu, 12 Mar 2026 18:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773338487;
	bh=OSzRLFN/O+oARU9QCcrSlaMvdDHHRKYudUhwaCmYKXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jbxDsa/82t2/tn++3U6n4t9JBwfH7xOxwADsSHdTwaLtwVMbaUAX46M2Iy5W4GPvK
	 dt8PGdQ87WZdrPiZuriIs6z5NON1/8E8BxMTxbE6B3xDUF6pS264nmMPpw/NU9mvBp
	 jFujHHl2YyKAwTUIms6oKi+R5Pe3EHSD7qpe+/XBY1imLYzBMx5viJtoya7OEEF6Ve
	 8KaKOlqWKaiKY4yRZlGKXuHx9Vl7ThQVfsOXVfv2OopMXa/rLWKNgaTW1QvZcuGmGG
	 7t4XOJ6UDhYONWh7dLLyYoBKDoWcbJaweE90phlYZ66IGf23MZiT9zoNA7DppO+Xe2
	 E/i7zBZfdqcVg==
Date: Thu, 12 Mar 2026 18:01:24 +0000
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] firmware: microchip: fail auto-update probe if no
 flash found
Message-ID: <20260312-distress-figure-e05517910026@spud>
References: <20260303-emphatic-roundness-8fe5cd8c3159@spud>
 <20260310-gyration-smasher-1eb31125b2b6@spud>
MIME-Version: 1.0
In-Reply-To: <20260310-gyration-smasher-1eb31125b2b6@spud>
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
Content-Type: multipart/mixed; boundary="===============6830387056044078773=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6830387056044078773==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DKurcfiHx8r5qs5K"
Content-Disposition: inline


--DKurcfiHx8r5qs5K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 06:24:11PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> On Tue, 03 Mar 2026 11:24:06 +0000, Conor Dooley wrote:
> > There's no point letting the driver probe if there is no flash, as
> > trying to do a firmware upload will fail. Move the code that attempts
> > to get the flash from firmware upload to probe, and let it emit a
> > message to users stating why auto-update is not supported.
> > The code currently could have a problem if there's a flash in
> > devicetree, but the system controller driver fails to get a pointer to
> > it from the mtd subsystem, which will cause
> > mpfs_sys_controller_get_flash() to return an error. Check for errors and
> > null, instead of just null, in the new clause.
> >=20
> > [...]
>=20
> Applied to riscv-soc-fixes, thanks!
>=20
> [1/1] firmware: microchip: fail auto-update probe if no flash found
>       https://git.kernel.org/conor/c/c30b2509164f

My CI started whinging about this..
Probably needs to be:
commit 8fc167b47d48d3653639d026cc3f657f6c78ab4d
Author: Conor Dooley <conor.dooley@microchip.com>
Date:   Thu Mar 12 18:00:01 2026 +0000

    firmware: microchip: auto-update: silence error print when flash not fo=
und
   =20
    Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

diff --git a/drivers/firmware/microchip/mpfs-auto-update.c b/drivers/firmwa=
re/microchip/mpfs-auto-update.c
index 0105c55ed7f37..8fc3749d4a709 100644
--- a/drivers/firmware/microchip/mpfs-auto-update.c
+++ b/drivers/firmware/microchip/mpfs-auto-update.c
@@ -424,9 +424,10 @@ static int mpfs_auto_update_probe(struct platform_devi=
ce *pdev)
 				     "Could not register as a sub device of the system controller\n");
=20
 	priv->flash =3D mpfs_sys_controller_get_flash(priv->sys_controller);
-	if (IS_ERR_OR_NULL(priv->flash))
-		return dev_err_probe(dev, -ENODEV,
-				     "No flash connected to the system controller, auto-update not sup=
ported\n");
+	if (IS_ERR_OR_NULL(priv->flash)) {
+		dev_dbg(dev, "No flash connected to the system controller, auto-update n=
ot supported\n");
+		return -ENODEV;
+	}
=20
 	priv->dev =3D dev;
 	platform_set_drvdata(pdev, priv);


--DKurcfiHx8r5qs5K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabL/dAAKCRB4tDGHoIJi
0nIFAQCsTwy1NI0n231g4yLIMo9S2hTDrZiTE2HbmorJLJkLAQEAprS2DQKLze43
jHIP7MAm39UKt8Kf06T8nwfZXfNrBAU=
=yvGr
-----END PGP SIGNATURE-----

--DKurcfiHx8r5qs5K--


--===============6830387056044078773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6830387056044078773==--

