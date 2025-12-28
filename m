Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEECD3B7E5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 17:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42asQtSbkOL3csz5UJUHdaLB9ZobNT1yXA/DfXHgVl8=; b=mBvzUWr3YnXomm
	1VeEPKOdexusUNePypFiJbR94Ky4T/dSZelLB3Nj7qZLSdJFTif8tt63/LHQ1rEPcMO68XkFzsgE5
	rfdl5QRPk714T3LKWvzjDD9TptalJlBdJCclBY8B0Dy/KUU/GbdwjTxL7B6tgoQcuOpw7sEOkOcGv
	VkK8sTnx1yA22SFef2fOQDS+E7u4Qkodk+Hn77AIIvXQZQJeln8+OCxWtV/iPVQsgQKQF0xgv41AS
	u1yr0+maWds7ViZ1NkWgoc47sJAw9sCuhD8/p2lnxe0kgpOoYnkr5dtniIlATA0Jk3AuoKfQNdOBU
	qj0F8urRWJiJN7Y85GVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZum5-00000002vrf-1J1E;
	Sun, 28 Dec 2025 17:41:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZum3-00000002vrI-0Uc7
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 17:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ZUQu9H3WOitPzhsM/on3IIDEdJMpjoQS/NL13XajIJo=; b=WHZlmT6ZqPwvymsvsdX7U4GOme
	6fXTq9+nNj5l1mj8weFPe7Lv2qIJ7R+7rzeqKj0CIn/Ghm5Hk5I8SBt/RCNZTuN3EDKR7UDmwQjLD
	p0DfueNyach9h/Shjh3mrILmgpjAPMJ4r4g0LDuK2eOCUb0cafS1Q6rQP4nltnzZYtx8tXmU6Im52
	11dH5ihSkg3VhfzjaB/1Lx2sUfn8W5VEVSjGnFJyeEPCLjxlVRsJayZtgRzH5/Iq98U5aOQjfaSaN
	itxrDDQ2rTwfyfzUtf5KEmAFHow2/b/WKe3bYotuB14170LgNf0Gu2Vh7yGelJljXEHeNTgwFRr9i
	XOoqR8nA==;
Received: from i53875bca.versanet.de ([83.135.91.202] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vZulP-000Ta3-Dc; Sun, 28 Dec 2025 18:41:08 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>, devicetree@vger.kernel.org,
 Yao Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Han Gao <rabenda.cn@gmail.com>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 5/9] drm/bridge: add a driver for T-Head TH1520 HDMI controller
Date: Sun, 28 Dec 2025 18:41:06 +0100
Message-ID: <2776792.KRxA6XjA2N@diego>
In-Reply-To: <3b5fd30554f91bcd083b2dc450cdf7fe2fa395e2.camel@iscas.ac.cn>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <5ce9d611.1868.19b5e9e7a61.Coremail.andyshrk@163.com>
 <3b5fd30554f91bcd083b2dc450cdf7fe2fa395e2.camel@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_094147_210276_720CA601 
X-CRM114-Status: GOOD (  27.15  )
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

QW0gU2Ftc3RhZywgMjcuIERlemVtYmVyIDIwMjUsIDA4OjIyOjA1IE1pdHRlbGV1cm9ww6Rpc2No
ZSBOb3JtYWx6ZWl0IHNjaHJpZWIgSWNlbm93eSBaaGVuZzoKPiDlnKggMjAyNS0xMi0yN+aYn+ac
n+WFreeahCAxNTowMyArMDgwMO+8jEFuZHkgWWFu5YaZ6YGT77yaCj4gPiAKPiA+IAo+ID4gSGVs
bG/vvIwKPiA+IAo+ID4g5ZyoIDIwMjUtMTItMjYgMjE6Mjc6NTPvvIwiSWNlbm93eSBaaGVuZyIg
PHpoZW5neGluZ2RhQGlzY2FzLmFjLmNuPiDlhpnpgZPvvJoKPiA+ID4g5ZyoIDIwMjUtMTItMjXm
mJ/mnJ/lm5vnmoQgMTk6MDcgKzA4MDDvvIxBbmR5IFlhbuWGmemBk++8mgo+ID4gPiA+IAo+ID4g
PiA+IAo+ID4gPiA+IEhlbGxvIEljZW5vd3k6Cj4gPiA+ID4gCj4gPiA+ID4gQXQgMjAyNS0xMi0y
NSAwMDoxMjowMSwgIkljZW5vd3kgWmhlbmciIDx6aGVuZ3hpbmdkYUBpc2Nhcy5hYy5jbj4KPiA+
ID4gPiB3cm90ZToKPiA+ID4gPiA+IEZyb206IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1l
Pgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBULUhlYWQgVEgxNTIwIFNvQyBjb250YWlucyBhIFN5bm9w
c3lzIERlc2lnbldhcmUgSERNSQo+ID4gPiA+ID4gY29udHJvbGxlcgo+ID4gPiA+ID4gKHBhaXJl
ZAo+ID4gPiA+ID4gd2l0aCBEZXNpZ25XYXJlIEhETUkgVFggUEhZIEdlbjIpIHRoYXQgdGFrZXMg
dGhlICJEUCIgb3V0cHV0Cj4gPiA+ID4gPiBmcm9tCj4gPiA+ID4gPiB0aGUKPiA+ID4gPiA+IGRp
c3BsYXkgY29udHJvbGxlci4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gQWRkIGEgZHJpdmVyIGZvciB0
aGlzIGNvbnRyb2xsZXIgdXRpbGl6aW5nIHRoZSBjb21tb24KPiA+ID4gPiA+IERlc2lnbldhcmUK
PiA+ID4gPiA+IEhETUkKPiA+ID4gPiA+IGNvZGUgaW4gdGhlIGtlcm5lbC4KPiA+ID4gPiA+IAo+
ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+Cj4g
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx6aGVuZ3hpbmdkYUBpc2Nhcy5h
Yy5jbj4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gTm8gY2hhbmdlcyBpbiB2MywgdjQuCj4gPiA+
ID4gPiAKPiA+ID4gPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiA+ID4gPiAtIENyZWF0ZWQgYSBuZXcg
ZnVuY3Rpb24gdG8gc2V0IFBIWSBwYXJhbWV0ZXJzIGFuZCByZWZhY3RvcmVkCj4gPiA+ID4gPiB0
aGUKPiA+ID4gPiA+ICBjb250cm9sIGZsb3cgb2YgdGhlIGNvbmZpZ3VyZV9waHkgY2FsbGJhY2su
Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMSArCj4gPiA+ID4gPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgICAg
ICAgICAgfCAgMTAgKysKPiA+ID4gPiA+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvTWFrZWZpbGUg
ICAgICAgICB8ICAgMSArCj4gPiA+ID4gPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RoMTUyMC1k
dy1oZG1pLmMgfCAxNzMKPiA+ID4gPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+
ID4gNCBmaWxlcyBjaGFuZ2VkLCAxODUgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4gY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGgxNTIwLWR3LWhkbWkuYwo+ID4gPiA+
IAo+ID4gPiA+IAo+ID4gPiA+IEFzIHRoaXMgaXMgYSBTeW5vcHN5cyBEZXNpZ25XYXJlIGJhc2Vk
IElQLCBtYXliZSBpdCdzIGJldHRlciB0bwo+ID4gPiA+IHB1dAo+ID4gPiA+IGl0IHVuZGVyICAg
ImRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvIgo+ID4gPiA+IE9yIGp1c3QgY3JlYXRl
IGEgZGlyIGZvciB0aGVhZCwgSSB0aGluayB0aGVyZSB3aWxsIGNvbWUgb3RoZXIKPiA+ID4gPiBk
aXNwbGF5Cj4gPiA+ID4gcmVsYXRlZCBkcml2ZXJzIGZvciB0aGVhZCBpbiB0aGUgZnV0dXJlLgo+
ID4gPiAKPiA+ID4gSXQncyBub3QgcHJvcGVyIHRvIHBsYWNlIHZlbmRvciBnbHVlcyB0byBzeW5v
cHN5cy8gLgo+ID4gCj4gPiAKPiA+IFRJIGhhcyBwcmVjZWRlbnRzIGZvciBkb2luZyB0aGlzIHdp
dGggQ2FkZW5jZSBJUO+8jCBzZWUgCj4gPiAKPiA+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2Fk
ZW5jZS9jZG5zLWRzaS1qNzIxZS5jCj4gPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2NhZGVuY2Uv
Y2Rucy1taGRwODU0Ni1qNzIxZS5jIAo+IAo+IFdlbGwgZm9yIHRoaXMga2luZCBvZiB0aGluZ3Ms
IEkgcHJlZmVyIHRvIGhlYXIgZnJvbSB0aGUgbWFpbnRhaW5lciBvZgo+IERXIEhETUkgYnJpZGdl
cyAoYWx0aG91Z2ggaXQgc2VlbXMgdGhhdCB0aGlzIGhhcyBubyBkZWRpY2F0ZWQKPiBNQUlOVEFJ
TkVSUyBlbnRyeSBhbmQgZ2V0X21haW50YWluZXJzIGp1c3QgcmV0dXJucyBwZW9wbGUgZm9yIERS
TQo+IERSSVZFUlMgRk9SIEJSSURHRSBDSElQUykuCgpJIHRoaW5rIHRoZSBiZXN0IHdheSB0byBy
ZXNvbHZlIHRoaXMgcXVlc3Rpb24gd291bGQgYmUgdG8gYWN0aXZlbHkgYXNrCm9uIHRoZSBkcmkt
ZGV2ZWwgSVJDIGNoYW5uZWwgKG9uIHRoZSBPRlRDIG5ldHdvcmspLCBiZWNhdXNlIHBlb3BsZQpt
aWdodCBub3QgZXZlbiByZWFsaXplIHRoaXMgcXVpdGUgaW50ZXJlc3RpbmcgcXVlc3Rpb24gaXMg
aW4gaGVyZSwgYnV0CkkgZ3Vlc3MgbW9zdCBvZiB0aGUgcmVsZXZhbnQgcGVvcGxlIGFyZSBvbiB0
aGVyZS4KCkJ1dCBwcm9iYWJseSB3YWl0IGFmdGVyIG5ldyB5ZWFycywgc28gcGVvcGxlIGNhbiBh
Y3R1YWxseSByZXR1cm4gZnJvbQphbGwgdGhlIGZlc3Rpdml0aWVzIGhhcHBlbmluZyByaWdodCBu
b3cuCgoKSGVpa28KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
