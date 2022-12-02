Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89277C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 08:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XFQTYFtXEFzf9nY5dkI87br4SPi4bMV4KFkTmy507g=; b=BkeEAOM+FL1GKR
	KRkeatIn8btHzHcEs01JOps48nACKSr5J1478FiDyot+nuqfYO30lXPabMkRNLXdnCf7l4MEtK8uB
	F/isrQto6bqIuKmx01DuQAye17OwMvl4jfeWwfDiiFEl8HvlkBgCFDn7QQCNhI/7Y8j6KoR78NxAw
	1b+3Ja9FcwPD7gfzWe0EEgoiq5f8eC9U60h+izpV8S4/lFhsEpVHQ35X0VL9m6b0gO8EoEZIYmG+P
	OGuvglqcEQlsSm7mQMLw98BPwsWuM4Alt2uN1Ybsvh6/bmaL1WuuolqH92sYWZi8llVVTBbN68u8q
	87AUSOxo+t3FNl3JNL0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p11Oh-00EVgZ-TB; Fri, 02 Dec 2022 08:27:51 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p11Oe-00EVfX-Lw; Fri, 02 Dec 2022 08:27:50 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1669969654; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Um7bLjMJkRzzGMWjDwOiZM7Q4Zr7Ff+nuz5l/iFK/JNF+0ZovQCa1Kbjs8pkQIt0dTDRsRvQAJWDQq8e/rEKwoRzdxvBOrNJ4NQiQ+Wum9zcGwvPS8jWeSWo+wTrhD0w1S97+qSCP51YXzX+AQkMU1I6YXsdcw3ydjSp+0trONE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669969654; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=QKJjRg+TFMrDUXn3W6BnSgamQp8z40egqO35KV5JwBc=; 
	b=kZo75enxAj+NBcU0ug9nHc7X7z1QXllK2apZH9Qvc4cRbREFPe+CUAeNHJ0WqJ3HRCbFW5LYRcQ3YsGWc+TwzqbFzAv6+9Y3//EjS4y0MNPOlzPopqF5XlX9Yc+tE8x9f/wAIzXkjL3puamR3r7jRQYk2nFV+j3Nf5dxIN7uChs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669969654;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=QKJjRg+TFMrDUXn3W6BnSgamQp8z40egqO35KV5JwBc=;
	b=fRboHy8wzAAEegZvuWhEkMLFDSeDl+tcJjEVq2ywfQ8zEUM7A8Q2yYc/DOY5CW3H
	TlxIaKCqNMyiePJGCVBqBuFx2Od557WAjw7N2hxXliBJXKmZJSAR44ILLskFDueGv1k
	RZjkF4GpphuSII4YU6X89wqgQZKaze+E68G1+lSo=
Received: from edelgard.fodlan.icenowy.me (120.85.99.229 [120.85.99.229]) by mx.zohomail.com
	with SMTPS id 1669969653716805.4032075516008; Fri, 2 Dec 2022 00:27:33 -0800 (PST)
Message-ID: <a2441e5ca47ff90474cd844801e6c7c43af91f50.camel@icenowy.me>
Subject: Re: [PATCH v2 04/12] riscv: dts: allwinner: Add the D1/D1s SoC
 devicetree
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor Dooley <conor@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
  linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang
 <jszhang@kernel.org>,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>,
 Atish Patra <atishp@rivosinc.com>, Christian Hewitt
 <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 Guo Ren <guoren@kernel.org>, Heinrich Schuchardt
 <heinrich.schuchardt@canonical.com>,  Linus Walleij
 <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stanislav Jakubek <stano.jakubek@gmail.com>
Date: Fri, 02 Dec 2022 16:27:25 +0800
In-Reply-To: <Y4I45Uu6eFKUo69B@spud>
References: <20221125234656.47306-1-samuel@sholland.org>
	 <20221125234656.47306-5-samuel@sholland.org> <Y4I45Uu6eFKUo69B@spud>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_002748_775743_A0478711 
X-CRM114-Status: GOOD (  27.41  )
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

5ZyoIDIwMjItMTEtMjbmmJ/mnJ/lha3nmoQgMTY6MDMgKzAwMDDvvIxDb25vciBEb29sZXnlhpnp
gZPvvJoKPiBPbiBGcmksIE5vdiAyNSwgMjAyMiBhdCAwNTo0Njo0OFBNIC0wNjAwLCBTYW11ZWwg
SG9sbGFuZCB3cm90ZToKPiA+IEQxIChha2EgRDEtSCksIEQxcyAoYWthIEYxMzMpLCBSNTI4LCBh
bmQgVDExMyBhcmUgYSBmYW1pbHkgb2YgU29Dcwo+ID4gYmFzZWQKPiA+IG9uIGEgc2luZ2xlIGRp
ZSwgb3IgYXQgYSBwYWlyIG9mIGRpZXMgZGVyaXZlZCBmcm9tIHRoZSBzYW1lIGRlc2lnbi4KPiA+
IAo+ID4gRDEgYW5kIEQxcyBjb250YWluIGEgc2luZ2xlIFQtSEVBRCBYdWFudGllIEM5MDYgQ1BV
LCB3aGVyZWFzIFI1MjgKPiA+IGFuZAo+ID4gVDExMyBjb250YWluIGEgcGFpciBvZiBDb3J0ZXgt
QTcncy4KPiAKPiBJcyB0aGlzICJhZGRpdGlvbmFsbHkgY29udGFpbiIgb3IgYSBjYXNlIG9mIHRo
ZSBEMSBpcyB0aGUgUjUyOCBidXQKPiB3aXRoCj4gcy9hcm0vcmlzY3YvPyBJdCdzIHRoZSBsYXR0
ZXIsIHJpZ2h0PwoKVGVjaG5pY2FsbHkgdGhleSdyZSB0aGUgc2FtZSBkaWUsIGJ1dCB0aGUgQ1BV
IGNvcmVzIGFyZSBzZWxlY3RpdmVseQplbmFibGVkLCBhbmQgYXQgbGVhc3Qgd2hhdCBBbGx3aW5u
ZXIgc2F5cyBpcyB0aGF0IEQxIGNvbnRhaW5zIG9ubHkgUlYKYW5kIFI1MjggY29udGFpbnMgb25s
eSBBUk0uCgo+IAo+ID4gRDEgYW5kIFI1MjggYXJlIHRoZSBmdWxsIHZlcnNpb24gb2YKPiA+IHRo
ZSBjaGlwIHdpdGggYSBCR0EgcGFja2FnZSwgd2hlcmVhcyBEMXMgYW5kIFQxMTMgYXJlIGxvdy1w
aW4tY291bnQKPiA+IFFGUAo+ID4gdmFyaWFudHMuCj4gPiAKPiA+IEJlY2F1c2UgdGhlIG9yaWdp
bmFsIGRlc2lnbiBzdXBwb3J0ZWQgYm90aCBBUk0gYW5kIFJJU0MtViBDUFVzLAo+ID4gc29tZQo+
ID4gcGVyaXBoZXJhbHMgYXJlIGR1cGxpY2F0ZWQuIEluIGFkZGl0aW9uLCBhbGwgdmFyaWFudHMg
ZXhjZXB0IEQxcwo+ID4gY29udGFpbgo+ID4gYSBIaUZpIDQgRFNQIHdpdGggaXRzIG93biBzZXQg
b2YgcGVyaXBoZXJhbHMuCj4gPiAKPiA+IFRoZSBkZXZpY2V0cmVlcyBhcmUgb3JnYW5pemVkIHRv
IG1pbmltaXplIGR1cGxpY2F0aW9uOgo+ID4gwqAtIENvbW1vbiBwZXJoaXBlcmFscyBhcmUgZGVz
Y3JpYmVkIGluIHN1bnhpLWQxcy10MTEzLmR0c2kKPiA+IMKgLSBEU1AtcmVsYXRlZCBwZXJpcGhl
cmFscyBhcmUgZGVzY3JpYmVkIGluIHN1bnhpLWQxLXQxMTMuZHRzaQo+ID4gwqAtIFJJU0MtViBz
cGVjaWZpYyBoYXJkd2FyZSBpcyBkZXNjcmliZWQgaW4gc3VuMjBpLWQxcy5kdHNpCj4gPiDCoC0g
RnVuY3Rpb25hbGl0eSB1bmlxdWUgdG8gdGhlIEQxIHZhcmlhbnQgaXMgZGVzY3JpYmVkIGluIHN1
bjIwaS0KPiA+IGQxLmR0c2kKPiA+IAo+ID4gVGhlIFNPQ19QRVJJUEhFUkFMX0lSUSBtYWNybyBo
YW5kbGVzIHRoZSBkaWZmZXJlbnQgI2ludGVycnVwdC1jZWxscwo+ID4gdmFsdWVzIGJldHdlZW4g
dGhlIEFSTSAoR0lDKSBhbmQgUklTQy1WIChQTElDKSB2ZXJzaW9ucyBvZiB0aGUgU29DLgo+IAo+
IE1vZHVsbyB0aGUgd2FybmluZ3MgSSByZXBsaWVkIHRvIHRoZSBjb3ZlciB3aXRoICYgb25lIG1p
bm9yIGNvbW1lbnQKPiBiZWxvdzoKPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5k
b29sZXlAbWljcm9jaGlwLmNvbT4KPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5k
IDxzYW11ZWxAc2hvbGxhbmQub3JnPgo+ID4gLS0tCj4gPiAKPiA+IENoYW5nZXMgaW4gdjI6Cj4g
PiDCoC0gU3BsaXQgaW50byBzZXBhcmF0ZSBmaWxlcyBmb3Igc2hhcmluZyB3aXRoIEQxcy9SNTI4
L1QxMTMKPiA+IMKgLSBVc2UgU09DX1BFUklQSEVSQUxfSVJRIG1hY3JvIGZvciBpbnRlcnJ1cHRz
Cj4gPiDCoC0gUmVuYW1lIG9zYzI0TSB0byBkY3hvIGFuZCBtb3ZlIHRoZSBmcmVxdWVuY3kgdG8g
dGhlIGJvYXJkIERUcwo+ID4gwqAtIERyb3AgYW5hbG9nIExET3MgZHVlIHRvIHRoZSBtaXNzaW5n
IGJpbmRpbmcKPiA+IMKgLSBDb3JyZWN0IHRjb25fdG9wIERTSSBjbG9jayByZWZlcmVuY2UKPiA+
IMKgLSBBZGQgRE1JQywgRFNJIGNvbnRyb2xsZXIsIGFuZCBEUEhZIChiaW5kaW5ncyBhcmUgaW4g
bGludXgtbmV4dCkKPiA+IMKgLSBBZGQgQ1BVIE9QUCB0YWJsZQo+ID4gCj4gPiDCoGFyY2gvcmlz
Y3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMS5kdHNpwqAgfMKgIDY2ICsrCj4gPiDCoGFy
Y2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMXMuZHRzaSB8wqAgNzYgKysKPiA+
IMKgLi4uL2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1kMS10MTEzLmR0c2nCoMKgwqDCoCB8wqAg
MTUgKwo+ID4gwqAuLi4vYm9vdC9kdHMvYWxsd2lubmVyL3N1bnhpLWQxcy10MTEzLmR0c2nCoMKg
wqAgfCA4NDQKPiA+ICsrKysrKysrKysrKysrKysrKwo+ID4gwqA0IGZpbGVzIGNoYW5nZWQsIDEw
MDEgaW5zZXJ0aW9ucygrKQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290
L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWQxLmR0c2kKPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGFy
Y2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMXMuZHRzaQo+ID4gwqBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDEtCj4gPiB0
MTEzLmR0c2kKPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvYWxs
d2lubmVyL3N1bnhpLWQxcy0KPiA+IHQxMTMuZHRzaQo+IAo+IAo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bnhpLWQxcy10MTEzLmR0c2kKPiA+IGIvYXJj
aC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaQo+ID4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYzg4MTVjYmYwYjQ2Cj4gPiAt
LS0gL2Rldi9udWxsCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54
aS1kMXMtdDExMy5kdHNpCj4gPiBAQCAtMCwwICsxLDg0NCBAQAo+ID4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMCsgb3IgTUlUKQo+ID4gKy8vIENvcHlyaWdodCAoQykgMjAy
MS0yMDIyIFNhbXVlbCBIb2xsYW5kIDxzYW11ZWxAc2hvbGxhbmQub3JnPgo+ID4gKwo+ID4gKyNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9zdW42aS1ydGMuaD4KPiA+ICsjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvY2xvY2svc3VuOGktZGUyLmg+Cj4gPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Ns
b2NrL3N1bjhpLXRjb24tdG9wLmg+Cj4gPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3N1
bjIwaS1kMS1jY3UuaD4KPiA+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svc3VuMjBpLWQx
LXItY2N1Lmg+Cj4gPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVy
L2lycS5oPgo+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9yZXNldC9zdW44aS1kZTIuaD4KPiA+
ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVzZXQvc3VuMjBpLWQxLWNjdS5oPgo+ID4gKyNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9yZXNldC9zdW4yMGktZDEtci1jY3UuaD4KPiA+ICsKPiA+ICsvIHsK
PiA+ICvCoMKgwqDCoMKgwqDCoCNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4gK8KgwqDCoMKgwqDC
oMKgI3NpemUtY2VsbHMgPSA8MT47Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBkY3hvOiBkY3hv
LWNsayB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29tcGF0aWJsZSA9ICJm
aXhlZC1jbG9jayI7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogVGhpcyB2
YWx1ZSBtdXN0IGJlIG92ZXJyaWRkZW4gYnkgdGhlIGJvYXJkICovCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgY2xvY2stZnJlcXVlbmN5ID0gPDA+Owo+IAo+IFNpbmNlIHRoaXMg
aXMgYSAibXVzdCIsIGNhbiB5b3UgZHJvcCB0aGUgY2xvY2stZnJlcXVlbmN5ID0gPDA+IGhlcmUK
PiBzbwo+IHRoYXQgaWYgc29tZW9uZSBkb2Vzbid0IG92ZXJyaWRlIGl0IGluIHRoZWlyIGJvYXJk
IGR0LXZhbGlkYXRlCj4gY29tcGxhaW5zPwo+IAo+IFRoYW5rcywKPiBDb25vci4KPiAKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjbG9jay1vdXRwdXQtbmFtZXMgPSAiZGN4byI7
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgI2Nsb2NrLWNlbGxzID0gPDA+Owo+
ID4gK8KgwqDCoMKgwqDCoMKgfTsKPiA+ICsKPiDCoAo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
