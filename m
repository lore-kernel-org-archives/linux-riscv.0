Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFA3C83030
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 07:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlNMJthkTFtpN4o+ykAvsZbp9A5VzHeobR1WEj2Cpjg=; b=PTQf7GWLh8hm1n
	RJjpr/OE1bdwPio/fccmKrGOIuASxdQ5pjSE8VMCb10zR3qPkgwYnuk4fmIAFbEmfR2yWCCVUvsEE
	yRNLnUqQx8585lRCFoFwHUhX3qhR/8fmkpmB/ZYEJ0IIy6YY3tj+r3Z2390qnVJBEKKNWlvCSKinX
	+CGoJ/28IRaleNxcjhbzikDlv+dzJb2ZbGF7R271QDvAXt5LhMohIwIiMkUNha2n3vjXg+rf0zeKJ
	sCTOBMoFOdVw9R5Kg9p9Z4NiX0X/xLvgOw22YW+DPk/dCXSRfSNadxF6YOXgycZz249IqZ+w8A3hk
	6GzB0aGxlejI2DowAIYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEei-0000000AYS5-2nos;
	Thu, 03 Jul 2025 07:46:52 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEeg-0000000AYR1-1Jkh
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 07:46:52 +0000
Received: from [192.168.33.13] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowABXg6ddNWZodWypAA--.34433S2;
	Thu, 03 Jul 2025 15:46:38 +0800 (CST)
Message-ID: <ce2881b9-38ed-42b6-824d-72948389e8fa@iscas.ac.cn>
Date: Thu, 3 Jul 2025 15:46:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 5/5] riscv: dts: spacemit: Add Ethernet
 support for Jupiter
To: Junhui Liu <junhui.liu@pigmoral.tech>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, Lukas Bulwahn <lukas.bulwahn@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250702-net-k1-emac-v3-0-882dc55404f3@iscas.ac.cn>
 <20250702-net-k1-emac-v3-5-882dc55404f3@iscas.ac.cn>
 <a2284afb-ee61-457e-aaa8-49a9ce3838f9@pigmoral.tech>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <a2284afb-ee61-457e-aaa8-49a9ce3838f9@pigmoral.tech>
X-CM-TRANSID: qwCowABXg6ddNWZodWypAA--.34433S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAFy8Ar4fAFWkXFy8uF1fXrb_yoW5Cr4rpF
	Z5JFZ3ArW7Grn3Jr13JryDuF98Cr18J3WkWrn7XF1UJF42vryYgr1jqr1qgr1UJr48Xr15
	Zr1jvrs7urnrtrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmmb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4xvF2IEb7IF0Fy264kE64k0F24l
	FcxC0VAYjxAxZF0Ex2IqxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZV
	WrXwCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
	x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
	v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
	x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
	Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJwCE64xvF2IEb7IF0Fy7
	YxBIdaVFxhVjvjDU0xZFpf9x07jHLvNUUUUU=
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_004650_714228_7381055A 
X-CRM114-Status: GOOD (  12.49  )
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

SGkgSnVuaHVpLA0KDQpPbiA3LzMvMjUgMTQ6NDgsIEp1bmh1aSBMaXUgd3JvdGU6DQo+IEhpIFZp
dmlhbiwNCj4gVGhhbmtzIGZvciB5b3Ugd29yayENCj4NCj4gT24gMjAyNS83LzIgMTQ6MDEsIFZp
dmlhbiBXYW5nIHdyb3RlOg0KPj4gTWlsay1WIEp1cGl0ZXIgdXNlcyBhbiBSR01JSSBQSFkgZm9y
IGVhY2ggcG9ydCBhbmQgdXNlcyBHUElPIGZvciBQSFkNCj4+IHJlc2V0Lg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IFZpdmlhbiBXYW5nIDx3YW5ncnVpa2FuZ0Bpc2Nhcy5hYy5jbj4NCj4NCj4gU3Vj
Y2Vzc2Z1bGx5IHRlc3RlZCB3aXRoIGlwZXJmMyBvbiBNaWxrLVYgSnVwaXRlci4NCj4NCj4gVENQ
IFJ4OiA5NDEgTWJpdHMvc2VjDQo+IFRDUCBUeDogOTQzIE1iaXRzL3NlYw0KPiBVRFAgUng6IDk1
NiBNYml0cy9zZWMNCj4gVURQIFR4OiA5NTYgTWJpdHMvc2VjDQo+DQo+IFRlc3RlZC1ieTogSnVu
aHVpIExpdSA8anVuaHVpLmxpdUBwaWdtb3JhbC50ZWNoPsKgDQo+DQpUaGFua3MgZm9yIHRoZSB0
ZXN0aW5nISBJIGRvIG5vdCBoYXZlIGEgTWlsay1WIEp1cGl0ZXIgaGFuZHksIHNvIHRoYXQNCndh
cyB2ZXJ5IGhlbHBmdWwuDQoNCkFzIGRpc2N1c3NlZCBbMV0sIEkgd2lsbCBwb3N0IGEgdjQgc29v
biB3aXRoIG1pbm9yIGZpeGVzIGFuZCBhbHNvIHNhbnMNCnRoZSBEVFMgY2hhbmdlcy4gSSB3aWxs
IHB1dCB5b3VyIFRlc3RlZC1ieSBvbiB0aGUgZHJpdmVyIHBhdGNoIGluc3RlYWQNCm9mIHRoaXMg
RFRTIHBhdGNoLCBzbyBpdCB3aWxsIHNob3cgdXAgaW4gdjQuDQoNCkFyZSB5b3Ugb2theSB3aXRo
IHRoaXM/IElmIHlvdSBkb24ndCBsaWtlIGl0IGZlZWwgZnJlZSB0byB0ZWxsIG1lLg0KDQpSZWdh
cmRzLA0KVml2aWFuICJkcmFtZm9yZXZlciIgV2FuZw0KDQpbMV06IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3NwYWNlbWl0L2E5Y2FkMDdjLTA5NzMtNDNjMy04OWYzLTk1Yjg1NmI1NzVkZkBpc2Nh
cy5hYy5jbi8NCg0KPj4gLS0tDQo+PiDCoCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sx
LW1pbGt2LWp1cGl0ZXIuZHRzIHwgNDYNCj4+ICsrKysrKysrKysrKysrKysrKysrKysrDQo+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLW1pbGt2LWp1cGl0ZXIuZHRzDQo+PiBiL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtbWlsa3YtanVwaXRlci5kdHMNCj4+IGluZGV4
DQo+PiA0NDgzMTkyMTQxMDQ5Y2FhMjAxYzA5M2ZiMjA2YjYxMzRhMDY0ZjQyLi5jNTkzMzU1NWMw
NmI2NmY0MGU2MWZlMmI5YzE1OWJhMDc3MGMyZmExDQo+PiAxMDA2NDQNCj4+IC0tLSBhL2FyY2gv
cmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtbWlsa3YtanVwaXRlci5kdHMNCj4+ICsrKyBiL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtbWlsa3YtanVwaXRlci5kdHMNCj4+IEBAIC0y
MCw2ICsyMCw1MiBAQCBjaG9zZW4gew0KPj4gwqDCoMKgwqDCoCB9Ow0KPj4gwqAgfTsNCj4+IMKg
ICsmZXRoMCB7DQo+PiArwqDCoMKgIHBoeS1oYW5kbGUgPSA8JnJnbWlpMD47DQo+PiArwqDCoMKg
IHBoeS1tb2RlID0gInJnbWlpLWlkIjsNCj4+ICvCoMKgwqAgcGluY3RybC1uYW1lcyA9ICJkZWZh
dWx0IjsNCj4+ICvCoMKgwqAgcGluY3RybC0wID0gPCZnbWFjMF9jZmc+Ow0KPj4gK8KgwqDCoCBy
eC1pbnRlcm5hbC1kZWxheS1wcyA9IDwwPjsNCj4+ICvCoMKgwqAgdHgtaW50ZXJuYWwtZGVsYXkt
cHMgPSA8MD47DQo+PiArwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsNCj4+ICsNCj4+ICvCoMKgwqAg
bWRpby1idXMgew0KPj4gK8KgwqDCoMKgwqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDB4MT47DQo+
PiArwqDCoMKgwqDCoMKgwqAgI3NpemUtY2VsbHMgPSA8MHgwPjsNCj4+ICsNCj4+ICvCoMKgwqDC
oMKgwqDCoCByZXNldC1ncGlvcyA9IDwmZ3BpbyBLMV9HUElPKDExMCkgR1BJT19BQ1RJVkVfTE9X
PjsNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXNldC1kZWxheS11cyA9IDwxMDAwMD47DQo+PiArwqDC
oMKgwqDCoMKgwqAgcmVzZXQtcG9zdC1kZWxheS11cyA9IDwxMDAwMDA+Ow0KPj4gKw0KPj4gK8Kg
wqDCoMKgwqDCoMKgIHJnbWlpMDogcGh5QDEgew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmVnID0gPDB4MT47DQo+PiArwqDCoMKgwqDCoMKgwqAgfTsNCj4+ICvCoMKgwqAgfTsNCj4+ICt9
Ow0KPj4gKw0KPj4gKyZldGgxIHsNCj4+ICvCoMKgwqAgcGh5LWhhbmRsZSA9IDwmcmdtaWkxPjsN
Cj4+ICvCoMKgwqAgcGh5LW1vZGUgPSAicmdtaWktaWQiOw0KPj4gK8KgwqDCoCBwaW5jdHJsLW5h
bWVzID0gImRlZmF1bHQiOw0KPj4gK8KgwqDCoCBwaW5jdHJsLTAgPSA8JmdtYWMxX2NmZz47DQo+
PiArwqDCoMKgIHJ4LWludGVybmFsLWRlbGF5LXBzID0gPDA+Ow0KPj4gK8KgwqDCoCB0eC1pbnRl
cm5hbC1kZWxheS1wcyA9IDwyNTA+Ow0KPj4gK8KgwqDCoCBzdGF0dXMgPSAib2theSI7DQo+PiAr
DQo+PiArwqDCoMKgIG1kaW8tYnVzIHsNCj4+ICvCoMKgwqDCoMKgwqDCoCAjYWRkcmVzcy1jZWxs
cyA9IDwweDE+Ow0KPj4gK8KgwqDCoMKgwqDCoMKgICNzaXplLWNlbGxzID0gPDB4MD47DQo+PiAr
DQo+PiArwqDCoMKgwqDCoMKgwqAgcmVzZXQtZ3Bpb3MgPSA8JmdwaW8gSzFfR1BJTygxMTUpIEdQ
SU9fQUNUSVZFX0xPVz47DQo+PiArwqDCoMKgwqDCoMKgwqAgcmVzZXQtZGVsYXktdXMgPSA8MTAw
MDA+Ow0KPj4gK8KgwqDCoMKgwqDCoMKgIHJlc2V0LXBvc3QtZGVsYXktdXMgPSA8MTAwMDAwPjsN
Cj4+ICsNCj4+ICvCoMKgwqDCoMKgwqDCoCByZ21paTE6IHBoeUAxIHsNCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJlZyA9IDwweDE+Ow0KPj4gK8KgwqDCoMKgwqDCoMKgIH07DQo+PiArwqDC
oMKgIH07DQo+PiArfTsNCj4+ICsNCj4+IMKgICZ1YXJ0MCB7DQo+PiDCoMKgwqDCoMKgIHBpbmN0
cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+PiDCoMKgwqDCoMKgIHBpbmN0cmwtMCA9IDwmdWFydDBf
Ml9jZmc+Ow0KPj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
