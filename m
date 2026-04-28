Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F79CFF8864
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 00:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcgKaRweAANWkRrz7vDhLPLruAmDZQPhuT6zCNRxY6E=; b=Wg4lQwmBzvH9v6G1YHsX2Irw6l
	YHgxBPIuHoeYlKlCGhIp+qY7TCeYAXWbnKIX8DsqOxJ7iHiD7su/VxPTVRt/lLr2Hux5dfruhimYX
	JQPOds8h4/qvUoBToYbP7LnYeHrd8UWjcv+4qpDKz/c8YBwlVWZiO3QOSZ0gmFyl+zANu/UcnWh3+
	GU1AKMreLyJCJCod6ZKUCrpQHTzg8VUigeh6Ez07QjoUilQjHSw08SAdukwgSQ1bUWnOkCKe6AF0v
	kRDcIG3+BbaEN13DJ9tPbdlFS4l/HxCNP4yseupnwJq4O9wArHYCYsmS5Th9n0Xg304FYNnUlYFhy
	gC4S7icQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHW8z-00000000KYQ-1NDZ;
	Tue, 28 Apr 2026 00:17:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHW8x-00000000KY0-0S4W
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 00:17:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3142840E2B;
	Tue, 28 Apr 2026 00:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13E9C19425;
	Tue, 28 Apr 2026 00:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777335458;
	bh=6RCzVcVHnWB7Xitp60ejz8BoMUtumigfr5ZwTpbOtJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cJ78DAZprfEadaOsdbT59/5Ch0WQGduepbtv8F020hgjU0ql+lhvRnGHz+VTrwjdD
	 5EehzHaQkK4rgZw4wM0UqMP8ETaTDZ5Ty7c8ziuHuG1jCyEJwPH0J73BFEm6rBQt5a
	 2vnTUPGVi01plwJSvt8F3c41VgmDMblGOalFxUzPx8tP/M1X2C+lbKUewl/KpFHy+y
	 4uSL4AejTYdfJGJ13o6kdZnGmIhMQ5rZY4rs/o+kOmRIXoMPCbB7clr2ulMJ0kkE9S
	 Ui08MzklpYlwOG35XfZzRRDEkmC0qg5VUlKHcASl8ufgrTMib9ww8R+rO3z3BYWcx9
	 owOWzMyrBOOgQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 31EB71AC583E; Tue, 28 Apr 2026 01:17:35 +0100 (BST)
Date: Tue, 28 Apr 2026 09:17:35 +0900
From: Mark Brown <broonie@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v9 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
Message-ID: <ae_8n0I_ORDLib1y@sirena.co.uk>
References: <20260427-spi-spacemit-k1-v9-0-ff753b551302@riscstar.com>
 <20260427-spi-spacemit-k1-v9-2-ff753b551302@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20260427-spi-spacemit-k1-v9-2-ff753b551302@riscstar.com>
X-Cookie: Victory uber allies!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_171739_171112_1814A88E 
X-CRM114-Status: GOOD (  13.77  )
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
Content-Type: multipart/mixed; boundary="===============4864311354394898459=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4864311354394898459==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uloWIL4Vd8FJnYvz"
Content-Disposition: inline


--uloWIL4Vd8FJnYvz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2026 at 10:01:28PM -0400, Guodong Xu wrote:

> +static int k1_spi_transfer_one(struct spi_controller *host,
> +			       struct spi_device *spi,
> +			       struct spi_transfer *transfer)
> +{

> +	/* Record how many words the len bytes represent */
> +	count = transfer->len / drv_data->bytes;
> +	drv_data->rx_resid = count;
> +	drv_data->tx_resid = count;

This is setting up _resid with a number of words.

> +static void k1_spi_write_word(struct k1_spi_driver_data *drv_data)
> +{
> +	struct spi_transfer *transfer = drv_data->transfer;
> +	u32 bytes = drv_data->bytes;
> +	u32 val;
> +
> +	if (transfer->tx_buf) {
> +		const void *buf;
> +
> +		buf = transfer->tx_buf + (transfer->len - drv_data->tx_resid);

This is using _resid as a byte count.  It'll be fine for 8 bits per word
(which is by far the most common thing).

--uloWIL4Vd8FJnYvz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnv/J4ACgkQJNaLcl1U
h9BKxgf9HFwNyeCFgiJ1m6lF9UKtdez+pweMTHvDt7wqUtMyufYwnBTIxOIB3Kv7
mh5QcTbeorohLLIvkOV2893vxCNwlLyZdUU+dFQak6B6RQGSYLJoIjDJtSuyjYhM
T+2YKiSllt6ejJCezhmo56WDtVCSJR820A3qYN+T5B/52xwFkNa7SoiBG7PB9Wya
57r8VQLQ4ZeG5MBmwHe23njUPZj2WYYwMUo0Uz0j+9H1gdPugU1nv7B2q9hKCRPe
Xo1mIWG3NiZ28wHyCT73ICpkRSOj62o8nw9EUauWSu9hwI6z4wT508HxWY+tkSAy
qBlmsjEqZ/rJtgIQyFZsnKgAi341Vw==
=TBfs
-----END PGP SIGNATURE-----

--uloWIL4Vd8FJnYvz--


--===============4864311354394898459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4864311354394898459==--

