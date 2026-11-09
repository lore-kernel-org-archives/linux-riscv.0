Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F121606A321
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S9tOR1I/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A8FIBdKP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iVIfbjJS4evP0oOlDui/oI6oWtFhKQmtvhNz730sT/o=; b=S9tOR1I/byPUBxOywY4kQxDnWm
	FDNOzgt+lhDaAJVXqs+hKz6gsRDB9Vk24csm2am6DPRnEUSbiioPMgiYznbVRNHsSaUzmY0VhsFsU
	oZBSSKdWySW6/raZNuAelPZ78lxWqco7iIiaIFBvUUMD+c7DrDY92Q3el60x8YMdbnzj/gM8k0WCP
	fRQRJy9PFqVtP089mTf5kX0x0dhiqW7kDAcxwTV4gt3ghbhrKbv4mq2io6fW+90M4BKl0ExhhoVL5
	+NXU8Awp8czrGip1L2/ClU+vRkXzJLtqW7KJJM/i1LXvmppx8+CR88BA17tEmpCavX3gNVWaeMtws
	tKRtvzFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVy5-00000001eNI-4A7c;
	Mon, 09 Nov 2026 20:27:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVy2-00000001eLu-28Zh;
	Mon, 09 Nov 2026 20:27:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 007DE42B6D;
	Mon,  9 Nov 2026 20:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7830A1F008A1;
	Mon,  9 Nov 2026 20:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794256069;
	bh=uSmqEwTPBCw7yv/vu+RoTvS1k78wUQRDkeFSllXkLKI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=A8FIBdKPcoGsNZlhGhiZxSuNdfssvT5PPZ6PrGGJaBdnGlh1o1Uoc3D7idyPnLDiT
	 opYuDkhI6iTo2Dkz+j/2fqI0v2JoKsTponThIl770h6qo0JswzOFpuPxvcoISfhMLO
	 96j3RJ4LE5aydnXA6E3B6PD9yMVvYhuO+YDa7DOayKR1+meLwulbZPWOyrGw/Zy9XR
	 15iPrvzzJn0jCEPLUw84HtOy53ejShG6QX23kJRYzSx+whednhH04vvje3HVr3t+Dm
	 nW4yxHSm4PYTVRKI2m50h9lbf4d2syeJKmb9gnxqIi/Ac3TCjiT0EH0AYw5cSRm0nW
	 MzROyVWkrB9Sw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 7B1B130216A7;
	Mon, 09 Nov 2026 20:27:04 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 5/5] spi: atmel: fix division by zero when transfer
 speed is zero
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
In-Reply-To: <20261106234803459Z94udUX-Ai29-OfBFRND6@zte.com.cn>
References: 20261106234751020Egf42VCVVlsSC_Msov4HO@zte.com.cn
 <20261106234803459Z94udUX-Ai29-OfBFRND6@zte.com.cn>
Date: Mon, 09 Nov 2026 20:27:03 +0000
Message-Id: <179425602307.3711751.7845465463671042950.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=913; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5Ht5M+VjLA+M4Oeg4Wh7v9V7rBg4ioA0/PuJ6uvdihU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+6cwo4GpdvnHDs+b2EqXGWWmFbOv3bLGv27Gy+iRXw
 +xl6+0CO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjAR/XKG/+mKh+SPln9/OHVZ
 iTCL3Tnj7mVTVhZfq9utt/jr8s0KtXMY/udUHd3KsWHVo+SciZ4KfYlxvJ7TO/hbzxa9OPSEs/v
 IY04A
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

> atmel_spi_one_transfer() calls atmel_spi_set_xfer_speed() for every
> transfer.  A device whose max_speed_hz is zero (no spi-max-frequency
> property, or created through the spidev sysfs new_device interface
> without a speed) leaves the transfer speed at zero, and the divider
> calculation divides by it.  spi_setup() would only clamp the speed if
> host->max_speed_hz was set, which this driver does not do.

...

> Clamp the divisor to 1 Hz so the zero never reaches the division.

> -	scbr = DIV_ROUND_UP(bus_hz, xfer->speed_hz);
> +	scbr = DIV_ROUND_UP(bus_hz, max_t(u32, xfer->speed_hz, 1));

This has a similar issue with limiting, in this case even worse as we
generate an invalid SCBR value and then validate it later in the
function.  We should just set the maximum instead of bothering with the
division if we're subsituting a default here.

-- 
Mark Brown <broonie@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
