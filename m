Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D03C79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 17:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXzPVePkARgukFsKTJSeTDVMztJAvfTjeJIZ57nTTII=; b=Y8I7d2SDMd5eHCBjAImkia7oEC
	bGuuX89c6N2al3su8nzd5+AJL5RyeN/1b87r+DmHIEBJD9qJjRVxr06VrdGJhp0XBHJ8Mlk/SaK9T
	5sgDMFVUUwZRlceqQCLTA1HHISgS9yMVnNgiaoUKBioJdQSuRml6IGvO2Sr5l9Ml4lmew9PinyRKF
	uXXFP4hjkgOIXCpTK3p8NzF0reyDFtYyaeVRvaNL6g3c7QqDVJCvdh18oV6+jYGub8zo40ObUnETe
	UVOVIW71W9QByv8bKOKFnXRs95IO0zSroAvLG2lelvjG7XWaZRutjk/3BNYQ0rBRSlU93vz4djA7h
	gnvif0mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zlU-00000009qk6-21vv;
	Tue, 08 Sep 2026 17:37:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zlT-00000009qjx-3zJ6
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 17:37:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B1A9741864;
	Tue,  8 Sep 2026 17:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C46851F00A3A;
	Tue,  8 Sep 2026 17:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788889067;
	bh=icpxK//WCE5REoDo4eSAHi5paKbhSCvkaDSLumz2E28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZRD10JGnhTpojWOS0quYWUeD0EL7k/9chLcVlD0wWLYtP+biIYHUIywCEXlznRVWB
	 j8xKBUVJFtApycXTjJiHJGDNe/LZJ+BXsgCiXW5+nSWGCGDnRcpK6tcMdzJe/3D0Ke
	 QpKtmq0F/x0YZZwsKPayK/RpI2U+nqe6HoIV5OkcfcE+Hzofpdys3V48AI0zxg01S0
	 Up0RLZiec3+dhKB5wyQa+0pZ+0ms5ZL85TlzN+eS+/2pnMCmRCKKFIyu2Wch23TiGZ
	 CRBsfDaxCVTxcZTqXtqdUP4RqHvddlTo3Kc8bS3xs/wNaaShiOI5DxXtWyrVTsyfEg
	 EVAqXDadIhp/w==
Date: Tue, 8 Sep 2026 18:37:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Guodong Xu <docular.xu@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: timer: thead,c900-aclint-mtimer: Add
 SpacemiT K3
Message-ID: <20260908-move-evade-fa5de7889915@spud>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
 <20260909-k3-aclint-v2-1-7931e5bc86ad@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20260909-k3-aclint-v2-1-7931e5bc86ad@pigmoral.tech>
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
Content-Type: multipart/mixed; boundary="===============0881324979149162598=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0881324979149162598==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zmpp28S+PYY1M7Wn"
Content-Disposition: inline

--Zmpp28S+PYY1M7Wn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 12:28:44AM +0800, Junhui Liu wrote:
> Add support for the SpacemiT K3 ACLINT MTIMER, which provides per-hart
> timer interrupts in Machine mode.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable
>=20
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml | =
1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mt=
imer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtime=
r.yaml
> index cf7c82e980f6..082378b04d72 100644
> --- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.ya=
ml
> +++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.ya=
ml
> @@ -12,6 +12,7 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> +      - const: spacemit,k3-aclint-mtimer
>        - items:
>            - enum:
>                - sophgo,sg2042-aclint-mtimer
>=20
> --=20
> 2.55.0
>=20

--Zmpp28S+PYY1M7Wn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBH5QAKCRB4tDGHoIJi
0tZbAQD26trjzukl2y6yAmDOb1HtUtHXg//sDPBKcMKEqSHSCwD9EwTHnp+/AsA2
yZ6IklvmqlQMK3S7+CevJNjJneJ0dgU=
=orYS
-----END PGP SIGNATURE-----

--Zmpp28S+PYY1M7Wn--


--===============0881324979149162598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0881324979149162598==--

