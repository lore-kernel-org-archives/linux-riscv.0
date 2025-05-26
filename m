Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA10C5AD49
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 16:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9ZaduDj0gaLwaauaKtLIT2w242XPyzZnvvalp4KGKM=; b=D/+ijMfixsaVab
	rhOsVGLz0t2HWKbwpjS8c4EFSV57jjHLq5NhOM+AJeNnObIZN4b/jkzL1PK1BLhZynoOgCJrpAw+n
	pGWT//ByUKqm8EmmCdBdRJM9NrZ+7uFt20JmjLVmC6FBgq33CUizXU1spb8M1dytE4w3pMYZN02Xj
	dcIz0IQjGRXtqukp2sCxcssuqtQabmFxxx0Aae2GGLU9zrJwOmlKXuQT+v/NrXvs9itB2qxYtZliT
	iiyOaKpD33nc0leeAaQ/R6wRAjM+/xrulV8hEi3/6RJPLtgp1plg3f+UzfROyFGyLm5v0QVA0Fkb3
	ieU/Cpm4P9PTsd7W80yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJaSM-00000009CyJ-1l5G;
	Mon, 26 May 2025 16:13:42 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJaSE-00000009CwU-1WBd;
	Mon, 26 May 2025 16:13:41 +0000
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [113.57.237.88])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16718ef7d;
	Tue, 27 May 2025 00:13:22 +0800 (GMT+08:00)
Message-ID: <0a90fb41-6e24-464f-bf2b-cdd76bfb7f08@whut.edu.cn>
Date: Tue, 27 May 2025 00:13:22 +0800
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v4 3/4] phy: spacemit: support K1 USB2.0 PHY controller
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250526-b4-k1-usb3-phy-v2-v4-0-eca668fc16a2@whut.edu.cn>
 <20250526-b4-k1-usb3-phy-v2-v4-3-eca668fc16a2@whut.edu.cn>
 <39e6b2e7-2aae-4f11-8cb0-2e911c2d7793@linaro.org>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <39e6b2e7-2aae-4f11-8cb0-2e911c2d7793@linaro.org>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTRhKVhodHU5CSB0ZSk9MH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkhVTkxVSUhMVUNDWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a970d5ebe4303a1kunmdb12c2341c809
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pwg6Dyo6FzE6Pgw6GDQ4SywU
	PRIwC0pVSlVKTE9DSUxNS0tMTk9OVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlK
	SkhVTkxVSUhMVUNDWVdZCAFZQUlCTk83Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_091334_656330_200F0BC7 
X-CRM114-Status: GOOD (  13.15  )
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

T24gNS8yNi8yNSAxMTo1MSBQTSwgbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZyB3cm90ZToKPiBI
aSwKPgo+IE9uIDI2LzA1LzIwMjUgMTY6MzEsIFplIEh1YW5nIHdyb3RlOgo+PiBUaGUgU3BhY2Vt
aVQgSzEgU29DIGluY2x1ZGVzIHRocmVlIFVTQiBwb3J0czoKPj4KPj4gLSBPbmUgVVNCMi4wIE9U
RyBwb3J0Cj4+IC0gT25lIFVTQjIuMCBob3N0LW9ubHkgcG9ydAo+PiAtIE9uZSBVU0IzLjAgcG9y
dCB3aXRoIGFuIGludGVncmF0ZWQgVVNCMi4wIERSRCBpbnRlcmZhY2UKPj4KPj4gRWFjaCBvZiB0
aGVzZSBwb3J0cyBpcyBjb25uZWN0ZWQgdG8gYSBVU0IyLjAgUEhZIHJlc3BvbnNpYmxlIGZvciBV
U0IyCj4+IHRyYW5zbWlzc2lvbi4KPj4KPj4gVGhpcyBjb21taXQgYWRkcyBzdXBwb3J0IGZvciB0
aGUgU3BhY2VtaVQgSzEgVVNCMi4wIFBIWSwgd2hpY2ggaXMKPj4gY29tcGxpYW50IHdpdGggdGhl
IFVTQiAyLjAgc3BlY2lmaWNhdGlvbiBhbmQgc3VwcG9ydHMgYm90aCA4LWJpdCA2ME1Iego+PiBh
bmQgMTYtYml0IDMwTUh6IHBhcmFsbGVsIGludGVyZmFjZXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IFplIEh1YW5nIDxodWFuZ3plQHdodXQuZWR1LmNuPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9waHkv
S2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPj4gwqAgZHJp
dmVycy9waHkvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+
PiDCoCBkcml2ZXJzL3BoeS9zcGFjZW1pdC9LY29uZmlnwqDCoMKgwqDCoMKgIHzCoCAxMyArKysr
Cj4+IMKgIGRyaXZlcnMvcGh5L3NwYWNlbWl0L01ha2VmaWxlwqDCoMKgwqDCoCB8wqDCoCAyICsK
Pj4gwqAgZHJpdmVycy9waHkvc3BhY2VtaXQvcGh5LWsxLXVzYjIuYyB8IDEzMSAKPj4gKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiDCoCA1IGZpbGVzIGNoYW5nZWQsIDE0
OCBpbnNlcnRpb25zKCspCj4+Ci4uLgo+PiArCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBzcGFjZW1pdF91c2IycGh5X2R0X21hdGNoW10gPSB7Cj4+ICvCoMKgwqAgeyAuY29t
cGF0aWJsZSA9ICJzcGFjZW1pdCxrMS11c2IyLXBoeSIsIH0sCj4+ICvCoMKgwqAgeyAvKiBzZW50
aW5hbCAqLyB9Cj4KPiA9PiBzZW50aW5lbAoKVGhhbmtzIQoKPgo+PiArfTsKPj4gK01PRFVMRV9E
RVZJQ0VfVEFCTEUob2YsIHNwYWNlbWl0X3VzYjJwaHlfZHRfbWF0Y2gpOwo+PiArCj4+ICtzdGF0
aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzcGFjZW1pdF91c2IyX3BoeV9kcml2ZXIgPSB7Cj4+
ICvCoMKgwqAgLnByb2JlwqDCoMKgID0gc3BhY2VtaXRfdXNiMnBoeV9wcm9iZSwKPj4gK8KgwqDC
oCAuZHJpdmVyID0gewo+PiArwqDCoMKgwqDCoMKgwqAgLm5hbWXCoMKgID0gInNwYWNlbWl0LXVz
YjItcGh5IiwKPj4gK8KgwqDCoMKgwqDCoMKgIC5vZl9tYXRjaF90YWJsZSA9IHNwYWNlbWl0X3Vz
YjJwaHlfZHRfbWF0Y2gsCj4+ICvCoMKgwqAgfSwKPj4gK307Cj4+ICttb2R1bGVfcGxhdGZvcm1f
ZHJpdmVyKHNwYWNlbWl0X3VzYjJfcGh5X2RyaXZlcik7Cj4+ICsKPj4gK01PRFVMRV9ERVNDUklQ
VElPTigiU3BhY2VtaXQgVVNCIDIuMCBQSFkgZHJpdmVyIik7Cj4+ICtNT0RVTEVfTElDRU5TRSgi
R1BMIik7Cj4+Cj4KPiBJdCBsb29rcyBmaW5lLCBidXQgd2h5IGRpZG4ndCBhbHNvIGNvbnZlcnQg
dGhpZCBkcml2ZXIgdG8gcmVnbWFwID8KCldpbGwgZG8KCj4KPiBUaGFua3MsCj4gTmVpbAo+Cj4K
PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
