Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C85EFB819
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 08:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlWVD8l323gv0DgHX2cl9J4OZjTNuJEjm4qqwVLp6tE=; b=Cmc3qbf/Vt49HQ
	Hxi114aQmseBPqwhjyWXiSbuDf/Mw8q+615jg1/EWjohpo3R4m+Bsdh+3n76IO4jjM3f4RV38Bmvm
	NXvQpmHZKn3AhhVlEKvs5dq+m52vzSDkm1tt2laHnQKV4Y6uRvtSYXJ5UngLazik6/OKxx8WrWrw4
	V+fyOTnv9k15Kr9lLVNpXthmm4aiB4wiylhlmJNCJJ9WL+Ra+exYgqp8ayP/aoWYb3sfVI2ibd4Lv
	ut16EdT4l3NxcaenaxYp6VxJkNBKTcSIcJmOG4mCsTdIZc1BgMzSLTawzsNoOCuHUiJgAfN3c7rDt
	L+bQJDOb1tMHNzZI1IvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunr6-00000001eHv-2FZX;
	Tue, 24 Feb 2026 08:33:20 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunr2-00000001eHW-1NBS;
	Tue, 24 Feb 2026 08:33:18 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fKrZw3WpFz9vHN;
	Tue, 24 Feb 2026 09:33:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1771921992; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BYg4q6UpxC9QuXXiNNDVGkJ25zHrTtqhRQuiGoCwbvc=;
	b=ed6RPlZlOUibWHwOocSfYTbtNmFVbXwAr31lgxNkh51bR+5xZFRh30ChM/VGa7gukLud7Z
	gjTbJ0LWe52KAN52GeHh8bJ/s/WoNKVXWlvSRa1yRizbR3EpzoiYW3Wbfme/2w9YFsXFEw
	1Sfja1+XOBY3ofP3UjIRgt036+qwuwuFFrM+HEUlokbyx8ydCENU7J4uyTEkj1BUrJue4J
	99L7hKKIyf8MBC9C72PvXh5nuwMG3ygnRsPehMi1rXkCt72nSQ/Sw/iY4BR8htDmahaWW7
	ev+dgehPQrgSupmjoTGs4VKws0G0Lm/uzKdxtzYsBciIbPjnvhapWs+EIlsL6g==
Message-ID: <3014988f8a26dbac18a32ec22e0da3f5a383fd97.camel@mailbox.org>
Subject: Re: [PATCH 01/37] PCI/MSI: Add Devres managed IRQ vectors allocation
From: Philipp Stanner <phasta@mailbox.org>
To: Shawn Lin <shawn.lin@rock-chips.com>, phasta@kernel.org
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
 dmaengine@vger.kernel.org, netdev@vger.kernel.org,  nic_swsd@realtek.com,
 linux-arm-msm@vger.kernel.org,  dri-devel@lists.freedesktop.org,
 linux-usb@vger.kernel.org,  iommu@lists.linux.dev,
 linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, linux-cxl@vger.kernel.org, 
 linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-serial@vger.kernel.org, mhi@lists.linux.dev, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
 linux-i2c@vger.kernel.org, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, linux-spi@vger.kernel.org, Jonathan Derrick
 <jonathan.derrick@linux.dev>, linux-pci@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, Jakub Kicinski
 <kuba@kernel.org>
Date: Tue, 24 Feb 2026 09:32:39 +0100
In-Reply-To: <d601ec05-ef38-5e8e-c643-c05010717ebe@rock-chips.com>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
	 <1771860581-82092-2-git-send-email-shawn.lin@rock-chips.com>
	 <20260223160402.3ad8f079@kernel.org>
	 <ec226aa1-5cc8-855f-8f90-1d7f89efe766@rock-chips.com>
	 <07fc896007d86b731cbfb3cf6bbdf4e5315d7a77.camel@mailbox.org>
	 <d601ec05-ef38-5e8e-c643-c05010717ebe@rock-chips.com>
MIME-Version: 1.0
X-MBO-RS-META: 9xmyhhcgdmozckmn6yfrqrcxte8ryx4p
X-MBO-RS-ID: 6c93f1b6d9c4844e3a5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_003316_529338_1EF1999C 
X-CRM114-Status: GOOD (  26.90  )
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

T24gVHVlLCAyMDI2LTAyLTI0IGF0IDE2OjIxICswODAwLCBTaGF3biBMaW4gd3JvdGU6Cj4g5Zyo
IDIwMjYvMDIvMjQg5pif5pyf5LqMIDE1OjQ3LCBQaGlsaXBwIFN0YW5uZXIg5YaZ6YGTOgo+ID4g
T24gVHVlLCAyMDI2LTAyLTI0IGF0IDEwOjA4ICswODAwLCBTaGF3biBMaW4gd3JvdGU6Cj4gPiA+
IOWcqCAyMDI2LzAyLzI0IOaYn+acn+S6jCA4OjA0LCBKYWt1YiBLaWNpbnNraSDlhpnpgZM6Cj4g
PiA+ID4gT24gTW9uLCAyMyBGZWIgMjAyNiAyMzoyOTo0MCArMDgwMCBTaGF3biBMaW4gd3JvdGU6
Cj4gPiA+ID4gPiBwY2ltX2FsbG9jX2lycV92ZWN0b3JzKCkgYW5kIHBjaW1fYWxsb2NfaXJxX3Zl
Y3RvcnNfYWZmaW5pdHkoKSBhcmUgY3JlYXRlZCBmb3IKPiA+ID4gPiA+IHBjaSBkZXZpY2UgZHJp
dmVycyB3aGljaCByZWx5IG9uIHRoZSBkZXZyZXMgbWFjaGluZXJ5IHRvIGhlbHAgY2xlYW51cCB0
aGUgSVJRCj4gPiA+ID4gPiB2ZWN0b3JzLgo+ID4gPiA+IAo+ID4gPiA+IElmIHlvdSBjYW4gcGxl
YXNlIGFkZCB0aGlzIEFQSSB3aXRoIGp1c3QgYSBmZXcgdXNlcnMsIGFuZCB0aGVuIGNvbnZlcnQK
PiA+ID4gPiByZW1haW5pbmcgdXNlcnMgdmlhIHRoZSBzdWJzeXN0ZW0gdHJlZXMgaW4gdGhlIG5l
eHQgY3ljbGUuCj4gPiA+ID4gVGhlcmUncyBubyBuZWVkIHRvIHJpc2sgd2FzdGluZyBtYWludGFp
bmVyIHRpbWUgb24gY29uZmxpY3RzIHdpdGgKPiA+ID4gPiBjb252ZXJzaW9ucyBsaWtlIHRoaXMu
Cj4gPiA+IAo+ID4gPiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLCBKYWt1Yi4gSSBoYXZlIGxp
dHRsZSBleHBlcmllbmNlIHdpdGgKPiA+ID4gY3Jvc3Mtc3Vic3lzdGVtIGNsZWFudXBzIGxpa2Ug
dGhpcywgc28geW91ciBzdWdnZXN0aW9uIGlzIHZlcnkgaGVscGZ1bC4KPiA+IAo+ID4gCj4gPiBX
aGVuIEkgcmVtb3ZlZCB0aGUgaHlicmlkIG5hdHVyZSBvZiBwY2lfcmVxdWVzdF9yZWdpb24oKSBl
dCBhbC4sIEkKPiA+IGNvbmNsdWRlZCB0aGF0IHRoZXJlIHdlcmUgc28gZmV3IHVzZXJzIHRoYXQg
ZG9pbmcgdGhlbSBhbGwgaW4gb25lIHJ1bgo+ID4gd2FzIHN1ZmZpY2llbnQuCj4gPiAKPiA+IEZv
ciBsYXJnZXIgcmV3b3JrcywgbGlrZSByZW1vdmluZyBwY2ltX2lvbWFwX3RhYmxlKCksIGEgc2xv
d2VyIHN0ZXAtYnktCj4gPiBzdGVwIHN0cmF0ZWd5IGlzIG5lY2Vzc2FyeSBmb3IgdGhlIHJlYXNv
bnMgdGhhdCBKYWt1YiBkZXRhaWxzLgo+ID4gCj4gPiBJdCBpcyB0aGVuIHNtYXJ0IHRvIG9taXQg
YW4gZWFzeSB0byBwb3J0IHN1YnN5c3RlbSAvIGRyaXZlciBmb3IgdGhlCj4gPiB1bHRpbWF0ZSBw
YXRjaCBzZXJpZXMgd2hlcmUgb25lIHRoZW4gcmVtb3ZlcyB0aGUgaHlicmlkIGJlaGF2aW9yIGZy
b20KPiA+IFBDSSBpdHNlbGYsIGFmdGVyIHBvcnRpbmcgdGhlIGxhc3QgZHJpdmVyLgo+ID4gCj4g
PiBJbiBnZW5lcmFsLMKgIGFzIEpha3ViIGRldGFpbHMsIHRob3NlIHN0ZXAtYnktc3RlcCBjbGVh
bnVwcyBhcmUgYSBiaXQKPiA+IHNhZmVyLCBzaW5jZSB5b3UgY2FuIHByb29mIHZhbGlkIGJlaGF2
aW9yIGVhcmx5IG9uIGFuZCBpbiBjYXNlIG9mIGFuCj4gPiBleHBsb3Npb24gdGhleSBhcmUgdmVy
eSBlYXN5IHRvIHJldmVydC4KPiA+IAo+IAo+IFRoYW5rIHlvdSwgUGhpbGlwcC4gSSB3aXNoIEkg
aGFkIGF0dGVuZGVkIHlvdXIgdGFsayBhdCBGT1NERU0gMjAyNSBvbgo+IHJlbW92aW5nIHBjaW1f
aW9tYXBfdGFibGUgZWFybGllci4gVGhpcyBmaXJzdCB2ZXJzaW9uIHdhcyBwZXJoYXBzIGEgYml0
IAo+IHRvbyBhZ2dyZXNzaXZlLgoKTm8gd29ycmllcyBhdCBhbGwsIGl0J3MgdmVyeSBjb29sIHRo
YXQgeW91IHBpY2sgdGhpcyB3b3JrIHVwIQoKPiAgRm9yIHYyLCBJIHRoaW5rIHRoZSBwbGFuIHNo
b3VsZCBzdGFydCB3aXRoIGFkZHJlc3NpbmcKPiB0aGUgc3dpdGNodGVjIGFuZCB2bWQgZHJpdmVy
cywgc2luY2UgYm90aCBvZiB0aG9zZSwgYWxvbmcgd2l0aCB0aGUgbmV3IAo+IEFQSSBhZGRpdGlv
bnMsIGNhbiBiZSBoYW5kbGVkIGVudGlyZWx5IHdpdGhpbiB0aGUgUENJIHN1YnN5c3RlbSBzY29w
ZS4KClNvdW5kcyByZWFzb25hYmxlIHRvIG1lLgoKUmVnYXJkcwpQaGlsaXBwCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
