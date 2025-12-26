Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C016E8FDA6
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 13:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2jO+NHyUYdK6LkHyPtnhvgyM+JOlWC7EBvzzPNHk+fs=; b=Fdt4hUN9uqfPF6
	aZ/5Zr/y139/7zWvjjZlf6Dwy6khrtKedRAOZtbPtNp8QqjLbKv3K7qS/+cKGIP5H8fkWjXoQF1jS
	YzIpmVqRrj/kFyADFtf7SUG5lVNmAVG3BBPtocQCrF1J9FIa3qy/67nBfp/9YJluBepeGXwMg/QTa
	scstIerWJjC//1XZMnxIPvV4ijBhDTKSPLsaxLKsFe4XSA9iBY1uholBOQyzgtWnhk3P5HaZlvKKq
	q9HipaZwOo7IVSx6QJWZgZWPMxHfM7ffqK8+UJtLDY1slUcDM4FsY/bpCgf4KYwik2jLIqiYnY9Ns
	Ku0vKL1mgMjPu7+zKyfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ7s0-00000001DCn-1PdY;
	Fri, 26 Dec 2025 13:28:40 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ7rv-00000001DCE-2Tdj
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 13:28:38 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.54])
	by APP-03 (Coremail) with SMTP id rQCowABnaL9ZjU5pk4sYAg--.1008S2;
	Fri, 26 Dec 2025 21:27:55 +0800 (CST)
Message-ID: <0eba66980024d001d4ff6d0aed6f2f3e356abf3a.camel@iscas.ac.cn>
Subject: Re: [PATCH v4 5/9] drm/bridge: add a driver for T-Head TH1520 HDMI
 controller
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Andy Yan <andyshrk@163.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski
 <m.wilczynski@samsung.com>, devicetree@vger.kernel.org, Yao Zi
 <ziyao@disroot.org>,  linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Han Gao <rabenda.cn@gmail.com>,
 linux-riscv@lists.infradead.org
Date: Fri, 26 Dec 2025 21:27:53 +0800
In-Reply-To: <2183e580.8b98.19b5531263f.Coremail.andyshrk@163.com>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
	 <20251224161205.1132149-6-zhengxingda@iscas.ac.cn>
	 <2183e580.8b98.19b5531263f.Coremail.andyshrk@163.com>
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-CM-TRANSID: rQCowABnaL9ZjU5pk4sYAg--.1008S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFWkXw18Gry7Ar4DAFyftFb_yoW8Ar4rpF
	WxJFW3trykGFsagry2vr1rWryYyaykJw45Grn7t3WIvw13CF10qrZrZF90gFykWr4xZr1a
	yr1Yqr17uF1DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUVhL0UUUUU
X-Originating-IP: [112.94.103.54]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_052836_002059_7D23486D 
X-CRM114-Status: GOOD (  17.69  )
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

5ZyoIDIwMjUtMTItMjXmmJ/mnJ/lm5vnmoQgMTk6MDcgKzA4MDDvvIxBbmR5IFlhbuWGmemBk++8
mgo+IAo+IAo+IEhlbGxvIEljZW5vd3k6Cj4gCj4gQXQgMjAyNS0xMi0yNSAwMDoxMjowMSwgIklj
ZW5vd3kgWmhlbmciIDx6aGVuZ3hpbmdkYUBpc2Nhcy5hYy5jbj4KPiB3cm90ZToKPiA+IEZyb206
IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+ID4gCj4gPiBULUhlYWQgVEgxNTIwIFNv
QyBjb250YWlucyBhIFN5bm9wc3lzIERlc2lnbldhcmUgSERNSSBjb250cm9sbGVyCj4gPiAocGFp
cmVkCj4gPiB3aXRoIERlc2lnbldhcmUgSERNSSBUWCBQSFkgR2VuMikgdGhhdCB0YWtlcyB0aGUg
IkRQIiBvdXRwdXQgZnJvbQo+ID4gdGhlCj4gPiBkaXNwbGF5IGNvbnRyb2xsZXIuCj4gPiAKPiA+
IEFkZCBhIGRyaXZlciBmb3IgdGhpcyBjb250cm9sbGVyIHV0aWxpemluZyB0aGUgY29tbW9uIERl
c2lnbldhcmUKPiA+IEhETUkKPiA+IGNvZGUgaW4gdGhlIGtlcm5lbC4KPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogSWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBJY2Vub3d5IFpoZW5nIDx6aGVuZ3hpbmdkYUBpc2Nhcy5hYy5jbj4KPiA+IC0tLQo+ID4gTm8g
Y2hhbmdlcyBpbiB2MywgdjQuCj4gPiAKPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAtIENyZWF0ZWQg
YSBuZXcgZnVuY3Rpb24gdG8gc2V0IFBIWSBwYXJhbWV0ZXJzIGFuZCByZWZhY3RvcmVkIHRoZQo+
ID4gwqBjb250cm9sIGZsb3cgb2YgdGhlIGNvbmZpZ3VyZV9waHkgY2FsbGJhY2suCj4gPiAKPiA+
IE1BSU5UQUlORVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgwqAgMSArCj4gPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWfC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEwICsrCj4gPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL01h
a2VmaWxlwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPiA+IGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGgxNTIwLWR3LWhkbWkuYyB8IDE3Mwo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrCj4g
PiA0IGZpbGVzIGNoYW5nZWQsIDE4NSBpbnNlcnRpb25zKCspCj4gPiBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aDE1MjAtZHctaGRtaS5jCj4gCj4gCj4gQXMgdGhp
cyBpcyBhIFN5bm9wc3lzIERlc2lnbldhcmUgYmFzZWQgSVAsIG1heWJlIGl0J3MgYmV0dGVyIHRv
IHB1dAo+IGl0IHVuZGVywqDCoCAiZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy8iCj4g
T3IganVzdCBjcmVhdGUgYSBkaXIgZm9yIHRoZWFkLCBJIHRoaW5rIHRoZXJlIHdpbGwgY29tZSBv
dGhlciBkaXNwbGF5Cj4gcmVsYXRlZCBkcml2ZXJzIGZvciB0aGVhZCBpbiB0aGUgZnV0dXJlLgoK
SXQncyBub3QgcHJvcGVyIHRvIHBsYWNlIHZlbmRvciBnbHVlcyB0byBzeW5vcHN5cy8gLgoKQXMg
Zm9yIFQtSGVhZCwgdGhleSBzdG9wcGVkIHRoZWlyIGVtYmVkZGVkIFNvQyBidXNpbmVzcyAoc29s
ZCB0bwphbm90aGVyIGNvbXBhbnkpIGFuZCBub3cgdGhleSBvbmx5IG1ha2VzIGRhdGEtY2VudGVy
IGNoaXBzLCB0aGVyZQpzaG91bGQgYmUgbm8gVC1IZWFkIGRpc3BsYXkgZHJpdmVycyBpbiB0aGUg
ZnV0dXJlLgoKPiAKPiAKPT09PT09PT09PT0gODwgPT09PT09PT09PT09CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
