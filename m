Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8377FEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 12:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjTBhj+vB/MkbOUo1SLEIg+NGqpzcy9KN2c0qA7FzYE=; b=huakY9N6Ita/9Ibxv0GJ636WyB
	nsKeRwZaRWr/Lf2QPWEmcTvO85knXP9O66b/+0CUbm6WuydsvEy6/tFJyF++6UQPrQKiefw29her2
	QozYV1sLtkhRlFKp5p2kbGBaEmQhqKYDnckDdhwFEiWHIPK0JHX1N72f4jsj80WqHGpTFGJrSs4Ms
	Uw6CCEGwC8dv+q/ZhycfOz0GYCXFpTC4YOJNJU+jmdwYQBDJ0A+DSrIbgSNRVf6wbqA2ku/vJi9Me
	F5DobSB0TxQPVkqLv7LHttO2aqlEIxV5GEc2/B+csuumxJCrQs5eUYTh+7+ZwR6WgpiAZfWeOPUwG
	KMP/DF6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvQs-003F8G-04;
	Thu, 13 Jul 2023 12:28:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvQp-003F7N-2e
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 12:28:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 79ED7610A6;
	Thu, 13 Jul 2023 12:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4401C433C7;
	Thu, 13 Jul 2023 12:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689251305;
	bh=8f8B420S2iez6Nmhlz8hkDDgDQ2+6nOB0mFrfGPMq6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GX1xK+lkiknPcbIVSTtjKp7sNrQf8Bk5hqaCJYa3bnt+geSrHWjFnoHsrBUKh6ZbC
	 /TK94u7I3SMgGYHawfX9CIMUscmzybc4kBak3nkM102nS9BIQ/o2ey/gBZtnXF1LoY
	 JjlbHjAJZpPuaFOwzopcXiZ7Pf9KLbm8KveUMJlwxbc8p3NdgKu+sIfo6to+qhRBnX
	 UBALvHEtr7eAjNnFUhufEZZsinz2y0SQGaxD+GAts1UQwW5YlI+zdF49VQ5qeR1NMe
	 wNpAzDb/2wkq2gu37qQbiEnzyF3B9u1OSRVN+SUhqFRLfbp1sMaNOiPbVxD5GzuIP3
	 PNcRlVksAXw1A==
Date: Thu, 13 Jul 2023 13:28:20 +0100
From: Mark Brown <broonie@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: spi: constrain minItems of clocks
 and clock-names
Message-ID: <c5ad1e1c-58f4-4833-b9c7-8876c1a0dc27@sirena.org.uk>
References: <20230713090015.127541-1-william.qiu@starfivetech.com>
 <20230713090015.127541-3-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230713090015.127541-3-william.qiu@starfivetech.com>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_052827_917587_E5409736 
X-CRM114-Status: GOOD (  11.84  )
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
Content-Type: multipart/mixed; boundary="===============7404909929117131995=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7404909929117131995==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NdTpCj8USvWVeToK"
Content-Disposition: inline


--NdTpCj8USvWVeToK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 13, 2023 at 05:00:14PM +0800, William Qiu wrote:

> The SPI controller only need apb_pclk clock to work properly on JH7110 SoC,
> so there add minItems whose value is equal to 1. Other platforms do not
> have this constraint.

Presumably this means that this is some variant of the usual pl022 IP,
or that the clock is in fact present but is not modelled in your DT?

--NdTpCj8USvWVeToK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSv7eMACgkQJNaLcl1U
h9A7eAf/USoycBJ8F/DS9P8f6DPSfiP5R4ajKsnjatuVuVfv7CtwU6QvKsBs+HXu
sAfE7Ig2/LZNZJcmQohmMe5Iu3lcHZLQpbjhLVD25aDsWojcsz2KCg8/wXKoi8xG
jdpYPYlfeS8nwDOKyyOCUti0aTx8wWRB42AFcnv4FQ0E/wTYjI23wyreGcjZDbwb
+2i4KkIBIAfJmes1pBxZ9VTUgbj/1NFeeotZCK1kfMog5dffc5bNCwna2ZmwlVUd
Zn3M2C7p2SlSytkklg4UBSaKF/hLj9FxVSwMEj3zNW3ueQ0go69khO3NdsFRPGV+
81J//IT4oLSxCrgbu0t5913MDarLIQ==
=fvSe
-----END PGP SIGNATURE-----

--NdTpCj8USvWVeToK--


--===============7404909929117131995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7404909929117131995==--

