Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C737109190F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 18:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yz/eF9AVii8XJsJZVZuKgvPBNID7J7/qWD1nYk4FI48=; b=0/xE+L+y6ybLUX+QKaP4ZHUI0j
	VmfMleY2XxoDqj/pIk3+e6ZlV/cDhdUfSRl4ItgvitgpiQEgfAJgWRloEPmXBsDrZCl4B4qL9we/B
	w8Ip7+8LxnqcUIdxm0ZvecKC0RPCghXsfT9aHKttd0AOkYn0jsT3GKf+p9zEaec73wSa4YFTFRrGt
	izxeQ0oJEOgEu2+emHG3f3hQBwedzFT8f1Q822yGxGRRvpNcuOeQVdNF+wxsLY7M18ChGiISZrhQd
	JMsQNTUqci4zzopkqx+krbWV5mt2tLIyMlpsFu0auvPtYpq1AFfq8hyp9Ep6nB0RAE7tNDlWzZv8w
	vo+hP9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I8T-0000000BLnX-3C0u;
	Thu, 19 Mar 2026 18:30:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I8S-0000000BLma-11YX;
	Thu, 19 Mar 2026 18:30:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69C6660053;
	Thu, 19 Mar 2026 18:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F1BC19424;
	Thu, 19 Mar 2026 18:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773945019;
	bh=39Cu39toy/8GhZJ1SgNYS+5TuFP8tJKlZwmBlPRVTyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mH4ZE2RMd4lnRRky54nqLEeAMEN+ykwXu0nCF43Mkdsb6H7KxQTBoK9+gR7JwoL9v
	 1nw9Od46tXH5FqN8/+h+LCOnjzj+IQTvZXUGONvamwRvFflqds+TQ/9P47olGMl832
	 UR8YVXcNqB7Z//D3pEFc1UpZrfvx4zImqjtWp6EkBqD/LIYbnlcBSkRygZGFo0RnoQ
	 l5ETfGl44nPTnZsu/NqTiHKWDdYUyVmT3zRMDKfvQMY4ca4bG1bRRNlggmJn//2hJO
	 lz2SKFJPnDgD2JZvmRCDwLDgqjJSXM7rDmCL2Ts57rtqAVDyRS8a+BH5iJu+EEXeQt
	 iDbynoypmOuPQ==
Date: Thu, 19 Mar 2026 18:30:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com,
	amelie.delaunay@foss.st.com
Subject: Re: [PATCH v5 10/17] spi: slave-mt27xx: Simplify clock handling with
 devm_clk_get_enabled()
Message-ID: <e9e26679-036f-4cfe-90b7-ec0ce57b5304@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <d8a7d6cd3c33419db98027b9346cf078a6b8b4c8.1773885292.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
In-Reply-To: <d8a7d6cd3c33419db98027b9346cf078a6b8b4c8.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: Given my druthers, I'd druther not.
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
Content-Type: multipart/mixed; boundary="===============6327317153340554274=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6327317153340554274==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="noPRvBXZlo6sTtNk"
Content-Disposition: inline


--noPRvBXZlo6sTtNk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 10:04:06AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for the "spi" clock. This reduces boilerplate
> code and error handling, as the managed API automatically disables the
> clock when the device is removed or if probe fails.

This driver is dynamically managing the clock so devm_clk_get_enabled()
isn't a good conversion here, there's probably some bugs around runtime
PM being disabled but this'll not help.

--noPRvBXZlo6sTtNk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm8QLUACgkQJNaLcl1U
h9AlXwf+O/j4y9RCkRUATb7XdaYqoh/vDEx4mftt8jW3vU1SX0BXTm7XYbi1yLLO
+EKgiIdTRsnLBX/qp3gOXWkQPLLXRuFjsE0bA3x2yXeTRhQcpAEDUB55LLzEGzmd
79I+MlMlDSNmDhqsOT6/nyFYyP1HDQonwyMDlXc1Ec+qf39VS1Jf0I0jyttCAV2Z
6tRuFSmQiY59a4QR8tXqIzpLB7yqhIqqIRonUA5zuOxdB6S1O9BTh5SCXTOVE6t/
C58WLO0KgipP/jucVZUz4iCb94XRvzrRt+r9nTwbGgLxGPwbPgB12NPH/BbDwGdx
if/9vikYeWfN8GP3BkZJSg6wWr/vHw==
=JXnH
-----END PGP SIGNATURE-----

--noPRvBXZlo6sTtNk--


--===============6327317153340554274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6327317153340554274==--

