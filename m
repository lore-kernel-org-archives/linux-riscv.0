Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94C2606A332
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 14:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uXvVqGVi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hrBTatZ9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xf6tdEWKP+SZJMTQBYA3QNN1rddf7WxLU5ZOfOauCqA=; b=uXvVqGVivfVcf2cvQs8f1KDBxZ
	fhCC9nyyh0IQrMwxou3+NIkM89/DQ14Ym05xmtCrhEtzVsKutH0raD7TwrVQq35On1geam3j/XMkG
	G3NL6ky0s51hzJlsz8jnVzMvpfwu4xEQL3UGhxk87I2eSD+4TuhrElV0efJ/w7wu2krDmJWTJNZJ/
	LNCHkI9MsbEBciZOiZGcc9tsnpzrPFv1C7plXblupDDwntWE1cVcl0hHPhjVIUvRfmZGgWH4zs70W
	6p7vuCiRUNmtRzqrNGA6NF7m3O1HN8GD6/PrB41cJvISf9ShbF0Q9QUyR+Uiq0V3yuNAfEUXwc445
	j5OlXamQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSEWz-0000000GFCU-01Xe;
	Sat, 14 Nov 2026 14:15:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSEWw-0000000GFBh-47V2;
	Sat, 14 Nov 2026 14:14:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B161443692;
	Sat, 14 Nov 2026 14:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8881F000C5;
	Sat, 14 Nov 2026 14:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794665698;
	bh=72U7+AqtHKP0x8muIDrhMnmzZwnSsUdy39CDbj4j1GM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hrBTatZ95dSn+bxZPrsTL4b7q7ny265GJboFq0ZXfdCCznkhSrXwtbCSzvaI5lo34
	 iJpLT/GdrqKXmbGC0pVKNVuyhPnp6xyufy8v0hQ+7/fMtqrbKZe2FQCSZe+dA95ysK
	 +goXp1loNQ4dmKmiw6qHIKuJvyWYFzEDc1tLN8IBbsC2Ui0URBJVu5VrHnaEhJLovr
	 JeIeSxe8IhMNxpzEF7RVpzoUgVsEoPXByn0S1C8G3WzBL2V8npovVd/cpas0H04BM0
	 S/tErP7EQPQSCn0Ra8kV8GNaj0KUaawDZhBroLf5Jt1Ps54d4au8PIdtb4MBypyxxC
	 /zWGeifgJ5L7A==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id F3EFF32DAFF3; Sat, 14 Nov 2026 14:14:55 +0000 (GMT)
Date: Sat, 14 Nov 2026 14:14:55 +0000
From: Mark Brown <broonie@kernel.org>
To: shao.mingyin@zte.com.cn
Cc: william.zhang@broadcom.com, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	pjw@kernel.org, samuel.holland@sifive.com, kursad.oney@broadcom.com,
	jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
	anand.gore@broadcom.com, florian.fainelli@broadcom.com,
	rafal@milecki.pl, linux-arm-kernel@lists.infradead.org,
	sven@kernel.org, j@jannau.net, neal@gompa.dev,
	asahi@lists.linux.dev, ryan.wanner@microchip.com,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Subject: Re: [PATCH v2 3/5] spi: bcmbca-hsspi: fix division by zero for
 devices without a max speed
Message-ID: <6a977239-f9fa-4eee-b2b4-944e77026b30@sirena.org.uk>
References: <CAHi4H7FCOxcXnYkNfXNa_iO9KFZRSC96urJthPkgoem7C52ppg@mail.gmail.com>
 <20261114140757347tqYOa2IkTGVulSwLrw2Mf@zte.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261114140757347tqYOa2IkTGVulSwLrw2Mf@zte.com.cn>
X-Cookie: A watched clock never boils.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5819498191330290402=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============5819498191330290402==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZNqZEe0eKx9dEgrH"
Content-Disposition: inline


--ZNqZEe0eKx9dEgrH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 14, 2026 at 02:07:57PM +0800, shao.mingyin@zte.com.cn wrote:

> If you would still like an explicit FCW lower bound in both drivers,
> I can prepare an incremental patch on top of the applied commits.

It might make it clearer that everything is OK.

--ZNqZEe0eKx9dEgrH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavhs2wAKCRAv73Ows9A4
iXsrAQCU0JQox4pMECKuQI7VngVhCYweIy1XfePH/c1L1CUWtgEAjUGgmB2MHEDZ
5uNQOCvE/OVvVSAqED8H7eMtyw8n5Q4=
=eBce
-----END PGP SIGNATURE-----

--ZNqZEe0eKx9dEgrH--


--===============5819498191330290402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5819498191330290402==--

