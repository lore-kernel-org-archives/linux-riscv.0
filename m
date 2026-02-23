Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A72EC110C
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Feb 2026 17:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLAtZ7Fma2P9jlFRPBADne0cudH/w9ZA0ZQ1SGyP9+M=; b=Sc6SduMsmaGUh7
	JR9E4+/7169uMX5kSn33l2+lQxrCXtGOx5RNi97cDTZDF2SnR4xV1vpG1YDSTSPdLHLGhfNysf6Wd
	1ugQwzxpFJF0Wl4I8Cvhux4PuCGS5aUJOLqjupM0Fb6MeqmnOeNdz13Ujo9mjMYEA0h/60BI/NKqb
	wZJgfn8L3XKi6JMcGIv2yywkphnl7h98fMDt/GbKNv1eiEtvslTwGT8cHXrk10GFUJIu20in+oc+H
	LNLANYpDSU0nsXBYBfcADL76tG16mch640G74AnePRBzDkkC4A09ugpLCVALM1qFbi/Ihq2ehIQUm
	Yhg30Kc1YpPTyHwD7Uag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZta-00000000ncP-3qCx;
	Mon, 23 Feb 2026 17:38:58 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZtX-00000000nbF-3qp3;
	Mon, 23 Feb 2026 17:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771868336; x=1803404336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OFs+F2i4fpeRmsTH7tUJ5hO0npgCDxBo25FPhTX/hFs=;
  b=mjqnx0P1fTgtoFBzT2J9eeu5UGHvvG4O4FATLZ2iQr/bhVgYk4flvQhH
   77e4SO6MTBKruzqBw/eLvExnczNFED7Uz4fu0AgZWqfRjb8k04N5VYduh
   6MNnLPIyQw3CzmVXX8NL3xLLl8yH+7Ohk52ZsTPFa29Q8kwBAHDSjSlNi
   9s0kpINdDglI71oRfWDc0Jnjt5nKb1TIjr4kGmPFxzPiYsTpbc2ZvoGxR
   Pwvi6Mcgy3BsW1ebez16P77QyIVoHE7piH2Fxw5b2R/3TMr/fFRLN44//
   WNynlHKpNYSkJma3+jFnDVin+nvUO1bnPoDLEr6LLaO23L96zwahPejUi
   Q==;
X-CSE-ConnectionGUID: N/eBKpv/SFab7fqrcfjVYg==
X-CSE-MsgGUID: JG49R45FRV+mM3wxy1ekuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73050409"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="73050409"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 09:38:54 -0800
X-CSE-ConnectionGUID: i7eZdD4uRr+gNr/ct2htpA==
X-CSE-MsgGUID: B0cv0ytAS2ClRPRHaDlf4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="214708424"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 09:38:36 -0800
Date: Mon, 23 Feb 2026 19:38:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Even Xu <even.xu@intel.com>, Xinpeng Sun <xinpeng.sun@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Longfang Liu <liulongfang@huawei.com>,
	Vinod Koul <vkoul@kernel.org>, Lee Jones <lee@kernel.org>,
	Jijie Shao <shaojijie@huawei.com>,
	Jian Shen <shenjian15@huawei.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Maciej Falkowski <maciej.falkowski@linux.intel.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Xinliang Liu <xinliang.liu@linaro.org>,
	Tian Tao <tiantao6@hisilicon.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Srujana Challa <schalla@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Antoine Tenart <atenart@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Raag Jadav <raag.jadav@intel.com>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Robert Richter <rric@kernel.org>, Mark Brown <broonie@kernel.org>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-i3c@lists.infradead.org,
	dmaengine@vger.kernel.org, Philipp Stanner <phasta@kernel.org>,
	netdev@vger.kernel.org, nic_swsd@realtek.com,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, linux-cxl@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-serial@vger.kernel.org, mhi@lists.linux.dev,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	linux-spi@vger.kernel.org,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 0/37] PCI/MSI: Enforce explicit IRQ vector management by
 removing devres auto-free
Message-ID: <aZyQmc7nOt87jitX@smile.fi.intel.com>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
 <CAHp75VeWD5A0r7-Uayyte1ZXXxdhLixd+z_y0xNeki0N+Ro=jQ@mail.gmail.com>
 <cb878741-7b61-b72c-5a72-6ed6d5091b1f@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cb878741-7b61-b72c-5a72-6ed6d5091b1f@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_093856_005684_6323F98F 
X-CRM114-Status: GOOD (  32.87  )
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

T24gVHVlLCBGZWIgMjQsIDIwMjYgYXQgMTI6MDk6MzdBTSArMDgwMCwgU2hhd24gTGluIHdyb3Rl
Ogo+IOWcqCAyMDI2LzAyLzIzIOaYn+acn+S4gCAyMzo1MCwgQW5keSBTaGV2Y2hlbmtvIOWGmemB
kzoKPiA+IE9uIE1vbiwgRmViIDIzLCAyMDI2IGF0IDU6MzLigK9QTSBTaGF3biBMaW4gPHNoYXdu
LmxpbkByb2NrLWNoaXBzLmNvbT4gd3JvdGU6Cj4gPiA+IAo+ID4gPiBUaGlzIHBhdGNoIHNlcmll
cyBhZGRyZXNzZXMgYSBsb25nLXN0YW5kaW5nIGRlc2lnbiBpc3N1ZSBpbiB0aGUgUENJL01TSQo+
ID4gPiBzdWJzeXN0ZW0gd2hlcmUgdGhlIGltcGxpY2l0LCBhdXRvbWF0aWMgbWFuYWdlbWVudCBv
ZiBJUlEgdmVjdG9ycyBieQo+ID4gPiB0aGUgZGV2cmVzIGZyYW1ld29yayBjb25mbGljdHMgd2l0
aCBleHBsaWNpdCBkcml2ZXIgY2xlYW51cCwgY3JlYXRpbmcKPiA+ID4gYW1iaWd1aXR5IGFuZCBw
b3RlbnRpYWwgcmVzb3VyY2UgbWFuYWdlbWVudCBidWdzLgo+ID4gPiAKPiA+ID4gPT09PSBUaGUg
UHJvYmxlbTogSW1wbGljaXQgdnMuIEV4cGxpY2l0IE1hbmFnZW1lbnQgPT09PQo+ID4gPiBIaXN0
b3JpY2FsbHksIGBwY2ltX2VuYWJsZV9kZXZpY2UoKWAgbm90IG9ubHkgbWFuYWdlcyBzdGFuZGFy
ZCBQQ0kgcmVzb3VyY2VzCj4gPiA+IChCQVJzKSB2aWEgZGV2cmVzIGJ1dCBhbHNvIGltcGxpY2l0
bHkgdHJpZ2dlcnMgYXV0b21hdGljIElSUSB2ZWN0b3IgbWFuYWdlbWVudAo+ID4gPiBieSBzZXR0
aW5nIGEgZmxhZyB0aGF0IHJlZ2lzdGVycyBgcGNpbV9tc2lfcmVsZWFzZSgpYCBhcyBhIGNsZWFu
dXAgYWN0aW9uLgo+ID4gPiAKPiA+ID4gVGhpcyBjcmVhdGVzIGFuIGFtYmlndW91cyBvd25lcnNo
aXAgbW9kZWwuIE1hbnkgZHJpdmVycyBmb2xsb3cgYSBwYXR0ZXJuIG9mOgo+ID4gPiAxLiBDYWxs
aW5nIGBwY2lfYWxsb2NfaXJxX3ZlY3RvcnMoKWAgdG8gYWxsb2NhdGUgaW50ZXJydXB0cy4KPiA+
ID4gMi4gQWxzbyBjYWxsaW5nIGBwY2lfZnJlZV9pcnFfdmVjdG9ycygpYCBpbiB0aGVpciBlcnJv
ciBwYXRocyBvciByZW1vdmUgcm91dGluZXMuCj4gPiA+IAo+ID4gPiBXaGVuIHN1Y2ggYSBkcml2
ZXIgYWxzbyB1c2VzIGBwY2ltX2VuYWJsZV9kZXZpY2UoKWAsIHRoZSBkZXZyZXMgZnJhbWV3b3Jr
IG1heQo+ID4gPiBhdHRlbXB0IHRvIGZyZWUgdGhlIElSUSB2ZWN0b3JzIGEgc2Vjb25kIHRpbWUg
dXBvbiBkZXZpY2UgcmVsZWFzZSwgbGVhZGluZyB0bwo+ID4gPiBhIGRvdWJsZS1mcmVlLiBBbmFs
eXNpcyBvZiB0aGUgdHJlZSBzaG93cyB0aGlzIGhhemFyZG91cyBwYXR0ZXJuIGV4aXN0cyB3aWRl
bHksCj4gPiA+IHdoaWxlIDM1IG90aGVyIGRyaXZlcnMgY29ycmVjdGx5IHJlbHkgc29sZWx5IG9u
IHRoZSBpbXBsaWNpdCBjbGVhbnVwLgo+ID4gCj4gPiBJcyB0aGlzIGNvbmZpcm1lZD8gV2hhdCBJ
IHJlYWQgZnJvbSB0aGUgY292ZXIgbGV0dGVyLCB0aGlzIHNlcmllcyB3YXMKPiA+IG9ubHkgY29t
cGlsZS10ZXN0ZWQsIHNvIGhvdyBjYW4geW91IHByb3ZlIHRoZSBwcm9ibGVtIGV4aXN0cyBpbiB0
aGUKPiA+IGZpcnN0IHBsYWNlPwo+IAo+IFllcywgaXQncyBjb25maXJtZWQuIE15IGRlYnVnIG9m
IGEgZG91YmxlIGZyZWUgaXNzdWUgb2YgYSBvdXQtb2YtdHJlZQo+IFBDSWUgd2lmaSBkcml2ZXIg
d2hpY2ggdXNlcwo+IHBjaW1fZW5hYmxlX2RldmljZSArIHBjaV9hbGxvY19pcnFfdmVjdG9ycyAr
IHBjaV9mcmVlX2lycV92ZWN0b3JzIGV4cG9zZQo+IGl0LiBBbmQgd2UgZGlkIGhhdmUgYSBUT0RP
IHRvIGNsZWFudXAgdGhpcyBoeWJyaWQgdXNhZ2UsIHRhcmdldGVkIGluCj4gdGhpcyBjeWNsZVsx
XSBzdWdnZXN0ZWQgYnkgUGhpbGlwcDoKCk9rYXksIGZhaXIgZW5vdWdoLiBJIHRoaW5rIHRoaXMg
Yml0IHdhcyBtaXNzaW5nIGluIHRoZSBjb3ZlciBsZXR0ZXIuCgo+IFsxXSBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wY2kvcGNpLmdpdC9sb2cvP2g9bXNp
Cgo+ID4gPiA9PT09IFRoZSBTb2x1dGlvbjogTWFraW5nIE1hbmFnZW1lbnQgRXhwbGljaXQgPT09
PQo+ID4gPiBUaGlzIHNlcmllcyBlbmZvcmNlcyBhIGNsZWFyLCBwcmVkaWN0YWJsZSBtb2RlbDoK
PiA+ID4gMS4gIE5ldyBNYW5hZ2VkIEFQSSAoUGF0Y2ggMS8zNyk6IEludHJvZHVjZXMgcGNpbV9h
bGxvY19pcnFfdmVjdG9ycygpIGFuZAo+ID4gPiAgICAgIHBjaW1fYWxsb2NfaXJxX3ZlY3RvcnNf
YWZmaW5pdHkoKS4gRHJpdmVycyB0aGF0IGRlc2lyZSBkZXZyZXMtbWFuYWdlZCBJUlEKPiA+ID4g
ICAgICB2ZWN0b3JzIHNob3VsZCB1c2UgdGhlc2UgZnVuY3Rpb25zLCB3aGljaCBzZXQgdGhlIGlz
X21zaV9tYW5hZ2VkIGZsYWcgYW5kCj4gPiA+ICAgICAgZW5zdXJlIGF1dG9tYXRpYyBjbGVhbnVw
Lgo+ID4gPiAyLiAgUGF0Y2hlcyAyIHRocm91Z2ggMzYgY29udmVydCBlYWNoIGRyaXZlciB0aGF0
IHVzZXMgcGNpbV9lbmFibGVfZGV2aWNlKCkgYWxvbmdzaWRlCj4gPiA+ICAgICAgcGNpX2FsbG9j
X2lycV92ZWN0b3JzKCkgYW5kIHJlbGllcyBvbiBkZXZyZXMgZm9yIElSUSB2ZWN0b3IgY2xlYW51
cCB0byBpbnN0ZWFkCj4gPiA+ICAgICAgbWFrZSBhbiBleHBsaWNpdCBjYWxsIHRvIHBjaW1fYWxs
b2NfaXJxX3ZlY3RvcnMoKS4KPiA+ID4gMy4gIENvcmUgQ2hhbmdlIChQYXRjaCAzNy8zNyk6IFdp
dGggdGhlIGZvcm1lciBjbGVhbnVwLCBub3cgbW9kaWZpZXMgcGNpbV9zZXR1cF9tc2lfcmVsZWFz
ZSgpCj4gPiA+ICAgICAgdG8gY2hlY2sgb25seSB0aGUgaXNfbXNpX21hbmFnZWQgZmxhZy4gVGhp
cyBkZWNvdXBsZXMgYXV0b21hdGljIElSUSBjbGVhbnVwIGZyb20KPiA+ID4gICAgICBwY2ltX2Vu
YWJsZV9kZXZpY2UoKS4gSVJRIHZlY3RvcnMgYWxsb2NhdGVkIHZpYSBwY2lfYWxsb2NfaXJxX3Zl
Y3RvcnMqKCkKPiA+ID4gICAgICBhcmUgbm93IHNvbGVseSB0aGUgZHJpdmVyJ3MgcmVzcG9uc2li
aWxpdHkgdG8gZnJlZSB3aXRoIHBjaV9mcmVlX2lycV92ZWN0b3JzKCkuCj4gPiA+IAo+ID4gPiBX
aXRoIHRoZXNlIGNoYW5nZXMsIHdlIGNsZWFyIG93bmVyc2hpcCBtb2RlbDogRXhwbGljaXQgcmVz
b3VyY2UgbWFuYWdlbWVudCBlbGltaW5hdGVzCj4gPiA+IGFtYmlndWl0eSBhbmQgZm9sbG93cyB0
aGUgInByaW5jaXBsZSBvZiBsZWFzdCBzdXJwcmlzZS4iIE5ldyBkcml2ZXJzIGNob29zZSBvbmUg
bW9kZWwgYW5kCj4gPiA+IGJlIGNvbnNpc3RlbnQuCj4gPiA+IC0gVXNlIGBwY2lfYWxsb2NfaXJx
X3ZlY3RvcnMoKWAgKyBgcGNpX2ZyZWVfaXJxX3ZlY3RvcnMoKWAgZm9yIGV4cGxpY2l0IGNvbnRy
b2wuCj4gPiA+IC0gVXNlIGBwY2ltX2FsbG9jX2lycV92ZWN0b3JzKClgIGZvciBkZXZyZXMtbWFu
YWdlZCwgYXV0b21hdGljIGNsZWFudXAuCj4gPiAKPiA+IEhhdmUgeW91IGNoZWNrZWQgcHJldmlv
dXMgYXR0ZW1wdHM/IFdoeSBpcyB5b3VyIHNlcmllcyBiZXR0ZXIgdGhhbiB0aG9zZT8KPiAKPiBU
aGVyZSBzZWVtcyBub3QgcHJldmlvdXMgYXR0ZW1wdHMuCgpNYXliZSB3ZSBhcmUgbG9va2luZyB0
byB0aGUgZGlmZmVyZW50IHByb2plY3RzLi4uCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
P3E9cGNpbV9hbGxvY19pcnFfdmVjdG9ycwoKPiA+ID4gPT09PSBUZXN0aW5nIEFuZCBSZXZpZXcg
PT09PQo+ID4gPiAxLiBUaGlzIHNlcmllcyBpcyBvbmx5IGNvbXBpbGVkIHRlc3Qgd2l0aCBhbGxt
b2Rjb25maWcuCj4gPiA+IDIuIEdpdmVuIHRoZSBzdWJzdGFudGlhbCBzaXplIG9mIHRoaXMgcGF0
Y2ggc2VyaWVzLCBJIGhhdmUgc3RydWN0dXJlZCB0aGUgbWFpbGluZwo+ID4gPiAgICAgdG8gZmFj
aWxpdGF0ZSBlZmZpY2llbnQgcmV2aWV3LiBUaGUgY292ZXIgbGV0dGVyLCB0aGUgZmlyc3QgcGF0
Y2ggYW5kIHRoZSBsYXN0IG9uZSB3aWxsIGJlIHNlbnQKPiA+ID4gICAgIHRvIGFsbCByZWxldmFu
dCBtYWlsaW5nIGxpc3RzIGFuZCBrZXkgbWFpbnRhaW5lcnMgdG8gZW5zdXJlIGJyb2FkIHZpc2li
aWxpdHkgYW5kCj4gPiA+ICAgICBpbml0aWFsIGZlZWRiYWNrIG9uIHRoZSBvdmVyYWxsIGFwcHJv
YWNoLiBUaGUgcmVtYWluaW5nIHN1YnN5c3RlbS1zcGVjaWZpYyBwYXRjaGVzCj4gPiA+ICAgICB3
aWxsIGJlIHNlbnQgb25seSB0byB0aGUgcmVzcGVjdGl2ZSBzdWJzeXN0ZW0gbWFpbnRhaW5lcnMg
YW5kIHRoZWlyIGFzc29jaWF0ZWQKPiA+ID4gICAgIG1haWxpbmcgbGlzdHMsIHJlZHVjaW5nIG5v
aXNlLgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
