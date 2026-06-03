Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1907CD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 16:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rshHF7u0Rtcx1kr5JL8C/kEpMgdPUJ6cMIhMlztLzQE=; b=CK1DXbJsn2YJsvq/5QLePcMsiL
	WuQDppVvBKVRnKfS/NPURzwBnUCirHHb8klYFrgPkUF6YbPCRRdrUFK1oc0+zPrBzi1FMfv399ogB
	34AR/DBJ4p/VQN6AtplUvx2LxFCYANAMDxORlHjZ1OcD6gDITsjFU075Qdae4TXaw8exPcUTmM5vg
	fQePDb6qtAsiSOl2xPS/ZMrQvI1jwUgHB4Qd5BmznShdvV0XH9qDUn/WMRqTqyE9I9jr9DEWRe2gR
	/r7og5emJ9kn4/f3xq2W+6WADtHEqXhOk5pZ+h/5ecWMX5J+ckbO90N11RaTWUdsNopXVV4ohvI5Y
	tLstcp4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoIt-0000000FVVa-28yb;
	Wed, 03 Jun 2026 16:18:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoIr-0000000FVV7-3WI2
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 16:18:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BEBD60142;
	Wed,  3 Jun 2026 16:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A501F00893;
	Wed,  3 Jun 2026 16:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780503529;
	bh=33ZbVOrnOiAZAVJnipEHOynCDZG919cacA48GN1/+z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AaSOfaIeolF+JsMu/y5o8hj+h14Exhk1ombtCpZL4z8czsjA/bic7SmV2EFTBnL4O
	 hVJWDLS/cFu0Od9SdZ1w3G6TdcC4Zjq4G5e2PKAkYE83iQMkRN5XRu5XyZKd9HOJPV
	 XR/8dRGUrGaAUR9PDyql7XotM20AJgje3eu4jZd5c+yQIZLe3Xz2LcR4c5ewztYahm
	 0Woezv1L1nBHtqOa9G9V7fDgAC4kz5YusCbMrlR6yvI8YP35zLyz7gYgIZXSBEQjUx
	 SnJ/tUTG08EGacKV2IJCj1QkN3juy+Ku/XIZOpUG7UAf3Jw7NcT7/21WjksaWMckLH
	 vd3rdCTILsKcQ==
Date: Wed, 3 Jun 2026 17:18:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: imsics: Add Tenstorrent Atlantis
 compatible
Message-ID: <20260603-dwindle-absence-33c1b4386799@spud>
References: <20260603074222.593243-1-joel@jms.id.au>
 <20260603074222.593243-3-joel@jms.id.au>
MIME-Version: 1.0
In-Reply-To: <20260603074222.593243-3-joel@jms.id.au>
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
Content-Type: multipart/mixed; boundary="===============6210656292906634077=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6210656292906634077==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eNmyYxHv+ceGvXNS"
Content-Disposition: inline


--eNmyYxHv+ceGvXNS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 05:12:14PM +0930, Joel Stanley wrote:
> Add compatible for IMSICS in Tenstorrent Atlantis SoC.
>=20
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

And here.
pw-bot: changes-requested

> ---
>  .../devicetree/bindings/interrupt-controller/riscv,imsics.yaml   | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv=
,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv=
,imsics.yaml
> index feec122bddde..442b8870f9c5 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics=
=2Eyaml
> @@ -49,6 +49,7 @@ properties:
>        - enum:
>            - qemu,imsics
>            - spacemit,k3-imsics
> +          - tenstorrent,atlantis-imsics
>        - const: riscv,imsics
> =20
>    reg:
> --=20
> 2.47.3
>=20

--eNmyYxHv+ceGvXNS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBT5AAKCRB4tDGHoIJi
0mOwAQCUIqcOKEr7b6o5N4NpNmDG4x26QKL+gmatvWqDqkkHDQEAwOCOPR6yasBu
MKEmaHwbdFP3sfQqcnbj+ck6nNi/0As=
=NZjA
-----END PGP SIGNATURE-----

--eNmyYxHv+ceGvXNS--


--===============6210656292906634077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6210656292906634077==--

