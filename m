Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E59FEFB7E1
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 02:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnKcVHv9ggwBlNjF99g7YQeoVOo+AoEmucAKzosMtWU=; b=4yUrxt0t6oLNErqqiIURImOTWc
	VTyEoT7r0Tsz9pZs1s2PkVwy72buEPsnPVO1zifkA3pt9Ol+SxgSTFJj1hv0iojjRVtd7vgQ/u8JI
	/2tvqFKuLI10SvM3RkKOGgCmMo4W9aFrM/0IEUuPsWATwUGfnSXaIkrzOrh4JnWMuy+nnABYbLv8S
	04SX9yEj9ENoPfCPE+6ta95wl4jB+y5zOirZG558W+qscQjhdXqaBFvrU6TghUWQpqDOS/pIZ9nQk
	Twej2tWTA/05YCkYgYOC1VaAFLXLcUIndGlXEsiK/st+PPkt695QvweGI+n0NlyqqErMeVebcGfXJ
	NaJBQ+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuiBM-00000001MIA-0sId;
	Tue, 24 Feb 2026 02:29:52 +0000
Received: from mail-m3292.qiye.163.com ([220.197.32.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuiBI-00000001MHi-3wBZ;
	Tue, 24 Feb 2026 02:29:50 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 34be19b08;
	Tue, 24 Feb 2026 10:29:38 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
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
 mhi@lists.linux.dev, Jan Dabros <jsd@semihalf.com>,
 linux-i2c@vger.kernel.org, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, linux-spi@vger.kernel.org,
 Jonathan Derrick <jonathan.derrick@linux.dev>, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 0/37] PCI/MSI: Enforce explicit IRQ vector management by
 removing devres auto-free
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
 <CAHp75VeWD5A0r7-Uayyte1ZXXxdhLixd+z_y0xNeki0N+Ro=jQ@mail.gmail.com>
 <cb878741-7b61-b72c-5a72-6ed6d5091b1f@rock-chips.com>
 <aZyQmc7nOt87jitX@smile.fi.intel.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <f2ea12bb-d90a-2b5e-eb4f-fabb3b702ca5@rock-chips.com>
Date: Tue, 24 Feb 2026 10:29:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <aZyQmc7nOt87jitX@smile.fi.intel.com>
X-HM-Tid: 0a9c8d7b0eac09cckunm431e2ebe9c2487
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk1JSlYfQ0xKSUgZSExJTR5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0
	pVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=D1NXrLDXYu05Q03TAx05oty8f+yTvVFdBAZyiSUmQKIY0HvT8qR+fZzXAm5BOQ41zzptRcoWbADvnv7drXshfBmn85RqQEDxVHw/jKK+KYsM4769ieUIh+QcpalR29uuc0K0fEj0iBdlNJUhOg6fCPz7HghkYa/b9akRJdf4g50=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=913DgA+wi5Qtxbiu+wfSgg50lMszTH4hoG4VFZ28+hE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_182949_154217_ACC84928 
X-CRM114-Status: GOOD (  23.48  )
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

5ZyoIDIwMjYvMDIvMjQg5pif5pyf5LqMIDE6MzgsIEFuZHkgU2hldmNoZW5rbyDlhpnpgZM6Cj4g
T24gVHVlLCBGZWIgMjQsIDIwMjYgYXQgMTI6MDk6MzdBTSArMDgwMCwgU2hhd24gTGluIHdyb3Rl
Ogo+PiDlnKggMjAyNi8wMi8yMyDmmJ/mnJ/kuIAgMjM6NTAsIEFuZHkgU2hldmNoZW5rbyDlhpnp
gZM6Cj4+PiBPbiBNb24sIEZlYiAyMywgMjAyNiBhdCA1OjMy4oCvUE0gU2hhd24gTGluIDxzaGF3
bi5saW5Acm9jay1jaGlwcy5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4gVGhpcyBwYXRjaCBzZXJpZXMg
YWRkcmVzc2VzIGEgbG9uZy1zdGFuZGluZyBkZXNpZ24gaXNzdWUgaW4gdGhlIFBDSS9NU0kKPj4+
PiBzdWJzeXN0ZW0gd2hlcmUgdGhlIGltcGxpY2l0LCBhdXRvbWF0aWMgbWFuYWdlbWVudCBvZiBJ
UlEgdmVjdG9ycyBieQo+Pj4+IHRoZSBkZXZyZXMgZnJhbWV3b3JrIGNvbmZsaWN0cyB3aXRoIGV4
cGxpY2l0IGRyaXZlciBjbGVhbnVwLCBjcmVhdGluZwo+Pj4+IGFtYmlndWl0eSBhbmQgcG90ZW50
aWFsIHJlc291cmNlIG1hbmFnZW1lbnQgYnVncy4KPj4+Pgo+Pj4+ID09PT0gVGhlIFByb2JsZW06
IEltcGxpY2l0IHZzLiBFeHBsaWNpdCBNYW5hZ2VtZW50ID09PT0KPj4+PiBIaXN0b3JpY2FsbHks
IGBwY2ltX2VuYWJsZV9kZXZpY2UoKWAgbm90IG9ubHkgbWFuYWdlcyBzdGFuZGFyZCBQQ0kgcmVz
b3VyY2VzCj4+Pj4gKEJBUnMpIHZpYSBkZXZyZXMgYnV0IGFsc28gaW1wbGljaXRseSB0cmlnZ2Vy
cyBhdXRvbWF0aWMgSVJRIHZlY3RvciBtYW5hZ2VtZW50Cj4+Pj4gYnkgc2V0dGluZyBhIGZsYWcg
dGhhdCByZWdpc3RlcnMgYHBjaW1fbXNpX3JlbGVhc2UoKWAgYXMgYSBjbGVhbnVwIGFjdGlvbi4K
Pj4+Pgo+Pj4+IFRoaXMgY3JlYXRlcyBhbiBhbWJpZ3VvdXMgb3duZXJzaGlwIG1vZGVsLiBNYW55
IGRyaXZlcnMgZm9sbG93IGEgcGF0dGVybiBvZjoKPj4+PiAxLiBDYWxsaW5nIGBwY2lfYWxsb2Nf
aXJxX3ZlY3RvcnMoKWAgdG8gYWxsb2NhdGUgaW50ZXJydXB0cy4KPj4+PiAyLiBBbHNvIGNhbGxp
bmcgYHBjaV9mcmVlX2lycV92ZWN0b3JzKClgIGluIHRoZWlyIGVycm9yIHBhdGhzIG9yIHJlbW92
ZSByb3V0aW5lcy4KPj4+Pgo+Pj4+IFdoZW4gc3VjaCBhIGRyaXZlciBhbHNvIHVzZXMgYHBjaW1f
ZW5hYmxlX2RldmljZSgpYCwgdGhlIGRldnJlcyBmcmFtZXdvcmsgbWF5Cj4+Pj4gYXR0ZW1wdCB0
byBmcmVlIHRoZSBJUlEgdmVjdG9ycyBhIHNlY29uZCB0aW1lIHVwb24gZGV2aWNlIHJlbGVhc2Us
IGxlYWRpbmcgdG8KPj4+PiBhIGRvdWJsZS1mcmVlLiBBbmFseXNpcyBvZiB0aGUgdHJlZSBzaG93
cyB0aGlzIGhhemFyZG91cyBwYXR0ZXJuIGV4aXN0cyB3aWRlbHksCj4+Pj4gd2hpbGUgMzUgb3Ro
ZXIgZHJpdmVycyBjb3JyZWN0bHkgcmVseSBzb2xlbHkgb24gdGhlIGltcGxpY2l0IGNsZWFudXAu
Cj4+Pgo+Pj4gSXMgdGhpcyBjb25maXJtZWQ/IFdoYXQgSSByZWFkIGZyb20gdGhlIGNvdmVyIGxl
dHRlciwgdGhpcyBzZXJpZXMgd2FzCj4+PiBvbmx5IGNvbXBpbGUtdGVzdGVkLCBzbyBob3cgY2Fu
IHlvdSBwcm92ZSB0aGUgcHJvYmxlbSBleGlzdHMgaW4gdGhlCj4+PiBmaXJzdCBwbGFjZT8KPj4K
Pj4gWWVzLCBpdCdzIGNvbmZpcm1lZC4gTXkgZGVidWcgb2YgYSBkb3VibGUgZnJlZSBpc3N1ZSBv
ZiBhIG91dC1vZi10cmVlCj4+IFBDSWUgd2lmaSBkcml2ZXIgd2hpY2ggdXNlcwo+PiBwY2ltX2Vu
YWJsZV9kZXZpY2UgKyBwY2lfYWxsb2NfaXJxX3ZlY3RvcnMgKyBwY2lfZnJlZV9pcnFfdmVjdG9y
cyBleHBvc2UKPj4gaXQuIEFuZCB3ZSBkaWQgaGF2ZSBhIFRPRE8gdG8gY2xlYW51cCB0aGlzIGh5
YnJpZCB1c2FnZSwgdGFyZ2V0ZWQgaW4KPj4gdGhpcyBjeWNsZVsxXSBzdWdnZXN0ZWQgYnkgUGhp
bGlwcDoKPiAKPiBPa2F5LCBmYWlyIGVub3VnaC4gSSB0aGluayB0aGlzIGJpdCB3YXMgbWlzc2lu
ZyBpbiB0aGUgY292ZXIgbGV0dGVyLgo+IAo+PiBbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGNpL3BjaS5naXQvbG9nLz9oPW1zaQo+IAo+Pj4+ID09
PT0gVGhlIFNvbHV0aW9uOiBNYWtpbmcgTWFuYWdlbWVudCBFeHBsaWNpdCA9PT09Cj4+Pj4gVGhp
cyBzZXJpZXMgZW5mb3JjZXMgYSBjbGVhciwgcHJlZGljdGFibGUgbW9kZWw6Cj4+Pj4gMS4gIE5l
dyBNYW5hZ2VkIEFQSSAoUGF0Y2ggMS8zNyk6IEludHJvZHVjZXMgcGNpbV9hbGxvY19pcnFfdmVj
dG9ycygpIGFuZAo+Pj4+ICAgICAgIHBjaW1fYWxsb2NfaXJxX3ZlY3RvcnNfYWZmaW5pdHkoKS4g
RHJpdmVycyB0aGF0IGRlc2lyZSBkZXZyZXMtbWFuYWdlZCBJUlEKPj4+PiAgICAgICB2ZWN0b3Jz
IHNob3VsZCB1c2UgdGhlc2UgZnVuY3Rpb25zLCB3aGljaCBzZXQgdGhlIGlzX21zaV9tYW5hZ2Vk
IGZsYWcgYW5kCj4+Pj4gICAgICAgZW5zdXJlIGF1dG9tYXRpYyBjbGVhbnVwLgo+Pj4+IDIuICBQ
YXRjaGVzIDIgdGhyb3VnaCAzNiBjb252ZXJ0IGVhY2ggZHJpdmVyIHRoYXQgdXNlcyBwY2ltX2Vu
YWJsZV9kZXZpY2UoKSBhbG9uZ3NpZGUKPj4+PiAgICAgICBwY2lfYWxsb2NfaXJxX3ZlY3RvcnMo
KSBhbmQgcmVsaWVzIG9uIGRldnJlcyBmb3IgSVJRIHZlY3RvciBjbGVhbnVwIHRvIGluc3RlYWQK
Pj4+PiAgICAgICBtYWtlIGFuIGV4cGxpY2l0IGNhbGwgdG8gcGNpbV9hbGxvY19pcnFfdmVjdG9y
cygpLgo+Pj4+IDMuICBDb3JlIENoYW5nZSAoUGF0Y2ggMzcvMzcpOiBXaXRoIHRoZSBmb3JtZXIg
Y2xlYW51cCwgbm93IG1vZGlmaWVzIHBjaW1fc2V0dXBfbXNpX3JlbGVhc2UoKQo+Pj4+ICAgICAg
IHRvIGNoZWNrIG9ubHkgdGhlIGlzX21zaV9tYW5hZ2VkIGZsYWcuIFRoaXMgZGVjb3VwbGVzIGF1
dG9tYXRpYyBJUlEgY2xlYW51cCBmcm9tCj4+Pj4gICAgICAgcGNpbV9lbmFibGVfZGV2aWNlKCku
IElSUSB2ZWN0b3JzIGFsbG9jYXRlZCB2aWEgcGNpX2FsbG9jX2lycV92ZWN0b3JzKigpCj4+Pj4g
ICAgICAgYXJlIG5vdyBzb2xlbHkgdGhlIGRyaXZlcidzIHJlc3BvbnNpYmlsaXR5IHRvIGZyZWUg
d2l0aCBwY2lfZnJlZV9pcnFfdmVjdG9ycygpLgo+Pj4+Cj4+Pj4gV2l0aCB0aGVzZSBjaGFuZ2Vz
LCB3ZSBjbGVhciBvd25lcnNoaXAgbW9kZWw6IEV4cGxpY2l0IHJlc291cmNlIG1hbmFnZW1lbnQg
ZWxpbWluYXRlcwo+Pj4+IGFtYmlndWl0eSBhbmQgZm9sbG93cyB0aGUgInByaW5jaXBsZSBvZiBs
ZWFzdCBzdXJwcmlzZS4iIE5ldyBkcml2ZXJzIGNob29zZSBvbmUgbW9kZWwgYW5kCj4+Pj4gYmUg
Y29uc2lzdGVudC4KPj4+PiAtIFVzZSBgcGNpX2FsbG9jX2lycV92ZWN0b3JzKClgICsgYHBjaV9m
cmVlX2lycV92ZWN0b3JzKClgIGZvciBleHBsaWNpdCBjb250cm9sLgo+Pj4+IC0gVXNlIGBwY2lt
X2FsbG9jX2lycV92ZWN0b3JzKClgIGZvciBkZXZyZXMtbWFuYWdlZCwgYXV0b21hdGljIGNsZWFu
dXAuCj4+Pgo+Pj4gSGF2ZSB5b3UgY2hlY2tlZCBwcmV2aW91cyBhdHRlbXB0cz8gV2h5IGlzIHlv
dXIgc2VyaWVzIGJldHRlciB0aGFuIHRob3NlPwo+PgoKVGhhbmtzIGZvciBzaGFyaW5nIHRoaXMg
NS15ZWFycy1vbGQgZGlzY3Vzc3Rpb24sIEkgdG90YWxseSBtaXNzZWQgaXQuCgpJIHJlYWQgdGhl
IFY3IGRpc2N1c3Npb24sIGFuZCBpdCBzZWVtcyB0byBoYXZlIGRpc2FwcGVhcmVkIHdpdGhvdXQg
bXVjaApmb2xsb3ctdXAsIGxpa2UgYSBzdG9uZSBkcm9wcGVkIGludG8gdGhlIG9jZWFuLiBGb3Ig
Zml2ZSB5ZWFycywgbmV3bHkKYWRkZWQgZHJpdmVycyBoYXZlIGNvbnRpbnVlZCB0byBtaXN1c2Ug
dGhlc2UgQVBJcyBpbmNvcnJlY3RseSwgYW5kCndl4oCZdmUgYmVlbiB3YXRjaGluZyBpdCBoYXBw
ZW4uIEkgY2Fu4oCZdCByZWFsbHkgY2xhaW0gdGhpcyBwYXRjaCBzZXJpZXMKaXMgaW5oZXJlbnRs
eSBiZXR0ZXIgdGhhbiBEZWppbuKAmXMgZWFybGllciB3b3JrIGF0IGl0cyBjb3JlLCB0aGlzIGlz
Cmp1c3QgYWJvdXQgZml4aW5nIG9uZSBlbnRpcmUgY2F0ZWdvcnkgb2YgbWlzdXNlIGluIGEgc2lu
Z2xlIHBhc3MuCgpBY2NvcmRpbmcgdG8gQmpvcm4ncyBmaW5hbCBzZWFyY2ggYW5kIHJlcGx5LCBp
ZiB3ZSBpbmNsdWRlIHRoZSByZW1vdmFsCm9mIGRlcHJlY2F0ZWQgQVBJcywgaXQgd291bGQgcmVx
dWlyZSBhIG1hc3NpdmUgYW1vdW50IG9mIHdvcmsgYW5kIG1pZ2h0CnNwYW4gbWFueSByZWxlYXNl
IGN5Y2xlcy4gVW5mb3J0dW5hdGVseSwgdGhlIHdvcmsgbmV2ZXIgYmVnYW4sIGFuZCB0aGUKY2xl
YW51cCBtaWdodCBuZXZlciBiZSBjb21wbGV0ZWQuIEnigJltIG5vdCBzdXJlIGlmIGZvbGtzIGhh
dmUgY2hhbmdlZAp0aGVpciBtaW5kcyBub3cuIENhbiB3ZSBhdCBsZWFzdCBzdGFydCBieSBjb21w
bGV0aW5nIHRoZSBjaGFuZ2VzIGZvciB0aGUKcGNpX2FsbG9jX2lycV92ZWN0b3JzIGNhdGVnb3J5
PwoKCj4+IFRoZXJlIHNlZW1zIG5vdCBwcmV2aW91cyBhdHRlbXB0cy4KPiAKPiBNYXliZSB3ZSBh
cmUgbG9va2luZyB0byB0aGUgZGlmZmVyZW50IHByb2plY3RzLi4uCj4gCj4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLz9xPXBjaW1fYWxsb2NfaXJxX3ZlY3RvcnMKPiAKPj4+PiA9PT09IFRl
c3RpbmcgQW5kIFJldmlldyA9PT09Cj4+Pj4gMS4gVGhpcyBzZXJpZXMgaXMgb25seSBjb21waWxl
ZCB0ZXN0IHdpdGggYWxsbW9kY29uZmlnLgo+Pj4+IDIuIEdpdmVuIHRoZSBzdWJzdGFudGlhbCBz
aXplIG9mIHRoaXMgcGF0Y2ggc2VyaWVzLCBJIGhhdmUgc3RydWN0dXJlZCB0aGUgbWFpbGluZwo+
Pj4+ICAgICAgdG8gZmFjaWxpdGF0ZSBlZmZpY2llbnQgcmV2aWV3LiBUaGUgY292ZXIgbGV0dGVy
LCB0aGUgZmlyc3QgcGF0Y2ggYW5kIHRoZSBsYXN0IG9uZSB3aWxsIGJlIHNlbnQKPj4+PiAgICAg
IHRvIGFsbCByZWxldmFudCBtYWlsaW5nIGxpc3RzIGFuZCBrZXkgbWFpbnRhaW5lcnMgdG8gZW5z
dXJlIGJyb2FkIHZpc2liaWxpdHkgYW5kCj4+Pj4gICAgICBpbml0aWFsIGZlZWRiYWNrIG9uIHRo
ZSBvdmVyYWxsIGFwcHJvYWNoLiBUaGUgcmVtYWluaW5nIHN1YnN5c3RlbS1zcGVjaWZpYyBwYXRj
aGVzCj4+Pj4gICAgICB3aWxsIGJlIHNlbnQgb25seSB0byB0aGUgcmVzcGVjdGl2ZSBzdWJzeXN0
ZW0gbWFpbnRhaW5lcnMgYW5kIHRoZWlyIGFzc29jaWF0ZWQKPj4+PiAgICAgIG1haWxpbmcgbGlz
dHMsIHJlZHVjaW5nIG5vaXNlLgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
