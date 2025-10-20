Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5466CCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 17:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Muy58PbLd6ZNcBzWx4C+olVPFBUIWnP7bFeZnIHHpQ=; b=CfCDdYRyPhTWIHxnwrJyuoWkAu
	ZzHTelG1HNcdzlqAJHYl8xZR6mHwDnNWBzdFUxd2OamSN8k+fVUJv2DmUDb4JRXVcZ9P5IsN1DLxm
	yU3vbX2o8T1hu3Q+HWRhA7UXVGXd6iynVu2EPuVbW9sZsixqf06HzC2P10V3XZ58wE1C2Ik2qbf9p
	5ZPYLdtf+KbdoviTPLkOyScAE+i/t37mrmmYGfVNyodnGGWF0LqASREQE5dfb2NbsIXikNdLyyMDy
	hTvmMeu4nI9VLpHjfsGfxm2fga4FPX6XsLUGZDzIU4ymazOQpGfAtD+jdMkffh1niyJfR5M+SrivV
	CJVJMGqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtsu-0000000EWTG-3mev;
	Mon, 20 Oct 2025 17:41:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtst-0000000EWT8-1UW5
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 17:41:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AFBF2600AC;
	Mon, 20 Oct 2025 17:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99DAC4CEF9;
	Mon, 20 Oct 2025 17:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760982086;
	bh=0shQKZ6LMkY7eu+foeqCzGr2kMlEmfoaK6oMFy9Q3fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=De1mxxBddZqMNleN87F+pQxQO9G//qIlPV7tFewpeYUIjnWrJvbkgzf5+ZE6H2uPl
	 HsKeowTy6HQIWgilMsO/ACqB+7Q7qcUi03DvuN3BKf5rHM0AE2kx0mTzqQgukoG5Df
	 G0aCfX3EtwRjEy0ckL46C4eVjqpJ8hBU035OmuvibVjrgcTyJQWpdyNoe7RMiVGY3s
	 QddLVA9H1YWfE9N4zNdxP/D3ai5zdXIPbHqP8dTQ3caEsDCHyeQ0uWZG8E2Hqk2hWb
	 F68SASIw7WIPsQM/y+XvSnSZ77lu3wuwNSBx2+zAHM9WYfYkcSy/8k1lzb8UpCN2L1
	 DwDWjoLvxVURQ==
Date: Mon, 20 Oct 2025 18:41:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: han.xu@nxp.com, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] dt-bindings: spi: fsl-qspi: support SpacemiT K1
Message-ID: <20251020-utility-remedial-4b4dfc716409@spud>
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-3-elder@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20251020165152.666221-3-elder@riscstar.com>
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
Content-Type: multipart/mixed; boundary="===============8930846785890484759=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8930846785890484759==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EtcE87axyRT4niT6"
Content-Disposition: inline


--EtcE87axyRT4niT6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 11:51:45AM -0500, Alex Elder wrote:
> Add the SpacemiT K1 SoC QSPI IP to the list of supported hardware.

Also, you should really explain why this spacemit device is the first
one to be in what's been an fsl-specific binding for now in the commit
message.
pw-bot: changes-requested

>=20
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml =
b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
> index 0315a13fe319a..5bbda4bc33350 100644
> --- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
> @@ -22,6 +22,7 @@ properties:
>            - fsl,imx6ul-qspi
>            - fsl,ls1021a-qspi
>            - fsl,ls2080a-qspi
> +          - spacemit,k1-qspi
>        - items:
>            - enum:
>                - fsl,ls1043a-qspi
> --=20
> 2.48.1
>=20

--EtcE87axyRT4niT6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZ0QQAKCRB4tDGHoIJi
0jw3AP9fIzYzUtEKSJLqkolLXPEWaL3paAWpO+XlKFabuMCkVQEAj6t4t3UyUduk
YQnlq9gBr5tZn+FNWIUYFR5JDC/WXww=
=0LUZ
-----END PGP SIGNATURE-----

--EtcE87axyRT4niT6--


--===============8930846785890484759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8930846785890484759==--

