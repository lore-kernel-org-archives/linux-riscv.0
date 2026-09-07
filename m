Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65A2C79F89
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 06:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DqTlxCBh8bYkuNVMRkLaxbuQbVStcDDrPbCvMzFI0ts=; b=2Li6AtlE/QAJXI
	PE3J4TBRC+L7UnagLXX0KuXY6C6J0KyEQbQLGCGLgY83gHfrkroZJP+V/kThblPdUW7a3X8QVqiXW
	r2ImUIGU4n6IW6FMrphxkIWXOLX9JHKzM8ooJ8RP0eL4Q238qxsP0MgPG9QfWvMwiiIy4T4BF+B29
	llTB/5elLr2vRbAXkAT1TD9GfcUMQ2AARYuJlsIMgju6VXCPdBRX7tQh5kdQKtwePwjDG4aD1bI+d
	OX6g2D0JO7XQKRky/b2wam6wp61Y/0pKDX72TOnXT+grcBQsFHIEU+FmUkvcWmyD0KpC3IFyEN9hq
	Xf1imFkHSknAhj5u1lwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TI8-0000000651s-3eUX;
	Mon, 07 Sep 2026 06:57:21 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TI6-0000000650F-1SVx;
	Mon, 07 Sep 2026 06:57:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788764158; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZV1f7mIa5Ivl4k9y4SDseO7sHW+HXOhGOnNA3H1xRbt1/D/ksjOmLYeU+FS4cmX+Hts6lkL1r8M+mCPrf6tfIzMjJB0b2sVzMmjqPU/3RUMi+047Y294fhETDs6iReJrrgYolwkXDS2m+zCVwGlte7A50w8KcoeS+6v+/RwWTr0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788764158; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1tMnWdSZi+sjkC4f5IyBKW6FS6ZeNXijReG8GKO87DM=; 
	b=dS9L/KG15nTBt2++e5uDJMfTNVAaWzLOQuZasm1GbtlC0sCA0bB1YA6nKDHauAHHIGDtz4Q7ivxhvg0CLUMOobpIBo+BNKxHD/ubsyigThw9IO3SwiDnd0li8ZdtFILkmNvA3GExDWArpzFXprIV1qzIu4e5vjtHSjKY2gyVYVQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788764158;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=1tMnWdSZi+sjkC4f5IyBKW6FS6ZeNXijReG8GKO87DM=;
	b=BMTjuTZBsLIrLLQbFYEi8z0UaWGJZJjxeSYYxBVe6/DSS+g6eYH8Pw9Pt2zTuGh1
	TbGJxgPa/cjnW41iWvSPZTs1m7utVbmLnfyAbfxAueT2zyPpCg3RW0zQ94/VavjbTLa
	BT486D9MNAmUPgxRieTGSu/8tMi27JGUaSFQv9cSqgbQSXgbbbRo5g0CUZ7AzmQiGIv
	lVFA+M7C37fn+a8D09cfSBJESxToQqJg0tFdJybljjyoXRxlc8kR2Nj8pfOZ7xd/k6f
	nuh5zp+4ma19vHlgD2e4mxkAw5n7TkeKvhRfuYzEaatVRNX9eGykxhWw4vjZjD/0S8c
	upQLI3pL0g==
Received: by mx.zohomail.com with SMTPS id 1788764154825847.2528940921899;
	Sun, 6 Sep 2026 23:55:54 -0700 (PDT)
Message-ID: <72f82ae67eca7b5a594d86852c8b0dafb7d02c4c.camel@icenowy.me>
Subject: Re: [PATCH v2 13/15] phy: starfive: Add jh7110-inno-hdmi-phy driver
From: Icenowy Zheng <uwu@icenowy.me>
To: Maud Spierings <maud_spierings@murena.io>, Dominique Belhachemi
	 <domibel@debian.org>
Cc: m.wilczynski@samsung.com, Laurent.pinchart@ideasonboard.com, 
	airlied@gmail.com, alex@ghiti.fr, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, 	andyshrk@163.com, aou@eecs.berkeley.edu,
 bmasney@redhat.com, conor+dt@kernel.org, 	conor@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	hal.feng@starfivetech.com, heiko@sntech.de, hello@big-grey.co.uk, 
	jernej.skrabec@gmail.com, jonas@kwiboo.se, kernel@esmil.dk,
 krzk+dt@kernel.org, 	lee@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, 	linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, 	luca.ceresoli@bootlin.com,
 m.szyprowski@samsung.com, 	maarten.lankhorst@linux.intel.com,
 maudspierings@gocontroll.com, 	mfd@lists.linux.dev, mripard@kernel.org,
 mturquette@baylibre.com, 	neil.armstrong@linaro.org,
 p.zabel@pengutronix.de, palmer@dabbelt.com, 	pjw@kernel.org,
 rfoss@kernel.org, robh@kernel.org, sboyd@kernel.org, simona@ffwll.ch, 
	tzimmermann@suse.de, vkoul@kernel.org
Date: Mon, 07 Sep 2026 14:55:42 +0800
In-Reply-To: <f68d95d0-f918-4dee-9443-38c64247b71a@murena.io>
References: <20260828-jh7110-clean-send-v2-13-331680c8b9d1@samsung.com>
	 <0ccb4168-ff88-459c-972d-3c091c155db2@murena.io>
	 <e780ecb8-918f-4816-99c8-b69b10b25a18@murena.io>
	 <CAAvaLCwvVUddS14MPx0FHdnp+QeZ99+ox17pXt2hSWPTCFcHtw@mail.gmail.com>
	 <cb0884b3-c9be-4cfd-ba43-27add3821ddd@murena.io>
	 <6a5f8c11a092cef83bae8d9ea0100c2fc133a514.camel@icenowy.me>
	 <CAAvaLCxMntrTbTQ9VNu4H_6LA30TRAqi7mCpn+x3hbTG9WqERA@mail.gmail.com>
	 <057d97bd4b63fa4445dd86548f2ecdcbe9c3b1b6.camel@icenowy.me>
	 <f68d95d0-f918-4dee-9443-38c64247b71a@murena.io>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_235718_417359_CA22A7EB 
X-CRM114-Status: GOOD (  31.88  )
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

5ZyoIDIwMjYtMDktMDfkuIDnmoQgMDg6MDIgKzAyMDDvvIxNYXVkIFNwaWVyaW5nc+WGmemBk++8
mgo+IEhpIERvbWluaXF1ZSBhbmQgSWNlbm93eSwKPiAKPiBPbiA5LzcvMjYgMDY6MDEsIEljZW5v
d3kgWmhlbmcgd3JvdGU6Cj4gPiDlnKggMjAyNi0wOS0wNuaXpeeahCAxNzoxNiAtMDQwMO+8jERv
bWluaXF1ZSBCZWxoYWNoZW1p5YaZ6YGT77yaCj4gPiA+IE9uIFN1biwgU2VwIDYsIDIwMjYgYXQg
MTE6MTnigK9BTSBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPiA+ID4gd3JvdGU6Cj4g
PiA+ID4gCj4gPiA+ID4g5ZyoIDIwMjYtMDktMDbml6XnmoQgMTY6NTkgKzAyMDDvvIxNYXVkIFNw
aWVyaW5nc+WGmemBk++8mgo+ID4gPiA+ID4gT24gOS82LzI2IDA3OjM5LCBEb21pbmlxdWUgQmVs
aGFjaGVtaSB3cm90ZToKPiA+ID4gPiA+ID4gT24gU3VuLCBBdWcgMzAsIDIwMjYgYXQgMTA6MTfi
gK9BTSBNYXVkIFNwaWVyaW5ncwo+ID4gPiA+ID4gPiA8Cj4gPiA+ID4gPiA+IG1hdWRfc3BpZXJp
bmdzQG11cmVuYS5pb8KgPG1haWx0bzptYXVkX3NwaWVyaW5nc0BtdXJlbmEuaW8+Pgo+ID4gPiA+
ID4gPiB3cm90ZToKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IMKgwqDCoMKgIEkgd2FzIHN0aWxs
IGhhdmluZyBzb21lIGdsaXRjaGluZyBoYXBwZW5pbmcgb24gdGhlCj4gPiA+ID4gPiA+IGRpc3Bs
YXksCj4gPiA+ID4gPiA+IGJ1dAo+ID4gPiA+ID4gPiBJJ3ZlCj4gPiA+ID4gPiA+IMKgwqDCoMKg
IGZvdW5kIHRoZSB3YXkgdG8gZml4IHRoYXQsIHRoZSBxdWVzdGlvbiBpcyB3aGF0IGlzCj4gPiA+
ID4gPiA+IGFjdHVhbGx5Cj4gPiA+ID4gPiA+IMKgwqDCoMKgIGhhcHBlbmluZyBoZXJlLgo+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCAweDI5NTkwMDIwIDwtIDB4MDAw
MDAwMDUKPiA+ID4gPiA+ID4gwqDCoMKgwqAgVGhpcyBvbmUgSSBoYXZlIG5vIGlkZWEsIGl0IGlz
IDB4MDAwMDAwMDkgd2l0aCB0aGlzCj4gPiA+ID4gPiA+IHBhdGNoCj4gPiA+ID4gPiA+IHNlcmll
cyBidXQKPiA+ID4gPiA+ID4gwqDCoMKgwqAgd2l0aCB0aGUgdmVuZG9yIGtlcm5lbCBJIGdldCB0
aGUgdmFsdWUgYWJvdmUuIFdoZW4gSQo+ID4gPiA+ID4gPiBob29rCj4gPiA+ID4gPiA+IHVwIG15
Cj4gPiA+ID4gPiA+IMKgwqDCoMKgIGV4dGVybmFsCj4gPiA+ID4gPiA+IMKgwqDCoMKgIGRpc3Bs
YXkgKHJlZ3VsYXIgMTQ0MHApIHRoaXMgYmVjb21lcyAweDAwMDAwMDBEIG9uIHRoZQo+ID4gPiA+
ID4gPiB2ZW5kb3IKPiA+ID4gPiA+ID4ga2VybmVsLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4g
wqDCoMKgwqAgQnV0IEkgY2FuJ3QgZmluZCB0aGlzIHJlZ2lzdGVyIGJlaW5nIHdyaXR0ZW4gdG8K
PiA+ID4gPiA+ID4gYW55d2hlcmUKPiA+ID4gPiA+ID4gdGhlcmU/Cj4gPiA+ID4gPiA+IAo+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gTWF5YmUgdGhpcyBuZWVkcyB0byBiZSBzd2FwcGVkPwo+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbm5vLWhkbWkuYwo+
ID4gPiA+ID4gPiDCoMKgwqAgLSNkZWZpbmUgdl9IU1lOQ19QT0xBUklUWShuKcKgwqDCoMKgwqDC
oMKgwqDCoCAoKG4pIDw8IDMpCj4gPiA+ID4gPiA+IMKgwqDCoCAtI2RlZmluZSB2X1ZTWU5DX1BP
TEFSSVRZKG4pwqDCoMKgwqDCoMKgwqDCoMKgICgobikgPDwgMikKPiA+ID4gPiA+ID4gwqDCoMKg
ICsjZGVmaW5lIHZfSFNZTkNfUE9MQVJJVFkobinCoMKgwqDCoMKgwqDCoMKgwqAgKChuKSA8PCAy
KQo+ID4gPiA+ID4gPiDCoMKgwqAgKyNkZWZpbmUgdl9WU1lOQ19QT0xBUklUWShuKcKgwqDCoMKg
wqDCoMKgwqDCoCAoKG4pIDw8IDMpCj4gPiA+ID4gCj4gPiA+ID4gVmVyeSB3ZWlyZGx5LCB0aGUg
b3JpZ2luYWwgZGVmaW5pdGlvbiBoZXJlIG1hdGNoZXMgY3VycmVudAo+ID4gPiA+IG1haW5saW5l
Cj4gPiA+ID4gaW5uby1oZG1pLmMsIGJ1dCB0aGUgY2hhbmdlZCBkZWZpbml0aW9uIG1hdGNoZXMg
Skg3MTEwIHZlbmRvcgo+ID4gPiA+IGlubm9faGRtaS5oIFsxXS4KPiA+ID4gPiAKPiA+ID4gCj4g
PiA+IFRoZSB2ZW5kb3IgY29kZSBpcyBjb3JyZWN0IGFuZCBtYXRjaGVzIHRoZSBSSzMxMjggVFJN
Lgo+ID4gCj4gPiBUaGFua3MgZm9yIHRoZSB0aXBzIG9uIGRvY3VtZW50YXRpb24sIGFuZCBJIHZl
cmlmaWVkIHRoaXMuCj4gPiAKPiA+IEl0IHNlZW1zIHRoYXQgUm9ja2NoaXAgcGVvcGxlIG1hZGUg
dGhpcyBhbHdheXMgd3JvbmcsIGV2ZW4gd2l0aAo+ID4gdGhlaXIKPiA+IHByZS1EUk0gZGlzcGxh
eSBkcml2ZXIuLi4gWzFdCj4gPiAKPiA+IEJUVyBJIGNoZWNrZWQgdGhlIElubm9zaWxpY29uIGRH
UFUgZHJpdmVyIGNvZGUsIGFuZCBpdHMKPiA+IGczX25lX2hkbWkuaAo+ID4gc291cmNlIGZpbGUg
YWxzbyBjb250YWlucyB0aGUgZGVmaW5pdGlvbiBvZiBCSVQoMykgYXMgVlNZTkMuIChJdCdzCj4g
PiBxdWl0ZSB3ZWlyZCB0aGF0IG1vc3QgbG9naWMgb2YgdGhhdCBkcml2ZXIgaXMgaW4gc29tZSAu
b19zaGlwcGVkCj4gPiBibG9iLAo+ID4gYnV0IGZvcnR1bmF0ZWx5IHRoZSBnMyBsb2dpYyBtaWdo
dCBiZSB0b28gbmV3IHRvIGJlIGNsb3NlZCBkb3duKQo+ID4gCj4gPiBUaGFua3MsCj4gPiBJY2Vu
b3d5Cj4gPiAKPiA+IFsxXQo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3JvY2tjaGlwLWxpbnV4L2tl
cm5lbC9ibG9iL3JlbGVhc2UtNC40L2RyaXZlcnMvdmlkZW8vcm9ja2NoaXAvaGRtaS9yb2NrY2hp
cC1oZG1pdjEvcm9ja2NoaXBfaGRtaXYxX2h3LmgjTDE2MQo+ID4gCj4gPiA+IAo+ID4gPiBIRE1J
X3JlZzA4Cj4gPiA+IMKgwqDCoMKgIEJpdMKgIEF0dHLCoCBSZXNldMKgIERlc2NyaXB0aW9uCj4g
PiA+IMKgwqDCoMKgIDPCoMKgwqAgUlfCoMKgwqAgMHgwwqDCoMKgIHZzX3BvbGFyaXR5wqDCoCBW
U1lOQyBwb2xhcml0ecKgwqAgMSdiMDoKPiA+ID4gTmVnYXRpdmUKPiA+ID4gMSdiMTogUG9zaXRp
dmUKPiA+ID4gwqDCoMKgwqAgMsKgwqDCoCBSV8KgwqDCoCAweDDCoMKgwqAgaHNfcG9sYXJpdHnC
oMKgIEhTWU5DIHBvbGFyaXR5wqDCoCAxJ2IwOgo+ID4gPiBOZWdhdGl2ZQo+ID4gPiAxJ2IxOiBQ
b3NpdGl2ZQo+ID4gPiAKPiA+ID4gTm9ib2R5IG5vdGljZWQgdGhpcyBzbyBmYXIgYmVjYXVzZSBp
biA3MjBwLzEwODBwIGJvdGggcG9sYXJpdGllcwo+ID4gPiBhcmUKPiA+ID4gcG9zaXRpdmUsIGJ1
dCBNYXVkJ3MgMzoyIHBhbmVsIGhhcyBkaWZmZXJpbmcgSC9WIHBvbGFyaXR5Lgo+ID4gPiAKPiA+
ID4gQmVzdAo+ID4gPiAtRG9taW5pcXVlCj4gCj4gVGhpcyBhbHNvIHNvbHZlcyB0aGUgZGV2bWVt
IGJlaGF2aW91ciBJIHNhdywgb3Igd2VsbCwgZG9lc24ndCByZWFseSAKPiBleHBsYWluIGl0IGJ1
dCBkb2VzIHNob3cgd2hhdCBpcyBhY3R1YWxseSBoYXBwZW5pbmcuIEFzIEljZW5vd3kgbm90ZWQK
PiAobWF5YmUgdGhhdCB3YXMgb24gdGVsZWdyYW0gb25seT8pIHRoZSBpbm5vLWhkbWkgcmVncyBh
cmUgOGJpdAo+IGluc3RlYWQgCj4gb2YgMzIgYml0Lgo+IAo+IFdoYXQgaXMgYWN0dWFsbHkgaGFw
cGVuaW5nIGlzOgo+IAo+IGRldm1lbSAweDI5NTkwMDAwIGIgcmVhZHMgMHgyOTU5MDAwMCBhcyBl
eHBlY3RlZAo+IGJ1dAo+IGRldm1lbSAweDI5NTkwMDA0IGIgcmVhZHMgMHgyOTU5MDAwMQo+IGRl
dm1lbSAweDI5NTkwMDA4IGIgcmVhZHMgMHgyOTU5MDAwMgo+IC4uLi4KPiBkZXZtZW0gMHgyOTU5
MDAyMCBiIHJlYWRzIDB4Mjk1OTAwMDgKPiAKPiBGb3Igc29tZSByZWFzb24gdGhlIGFkZHJlc3Np
bmcgaXMgd2VpcmQ/Cj4gCj4gV2l0aCB0aGlzIGNoYW5nZSwgdGhlIGFzc2lnbmVkIGNsb2NrIGNo
YW5nZSBhbmQgcmVtb3ZpbmcgdGhlIAo+IHZfUkVHX0NMS19JTlYgfCB2X1JFR19DTEtfU09VUkNF
X1NZUyB3cml0ZSB0byBIRE1JX1NZU19DVFJMLCB0aGUKPiBkaXNwbGF5IAo+IGNvbWVzIHVwIGZy
b20gdGhlIHN0YXJ0IGFzIGl0IHNob3VsZCEKCldlbGwgSSBjaGVja2VkIHRoZSBSSzMxMjggVFJN
IGZvciB0aGVzZSB0d28gYml0cywgYW5kIHRoZWlyIGZpZWxkCmRlc2NyaXB0aW9ucyBhcmUgLS0g
InJlc2VydmVkIi4KCldoYXQgY2FuIEkgcmVhY3QuLi4KClRoYW5rcywKSWNlbm93eQoKPiAKPiBL
aW5kIHJlZ2FyZHMsCj4gTWF1ZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
