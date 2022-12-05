Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42BEC4321E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 11:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NSQB0wtd/vKfE1BSCoCSSR2dco5wthoWWNaeAaC7Nz0=; b=XQzjlpxS72xKeA
	2qdXkAl/4A0URn/jaCPof8AiH+tzUnprxRfRZBKAVyTll8u7F9KBXj4QP6xrMWohfUZ0FjylElsiw
	g3u1dAn+z1NSyP1X2lLXOOvwcAOZFQzuNDTKOcmyqUNUL1LdXT4Ll+nOjkpHwCIA8u6or8G0F3KK/
	cui35YYP8niZRWWvUTlqQE6erXxD7jk9M0MWtDFONNzqU6wdVlbmDofErcMj2licp/lGegtGQgf/F
	VfCkz6tA4N5tcasBnOfGyOAbDr+Fk4Gofv833+h1rYsfcaJ3NWpvYDYoxgk5VyTQcskI+q3aQt8Os
	7MbrjOoLd6F3btkJUH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p29GD-001SFN-Dj; Mon, 05 Dec 2022 11:03:45 +0000
Received: from sender3-op-o18.zoho.com ([136.143.184.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p29G9-001SET-OT
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 11:03:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1670238205; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dCg4L4dDwtUFfG26pp3MyF8p17XNUTGmBxNM8y8NIA4DDp7mqXy0T5jL5m16R5BfzufupFRzzCMTmrRM0Zxu7m4pHiCgFtEi0uk0GkhXSNlBhQdTvocuCGvA91fAebtA4syW7/fCUTpDwfoUDTah9GEd5WHaqPTjhliVrT9bS6I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1670238205; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=qqmUi98VANfk0PufkZdOVcDiymv+qgsHjWmqFJQ5X8s=; 
	b=fB9KHUif2F8HCU7guYPqfQrxRDHMI6hxL54nHOt9nX00zBB0MXJS5sXmmhAZwl4Y1BmYiaYSJ4CNqVF0Rqqc75GyiLxV0UZWgCcUcTUDBrCPyQib4IEHo7vNNxAg35Q9qLO6zbzyRZJsvpTBTeAjS8XHh5XhSMaNsG/7h4S5JI8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1670238205;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=qqmUi98VANfk0PufkZdOVcDiymv+qgsHjWmqFJQ5X8s=;
	b=V0Yb2KDHkPy5QzDgxAdB6hcvdIo9/h5nK28X5LTlXdnsK3121DiaM2Lg9LrNJmzi
	Q58YBu09jugZMqNS8TN3ywBkTNlkhfSpRaWIcWL7Ea+r+y67MwsscpEvpX1hYszT1ls
	q3QRTzqDI5eAaHms1lKEsXDVcv4HBpKNtNJ/CZXk=
Received: from edelgard.fodlan.icenowy.me (120.85.99.143 [120.85.99.143]) by mx.zohomail.com
	with SMTPS id 1670238202532178.59673950121748; Mon, 5 Dec 2022 03:03:22 -0800 (PST)
Message-ID: <75a3ef9a175b16c46b57b2829ecbe4f97737de8a.camel@icenowy.me>
Subject: Re: [PATCH 2/3] dt-bindings: timer: sifive,clint: add compatible
 for OpenC906
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Marc Zyngier
 <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,  Paul Walmsley
 <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jisheng Zhang <jszhang@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Mon, 05 Dec 2022 19:03:17 +0800
In-Reply-To: <Y43Jt3YOSbFyh954@wendy>
References: <20221121041757.418645-1-uwu@icenowy.me>
	 <20221121041757.418645-3-uwu@icenowy.me>
	 <98005150-83a7-5439-0db1-d93d459c3809@linaro.org>
	 <b924d37d716fa8b1fd93102b1d51fac221f43d59.camel@icenowy.me>
	 <d0f3ce4f-5676-f5e1-f04f-dd069679b2d3@linaro.org>
	 <81C2234E-C92D-4F78-8295-7C6DD0A9BBC4@icenowy.me>
	 <20221130181330.GA2544489-robh@kernel.org> <Y4j+Gpptk3NAFBNV@spud>
	 <4ad56fa249a30167844abcedac53d198606511d8.camel@icenowy.me>
	 <Y43Jt3YOSbFyh954@wendy>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_030341_849576_3250A1B9 
X-CRM114-Status: GOOD (  43.28  )
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

5ZyoIDIwMjItMTItMDXmmJ/mnJ/kuIDnmoQgMTA6MzYgKzAwMDDvvIxDb25vciBEb29sZXnlhpnp
gZPvvJoKPiBPbiBGcmksIERlYyAwMiwgMjAyMiBhdCAwMjoxMjo1NFBNICswODAwLCBJY2Vub3d5
IFpoZW5nIHdyb3RlOgo+ID4g5ZyoIDIwMjItMTItMDHmmJ/mnJ/lm5vnmoQgMTk6MTggKzAwMDDv
vIxDb25vciBEb29sZXnlhpnpgZPvvJoKPiA+ID4gT24gV2VkLCBOb3YgMzAsIDIwMjIgYXQgMTI6
MTM6MzBQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+ID4gT24gVHVlLCBOb3YgMjIs
IDIwMjIgYXQgMDM6NDE6MjdQTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiA+ID4gPiA+
IAo+ID4gPiA+ID4gCj4gPiA+ID4gPiDkuo4gMjAyMuW5tDEx5pyIMjLml6UgR01UKzA4OjAwIOS4
i+WNiDM6MzU6NDgsIEtyenlzenRvZiBLb3psb3dza2kKPiA+ID4gPiA+IDxrcnp5c3p0b2Yua296
bG93c2tpQGxpbmFyby5vcmc+IOWGmeWIsDoKPiA+ID4gPiA+ID4gT24gMjIvMTEvMjAyMiAwODox
OCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiA+ID4gPiA+ID4gPiDlnKggMjAyMi0xMS0yMeaYn+ac
n+S4gOeahCAxMTowNiArMDEwMO+8jEtyenlzenRvZiBLb3psb3dza2nlhpnpgZPvvJoKPiA+ID4g
PiA+ID4gPiA+IE9uIDIxLzExLzIwMjIgMDU6MTcsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4gPiA+
ID4gPiA+ID4gPiA+IFQtSGVhZCBPcGVuQzkwNiBpcyBhIG9wZW4tc291cmNlLWxpY2Vuc2VkIGZp
eGVkLQo+ID4gPiA+ID4gPiA+ID4gPiBjb25maWd1cmF0aW9uIG9mCj4gPiA+ID4gPiA+ID4gPiA+
IEM5MDYsCj4gPiA+ID4gPiA+ID4gPiA+IHdoaWNoIGlzIG5vdyBwdWJsaWMgYW5kIGFibGUgdG8g
YmUgaW50ZWdyYXRlZC4KPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+IEFkZCBh
IGNvbXBhdGlibGUgZm9yIHRoZSBDTElOVCBzaGlwcGVkIGFzIHBhcnQgb2YKPiA+ID4gPiA+ID4g
PiA+ID4gT3BlbkM5MDYsIHdoaWNoCj4gPiA+ID4gPiA+ID4gPiA+IHNob3VsZAo+ID4gPiA+ID4g
PiA+ID4gPiBqdXN0IGJlIG9yZGluYXJ5IEM5eHggQ0xJTlQuCj4gPiA+ID4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93
eS5tZT4KPiA+ID4gPiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+ID4gPiA+IMKgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludAo+ID4gPiA+ID4gPiA+
ID4gPiAueWFtCj4gPiA+ID4gPiA+ID4gPiA+IGwgfCAxICsKPiA+ID4gPiA+ID4gPiA+ID4gwqAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+ID4gPiA+IGRpZmYgLS1naXQKPiA+ID4gPiA+ID4gPiA+ID4gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW4KPiA+ID4gPiA+ID4gPiA+ID4gdC55
YQo+ID4gPiA+ID4gPiA+ID4gPiBtbAo+ID4gPiA+ID4gPiA+ID4gPiBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbgo+ID4gPiA+ID4gPiA+ID4gPiB0
LnlhCj4gPiA+ID4gPiA+ID4gPiA+IG1sCj4gPiA+ID4gPiA+ID4gPiA+IGluZGV4IGFhZGE2OTU3
MjE2Yy4uODY3MDNlOTk1ZTMxIDEwMDY0NAo+ID4gPiA+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+
ID4gPiA+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZl
LGNsaW4KPiA+ID4gPiA+ID4gPiA+ID4gdC55YQo+ID4gPiA+ID4gPiA+ID4gPiBtbAo+ID4gPiA+
ID4gPiA+ID4gPiArKysKPiA+ID4gPiA+ID4gPiA+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW4KPiA+ID4gPiA+ID4gPiA+ID4gdC55YQo+ID4g
PiA+ID4gPiA+ID4gPiBtbAo+ID4gPiA+ID4gPiA+ID4gPiBAQCAtMzUsNiArMzUsNyBAQCBwcm9w
ZXJ0aWVzOgo+ID4gPiA+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBz
aWZpdmUsY2xpbnQwCj4gPiA+ID4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoCAtIGl0ZW1zOgo+ID4g
PiA+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGVudW06Cj4gPiA+ID4gPiA+ID4g
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHRoZWFkLG9wZW5jOTA2LWNsaW50Cj4g
PiA+ID4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbGx3aW5uZXIs
c3VuMjBpLWQxLWNsaW50Cj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IEFkZCBlbnRy
aWVzIHNvcnRlZCBhbHBoYWJldGljYWxseS4gVGhpcyBzaG91bGQgYmUKPiA+ID4gPiA+ID4gPiA+
IHNxdWFzaGVkCj4gPiA+ID4gPiA+ID4gPiB3aXRoCj4gPiA+ID4gPiA+ID4gPiBwcmV2aW91cwo+
ID4gPiA+ID4gPiA+ID4gcGF0Y2guCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gSSBtYWtl
IGl0IGEgc2VwZXJhdGVkIHBhdGNoIGJlY2F1c2UgSSB0aGluayBpdCdzIGEKPiA+ID4gPiA+ID4g
PiBxdWVzdGlvbmFibGUKPiA+ID4gPiA+ID4gPiBhcHByb2FjaC4KPiA+ID4gPiA+ID4gPiAKPiA+
ID4gPiA+ID4gPiBJZiB5b3UgdGhpbmsgaXQncyBva2F5LCBJIHdpbGwganVzdCBzcXVhc2ggaXQg
YW5kIHB1dCBpdAo+ID4gPiA+ID4gPiA+IGFzCj4gPiA+ID4gPiA+ID4gdGhlIHNlY29uZAo+ID4g
PiA+ID4gPiA+IHBhdGNoIGluIHRoZSBuZXh0IGl0ZXJhdGlvbiwgd2l0aCBhZGRpbmcgb3BlbmM5
MDYtcGxpYyBhcwo+ID4gPiA+ID4gPiA+IHRoZQo+ID4gPiA+ID4gPiA+IGZpcnN0Cj4gPiA+ID4g
PiA+ID4gb25lLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gV2hhdCBpcyBhIHF1ZXN0aW9uYWJs
ZSBhcHByb2FjaD8gV2h5IGNvbW1pdCBtc2cgaXMgbm90Cj4gPiA+ID4gPiA+IHNheWluZwo+ID4g
PiA+ID4gPiB0aGlzPwo+ID4gPiA+ID4gCj4gPiA+ID4gPiBBaCBJIG1lbnRpb25lZCBpdCBpbiB0
aGUgY292ZXIgbGV0dGVyLiBUaGUgcHJvYmxlbSBpcyBqdXN0IEkKPiA+ID4gPiA+IGRvdWJ0IHdo
ZXRoZXIKPiA+ID4gPiA+IGJpbmRpbmcgc3RyaW5ncyBmb3Igc2luZ2xlIFNvQ3MgYXJlIG5lY2Vz
c2FyeS4KPiA+ID4gPiAKPiA+ID4gPiBUaGV5IGFyZS4KPiA+ID4gPiAKPiA+ID4gPiBVbmxlc3Mg
YWxsIHRoZSBxdWlya3MvYnVncy9mZWF0dXJlcyBhcmUgc29tZWhvdyBndWFyYW50ZWVkIHRvCj4g
PiA+ID4gYmUKPiA+ID4gPiBleGFjdGx5IAo+ID4gPiA+IHRoZSBzYW1lIGFzIG90aGVyIFNvQ3Mg
c2hhcmluZyB0aGUgc2FtZSBjb21wYXRpYmxlIHN0cmluZywgb3IKPiA+ID4gPiB0aGVyZQo+ID4g
PiA+IGlzIAo+ID4gPiA+IGFub3RoZXIgbWVjaGFuaXNtIHRvIGlkZW50aWZ5IHRoZSBleGFjdCB2
ZXJzaW9uIChlLmcuIGEgdmVyc2lvbgo+ID4gPiA+IHJlZ2lzdGVyKS4KPiA+ID4gCj4gPiA+IElj
ZW5vd3ksCj4gPiA+IAo+ID4gPiBIYXZpbmcgdGhvdWdodCBhYm91dCB0aGlzIGEgbGl0dGxlIC0g
YXJlIHdlIG5vdCAqbW9yZSogbGlrZWx5IHRvCj4gPiA+IHNlZQo+ID4gPiBidWcvcXVpcmsgZGlz
cGFyaXR5IGJldHdlZW4gaW1wbGVtZW50YXRpb25zIG9mIHRoZSBPcGVuQzkwNiBzdHVmZgo+ID4g
PiBieQo+ID4gPiB0aGUgdmVyeSBuYXR1cmUgb2YgYmVpbmcgYW4gb3Blbi1zb3VyY2UgSVA/Cj4g
PiAKPiA+IEl0J3MgYW4gb3Blbi1zb3VyY2UgZWRpdGlvbiBvZiBhIHNwZWNpZmljIHZlcnNpb24g
b2YgdGhlIGNvbW1lcmNpYWwKPiA+IElQLAo+ID4gYSBmaXhlZCBjb25maWd1cmF0aW9uLgo+ID4g
Cj4gPiBJbiBhZGRpdGlvbiwgbWF5YmUgd2UgY2FuIGp1c3QgcmV0cmlldmUgdGhlIHZlcnNpb24g
aW5mb21hdGlvbiB2aWEKPiA+IGEgVC0KPiA+IEhlYWQgY3VzdG9tIENQVSBjb25maWd1cmF0aW9u
IHJlZ2lzdGVyLCBtY3B1aWQuIERlc3BpdGUgdGhlCj4gPiBpbXBsZW1lbnRhdGlvbiBvZiB0aGlz
IHJlZ2lzdGVyIGlzIHdlaXJkIC0tIGl0IGNvbnRhaW5zIDcgZGlmZmVyZW50Cj4gPiByZWFkLW9u
bHkgdmFsdWVzLCB3aXRoIHRoZSBtb3N0IHNpZ25pZmljYW50IG5pYmJsZSBiZWhhdmluZyBhcyBh
bgo+ID4gaW5kZXguCj4gCj4gWW91IGxvdCBhbGwga25vdyB0aGUgc2l0dWF0aW9uIGhlcmUgYSBs
b3QgbW9yZSB0aGFuIEkgZG8uLi4KPiBJIGRvbid0IHRoaW5rICJsZXR0aW5nIiBwZW9wbGUgdXNl
IHRoZSBiYXJlICJ0aGVhZCxjOTAwLWZvbyIgbWFrZXMKPiBtdWNoCj4gc2Vuc2UgYXMgaXQgZ2l2
ZXMgdXMgbm8gY2hhbmNlIHRvIGRlYWwgd2l0aCBxdWlya3MgZG93biB0aGUgbGluZS4KCldlbGws
IGFmdGVyIHJlY2hlY2tpbmcgdGhlIG1hbnVhbCwgSSBmb3VuZCBpdCBwb3NzaWJsZSB0byBoYW5k
bGUgcXVpcmtzCi0tIFQtSGVhZCBoYXMgYSBjdXN0b20gIm1jcHVpZCIgQ1NSIChAIFJJU0MtViBD
U1IgMHhGQzApLCB3aGljaCBjYW4gYmUKdXNlZCB0byByZXRyaWV2ZSBzb21lIGlkZW50aWZpY2F0
aW9uIGluZm8gb2YgdGhlIGNvcmUsIGluY2x1ZGluZyBpdHMKbW9kZWwgSUQsIHZlcnNpb24sIGV0
YzsgYW5kIHRoZSBULUhlYWQgUExJQy9DTElOVCBhcmUgcGFydCBvZiB0aGVpcgpDOTA2IFNvQyBk
ZXNpZ24gdGhhdCB0aGVyZSdzIGFub3RoZXIgIm1hcGJhZGRyIiBDU1IgdGhhdCBjb3VsZCBiZSB1
c2VkCnRvIHJldHJpZXZlIHRoZSBiYXNlIGFkZHJlc3Mgb2YgdGhlbS4KClNvIEkgdGhpbmsgaXQg
b2theSB0byBqdXN0IHVzZSAidGhlYWQsYzkwMC1jbGludCIgaGVyZSwgYW5kIHdoZW4KbmVjZXNz
YXJ5LCB0cnkgdG8gcmV0cmlldmUgbWNwdWlkIGZvciBkZWFsaW5nIHdpdGggcXVpcmtzLgoKPiBJ
IGRvbid0IHRoaW5rIHRoYXQgdXNpbmcgInRoZWFkLG9wZW5jOTA2LWNsaW50IiwgInRoZWFkLGM5
MDAtY2xpbnQiCj4gbWFrZXMgYWxsIHRoYXQgbXVjaCBzZW5zZSBlaXRoZXIsIGluIGNhc2Ugc29t
ZW9uZSBkb2VzIHNvbWV0aGluZwo+IHdhY2t5Cj4gd2l0aCB0aGUgb3Blbi1zb3VyY2UgdmVyc2lv
biBvZiB0aGUgY29yZS4KPiAKPiBUaGF0IGxlYXZlcyB1cyB3aXRoIGVpdGhlcjoKPiAidmVuZG9y
LHNvYy1jbGludCIsICJ0aGVhZCxvcGVuYzkwNi1jbGludCIsICJ0aGVhZCxjOTAwLWNsaW50Igo+
IG9yOgo+ICJ2ZW5kb3Isc29jLWNsaW50IiwgInRoZWFkLGM5MDAtY2xpbnQiCj4gcmlnaHQ/Cj4g
Cj4gVGhlIGZpcnN0IG9uZSBzZWVtcyBsaWtlIHBvc3NpYmx5IHRoZSBiZXR0ZXIgb3B0aW9uIGFz
IHlvdSdkIGtpbmRhCj4gZXhwZWN0IHRoYXQsIGluIGEgcGVyZmVjdCB3b3JkLCBhbGwgb2YgdGhl
IG9wZW4tc291cmNlIElQCj4gaW1wbGVtZW50YXRpb25zIHdvdWxkIHNoYXJlIHF1aXJrcyBldGM/
Cj4gCj4gVGhhbmtzLAo+IENvbm9yLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
