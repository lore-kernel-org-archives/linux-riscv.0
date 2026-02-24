Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F86CEFB811
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 07:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J13eH7HFLG2eHTeh6V1sSfENxmRi7SkksdO/arGD51w=; b=NKUdAxf9TeWl6M
	khE2yKOHS9clLl6db1IqDiGFQpjJi9qj+yqNbVQSQ1z21wl5ZuCs+Af3YJEz4CD9+SB9TPyEeN7id
	tePrHDIu0wCCH79lJ0aax3HyKXK6LKGiwtqpbVawEW0tJ29MQKlJtxp0KQSm6wK367CvhHPiLoGhS
	RHTDP2Rkg6IkOPJfxJ66+yUwlEnoy/yMNiqIOCFduXoqIl/gSz0h31e0JEVmVMyYoHNJYA3takB3p
	hl9NhzQNe7bQdEKZdI1Yo50SSU33m4mabhQpslqYtoqp7dv80OptMUz6dHfsC2oJzhlDcgCHIoURS
	TGgPuDv1FIeqCGtNjcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vun9E-00000001bCI-2ARJ;
	Tue, 24 Feb 2026 07:48:00 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vun9C-00000001bB2-1jAC;
	Tue, 24 Feb 2026 07:47:59 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fKqZd0j7Gz9vf0;
	Tue, 24 Feb 2026 08:47:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1771919273; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YiLc2etffytjGPdDT50TNZbMLgAeU88xmrhfRIsoAkA=;
	b=LlmbFV5RBp7xLppev4EyLfGR9yk3NSgp4k97/ZE38v/+7SN+fag4e2NPTVd6MywwYB3JoR
	aECvO9Fv8AwXWQahEcQFmBMMy4oTTqbdSF7jsj3F9M1UASa8aCOGylBQ8PbGmnx3sEXV/X
	xDlA0T3Yg9VbnOrGzG3Cu09qiMv5luZknnr33IhnpKKS7SEYP5J27eOqGJ+BMoxD7b2D7e
	Wt4vHbFXLlArdA5ZAkztt7B6Zdjf3OctDzSWL+lDFIhoAe+dqsoo1LXHEJMGvF4BGO1wuN
	FQvXuKvtRw6f680NUsqMBFFFC2kPPw/EMsvBpkdP95ooRBk0Xv0qmfZ7x7GZHA==
Message-ID: <07fc896007d86b731cbfb3cf6bbdf4e5315d7a77.camel@mailbox.org>
Subject: Re: [PATCH 01/37] PCI/MSI: Add Devres managed IRQ vectors allocation
From: Philipp Stanner <phasta@mailbox.org>
To: Shawn Lin <shawn.lin@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, "Vaibhaav Ram T . L"
 <vaibhaavram.tl@microchip.com>, Kumaravel Thiagarajan
 <kumaravel.thiagarajan@microchip.com>, Even Xu <even.xu@intel.com>, Xinpeng
 Sun <xinpeng.sun@intel.com>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Jiri Kosina <jikos@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Zhou Wang
 <wangzhou1@hisilicon.com>, Longfang Liu <liulongfang@huawei.com>, Vinod
 Koul <vkoul@kernel.org>, Lee Jones <lee@kernel.org>, Jijie Shao
 <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, Sunil Goutham
 <sgoutham@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Heiner
 Kallweit <hkallweit1@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,  Karol Wachowski
 <karol.wachowski@linux.intel.com>, Min Ma <mamin506@gmail.com>, Lizhi Hou
 <lizhi.hou@amd.com>,  Andreas Noever <andreas.noever@gmail.com>, Mika
 Westerberg <westeri@kernel.org>, Tomasz Jeznach <tjeznach@rivosinc.com>,
 Will Deacon <will@kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>, Tian
 Tao <tiantao6@hisilicon.com>, Davidlohr Bueso <dave@stgolabs.net>, Jonathan
 Cameron <jonathan.cameron@huawei.com>, Srujana Challa
 <schalla@marvell.com>, Bharat Bhushan <bbhushan2@marvell.com>, Antoine
 Tenart <atenart@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Raag
 Jadav <raag.jadav@intel.com>, Hans de Goede <hansg@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Andy Shevchenko <andy@kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Robert Richter <rric@kernel.org>, Mark Brown <broonie@kernel.org>, Nirmal
 Patel <nirmal.patel@linux.intel.com>, Kurt Schwemmer
 <kurt.schwemmer@microsemi.com>,  Logan Gunthorpe <logang@deltatee.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao
 <bingbu.cao@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-input@vger.kernel.org,  linux-i3c@lists.infradead.org,
 dmaengine@vger.kernel.org, Philipp Stanner <phasta@kernel.org>,
 netdev@vger.kernel.org, nic_swsd@realtek.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-usb@vger.kernel.org, iommu@lists.linux.dev, 
 linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, linux-cxl@vger.kernel.org,
 linux-crypto@vger.kernel.org,  platform-driver-x86@vger.kernel.org,
 linux-serial@vger.kernel.org,  mhi@lists.linux.dev, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Jan Dabros <jsd@semihalf.com>,
 linux-i2c@vger.kernel.org, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, linux-spi@vger.kernel.org, Jonathan Derrick
 <jonathan.derrick@linux.dev>, linux-pci@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org
Date: Tue, 24 Feb 2026 08:47:28 +0100
In-Reply-To: <ec226aa1-5cc8-855f-8f90-1d7f89efe766@rock-chips.com>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
	 <1771860581-82092-2-git-send-email-shawn.lin@rock-chips.com>
	 <20260223160402.3ad8f079@kernel.org>
	 <ec226aa1-5cc8-855f-8f90-1d7f89efe766@rock-chips.com>
MIME-Version: 1.0
X-MBO-RS-ID: e66ae4685546ea4d94e
X-MBO-RS-META: 6frywx3ts6ez4nj3bodhgna5o111q4gn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_234758_592325_A4D92D32 
X-CRM114-Status: GOOD (  17.89  )
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
Reply-To: phasta@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMDI2LTAyLTI0IGF0IDEwOjA4ICswODAwLCBTaGF3biBMaW4gd3JvdGU6Cj4g5Zyo
IDIwMjYvMDIvMjQg5pif5pyf5LqMIDg6MDQsIEpha3ViIEtpY2luc2tpIOWGmemBkzoKPiA+IE9u
IE1vbiwgMjMgRmViIDIwMjYgMjM6Mjk6NDAgKzA4MDAgU2hhd24gTGluIHdyb3RlOgo+ID4gPiBw
Y2ltX2FsbG9jX2lycV92ZWN0b3JzKCkgYW5kIHBjaW1fYWxsb2NfaXJxX3ZlY3RvcnNfYWZmaW5p
dHkoKSBhcmUgY3JlYXRlZCBmb3IKPiA+ID4gcGNpIGRldmljZSBkcml2ZXJzIHdoaWNoIHJlbHkg
b24gdGhlIGRldnJlcyBtYWNoaW5lcnkgdG8gaGVscCBjbGVhbnVwIHRoZSBJUlEKPiA+ID4gdmVj
dG9ycy4KPiA+IAo+ID4gSWYgeW91IGNhbiBwbGVhc2UgYWRkIHRoaXMgQVBJIHdpdGgganVzdCBh
IGZldyB1c2VycywgYW5kIHRoZW4gY29udmVydAo+ID4gcmVtYWluaW5nIHVzZXJzIHZpYSB0aGUg
c3Vic3lzdGVtIHRyZWVzIGluIHRoZSBuZXh0IGN5Y2xlLgo+ID4gVGhlcmUncyBubyBuZWVkIHRv
IHJpc2sgd2FzdGluZyBtYWludGFpbmVyIHRpbWUgb24gY29uZmxpY3RzIHdpdGgKPiA+IGNvbnZl
cnNpb25zIGxpa2UgdGhpcy4KPiAKPiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLCBKYWt1Yi4g
SSBoYXZlIGxpdHRsZSBleHBlcmllbmNlIHdpdGggCj4gY3Jvc3Mtc3Vic3lzdGVtIGNsZWFudXBz
IGxpa2UgdGhpcywgc28geW91ciBzdWdnZXN0aW9uIGlzIHZlcnkgaGVscGZ1bC4KCgpXaGVuIEkg
cmVtb3ZlZCB0aGUgaHlicmlkIG5hdHVyZSBvZiBwY2lfcmVxdWVzdF9yZWdpb24oKSBldCBhbC4s
IEkKY29uY2x1ZGVkIHRoYXQgdGhlcmUgd2VyZSBzbyBmZXcgdXNlcnMgdGhhdCBkb2luZyB0aGVt
IGFsbCBpbiBvbmUgcnVuCndhcyBzdWZmaWNpZW50LgoKRm9yIGxhcmdlciByZXdvcmtzLCBsaWtl
IHJlbW92aW5nIHBjaW1faW9tYXBfdGFibGUoKSwgYSBzbG93ZXIgc3RlcC1ieS0Kc3RlcCBzdHJh
dGVneSBpcyBuZWNlc3NhcnkgZm9yIHRoZSByZWFzb25zIHRoYXQgSmFrdWIgZGV0YWlscy4KCkl0
IGlzIHRoZW4gc21hcnQgdG8gb21pdCBhbiBlYXN5IHRvIHBvcnQgc3Vic3lzdGVtIC8gZHJpdmVy
IGZvciB0aGUKdWx0aW1hdGUgcGF0Y2ggc2VyaWVzIHdoZXJlIG9uZSB0aGVuIHJlbW92ZXMgdGhl
IGh5YnJpZCBiZWhhdmlvciBmcm9tClBDSSBpdHNlbGYsIGFmdGVyIHBvcnRpbmcgdGhlIGxhc3Qg
ZHJpdmVyLgoKSW4gZ2VuZXJhbCwgIGFzIEpha3ViIGRldGFpbHMsIHRob3NlIHN0ZXAtYnktc3Rl
cCBjbGVhbnVwcyBhcmUgYSBiaXQKc2FmZXIsIHNpbmNlIHlvdSBjYW4gcHJvb2YgdmFsaWQgYmVo
YXZpb3IgZWFybHkgb24gYW5kIGluIGNhc2Ugb2YgYW4KZXhwbG9zaW9uIHRoZXkgYXJlIHZlcnkg
ZWFzeSB0byByZXZlcnQuCgoKUC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
