Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D2C105A593
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 13:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qj0mjSGwCKx4RPmjxRZGR6G+JJZ31puUkZvpAj5azNQ=; b=zS21uW3UdzQhSYFN6kUcOm4IAN
	CxZihm457Trdxy2zYRjMSNKLOPnjhKG2bpnwyMrqiOLaSPplx824H48Utu6m36dNWpETzmZ/aVjGO
	kqXOFhTt7y0UWNUWCTGWKEmaSNXOa7etAg3OC0exp66gCrjfE0cQf66XVf4afrnSEM0XTk8NshA0P
	EhtdMjyOij/KpiXG4U3lXbGib1r2l2yW6qthjTGsOdr09bvippf9jvrb6UozkUABLl4RC6I1MRk3/
	rG1knvH8ttk6Ace9+6Oh5+y4z6LauRthUIV4YtO/HYC3yU1yyb67s/Ulj48NGMt4Ka7aMJvzcZi/T
	ZMbX2ncg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fgL-0000000E68M-0ZBD;
	Thu, 12 Mar 2026 13:02:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fgI-0000000E67I-317t;
	Thu, 12 Mar 2026 13:02:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AB13160131;
	Thu, 12 Mar 2026 13:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75297C19424;
	Thu, 12 Mar 2026 13:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773320545;
	bh=6JGSpqVxm5Xk2m9ccSi9/f5mq6saFDm1oVr7MCpFyr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ijzuRMZaAG0cxBMl7gDHrSzew3fvUz+nBqTiXPU+NIp69zqt1wfJfesyFC/fVZS3+
	 fpJQfT7RAlMy6CdCes95jyDBXqJ9b0oy2+/mIhMf1FRNGI13AM1NqmAm86j3/A/552
	 5kQ9+UXYzpoZsbEKqCumRSSwg+UQG2vj14Bds3PbgErv5h43Bs/xRG8wi00G2nRngr
	 EIIwDGkg6bJW4vTpgIQrRiJEabuw4Tb1FNbFO22KU/UjrislDHxxzWqcPdnp2DTFq5
	 sey6Gzv43mUHHEgvpwlNQvy8QnAR90ilRc2oUbTs2Xh0giY+jhiCjSVqkQ2SFWQMPl
	 im56x+2su4L1w==
Date: Thu, 12 Mar 2026 13:02:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 13/17] spi: stm32: Use helper function
 devm_clk_get_enabled()
Message-ID: <8fe16029-2830-44c3-bf32-5aea31f72c62@sirena.org.uk>
References: <cover.1773306858.git.xiaopei01@kylinos.cn>
 <d239cda51bb3dcc84da4a7194a30f3be82422f70.1773306858.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
In-Reply-To: <d239cda51bb3dcc84da4a7194a30f3be82422f70.1773306858.git.xiaopei01@kylinos.cn>
X-Cookie: I feel better about world problems now!
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
Content-Type: multipart/mixed; boundary="===============4456242566755897715=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4456242566755897715==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9knHiRnV8mpI+WJ7"
Content-Disposition: inline


--9knHiRnV8mpI+WJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 12, 2026 at 05:29:05PM +0800, Pei Xiao wrote:

> +	if (!cfg->has_device_mode && device_mode)
> +		return dev_err_probe(&pdev->dev, -EPERM, "spi-slave not
> +				     supported\n");

Similar thing in this driver here.

--9knHiRnV8mpI+WJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmyuVsACgkQJNaLcl1U
h9CkwggAg24YBsU71i5Djghu/lHhxeErxA+7HBjAV3TstCzfospFBacxZTrIypgS
mWtgo+SwmXbDn6WiyjDlwpIMTI6PFDzzMn6x6sxwj5/OD1osR2cJ2SYzYSbwFxbQ
uoJphNgSht3FEaDioOtHfdrgiLIkMm+/TYlf1u7+ZzrgI4ueyhtCfs0dN8EfdB+q
pAJUva6gft4S6N3uS4kagfQP8e+IwxXr5fekxL3p7Y9XYpa30rHE56Oc7sbGWGma
+WP0OfGjImbuvKtGxAPKoGBte/kLIrsSHoAFhTLSytjUxs4uuftK3Y5g3d7zq1fh
+TRESnlE15ixsifgA+1umZAfcpBjfA==
=ouCy
-----END PGP SIGNATURE-----

--9knHiRnV8mpI+WJ7--


--===============4456242566755897715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4456242566755897715==--

