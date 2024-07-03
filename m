Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C600C2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 12:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHA+iLfhtm9ZK+SrwRegOGVmHCShfiKJxD8NCRuf2rs=; b=xEGZLDgjFHYpXw6SzP4hRC5XWM
	FyywEIMyctUB5KqQaOJxU2/CXtDfFZWXY2SbdK2iRh5mH/YfW0O1wTwO5EAgCZ8m/VOPpb30UA7H6
	4ZQV2jvIgM2PpjIWxxAGfMdkxdGfKK/LImDeYVAkl2a+rDuvwSbTiIehMl3qTfdwsFGRL6OLh2x5j
	U2fPghITt3YDC7thvSLwI5LaxaJbE/8zDiHXa7oOazCgxIj+MjKBUSAoHwTCwe9jov4sTUADqDp5a
	uihNcK7QwaLY9Ow+pDlsJK+fDXm+JCm3edcfeUV6msmocHxfkihm2QzxCb0/i/tCgvaGhptzxKjna
	DdwgIeRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOywS-0000000A8Fi-25N3;
	Wed, 03 Jul 2024 12:18:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOywO-0000000A8EZ-3gro;
	Wed, 03 Jul 2024 12:18:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D42FF6215B;
	Wed,  3 Jul 2024 12:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F95C32781;
	Wed,  3 Jul 2024 12:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720009104;
	bh=Xz7XmnRcHbAH6WxQfIQCBQ5wwm0Koi8PJNYau32jfTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCbVUmnt6oKYedEVrXZokdmKNt/p56purKTjCPdu0I8notvhvSyIsFOxSIKsFqou5
	 15hwrXirnYeswH2fOKq4ePLXX/YqLrncJb+P2lL+FSGeV+lT+Ugb7jGGB8N/GemJUs
	 +s6AUvm4uXUiUubO2m8SRwgfVqiVI3bvHoZti8n9IfR1YWhDri+qAhR2D7CazE1WSi
	 DYXxisSjZuUy2EQgUJ11OqsC/jJ7WgMnwY5ys4wyKQgby7dbRQmA+Q6M3Sd7ECpY3T
	 6Yqt2c9ssuH177wbJ9Lx55K8mWXoPJt5OCcSCJr0+WBF71zu9mH49RClhXFAnHdpSc
	 2Pv2Acp8/4HDQ==
Date: Wed, 3 Jul 2024 13:18:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Richard Leitner <richard.leitner@linux.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	llvm@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 17/20] ASoC: arizona: convert to
 of_property_for_each_u32_new()
Message-ID: <7f057c8b-9b76-4e31-a3cf-b82e52618529@sirena.org.uk>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
 <20240703-of_property_for_each_u32-v1-17-42c1fc0b82aa@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20240703-of_property_for_each_u32-v1-17-42c1fc0b82aa@bootlin.com>
X-Cookie: There is a fly on your nose.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_051829_037608_593754D0 
X-CRM114-Status: GOOD (  11.48  )
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
Content-Type: multipart/mixed; boundary="===============5129163688647857304=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5129163688647857304==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NvGtanZygkHeLcw1"
Content-Disposition: inline


--NvGtanZygkHeLcw1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 03, 2024 at 12:37:01PM +0200, Luca Ceresoli wrote:
> Simplify code using of_property_for_each_u32_new() as the two additional
> parameters in of_property_for_each_u32() are not used here.

Acked-by: Mark Brown <broonie@kernel.org>

--NvGtanZygkHeLcw1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaFQYAACgkQJNaLcl1U
h9AylQf9G8/SGzOMtUK0KB/AFXzHYIfp3WpSO5hnxcx+E5C7ZK4bjWCUH/uunXlj
F4Jf8unGlljKf05YliMJQdU+V6rteVrAjhbODBpOyO3KgNcahTjDSsdel5a8kNxy
xs3TjgeAoSA6aWSldnG9epfMTrso4U2krM6J7EpllETpHMhVEr19Tk/DczdltAFA
mqPoVSFfTNlYtiXK1/0dRLf9DiwVXVKh0Pg13G8lYTkxUb51nVwvoBAxCQ0kLhYc
whKK5upczFTpJCDEyHz17yMu3fWXyZaYCDCzPbqLkycwsy6u21KKM5tAvMr8o2Xd
zlsu2XFciX4F1nPtsj9mR7UcMVjyRw==
=W6f6
-----END PGP SIGNATURE-----

--NvGtanZygkHeLcw1--


--===============5129163688647857304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5129163688647857304==--

