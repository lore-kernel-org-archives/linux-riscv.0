Return-Path: <SRS0=fXqm=NY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEAFAC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 18:35:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1B602175B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 18:35:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="akUad2Mt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="bCPKtJt1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1B602175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k3U18Ko/nu6MPwTawmsDmEWOYirsfymAuj6vgdwunIQ=; b=akUad2MtL1mhrOPOSVehQGPhX
	Hv4j1aGgKxJfEba5IaOPgJOuprHCGCOZGsFiyM7JAR1ghXRQLXyjgEOIY+mZDJ3RlZox5/7/R93A0
	D+J7Kq4ztkv3CoXJbGg+J+IYZ5ZmO2Kmc13ibKKrcT5At+HoQInVV4QbKHsT4hU19LPBs12sCcTQ2
	AkFHB4PbDSX1tTF/yZo5HDHWZ3S/hdwDAw0Em16K2z1z3uskCP725DUvsndtB5pzb20BnOVHXjrRy
	YLfYwpMnrzqfWJgObH2kuWNH05E2ukvKNZmlBqZ+gmJCSbiRCXDTGS3aluYTKQb6l+GvzetWMZAjT
	arTh+AAkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMdXS-0008Mb-KD; Tue, 13 Nov 2018 18:35:50 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMdXP-0008E2-BZ
 for linux-riscv@lists.infradead.org; Tue, 13 Nov 2018 18:35:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OSuenFzkZBtgaOD9SE04NZNOhTdUroCJUkTcTsREdRI=; b=bCPKtJt10Xl/c+Cj9V//7CpD/
 cZbgYJ9vw9srwwsa38ojtiIwnjLTJ5bUmn/n6+sSM5qDt8GH75lpPLLzDouhSqutvDZ9qPXVAziI3
 k0rSG+zszLdEkmPrTrdTEjw9TZ215ITX/O3TvMPghgbWPu5On1nO/FbI5q9b97KXCvn9k=;
Received: from [64.114.255.97] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1gMdXB-0002QI-MP; Tue, 13 Nov 2018 18:35:33 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 5C6B3440078; Tue, 13 Nov 2018 18:35:27 +0000 (GMT)
Date: Tue, 13 Nov 2018 10:35:27 -0800
From: Mark Brown <broonie@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [RFC PATCH] spi: add driver for the SiFive SPI controller
Message-ID: <20181113183527.GG2089@sirena.org.uk>
References: <20181112142736.15009-1-kernel@esmil.dk>
MIME-Version: 1.0
In-Reply-To: <20181112142736.15009-1-kernel@esmil.dk>
X-Cookie: No Canadian coins.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181113_103547_538253_E6413885 
X-CRM114-Status: GOOD (  21.17  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1329573162419404625=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181113183527.1qcH7tBQCdACjkzbtqZz0CovTkSxY13pqDP939v9F3Y@z>


--===============1329573162419404625==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="df+09Je9rNq3P+GE"
Content-Disposition: inline


--df+09Je9rNq3P+GE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 12, 2018 at 03:27:36PM +0100, Emil Renner Berthing wrote:

> I know the discussions about the sifive devicetree compatible
> strings haven't come to a conclusion, so I'm sending this as
> an RFC to get some feedback on the rest of the code.

I've not seen any of these discussions or earlier versions of this
driver so I've no idea what's going on here :(

> +Optional properties:
> +- sifive,fifo-depth		: Depth of hardware queues; defaults to 8
> +- sifive,max-bits-per-word	: Maximum bits per word; defaults to 8
> +

If the hardware isn't fixed yet making these enumerable from the
hardware would be good...

> @@ -0,0 +1,442 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SiFive SPI controller driver (master mode only)
> + *

Please make the entire comment a C++ one to make this look more
intentinal.

> +/* for consistency we need this symbol */
> +#ifdef REG_FMT
> +#undef REG_FMT
> +#endif

We do?  For consistency with what?

> +static void sifive_spi_init(struct sifive_spi *spi)
> +{

> +	/* Set CS/SCK Delays and Inactive Time to defaults */
> +
> +	/* Exit specialized memory-mapped SPI flash mode */

...or not?

> +	/* Set frame format */
> +	cr = FMT_LEN(t->bits_per_word);
> +	switch (mode) {
> +	case SPI_NBITS_QUAD:
> +		cr |= FMT_PROTO_QUAD;
> +		break;

Some namespacing on the driver #defines would be a bit safer against the
possibility of collision with future changes in headers.

> +static void sifive_spi_wait(struct sifive_spi *spi, u32 bit, int poll)
> +{
> +	if (poll) {
> +		u32 cr;
> +		do cr = sifive_spi_read(spi, REG_IP);
> +		while (!(cr & bit));

Please add some braces, indentation or something to make it more clear
that the read is part of a do/while loop - right now it's not
immediately obvious that this is correct.

> +static int sifive_spi_transfer_one(struct spi_master *master,
> +		struct spi_device *device, struct spi_transfer *t)
> +{
> +	struct sifive_spi *spi = spi_master_get_devdata(master);
> +	int poll = sifive_spi_prep_transfer(spi, device, t);
> +
> +	sifive_spi_execute(spi, t, poll);
> +

Why not just inline the execute function here?  It's the only caller
AFAICT.

> +static void sifive_spi_set_cs(struct spi_device *device, bool is_high)
> +{
> +	struct sifive_spi *spi = spi_master_get_devdata(device->master);
> +
> +	/* Reverse polarity is handled by SCMR/CPOL. Not inverted CS. */
> +	if (device->mode & SPI_CS_HIGH)
> +		is_high = !is_high;

spi_set_cs() will handle CS_HIGH for you.

> +	master->bits_per_word_mask = SPI_BPW_MASK(8);

I thought the device supported other bits per word values?

> +	/* If mmc_spi sees a dma_mask, it starts using dma mapped buffers.
> +	 * Probably it should rely on the SPI core auto mapping instead.
> +	 */
> +	pdev->dev.dma_mask = NULL;

If this is a problem please fix it in the MMC core, don't bodge it like
this.

> +static const struct of_device_id sifive_spi_of_match[] = {
> +	{ .compatible = "sifive,spi0", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, sifive_spi_of_match);

spi0 is a *weird* compatible name.

--df+09Je9rNq3P+GE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvrGW4ACgkQJNaLcl1U
h9Afuwf/Y1cjBT6JU+ydckCZJW0OKyMIVU51jBKHs7/iW9J/d/All96iTXJxDSik
NwWuGbuQ9J0npiReDRWdPFv86Cx+vaDJP7W4Sh5n0t65wgIsYe2/GF47guIRTaaz
6Z1s0inTYuu50N35m8rIfstMtkPVb42BRpEYnSZV1t1eGBEl8K/tDoxgxDv6ecHv
ohTAo3k/4Ol4XFYfcIN4rYqL83e+dg1AMfNfdPqxPSWDuKbLh5/23jrhdqmaJIsf
gEtyDHuRoEmC2Jud3Upt7iGtbA3Ezfa11yZ+wlAG6nBnB53FjusLylyrlDlsp0om
qX/8rsCTyN0pMK1cCu1sDzOsVfn+SA==
=fZ/2
-----END PGP SIGNATURE-----

--df+09Je9rNq3P+GE--


--===============1329573162419404625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1329573162419404625==--

