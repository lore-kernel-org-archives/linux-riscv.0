Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDA1C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 05:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIIBoG2mAcukg2x3QVENrxDRdSuvOEB2mFPpzkTpYJA=; b=rK/Qpr/sVDA9KC
	ARdgdPMVZ9z6RQMJ33DXFta01gPpO2E6Y4PDB2UY8OvCywtO+yjh/m8Y8gP3QZimES1w1XLkRaNwu
	cMmjOwe+n67B3sUfm9Oi4QR8YLiD9uqM90c1100HamNCXOjN0NM+W3Col7CucpdmrhAEnOFZr2Jwu
	NNecx9cu64nYgAV/EX4gf8FmZw+EyfLLECZ1gwvl28z0vpktTuVQwEt7arqYTMPrh8PaOnEHOq9yK
	HNV1MkXxPrEwElBSWBmfpMXj7Qwu+ci8bc6GeoVrJZRUW3uWhcwRD5vNUbTTP1cKDjb+CdrnK7DWQ
	JrTEhlbqkvYvwjjU7ynw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhVh-000000014a1-2XIr;
	Thu, 09 Jul 2026 05:41:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhVf-000000014Zl-3omX;
	Thu, 09 Jul 2026 05:41:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 915A9600C3;
	Thu,  9 Jul 2026 05:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EAE21F000E9;
	Thu,  9 Jul 2026 05:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783575677;
	bh=GUR46VabSVZbPyehLw4syLT30MNmMe+mudnTx0VnTpA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PMF7MIfeOb6sPplAJM3ptwtGVrsjDjcmNM8+KBGIZapvBcxEoEW05Z71w8wT7OiCo
	 DpyTqd8LBQSOVV2LXf12bv3I6Pc0h9ojZxvVDoieC+rI/KlduqQsbmNYRbApokpMUS
	 906x2f5dfccmHGNLaQwrgeNkFJeM+vrwSPjhiXoBgGmr7P/GzXUVoT8b+iN+kTpuYZ
	 3miqhB4alxgUPujwFkL9mVwHxHABNpvGLd+MKygFosR17bCiXd9AFhTno3Tpzpr8G2
	 W04sec2rt03zdANmLtdpyqOtx7Xh3Wl/PfkGMSLLD5Y/7X7CmPps6HOirGFsnoRUm/
	 YRXFW3BE6RuOQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 "Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>, 
 Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, 
 Even Xu <even.xu@intel.com>, Xinpeng Sun <xinpeng.sun@intel.com>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Jiri Kosina <jikos@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Zhou Wang <wangzhou1@hisilicon.com>, Longfang Liu <liulongfang@huawei.com>, 
 Vinod Koul <vkoul@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
 Sunil Goutham <sgoutham@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S . Miller" <davem@davemloft.net>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>, 
 Maciej Falkowski <maciej.falkowski@linux.intel.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, 
 Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>, 
 Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, Will Deacon <will@kernel.org>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Davidlohr Bueso <dave@stgolabs.net>, Srujana Challa <schalla@marvell.com>, 
 Bharat Bhushan <bbhushan2@marvell.com>, Antoine Tenart <atenart@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Raag Jadav <raag.jadav@intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Robert Richter <rric@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Nirmal Patel <nirmal.patel@linux.intel.com>, 
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>, 
 Logan Gunthorpe <logang@deltatee.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, 
 Tomasz Jeznach <tomasz.jeznach@linux.dev>, 
 Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Shawn Lin <shawn.lin@rock-chips.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Benjamin Tissoires <bentiss@kernel.org>, 
 linux-input@vger.kernel.org, linux-i3c@lists.infradead.org, 
 dmaengine@vger.kernel.org, Philipp Stanner <phasta@kernel.org>, 
 netdev@vger.kernel.org, nic_swsd@realtek.com, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, 
 iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-cxl@vger.kernel.org, linux-crypto@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, 
 mhi@lists.linux.dev, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 linux-spi@vger.kernel.org, Jonathan Derrick <jonathan.derrick@linux.dev>, 
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 linux-mmc@vger.kernel.org
In-Reply-To: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
Subject: Re: (subset) [PATCH 0/37] PCI/MSI: Enforce explicit IRQ vector
 management by removing devres auto-free
Message-Id: <178357565325.731734.7291964273199898845.b4-ty@b4>
Date: Thu, 09 Jul 2026 07:40:53 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.2
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIE1vbiwgMjMgRmViIDIwMjYgMjM6Mjk6MzkgKzA4MDAsIFNoYXduIExpbiB3cm90ZToKPiBU
aGlzIHBhdGNoIHNlcmllcyBhZGRyZXNzZXMgYSBsb25nLXN0YW5kaW5nIGRlc2lnbiBpc3N1ZSBp
biB0aGUgUENJL01TSQo+IHN1YnN5c3RlbSB3aGVyZSB0aGUgaW1wbGljaXQsIGF1dG9tYXRpYyBt
YW5hZ2VtZW50IG9mIElSUSB2ZWN0b3JzIGJ5Cj4gdGhlIGRldnJlcyBmcmFtZXdvcmsgY29uZmxp
Y3RzIHdpdGggZXhwbGljaXQgZHJpdmVyIGNsZWFudXAsIGNyZWF0aW5nCj4gYW1iaWd1aXR5IGFu
ZCBwb3RlbnRpYWwgcmVzb3VyY2UgbWFuYWdlbWVudCBidWdzLgo+IAo+ID09PT0gVGhlIFByb2Js
ZW06IEltcGxpY2l0IHZzLiBFeHBsaWNpdCBNYW5hZ2VtZW50ID09PT0KPiBIaXN0b3JpY2FsbHks
IGBwY2ltX2VuYWJsZV9kZXZpY2UoKWAgbm90IG9ubHkgbWFuYWdlcyBzdGFuZGFyZCBQQ0kgcmVz
b3VyY2VzCj4gKEJBUnMpIHZpYSBkZXZyZXMgYnV0IGFsc28gaW1wbGljaXRseSB0cmlnZ2VycyBh
dXRvbWF0aWMgSVJRIHZlY3RvciBtYW5hZ2VtZW50Cj4gYnkgc2V0dGluZyBhIGZsYWcgdGhhdCBy
ZWdpc3RlcnMgYHBjaW1fbXNpX3JlbGVhc2UoKWAgYXMgYSBjbGVhbnVwIGFjdGlvbi4KPiAKPiBb
Li4uXQoKQXBwbGllZCwgdGhhbmtzIQoKWzEzLzM3XSBidXM6IG1oaTogaG9zdDogUmVwbGFjZSBw
Y2lfYWxsb2NfaXJxX3ZlY3RvcnMoKSB3aXRoIHBjaW1fYWxsb2NfaXJxX3ZlY3RvcnMoKQogICAg
ICAgIGNvbW1pdDogMjU2OTk1ZTgwZmNkMzljYWI5NGVlZTgxMzVkZDkwZjZkYTZhYzc0NAoKQmVz
dCByZWdhcmRzLAotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCu
v+CuteCuruCvjQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
