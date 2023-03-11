Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96201C61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 12:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIB+te3E/qM2Lng8/5eyHdIOtJ6tN9M80ebZfvzRa6I=; b=JflQKbOhI1RpSvdjBhVGjUIt8M
	xVA+ZPK+2JahSp+nm7/K537EfTDtVBMJ7rubzs5rEmyjQy256EMWbuuWJikoNEGHxusIHWMgHXH3s
	RcmaIYILINZj2KpTIq2cNmjAscsrBD0uroPLkGFjqxDOEdAo7aRPvynG/mviBmOOyrlgWtQlnD1La
	ltOO/aEPTVktVBXI6ThLxeg2M6klR5CFyz9XrE3cAbaTxaN+W9KmiFamst7FAC8wI51mfDdH3R2Xr
	iUHbQA9cacFil0nAO+kTUyGU5DFFRHXIqdRaDyn8av7z8GUI7pgg33GDuiJbZnY3bNlgYabbVaxQK
	BJh28fxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paylt-000XZo-Eh; Sat, 11 Mar 2023 12:56:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paylq-000XYV-4O
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 12:56:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E815A60BC1;
	Sat, 11 Mar 2023 12:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC37EC433EF;
	Sat, 11 Mar 2023 12:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678539378;
	bh=lvN0yuIvnifEoNBiQqRY/KIoJE7i2VIK9/VhGQSkFRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OsTZJ3USu67MOp9ICl94yHSAvIxGgE20hndsrYUxAYHhR5XOMCsSx7e+wUFAaORGx
	 WcQHxz0H/JvdKxrEuYNefRNHFJEFEfXI7q/0jVGF3NAOAOD2FDOsWWNwPBQ4xZpp2j
	 b/mgBnzzTq8+tPA86WxmnFggbTsyButvdF0TY5YX6lbNnVBart+/RVXZNBIPD8uGim
	 pQCNxzNx/O05d4BYAWLa2BqTNRYKTrN5eIzAezAgXLJOg6BR/r/Q8qQQG36P6zjZEl
	 6d+S7hSAsNr27yFSDF43t52g3oHAgMKxqn0YehRmdhZI8VrW/UkBXd14Fj3Of4dr1e
	 bRr6Vg7ccbTQw==
Date: Sat, 11 Mar 2023 12:56:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/21] clk: starfive: Replace SOC_STARFIVE with
 ARCH_STARFIVE
Message-ID: <44332121-08d2-4c6b-82d9-e2705d1639eb@spud>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
 <20230311090733.56918-2-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230311090733.56918-2-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_045622_231103_B0BBE9F4 
X-CRM114-Status: UNSURE (   7.70  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============3335430911205479362=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3335430911205479362==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b0T18N537+LiQ2PN"
Content-Disposition: inline


--b0T18N537+LiQ2PN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--b0T18N537+LiQ2PN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAx6bAAKCRB4tDGHoIJi
0ukVAP9uHTogOnJzTa+CWWg06aCmxrDMMuIyPN7fXOdTwfC5vgD/UUaT54JZyhLs
g65LOiTQi6ajUQ+iynSHbwQPBLMBdQA=
=wSCk
-----END PGP SIGNATURE-----

--b0T18N537+LiQ2PN--


--===============3335430911205479362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3335430911205479362==--

