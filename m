Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310C2606A339
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GDAtcizP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHhjktSL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g3hTENcRaILdW4w708JdlsaVX7mtKtfOrWWXIauCh2E=; b=GDAtcizPh9vmbwkqDzMtJEg7My
	WMS5gM89HnAFcrx7/kTGcgoGZ1gLVPwsSetvESxCxIcUnoCNn3ULkVR4W6pR/+KhzaGSW1NB9obqn
	8oC6ZZR3+shFg8YIY36c6mxkUJA6LGeLza7h8cBmWE3qwxejuqtu6edWeWy72SECABSiET91fLXQw
	Gy/lJEI2F5eSkmo6JtHf1QXFkMGK9lBXjY89VJfh7YExqF4zNb8OOsKca1xlY/9BEyCTOlD2dJpHz
	tHt43iqnQJMFUs7eqDGQXer1vM809ZRcFK378taoNb5OqRBbPpGOW1p+6suyO0u7EyWgAeLzMFYB6
	1SzdrjCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVxu-00000001eJK-3AqY;
	Mon, 09 Nov 2026 20:27:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVxt-00000001eIm-39Ie;
	Mon, 09 Nov 2026 20:27:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1233C40220;
	Mon,  9 Nov 2026 20:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F871F0089F;
	Mon,  9 Nov 2026 20:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794256060;
	bh=bSSYE7l0m2Lbw/z8BOO6ZEg+OH6DFPR1Glr9kdGiV3o=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=UHhjktSLeWOD/tGVNplwVa0Q7ggxUXoT+CFNoInRKLbMWeiez8pFUyYitGWg6ovNU
	 VOwffa3R/xHzJicPyIc5nq74rMgvFCS0+CtaEV84fcbnBujX62vJwfo7KGlFEirqrC
	 IAsEG2nMr4Cc3tE3AWsRg0FfDIIK64O+rATx34ZmMW/+Hzmym7Wtve4DsDgOe1ctSJ
	 H5tm4RyGfxiUOwpQaBEH8xocAiGmI0UBh0ShCpF+RzgYRY0tdvwITFo7iKgAOqXX7P
	 D5QNIOKBBvk1ACSUXqRuTg2mrrd8qsH5GrTWgM8uSyP1Vxu3oRqfvh/btaNz1wKCDi
	 Iv35oDyaakI8g==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 7722730216A6;
	Mon, 09 Nov 2026 20:27:04 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] spi: sifive: fix division by zero in clock divisor
 calculation
From: Mark Brown <broonie@kernel.org>
To: shao.mingyin@zte.com.cn
Cc: broonie@kernel.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 pjw@kernel.org, samuel.holland@sifive.com, william.zhang@broadcom.com, 
 kursad.oney@broadcom.com, jonas.gorski@gmail.com, 
 bcm-kernel-feedback-list@broadcom.com, anand.gore@broadcom.com, 
 florian.fainelli@broadcom.com, rafal@milecki.pl, 
 linux-arm-kernel@lists.infradead.org, sven@kernel.org, j@jannau.net, 
 neal@gompa.dev, asahi@lists.linux.dev, ryan.wanner@microchip.com, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev
In-Reply-To: <20261106234756882V9wUQNCEZAYUGTAbexMSL@zte.com.cn>
References: 20261106234751020Egf42VCVVlsSC_Msov4HO@zte.com.cn
 <20261106234756882V9wUQNCEZAYUGTAbexMSL@zte.com.cn>
Date: Mon, 09 Nov 2026 20:27:03 +0000
Message-Id: <179425602306.3711751.12136281369535948110.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=763; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5xd3GS5/MG9NcUE+L6KjqXG6YKTxSTMJYectNTsrnko=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+6Ux/lKFcMGP9nyZxi7W/mg7N3VBZbPJdrk1e23q73
 7FDvwwsOkpYGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjARLxOG/4GPfmTnXbhjyrhD
 4H1v0cUCwZ+tBXy7C+346q498LbaepLhx1KmWkOhWQHH7rhFPMsx+LjCJv615P293RUu+zPzzRO
 YAQ==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Clamp the divisor to 1 Hz so the divider calculation is well defined.

> +	/* A device with max_speed_hz == 0 must not divide by zero */
> +	speed_hz = max_t(u32, t->speed_hz, 1);
> +
>  	/* Calculate and program the clock rate */
> -	cr = DIV_ROUND_UP(clk_get_rate(spi->clk) >> 1, t->speed_hz) - 1;
> +	cr = DIV_ROUND_UP(clk_get_rate(spi->clk) >> 1, speed_hz) - 1;
>  	cr &= SIFIVE_SPI_SCKDIV_DIV_MASK;
>  	sifive_spi_write(spi, SIFIVE_SPI_REG_SCKDIV, cr);

If we did genuinely end up with a speed of 1Hz this results in only
dividing by 2, and we then truncate this to 12 bits to fit in the
register which feels a bit risky.  We should probably handle the
overflow if the result doesn't fit in the mask.

-- 
Mark Brown <broonie@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
