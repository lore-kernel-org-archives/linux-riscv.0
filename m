Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991BCC61DD3
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 21:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrFqXPnfuRmW45/W3oUp6mbtt5axHZnYCZBaOi3Obu0=; b=EeaE5I4L4yVZiefHyLGpSAdItg
	4T4ohd2Wg4NG1jByQ+xPFcqdSZz4sN/P6+ecE57G8z4y6hYzFi0FfbYm+w7HSa72DfXJhV6Rba/Wz
	HA+arXQ1MTwwdNqVMzZUNbf2DYDjBD4r1UtlKVQp/tnBT7L9FYCwkNcICMKBnCDOuZBvqo9UmC8NR
	UogI3gs57BHYmGaVHh2XdkuxAWpf8usdMKrtOqQHcmbtguzX3tE2LAC5GmQVXCo32vDySq93Y0zcM
	XvHdCsmU8OWaHTlfTILWA4mfzIYT0ZBuZkn6siFdMC7BEuBr5xFRGsFtVlc3T/P3QsqiwGVS67UW8
	kSFAOYzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19XI-0000000AXVD-2in6;
	Mon, 31 Aug 2026 21:27:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19XG-0000000AXV5-44eM
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 21:27:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 04E6F40210;
	Mon, 31 Aug 2026 21:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A7B1F000E9;
	Mon, 31 Aug 2026 21:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788211641;
	bh=UWkAB/0UN0jAczMe5AfSqL0s1dlXiU0QWMONLCr0qvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B5Wg3vRFGUo/ZoMi0Kd9Mepopts3nZTxI9uo7amXP04TaiWeNf9eDNLC4CyNIlO01
	 Jr883+5+GPQ9HhKM/TaroYUonHwy4Ok6GcinzJznQEeLkRlpewaXwfivVhiTW9U/Mq
	 Il76JpGMDjl37kEOvVRN0uBpp46GqKnx0zAAv93tUSeGcpKlaOJcugX0zpJ+QhlElM
	 s6p4S3wckoXM0VPhh5+tfCAOSuoiZ8OafEGWcbxg9EEzN6dlrTfGsboCwxX86argFz
	 HRMTWQNva1hq2bjmlEl4q16uN5PGThW/1wMTTPnyrBZIRtQiZOHB3+lvU8kkfSVjwM
	 qfiyp9r3K7J2w==
Date: Mon, 31 Aug 2026 22:27:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH 06/12] spi: dt-bindings: snps,dw-apb-ssi: Add compatible
 for UltraRISC DP1000 SoC
Message-ID: <9bd5a17a-43a8-4e3b-bd12-ddde9265c2f0@sirena.org.uk>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-6-61ab7aebe9e5@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260824-ultrarisc-dts-v1-6-61ab7aebe9e5@ultrarisc.com>
X-Cookie: Chocolate chip.
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
Content-Type: multipart/mixed; boundary="===============7637853790963351151=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7637853790963351151==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q+7g5Wbpwns/c8Jq"
Content-Disposition: inline


--q+7g5Wbpwns/c8Jq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 24, 2026 at 01:54:19PM +0800, Jia Wang wrote:
> Add the SoC-specific compatible string and use the generic one as fallback
> for the UltraRISC DP1000 SPI controller.

This doesn't apply against current code, please check and resend.

--q+7g5Wbpwns/c8Jq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqV8bAACgkQJNaLcl1U
h9DI8wf/eSvMfTYF0nSWOpBbx64lahzK6gdu0QfgliH0pyXLXPkDKM/MJk8BN5Mn
h1/EIUG8xEEzzOTWbycIU1gyEVN1BSPELOL8mSJJg+5YS4SCKHjPLUvzHJUb+Tiv
I41ubInBfOHEb15rEuP04UQovZYMvLCr/Grw4crXMM/hZW5RjdT48QhaltrjdbNT
UOhg1ybDz4UzhD9ys7VACQ+U/cjjhbNezZZR4PaUST3pbURHoE9WFpohUbBhK5xT
esoGPKe+DYO0LkRQ+SGGTekeE0q5hhwDGNp5F2rqqoz/8jUv5/iFlNsmUGvJQQAR
0/8l/S9EqYMPbSKL1NQDqYdfFKPZQQ==
=u+gt
-----END PGP SIGNATURE-----

--q+7g5Wbpwns/c8Jq--


--===============7637853790963351151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7637853790963351151==--

