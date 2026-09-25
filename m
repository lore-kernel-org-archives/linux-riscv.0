Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1ABC9830D
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 14:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9eaVrDEsfM+c1ndgPtrw6A8jGIu3GcJkpDxytHZRgPk=; b=dipeBCQmYfMBP4
	8NMbpmJGU64Oa8CRSTYP9dGRFgx4bvrnZw1EktjZs9SIhdBue/HZcd+uUO8sbNTcIPOZotTOVO6Dk
	TknZ3MT6wOUcp0NhTMDu4UNjkb3vqladRiqr50C/Wazfm/uJlMVHwKaPS3vEZJ4E+fIvcN2A/2glC
	DuOSg/DQxSRAa/LHRz3sWZt8Cwg5JBKMZSgaPW0CstaXJWgjLt7xjzx352/DdrPpHU5qecQEQ3KSw
	2G5k7I/JjYNK8oUf6aly+1ws0ZN9z/1gPHI/lI9QP/sDS5J37mXhoA2M8SRQpNdG8wH7XYEApJdVR
	24MrbgvlGiyq85iEJx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6WP-0000000DWB4-2vsU;
	Fri, 25 Sep 2026 14:03:29 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6WK-0000000DW7k-2aFy;
	Fri, 25 Sep 2026 14:03:27 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.96.244])
	by APP-01 (Coremail) with SMTP id qwCowAA3D_P+frZqWmXzCA--.32169S2;
	Fri, 25 Sep 2026 22:02:41 +0800 (CST)
Message-ID: <2a3e3ce8d62805394ef41a2e9f84a5051af30ac2.camel@iscas.ac.cn>
Subject: Re: [PATCH v3 13/19] clk: starfive: jh7110-vout: Allow pixel clock
 rate propagation
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Jerome Brunet <jbrunet@baylibre.com>, Michal Wilczynski	
 <m.wilczynski@samsung.com>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda	 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart	 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, David Airlie	 <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
 Yan <andy.yan@rock-chips.com>, Philipp Zabel	 <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng	
 <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Heiko
 Stuebner <heiko@sntech.de>,  Conor Dooley <conor@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
 Belhachemi <db@domibel.de>,  Brian Masney <bmasney+clk@redhat.com>, Jerome
 Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, Marek
 Szyprowski	 <m.szyprowski@samsung.com>, Maud Spierings
 <maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>
Date: Fri, 25 Sep 2026 22:02:38 +0800
In-Reply-To: <1j5wzt8plp.fsf@starbuckisacylon.baylibre.com>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
	 <CGME20260904132733eucas1p1a6529cb2ea97bc75c9cd190d1ba901c0@eucas1p1.samsung.com>
	 <20260904-jh7110-clean-send-v3-13-484f9ae72715@samsung.com>
	 <1j5wzt8plp.fsf@starbuckisacylon.baylibre.com>
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: qwCowAA3D_P+frZqWmXzCA--.32169S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZFW5WrW3Kr47uw4UtFWrZrb_yoW5Aw4rpr
	s7Ca4rJFs0qF48Za4xX3WYqFW5Aan2ya45tFn7ZF10vr45Ka1UWw1vkF9xWF97XrZ7Cw13
	Wr4v9F4fuF4DXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Wrv_ZF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUnPl1DUUUUU==
X-Originating-IP: [120.85.96.244]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_070325_015215_B5D89EE9 
X-CRM114-Status: GOOD (  18.89  )
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

5ZyoIDIwMjYtMDktMjXkupTnmoQgMTQ6NDcgKzAyMDDvvIxKZXJvbWUgQnJ1bmV05YaZ6YGT77ya
Cj4gT24gdmVuLiAwNCBzZXB0LiAyMDI2IGF0IDE1OjI3LCBNaWNoYWwgV2lsY3p5bnNraQo+IDxt
LndpbGN6eW5za2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+IAo+ID4gVGhlIGRjODIwMF9waXgwIGFu
ZCBkYzgyMDBfcGl4MSBNVVhlcyBmZWVkIHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIsCj4gPiBhbmQK
PiA+IHRoZSByYXRlIHRoZXkgY2FycnkgaXMgdWx0aW1hdGVseSBwcm9kdWNlZCBieSB0aGUgSERN
SSBQSFksIHdoaWNoCj4gPiByZWdpc3RlcnMgaGRtaXR4MF9waXhlbGNsayBhcyBhIGNsb2NrIHBy
b3ZpZGVyLgo+ID4gCj4gPiBBZGQgQ0xLX1NFVF9SQVRFX1BBUkVOVCB0byBib3RoIE1VWGVzIHNv
IGEgcmF0ZSByZXF1ZXN0ZWQgb24gdGhlbQo+ID4gcmVhY2hlcyB0aGF0IHBhcmVudCwgaW5zdGVh
ZCBvZiBiZWluZyBjbGFtcGVkIHRvIHdoYXRldmVyIHJhdGUgdGhlCj4gPiBwYXJlbnQgYWxyZWFk
eSBoYXBwZW5zIHRvIHJ1biBhdC4KPiA+IAo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBEb21pbmlxdWUg
QmVsaGFjaGVtaSA8ZGJAZG9taWJlbC5kZT4KPiA+IFNpZ25lZC1vZmYtYnk6IERvbWluaXF1ZSBC
ZWxoYWNoZW1pIDxkYkBkb21pYmVsLmRlPgo+ID4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6
eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KPiA+IC0tLQo+ID4gwqBkcml2ZXJzL2Ns
ay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamg3MTEwLXZvdXQuYyB8IDYgKysrKy0tCj4gPiDCoDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamg3MTEwLXZvdXQu
Ywo+ID4gYi9kcml2ZXJzL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamg3MTEwLXZvdXQuYwo+
ID4gaW5kZXgKPiA+IGJhZDIwZDVkNzk0YTcyZjA3MWI0ZDU0N2I3MzA0Nzg2YThiYTlhZmEuLmFl
YmE0MmNkM2M0NGJhMjA1Y2VkNTJiMTgKPiA+IDI2ZDJkMmRlODJhZDc4ZiAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvY2xrL3N0YXJmaXZlL2Nsay1zdGFyZml2ZS1qaDcxMTAtdm91dC5jCj4gPiAr
KysgYi9kcml2ZXJzL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamg3MTEwLXZvdXQuYwo+ID4g
QEAgLTQwLDEwICs0MCwxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGpoNzF4MF9jbGtfZGF0YQo+
ID4gamg3MTEwX3ZvdXRjbGtfZGF0YVtdID0gewo+ID4gwqAJSkg3MVgwX0dBVEUoSkg3MTEwX1ZP
VVRDTEtfREM4MjAwX0FYSSwgImRjODIwMF9heGkiLCAwLAo+ID4gSkg3MTEwX1ZPVVRDTEtfVk9V
VF9UT1BfQVhJKSwKPiA+IMKgCUpINzFYMF9HQVRFKEpINzExMF9WT1VUQ0xLX0RDODIwMF9DT1JF
LCAiZGM4MjAwX2NvcmUiLCAwLAo+ID4gSkg3MTEwX1ZPVVRDTEtfVk9VVF9UT1BfQVhJKSwKPiA+
IMKgCUpINzFYMF9HQVRFKEpINzExMF9WT1VUQ0xLX0RDODIwMF9BSEIsICJkYzgyMDBfYWhiIiwg
MCwKPiA+IEpINzExMF9WT1VUQ0xLX1ZPVVRfVE9QX0FIQiksCj4gPiAtCUpINzFYMF9HTVVYKEpI
NzExMF9WT1VUQ0xLX0RDODIwMF9QSVgwLCAiZGM4MjAwX3BpeDAiLCAwLAo+ID4gMiwKPiA+ICsJ
Skg3MVgwX0dNVVgoSkg3MTEwX1ZPVVRDTEtfREM4MjAwX1BJWDAsICJkYzgyMDBfcGl4MCIsCj4g
PiArCQnCoMKgwqAgQ0xLX1NFVF9SQVRFX1BBUkVOVCB8Cj4gPiBDTEtfU0VUX1JBVEVfTk9fUkVQ
QVJFTlQsIDIsCj4gCj4gSSBzZWUgdGhhdCB5b3UndmUgYWRkZWQgQ0xLX1NFVF9SQVRFX05PX1JF
UEFSRU5UIGZvbGxvd2luZyBhIHByZXZpb3VzCj4gc2FzaGlrbyBhZHZpY2UuCgpJIHRoaW5rIHRo
ZSBwcm9ibGVtIGlzIHRoYXQgdGhlIElubm9zaWxpY29uIEhETUkgUEhZIGlzIGRlc2lnbmVkIHRv
IGJlCnNvbGVseSB0aGUgcGl4ZWwgY2xvY2sgcHJvdmlkZXIgd2hlbiBIRE1JIG91dHB1dCBpcyBl
bmFibGVkLCBzbyBtYW51YWwKY2xvY2sgcGFyZW50IGFzc2dpbm1lbnQgaXMgcmVxdWlyZWQgd2hl
biB1c2luZyBIRE1JIHRvIHByZXZlbnQgdGhlCmdlbmVyYWwgUExMIGZyb20gZHJpdmluZyB0aGUg
cGl4ZWwgY2xvY2ssIGFuZCBmb3IgRFNJIHRvIHByZXZlbnQKYWJ1c2luZyB0aGUgSERNSSBQSFkg
Y2xvY2sgZ2VuZXJhdG9yLgoKVGhhbmtzLApJY2Vub3d5Cgo+IAo+IE5vdGUgdGhhdCBzYXlpbmcg
aXQgd2lsbCAnaGlqYWNrJyB0aGUgcGFyZW50IHdpdGhvdXQgaXQgaXMga2luZCBvZgo+IHN0cm9u
Zy4gSXQgaXMgZmluZSB0byBsZXQgYSBtdXggcmVwYXJlbnQgd2hpbGUgc2V0dGluZyBhIHJhdGUs
IGFzCj4gbG9uZwo+IGFzIHlvdSB1bmRlcnN0YW5kIHRoZSBwb3NzaWJsZSBjb25zZXF1ZW5jZXMg
Zm9yIHRoZSByZXN0IG9mIHRoZSB0cmVlLgo+IAo+IFJlZ2FyZGxlc3MKPiAKPiBSZXZpZXdlZC1i
eTogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4gCj4gPiDCoAkJwqDCoMKg
IEpINzExMF9WT1VUQ0xLX0RDODIwMF9QSVgsCj4gPiDCoAkJwqDCoMKgIEpINzExMF9WT1VUQ0xL
X0hETUlUWDBfUElYRUxDTEspLAo+ID4gLQlKSDcxWDBfR01VWChKSDcxMTBfVk9VVENMS19EQzgy
MDBfUElYMSwgImRjODIwMF9waXgxIiwgMCwKPiA+IDIsCj4gPiArCUpINzFYMF9HTVVYKEpINzEx
MF9WT1VUQ0xLX0RDODIwMF9QSVgxLCAiZGM4MjAwX3BpeDEiLAo+ID4gKwkJwqDCoMKgIENMS19T
RVRfUkFURV9QQVJFTlQgfAo+ID4gQ0xLX1NFVF9SQVRFX05PX1JFUEFSRU5ULCAyLAo+ID4gwqAJ
CcKgwqDCoCBKSDcxMTBfVk9VVENMS19EQzgyMDBfUElYLAo+ID4gwqAJCcKgwqDCoCBKSDcxMTBf
Vk9VVENMS19IRE1JVFgwX1BJWEVMQ0xLKSwKPiA+IMKgCS8qIExDRCAqLwo+ID4gCj4gPiAtLSAK
PiA+IDIuMzQuMQo+ID4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
