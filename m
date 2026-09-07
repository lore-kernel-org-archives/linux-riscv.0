Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250F0C79F9E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 04:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASbRNXkfYJqriLKzRAqmwT4kTiJ4kuV9xQSzmSYrrpA=; b=c4sEIJ6cnhDnSt
	Rkj36xUoyxg4GKB+CQRa68fRCUg6G58Oc4MBCB7rwUXCsODWqCxMin4MjZTADXLyu7UeDS6LROUMz
	hF9/daUxTZU44dloiIYke5Zm9ZQtE10Kli5ZE2JVfT2mM4If4BQiXxLhw209Qy4xMsAFp04dpolp/
	p/mZHaKQuXJRgz7QA0cjfEgru8Mw8DCfZIKrjl9xni9KP6fRWV1Cjv5hbkY7QsdiQqmsxhzeH1jGh
	JD9OKi93+CGn0AkHAOQ3U6XbCkEfIHgaJu+O7yN8z+Apb5AV+fFaipB2r9IuJBZt7PoFVZulFCYHs
	R4gYiY0G8V485np05zLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3QZb-00000005pgK-27Gg;
	Mon, 07 Sep 2026 04:03:11 +0000
Received: from sender5-op-o12.zoho.com ([165.173.182.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3QZU-00000005pfQ-2QzI;
	Mon, 07 Sep 2026 04:03:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788753687; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GmgJfMtf8nKDYhL/y5mV/4bNYFhWRjAXbiCOMeLj8n/V5CVYE3TJ1oQO588JLThSNoXs8na/h1QQiGlk8/+UkubO+Y3+TagcA/M+XKS5XW7e8UO+EERfGt+CFRN2cgOTfHGaa5y/Hz9HvV/t9Xv3/0qNiVqnzm2F0qso+Rrq5/M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788753687; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xZdWr5iB4U0Mel5njbzbHnomGSClIHf9G9kkOjT0NSU=; 
	b=gAyw2KHgApq0A7LXr3MDWUoBoRD3N40pFBbuVqSAkqPwV1VVR9Xr3y+abWyMyCrQhojcvppSuAKn2nCMjObobYLjsZuvyDDAp33Rrz5a9uYDI9iw8go7ImHwUgMVN9VVsUxqVZfyEffdmk+U7q3ECJMMVzlnl1J9fe7yI6m7p1o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788753687;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=xZdWr5iB4U0Mel5njbzbHnomGSClIHf9G9kkOjT0NSU=;
	b=Hn4zdwaHpLWdVp/Ei3bXX/qZRio3cEAZQvfZfTg6B82Ac1UI9c3R+SjyuZhHWm2z
	KjE2ZLockaaqR0Wnk+b9aMVd5YW9a9hYslb4deN4Ix282OVlt8E/hsSV3wOWwd/gm8a
	L6VA92ctg9YQAWWbSTeYTN7GuHu2HGlslRl93ANnPGveRb0S7XEdVXdYkl4SPFtkHFP
	1fLCF3VScGAQ4Y4U1IsnnxD2aofdFAkVyMDRymBcTphtpwQeoSh/9GGrlg9xR2wmYIF
	XBVoHp3k3yRADdslVz22o36V7Taaln1IDrWJLknqDvDj84p4TZKtj9Gydz37ymyiWQ1
	hPPMnogHww==
Received: by mx.zohomail.com with SMTPS id 1788753684704244.47592390011243;
	Sun, 6 Sep 2026 21:01:24 -0700 (PDT)
Message-ID: <057d97bd4b63fa4445dd86548f2ecdcbe9c3b1b6.camel@icenowy.me>
Subject: Re: [PATCH v2 13/15] phy: starfive: Add jh7110-inno-hdmi-phy driver
From: Icenowy Zheng <uwu@icenowy.me>
To: Dominique Belhachemi <domibel@debian.org>
Cc: Maud Spierings <maud_spierings@murena.io>, m.wilczynski@samsung.com, 
	Laurent.pinchart@ideasonboard.com, airlied@gmail.com, alex@ghiti.fr, 
	andrzej.hajda@intel.com, andy.yan@rock-chips.com, andyshrk@163.com, 
	aou@eecs.berkeley.edu, bmasney@redhat.com, conor+dt@kernel.org,
 conor@kernel.org, 	devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 	hal.feng@starfivetech.com,
 heiko@sntech.de, hello@big-grey.co.uk, 	jernej.skrabec@gmail.com,
 jonas@kwiboo.se, kernel@esmil.dk, krzk+dt@kernel.org, 	lee@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	luca.ceresoli@bootlin.com, m.szyprowski@samsung.com, 
	maarten.lankhorst@linux.intel.com, maudspierings@gocontroll.com, 
	mfd@lists.linux.dev, mripard@kernel.org, mturquette@baylibre.com, 
	neil.armstrong@linaro.org, p.zabel@pengutronix.de, palmer@dabbelt.com, 
	pjw@kernel.org, rfoss@kernel.org, robh@kernel.org, sboyd@kernel.org,
 simona@ffwll.ch, 	tzimmermann@suse.de, vkoul@kernel.org
Date: Mon, 07 Sep 2026 12:01:13 +0800
In-Reply-To: <CAAvaLCxMntrTbTQ9VNu4H_6LA30TRAqi7mCpn+x3hbTG9WqERA@mail.gmail.com>
References: <20260828-jh7110-clean-send-v2-13-331680c8b9d1@samsung.com>
	 <0ccb4168-ff88-459c-972d-3c091c155db2@murena.io>
	 <e780ecb8-918f-4816-99c8-b69b10b25a18@murena.io>
	 <CAAvaLCwvVUddS14MPx0FHdnp+QeZ99+ox17pXt2hSWPTCFcHtw@mail.gmail.com>
	 <cb0884b3-c9be-4cfd-ba43-27add3821ddd@murena.io>
	 <6a5f8c11a092cef83bae8d9ea0100c2fc133a514.camel@icenowy.me>
	 <CAAvaLCxMntrTbTQ9VNu4H_6LA30TRAqi7mCpn+x3hbTG9WqERA@mail.gmail.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_210304_657764_DA61F726 
X-CRM114-Status: GOOD (  21.53  )
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

5ZyoIDIwMjYtMDktMDbml6XnmoQgMTc6MTYgLTA0MDDvvIxEb21pbmlxdWUgQmVsaGFjaGVtaeWG
memBk++8mgo+IE9uIFN1biwgU2VwIDYsIDIwMjYgYXQgMTE6MTnigK9BTSBJY2Vub3d5IFpoZW5n
IDx1d3VAaWNlbm93eS5tZT4gd3JvdGU6Cj4gPiAKPiA+IOWcqCAyMDI2LTA5LTA25pel55qEIDE2
OjU5ICswMjAw77yMTWF1ZCBTcGllcmluZ3PlhpnpgZPvvJoKPiA+ID4gT24gOS82LzI2IDA3OjM5
LCBEb21pbmlxdWUgQmVsaGFjaGVtaSB3cm90ZToKPiA+ID4gPiBPbiBTdW4sIEF1ZyAzMCwgMjAy
NiBhdCAxMDoxN+KAr0FNIE1hdWQgU3BpZXJpbmdzCj4gPiA+ID4gPG1hdWRfc3BpZXJpbmdzQG11
cmVuYS5pb8KgPG1haWx0bzptYXVkX3NwaWVyaW5nc0BtdXJlbmEuaW8+Pgo+ID4gPiA+IHdyb3Rl
Ogo+ID4gPiA+IAo+ID4gPiA+IMKgwqDCoCBJIHdhcyBzdGlsbCBoYXZpbmcgc29tZSBnbGl0Y2hp
bmcgaGFwcGVuaW5nIG9uIHRoZSBkaXNwbGF5LAo+ID4gPiA+IGJ1dAo+ID4gPiA+IEkndmUKPiA+
ID4gPiDCoMKgwqAgZm91bmQgdGhlIHdheSB0byBmaXggdGhhdCwgdGhlIHF1ZXN0aW9uIGlzIHdo
YXQgaXMgYWN0dWFsbHkKPiA+ID4gPiDCoMKgwqAgaGFwcGVuaW5nIGhlcmUuCj4gPiA+ID4gCj4g
PiA+ID4gwqDCoMKgwqDCoMKgwqAgMHgyOTU5MDAyMCA8LSAweDAwMDAwMDA1Cj4gPiA+ID4gwqDC
oMKgIFRoaXMgb25lIEkgaGF2ZSBubyBpZGVhLCBpdCBpcyAweDAwMDAwMDA5IHdpdGggdGhpcyBw
YXRjaAo+ID4gPiA+IHNlcmllcyBidXQKPiA+ID4gPiDCoMKgwqAgd2l0aCB0aGUgdmVuZG9yIGtl
cm5lbCBJIGdldCB0aGUgdmFsdWUgYWJvdmUuIFdoZW4gSSBob29rCj4gPiA+ID4gdXAgbXkKPiA+
ID4gPiDCoMKgwqAgZXh0ZXJuYWwKPiA+ID4gPiDCoMKgwqAgZGlzcGxheSAocmVndWxhciAxNDQw
cCkgdGhpcyBiZWNvbWVzIDB4MDAwMDAwMEQgb24gdGhlCj4gPiA+ID4gdmVuZG9yCj4gPiA+ID4g
a2VybmVsLgo+ID4gPiA+IAo+ID4gPiA+IMKgwqDCoCBCdXQgSSBjYW4ndCBmaW5kIHRoaXMgcmVn
aXN0ZXIgYmVpbmcgd3JpdHRlbiB0byBhbnl3aGVyZQo+ID4gPiA+IHRoZXJlPwo+ID4gPiA+IAo+
ID4gPiA+IAo+ID4gPiA+IE1heWJlIHRoaXMgbmVlZHMgdG8gYmUgc3dhcHBlZD8KPiA+ID4gPiAK
PiA+ID4gPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lubm8taGRtaS5jCj4gPiA+ID4gwqDCoCAt
I2RlZmluZSB2X0hTWU5DX1BPTEFSSVRZKG4pwqDCoMKgwqDCoMKgwqDCoMKgICgobikgPDwgMykK
PiA+ID4gPiDCoMKgIC0jZGVmaW5lIHZfVlNZTkNfUE9MQVJJVFkobinCoMKgwqDCoMKgwqDCoMKg
wqAgKChuKSA8PCAyKQo+ID4gPiA+IMKgwqAgKyNkZWZpbmUgdl9IU1lOQ19QT0xBUklUWShuKcKg
wqDCoMKgwqDCoMKgwqDCoCAoKG4pIDw8IDIpCj4gPiA+ID4gwqDCoCArI2RlZmluZSB2X1ZTWU5D
X1BPTEFSSVRZKG4pwqDCoMKgwqDCoMKgwqDCoMKgICgobikgPDwgMykKPiA+IAo+ID4gVmVyeSB3
ZWlyZGx5LCB0aGUgb3JpZ2luYWwgZGVmaW5pdGlvbiBoZXJlIG1hdGNoZXMgY3VycmVudCBtYWlu
bGluZQo+ID4gaW5uby1oZG1pLmMsIGJ1dCB0aGUgY2hhbmdlZCBkZWZpbml0aW9uIG1hdGNoZXMg
Skg3MTEwIHZlbmRvcgo+ID4gaW5ub19oZG1pLmggWzFdLgo+ID4gCj4gCj4gVGhlIHZlbmRvciBj
b2RlIGlzIGNvcnJlY3QgYW5kIG1hdGNoZXMgdGhlIFJLMzEyOCBUUk0uCgpUaGFua3MgZm9yIHRo
ZSB0aXBzIG9uIGRvY3VtZW50YXRpb24sIGFuZCBJIHZlcmlmaWVkIHRoaXMuCgpJdCBzZWVtcyB0
aGF0IFJvY2tjaGlwIHBlb3BsZSBtYWRlIHRoaXMgYWx3YXlzIHdyb25nLCBldmVuIHdpdGggdGhl
aXIKcHJlLURSTSBkaXNwbGF5IGRyaXZlci4uLiBbMV0KCkJUVyBJIGNoZWNrZWQgdGhlIElubm9z
aWxpY29uIGRHUFUgZHJpdmVyIGNvZGUsIGFuZCBpdHMgZzNfbmVfaGRtaS5oCnNvdXJjZSBmaWxl
IGFsc28gY29udGFpbnMgdGhlIGRlZmluaXRpb24gb2YgQklUKDMpIGFzIFZTWU5DLiAoSXQncwpx
dWl0ZSB3ZWlyZCB0aGF0IG1vc3QgbG9naWMgb2YgdGhhdCBkcml2ZXIgaXMgaW4gc29tZSAub19z
aGlwcGVkIGJsb2IsCmJ1dCBmb3J0dW5hdGVseSB0aGUgZzMgbG9naWMgbWlnaHQgYmUgdG9vIG5l
dyB0byBiZSBjbG9zZWQgZG93bikKClRoYW5rcywKSWNlbm93eQoKWzFdCmh0dHBzOi8vZ2l0aHVi
LmNvbS9yb2NrY2hpcC1saW51eC9rZXJuZWwvYmxvYi9yZWxlYXNlLTQuNC9kcml2ZXJzL3ZpZGVv
L3JvY2tjaGlwL2hkbWkvcm9ja2NoaXAtaGRtaXYxL3JvY2tjaGlwX2hkbWl2MV9ody5oI0wxNjEK
Cj4gCj4gSERNSV9yZWcwOAo+IMKgwqDCoCBCaXTCoCBBdHRywqAgUmVzZXTCoCBEZXNjcmlwdGlv
bgo+IMKgwqDCoCAzwqDCoMKgIFJXwqDCoMKgIDB4MMKgwqDCoCB2c19wb2xhcml0ecKgwqAgVlNZ
TkMgcG9sYXJpdHnCoMKgIDEnYjA6IE5lZ2F0aXZlCj4gMSdiMTogUG9zaXRpdmUKPiDCoMKgwqAg
MsKgwqDCoCBSV8KgwqDCoCAweDDCoMKgwqAgaHNfcG9sYXJpdHnCoMKgIEhTWU5DIHBvbGFyaXR5
wqDCoCAxJ2IwOiBOZWdhdGl2ZQo+IDEnYjE6IFBvc2l0aXZlCj4gCj4gTm9ib2R5IG5vdGljZWQg
dGhpcyBzbyBmYXIgYmVjYXVzZSBpbiA3MjBwLzEwODBwIGJvdGggcG9sYXJpdGllcyBhcmUKPiBw
b3NpdGl2ZSwgYnV0IE1hdWQncyAzOjIgcGFuZWwgaGFzIGRpZmZlcmluZyBIL1YgcG9sYXJpdHku
Cj4gCj4gQmVzdAo+IC1Eb21pbmlxdWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
