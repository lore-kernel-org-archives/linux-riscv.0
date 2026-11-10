Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DCA60A2633
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 16:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XGGyIjVg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cc341CzK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5hToDlksZRkb9TAgTgyyryBp0EhPpkDm7DlqtM0NsqY=; b=XGGyIjVgi1hIGVmfIZiRmtU1hH
	hdk6KlsODn9EJPKjoUcibh9fNG3XJKegrdbKYIXZvQ8gG5HafXey6t3Ra0R5HnJZzJVj4OqEIAvgc
	F/KDFghLtwPP4hRi4pNUHHuuFaDmd7fpdqOmWCTU4nOJ2q7RnrNsrBURE+h+WUnqzNjbraWXvEFv9
	LayL5jlNi1fwR+v4qtfOIVhSi8tZCdCaHq8agJ1N/TG+GBI2XxziGy22MCaQ/jWxnniAT7FfJq4zf
	tELuS2LluLkq6VoyzdFf84cJXYngQh3Y2LamqYW5rI1EljdYfiSfaLpzzkid4kRuz4imy1i9eqKYH
	FRIjnJlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoUQ-00000004Uub-1T6u;
	Tue, 10 Nov 2026 16:14:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoUO-00000004Uu8-3ZpV;
	Tue, 10 Nov 2026 16:14:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E78C8636B5;
	Tue, 10 Nov 2026 16:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69301F0089F;
	Tue, 10 Nov 2026 16:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794327267;
	bh=VTwH4AZAnTqvqVIKDfDqEJbISyn1E7hgr1jsha5Pows=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cc341CzKf3+9oxvcpT7QttZs9OydXOP4Mod0tAIw/DHQljIirxUE+rTD2YpumnkaM
	 jJMGxPixCGODU590DVjqvZ72dFaySeRIVaZ3Micaj2z64YeRIWBkcZdu39xzcJA0QA
	 VVsLfZGsDZt8Ieey7XfftMD0YygqNkWuDNSCIhGC4XRWIPLu3LbQuQTR5XXL/pbIHS
	 qsp0s3OXm/yMxiBMzrTo/vUCbbWJiUFXcnARzEK5HuyVP1fO6rNEfrSI5FYhqRB0kU
	 pYx0vZY0o/K5k8H18HmVh1d+8IEA2KOe91IKoYba3GJ6FecaF6KU1RS4WT9+Dg422w
	 gPa/Xvea5ayJg==
Date: Tue, 10 Nov 2026 16:14:21 +0000
From: Mark Brown <broonie@kernel.org>
To: shao.mingyin@zte.com.cn
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, pjw@kernel.org,
	samuel.holland@sifive.com, william.zhang@broadcom.com,
	kursad.oney@broadcom.com, jonas.gorski@gmail.com,
	bcm-kernel-feedback-list@broadcom.com, anand.gore@broadcom.com,
	florian.fainelli@broadcom.com, rafal@milecki.pl,
	linux-arm-kernel@lists.infradead.org, sven@kernel.org, j@jannau.net,
	neal@gompa.dev, asahi@lists.linux.dev, ryan.wanner@microchip.com,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Subject: Re: [PATCH v2 0/5] spi: fix division by zero with a zero transfer
 speed
Message-ID: <b8b3dd8e-7d66-4d8f-87f8-c88148334ebf@sirena.org.uk>
References: <20261110233450305Smji446Uhvoxa7r8SHEgl@zte.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261110233450305Smji446Uhvoxa7r8SHEgl@zte.com.cn>
X-Cookie: You can't take damsel here now.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1133554893053166755=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============1133554893053166755==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xGHggE/6XmtG49YC"
Content-Disposition: inline


--xGHggE/6XmtG49YC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 10, 2026 at 11:34:50PM +0800, shao.mingyin@zte.com.cn wrote:

>   1/5 spi: sifive: clamp the clock divider to the register range
>   2/5 spi: bcm63xx-hsspi: fix division by zero for devices without a max speed
>   3/5 spi: bcmbca-hsspi: fix division by zero for devices without a max speed
>   4/5 spi: apple: fix division by zero in clock divisor calculation
>   5/5 spi: atmel: use the maximum divider for an unspecified speed

Oh, I see you also sent those v2 patches as part of the series as
normal.

--xGHggE/6XmtG49YC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzQtwACgkQJNaLcl1U
h9DXEwf+Lv/vVmV6mzd36B8u7tH7Xnl2z3sklZVzt/pyPr3Z0ZfatrEJTwsQ7C2P
t+VNfEkdZCLOKALR84LZ0k+GmDZp99DRg4mrpiml1GgGZnpPL9czK5e8o7gacKOW
CTr4UVWZWB6P+C+LmAqpSRXYBzkFpJ1lMLJhTR4SLS6/xVybvmpjgoIJgrW2uSpp
5WRciPMlEsQx0QeFcwgjifHCLt+6S0NC4WZUYxZDTA4xDU5kP3LFGse2J9smh0eo
7tRfwP4T85kQcB48kihqz4Ujpawh0a5tX7tkESJyokEItNuEHoZ08eiMR8RiFx+5
lsljqDlb64q8lH7sAy6dJdBh1e5OIw==
=xMYN
-----END PGP SIGNATURE-----

--xGHggE/6XmtG49YC--


--===============1133554893053166755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1133554893053166755==--

