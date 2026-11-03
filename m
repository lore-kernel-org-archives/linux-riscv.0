Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3C2606A329
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 21:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ashPVrwM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cCVZ7byn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TuYEK70Zo3l2uw9oRWZcCzLG67sr0bqFJNADqXeQoFM=; b=ashPVrwMtjZoODymZ9xsFAMyPx
	pmrnoizKz1K5D9rG5mMkh4oIiWowFKZAmmK9fRAyrerJ8h46E9dtRvWqF3cEozhBlBx5xc80R9+KZ
	KyTChPRzlhkD1c1/N8bnI9wTgbzdA9iQKFVHWBllewOoXkNJZyQZIwR5lrh4yL4x/eIgQjNC3062I
	TEmhI2vI1drOh/DlJCBxeccGNCdR36mF93U+R7cnAQ+ONAcEAEhNs9fIu7K8eSJ+iKtrv6EB/8WTo
	cF8CEVPDrwnU6GkbnGMVhjh5mxPGt341xEU521OOpSdehMskrZD+LrzT2YgXAT5H8Kga9nbIGzuG6
	U1F6AsUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMPO-00000003mRy-3txx;
	Tue, 03 Nov 2026 21:51:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMPN-00000003mRb-1K2n
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 21:51:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E662941780;
	Tue,  3 Nov 2026 21:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CEB1F000C1;
	Tue,  3 Nov 2026 21:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793742668;
	bh=oOCoaiK3lYihVTC9GyN2XUTEBjCafrbhOuJwc41mfmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cCVZ7bynNP49y5CRY1U6qLmhOUeASHX0lfyepfHaKMdwDIbD9+o1j2BZNA0POwLsQ
	 kWCPxpNZft69FTpVspbqNjnY1neNZEfA5ohb7cP0Jd9N4xgOBuGc3RTgIIOB4U8tYx
	 0Tv3oKtoKiyAIhMTetCH+PsCizTeRk0MFgbflBfcw4CBLUqqPiplHacHQIGcZwZw5B
	 TkNJFzzQbzLNxrI6HaU9F0K6h/xRKkufbLMwWa05VxeAQlwoC+6Ty0lQJXn+aS5i8F
	 6gebeDMWI0EcPvc/PyJe+jIZOc16tCFVvBnVsqrBAhYKyP/De8Bn9iZF64UFrpw5HQ
	 DAZ6ZI0NG8s+g==
Date: Tue, 3 Nov 2026 21:51:03 +0000
From: Conor Dooley <conor@kernel.org>
To: aleksa.paunovic@htecgroup.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Inochi Amaoto <inochiama@outlook.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v2 7/8] riscv: dts: gf: Initial support for the P8700
 Boston board
Message-ID: <20261103-paralysis-unshaved-f4881b1e5f14@spud>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
 <20261103-p8700-dts-v2-7-3ac5d49f2c37@htecgroup.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261103-p8700-dts-v2-7-3ac5d49f2c37@htecgroup.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0321468779480227878=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0321468779480227878==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0iSalawA4TywXS7d"
Content-Disposition: inline

--0iSalawA4TywXS7d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +			compatible = "gf,mips-p8700", "riscv";

> +			compatible = "gf,mips-p8700-aplic", "riscv,aplic";

> +			compatible = "gf,mips-p8700-aclint-mswi";

> +			compatible = "gf,mips-p8700-aclint-mtimer";

> +			compatible = "gf,mips-p8700-aplic", "riscv,aplic";

> +			compatible = "mips,p8700-aclint-sswi";

ngl, it'd look less stupid if you just called the whole thing
mips,p8700-foo...


--0iSalawA4TywXS7d
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaupXRwAKCRB4tDGHoIJi
0oKmAP9aysi9V1FiJAIfteQt8MnEEzKF8RPskRuE1kR1e/wiEgEA4vCGnAoPhGWK
QJ7nCDgpNO2aGTl3HKw9iY6bkFodTA0=
=lZdu
-----END PGP SIGNATURE-----

--0iSalawA4TywXS7d--


--===============0321468779480227878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0321468779480227878==--

