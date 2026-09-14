Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D4BC88E72
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 15:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRzQW/JLHSfvrwohEBO9xqxDSvaJAhZjJ4WAl8iIvMQ=; b=FGjDUywJjCofpQ
	pjD4FUKGlx4K9IV+6+NLpge0BY0SyoSDaZwdjUJKbHo0T00XuS6Zv0Y1aE0tCQRbjpTRLuljn91vk
	xSLma6IEu4yFE7T+kgMKs0S9x/OeTB1cdtwNTjnlOE/+Q0VgF/7SPqDxBQs45KZNAJN4uDPgm3gbz
	w6CAtOmeHSF+Of+9XE3y1CNjh9m/ywiUcBi3prHVp4XydJCEXasDRa3c47I1gPmUoJXjgrFXqSpyz
	y/HVzTnq9FDe/NqsI3puzIGumjTe1TCKryPiIQJBTnwpfW9+fsFOpkNm5GcYJqtY260BLVLZBThBe
	3AxGKq9HPbz338NHCoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68tv-00000004Czz-3e2I;
	Mon, 14 Sep 2026 15:47:23 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68to-00000004Cyo-3y2V;
	Mon, 14 Sep 2026 15:47:22 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260914154712euoutp02c5051cd29f404323cd1ce4ebcf1a2814~VOpOJJKAf2060820608euoutp02_;
	Mon, 14 Sep 2026 15:47:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260914154712euoutp02c5051cd29f404323cd1ce4ebcf1a2814~VOpOJJKAf2060820608euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789400832;
	bh=tG6YbD+cncbaU7j7yoO6MEtQ744hWAYh4LfOY6utBYg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=GDO61VSOCVO3k1kf5K78UUt2+RmSvMQDujkUqqiRwIRQp54H3XA3u6HAxA1Bzo9g/
	 tCvyeIbekxEClZFD369Hz0B8bRlNt3ZyQYNKC/wf2QdhH9jD28ZIA21IDZJCW8YtoX
	 k3/tT/pItRCsYTnCqKU6miJvFJQAcAS4lM6izfts=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260914154711eucas1p1a9c438d50d10b5aa67be8d91d3c6bd8b~VOpNwZ4qm0255102551eucas1p1I;
	Mon, 14 Sep 2026 15:47:11 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260914154709eusmtip1d1d42067dc0186ff40e0a824dfe3578c~VOpL4YvZE0990509905eusmtip17;
	Mon, 14 Sep 2026 15:47:09 +0000 (GMT)
Message-ID: <03a707e8-9382-4d48-9bdc-08fbd0131587@samsung.com>
Date: Mon, 14 Sep 2026 17:47:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/19] drm/bridge: starfive: Add JH7110 HDMI
 controller driver
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
	<rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Emil
	Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Heiko Stuebner
	<heiko@sntech.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mfd@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <b9973f9817dc023bb703cc14628fbb5ccca27d33.camel@iscas.ac.cn>
X-CMS-MailID: 20260914154711eucas1p1a9c438d50d10b5aa67be8d91d3c6bd8b
X-Msg-Generator: CA
X-RootMTR: 20260904132735eucas1p2c898afe4a4c6e957a7b9eedff321a6dc
X-EPHeader: CA
X-CMS-RootMailID: 20260904132735eucas1p2c898afe4a4c6e957a7b9eedff321a6dc
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
	<CGME20260904132735eucas1p2c898afe4a4c6e957a7b9eedff321a6dc@eucas1p2.samsung.com>
	<20260904-jh7110-clean-send-v3-14-484f9ae72715@samsung.com>
	<b9973f9817dc023bb703cc14628fbb5ccca27d33.camel@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_084717_597215_BB4FD1C7 
X-CRM114-Status: GOOD (  34.03  )
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

CgpPbiA5LzQvMjYgMTU6MzksIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4g5ZyoIDIwMjYtMDktMDTk
upTnmoQgMTU6MjcgKzAyMDDvvIxNaWNoYWwgV2lsY3p5bnNraeWGmemBk++8mgo+PiBBZGQgdGhl
IEhETUkgY29udHJvbGxlciAoYnJpZGdlKSBkcml2ZXIgZm9yIHRoZSBTdGFyRml2ZSBKSDcxMTAu
Cj4+Cj4+IFRoaXMgZHJpdmVyIGJpbmRzIHRvIHRoZSBzdGFyZml2ZSxqaDcxMTAtaW5uby1oZG1p
LWNvbnRyb2xsZXIgbm9kZS4KPj4gSXQgZ2V0cyBpdHMgc2hhcmVkIHJlZ21hcCBmcm9tIGl0cyBw
YXJlbnQgYW5kIGl0cyByZWdpc3RlciBhY2Nlc3MsCj4+IG1vZHVsZSBhbmQgYnVzIGNsb2NrcyBm
cm9tIHZvdXRjcmcuIEl0IGNvbnN1bWVzIHRoZSBwaXhlbCBjbG9jayBhbmQKPj4gdGhlCj4+IFBI
WSBmcm9tIGl0cyBoZG1pX3BoeSBzaWJsaW5nLgo+Pgo+PiBUaGUgZHJpdmVyIGNhbGxzIHRoZSBn
ZW5lcmljIGlubm9faGRtaV9wcm9iZSBmdW5jdGlvbiBhbmQgcGFzc2VzIHRoZQo+PiBzaGFyZWQg
cmVnbWFwIHRvIGl0LCByZWdpc3RlcmluZyBhcyBhIERSTSBicmlkZ2UuIFRoZSAuZW5hYmxlIGhv
b2sgaXMKPj4gcmVzcG9uc2libGUgZm9yIHNldHRpbmcgdGhlIFBIWSdzIHBpeGVsIGNsb2NrIHJh
dGUgdmlhIGNsa19zZXRfcmF0ZSgpCj4+IGFuZCBwb3dlcmluZyBvbiB0aGUgUEhZIHZpYSBwaHlf
cG93ZXJfb24oKS4KPj4KPj4gVGhlIERDODIwMCBoYXMgdHdvIHBhbmVscywgZWFjaCBleHBvc2lu
ZyBhIERQIGFuZCBhIERQSSBpbnRlcmZhY2UsCj4+IGFuZCBhCj4+IG11eCBpbiB0aGUgdmlkZW8g
b3V0cHV0IHN5c3RlbSBjb250cm9sbGVyIHBpY2tzIHdoaWNoIG9mIHRoZW0gZHJpdmVzCj4+IHRo
ZQo+PiBIRE1JIHRyYW5zbWl0dGVyLiBQcm9ncmFtIHRoYXQgbXV4IGZyb20gdGhlIHBvcnQgZ3Jh
cGggcmF0aGVyIHRoYW4KPj4gcmVseWluZyBvbiB3aGF0ZXZlciB0aGUgYm9vdGxvYWRlciBsZWZ0
IGJlaGluZCwgdGFraW5nIHRoZSBwYW5lbCBmcm9tCj4+IHRoZQo+PiByZW1vdGUgcG9ydCBudW1i
ZXIgYW5kIHRoZSBpbnRlcmZhY2UgZnJvbSB0aGUgcmVtb3RlIGVuZHBvaW50IG51bWJlci4KPj4K
Pj4gVGhlIGdlbmVyaWMgZHJpdmVyIGhvbGRzIHRoZSBjbG9jayBpdCBsb29rcyB1cCBhcyB0aGUg
cmVnaXN0ZXIgYWNjZXNzCj4+IGNsb2NrIGVuYWJsZWQgZm9yIGl0cyBsaWZldGltZSwgYW5kIGRl
cml2ZXMgdGhlIEREQyBkaXZpZGVyIGZyb20gdGhhdAo+PiBjbG9jaydzIHJhdGUsIHNvIHBvaW50
IGl0IGF0IHRoZSBzeXN0ZW0gY2xvY2suIE5hbWluZyB0aGUgcGl4ZWwgY2xvY2sKPj4gdGhlcmUg
aW5zdGVhZCB3b3VsZCBrZWVwIHRoZSBQSFkgcHJlLVBMTCBwb3dlcmVkIGZyb20gcHJvYmUgb253
YXJkcwo+PiBhbmQKPj4gc2l6ZSB0aGUgZGl2aWRlciBmcm9tIHRoZSB3cm9uZyByYXRlLgo+Pgo+
PiBUaGUgUEhZIGNhbiBvbmx5IGdlbmVyYXRlIHRoZSBkaXNjcmV0ZSBzZXQgb2YgcGl4ZWwgY2xv
Y2tzIGRlc2NyaWJlZAo+PiBieQo+PiBpdHMgcHJlLVBMTCB0YWJsZSwgc28gLm1vZGVfdmFsaWQg
cmVqZWN0cyBhbnkgbW9kZSBjbGtfcm91bmRfcmF0ZSgpCj4+IGNhbm5vdCBzYXRpc2Z5LiBXaXRo
b3V0IGl0IHN1Y2ggYSBtb2RlIHdvdWxkIGJlIGFkdmVydGlzZWQgdG8KPj4gdXNlcnNwYWNlCj4+
IGFuZCB0aGUgbW9kZXNldCB3b3VsZCBhcHBlYXIgdG8gc3VjY2VlZCB3aGlsZSB0aGUgZGlzcGxh
eSBzdGF5ZWQKPj4gYmxhbmsuCj4+Cj4+IC5lbmFibGUgcmV0dXJucyBlYXJseSB3aGVuIHRoZSBy
YXRlIGlzIHVuc3VwcG9ydGVkIG9yIHRoZSBQSFkgZmFpbHMKPj4gdG8KPj4gcG93ZXIgb24sIHNv
IHRyYWNrIHdoZXRoZXIgdGhlIHBpeGVsIGNsb2NrIHdhcyBhY3R1YWxseSBlbmFibGVkIGFuZAo+
PiBsZXQKPj4gLmRpc2FibGUgdGVhciBkb3duIG9ubHkgd2hhdCB3YXMgYnJvdWdodCB1cCwgb3Ro
ZXJ3aXNlIHRoZSBjbG9jawo+PiByZWZjb3VudCB1bmRlcmZsb3dzLgo+Pgo+PiBUaGUgY2xvY2tz
IGFuZCB0aGUgcmVzZXQgYXJlIHRvcm4gZG93biB0aHJvdWdoIGRldm0gcmF0aGVyIHRoYW4gZnJv
bQo+PiAucmVtb3ZlLCBzbyB0aGF0IHRoZXkgb3V0bGl2ZSB0aGUgYnJpZGdlIHRoYXQgaW5ub19o
ZG1pX3Byb2JlKCkgYWRkcwo+PiB3aXRoCj4+IGRldm1fZHJtX2JyaWRnZV9hZGQoKS4gUmVsZWFz
aW5nIHRoZW0gaW4gLnJlbW92ZSBydW5zIGJlZm9yZSBkZXZyZXMKPj4gdW53aW5kcyBhbmQgd291
bGQgbGVhdmUgdGhlIGJyaWRnZSByZWdpc3RlcmVkIHdpdGggaXRzIGNsb2NrcyBhbHJlYWR5Cj4+
IGdhdGVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenlu
c2tpQHNhbXN1bmcuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZp
ZyAgICAgICAgICAgIHwgIDExICsrCj4+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL01ha2VmaWxl
ICAgICAgICAgICB8ICAgMSArCj4+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2poNzExMC1pbm5v
LWhkbWkuYyB8IDMxOAo+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gIDMgZmls
ZXMgY2hhbmdlZCwgMzMwIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvS2NvbmZpZwo+PiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZp
Zwo+PiBpbmRleAo+PiA0YTU3ZDQ5YjRjNmQzYWI0Yjk2NTIyODgzNWIzNzJkMTkxNjQ3MTk3Li43
NWIxY2Y2NzI3ZDVhMzIzMTBkY2Y5ZmU1NzMKPj4gNGQ5NWUxNGVlYThmZSAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvS2NvbmZpZwoKW3NuaXBdCgo+PiArCj4+ICsJLyogRGF0YSBtYXBwaW5nOiA4LWJp
dCBSR0Igb24gd2hpY2hldmVyIGludGVyZmFjZSBpcyBpbiB1c2UuCj4+ICovCj4+ICsJbWFzayA9
IFZPVVRfSERNSV9EUElfRFBfU0VMIHwgVk9VVF9IRE1JX0RQX0JJVF9ERVBUSCB8Cj4+ICsJICAg
ICAgIFZPVVRfSERNSV9EUF9ZVVZfTU9ERSB8IFZPVVRfSERNSV9EUElfQklUX0RFUFRIOwo+PiAr
CXZhbCA9IEZJRUxEX1BSRVAoVk9VVF9IRE1JX0RQSV9EUF9TRUwsIGVuZHBvaW50LmlkKSB8Cj4+
ICsJICAgICAgRklFTERfUFJFUChWT1VUX0hETUlfRFBfWVVWX01PREUsCj4+IFZPVVRfSERNSV9E
UF9ZVVZfTU9ERV9SR0IpIHwKPj4gKwkgICAgICBGSUVMRF9QUkVQKFZPVVRfSERNSV9EUElfQklU
X0RFUFRILAo+PiBWT1VUX0hETUlfRFBJX0JJVF9ERVBUSF84QklUKTsKPiAKPiBXZWxsIGl0IGxv
b2tzIGxpa2UgdGhlIHZlbmRvciBkcml2ZXIgbmV2ZXIgc2V0cyBEUCBpbnRlcmZhY2UsIGlzIGl0
Cj4gdGVzdGVkPyBJIGRvdWJ0IHdoZXRoZXIgdGhlIFNvQyBkZXNpZ25lciBtZXNzZWQgaXQgdXAu
CgpUaGUgRFAgaW50ZXJmYWNlIGlzIGRvY3VtZW50ZWQgaW4gdGhlIFRSTSBhbmQgSSd2ZSBhbHNv
IHRlc3RlZCBpdCBzbyBpdApkb2VzIHdvcmsgaW5kZWVkLiBIZXJlIGlzIG15IHRlc3QgYnJhbmNo
IGlmIHlvdSB3b3VsZCBsaWtlIHRvIHNlZSBmb3IKeW91c2VsZi4KClsxXSAtIGh0dHBzOi8vZ2l0
aHViLmNvbS9td2lsY3p5L2xpbnV4L2NvbW1pdC83ZWZjYmEzYjBiZTMwNzM0MDg3Yzc5ZjU3NzNj
YWUxOTI0NTkyNGRiCgoKW3NuaXBdCgo+IAo+PiArfQo+PiArCj4+ICsvKgo+PiArICogVGhpcyB0
YWJsZSBpcyBub3cgb25seSB1c2VkIGZvciB0aGUgZ2VuZXJpYyAubW9kZV92YWxpZCBjaGVjay4K
Pj4gKyAqIFRoZSByZWFsIHZhbGlkYXRpb24gaGFwcGVucyBpbiB0aGUgUEhZIGRyaXZlcidzIC5y
b3VuZF9yYXRlLgo+PiArICovCj4+ICtzdGF0aWMgc3RydWN0IGlubm9faGRtaV9waHlfY29uZmln
IHN0Zl9oZG1pX3BoeV9jb25maWdzW10gPSB7Cj4+ICsJeyAyOTcwMDAwMDAsIDB4MDAsIDB4MDAg
fSwKPj4gKwl7IH4wVUwsIDB4MDAsIDB4MDAgfSwgLyogU2VudGluZWwgKi8KPj4gK307Cj4gCj4g
SWYgaXQncyBqdXN0IHN1Y2ggYSB1cHBlciBib3VuZCwgd2h5IGRvbid0IGp1c3Qgb3ZlcnJpZGUg
dGhlIGZ1bmN0aW9uCj4gYXMgYSBib3VuZCBjaGVjaz8KClllYWggYWN0dWFsbHkgcGF0Y2ggMTAg
aW1wbGVtZW50cyBtb2RlX3ZhbGlkIGNhbGxiYWNrLCBzbyBpdCdzIGJldHRlciB0bwpyZW1vdmUg
dGhpcyBzdHViIGFsdG9nZXRoZXIsIHByZXZpb3VzbHkgdGhpcyB3YXMgZG9uZSBzYXRpc2Z5IHRo
ZSBwcm9iZQpjaGVjayByZWFzb25zIC0gdjQgd2lsbCBhZGQgcGF0Y2ggdGhhdCBtYWtlcyB0aGlz
IHRhYmxlIG9wdGlvbmFsIGluCmlubm8taGRtaSBkcml2ZXIuCgo+IAo+IE9yLi4uIHNob3VsZCB0
aGUgcmVhbCB0YWJsZSBiZSB1c2VkIGhlcmU/IEkgc3RhcnQgdG8gd29uZGVyIHdoZXRoZXIKPiB0
aGlzIGlzIHJlbGF0ZWQgdG8gTWF1ZCdzIGZhaWx1cmUgb24gdGhlIEZyYW1ld29yayBwYW5lbC4K
Ck1hdWQgcGFuZWwgbmVlZGVkIGFub3RoZXIgZW50cnkgaW4gUEhZIHByZS1QTEwgdGFibGUuIFBh
dGNoIDE3IGluIHYzCmFkZHMgdGhpcyBlbnRyeS4KClRoZXJlIGlzIGEgbmV3IGlzc3VlIHJlcG9y
dGVkIGJ5IE1hdWQsIEkgd2lsbCBhbnN3ZXIgdGhhdCBpbiBhIHNlcGFyYXRlCnRocmVhZC4KCj4g
Cj4gVGhhbmtzLAo+IEljZW5vd3kKPiAKPj4gKwo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBpbm5v
X2hkbWlfcGxhdF9vcHMgc3RmX2lubm9faGRtaV9wbGF0X29wcyA9IHsKPj4gKwkuZW5hYmxlID0g
aW5ub19oZG1pX3N0YXJmaXZlX2VuYWJsZSwKPj4gKwkuZGlzYWJsZSA9IGlubm9faGRtaV9zdGFy
Zml2ZV9kaXNhYmxlLAo+PiArCS5tb2RlX3ZhbGlkID0gaW5ub19oZG1pX3N0YXJmaXZlX21vZGVf
dmFsaWQsCj4+ICt9Owo+PiArCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGlubm9faGRtaV9wbGF0
X2RhdGEgc3RmX2lubm9faGRtaV9wbGF0X2RhdGEgPSB7Cj4+ICsJLm9wcyA9ICZzdGZfaW5ub19o
ZG1pX3BsYXRfb3BzLAo+PiArCS5waHlfY29uZmlncyA9IHN0Zl9oZG1pX3BoeV9jb25maWdzLAo+
PiArCS5kZWZhdWx0X3BoeV9jb25maWcgPSAmc3RmX2hkbWlfcGh5X2NvbmZpZ3NbMF0sCj4+ICt9
Owo+PiArCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdGFyZml2ZV9oZG1p
X2NvbnRyb2xsZXJfZHRfaWRzW10gPQo+PiB7Cj4+ICsJeyAuY29tcGF0aWJsZSA9ICJzdGFyZml2
ZSxqaDcxMTAtaW5uby1oZG1pLWNvbnRyb2xsZXIiLAo+PiArCSAgLmRhdGEgPSAmc3RmX2lubm9f
aGRtaV9wbGF0X2RhdGEgfSwKPj4gKwl7fQo+PiArfTsKPj4gK01PRFVMRV9ERVZJQ0VfVEFCTEUo
b2YsIHN0YXJmaXZlX2hkbWlfY29udHJvbGxlcl9kdF9pZHMpOwo+PiArCj4+ICtzdHJ1Y3QgcGxh
dGZvcm1fZHJpdmVyIHN0YXJmaXZlX2lubm9faGRtaV9jb250cm9sbGVyX2RyaXZlciA9IHsKPj4g
KwkucHJvYmUgPSBzdGFyZml2ZV9pbm5vX2hkbWlfY29udHJvbGxlcl9wcm9iZSwKPj4gKwkuZHJp
dmVyID0gewo+PiArCQkubmFtZSA9ICJzdGFyZml2ZS1pbm5vLWhkbWktY29udHJvbGxlciIsCj4+
ICsJCS5vZl9tYXRjaF90YWJsZSA9IHN0YXJmaXZlX2hkbWlfY29udHJvbGxlcl9kdF9pZHMsCj4+
ICsJfSwKPj4gK307Cj4+ICttb2R1bGVfcGxhdGZvcm1fZHJpdmVyKHN0YXJmaXZlX2lubm9faGRt
aV9jb250cm9sbGVyX2RyaXZlcik7Cj4+ICsKPj4gK01PRFVMRV9BVVRIT1IoIk1pY2hhbCBXaWxj
enluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Iik7Cj4+ICtNT0RVTEVfREVTQ1JJUFRJ
T04oIlN0YXJGaXZlIElOTk8gSERNSSBDb250cm9sbGVyIERyaXZlciIpOwo+PiArTU9EVUxFX0xJ
Q0VOU0UoIkdQTCIpOwo+IAo+IAoKQmVzdCByZWdhcmRzLAotLSAKTWljaGFsIFdpbGN6eW5za2kg
PG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
