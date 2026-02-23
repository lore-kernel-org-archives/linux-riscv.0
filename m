Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F9BEC1101
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Feb 2026 16:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OC/inFg8+qvbAImdNQwdOeuG39Q7sJE+LzGMZSo3EP8=; b=R194vHhpyZpXIJ7tV2w3MTa94T
	CTW4T7YtqAEOYd99s9oikc7xXN4tb88gOt2KlrIUxCN3HwX0czRe4wOnLmm1Kw3KVRyW56kTOtGbb
	jPils+DOUk7V5Z0FLrJ3dt/jpUXd5M2Ri7lfFgKcdsPg1vgq/io/SJ1aCP/gn9Ha+A76950kG7a1f
	3uhTidywWxFXc+7/ZhlJgFSJVzbqsf76Kz6MspFvJ/kaQV3inma4IDseLdPp0uvv7GHu0Vf4MWof5
	RHwSEvuZvP/TJcc2pkp10VwQiY5OHWIskhrz+5YJsy8BNFf/qRLlZy3MMdvr8jClS/Oo46K6vaLHW
	wyYQuA7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYVM-00000000dw1-1oMV;
	Mon, 23 Feb 2026 16:09:52 +0000
Received: from mail-m49205.qiye.163.com ([45.254.49.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYVI-00000000duF-0u5m;
	Mon, 23 Feb 2026 16:09:50 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 34b44f421;
	Tue, 24 Feb 2026 00:09:40 +0800 (GMT+08:00)
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
Subject: Re: [PATCH 0/37] PCI/MSI: Enforce explicit IRQ vector management by
 removing devres auto-free
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
 <CAHp75VeWD5A0r7-Uayyte1ZXXxdhLixd+z_y0xNeki0N+Ro=jQ@mail.gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <cb878741-7b61-b72c-5a72-6ed6d5091b1f@rock-chips.com>
Date: Tue, 24 Feb 2026 00:09:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VeWD5A0r7-Uayyte1ZXXxdhLixd+z_y0xNeki0N+Ro=jQ@mail.gmail.com>
X-HM-Tid: 0a9c8b4376c609cckunm3fddd3f4988fc3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh9CQlYeGUkeS01CTB5IS0tWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0
	pVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=QIa8w6+mvkPs5yiMg8fVRt+gi3F6m/qkhqhjD+6XgiSvEJjtpIRJHvdkclp/pXy7G5fSEbf/NetLr/rXCYIFm/CQEBB6zjl+aiz8R4JS9N+fvFShWzFTgOlhNPDfffXHGWPxdi8/iAaZQWZ16BNVBWgFXcFRVBUKCW34Wu0UCFI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=scr8hCA+aPfGKwMjupeE8viSs7WuDndPG1pZF3mByMQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_080948_467410_FD9D02FF 
X-CRM114-Status: GOOD (  20.36  )
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQW5keQoK5ZyoIDIwMjYvMDIvMjMg5pif5pyf5LiAIDIzOjUwLCBBbmR5IFNoZXZjaGVua28g
5YaZ6YGTOgo+IE9uIE1vbiwgRmViIDIzLCAyMDI2IGF0IDU6MzLigK9QTSBTaGF3biBMaW4gPHNo
YXduLmxpbkByb2NrLWNoaXBzLmNvbT4gd3JvdGU6Cj4+Cj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGFk
ZHJlc3NlcyBhIGxvbmctc3RhbmRpbmcgZGVzaWduIGlzc3VlIGluIHRoZSBQQ0kvTVNJCj4+IHN1
YnN5c3RlbSB3aGVyZSB0aGUgaW1wbGljaXQsIGF1dG9tYXRpYyBtYW5hZ2VtZW50IG9mIElSUSB2
ZWN0b3JzIGJ5Cj4+IHRoZSBkZXZyZXMgZnJhbWV3b3JrIGNvbmZsaWN0cyB3aXRoIGV4cGxpY2l0
IGRyaXZlciBjbGVhbnVwLCBjcmVhdGluZwo+PiBhbWJpZ3VpdHkgYW5kIHBvdGVudGlhbCByZXNv
dXJjZSBtYW5hZ2VtZW50IGJ1Z3MuCj4+Cj4+ID09PT0gVGhlIFByb2JsZW06IEltcGxpY2l0IHZz
LiBFeHBsaWNpdCBNYW5hZ2VtZW50ID09PT0KPj4gSGlzdG9yaWNhbGx5LCBgcGNpbV9lbmFibGVf
ZGV2aWNlKClgIG5vdCBvbmx5IG1hbmFnZXMgc3RhbmRhcmQgUENJIHJlc291cmNlcwo+PiAoQkFS
cykgdmlhIGRldnJlcyBidXQgYWxzbyBpbXBsaWNpdGx5IHRyaWdnZXJzIGF1dG9tYXRpYyBJUlEg
dmVjdG9yIG1hbmFnZW1lbnQKPj4gYnkgc2V0dGluZyBhIGZsYWcgdGhhdCByZWdpc3RlcnMgYHBj
aW1fbXNpX3JlbGVhc2UoKWAgYXMgYSBjbGVhbnVwIGFjdGlvbi4KPj4KPj4gVGhpcyBjcmVhdGVz
IGFuIGFtYmlndW91cyBvd25lcnNoaXAgbW9kZWwuIE1hbnkgZHJpdmVycyBmb2xsb3cgYSBwYXR0
ZXJuIG9mOgo+PiAxLiBDYWxsaW5nIGBwY2lfYWxsb2NfaXJxX3ZlY3RvcnMoKWAgdG8gYWxsb2Nh
dGUgaW50ZXJydXB0cy4KPj4gMi4gQWxzbyBjYWxsaW5nIGBwY2lfZnJlZV9pcnFfdmVjdG9ycygp
YCBpbiB0aGVpciBlcnJvciBwYXRocyBvciByZW1vdmUgcm91dGluZXMuCj4+Cj4+IFdoZW4gc3Vj
aCBhIGRyaXZlciBhbHNvIHVzZXMgYHBjaW1fZW5hYmxlX2RldmljZSgpYCwgdGhlIGRldnJlcyBm
cmFtZXdvcmsgbWF5Cj4+IGF0dGVtcHQgdG8gZnJlZSB0aGUgSVJRIHZlY3RvcnMgYSBzZWNvbmQg
dGltZSB1cG9uIGRldmljZSByZWxlYXNlLCBsZWFkaW5nIHRvCj4+IGEgZG91YmxlLWZyZWUuIEFu
YWx5c2lzIG9mIHRoZSB0cmVlIHNob3dzIHRoaXMgaGF6YXJkb3VzIHBhdHRlcm4gZXhpc3RzIHdp
ZGVseSwKPj4gd2hpbGUgMzUgb3RoZXIgZHJpdmVycyBjb3JyZWN0bHkgcmVseSBzb2xlbHkgb24g
dGhlIGltcGxpY2l0IGNsZWFudXAuCj4gCj4gSXMgdGhpcyBjb25maXJtZWQ/IFdoYXQgSSByZWFk
IGZyb20gdGhlIGNvdmVyIGxldHRlciwgdGhpcyBzZXJpZXMgd2FzCj4gb25seSBjb21waWxlLXRl
c3RlZCwgc28gaG93IGNhbiB5b3UgcHJvdmUgdGhlIHByb2JsZW0gZXhpc3RzIGluIHRoZQo+IGZp
cnN0IHBsYWNlPwoKWWVzLCBpdCdzIGNvbmZpcm1lZC4gTXkgZGVidWcgb2YgYSBkb3VibGUgZnJl
ZSBpc3N1ZSBvZiBhIG91dC1vZi10cmVlClBDSWUgd2lmaSBkcml2ZXIgd2hpY2ggdXNlcwpwY2lt
X2VuYWJsZV9kZXZpY2UgKyBwY2lfYWxsb2NfaXJxX3ZlY3RvcnMgKyBwY2lfZnJlZV9pcnFfdmVj
dG9ycyBleHBvc2UKaXQuIEFuZCB3ZSBkaWQgaGF2ZSBhIFRPRE8gdG8gY2xlYW51cCB0aGlzIGh5
YnJpZCB1c2FnZSwgdGFyZ2V0ZWQgaW4KdGhpcyBjeWNsZVsxXSBzdWdnZXN0ZWQgYnkgUGhpbGlw
cDoKClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9w
Y2kvcGNpLmdpdC9sb2cvP2g9bXNpCgo+IAo+PiA9PT09IFRoZSBTb2x1dGlvbjogTWFraW5nIE1h
bmFnZW1lbnQgRXhwbGljaXQgPT09PQo+PiBUaGlzIHNlcmllcyBlbmZvcmNlcyBhIGNsZWFyLCBw
cmVkaWN0YWJsZSBtb2RlbDoKPj4gMS4gIE5ldyBNYW5hZ2VkIEFQSSAoUGF0Y2ggMS8zNyk6IElu
dHJvZHVjZXMgcGNpbV9hbGxvY19pcnFfdmVjdG9ycygpIGFuZAo+PiAgICAgIHBjaW1fYWxsb2Nf
aXJxX3ZlY3RvcnNfYWZmaW5pdHkoKS4gRHJpdmVycyB0aGF0IGRlc2lyZSBkZXZyZXMtbWFuYWdl
ZCBJUlEKPj4gICAgICB2ZWN0b3JzIHNob3VsZCB1c2UgdGhlc2UgZnVuY3Rpb25zLCB3aGljaCBz
ZXQgdGhlIGlzX21zaV9tYW5hZ2VkIGZsYWcgYW5kCj4+ICAgICAgZW5zdXJlIGF1dG9tYXRpYyBj
bGVhbnVwLgo+PiAyLiAgUGF0Y2hlcyAyIHRocm91Z2ggMzYgY29udmVydCBlYWNoIGRyaXZlciB0
aGF0IHVzZXMgcGNpbV9lbmFibGVfZGV2aWNlKCkgYWxvbmdzaWRlCj4+ICAgICAgcGNpX2FsbG9j
X2lycV92ZWN0b3JzKCkgYW5kIHJlbGllcyBvbiBkZXZyZXMgZm9yIElSUSB2ZWN0b3IgY2xlYW51
cCB0byBpbnN0ZWFkCj4+ICAgICAgbWFrZSBhbiBleHBsaWNpdCBjYWxsIHRvIHBjaW1fYWxsb2Nf
aXJxX3ZlY3RvcnMoKS4KPj4gMy4gIENvcmUgQ2hhbmdlIChQYXRjaCAzNy8zNyk6IFdpdGggdGhl
IGZvcm1lciBjbGVhbnVwLCBub3cgbW9kaWZpZXMgcGNpbV9zZXR1cF9tc2lfcmVsZWFzZSgpCj4+
ICAgICAgdG8gY2hlY2sgb25seSB0aGUgaXNfbXNpX21hbmFnZWQgZmxhZy4gVGhpcyBkZWNvdXBs
ZXMgYXV0b21hdGljIElSUSBjbGVhbnVwIGZyb20KPj4gICAgICBwY2ltX2VuYWJsZV9kZXZpY2Uo
KS4gSVJRIHZlY3RvcnMgYWxsb2NhdGVkIHZpYSBwY2lfYWxsb2NfaXJxX3ZlY3RvcnMqKCkKPj4g
ICAgICBhcmUgbm93IHNvbGVseSB0aGUgZHJpdmVyJ3MgcmVzcG9uc2liaWxpdHkgdG8gZnJlZSB3
aXRoIHBjaV9mcmVlX2lycV92ZWN0b3JzKCkuCj4+Cj4+IFdpdGggdGhlc2UgY2hhbmdlcywgd2Ug
Y2xlYXIgb3duZXJzaGlwIG1vZGVsOiBFeHBsaWNpdCByZXNvdXJjZSBtYW5hZ2VtZW50IGVsaW1p
bmF0ZXMKPj4gYW1iaWd1aXR5IGFuZCBmb2xsb3dzIHRoZSAicHJpbmNpcGxlIG9mIGxlYXN0IHN1
cnByaXNlLiIgTmV3IGRyaXZlcnMgY2hvb3NlIG9uZSBtb2RlbCBhbmQKPj4gYmUgY29uc2lzdGVu
dC4KPj4gLSBVc2UgYHBjaV9hbGxvY19pcnFfdmVjdG9ycygpYCArIGBwY2lfZnJlZV9pcnFfdmVj
dG9ycygpYCBmb3IgZXhwbGljaXQgY29udHJvbC4KPj4gLSBVc2UgYHBjaW1fYWxsb2NfaXJxX3Zl
Y3RvcnMoKWAgZm9yIGRldnJlcy1tYW5hZ2VkLCBhdXRvbWF0aWMgY2xlYW51cC4KPiAKPiBIYXZl
IHlvdSBjaGVja2VkIHByZXZpb3VzIGF0dGVtcHRzPyBXaHkgaXMgeW91ciBzZXJpZXMgYmV0dGVy
IHRoYW4gdGhvc2U/CgpUaGVyZSBzZWVtcyBub3QgcHJldmlvdXMgYXR0ZW1wdHMuCgo+IAo+PiA9
PT09IFRlc3RpbmcgQW5kIFJldmlldyA9PT09Cj4+IDEuIFRoaXMgc2VyaWVzIGlzIG9ubHkgY29t
cGlsZWQgdGVzdCB3aXRoIGFsbG1vZGNvbmZpZy4KPj4gMi4gR2l2ZW4gdGhlIHN1YnN0YW50aWFs
IHNpemUgb2YgdGhpcyBwYXRjaCBzZXJpZXMsIEkgaGF2ZSBzdHJ1Y3R1cmVkIHRoZSBtYWlsaW5n
Cj4+ICAgICB0byBmYWNpbGl0YXRlIGVmZmljaWVudCByZXZpZXcuIFRoZSBjb3ZlciBsZXR0ZXIs
IHRoZSBmaXJzdCBwYXRjaCBhbmQgdGhlIGxhc3Qgb25lIHdpbGwgYmUgc2VudAo+PiAgICAgdG8g
YWxsIHJlbGV2YW50IG1haWxpbmcgbGlzdHMgYW5kIGtleSBtYWludGFpbmVycyB0byBlbnN1cmUg
YnJvYWQgdmlzaWJpbGl0eSBhbmQKPj4gICAgIGluaXRpYWwgZmVlZGJhY2sgb24gdGhlIG92ZXJh
bGwgYXBwcm9hY2guIFRoZSByZW1haW5pbmcgc3Vic3lzdGVtLXNwZWNpZmljIHBhdGNoZXMKPj4g
ICAgIHdpbGwgYmUgc2VudCBvbmx5IHRvIHRoZSByZXNwZWN0aXZlIHN1YnN5c3RlbSBtYWludGFp
bmVycyBhbmQgdGhlaXIgYXNzb2NpYXRlZAo+PiAgICAgbWFpbGluZyBsaXN0cywgcmVkdWNpbmcg
bm9pc2UuCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
