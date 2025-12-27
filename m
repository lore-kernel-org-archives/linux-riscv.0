Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D763E8FDD0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Dec 2025 07:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8df68T9qdKJXgMIZ9py9jUiQhJuY4b/UC45yoaXveAc=; b=1KOhqxiYS9QDwf
	KcupnM0STVxwakVLos2vre5srTFfjW1203D0SuERRmLLY/bFXY7z8UmPMXnil8k5kYRhi0BmTsv0v
	WyvyDpyQp8YVOim9ItYF2ThDLagU4jz/LABEWS4VeYzSgqmcnVB/SkdKiG3Sldx5fHEX7HGXxuXf9
	yn2Jr+wv3tG7RDlt+vep+FDvfgo8ifWE/TbYxMBTi8HB/l5Z2MFxZHFXe07QZhqa0p+g1ZDvIg38E
	n7mHrm29XQv0Dxn78DWAapk2qhP3Cmu8WOdQAz4QyMeOVO+VL3hlTGJY2HXaRJHX95XagzDfiSe8r
	8bCl6tkGvamdtSMWDFNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZOdO-00000001mIt-0qfm;
	Sat, 27 Dec 2025 07:22:44 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZOdA-00000001mI9-3ZgG
	for linux-riscv@lists.infradead.org;
	Sat, 27 Dec 2025 07:22:31 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.54])
	by APP-01 (Coremail) with SMTP id qwCowABX_mkeiU9p98L7AQ--.5607S2;
	Sat, 27 Dec 2025 15:22:07 +0800 (CST)
Message-ID: <3b5fd30554f91bcd083b2dc450cdf7fe2fa395e2.camel@iscas.ac.cn>
Subject: Re: Re: [PATCH v4 5/9] drm/bridge: add a driver for T-Head TH1520
 HDMI controller
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
Date: Sat, 27 Dec 2025 15:22:05 +0800
In-Reply-To: <5ce9d611.1868.19b5e9e7a61.Coremail.andyshrk@163.com>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
	 <20251224161205.1132149-6-zhengxingda@iscas.ac.cn>
	 <2183e580.8b98.19b5531263f.Coremail.andyshrk@163.com>
	 <0eba66980024d001d4ff6d0aed6f2f3e356abf3a.camel@iscas.ac.cn>
	 <5ce9d611.1868.19b5e9e7a61.Coremail.andyshrk@163.com>
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-CM-TRANSID: qwCowABX_mkeiU9p98L7AQ--.5607S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr1xGry7urWxJF1DuFyUWrg_yoW5Gw1rpF
	W8JFW3CryDJFn3Kw1I9w15JryYya1kJw4rWrnxJ3WIvr90kF10qr9rZFyYgFyDWr4fGr42
	yr1UKrya9r1kJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU0uHq7UUUUU==
X-Originating-IP: [112.94.103.54]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_232229_274603_4839FF19 
X-CRM114-Status: GOOD (  24.65  )
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

5ZyoIDIwMjUtMTItMjfmmJ/mnJ/lha3nmoQgMTU6MDMgKzA4MDDvvIxBbmR5IFlhbuWGmemBk++8
mgo+IAo+IAo+IEhlbGxv77yMCj4gCj4g5ZyoIDIwMjUtMTItMjYgMjE6Mjc6NTPvvIwiSWNlbm93
eSBaaGVuZyIgPHpoZW5neGluZ2RhQGlzY2FzLmFjLmNuPiDlhpnpgZPvvJoKPiA+IOWcqCAyMDI1
LTEyLTI15pif5pyf5Zub55qEIDE5OjA3ICswODAw77yMQW5keSBZYW7lhpnpgZPvvJoKPiA+ID4g
Cj4gPiA+IAo+ID4gPiBIZWxsbyBJY2Vub3d5Ogo+ID4gPiAKPiA+ID4gQXQgMjAyNS0xMi0yNSAw
MDoxMjowMSwgIkljZW5vd3kgWmhlbmciIDx6aGVuZ3hpbmdkYUBpc2Nhcy5hYy5jbj4KPiA+ID4g
d3JvdGU6Cj4gPiA+ID4gRnJvbTogSWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+Cj4gPiA+
ID4gCj4gPiA+ID4gVC1IZWFkIFRIMTUyMCBTb0MgY29udGFpbnMgYSBTeW5vcHN5cyBEZXNpZ25X
YXJlIEhETUkKPiA+ID4gPiBjb250cm9sbGVyCj4gPiA+ID4gKHBhaXJlZAo+ID4gPiA+IHdpdGgg
RGVzaWduV2FyZSBIRE1JIFRYIFBIWSBHZW4yKSB0aGF0IHRha2VzIHRoZSAiRFAiIG91dHB1dAo+
ID4gPiA+IGZyb20KPiA+ID4gPiB0aGUKPiA+ID4gPiBkaXNwbGF5IGNvbnRyb2xsZXIuCj4gPiA+
ID4gCj4gPiA+ID4gQWRkIGEgZHJpdmVyIGZvciB0aGlzIGNvbnRyb2xsZXIgdXRpbGl6aW5nIHRo
ZSBjb21tb24KPiA+ID4gPiBEZXNpZ25XYXJlCj4gPiA+ID4gSERNSQo+ID4gPiA+IGNvZGUgaW4g
dGhlIGtlcm5lbC4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5n
IDx1d3VAaWNlbm93eS5tZT4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx6
aGVuZ3hpbmdkYUBpc2Nhcy5hYy5jbj4KPiA+ID4gPiAtLS0KPiA+ID4gPiBObyBjaGFuZ2VzIGlu
IHYzLCB2NC4KPiA+ID4gPiAKPiA+ID4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gPiA+IC0gQ3JlYXRl
ZCBhIG5ldyBmdW5jdGlvbiB0byBzZXQgUEhZIHBhcmFtZXRlcnMgYW5kIHJlZmFjdG9yZWQKPiA+
ID4gPiB0aGUKPiA+ID4gPiDCoGNvbnRyb2wgZmxvdyBvZiB0aGUgY29uZmlndXJlX3BoeSBjYWxs
YmFjay4KPiA+ID4gPiAKPiA+ID4gPiBNQUlOVEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+ID4gPiA+IGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTAgKysKPiA+
ID4gPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoCB8wqDC
oCAxICsKPiA+ID4gPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RoMTUyMC1kdy1oZG1pLmMgfCAx
NzMKPiA+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gPiA0IGZpbGVzIGNoYW5n
ZWQsIDE4NSBpbnNlcnRpb25zKCspCj4gPiA+ID4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGgxNTIwLWR3LWhkbWkuYwo+ID4gPiAKPiA+ID4gCj4gPiA+IEFzIHRo
aXMgaXMgYSBTeW5vcHN5cyBEZXNpZ25XYXJlIGJhc2VkIElQLCBtYXliZSBpdCdzIGJldHRlciB0
bwo+ID4gPiBwdXQKPiA+ID4gaXQgdW5kZXLCoMKgICJkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzLyIKPiA+ID4gT3IganVzdCBjcmVhdGUgYSBkaXIgZm9yIHRoZWFkLCBJIHRoaW5rIHRo
ZXJlIHdpbGwgY29tZSBvdGhlcgo+ID4gPiBkaXNwbGF5Cj4gPiA+IHJlbGF0ZWQgZHJpdmVycyBm
b3IgdGhlYWQgaW4gdGhlIGZ1dHVyZS4KPiA+IAo+ID4gSXQncyBub3QgcHJvcGVyIHRvIHBsYWNl
IHZlbmRvciBnbHVlcyB0byBzeW5vcHN5cy8gLgo+IAo+IAo+IFRJIGhhcyBwcmVjZWRlbnRzIGZv
ciBkb2luZyB0aGlzIHdpdGggQ2FkZW5jZSBJUO+8jCBzZWUgCj4gCj4gZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9jYWRlbmNlL2NkbnMtZHNpLWo3MjFlLmMKPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2NhZGVuY2UvY2Rucy1taGRwODU0Ni1qNzIxZS5jIAoKV2VsbCBmb3IgdGhpcyBraW5kIG9mIHRo
aW5ncywgSSBwcmVmZXIgdG8gaGVhciBmcm9tIHRoZSBtYWludGFpbmVyIG9mCkRXIEhETUkgYnJp
ZGdlcyAoYWx0aG91Z2ggaXQgc2VlbXMgdGhhdCB0aGlzIGhhcyBubyBkZWRpY2F0ZWQKTUFJTlRB
SU5FUlMgZW50cnkgYW5kIGdldF9tYWludGFpbmVycyBqdXN0IHJldHVybnMgcGVvcGxlIGZvciBE
Uk0KRFJJVkVSUyBGT1IgQlJJREdFIENISVBTKS4KCj4gCj4gCj4gPiAKPiA+IEFzIGZvciBULUhl
YWQsIHRoZXkgc3RvcHBlZCB0aGVpciBlbWJlZGRlZCBTb0MgYnVzaW5lc3MgKHNvbGQgdG8KPiA+
IGFub3RoZXIgY29tcGFueSkgYW5kIG5vdyB0aGV5IG9ubHkgbWFrZXMgZGF0YS1jZW50ZXIgY2hp
cHMsIHRoZXJlCj4gPiBzaG91bGQgYmUgbm8gVC1IZWFkIGRpc3BsYXkgZHJpdmVycyBpbiB0aGUg
ZnV0dXJlLgo+ID4gCj4gPiA+IAo+ID4gPiAKPiA+ID09PT09PT09PT09IDg8ID09PT09PT09PT09
PQo+ID4gCj4gPiAKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
