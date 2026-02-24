Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCDAEFB811
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 08:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ea1WTc7MfOpt64O9+L/VkD2YnD3zPE7cFD9yrzZ7eOw=; b=cXZaTZxYhw6QzUI5WJXgEMWW3Z
	4bEG2EViDGD7SSvCAHRFuCD8IVCQ/NskDv3mbegzuoBG1tfyN3vEqfhQQ4O/DygbJgDxbkMEpAVwI
	H2ejTaqfJzaoDEOzmUJDFaTDEgPRUWQJR4d/tOOPOagyZoygUBF96VSsxhtVhapdMO9HF/5QC0ix3
	3IAjIMj5NT5YdTk2tWsKPcaZKV/R7qKcyvOP3B/UOY21eUh7thZ0/+fZawqRzx/1YzzJQcrVZ4qoh
	UoNNdXruhtbOSQcA2I28Gz83Vm4ayecNyV0ujAdES7Nide9MJ9xfXhh/z+rGRvxm0RVnWct+KYmG8
	Pw+9iANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunfg-00000001dOv-19jB;
	Tue, 24 Feb 2026 08:21:32 +0000
Received: from mail-m15588.qiye.163.com ([101.71.155.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunfc-00000001dNw-1iMR;
	Tue, 24 Feb 2026 08:21:30 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 34c7e7f42;
	Tue, 24 Feb 2026 16:21:13 +0800 (GMT+08:00)
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
 dmaengine@vger.kernel.org, netdev@vger.kernel.org, nic_swsd@realtek.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-usb@vger.kernel.org, iommu@lists.linux.dev,
 linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-cxl@vger.kernel.org,
 linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-serial@vger.kernel.org, mhi@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-spi@vger.kernel.org, Jonathan Derrick <jonathan.derrick@linux.dev>,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-mmc@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 01/37] PCI/MSI: Add Devres managed IRQ vectors allocation
To: phasta@kernel.org
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
 <1771860581-82092-2-git-send-email-shawn.lin@rock-chips.com>
 <20260223160402.3ad8f079@kernel.org>
 <ec226aa1-5cc8-855f-8f90-1d7f89efe766@rock-chips.com>
 <07fc896007d86b731cbfb3cf6bbdf4e5315d7a77.camel@mailbox.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <d601ec05-ef38-5e8e-c643-c05010717ebe@rock-chips.com>
Date: Tue, 24 Feb 2026 16:21:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <07fc896007d86b731cbfb3cf6bbdf4e5315d7a77.camel@mailbox.org>
X-HM-Tid: 0a9c8ebcf01809cckunma66e3c5da3898b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkwYT1ZIQ05NT00aQhpOTEpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEtKTE
	tVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=OtokF0pM0Rdmb7CoOmlCq/zfLcm40+tPTFk2ZLwxQS10TLzJue4pNlrDVsSPzZGK7GjnZ03zAIHAn5VDRN2uAWAEjdInG9Pdls9n5NtKIAxCt/aoY8MRgy7icqkMUtp0jEjJ+naa5XLLsJTKYxzikINqVGIROqqbjer5tDm2ofg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=NX1TqWCCjq6xu1hXTAQXpYiiKKus6llHeXoiHdmvBy4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_002128_977696_0405E8EF 
X-CRM114-Status: GOOD (  21.15  )
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

5ZyoIDIwMjYvMDIvMjQg5pif5pyf5LqMIDE1OjQ3LCBQaGlsaXBwIFN0YW5uZXIg5YaZ6YGTOgo+
IE9uIFR1ZSwgMjAyNi0wMi0yNCBhdCAxMDowOCArMDgwMCwgU2hhd24gTGluIHdyb3RlOgo+PiDl
nKggMjAyNi8wMi8yNCDmmJ/mnJ/kuowgODowNCwgSmFrdWIgS2ljaW5za2kg5YaZ6YGTOgo+Pj4g
T24gTW9uLCAyMyBGZWIgMjAyNiAyMzoyOTo0MCArMDgwMCBTaGF3biBMaW4gd3JvdGU6Cj4+Pj4g
cGNpbV9hbGxvY19pcnFfdmVjdG9ycygpIGFuZCBwY2ltX2FsbG9jX2lycV92ZWN0b3JzX2FmZmlu
aXR5KCkgYXJlIGNyZWF0ZWQgZm9yCj4+Pj4gcGNpIGRldmljZSBkcml2ZXJzIHdoaWNoIHJlbHkg
b24gdGhlIGRldnJlcyBtYWNoaW5lcnkgdG8gaGVscCBjbGVhbnVwIHRoZSBJUlEKPj4+PiB2ZWN0
b3JzLgo+Pj4KPj4+IElmIHlvdSBjYW4gcGxlYXNlIGFkZCB0aGlzIEFQSSB3aXRoIGp1c3QgYSBm
ZXcgdXNlcnMsIGFuZCB0aGVuIGNvbnZlcnQKPj4+IHJlbWFpbmluZyB1c2VycyB2aWEgdGhlIHN1
YnN5c3RlbSB0cmVlcyBpbiB0aGUgbmV4dCBjeWNsZS4KPj4+IFRoZXJlJ3Mgbm8gbmVlZCB0byBy
aXNrIHdhc3RpbmcgbWFpbnRhaW5lciB0aW1lIG9uIGNvbmZsaWN0cyB3aXRoCj4+PiBjb252ZXJz
aW9ucyBsaWtlIHRoaXMuCj4+Cj4+IFRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24sIEpha3ViLiBJ
IGhhdmUgbGl0dGxlIGV4cGVyaWVuY2Ugd2l0aAo+PiBjcm9zcy1zdWJzeXN0ZW0gY2xlYW51cHMg
bGlrZSB0aGlzLCBzbyB5b3VyIHN1Z2dlc3Rpb24gaXMgdmVyeSBoZWxwZnVsLgo+IAo+IAo+IFdo
ZW4gSSByZW1vdmVkIHRoZSBoeWJyaWQgbmF0dXJlIG9mIHBjaV9yZXF1ZXN0X3JlZ2lvbigpIGV0
IGFsLiwgSQo+IGNvbmNsdWRlZCB0aGF0IHRoZXJlIHdlcmUgc28gZmV3IHVzZXJzIHRoYXQgZG9p
bmcgdGhlbSBhbGwgaW4gb25lIHJ1bgo+IHdhcyBzdWZmaWNpZW50Lgo+IAo+IEZvciBsYXJnZXIg
cmV3b3JrcywgbGlrZSByZW1vdmluZyBwY2ltX2lvbWFwX3RhYmxlKCksIGEgc2xvd2VyIHN0ZXAt
YnktCj4gc3RlcCBzdHJhdGVneSBpcyBuZWNlc3NhcnkgZm9yIHRoZSByZWFzb25zIHRoYXQgSmFr
dWIgZGV0YWlscy4KPiAKPiBJdCBpcyB0aGVuIHNtYXJ0IHRvIG9taXQgYW4gZWFzeSB0byBwb3J0
IHN1YnN5c3RlbSAvIGRyaXZlciBmb3IgdGhlCj4gdWx0aW1hdGUgcGF0Y2ggc2VyaWVzIHdoZXJl
IG9uZSB0aGVuIHJlbW92ZXMgdGhlIGh5YnJpZCBiZWhhdmlvciBmcm9tCj4gUENJIGl0c2VsZiwg
YWZ0ZXIgcG9ydGluZyB0aGUgbGFzdCBkcml2ZXIuCj4gCj4gSW4gZ2VuZXJhbCwgIGFzIEpha3Vi
IGRldGFpbHMsIHRob3NlIHN0ZXAtYnktc3RlcCBjbGVhbnVwcyBhcmUgYSBiaXQKPiBzYWZlciwg
c2luY2UgeW91IGNhbiBwcm9vZiB2YWxpZCBiZWhhdmlvciBlYXJseSBvbiBhbmQgaW4gY2FzZSBv
ZiBhbgo+IGV4cGxvc2lvbiB0aGV5IGFyZSB2ZXJ5IGVhc3kgdG8gcmV2ZXJ0Lgo+IAoKVGhhbmsg
eW91LCBQaGlsaXBwLiBJIHdpc2ggSSBoYWQgYXR0ZW5kZWQgeW91ciB0YWxrIGF0IEZPU0RFTSAy
MDI1IG9uCnJlbW92aW5nIHBjaW1faW9tYXBfdGFibGUgZWFybGllci4gVGhpcyBmaXJzdCB2ZXJz
aW9uIHdhcyBwZXJoYXBzIGEgYml0IAp0b28gYWdncmVzc2l2ZS4gRm9yIHYyLCBJIHRoaW5rIHRo
ZSBwbGFuIHNob3VsZCBzdGFydCB3aXRoIGFkZHJlc3NpbmcgCnRoZSBzd2l0Y2h0ZWMgYW5kIHZt
ZCBkcml2ZXJzLCBzaW5jZSBib3RoIG9mIHRob3NlLCBhbG9uZyB3aXRoIHRoZSBuZXcgCkFQSSBh
ZGRpdGlvbnMsIGNhbiBiZSBoYW5kbGVkIGVudGlyZWx5IHdpdGhpbiB0aGUgUENJIHN1YnN5c3Rl
bSBzY29wZS4KCj4gCj4gUC4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
