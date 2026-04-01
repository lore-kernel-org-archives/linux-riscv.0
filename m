Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EE6D35153
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 07:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:From:Subject:To
	:In-Reply-To:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dnMhyxPFEziGGyFIDB3t+y7j+7WPSLcl68NMInmM0OM=; b=jsJb4HCfNgPVqY
	iD0YF+jXG3ojPeXJIrgj/IAgooO2RYuIa0QPeRKR+IIvH+VC+RWQPMZbzYmINYG8XKfD4B/h2n+y5
	54LQP5hwbQyLEOZW773zHvFQfq7S9OubSlRrFNqm2sIpoip2hyMXknz5SfHJeuVx4ZUIPLIDWRtIW
	i0YeBb5SWGADP29Hk3AMJyFpAXuNYYJZgTe1FNEyi1f2+zydW6mg9VvG32VQUh0zFDtdH++hwzFUI
	SqrhIzvTPJ4Xq/1AM+/dhoo3VvC8a5QsdAbztExED8zzdLDSSCJG7tctEBQylaapoiq4tmrqis9NR
	x62+LzK/J0Sngd6J8/iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7q9u-0000000EElR-3kKR;
	Wed, 01 Apr 2026 07:38:38 +0000
Received: from va-2-28.ptr.blmpb.com ([209.127.231.28])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7q9r-0000000EEl3-0Pzl
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 07:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1775029107;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=LduvM7ftQhNZfq5zgzln7UtdiXlkxtvJIsUB2Xe8jqU=;
 b=Vxi6rRWuZbnQ2M6Dwgu3YNtR8nhdLDNZo8lgOjN6s02r56HivOMUhRLbeI1HfLwimJptSs
 ZByhzfKWPO1c6TO5ELES5m5nJLXTTabs0oEuSBCSIXgQkFR9Q2ASoSFv51Ozi4ivNgyDtB
 7zXxQkuZ8gpYuojFzlmxBKyIln94OgiN0VuqFo60NnXCEhvVh+kwO6393vKpoxAWDPdfIp
 fipRMb22N3PuyKc/trltJuuAlcImWaUWqeosv1R/Jaz9TwBYBmYuUn5qTcB0EMs9XMKQ85
 KpcGetIJhhYKGCJgUtIRmy9/irb9QZ6GzW5ui0i6xajwFuy9q9dADwF5qTdDgg==
Date: Wed, 01 Apr 2026 15:38:23 +0800
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.20e9d5ae.574e.4942.b529.0e22091ba551@feishu.cn>
Cc: "Yixun Lan" <dlan@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
In-Reply-To: <DHHM43F6TE9I.1F5A3O0VOS6ND@linux.spacemit.com>
X-Lms-Return-Path: <lba+169cccb71+65ae8a+lists.infradead.org+sandie.cao@deepcomputing.io>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v1 2/2] riscv: dts: spacemit: add DeepComputing FML13V05 board device tree
From: =?utf-8?q?=E6=9B=B9=E7=8F=8A=E7=8F=8A?= <sandie.cao@deepcomputing.io>
Mime-Version: 1.0
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io> <20260331034616.67183-1-sandie.cao@deepcomputing.io> <20260331085925-GKB976850@kernel.org> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.4c756029.b64e.488e.905e.99baaf78d6a1@feishu.cn>
	<DHHM43F6TE9I.1F5A3O0VOS6ND@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_003835_956762_FA460261 
X-CRM114-Status: GOOD (  17.81  )
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
Y2VtaXQuY29tPgo+IERhdGU6wqAgV2VkLCBBcHIgMSwgMjAyNiwgMTQ6NDIKCj4gT24gV2VkIEFw
ciAxLCAyMDI2IGF0IDI6MTAgUE0gQ1NULCDmm7nnj4rnj4ogd3JvdGU6Cj4gPiBIaSBMYW4sCj4g
Pgo+ID4+IEZyb206ICJZaXh1biBMYW4iPGRsYW5Aa2VybmVsLm9yZz4KPiA+PiBIaSBTYW5kaWUs
wqAKPiA+PsKgCj4gPj4gT24gMTE6NDYgVHVlIDMxIE1hciDCoCDCoCAsIFNhbmRpZSBDYW8gd3Jv
dGU6Cj4gPj4gPiBGcm9tOiBzYW5kaWVjYW8gPHNhbmRpZS5jYW9AZGVlcGNvbXB1dGluZy5pbz4K
PiA+PiA+wqAKPiA+PiA+IFRoZSBGTUwxM1YwNSBib2FyZCBmcm9tIERlZXBDb21wdXRpbmcgaW5j
b3Jwb3JhdGVzIGEgU3BhY2VtaVQgSzMgUklTQy1WCj4gPj4gPiBTb0MuSXQgaXMgYSBtYWluYm9h
cmQgZGVzaWduZWQgZm9yIHRoZSBGcmFtZXdvcmsgTGFwdG9wIDEzIENoYXNzaXMsCj4gPj4gPiB3
aGljaCBoYXMgKEZyYW1ld29yaykgU0tVIEZSQU5IUTAwMDEuCj4gPj4gPsKgCj4gPj4gPiBUaGUg
Rk1MMTNWMDUgYm9hcmQgZmVhdHVyZXM6Cj4gPj4gPiAtIFNwYWNlbWlUIEszIFJJU0MtViBTb0MK
PiA+PiA+IC0gTFBERFI1IDE2R0Igb3IgMzJHQgo+ID4+ID4gLSBlTU1DIDMyR0IgfjEyOEdCIChP
cHRpb25hbCkKPiA+PiA+IC0gVUZTIDMuMSAyNTZHIChPcHRpb25hbCkKPiA+PiA+IC0gUVNQSSBG
bGFzaAo+ID4+ID4gLSBNaWNyb1NEIFNsb3QKPiA+PiA+IC0gUENJZS1iYXNlZCBXaS1GaQo+ID4+
ID4gLSA0IFVTQi1DIFBvcnRzCj4gPj4gPiDCoC0gUG9ydCAxOiBQRCAzLjAgKDY1VyBNYXgpLCBV
U0IgMy4yIEdlbiAxCj4gPj4gPiDCoC0gUG9ydCAyOiBQRCAzLjAgKDY1VyBNYXgpLCBVU0IgMy4y
IEdlbiAxLCBEUCAxLjQgKDRLQDYwSHopCj4gPj4gPiDCoC0gUG9ydCAzICYgNDogVVNCIDMuMiBH
ZW4gMQo+ID4+ID7CoAo+ID4+ID4gVGhpcyBtaW5pbWFsIGRldmljZSB0cmVlIGVuYWJsZXMgYm9v
dGluZyBpbnRvIGEgc2VyaWFsIGNvbnNvbGUgd2l0aCBVQVJUCj4gPj4gPiBvdXRwdXQuCj4gPj4g
PsKgCj4gPj4gPiBTaWduZWQtb2ZmLWJ5OiBzYW5kaWVjYW8gPHNhbmRpZS5jYW9AZGVlcGNvbXB1
dGluZy5pbz4KPiA+PiA+IFJldmlld2VkLWJ5OiBIZWlucmljaCBTY2h1Y2hhcmR0IDxoZWlucmlj
aC5zY2h1Y2hhcmR0QGNhbm9uaWNhbC5jb20+Cj4gPj4gPiArJnVhcnQwIHsKPiA+PiBDYW4geW91
IGFsc28gYWRkIHBpbmN0cmwgZGF0YSBleHBsaWNpdGx5Pwo+ID4KPiA+IFRvIGF2b2lkIGNvbmZs
aWN0LMKgIHRoZSBjb21tb24gcGluY3RybCB0YWJsZSAiazMtcGluY3RybC5kdHNpIiBzaG91bGQg
YmUgdXBsb2FkZWQgYnkgc3BhY2VtaXQuwqAKPiA+IFRoZW4gd2Ugd2lsbCBhZGQgdGhlIHBpbmN0
cmwgZGF0YSBhZnRlciBrMy1waWNvLWl0eC5kdHMuIFRoYXQgc2hvdWxkIGJlIGFub3RoZXIgcGF0
Y2guwqAKPiA+IFNhbmRpZQo+IEkgdGhpbmsgeW91IGRvbid0IHVuZGVyc3RhbmQgd2hhdCBZaXh1
biBzYWlkLgo+IFlvdSBzaG91bGQgYWRkIHBpbmN0cmwgcHJvcGVydGllcyBoZXJlIGxpa2U6Cj4g
cGluY3RybC0wID0geHh4Owo+IHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj7CoAo+IFdoaWxl
IHRoZSBib290bG9hZGVyIGlzIGV4cGVjdGVkIHRvIGluaXRpYWxpemUgdGhlIFVBUlQgcGlucywg
ZXhwbGljaXRseSBhZGRpbmcgdGhlIHBpbmN0cmwgcHJvcGVydGllcwo+IGVuc3VyZXMgaGFyZHdh
cmUgc3RhdGUgY29uc2lzdGVuY3kuCj7CoAo+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC0gVHJveQo+wqAKClllcywgSSBrbm93IHRoaXMu
CklmIEkgYWRkwqAKwqDCoCDCoCDCoMKgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CsKgwqAg
wqAgwqDCoCBwaW5jdHJsLTAgPSA8JnVhcnQwXzBfY2ZnPjsKVGhlbiBhbHNvIG5lZWQgdG8gYWRk
CiZwaW5jdHJsIHsKwqDCoCDCoCDCoMKgIHVhcnQwXzBfY2ZnOiB1YXJ0MC0wLWNmZyB7CsKgwqAg
wqAgwqAgwqAgwqAgwqAgwqDCoCB1YXJ0MC0wLXBpbnMgewrCoMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgwqAgcGlubXV4ID0gPEszX1BBRENPTkYoMTQ5LCAyKT4sIMKgIMKgIMKgwqAg
LyogdWFydDAgdHggKi8KwqDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCA8SzNfUEFEQ09ORigxNTAsIDIpPjsgwqAgwqAgwqDCoCAvKiB1YXJ0MCByeCAqLwoK
wqDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoMKgIGJpYXMtcHVsbC11cDsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoCAvKiBub3JtYWwgcHVsbC11cCAqLwrCoMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgwqAgZHJpdmUtc3RyZW5ndGggPSA8MjU+OyDCoCDC
oCDCoCDCoCDCoCDCoCDCoMKgIC8qIERTOCAqLwrCoMKgIMKgIMKgIMKgIMKgIMKgIMKgwqAgfTsK
wqDCoCDCoCDCoMKgIH07Cn07CkJ1dCB0aGlzIHBhcnQgaXMgY29tbW9uLCBpdCBzaG91bGQgYmUg
ZGVmaW5lZCBpbiBjb21tb24gcGluY3RybCB0YWJsZSAiazMtcGluY3RybC5kdHNpIi4gQW5kIHRo
aXMgcGFydCBoYXNuJ3QgY29tZWQgdG8gVXBzdHJlYW0uCklmIEkgYWRkIGl0IGN1cnJlbnRseSzC
oCBXaGVuIGszLXBpbmN0cmwuZHRzaSBpcyBhY2NlcHRlZCBieSBVcHN0cmVhbSwgd2UgbmVlZCB0
byByZW1vdmUgaXQgYWdhaW4uClNvIHdlIGp1c3QgZW1wdHkgaXQgZm9yIHNpbXBsZS4KU2FuZGll
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
