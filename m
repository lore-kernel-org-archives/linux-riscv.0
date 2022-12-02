Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22060C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 06:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aMJmGfdPi03RmoppwAZegZG5fBt9zNy2kY/IvQTxrdM=; b=WP8TAaoMUts1M+
	vwHc+8uDq+UtBB12EDIa7XCFWaeA8GjQTe7qqpM3f2cwTKDRW8rNwewRznb6bhJiS38pOoTBst8Tj
	GPjw0CWAMnh1+eycnKJk2/mhgiHmBjIMBF+/uracTAZ9srJK3RHKFI49/eoXI9gy+F6hMiIZgOQV6
	fZzUyVTTNKjLlZ7luraN8Rb3U2uW/GmB2mPaZZdCTknwkJ1hODeLsAzYNsypad/BvkQfdbfvkJ0XZ
	5Djh199v7L1wJcX83nWshxrh+Ss5X5BpNyAIRufY9T+xscQ/Z7fpeWZHV8mk9uTr/YIp+ACJ0Xv2p
	+w0fCZsZm6fTjvXVv0hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0zIM-00DmH3-Kr; Fri, 02 Dec 2022 06:13:10 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0zIK-00DmFj-6q
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 06:13:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1669961582; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=njvltCNXE9INRA89a/A8l9GSmbg7W3g4FmXRdRNuO6xdy4g0oujIcGE5Gu4+tKwiFtaJlFEEgt5kTraGV3RVz2FWZ9dAjc8ibSG4Y8Vs7EHPAvU9GQUld2EKFI4/vfY1cOzTM3z0KdoFYOiWnweKh3zrh18nCrbNUROc0NmKst8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669961582; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=LbijN6aeKiT2uH/R45xRpGeOX2EWdCb/9cdCuJ6Cl7A=; 
	b=IYxavsz+nDjTwFh2K1reKptJC/obpCniagPMTSMXDYsiGpn0GdXbR9hOYEnShHbS93yhlMLiSz+ml4jfOX1YGwExmpdv15Q3of8S0R6YYYmJN5p9Qhqk1cdPsap0WqeRIY/msNsF8+/1ZY2lWobaJQtqaEG3tt7/Nga26itY764=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669961582;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=LbijN6aeKiT2uH/R45xRpGeOX2EWdCb/9cdCuJ6Cl7A=;
	b=iGu6Yzy2Pe5JHoPFFZBwlu8t1jOTksdOAjcSNJgzdU0IhBZg38k0FR7uaJfibg8D
	PCHgSeY7O7OJrVJGfpvjpgV9iosHNVNlftO+eb9JLWHb6n5rcu9ANPyxDIEMnPcgDEk
	WU7sPRNhg9sNk1ASyVsweBSKE4hmDVaIniji3aCw=
Received: from edelgard.fodlan.icenowy.me (120.85.99.229 [120.85.99.229]) by mx.zohomail.com
	with SMTPS id 1669961580397796.7845658650348; Thu, 1 Dec 2022 22:13:00 -0800 (PST)
Message-ID: <4ad56fa249a30167844abcedac53d198606511d8.camel@icenowy.me>
Subject: Re: [PATCH 2/3] dt-bindings: timer: sifive,clint: add compatible
 for OpenC906
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Marc Zyngier
 <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jisheng Zhang <jszhang@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Fri, 02 Dec 2022 14:12:54 +0800
In-Reply-To: <Y4j+Gpptk3NAFBNV@spud>
References: <20221121041757.418645-1-uwu@icenowy.me>
	 <20221121041757.418645-3-uwu@icenowy.me>
	 <98005150-83a7-5439-0db1-d93d459c3809@linaro.org>
	 <b924d37d716fa8b1fd93102b1d51fac221f43d59.camel@icenowy.me>
	 <d0f3ce4f-5676-f5e1-f04f-dd069679b2d3@linaro.org>
	 <81C2234E-C92D-4F78-8295-7C6DD0A9BBC4@icenowy.me>
	 <20221130181330.GA2544489-robh@kernel.org> <Y4j+Gpptk3NAFBNV@spud>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_221308_370421_F60DB352 
X-CRM114-Status: GOOD (  32.25  )
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

5ZyoIDIwMjItMTItMDHmmJ/mnJ/lm5vnmoQgMTk6MTggKzAwMDDvvIxDb25vciBEb29sZXnlhpnp
gZPvvJoKPiBPbiBXZWQsIE5vdiAzMCwgMjAyMiBhdCAxMjoxMzozMFBNIC0wNjAwLCBSb2IgSGVy
cmluZyB3cm90ZToKPiA+IE9uIFR1ZSwgTm92IDIyLCAyMDIyIGF0IDAzOjQxOjI3UE0gKzA4MDAs
IEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4gPiA+IAo+ID4gPiAKPiA+ID4g5LqOIDIwMjLlubQxMeac
iDIy5pelIEdNVCswODowMCDkuIvljYgzOjM1OjQ4LCBLcnp5c3p0b2YgS296bG93c2tpCj4gPiA+
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IOWGmeWIsDoKPiA+ID4gPiBPbiAyMi8x
MS8yMDIyIDA4OjE4LCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+ID4gPiA+ID4g5ZyoIDIwMjItMTEt
MjHmmJ/mnJ/kuIDnmoQgMTE6MDYgKzAxMDDvvIxLcnp5c3p0b2YgS296bG93c2tp5YaZ6YGT77ya
Cj4gPiA+ID4gPiA+IE9uIDIxLzExLzIwMjIgMDU6MTcsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4g
PiA+ID4gPiA+ID4gVC1IZWFkIE9wZW5DOTA2IGlzIGEgb3Blbi1zb3VyY2UtbGljZW5zZWQgZml4
ZWQtCj4gPiA+ID4gPiA+ID4gY29uZmlndXJhdGlvbiBvZgo+ID4gPiA+ID4gPiA+IEM5MDYsCj4g
PiA+ID4gPiA+ID4gd2hpY2ggaXMgbm93IHB1YmxpYyBhbmQgYWJsZSB0byBiZSBpbnRlZ3JhdGVk
Lgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEFkZCBhIGNvbXBhdGlibGUgZm9yIHRoZSBD
TElOVCBzaGlwcGVkIGFzIHBhcnQgb2YKPiA+ID4gPiA+ID4gPiBPcGVuQzkwNiwgd2hpY2gKPiA+
ID4gPiA+ID4gPiBzaG91bGQKPiA+ID4gPiA+ID4gPiBqdXN0IGJlIG9yZGluYXJ5IEM5eHggQ0xJ
TlQuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBa
aGVuZyA8dXd1QGljZW5vd3kubWU+Cj4gPiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+ID4gwqBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbQo+
ID4gPiA+ID4gPiA+IGwgfCAxICsKPiA+ID4gPiA+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQKPiA+ID4g
PiA+ID4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUs
Y2xpbnQueWEKPiA+ID4gPiA+ID4gPiBtbAo+ID4gPiA+ID4gPiA+IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YQo+ID4gPiA+ID4gPiA+IG1s
Cj4gPiA+ID4gPiA+ID4gaW5kZXggYWFkYTY5NTcyMTZjLi44NjcwM2U5OTVlMzEgMTAwNjQ0Cj4g
PiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhCj4gPiA+ID4gPiA+ID4gbWwKPiA+ID4gPiA+
ID4gPiArKysKPiA+ID4gPiA+ID4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy90aW1lci9zaWZpdmUsY2xpbnQueWEKPiA+ID4gPiA+ID4gPiBtbAo+ID4gPiA+ID4gPiA+IEBA
IC0zNSw2ICszNSw3IEBAIHByb3BlcnRpZXM6Cj4gPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLSBjb25zdDogc2lmaXZlLGNsaW50MAo+ID4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoCAt
IGl0ZW1zOgo+ID4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZW51bToKPiA+ID4g
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSB0aGVhZCxvcGVuYzkwNi1jbGlu
dAo+ID4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbGx3aW5uZXIs
c3VuMjBpLWQxLWNsaW50Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBBZGQgZW50cmllcyBzb3J0
ZWQgYWxwaGFiZXRpY2FsbHkuIFRoaXMgc2hvdWxkIGJlIHNxdWFzaGVkCj4gPiA+ID4gPiA+IHdp
dGgKPiA+ID4gPiA+ID4gcHJldmlvdXMKPiA+ID4gPiA+ID4gcGF0Y2guCj4gPiA+ID4gPiAKPiA+
ID4gPiA+IEkgbWFrZSBpdCBhIHNlcGVyYXRlZCBwYXRjaCBiZWNhdXNlIEkgdGhpbmsgaXQncyBh
Cj4gPiA+ID4gPiBxdWVzdGlvbmFibGUKPiA+ID4gPiA+IGFwcHJvYWNoLgo+ID4gPiA+ID4gCj4g
PiA+ID4gPiBJZiB5b3UgdGhpbmsgaXQncyBva2F5LCBJIHdpbGwganVzdCBzcXVhc2ggaXQgYW5k
IHB1dCBpdCBhcwo+ID4gPiA+ID4gdGhlIHNlY29uZAo+ID4gPiA+ID4gcGF0Y2ggaW4gdGhlIG5l
eHQgaXRlcmF0aW9uLCB3aXRoIGFkZGluZyBvcGVuYzkwNi1wbGljIGFzIHRoZQo+ID4gPiA+ID4g
Zmlyc3QKPiA+ID4gPiA+IG9uZS4KPiA+ID4gPiAKPiA+ID4gPiBXaGF0IGlzIGEgcXVlc3Rpb25h
YmxlIGFwcHJvYWNoPyBXaHkgY29tbWl0IG1zZyBpcyBub3Qgc2F5aW5nCj4gPiA+ID4gdGhpcz8K
PiA+ID4gCj4gPiA+IEFoIEkgbWVudGlvbmVkIGl0IGluIHRoZSBjb3ZlciBsZXR0ZXIuIFRoZSBw
cm9ibGVtIGlzIGp1c3QgSQo+ID4gPiBkb3VidCB3aGV0aGVyCj4gPiA+IGJpbmRpbmcgc3RyaW5n
cyBmb3Igc2luZ2xlIFNvQ3MgYXJlIG5lY2Vzc2FyeS4KPiA+IAo+ID4gVGhleSBhcmUuCj4gPiAK
PiA+IFVubGVzcyBhbGwgdGhlIHF1aXJrcy9idWdzL2ZlYXR1cmVzIGFyZSBzb21laG93IGd1YXJh
bnRlZWQgdG8gYmUKPiA+IGV4YWN0bHkgCj4gPiB0aGUgc2FtZSBhcyBvdGhlciBTb0NzIHNoYXJp
bmcgdGhlIHNhbWUgY29tcGF0aWJsZSBzdHJpbmcsIG9yIHRoZXJlCj4gPiBpcyAKPiA+IGFub3Ro
ZXIgbWVjaGFuaXNtIHRvIGlkZW50aWZ5IHRoZSBleGFjdCB2ZXJzaW9uIChlLmcuIGEgdmVyc2lv
biAKPiA+IHJlZ2lzdGVyKS4KPiAKPiBJY2Vub3d5LAo+IAo+IEhhdmluZyB0aG91Z2h0IGFib3V0
IHRoaXMgYSBsaXR0bGUgLSBhcmUgd2Ugbm90ICptb3JlKiBsaWtlbHkgdG8gc2VlCj4gYnVnL3F1
aXJrIGRpc3Bhcml0eSBiZXR3ZWVuIGltcGxlbWVudGF0aW9ucyBvZiB0aGUgT3BlbkM5MDYgc3R1
ZmYgYnkKPiB0aGUgdmVyeSBuYXR1cmUgb2YgYmVpbmcgYW4gb3Blbi1zb3VyY2UgSVA/CgpJdCdz
IGFuIG9wZW4tc291cmNlIGVkaXRpb24gb2YgYSBzcGVjaWZpYyB2ZXJzaW9uIG9mIHRoZSBjb21t
ZXJjaWFsIElQLAphIGZpeGVkIGNvbmZpZ3VyYXRpb24uCgpJbiBhZGRpdGlvbiwgbWF5YmUgd2Ug
Y2FuIGp1c3QgcmV0cmlldmUgdGhlIHZlcnNpb24gaW5mb21hdGlvbiB2aWEgYSBULQpIZWFkIGN1
c3RvbSBDUFUgY29uZmlndXJhdGlvbiByZWdpc3RlciwgbWNwdWlkLiBEZXNwaXRlIHRoZQppbXBs
ZW1lbnRhdGlvbiBvZiB0aGlzIHJlZ2lzdGVyIGlzIHdlaXJkIC0tIGl0IGNvbnRhaW5zIDcgZGlm
ZmVyZW50CnJlYWQtb25seSB2YWx1ZXMsIHdpdGggdGhlIG1vc3Qgc2lnbmlmaWNhbnQgbmliYmxl
IGJlaGF2aW5nIGFzIGFuCmluZGV4LgoKPiAKPiBUaGFua3MsCj4gQ29ub3IuCj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
