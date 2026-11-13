Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14952606A33F
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 00:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=It8PlJDu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IjJgmRfT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MThNzNXUy9a/gc5S9m5NKwiFP7HLkGdRe8vsfUcK0QQ=; b=It8PlJDu+X7uEFbsVwpp3DcEhs
	j9Dt9VvXgNfXxlkynQFWkMLQO0xtzCpMAUjJGKrlNbTwuh+5cRfsPE1NvhVKSi98lmZUOwQXq2csM
	kawTdw8zzAutNrOeZKNZpvdlrcES7o/3elszwquQxKe9ISBifOmgTTDrfqz7HIQlX6dn91lMrNJpC
	XzVw5FB6Ssuh1DsacCnIu4BVg2N6Q8aOIv/P+0AebsZsjPXuT5X/KCq2XtV8/ElVVS4LczoS3XJrA
	VgFn67ORrF1ArOlpYZqWEaXngNLxigCbIWJlb23gq96FCKfsouFK1al1Pdv4fm7XvdyhbzsU1eqOP
	X/+kSQjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1cH-0000000EuGZ-1G7D;
	Sat, 14 Nov 2026 00:27:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1cF-0000000EuFj-3Lq9;
	Sat, 14 Nov 2026 00:27:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 428E440278;
	Sat, 14 Nov 2026 00:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C6E1F000C4;
	Sat, 14 Nov 2026 00:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794616055;
	bh=ki/ePS7jWs9uNuv0DOOM5RNpbzB+sOQfsfxY6BGgUp4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IjJgmRfTMn0LDXFga6bVNSny1CE35GU8FBWb1A/nhj+KCs9P2O8qjs5GjDMbPKPqd
	 E/PUv80wtNAHJAVM0RtVz5I1c8MJj6wGZJEWLLHGsbVs2AjKNjWa1Nt0OU//hgiPxZ
	 V0xbkVIh1I1ZYq211qbIU67Dw+l2r7dahoDDKF5OgrzHu93CVDZOsy5lJ9/lIpumJ0
	 babkNoNnfauJTkBURAc3vUfPxzEGwjB7OiBWEzwt00she+ujAkoI3kL3nO/xb9Ue8j
	 e8hU+wOFal6FYl38dONN5BQZVzLdbezqXDNDIhYdqrMX62ASANqLaRdClZsqjIGEZe
	 J5cBJi7CMPQww==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 82FAF329EA01;
	Sat, 14 Nov 2026 00:27:32 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, shao.mingyin@zte.com.cn
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 pjw@kernel.org, samuel.holland@sifive.com, william.zhang@broadcom.com, 
 kursad.oney@broadcom.com, jonas.gorski@gmail.com, 
 bcm-kernel-feedback-list@broadcom.com, anand.gore@broadcom.com, 
 florian.fainelli@broadcom.com, rafal@milecki.pl, 
 linux-arm-kernel@lists.infradead.org, sven@kernel.org, j@jannau.net, 
 neal@gompa.dev, asahi@lists.linux.dev, ryan.wanner@microchip.com, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev
In-Reply-To: <20261110233450305Smji446Uhvoxa7r8SHEgl@zte.com.cn>
References: <20261110233450305Smji446Uhvoxa7r8SHEgl@zte.com.cn>
Subject: Re: [PATCH v2 0/5] spi: fix division by zero with a zero transfer
 speed
Message-Id: <179460764342.448985.18219249061160291658.b4-ty@b4>
Date: Fri, 13 Nov 2026 22:07:23 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2160; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Me9l+RLPg/bosA9FhUgKDZ9QSUrdM0aawNht8FMS9I4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+r3rfUD5D64OkT3ut1F3Pz307/66Nyl0pO2dGUduKv
 MObtK2OdJSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiSkoM/8sc1JMDjoSe9+tg
 WL1+JlPeS5ngTcz2z2+7qO00mFfJJ8PwT81ntu+ddRtNN8hXmmm+e37oV/jxUzYzeJULKuedT7V
 /wAgA
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026 23:34:50 +0800, shao.mingyin@zte.com.cn wrote:
> spi: fix division by zero with a zero transfer speed
> 
> Five SPI controller drivers compute a clock divider from the transfer
> speed without checking that it is non-zero.  A SPI device whose
> max_speed_hz is zero (a DT node without spi-max-frequency, or a device
> created through the spidev sysfs new_device interface without a speed)
> therefore reaches the division with speed_hz == 0.  The SPI core clamps
> such a device to the controller limit only when host->max_speed_hz is
> set, and none of these five drivers sets it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.5

Thanks!

[1/5] spi: sifive: clamp the clock divider to the register range
      https://git.kernel.org/broonie/spi/c/49071cdbecd3
[2/5] spi: bcm63xx-hsspi: fix division by zero for devices without a max speed
      https://git.kernel.org/broonie/spi/c/82ff536b6049
[3/5] spi: bcmbca-hsspi: fix division by zero for devices without a max speed
      https://git.kernel.org/broonie/spi/c/167fe08d3ba5
[4/5] spi: apple: fix division by zero in clock divisor calculation
      https://git.kernel.org/broonie/spi/c/ee22df21fdf4
[5/5] spi: atmel: use the maximum divider for an unspecified speed
      https://git.kernel.org/broonie/spi/c/51953948d6a8

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
