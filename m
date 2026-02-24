Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB40EFB7E4
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 02:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZ0ibywABIiZcTTvGPFljEIGv42//BSTmgFOOi7Ehgk=; b=sU1Syk6nQEtGNreKsBzuYJNscL
	Ho2LyFz5WeQChNnd9rluFwDF39hUyb0sMrumRwGXWxpIwsLlsEZWtjg037uGpmLjiokljDB+11GWN
	h5Z7FXNIJx8bRfKDW6xuPQllISURhmb3ASq84AEEOnFwrMRHYC7NAMvgYgjn+MgPlbJbOy6o1Q8Ea
	h43H40s9GcObOtgquWA+6nFnSs/OLAvTR7zs/YP958NXrrP+eCfAsjTZ3tgkBqDmRle53ecL7VbY7
	Q34h4rciEJRPLaHk9+TK20qAs1CtFKqYGCrvl55zVIxd8m3CMwC14AwEXBFY/B9WavnBPr279wKHa
	//4jSUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhrK-00000001Kwy-25xz;
	Tue, 24 Feb 2026 02:09:10 +0000
Received: from mail-m49241.qiye.163.com ([45.254.49.241])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhrH-00000001Kvn-3VMI;
	Tue, 24 Feb 2026 02:09:09 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 34bd86f1b;
	Tue, 24 Feb 2026 10:08:59 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, Bjorn Helgaas <bhelgaas@google.com>,
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
 Mika Westerberg <westeri@kernel.org>, Tomasz Jeznach
 <tjeznach@rivosinc.com>, Will Deacon <will@kernel.org>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Srujana Challa <schalla@marvell.com>, Bharat Bhushan
 <bbhushan2@marvell.com>, Antoine Tenart <atenart@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Raag Jadav <raag.jadav@intel.com>,
 Hans de Goede <hansg@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Robert Richter <rric@kernel.org>,
 Mark Brown <broonie@kernel.org>, Nirmal Patel
 <nirmal.patel@linux.intel.com>, Kurt Schwemmer
 <kurt.schwemmer@microsemi.com>, Logan Gunthorpe <logang@deltatee.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Benjamin Tissoires <bentiss@kernel.org>,
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
Subject: Re: [PATCH 01/37] PCI/MSI: Add Devres managed IRQ vectors allocation
To: Jakub Kicinski <kuba@kernel.org>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
 <1771860581-82092-2-git-send-email-shawn.lin@rock-chips.com>
 <20260223160402.3ad8f079@kernel.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <ec226aa1-5cc8-855f-8f90-1d7f89efe766@rock-chips.com>
Date: Tue, 24 Feb 2026 10:08:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20260223160402.3ad8f079@kernel.org>
X-HM-Tid: 0a9c8d68279109cckunm6766673b9bec2a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ09CQ1YYTU4fGk8fHk9CSE1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEtKTE
	tVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=I2JxoTtVS0Yy5g50bgv4Wil//q2f9q9dCHuXovK/5LdNvBScPX9QRZNqNln/2pGvmbHOVQSNiAizH26Ay9wuN1CW4yf959RsxwxZnY1zkzGm1f2heNBE5Aht1ygGExZDhYnxUaCH2lYQFIRzQh1Ji7cYGdQWjF/HKhpMW2zjyIY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=VXxBr7dg17LQLBnY9v36F+7EuLqaMgXXNtGWjPOgYcA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_180908_095272_0CB33D8A 
X-CRM114-Status: GOOD (  12.26  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

1NogMjAyNi8wMi8yNCDQx8batv4gODowNCwgSmFrdWIgS2ljaW5za2kg0LS1wDoKPiBPbiBNb24s
IDIzIEZlYiAyMDI2IDIzOjI5OjQwICswODAwIFNoYXduIExpbiB3cm90ZToKPj4gcGNpbV9hbGxv
Y19pcnFfdmVjdG9ycygpIGFuZCBwY2ltX2FsbG9jX2lycV92ZWN0b3JzX2FmZmluaXR5KCkgYXJl
IGNyZWF0ZWQgZm9yCj4+IHBjaSBkZXZpY2UgZHJpdmVycyB3aGljaCByZWx5IG9uIHRoZSBkZXZy
ZXMgbWFjaGluZXJ5IHRvIGhlbHAgY2xlYW51cCB0aGUgSVJRCj4+IHZlY3RvcnMuCj4gCj4gSWYg
eW91IGNhbiBwbGVhc2UgYWRkIHRoaXMgQVBJIHdpdGgganVzdCBhIGZldyB1c2VycywgYW5kIHRo
ZW4gY29udmVydAo+IHJlbWFpbmluZyB1c2VycyB2aWEgdGhlIHN1YnN5c3RlbSB0cmVlcyBpbiB0
aGUgbmV4dCBjeWNsZS4KPiBUaGVyZSdzIG5vIG5lZWQgdG8gcmlzayB3YXN0aW5nIG1haW50YWlu
ZXIgdGltZSBvbiBjb25mbGljdHMgd2l0aAo+IGNvbnZlcnNpb25zIGxpa2UgdGhpcy4KClRoYW5r
cyBmb3IgdGhlIHN1Z2dlc3Rpb24sIEpha3ViLiBJIGhhdmUgbGl0dGxlIGV4cGVyaWVuY2Ugd2l0
aCAKY3Jvc3Mtc3Vic3lzdGVtIGNsZWFudXBzIGxpa2UgdGhpcywgc28geW91ciBzdWdnZXN0aW9u
IGlzIHZlcnkgaGVscGZ1bC4KCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
