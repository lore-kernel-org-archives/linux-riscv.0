Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697F6C982D0
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 20:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQWJL4Fq6/ipy/bRSoQXXyaDGSEqgCR6aEdZN9mRJv8=; b=xVXodinsUPN+DDpQ3c9aNWRogn
	ZruWwB+wmSvfyMimIyfbqJfxOAxh5CRkdTv9mP+Q4w+NYNepR4uWf3HPo7rfgih4RsruQR9LzENKK
	3x7vC/ybR5s+ikba2nxTEVPDz9gDPWZq7GBEKAjVlDrOWjWncfimw0Dsh+87uSpmr2VckwnPn2FjK
	VZgUTgREgxpKDbLlHRTSMK5nTMmz5TimB0gpqHZNv0TvNfBecpiJ3PiDmJn8fV9Du/axmkydhFtfe
	eVcT7La4h52GVovlNaQtJP78AwVIHK3vBfol1+mGy1Fo5giW6v19rkWUBQ4aFJAlAVnToAaAauIYF
	NFWKjUyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Is8-0000000CRZK-1UkE;
	Thu, 17 Sep 2026 20:38:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Is7-0000000CRZ0-1Vo8
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 20:38:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A84BE601EF;
	Thu, 17 Sep 2026 20:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A6F51F000FF;
	Thu, 17 Sep 2026 20:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789677498;
	bh=SWUtFnbkl/ANEyOP/8G3mNVn9Z4HzwhIEpWFM6p/Mpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lrJlVaarsGQ9on1c4U+EiFHGWSuEkMFksogd8968E1TcdHD1h63wrM6oaNnxxUga7
	 xRrpcfdqZu5+aCWeB1iVE4UlyQ3KZParHmH4VVeOXAxY46q0MVQBO7S+DKl4/77++2
	 2n3JXuA9UGbxyILLQZ8bcbJ7TfbCmpYqm7kHwCMc4ArrmwY5447xg++3NRrpBRyinZ
	 jOorI8sUXDohbPSLgei2CN+ZDiEcskkdCkPUmZdpwMcAxKTmIOrMHFHSpmCP0noUTn
	 A96L/XsdpugluNUI2Jm1wR5iomN26rqlAzqDced6aq+ywk2ci4nivmNWJ4BqlANSSW
	 iZxIgK7kUadrA==
Date: Thu, 17 Sep 2026 21:38:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Longbin Li <looong.bin@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/4] spi: sg2044-nor: Honor SPI clock limits
Message-ID: <fd3dad9f-7997-47ce-875d-db43901002f3@sirena.org.uk>
References: <20260917-fix-sg204xspi-v1-0-5c95dac429a8@iscas.ac.cn>
 <20260917-fix-sg204xspi-v1-2-5c95dac429a8@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260917-fix-sg204xspi-v1-2-5c95dac429a8@iscas.ac.cn>
X-Cookie: Whip it, whip it good!
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
Content-Type: multipart/mixed; boundary="===============2829893676904673088=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2829893676904673088==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gzg0WQ0iyDkhretZ"
Content-Disposition: inline


--gzg0WQ0iyDkhretZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 17, 2026 at 10:29:20PM +0800, Han Gao wrote:
> The fixed divider ignores device and operation clock limits. Calculate
> the divider before each transfer so SCK does not exceed either limit.

> +static int sg2044_spifmc_set_speed(struct sg2044_spifmc *spifmc,
> +				   unsigned int speed_hz)
> +{
> +	unsigned long rate = clk_get_rate(spifmc->clk);
> +	u64 div;
> +	u32 reg;
> +
> +	if (!rate || !speed_hz)
> +		return -EINVAL;

Specifying a maximum speed is optional so we might have a currently
working setup with one omitted.  The driver should just go with the
maximum speed it supports in that case.

--gzg0WQ0iyDkhretZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqsT7MACgkQJNaLcl1U
h9ChUgf/eAoO1JBRrehh23WNTyeoLDYUC/+Qaxj77qoslz/vc36kBzcN/xwqSFV6
MyrZmHaWzdra3c2Z76l4MjssxvP6tN5UOldDyINacKYDE5WGU72XyJGbxXXFgzNV
xcsWAueHF6glcg2QqqA9Gp0b5ZOtHLZegCiPfJmmjOyR0dJUWlcoZSWcZNVjBcpI
fe2zAwHAMGN0RAcXg9nbnmCdATkfo8FruPDx8A2904TRZJjORB8cDHS5Gk997KhU
feb4PhizTGUINbvbpombQ9ZKuKMBo4cTwNA3A9OP869Gv7puQ3P3Y2aDlCBnLIqp
F5Ph65rtr70KpqBotgdbaKIZ0utdHw==
=4TGH
-----END PGP SIGNATURE-----

--gzg0WQ0iyDkhretZ--


--===============2829893676904673088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2829893676904673088==--

