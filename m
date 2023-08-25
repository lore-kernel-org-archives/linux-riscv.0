Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFC7C3DA6F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 15:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLfV66pB4SWLwnKhba78VzpjABZKG67goE1V8kdL+aE=; b=VvtLjuqq25YrNo6N7kFe687ut+
	qGBNL2Y7ZYlS04EczWpRZioOi03G8SfIVsBPrL6QYtBOk9Uf8vcWLIplUE906CvsA1Yer7pam9WYZ
	yIL1wh/cG6LVUm/swDrJD1SsjoN+ODxWUO1ExlS5pWujBgTrQtuvRtXacJq8o+2pK2DGbNWP328H0
	5ddohPcxhYoAu4CalWs+zR8p1BlYd4rXV96iCOd91DMacLxWkJ1rODLe5aXF4fZmVXLn7Y3Ru0sTM
	eIWqis/mV+ZtdI9tZApbpAwpmwf66vuSntJBt8iF3nzsqfEX6uBkXEWhgseMDTUi/B9NJtRur3j/T
	RBP7yCRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZYOG-005e8D-1u;
	Fri, 25 Aug 2023 15:06:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZYOD-005e7F-0v
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 15:06:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CBEBB644DA;
	Fri, 25 Aug 2023 15:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68185C433C7;
	Fri, 25 Aug 2023 15:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692975980;
	bh=Ih/unC5mMCx0JKXD/w7LDAy5yURqSrSqENwjWGzF/uU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U3D3xXWdL3aN3ZNRmG8w4Fh9U/tF6GOzUrF54Ie0lYeuD8w5lgdEY0yLNCTRA875O
	 P91s0EIswGDNhohzkXL/rolyPFEX3Zdb5QyFfBaTOheMmZcUqhiuk/nT5Cl4Und65Z
	 gSZz1H/6rC87Zxghj6HLSgkp7u8rhOvOlAps7uGkGM0GlCVzlFwxqWhSLzH6AQdMxr
	 X1T+LjJsNkvs//VIzsgiadWmIzW6IfBNPx4SpmUFTPGGlqrOacWwz3gu4QWjMp672X
	 OWbgaAw/HTUtx7d9CLxnF4FB4Dl8XuB1ABjJlN5pi86Js7tQWBGMcZZ02OqRf5YuoY
	 ZEaK4WJ/fX0hw==
Date: Fri, 25 Aug 2023 16:06:12 +0100
From: Conor Dooley <conor@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [RFC v4 0/4] StarFive's Pulse Width Modulation driver support
Message-ID: <20230825-exclusion-doing-93532be4fa97@spud>
References: <20230825081328.204442-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230825081328.204442-1-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_080621_371330_23093F09 
X-CRM114-Status: GOOD (  17.36  )
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
Content-Type: multipart/mixed; boundary="===============4682953596635450423=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4682953596635450423==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M9eiGjMF7i2kmpUJ"
Content-Disposition: inline


--M9eiGjMF7i2kmpUJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 04:13:24PM +0800, William Qiu wrote:
> Hi,
>=20
> This patchset adds initial rudimentary support for the StarFive
> Pulse Width Modulation controller driver. And this driver will
> be used in StarFive's VisionFive 2 board.The first patch add
> Documentations for the device and Patch 2 adds device probe for
> the module.
>=20
> Changes v3->v4:
> - Rebased to v6.5rc7.
> - Sorted the header files in alphabetic order.
> - Changed iowrite32() to writel().
> - Added a way to turn off.
> - Moified polarity inversion implementation.
> - Added 7100 support.
> - Added dts patches.
> - Used the various helpers in linux/math.h.
> - Corrected formatting problems.
> - Renamed dtbinding  to 'starfive,jh7100-pwm.yaml'.
> - Dropped the redundant code.
>=20
> Changes v2->v3:
> - Fixed some formatting issues.
>=20
> Changes v1->v2:
> - Renamed the dt-binding 'pwm-starfive.yaml' to 'starfive,jh7110-pwm.yaml=
'.
> - Dropped the compatible's Items.
> - Dropped the unuse defines.
> - Modified the code to follow the Linux coding style.
> - Changed return value to dev_err_probe.
> - Dropped the unnecessary local variable.
>=20
> The patch series is based on v6.5rc7.

Out of curiosity, why is this series still an RFC?

--M9eiGjMF7i2kmpUJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOjDZAAKCRB4tDGHoIJi
0hpMAQCVxJxrRd/qnUytncJTEZTkZhBNWpfnTFJiTWosLONwagEA1gWFXmEkUG4p
P717RLD26fgyVmB/czA/nZe4Y6jfIwk=
=QcUj
-----END PGP SIGNATURE-----

--M9eiGjMF7i2kmpUJ--


--===============4682953596635450423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4682953596635450423==--

