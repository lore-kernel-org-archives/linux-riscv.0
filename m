Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92559C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 13:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMSAmVW7z87WjPu+LsoAMRRldCrnYvlt+TUGnL/SLBc=; b=0dC8NnSWKwzuhDyyFJz0GDK2C6
	7vcA3+56T3n0FVEnmA7AGdHAZKLtzIqXiaehc3pGQegc/Q1r4tHrvbd2GKZmdDe+ga6lqJ5OFfbD9
	gZKoZoZtLaPmS8nNJ9FhWUrNNX2EehDOzThCzWKfZPTN43JKHIDhMputRTqlP/iVpocJyrd0YT7VZ
	mED1In5C9t4/V+HdKQFwkYsa0lfziFq7CxXsmp3cAAx90Ex6/qMkZrelhaMcSvg+NMI2RLoYJHAvC
	QX1nS8JQFhRbUpjUSp49uVqaW+WCDAfDix74f78mm3ZQkODdA1keMqKu9UiSO5sh5/GvBQxThrJKZ
	lcZAE+6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LlG-00HWlu-0O;
	Wed, 31 May 2023 13:21:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LlA-00HWkx-2U
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 13:21:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 58B9361CBD;
	Wed, 31 May 2023 13:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8286BC4339B;
	Wed, 31 May 2023 13:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685539263;
	bh=38r927G2inyVMml0LWLz7BZPDRXvg4VePw65RoNKYtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LdZne+qt+TBfcx78L1P/e2jFK0kSzM5OFwvU2lxOWm2TlFradzemowoi00+tmv6y0
	 sWY0vKMfcns0lX4vAY/CH6ckpM41qmMi1xxJxqhdUeryyDNpqMpv5VLXnjTFxKv5YT
	 30pidaxePH2tzlQBSPb4vfBLDSguMgjWY93t7Ya/SLeTzGPsOFra84VCLvf9MR2KbQ
	 vf2dSCmwUct0o7VADfK7uJOVALI/Hv4GXRwP19ty6V6ofqoGe4+N9AN+pZH+WtAalo
	 AsJXlkNLdL/RX27xAB+do3GU73RxNpW897H95tp6qq29koGhTPCIRNZF0s6kd6Xn8P
	 VIb+hnRbwW75g==
Date: Wed, 31 May 2023 14:20:57 +0100
From: Mark Brown <broonie@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Ziv Xu <ziv.xu@starfivetech.com>
Subject: Re: [PATCH v1 2/3] spi: cadence-quadspi: Add clock configuration for
 StarFive JH7110 QSPI
Message-ID: <075db1ba-e15c-4c3c-9430-99c866eca24d@sirena.org.uk>
References: <20230526062529.46747-1-william.qiu@starfivetech.com>
 <20230526062529.46747-3-william.qiu@starfivetech.com>
 <fecc9d6a-022e-49d9-a452-8a63c409ebf3@sirena.org.uk>
 <042c560d-1f36-8e97-3796-7423245592f4@starfivetech.com>
 <86555925-b8dd-29a8-60cd-5c2ff2c1432a@starfivetech.com>
 <eb68722b-bcab-4aa1-aa4e-54bfe95ef414@sirena.org.uk>
 <93ba0b97-45aa-e59d-1454-80c4f245acc0@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <93ba0b97-45aa-e59d-1454-80c4f245acc0@starfivetech.com>
X-Cookie: Will Rogers never met you.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_062104_847782_34CF4B0F 
X-CRM114-Status: GOOD (  17.80  )
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
Content-Type: multipart/mixed; boundary="===============2507376970363130993=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2507376970363130993==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G6ktQj/BvBBSNjYO"
Content-Disposition: inline


--G6ktQj/BvBBSNjYO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 31, 2023 at 02:19:16PM +0800, William Qiu wrote:
> On 2023/5/30 18:33, Mark Brown wrote:

> > You could always specify a different array of clocks depending on which
> > compatible the driver sees, just like you'd conditionally request clocks
> > individually.

> 	If specify a different array of clocks depending on which compatible
> the driver sees, since there will also be clock operations in the suspend
> and resume interfaces, this can make the code look complicated.

If you store the clock count and array in the driver data that should be
fairly simple I think.

> 	as following:

> 	/* Obtain QSPI clock. */
> 	cqspi->num_clks = devm_clk_bulk_get_all(dev, &cqspi->clks);
> 	if (cqspi->num_clks < 0) {
> 		dev_err(dev, "Cannot claim QSPI clock: %u\n", cqspi->num_clks);
> 		return -EINVAL;
> 	}

> 	This way, the code will look simpler and clearer. How do you think
> about it.

I'm not clear how enable and disable would then work?

--G6ktQj/BvBBSNjYO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR3SbkACgkQJNaLcl1U
h9A5YAf6AyXRsEmaDvRUFjWZZNZoMgo2EFDR0Jl7tIiuqYCoBj6JUWnZZBV7bZnq
tVBoRN8pUEPIdzISOFwas3GYdOHZdSMagbeH2d8DZp7Cn7YTBcHKdw4otXRB+4QN
tXJITLg7JSbzgd6gP/wfMp+q9Yyf0q+T9kRsrBTFSYuJmh6yg8CRaHrHmdomTBAB
ZvB/TwoNFJYrvpRIJXUQC3mOviO7eQCVr9z6ZG8iwlzlxym7ZSC/rRbG2MtKlxls
zIaL56Kwe4MQg7LgQejCY+z4ZLUdqpLb9DiVOp9bRspzRuWdRABZsdzahkgEZCbL
C2/G7xzOwRn0cvaF+TipvT73i+QPxA==
=6EZR
-----END PGP SIGNATURE-----

--G6ktQj/BvBBSNjYO--


--===============2507376970363130993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2507376970363130993==--

