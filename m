Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE59D35159
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 08:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Message-Id:Date:In-Reply-To:
	References:Mime-Version:Subject:Cc:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3w8b1VwKPicbmXjxIVcLZl32X+K+xn/dAeubPsfiz0=; b=mNO9W7BGEQ/rZ1
	m02oqm6Bh8bHMwRQ7FRTJSIzgQlTrqpB+Yz0GawlxvDACP/DxbmY0urQleX3J60ZEfdMp/eWPOFsN
	D30cUFhnMoBWPbjRKtuqP+XtxaG0VtM7ege29Fub6AZRMI2PgE5yPdUlGonG7cv1y0xrjp8igSu1g
	ae7NBAlu+AATN6GZoQ3htixofU8ioVkbd74BEjhM+0S9yuViyD+aoJghUlK4dFyrC2eVLIsoQerWG
	E4uTRHwMoELsz1dt0S84P4A1OOouZFSLFiuBnuFHAtz+Z5m2X3UF3/SZ6FHgZJNVgWpsSXiuZYb0E
	/M/0Hy5MmEIuEAmQC47g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qtE-0000000EJW7-1KFc;
	Wed, 01 Apr 2026 08:25:28 +0000
Received: from va-2-26.ptr.blmpb.com ([209.127.231.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qtB-0000000EJVj-1jvw
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 08:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1775031919;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=tA6DsNKjq4P1IEPY7eb3gOlNiAuxuQ3EReYIBxNYIfY=;
 b=fkoP8igm+XLXGqk1JREOiTRjBxp7Lyk/2WbQZgXzWsAzQ+Q20ZpzS6j8vQ+vOyF7L3JmrB
 LySgfIbzRWrG1KyK6UyG5wGNd056qNd8tghqT97lo37ClVRKE8xnvTZEsEgu8yaktR4Uxc
 zPCxuVBDwpjQBnFsRV4Rr4K3rTJGNKEatxhGXgVDZHLeFgfYK10+mFX+JhD2M5BZfPPTLF
 4aMeMo8cSjtMxOyw3HLoBrAzdq86pQe9mEhQs8wt+SzNgOArjtr5drNwHPefVz0hCWrYED
 TaWLz/wKsl/KQZEwphR6fFQSV1EAtX/f25Dj5rm4pEN8qyssGEVg8S4usCL/2Q==
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Yixun Lan" <dlan@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] riscv: dts: spacemit: add DeepComputing FML13V05 board device tree
Mime-Version: 1.0
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io> <20260331034616.67183-1-sandie.cao@deepcomputing.io> <20260331085925-GKB976850@kernel.org> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.4c756029.b64e.488e.905e.99baaf78d6a1@feishu.cn> <DHHM43F6TE9I.1F5A3O0VOS6ND@linux.spacemit.com> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.20e9d5ae.574e.4942.b529.0e22091ba551@feishu.cn>
	<DHHNO3MKPLX6.10BU0B83KT0GV@linux.spacemit.com>
In-Reply-To: <DHHNO3MKPLX6.10BU0B83KT0GV@linux.spacemit.com>
Date: Wed, 01 Apr 2026 16:25:15 +0800
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.f3ceeab2.be39.4d04.88c1.0f125b2e2f91@feishu.cn>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+169ccd66d+bc36e6+lists.infradead.org+sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_012525_534826_B90B484B 
X-CRM114-Status: GOOD (  28.17  )
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

SGkgVHJveSwKCj4gRnJvbTogIlRyb3kgTWl0Y2hlbGwiPHRyb3kubWl0Y2hlbGxAbGludXguc3Bh
Y2VtaXQuY29tPgo+IERhdGU6wqAgV2VkLCBBcHIgMSwgMjAyNiwgMTU6NTUKCj4gT24gV2VkIEFw
ciAxLCAyMDI2IGF0IDM6MzggUE0gQ1NULCDmm7nnj4rnj4ogd3JvdGU6Cj4gPiBIaSBUcm95LAo+
ID4KPiA+PiBGcm9tOiAiVHJveSBNaXRjaGVsbCI8dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1p
dC5jb20+Cj4gPj4gRGF0ZTrCoCBXZWQsIEFwciAxLCAyMDI2LCAxNDo0Mgo+ID4KPiA+PiBPbiBX
ZWQgQXByIDEsIDIwMjYgYXQgMjoxMCBQTSBDU1QsIOabueePiuePiiB3cm90ZToKPiA+PiA+IEhp
IExhbiwKPiA+PiA+Cj4gPj4gPj4gRnJvbTogIllpeHVuIExhbiI8ZGxhbkBrZXJuZWwub3JnPgo+
ID4+ID4+IEhpIFNhbmRpZSzCoAo+ID4+ID4+wqAKPiA+PiA+PiBPbiAxMTo0NiBUdWUgMzEgTWFy
IMKgIMKgICwgU2FuZGllIENhbyB3cm90ZToKPiA+PiA+PiA+IEZyb206IHNhbmRpZWNhbyA8c2Fu
ZGllLmNhb0BkZWVwY29tcHV0aW5nLmlvPgo+ID4+ID4+ID7CoAo+ID4+ID4+ID4gVGhlIEZNTDEz
VjA1IGJvYXJkIGZyb20gRGVlcENvbXB1dGluZyBpbmNvcnBvcmF0ZXMgYSBTcGFjZW1pVCBLMyBS
SVNDLVYKPiA+PiA+PiA+IFNvQy5JdCBpcyBhIG1haW5ib2FyZCBkZXNpZ25lZCBmb3IgdGhlIEZy
YW1ld29yayBMYXB0b3AgMTMgQ2hhc3NpcywKPiA+PiA+PiA+IHdoaWNoIGhhcyAoRnJhbWV3b3Jr
KSBTS1UgRlJBTkhRMDAwMS4KPiA+PiA+PiA+wqAKPiA+PiA+PiA+IFRoZSBGTUwxM1YwNSBib2Fy
ZCBmZWF0dXJlczoKPiA+PiA+PiA+IC0gU3BhY2VtaVQgSzMgUklTQy1WIFNvQwo+ID4+ID4+ID4g
LSBMUEREUjUgMTZHQiBvciAzMkdCCj4gPj4gPj4gPiAtIGVNTUMgMzJHQiB+MTI4R0IgKE9wdGlv
bmFsKQo+ID4+ID4+ID4gLSBVRlMgMy4xIDI1NkcgKE9wdGlvbmFsKQo+ID4+ID4+ID4gLSBRU1BJ
IEZsYXNoCj4gPj4gPj4gPiAtIE1pY3JvU0QgU2xvdAo+ID4+ID4+ID4gLSBQQ0llLWJhc2VkIFdp
LUZpCj4gPj4gPj4gPiAtIDQgVVNCLUMgUG9ydHMKPiA+PiA+PiA+IMKgLSBQb3J0IDE6IFBEIDMu
MCAoNjVXIE1heCksIFVTQiAzLjIgR2VuIDEKPiA+PiA+PiA+IMKgLSBQb3J0IDI6IFBEIDMuMCAo
NjVXIE1heCksIFVTQiAzLjIgR2VuIDEsIERQIDEuNCAoNEtANjBIeikKPiA+PiA+PiA+IMKgLSBQ
b3J0IDMgJiA0OiBVU0IgMy4yIEdlbiAxCj4gPj4gPj4gPsKgCj4gPj4gPj4gPiBUaGlzIG1pbmlt
YWwgZGV2aWNlIHRyZWUgZW5hYmxlcyBib290aW5nIGludG8gYSBzZXJpYWwgY29uc29sZSB3aXRo
IFVBUlQKPiA+PiA+PiA+IG91dHB1dC4KPiA+PiA+PiA+wqAKPiA+PiA+PiA+IFNpZ25lZC1vZmYt
Ynk6IHNhbmRpZWNhbyA8c2FuZGllLmNhb0BkZWVwY29tcHV0aW5nLmlvPgo+ID4+ID4+ID4gUmV2
aWV3ZWQtYnk6IEhlaW5yaWNoIFNjaHVjaGFyZHQgPGhlaW5yaWNoLnNjaHVjaGFyZHRAY2Fub25p
Y2FsLmNvbT4KPiA+PiA+PiA+ICsmdWFydDAgewo+ID4+ID4+IENhbiB5b3UgYWxzbyBhZGQgcGlu
Y3RybCBkYXRhIGV4cGxpY2l0bHk/Cj4gPj4gPgo+ID4+ID4gVG8gYXZvaWQgY29uZmxpY3QswqAg
dGhlIGNvbW1vbiBwaW5jdHJsIHRhYmxlICJrMy1waW5jdHJsLmR0c2kiIHNob3VsZCBiZSB1cGxv
YWRlZCBieSBzcGFjZW1pdC7CoAo+ID4+ID4gVGhlbiB3ZSB3aWxsIGFkZCB0aGUgcGluY3RybCBk
YXRhIGFmdGVyIGszLXBpY28taXR4LmR0cy4gVGhhdCBzaG91bGQgYmUgYW5vdGhlciBwYXRjaC7C
oAo+ID4+ID4gU2FuZGllCj4gPj4gSSB0aGluayB5b3UgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IFlp
eHVuIHNhaWQuCj4gPj4gWW91IHNob3VsZCBhZGQgcGluY3RybCBwcm9wZXJ0aWVzIGhlcmUgbGlr
ZToKPiA+PiBwaW5jdHJsLTAgPSB4eHg7Cj4gPj4gcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsK
PiA+PsKgCj4gPj4gV2hpbGUgdGhlIGJvb3Rsb2FkZXIgaXMgZXhwZWN0ZWQgdG8gaW5pdGlhbGl6
ZSB0aGUgVUFSVCBwaW5zLCBleHBsaWNpdGx5IGFkZGluZyB0aGUgcGluY3RybCBwcm9wZXJ0aWVz
Cj4gPj4gZW5zdXJlcyBoYXJkd2FyZSBzdGF0ZSBjb25zaXN0ZW5jeS4KPiA+PsKgCj4gPj4gwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLSBU
cm95Cj4gPj7CoAo+ID4KPiA+IFllcywgSSBrbm93IHRoaXMuCj4gPiBJZiBJIGFkZMKgCj4gPiDC
oMKgIMKgIMKgwqAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiA+IMKgwqAgwqAgwqDCoCBw
aW5jdHJsLTAgPSA8JnVhcnQwXzBfY2ZnPjsKPiA+IFRoZW4gYWxzbyBuZWVkIHRvIGFkZAo+ID4g
JnBpbmN0cmwgewo+ID4gwqDCoCDCoCDCoMKgIHVhcnQwXzBfY2ZnOiB1YXJ0MC0wLWNmZyB7Cj4g
PiDCoMKgIMKgIMKgIMKgIMKgIMKgIMKgwqAgdWFydDAtMC1waW5zIHsKPiA+IMKgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoCBwaW5tdXggPSA8SzNfUEFEQ09ORigxNDksIDIpPiwg
wqAgwqAgwqDCoCAvKiB1YXJ0MCB0eCAqLwo+ID4gwqDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8SzNfUEFEQ09ORigxNTAsIDIpPjsgwqAgwqAgwqDCoCAv
KiB1YXJ0MCByeCAqLwo+ID4KPiA+IMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDC
oCBiaWFzLXB1bGwtdXA7IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgwqAgLyogbm9y
bWFsIHB1bGwtdXAgKi8KPiA+IMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoCBk
cml2ZS1zdHJlbmd0aCA9IDwyNT47IMKgIMKgIMKgIMKgIMKgIMKgIMKgwqAgLyogRFM4ICovCj4g
PiDCoMKgIMKgIMKgIMKgIMKgIMKgIMKgwqAgfTsKPiA+IMKgwqAgwqAgwqDCoCB9Owo+ID4gfTsK
PiA+IEJ1dCB0aGlzIHBhcnQgaXMgY29tbW9uLCBpdCBzaG91bGQgYmUgZGVmaW5lZCBpbiBjb21t
b24gcGluY3RybCB0YWJsZSAiazMtcGluY3RybC5kdHNpIi4gQW5kIHRoaXMgcGFydCBoYXNuJ3Qg
Y29tZWQgdG8gVXBzdHJlYW0uCj4gVGhpcyBsaW5lIGV4Y2VlZHMgMTAwIGNoYXJhY3RlcnMKPsKg
Cj4gPiBJZiBJIGFkZCBpdCBjdXJyZW50bHkswqAgV2hlbiBrMy1waW5jdHJsLmR0c2kgaXMgYWNj
ZXB0ZWQgYnkgVXBzdHJlYW0sIHdlIG5lZWQgdG8gcmVtb3ZlIGl0IGFnYWluLgo+ID4gU28gd2Ug
anVzdCBlbXB0eSBpdCBmb3Igc2ltcGxlLgo+IE5vLCBJdCBsb29rcyBsaWtlIHlvdXIgYmFzZSBj
b21taXQgaXMgd3JvbmcuCj4gSXQgaGFzIGJlZW4gbWVyZ2VkIGhlcmUgWzFdIHRoYXQgd2hhdCB5
b3Ugc2FpZC4KPsKgCgpHb3QgaXQuIEkgd2lsbCB1c2UgaHR0cHM6Ly9naXRodWIuY29tL3NwYWNl
bWl0LWNvbS9saW51eC90cmVlL2sxL2R0LWZvci1uZXh0wqAgdG8gcmViYXNlIG15IHBhdGNoLgoK
Cj4gQnkgdGhlIHdheSwgSSBub3RpY2VkIHRoYXQgdGhlIG5hbWUgaW4geW91ciAnRnJvbScgaGVh
ZGVyIGZvciB0aGlzIHJlcGx5IGRvZXNuJ3QgbWF0Y2ggdGhlIG9uZSBpbgo+IHlvdXIgcGF0Y2gg
c3VibWlzc2lvbi4gSXQgd291bGQgYmUgYmV0dGVyIHRvIGtlZXAgdGhlbSBjb25zaXN0ZW50IHRv
IGF2b2lkIGFueSBjb25mdXNpb24gZm9yIHRoZQo+IG1haW50YWluZXJzL3Jldmlld2VycyByZWdh
cmRpbmcgdGhlIGF1dGhvcnNoaXAgb2YgdGhlIHJlc3BvbnNlLgo+wqAKCkFscmVhZHkgZml4ZWQg
aXQuClRoYW5rcyBhIGxvdC4KU2FuZGllCgoKPiBMaW5rOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8xNzczNDA4MzI1MjMuMTcwNTAuMzIzNjA2MDc2MTc1OTQzMjUxLmI0LXR5QGtlcm5l
bC5vcmcvIFsxXQo+wqAKPsKgCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgLSBUcm95Cj7CoAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
