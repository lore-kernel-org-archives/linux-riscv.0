Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85FFC77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 15:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWTd7YU8iUZZJpBndhM2VqSTbXjRZMjUphrrNnRNaqY=; b=E0LEHV5nPue20anzD6VDwer3DQ
	C9vF6mUZ9OQ4BPt8UUcEN4LPXj89/bevnwpz1h2v6sz7CjWNflRpOnPowjJ0F7ZoeYxi+DWJVcnS3
	uAJo/DqcdJ/0xKXoPbrSp7bxYqSChLimPJX11XLhNB2yaTOkczcrWtxVYyBpIsFTEQPkTvKr7W9Pp
	dVX6kqRYDbEIAxJ3hLp7w99Yooe/0D/AyNfvrXem/BPj2WlAiBGqDS7Em7E74cpnAbpPTTiA4tB9T
	wWivZcsgEcm6kxjTRJYjIwHinitWjNWsxJcDsDfZlvc4JLCDusOLkjujeQMLth0esuQR7ApFt3WuR
	W6u10n/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ZUP-002zcL-1O;
	Fri, 26 May 2023 15:36:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ZUM-002zav-1c
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 15:36:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D4B76650F6;
	Fri, 26 May 2023 15:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FD58C433D2;
	Fri, 26 May 2023 15:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685115381;
	bh=yCh5HTW3ayVDzDP143w8WhELufxoUmboVgdJFyi38+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LctbgrVuyr/tGYdjAO/j1n6Rmm8FQ6y3WZoV41ku617Sb1FK8sndw5juCEjJSmFJS
	 5DzmMMHZxTQI351xhtcYaQ2/Ce6yrfnqNgKRZiogEv+gNSz2smjlC7r70HUO9dK0vO
	 u5O0/rKvn3aXeMSofTyYBASG5FkMAc5w3QPy/+txUr9hIrGWtgn7QdIDcH8My2sdBq
	 UNesdKhRXMzS1+Culp1lDWtYECugXcZ7EByl/N2IlMygPf7mc9MvCBGPmVece3rbUk
	 52xyqbqKcijq7L1HOUs4ULS/1N2RZD+IgY1h69EhyW/I9XFAgeVYzL+xHSdf6v3kfv
	 QscS8pwZYXG4A==
Date: Fri, 26 May 2023 16:36:15 +0100
From: Mark Brown <broonie@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Ziv Xu <ziv.xu@starfivetech.com>
Subject: Re: [PATCH v1 2/3] spi: cadence-quadspi: Add clock configuration for
 StarFive JH7110 QSPI
Message-ID: <fecc9d6a-022e-49d9-a452-8a63c409ebf3@sirena.org.uk>
References: <20230526062529.46747-1-william.qiu@starfivetech.com>
 <20230526062529.46747-3-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230526062529.46747-3-william.qiu@starfivetech.com>
X-Cookie: A Smith & Wesson beats four aces.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_083622_585600_613CBFE4 
X-CRM114-Status: GOOD (  12.20  )
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
Content-Type: multipart/mixed; boundary="===============3807714696314645906=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3807714696314645906==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v+3QrjJW0SnLoR7W"
Content-Disposition: inline


--v+3QrjJW0SnLoR7W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 26, 2023 at 02:25:28PM +0800, William Qiu wrote:

>  	if (of_device_is_compatible(pdev->dev.of_node, "starfive,jh7110-qspi")) {
> +		qspi_ahb = devm_clk_get(dev, "qspi-ahb");
> +		if (IS_ERR(qspi_ahb)) {
> +			dev_err(dev, "Cannot claim QSPI_AHB clock.\n");
> +			ret = PTR_ERR(qspi_ahb);
> +			return ret;
> +		}
> +
> +		ret = clk_prepare_enable(qspi_ahb);
> +		if (ret) {
> +			dev_err(dev, "Cannot enable QSPI AHB clock.\n");
> +			goto probe_clk_failed;
> +		}

Nothing ever disables or unprepares this clock as far as I can tell?
Perhaps also consider using the clk_bulk_ APIs.

--v+3QrjJW0SnLoR7W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRw0e4ACgkQJNaLcl1U
h9DDjAf/R/4LWKt8MIxLgActzDmknNj+os5gInUv/NtPY46t1E8c3jR/Eg97Gwi5
OlkkK9IGHeqfKcfWzj2JTZP+474sqV5Jss5qmQuBHcG+O8Vl63kxhlgDJi/v88Rs
CkyE+kbTbQgjNXVoq5XmHRRJfj5ncsv74NqrldUZEsfogSW6xuidDwgbp9lHOM21
5qZ2jLYI/JMLyu0hXO5HKofG8QcizYDmBsRrHBu/Im9RLesezvQDHpAaO2E0nl2q
MLLFaPijxFFGpl4sivm4QBJOO66TXc/Lh8JDk+qJd9EnElYMMw9YC/qxR+8syUp/
8kxK93togpBNaxDL4x5zo8EiNX0nBQ==
=c3SD
-----END PGP SIGNATURE-----

--v+3QrjJW0SnLoR7W--


--===============3807714696314645906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3807714696314645906==--

