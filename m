Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B63105A591
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 12:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kz8KROYmP0u7OYkMrNh5L/IHz7mjV4pwpNmSK8QB8G0=; b=19OtTooPnfm7xAD7eRpqDI8AL3
	GpfDq+3N3fBfbhBPG4JDeOLSJXSRB0Wptf/0c4g46E34jO8X1nennXLUlyT+wexnqC5JDwb6AvEB/
	r4HU+/Q2ZJ97zxcNRjUFGbC6ltHRc+Xy1qOhqxBuOjDlDsZ2Llx3jKBmM3Z+Hcd7XFEo31IEHH5XD
	n/7BSX5TEn03A3CaPcdj10pRXBl4Bop7PMEUy2sQhXW5O7jqyBKik3z1rC1cWJ6VZCDbqgygljWs1
	UXWdTtFwg6XkGJ3bxqJKOV18PDg984ikxbC598ZI4SLDTLKtmMGQMBnFiFodgxA3nggYUaPYUhGnR
	5bcv6pPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fb5-0000000E5R0-1Irx;
	Thu, 12 Mar 2026 12:57:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fb1-0000000E5Q8-0nGo;
	Thu, 12 Mar 2026 12:57:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FE4E400CD;
	Thu, 12 Mar 2026 12:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CA1C2BC86;
	Thu, 12 Mar 2026 12:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773320218;
	bh=cJK3mpyT79e9qtgSDmo9xoFCS+6kGW9BW2Ply5mwOwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hcs9nRxfcpQv9i4VUoc9iF/DJrAf6Id276T6HxF/Ib7iBm1MqhkwzZ4IfPqId91sf
	 ZqTwIP18zfG/TDbMGdttgXRsihfieBSg6vZsmvZlImvkzzxOM0cbpwIWcjHdiCXdPv
	 Mnl7ZTawiavyFdyTgK0aGIm/S1C8HO1unx7GoIKoxbDPOCjCfAnvIJuHbvOV4y+If3
	 c/x8YlSrdrUims11yxA5JjlEFzCFR/MJugKWJ+UGBCgaTYfuLSBJJ9FYMWZ9LXsf4k
	 RmzAIPbd77QF9MTrRJ0zFetOCQiNctC2pXXkacBo0ec7YFR0rxvC9WEyHJpYYooXGy
	 eB/ColMjmpvyw==
Date: Thu, 12 Mar 2026 12:56:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 02/17] spi: bcm63xx-hsspi: Use helper function
 devm_clk_get_enabled()
Message-ID: <62a5a878-f88c-4ecf-a0e6-fe5430de16e1@sirena.org.uk>
References: <cover.1773306858.git.xiaopei01@kylinos.cn>
 <9391f0c3a62e698e66a4b6630ae10b329faf3c11.1773306858.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
In-Reply-To: <9391f0c3a62e698e66a4b6630ae10b329faf3c11.1773306858.git.xiaopei01@kylinos.cn>
X-Cookie: I feel better about world problems now!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_055700_346002_277B5785 
X-CRM114-Status: GOOD (  10.56  )
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
Content-Type: multipart/mixed; boundary="===============2971577934686288828=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2971577934686288828==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yl7jQAg1ktMo1H3W"
Content-Disposition: inline


--yl7jQAg1ktMo1H3W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 12, 2026 at 05:28:54PM +0800, Pei Xiao wrote:

> -		ret = clk_prepare_enable(pll_clk);
> -		if (ret)
> -			goto out_disable_clk;
> +		pll_clk = devm_clk_get_enabled(dev, "pll");
> +		if (IS_ERR(pll_clk))
> +			return dev_err_probe(dev, PTR_ERR(pll_clk), "failed
> +					     enable pll clk\n");

It's nice to print an error message but having a line break in the
middle of a string not so much, put the "failed bit on the same line as
the rest of the error.

--yl7jQAg1ktMo1H3W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmyuBQACgkQJNaLcl1U
h9CEzAf/ecvpiU7/HU5Fp3TOFVTXTv8suK734EdILMdPMYzg2XQ5APg0FjZnaDWK
n27vFo4zq7eUDrvGme1Dzv10k/4Cjpw2DrQx/Ahqa3jpKOCHGmSxpijsGaAXLiJx
+LsKIWIOva86JU+2aUnnG2N/OYF8veII4MzVSaJohLty0G5K0iDpFd0LfzMJe3Me
unarWsC/fxwcVKrf6PagZGMg1lH37wpcAC2In9I7FrtGsoZCLS1JOZrLonKf1P7w
l3S+1h6hvY2cZtV5YrpK99SnkNKC6NSRw80K3GIUzkqT6P7RiaCbldAabB4newkT
u2aU/H0zcagXZXr0ZHcpjfYPMZXG6A==
=BmZA
-----END PGP SIGNATURE-----

--yl7jQAg1ktMo1H3W--


--===============2971577934686288828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2971577934686288828==--

