Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D6CC5B572
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 04:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bD7Wis8M0bljKvXL2YRbmjQQaCJpt6j2Z+K1W1y0JCw=; b=L3OQLXw7IPiCYy
	sdoL6jOO3fmkaNTU9LdBUO3eiYzytv2G0v4Xvz9H3BjkEkSUs6LRvqqEBpcHAjsY235YiCMZXYNhn
	j91B/xQFc44eKfJELtxhbUI+maGWDDkSsnkr+EnlIBLvue/xkLlR3JcRhrrv+BtF6gYEHBURQFswZ
	0yYOBQ3bIKMQUC4+YLVZouSyq56qxydCb6x/JngtantqVIgcN98aXSp1P5NUTlvmtv7fe8kImugfI
	HqV0BLI9o7hZiZWJnGwmYfRmRA7eohplTEVxvII9x2wEk+Eku3WIeqBZQ+AbIhRw2xRKy8l1XuFFL
	KZWm32UFy9ZNBEeQ5fXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvouH-00000005P4k-1uRF;
	Mon, 17 Aug 2026 04:25:05 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvouE-00000005P4I-3IQq;
	Mon, 17 Aug 2026 04:25:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1786940677; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KzI1Y4GT+H6j9FEFK0hC47a08RldjqCxo5u3mTr9qqfKlDZVmoOyUfrXICQG2NwgpZ8FE+Ubh+4UDRciq9CJeHPkxgDzNKgqBl/Yc7CnKd5BKlAw4d8eyYUrBtYaF88x0PBTj8ufzJawkNoFIx2YqR47wv0jdVR13M5opHN3mhk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786940677; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZSlZwiisO+mhc+1mZ7YoDuogysbfOwIRDw36DrAX+ww=; 
	b=Aj1FAqPjgK//aBsflzglzkpsIq1CFmmkhwPTMRpw8QY3komjD3d3hIFDz+1EsBOYfH43VRJlBf9SdcMhp3oZJbu88LJtuRVSJKCyJH4uxcb9TCDkt82Exeu41HlBHQTR8YovOzeK73oE61S/5rHI8AKlD9pRVkfAOu1DIjGsbW8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786940677;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=ZSlZwiisO+mhc+1mZ7YoDuogysbfOwIRDw36DrAX+ww=;
	b=HT7ksXPEC2RKhnKUehEHLxm7khUfsKuBuVPRjd073C8/12ktpJHyDz4j/gGZbo+E
	xPufyVRRYjkXwSygr+EjDBIKq7Cneonu+it5XdiRURMqzCd00KOV1RUnr0Q+8Rr9hAq
	SDqkRDksgLZ0Au33T6acXvJzZnKPLb64VCWYYOk8XPr4MFvfBrrbD1bj4ZyxrFrYsIb
	JhW/c+XIqKuZdn0SOuq4cjJYIPxfaLpY055c118UZ/XMuDkgTyVeQBYwoqlY3dyPNhE
	FM0owtXUDG+0pC1nV9lQrAKteqTvnCOwyctLIoky65KZgPjh8kJvDOP9Tmep2u/Szpn
	HErGxyxb/g==
Received: by mx.zohomail.com with SMTPS id 1786940674891707.3346436865633;
	Sun, 16 Aug 2026 21:24:34 -0700 (PDT)
Message-ID: <3f0268a19aab46d602dffc9e14fc6683af7a20cd.camel@icenowy.me>
Subject: Re: [PATCH 02/12] clk: thead: th1520-ap: add support for MISC
 subsys clocks
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Michael Turquette
	 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Paul Walmsley	 <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Jisheng Zhang	 <jszhang@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, 	linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-gpio@vger.kernel.org,
 linux-phy@lists.infradead.org, 	linux-usb@vger.kernel.org, Han Gao
 <rabenda.cn@gmail.com>, Yao Zi	 <ziyao@disroot.org>
Date: Mon, 17 Aug 2026 12:24:26 +0800
In-Reply-To: <aoH9cvTC8vD4NYpB@x1>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
	 <20260507081710.4090814-3-zhengxingda@iscas.ac.cn>
	 <aier9XppLeCkJydw@thelio>
	 <93b867c1b7f5526cc25cb04f838432cd752f5981.camel@icenowy.me>
	 <aievi0s-3SO8hV6a@thelio> <aijpEqzJ7fM7rGMH@thelio> <aoH9cvTC8vD4NYpB@x1>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_212503_214295_933D950A 
X-CRM114-Status: GOOD (  24.73  )
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

5ZyoIDIwMjYtMDgtMTbml6XnmoQgMTE6MTIgLTA3MDDvvIxEcmV3IEZ1c3RpbmnlhpnpgZPvvJoK
PiBPbiBUdWUsIEp1biAwOSwgMjAyNiBhdCAwOTozMzoyMlBNIC0wNzAwLCBEcmV3IEZ1c3Rpbmkg
d3JvdGU6Cj4gPiBPbiBNb24sIEp1biAwOCwgMjAyNiBhdCAxMToxNTozOVBNIC0wNzAwLCBEcmV3
IEZ1c3Rpbmkgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgSnVuIDA5LCAyMDI2IGF0IDAyOjAxOjQzUE0g
KzA4MDAsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4gPiA+ID4g5ZyoIDIwMjYtMDYtMDjkuIDnmoQg
MjM6MDAgLTA3MDDvvIxEcmV3IEZ1c3RpbmnlhpnpgZPvvJoKPiA+ID4gPiA+IE9uIFRodSwgTWF5
IDA3LCAyMDI2IGF0IDA0OjE3OjAwUE0gKzA4MDAsIEljZW5vd3kgWmhlbmcKPiA+ID4gPiA+IHdy
b3RlOgo+ID4gPiA+ID4gPiBUaGUgVEgxNTIwIFNvQyBjb250YWlucyBhIE1JU0NfU1VCU1lTIGNs
b2NrIGNvbnRyb2xsZXIsCj4gPiA+ID4gPiA+IHdoaWNoCj4gPiA+ID4gPiA+IGFsbG93cwo+ID4g
PiA+ID4gPiBjb250cm9sbGluZyBvZiBVU0IgcmVsYXRlZCBjbG9ja3MgYW5kIE1NQy9TRCBjb250
cm9sbGVyIEFIQgo+ID4gPiA+ID4gPiBidXMKPiA+ID4gPiA+ID4gY2xvY2tzLgo+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gQWRkIHN1cHBvcnQgZm9yIHRoaXMgY2xvY2sgY29udHJvbGxlciwgaW4g
b3JkZXIgdG8gZW5hYmxlCj4gPiA+ID4gPiA+IFVTQgo+ID4gPiA+ID4gPiBzdXBwb3J0Lgo+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8emhlbmd4
aW5nZGFAaXNjYXMuYWMuY24+Cj4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiDCoGRyaXZlcnMv
Y2xrL3RoZWFkL2Nsay10aDE1MjAtYXAuYyB8IDY0Cj4gPiA+ID4gPiA+ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiA+ID4gPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNjQgaW5zZXJ0
aW9ucygrKQo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xr
L3RoZWFkL2Nsay10aDE1MjAtYXAuYwo+ID4gPiA+ID4gPiBiL2RyaXZlcnMvY2xrL3RoZWFkL2Ns
ay10aDE1MjAtYXAuYwo+ID4gPiA+ID4gPiBpbmRleCAzYTY4NDdmMWM5NTBmLi4yNGY3ODVmMGIz
MjlhIDEwMDY0NAo+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2Nsay90aGVhZC9jbGstdGgxNTIw
LWFwLmMKPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9jbGsvdGhlYWQvY2xrLXRoMTUyMC1hcC5j
Cj4gPiA+ID4gPiBbLi4uXQo+ID4gPiA+ID4gPiBAQCAtMTYwOSw2ICsxNjYzLDEyIEBAIHN0YXRp
YyBpbnQgdGgxNTIwX2Nsa19wcm9iZShzdHJ1Y3QKPiA+ID4gPiA+ID4gcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQo+ID4gPiA+ID4gPiDCoAkJCXJldHVybiByZXQ7Cj4gPiA+ID4gPiA+IMKgCX0KPiA+
ID4gPiA+ID4gwqAKPiA+ID4gPiA+ID4gKwlpZiAocGxhdF9kYXRhID09ICZ0aDE1MjBfYXBfcGxh
dGRhdGEpIHsKPiA+ID4gPiA+ID4gKwkJcmV0ID0gZGV2bV9jbGtfaHdfcmVnaXN0ZXIoZGV2LAo+
ID4gPiA+ID4gPiAmdXNiX3N1c3BlbmRfZGl2X2Nsay5odyk7Cj4gPiA+ID4gPiA+ICsJCWlmIChy
ZXQpCj4gPiA+ID4gPiA+ICsJCQlyZXR1cm4gcmV0Owo+ID4gPiA+ID4gPiArCX0KPiA+ID4gPiA+
IAo+ID4gPiA+ID4gU2hvdWxkIHVzYl9zdXNwZW5kX2Rpdl9jbGsuaHcgaW5zdGVhZCBiZSByZWdp
c3RlcmVkIHVuZGVyCj4gPiA+ID4gPiAnaWYgKHBsYXRfZGF0YSA9PSAmdGgxNTIwX2FwX3BsYXRk
YXRhKSc/Cj4gPiA+ID4gCj4gPiA+ID4gRG8geW91IG1lYW4gbWlzY19wbGF0ZGF0YT8KPiA+ID4g
PiAKPiA+ID4gPiBZZXMsIHRoaXMgaXMgYW4gY29weS1uLXBhc3RlIGVycm9yIHRoYXQgZGVzZXJ2
ZXMgYSBmaXguCj4gPiA+IAo+ID4gPiBIYWgsIHllcywgSSBhbHNvIGhhZCBhIHR5cG8gOikKPiA+
IAo+ID4gQXNzdW1pbmcgdGhhdCBnZXRzIGZpeGVkIGluIHRoZSBuZXh0IHJldjoKPiA+IAo+ID4g
UmV2aWV3ZWQtYnk6IERyZXcgRnVzaW5pIDxmdXN0aW5pQGtlcm5lbC5vcmc+Cj4gCj4gSSB3aWxs
IGZpeHVwIHRoZSB0eXBvIGFuZCBhcHBseSB0byB0aGVhZC1jbGstZm9yLW5leHQgb25jZSA3LjMt
cmMxIGlzCj4gcmVsZWFzZWQuCgpCVFcgSSB0aGluayB0aGUgYmluZGluZyBwYXRjaCBzaG91bGQg
Z28gdGhyb3VnaCB5b3VyIHRyZWUgdG9vLgoKVGhhbmtzLApJY2Vub3d5Cgo+IAo+IFRoYW5rcywK
PiBEcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
