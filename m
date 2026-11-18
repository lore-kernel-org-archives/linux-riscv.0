Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135CB606A331
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 07:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YX+Zby87;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lvlw2APD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SSBxAdLn3mdIv7IW/+u/S+Ykpxj3mo9fev4UkG+dOQU=; b=YX+Zby87OmHwpXF48VLYOa3keB
	GUjEsie1LSSqNgE9TIUim2GdfWMiYSSCn16FGqmijxWGGFqLEThXQUBsKXyQsxPuWFrN8rt7QdkHs
	u9/GH530roE0Jw0oWY4prkVqPXp8Wn9tQd558CujTycB2/YVBmRPdzv4KwTzCPUMUdS4GPC0WmNQ+
	q0xq19EMItTlcaxEhWLDBmwJRl24mvEDa6iEaDVWkGYLGGlXH+2KG9srumSD0GiZsHccv35IfoqAJ
	Uiij5WHq9cOWcg5/iwygAPhBug4LOeDKRcFKNgztKL4vTrPma7QwJwVdNOGzXMZKb/AL90AiRJuo+
	huDR7Kqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaKW-000000083Xp-0vJJ;
	Wed, 18 Nov 2026 07:43:44 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaKS-000000083W4-0oJi;
	Wed, 18 Nov 2026 07:43:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5E7754E4160A;
	Wed, 18 Nov 2026 07:43:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1DE395FE9B;
	Wed, 18 Nov 2026 07:43:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77C8D11BC076C;
	Wed, 18 Nov 2026 08:42:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794987811; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5tdOi87MUQVrh0lDnm0y5zaT0nPUT+qlg7v5xkEiqMk=;
	b=lvlw2APDkLOsWdPZXrcTGO0SBvJt5AeVKx0Z42miklOsc8vPctTcjUfLvtwVkHahSrHPLo
	CGkq45BFyuEH8fedQgM6HJ/XMbau2Rz9aKP/PJ7PtvuBj2hMJXvtJKDgvO7p6Q3pjLfN6i
	0Ut1+LTYYEyg77hZo16dxZxUGEgStz4MKBFw9hj/2Tiw4koxWXy5yQ8yIHNJQ0YwvKbt02
	l/18CHS5c8YF9Wb/y9UNTxVZrOZMCPnkOtQCGZPI3/uD2p7Qv4dv6TVs+LHq5iTBVHSMvU
	434h8Tsq1BRLh2Btis1Fush6eJ7xmbr9hxqVcPbs2tV0AeddsTbxh0K8Mz1lOg==
Date: Wed, 18 Nov 2026 08:42:46 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Peng Fan <peng.fan@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Andrew
 Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Ryan Chen
 <ryan_chen@aspeedtech.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Billy Tsai <billy_tsai@aspeedtech.com>, Tan
 Siewert <tan.siewert@9elements.com>, Eddie James <eajames@linux.ibm.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Caleb
 James DeLisle <cjd@cjdns.fr>, Marc Zyngier <maz@kernel.org>, Miodrag Dinic
 <miodrag.dinic@mips.com>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>, Anup Patel <anup@brainfault.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland
 <samuel.holland@sifive.com>, Qin Jian <qinjian@cqplus1.com>, Changhuang
 Liang <changhuang.liang@starfivetech.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Nishanth Menon <nm@ti.com>, Tero Kristo
 <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Michal Simek <michal.simek@amd.com>, Anirudha Sarangi
 <anirudha.sarangi@amd.com>, Tushar Nimkar <tushar.nimkar@amd.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
 linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, git@amd.com, linux-arm-msm@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] irqchip: Convert chained handlers to
 guard_chained_irq()
Message-ID: <20261118084246.5b5bf203@bootlin.com>
In-Reply-To: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
References: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_234340_366937_F726B53F 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgUGVuZywKCk9uIFNhdCwgMTQgTm92IDIwMjYgMjM6MDY6MTUgKzA4MDAKUGVuZyBGYW4gPHBl
bmcuZmFuQGxpbnV4LmRldj4gd3JvdGU6Cgo+IEZyb206IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAu
Y29tPgo+IAo+IFVzZSB0aGUgc2NvcGUtYmFzZWQgZ3VhcmRfY2hhaW5lZF9pcnEoKSBoZWxwZXIg
aW4gYWxsIGNoYWluZWQgaGFuZGxlcnMKPiB1bmRlciBkcml2ZXJzL2lycWNoaXAvIHNvIHRoYXQg
Y2hhaW5lZF9pcnFfZXhpdCgpIGlzIGFsd2F5cyBpbnZva2VkIHdoZW4KPiB0aGUgaGFuZGxlciBy
ZXR1cm5zLiBIYW5kbGVycyB0aGF0IGR1cGxpY2F0ZWQgdGhlIGV4aXQgY2FsbCBvbiBhbiBlcnJv
cgo+IHBhdGggb3IganVtcGVkIHRvIGEgY29tbW9uIGV4aXQgbGFiZWwgc2ltcGx5IHJldHVybiBu
b3cgYW5kIHJlbHkgb24gdGhlCj4gZ3VhcmQuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPgo+IC0tLQoKRm9y
IHRoZSBpcnEtbGFuOTY2eC1vaWMgZHJpdmVyOgoKUmV2aWV3ZWQtYnk6IEhlcnZlIENvZGluYSA8
aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPiAjIGlycS1sYW45NjZ4LW9pYy5jCgpCZXN0IHJlZ2Fy
ZHMsCkhlcnbDqQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
