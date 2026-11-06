Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A2B606A330
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 11:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3Ryp30c3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FIXfAf5Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=roRNsUt/v2emfcwF1/FiRNgQs6wpAYsl7fAIKZfuK7o=; b=3Ryp30c3AVtFqyY42sFu/B3fpK
	0MuM9E8+PaZL37P2HTfSeKj/QHed9iz4YtUIxAiD1SrDyu3yBFvy/5FZRQ6d79XAgNliuj4jlegN4
	LEHbPyDDRXojy937eBzfvC0VdaAIHC/TigtUNkhQAV3LuCzwofdijou+mH89UazpkTb58eA8rdfGz
	JZE1V6t3m/Fs23T7MqmKY2fPAtaL1lqAxRCC2DEjSI+ZvXFrPGPPLZU0ENZ4ixxc+mUXDIjICVo3m
	pOYFCdjE22QHeH25o+znFNv+cspbsj9Ljqxn7DsswTD330bK/jNFWq+FBqu0qv3KJbOwo8br6nFSF
	Je/FzfXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHrJ-0000000C6Mt-2MUi;
	Fri, 06 Nov 2026 11:11:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHrI-0000000C6M9-0aUL;
	Fri, 06 Nov 2026 11:11:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DFEFD408E7;
	Fri,  6 Nov 2026 11:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63A01F008BF;
	Fri,  6 Nov 2026 11:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793963507;
	bh=ymv0niTVnWnKS+pFTfZaMzhEe6bmcXaXyLur7KiR9IE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FIXfAf5Zx37NfO5GLrcenTXjpTMp1DBfUo4/QUReR8rF6AxsQTqUTrgRF+0j5apXe
	 ZB0NsHvsFvk6EgsiTAMagSpL6uWWpVkZUO8r/FNZUMbhYtYG0rYa3GIKwaKCAp0us4
	 m2XYoIP+BmjiDtH1xsZMGNKvkY2v/tVzeIN38VtoPTkjn6lQDWYpeUDZFqAW6ehXrX
	 HhmpmyJ6/r3j3guRCsDqPXblfup0LMrZj9h4WhEYnNGLQLKxw7j5zgX+we3FnKEQaP
	 LG3OckjSOE1p+dVd5p/tLlaFcGxSYVQbSNoO3UAmI3q0tAj/tgY6QsE4dkqT1/b3An
	 NzwCDdtReyohQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 91F4627E8491; Fri, 06 Nov 2026 11:11:07 +0000 (GMT)
Date: Fri, 6 Nov 2026 11:11:07 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jun Chang <jun.chang@metanoia-comm.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	CL Wang <cl634@andestech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Randolph Sheng-Kai =?utf-8?B?TGluKOael+iBluWHsSk=?= <randolph@andestech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>, linux-mmc@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 11/25] dt-bindings: spi: andestech,ae350-spi: make DMA
 and interrupts optional
Message-ID: <07329076-00d4-49c6-a320-165910a364b9@sirena.org.uk>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-11-86087eaf5af4@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261106-mt2824-v1-11-86087eaf5af4@bootlin.com>
X-Cookie: Whoever dies with the most toys wins.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3547481014813755710=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============3547481014813755710==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0rA9jbrCb+ammo71"
Content-Disposition: inline


--0rA9jbrCb+ammo71
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 10:30:08AM +0100, Beno=EEt Monin wrote:
> The ATCSPI200 controller can be used in PIO mode, without DMA, and PIO
> transfers can optionally use the controller's interrupt. Make dmas,
> dma-names and interrupts optional, and require dma-names if dmas is
> specified.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--0rA9jbrCb+ammo71
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau21ywAKCRAv73Ows9A4
iUbmAP9uPXjuvImN4DYj7yBA9yMQ34eBI4TfDanUysfyegnzFwEA41yLk793Adlv
ceQ4scKXQENx1b01FUJT30h4t/rYaA8=
=PoeG
-----END PGP SIGNATURE-----

--0rA9jbrCb+ammo71--


--===============3547481014813755710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3547481014813755710==--

