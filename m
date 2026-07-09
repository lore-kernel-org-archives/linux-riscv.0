Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6A3C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 05:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pG25BQvl941z+Ti4csWc+CL/QaQvEr52DccOD8ne+Zo=; b=ndNS+sm3JzIH1n
	Ho2QpegF74+wu6zILEM1+XYcR7quo2Yhd0cJCCd9t/hmuZwA/6YbXB+8tMaVuBD6pZx31OKfVVNS3
	XRrqJvraSXfCA+h541p7W39lIb10vWsQJq0pjDMWsMBxUeEaYkdWRSxoE3KpZlk9VvDl/5EqYoTTx
	JMDAbKwJJiLFL3kL+ZvOdqxy1sknUJcNscaEQarxmDsBm5sT14Q8ERvPM6m0aDeROgEAFmsHSn4g9
	vbirJ3whC+WrrZdTJkdWtKYuHueNUw/VlAnCmPLG5vhBcVCf3OKf9D9ObL8Inu/JjWnb6dI8/jBgc
	GUx/2xkIYMXaISNbX1PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhY4-000000014qi-46Wn;
	Thu, 09 Jul 2026 05:43:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhY3-000000014qP-228n;
	Thu, 09 Jul 2026 05:43:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D98DF40BE4;
	Thu,  9 Jul 2026 05:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CAF51F000E9;
	Thu,  9 Jul 2026 05:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783575826;
	bh=qiRZlu+pN9UCQWPo2SujBtFWkDfJIgfryKRGlCH9SOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BzMErqn7H0tBQWhIwwL6cUV+PjYiwddzfMugre75ZSIDqZBCLeCqXrYojO2boVY6m
	 WEHqDK9+AFssKNWzeZSrEXx6ZE8pGP7XrpR/kzxGx0xXXBHhVlVk05mMLjuZx3AN3q
	 nFwms3UbgAZTz7CoZQfvH1PiOO0qS3P/j07senEZR/5mIK9KDJT3xrUlGAfo+o5Pzk
	 P9PlZ9QqFsr4ZtFXhvfxdyJmNot3XsN9XOSspEw0RmfmQP+oJ0IKP8AK6VLS+VFyh4
	 9hMocZ0tLgRbX3AucUK107XcluYsLU4ZDIC+IANdz7E7zD6WbZ1KA6LiNnn/ZYB3C4
	 F7pcOoylRdyqw==
Date: Thu, 9 Jul 2026 07:43:19 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>, 
	"Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>, Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, 
	Even Xu <even.xu@intel.com>, Xinpeng Sun <xinpeng.sun@intel.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Jiri Kosina <jikos@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Longfang Liu <liulongfang@huawei.com>, Vinod Koul <vkoul@kernel.org>, Lee Jones <lee@kernel.org>, 
	Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
	Sunil Goutham <sgoutham@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>, 
	Maciej Falkowski <maciej.falkowski@linux.intel.com>, Karol Wachowski <karol.wachowski@linux.intel.com>, 
	Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>, 
	Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Will Deacon <will@kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Tian Tao <tiantao6@hisilicon.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Srujana Challa <schalla@marvell.com>, Bharat Bhushan <bbhushan2@marvell.com>, 
	Antoine Tenart <atenart@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Raag Jadav <raag.jadav@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Robert Richter <rric@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Nirmal Patel <nirmal.patel@linux.intel.com>, 
	Kurt Schwemmer <kurt.schwemmer@microsemi.com>, Logan Gunthorpe <logang@deltatee.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tomasz Jeznach <tomasz.jeznach@linux.dev>, Jonathan Cameron <jic23@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Benjamin Tissoires <bentiss@kernel.org>, 
	linux-input@vger.kernel.org, linux-i3c@lists.infradead.org, dmaengine@vger.kernel.org, 
	Philipp Stanner <phasta@kernel.org>, netdev@vger.kernel.org, nic_swsd@realtek.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-cxl@vger.kernel.org, 
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-serial@vger.kernel.org, mhi@lists.linux.dev, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	linux-spi@vger.kernel.org, Jonathan Derrick <jonathan.derrick@linux.dev>, 
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: (subset) [PATCH 0/37] PCI/MSI: Enforce explicit IRQ vector
 management by removing devres auto-free
Message-ID: <vb3ywnzdult3h3bzvh2m6ye5xcuxuzvufcsp4kdos6g2a4q6tn@5ut3kgguaey6>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
 <178357565325.731734.7291964273199898845.b4-ty@b4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <178357565325.731734.7291964273199898845.b4-ty@b4>
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

T24gVGh1LCBKdWwgMDksIDIwMjYgYXQgMDc6NDA6NTNBTSArMDIwMCwgTWFuaXZhbm5hbiBTYWRo
YXNpdmFtIHdyb3RlOgo+IAo+IE9uIE1vbiwgMjMgRmViIDIwMjYgMjM6Mjk6MzkgKzA4MDAsIFNo
YXduIExpbiB3cm90ZToKPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHJlc3NlcyBhIGxvbmctc3Rh
bmRpbmcgZGVzaWduIGlzc3VlIGluIHRoZSBQQ0kvTVNJCj4gPiBzdWJzeXN0ZW0gd2hlcmUgdGhl
IGltcGxpY2l0LCBhdXRvbWF0aWMgbWFuYWdlbWVudCBvZiBJUlEgdmVjdG9ycyBieQo+ID4gdGhl
IGRldnJlcyBmcmFtZXdvcmsgY29uZmxpY3RzIHdpdGggZXhwbGljaXQgZHJpdmVyIGNsZWFudXAs
IGNyZWF0aW5nCj4gPiBhbWJpZ3VpdHkgYW5kIHBvdGVudGlhbCByZXNvdXJjZSBtYW5hZ2VtZW50
IGJ1Z3MuCj4gPiAKPiA+ID09PT0gVGhlIFByb2JsZW06IEltcGxpY2l0IHZzLiBFeHBsaWNpdCBN
YW5hZ2VtZW50ID09PT0KPiA+IEhpc3RvcmljYWxseSwgYHBjaW1fZW5hYmxlX2RldmljZSgpYCBu
b3Qgb25seSBtYW5hZ2VzIHN0YW5kYXJkIFBDSSByZXNvdXJjZXMKPiA+IChCQVJzKSB2aWEgZGV2
cmVzIGJ1dCBhbHNvIGltcGxpY2l0bHkgdHJpZ2dlcnMgYXV0b21hdGljIElSUSB2ZWN0b3IgbWFu
YWdlbWVudAo+ID4gYnkgc2V0dGluZyBhIGZsYWcgdGhhdCByZWdpc3RlcnMgYHBjaW1fbXNpX3Jl
bGVhc2UoKWAgYXMgYSBjbGVhbnVwIGFjdGlvbi4KPiA+IAo+ID4gWy4uLl0KPiAKPiBBcHBsaWVk
LCB0aGFua3MhCj4gCj4gWzEzLzM3XSBidXM6IG1oaTogaG9zdDogUmVwbGFjZSBwY2lfYWxsb2Nf
aXJxX3ZlY3RvcnMoKSB3aXRoIHBjaW1fYWxsb2NfaXJxX3ZlY3RvcnMoKQo+ICAgICAgICAgY29t
bWl0OiAyNTY5OTVlODBmY2QzOWNhYjk0ZWVlODEzNWRkOTBmNmRhNmFjNzQ0Cj4gCgpTb3JyeSwg
dGhpcyBpcyBhIG1pc3Rha2UuIFRoaXMgcGF0Y2ggaXMgbm90IGFwcGxpZWQuCgotIE1hbmkKCi0t
IArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
