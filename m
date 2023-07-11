Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30ED9C001DD
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 14:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWbTTRIrvXGXSuzRrPRLz6OZ2S7v7G73qSZJfr3um0k=; b=N6+jQ3XkP/aBS1yKwV6f2wLejA
	TCyLCQKd0nZ75a7rBRfqGWCbulvSBtN+UrmMZ+Dv92z0aj1DVPh0mvD3YToBK30o3qWY6lTuiGcaA
	bvBh0h6TU52VHqJ/o8SEVbRaumlKnFEw0QMOIZfHztjKp8jLJp0iuQhybNRCtgMiUfa6zCRGfW59N
	i775Wu2McyKCP4/ARLmSTeCH3Z2mD0SaNzgKCDCO2BON0F+7eAkRKMaHrscKClWrSpgKQXvJ+fI1h
	gNO0o59TbzNlj6qnh1e2DT3ENTHf8bT+EJmAYSKQmp/a5rG130VYQlqizAa1sSCJ/tiQR2ncGbrsW
	+Ap0pRkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJE93-00F5al-2Y;
	Tue, 11 Jul 2023 14:15:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJE8z-00F5ZO-0c;
	Tue, 11 Jul 2023 14:15:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 77C8D61360;
	Tue, 11 Jul 2023 14:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209CBC433C9;
	Tue, 11 Jul 2023 14:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689084907;
	bh=A+lgFSqWg8vRgir1XqFzY9nIE1Cw0dwqFBu8P2BdZBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KwXQpO0JwJwS2tync5AfGpO9HXb9u4mgZfpWRxyxjmWV7o23oHa66oSgLBUqWen2D
	 ZlOHsSEyXpzrsEeWWEmLhLLitAzI15911I18ub63ARZldiwGDK6EeLi3B34Qy+IEG4
	 waxyA6VmnpE80hBohYtayTpWfyRhiz5yBCu2xfPCie7wDB1OJGO5pfFeIe7TmhLaf6
	 2F7TtEpspxDmIAOKWfQt4n5/QaTo60Dymh5zBKNq1hnkXPOMFNsHXFu721qfrAekf9
	 KAql0ORVXuf2YxOmwhPq6tE1iNaCTZM61qgKsPoZvWs0hppRNFtMcBrTT4RcCr66z6
	 VpMXSzxRgleHw==
Date: Tue, 11 Jul 2023 15:14:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v2 04/15] spi: Replace open coded
 spi_controller_xfer_timeout()
Message-ID: <5959b123-09e3-474b-9ab0-68d71cfdd9a2@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
 <cfaffa00-4b61-4d81-8675-70295844513b@sirena.org.uk>
 <ZK02efTYxV3czigr@smile.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <ZK02efTYxV3czigr@smile.fi.intel.com>
X-Cookie: marriage, n.:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_071509_312756_2EC12027 
X-CRM114-Status: GOOD (  22.65  )
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
Content-Type: multipart/mixed; boundary="===============9085570207822533395=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9085570207822533395==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MZrPSMfLUzZVYlnE"
Content-Disposition: inline


--MZrPSMfLUzZVYlnE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 11, 2023 at 02:01:13PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 10, 2023 at 06:30:32PM +0100, Mark Brown wrote:
> > On Mon, Jul 10, 2023 at 06:49:21PM +0300, Andy Shevchenko wrote:

> > > + * Assume speed to be 100 kHz if it's not defined at the time of invocation.

> > You didn't mention this bit in the changelog, and I'm not 100% convinced
> > it was the best idea in the first place.  It's going to result in some
> > very big timeouts if it goes off, and we really should be doing
> > validation much earlier in the process.

> Okay, let's drop this change.

Like I say we *should* be fine with the refactoring without this, or at
least if it's an issue we should improve the validation.

> > > +	u32 speed_hz = xfer->speed_hz ?: 100000;

> > Not only the ternery operator, but the version without the second
> > argument for extra clarity!

> Elvis can be interpreted as "A _or_ B (if A is false/0)".
> Some pieces related to SPI use Elvis already IIRC.

I understand what it means, I just don't find it's adding clarity most
of the times it's used (there's a few places where it is useful like
pasting in strings in formats).  There are some examples that I'd
complain about in the code, most of them predating me working on SPI too
much, but I'm not a fan.

--MZrPSMfLUzZVYlnE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmStY90ACgkQJNaLcl1U
h9DeQQf+MxpgOv6egcsQtreuAtaq7Ev7HPCaH6MbusHDNH2hElvH+GmEYjovkV6m
h3LadU5OvktJBaXfjDQRjU71Cbf70/Nlo8I3WN5V4iRKzqWtfMV16ZStvy2+1Rx/
jHek+Aib8L8SiwlzvD6WB163yHCsSn5KBv2Pqp95DjGWamTl918onxXzSS6g2j5A
ib1Mz8aOXWBsiIdaFTQ3NoK7Uvnykzp1X2uGcfrRZuPWQNVvpJs/wt5iOuTpuEws
6O2PEgJext+6CeKBCv8pCvpex2QsVtDKLnDVvmDX4Oa2impxsxSIjLyVbZfbJ480
4XviYIQ2LNlTFidlbAAqqEafOQrvRg==
=WM20
-----END PGP SIGNATURE-----

--MZrPSMfLUzZVYlnE--


--===============9085570207822533395==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9085570207822533395==--

