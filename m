Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA644E8FDCE
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Dec 2025 07:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQPiiDorFV7JJ8kRdF5USQgkNe1dcBX3yo32lhFmQZo=; b=eebGhxn3XVt8eU
	O06iOOCtInb0sWy/snNVt208S6gBkaG5rcizm2YC2wa0le8nZV4HfVeUm0sE2lJEI/hcIb+h7D6Tt
	gHzT3iBlOzyY/9Zutt+tIlwrpk+OC6zts2Wl2NX08iMgqDSml6l8UHYjDXf7m+9dn+UOM4rYZjuwb
	nbkpZUl9QGnutest3aN+pi6S3jnrDyVa3SF5qvNTHdFegbK+hkEKdEDWGgHsay2ipinKxjM0kOMUS
	h1I4wRgJVss9sObesAlxnhNCpE1d8hFmDVehOFXNzje9TuETvPdgpJYqeb8LGOXJkhbVW9pxn+sMp
	7bmUQO5EXVjsT3P5qeXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZOM2-00000001lXd-2RgG;
	Sat, 27 Dec 2025 07:04:46 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZOLz-00000001lWW-0Gsi
	for linux-riscv@lists.infradead.org;
	Sat, 27 Dec 2025 07:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=qnJD/aW/+nSP0BXD12a4Ecqbki+tbWodC6E/ajq0Hpc=; b=H
	voSqATvpFlk3TQ3Qdm2FIso3/IMNyru7tV/BlBXYkAFHUpRI0uDvw+q4pkKHP5ik
	8HVMWOtlQZv/IzViNIMhyH/leuWvlaO1QFfeXcCVAtIQIaZmxFhcK+16eSlEl7aN
	Uc7NoCGi7CHfVHitWApfoHusRpsvq1KazeT38ruQV8=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-121 (Coremail) ; Sat, 27 Dec 2025 15:03:22 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Sat, 27 Dec 2025 15:03:22 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>, "Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Drew Fustini" <fustini@kernel.org>, "Guo Ren" <guoren@kernel.org>,
	"Fu Wei" <wefu@redhat.com>, "Philipp Zabel" <p.zabel@pengutronix.de>,
	"Heiko Stuebner" <heiko@sntech.de>,
	"Andrzej Hajda" <andrzej.hajda@intel.com>,
	"Neil Armstrong" <neil.armstrong@linaro.org>,
	"Robert Foss" <rfoss@kernel.org>,
	"Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
	"Jonas Karlman" <jonas@kwiboo.se>,
	"Jernej Skrabec" <jernej.skrabec@gmail.com>,
	"Michal Wilczynski" <m.wilczynski@samsung.com>,
	devicetree@vger.kernel.org, "Yao Zi" <ziyao@disroot.org>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	"Han Gao" <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org
Subject: Re:Re: [PATCH v4 5/9] drm/bridge: add a driver for T-Head TH1520
 HDMI controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <0eba66980024d001d4ff6d0aed6f2f3e356abf3a.camel@iscas.ac.cn>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <20251224161205.1132149-6-zhengxingda@iscas.ac.cn>
 <2183e580.8b98.19b5531263f.Coremail.andyshrk@163.com>
 <0eba66980024d001d4ff6d0aed6f2f3e356abf3a.camel@iscas.ac.cn>
X-CM-CTRLMSGS: 9+AdCXBsdXM9MTc2NjgxOTAwMTAyMV9jMjgyNzE1MzAxMzYxM2ZlNzQzMmEwN
 mNmOTVkZjNmZQ==
X-NTES-SC: AL_Qu2dBPSatkgr5CmebOkfmUgWjuw/WsG1v/Ul1YBSP556jArp/iIyd1x8PV/I196CCBqolQmNVhpN489ZZqJ3f4YhOtUcqUxlQaI9PqQGDBVA0w==
MIME-Version: 1.0
Message-ID: <5ce9d611.1868.19b5e9e7a61.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eSgvCgAXV667hE9pbnNLAA--.482W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxRt922lPhLvKXgAA31
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_230443_505166_86D7D2A4 
X-CRM114-Status: GOOD (  15.27  )
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

CgpIZWxsb++8jAoK5ZyoIDIwMjUtMTItMjYgMjE6Mjc6NTPvvIwiSWNlbm93eSBaaGVuZyIgPHpo
ZW5neGluZ2RhQGlzY2FzLmFjLmNuPiDlhpnpgZPvvJoKPuWcqCAyMDI1LTEyLTI15pif5pyf5Zub
55qEIDE5OjA3ICswODAw77yMQW5keSBZYW7lhpnpgZPvvJoKPj4gCj4+IAo+PiBIZWxsbyBJY2Vu
b3d5Ogo+PiAKPj4gQXQgMjAyNS0xMi0yNSAwMDoxMjowMSwgIkljZW5vd3kgWmhlbmciIDx6aGVu
Z3hpbmdkYUBpc2Nhcy5hYy5jbj4KPj4gd3JvdGU6Cj4+ID4gRnJvbTogSWNlbm93eSBaaGVuZyA8
dXd1QGljZW5vd3kubWU+Cj4+ID4gCj4+ID4gVC1IZWFkIFRIMTUyMCBTb0MgY29udGFpbnMgYSBT
eW5vcHN5cyBEZXNpZ25XYXJlIEhETUkgY29udHJvbGxlcgo+PiA+IChwYWlyZWQKPj4gPiB3aXRo
IERlc2lnbldhcmUgSERNSSBUWCBQSFkgR2VuMikgdGhhdCB0YWtlcyB0aGUgIkRQIiBvdXRwdXQg
ZnJvbQo+PiA+IHRoZQo+PiA+IGRpc3BsYXkgY29udHJvbGxlci4KPj4gPiAKPj4gPiBBZGQgYSBk
cml2ZXIgZm9yIHRoaXMgY29udHJvbGxlciB1dGlsaXppbmcgdGhlIGNvbW1vbiBEZXNpZ25XYXJl
Cj4+ID4gSERNSQo+PiA+IGNvZGUgaW4gdGhlIGtlcm5lbC4KPj4gPiAKPj4gPiBTaWduZWQtb2Zm
LWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPj4gPiBTaWduZWQtb2ZmLWJ5OiBJ
Y2Vub3d5IFpoZW5nIDx6aGVuZ3hpbmdkYUBpc2Nhcy5hYy5jbj4KPj4gPiAtLS0KPj4gPiBObyBj
aGFuZ2VzIGluIHYzLCB2NC4KPj4gPiAKPj4gPiBDaGFuZ2VzIGluIHYyOgo+PiA+IC0gQ3JlYXRl
ZCBhIG5ldyBmdW5jdGlvbiB0byBzZXQgUEhZIHBhcmFtZXRlcnMgYW5kIHJlZmFjdG9yZWQgdGhl
Cj4+ID4gwqBjb250cm9sIGZsb3cgb2YgdGhlIGNvbmZpZ3VyZV9waHkgY2FsbGJhY2suCj4+ID4g
Cj4+ID4gTUFJTlRBSU5FUlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPj4gPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tj
b25maWfCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEwICsrCj4+ID4gZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4+ID4gZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS90aDE1MjAtZHctaGRtaS5jIHwgMTczCj4+ID4gKysrKysrKysrKysrKysrKysr
KysrKysrCj4+ID4gNCBmaWxlcyBjaGFuZ2VkLCAxODUgaW5zZXJ0aW9ucygrKQo+PiA+IGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RoMTUyMC1kdy1oZG1pLmMKPj4g
Cj4+IAo+PiBBcyB0aGlzIGlzIGEgU3lub3BzeXMgRGVzaWduV2FyZSBiYXNlZCBJUCwgbWF5YmUg
aXQncyBiZXR0ZXIgdG8gcHV0Cj4+IGl0IHVuZGVywqDCoCAiZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zeW5vcHN5cy8iCj4+IE9yIGp1c3QgY3JlYXRlIGEgZGlyIGZvciB0aGVhZCwgSSB0aGluayB0
aGVyZSB3aWxsIGNvbWUgb3RoZXIgZGlzcGxheQo+PiByZWxhdGVkIGRyaXZlcnMgZm9yIHRoZWFk
IGluIHRoZSBmdXR1cmUuCj4KPkl0J3Mgbm90IHByb3BlciB0byBwbGFjZSB2ZW5kb3IgZ2x1ZXMg
dG8gc3lub3BzeXMvIC4KCgpUSSBoYXMgcHJlY2VkZW50cyBmb3IgZG9pbmcgdGhpcyB3aXRoIENh
ZGVuY2UgSVDvvIwgc2VlIAoKZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jYWRlbmNlL2NkbnMtZHNp
LWo3MjFlLmMKZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jYWRlbmNlL2NkbnMtbWhkcDg1NDYtajcy
MWUuYyAKCgo+Cj5BcyBmb3IgVC1IZWFkLCB0aGV5IHN0b3BwZWQgdGhlaXIgZW1iZWRkZWQgU29D
IGJ1c2luZXNzIChzb2xkIHRvCj5hbm90aGVyIGNvbXBhbnkpIGFuZCBub3cgdGhleSBvbmx5IG1h
a2VzIGRhdGEtY2VudGVyIGNoaXBzLCB0aGVyZQo+c2hvdWxkIGJlIG5vIFQtSGVhZCBkaXNwbGF5
IGRyaXZlcnMgaW4gdGhlIGZ1dHVyZS4KPgo+PiAKPj4gCj49PT09PT09PT09PSA4PCA9PT09PT09
PT09PT0KPgo+Cj5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj5saW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCj5odHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
