Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10FDF483E9
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 19:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzqM31+8QD8xBE1+omv4OlFYzFjspsg3gag0rbFjSHo=; b=wR/KcWk+thBJ5IZMGtM8SPCHyi
	AqQIiRaBOOUB8ZNjR9DZ40Odh3ArIbw34yOoJcKfMviZaQR96STUFbnyhU8c1U53CwEatWBx+bb41
	EzaPtY8GJTvTU6Gm2Ebrp6OeGcxy3UnCkTat8YiCBQqrmr6kwd8HjuLh6IUPzDUKvDGaV0fYtT7Wc
	lZaO9PnPaTtnb+0HSBi9+mDZPaYOMBWqV1qv003S/t6SnEl2J1g0r+lfpKZkrFQRLIh6UQEFwUgfL
	ttfzUAtNARo0R4X8oW4Z/pDeirRyygIqzn+WEtiqjREF33qJrxvRJwkhCPJDP3oBJi4oOsUJULhSm
	6g8CzeoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4l6Z-0000000HSiP-09Vs;
	Mon, 23 Mar 2026 19:38:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4l6W-0000000HShR-41Pf;
	Mon, 23 Mar 2026 19:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 03371600AC;
	Mon, 23 Mar 2026 19:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41690C4CEF7;
	Mon, 23 Mar 2026 19:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774294703;
	bh=5k6RSNwFusFVmg2TpsnMUo8NPMVbTpvmOvUTn4lfv6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LtJx5vZfItLXOoIv2kga5F9i7wz0o5NywLE0+aLhO1E55t5TMkI96NfBNZqc2jVMT
	 BtaNr0OoOktPplwFPUh+RCSqIaPfslO9L8IAwy7GDP0+QfvcRxfqLH/uIWcQuC6e6S
	 Z2A9rSl+fzdsa7anp1tkHBvZbZffUYam1mpGfkRocvxS0/M/7Qz7vzp5Jg1/2lVXmk
	 OwLm3fK2uBcTOBtVttDuk1m48jDAVgGwiS8CIB8XckUs7UTUrLFXLTraiH9RDyToIQ
	 az62ZiAVR5GvkqmLd91uCnhHazvUkL9SIxG/vfvGnJiEZSuSrZsU1r6ieaoTfJRda0
	 zzkw+HQMQjEng==
Date: Mon, 23 Mar 2026 19:38:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com,
	amelie.delaunay@foss.st.com
Subject: Re: [PATCH v5 01/17] spi: axiado: Simplify clock management with
 devm_clk_get_enabled()
Message-ID: <8f92f6e7-93aa-48ab-a183-fe8167dcc517@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <52f7e0ebd2f0ece71929384444e1ae87506e5e2d.1773885292.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
In-Reply-To: <52f7e0ebd2f0ece71929384444e1ae87506e5e2d.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: The only perfect science is hind-sight.
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
Content-Type: multipart/mixed; boundary="===============8792887949022821488=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8792887949022821488==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+c7wJ7ToAUTqzySb"
Content-Disposition: inline


--+c7wJ7ToAUTqzySb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 10:03:57AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for both the "pclk" and "ref" clocks. This
> reduces boilerplate code and error handling, as the managed API
> automatically disables the clocks when the device is removed or if
> probe fails.

This driver is doing runtime management of the clocks via runtime
suspend/resume so this isn't appropriate.

--+c7wJ7ToAUTqzySb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBlqgACgkQJNaLcl1U
h9DQmgf/Rv6RyzoxQRCgDOKHviEvFcZSxzzhE8666qZ63KWQcYY+YwTNXJbCpu6F
x0bKK7lGdLtMfa+xckYnQ63Jyzkzal9euoPa283BzzUg4Jzn4vYiz/DevoIRnjgd
skGPBRrD6X/YBuQs7VWlEFxzPi+IyLX17BEviHKisdvJGLoghJxg7udRD4pucCJF
JStuti+iUJaDCcn+qINXcM+B2fmYF15OoRQyMgxOX+1QNqDRED/d5HEoEw+2kLJE
XUlbGguhFItn5fOcHck/JTNgrf5Q4RWHAZI2Zfb1TjQW3+tvCPYn1Z2pjhO6v/EQ
AwiQilSo5Bf7ZptfuMjShkHlrn+DFw==
=DDAD
-----END PGP SIGNATURE-----

--+c7wJ7ToAUTqzySb--


--===============8792887949022821488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8792887949022821488==--

