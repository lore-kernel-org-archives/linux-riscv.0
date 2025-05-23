Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E72C54F30
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 11:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1Sqq20EWSIm/l9Qedu+NCR1av77zRagy8SQlRMgcps=; b=oQDJ4i1cDslU4mQP/vgfR4UVJ9
	jGDoNTRVKm1Bd84CTrvxf3SLh7QVYC659GBZZ/2C7TEP0e2Jh+COkKdwjN+xoSjx4eFujTb7Wdk21
	Y3EFFb5Cv/X/FW2TIM4R9vwhxMzLzuPKfvGSK1yaD9wqPjmcUIrrbfqjb3uElLVuHJRkihOJSbvUR
	MHsLUVaKjpaUz2jEjMrC2a1CASfm0NS6ah8J3SVPGvH4MYyjBd5E6q4QOfTPj36GB1dV1kIw8CWeF
	feNfuTWlF/0qgs50JpNN85kLFBj0YgSTjJbR5LQBdtSrkVDE/+0RYrRAojPUZHZ5A5urXNUjJueV3
	412OnLiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQUo-00000003hJf-1pVO;
	Fri, 23 May 2025 11:23:26 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPNS-00000003YD3-0qEJ
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:11:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D03D439F0;
	Fri, 23 May 2025 10:11:42 +0000 (UTC)
Message-ID: <83e02a52-86ad-45e5-ba87-6c17dc6f59b5@ghiti.fr>
Date: Fri, 23 May 2025 12:11:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: acpi: Fix platform profile driver on !acpi
 platforms
To: Armin Wolf <W_Armin@gmx.de>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, Arnd Bergmann <arnd@arndb.de>,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250522141410.31315-1-alexghiti@rivosinc.com>
 <91458376-dfc7-46fc-8523-aa176907d703@gmx.de>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <91458376-dfc7-46fc-8523-aa176907d703@gmx.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekheekucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepheevhfevteehhefhueekiedtheeuvdfgieetteetudffgeegieegieeitdevgeelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpihhnfhhrrgguvggrugdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmegvleejvdemuggtudemjedvudgumeeitdgstdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemvgeljedvmegutgdumeejvdduugemiedtsgdtpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmegvleejvdemuggtudemjedvudgumeeitdgstdgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohephggptehrmhhinhesghhmgidruggvpdhrtghpthhtoheprghlvgigghhhihhtihesrhhivhhoshhin
 hgtrdgtohhmpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlvghnsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrghrihhordhlihhmohhntghivghllhhosegrmhgurdgtohhmpdhrtghpthhtohepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggv
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_031146_372817_0567488C 
X-CRM114-Status: GOOD (  21.03  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNS8yMi8yNSAyMjowNCwgQXJtaW4gV29sZiB3cm90ZToKPiBBbSAyMi4wNS4yNSB1bSAxNjox
MyBzY2hyaWViIEFsZXhhbmRyZSBHaGl0aToKPgo+PiBUaGUgcGxhdGZvcm0gcHJvZmlsZSBkcml2
ZXIgaXMgbG9hZGVkIGV2ZW4gb24gcGxhdGZvcm1zIHRoYXQgZG8gbm90IGhhdmUKPj4gYWNwaSBl
bmFibGVkLiBUaGUgaW5pdGlhbGl6YXRpb24gb2YgdGhlIHN5c2ZzIGVudHJpZXMgd2FzIHJlY2Vu
dGx5IG1vdmVkCj4+IGZyb20gcGxhdGZvcm1fcHJvZmlsZV9yZWdpc3RlcigpIHRvIHRoZSBtb2R1
bGUgaW5pdCBjYWxsLCBhbmQgdGhvc2UKPj4gZW50cmllcyBuZWVkIGFjcGlfa29iaiB0byBiZSBp
bml0aWFsaXplZCB3aGljaCBpcyBub3QgdGhlIGNhc2Ugd2hlbiBhY3BpCj4+IGlzIGRpc2FibGVk
Lgo+Pgo+PiBUaGlzIHJlc3VsdHMgaW4gdGhlIGZvbGxvd2luZyB3YXJuaW5nOgo+Pgo+PiDCoCBX
QVJOSU5HOiBDUFU6IDUgUElEOiAxIGF0IGZzL3N5c2ZzL2dyb3VwLmM6MTMxIAo+PiBpbnRlcm5h
bF9jcmVhdGVfZ3JvdXArMHhhMjIvMHhkZDgKPj4gwqAgTW9kdWxlcyBsaW5rZWQgaW46Cj4+IMKg
IENQVTogNSBVSUQ6IDAgUElEOiAxIENvbW06IHN3YXBwZXIvMCBUYWludGVkOiBHIFfCoMKgwqDC
oMKgwqDCoMKgwqDCoCAKPj4gNi4xNS4wLXJjNy1kaXJ0eSAjNiBQUkVFTVBUCj4+IMKgIFRhaW50
ZWQ6IFtXXT1XQVJOCj4+IMKgIEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkK
Pj4gwqAgZXBjIDogaW50ZXJuYWxfY3JlYXRlX2dyb3VwKzB4YTIyLzB4ZGQ4Cj4+IMKgwqAgcmEg
OiBpbnRlcm5hbF9jcmVhdGVfZ3JvdXArMHhhMjIvMHhkZDgKPj4KPj4gwqAgQ2FsbCBUcmFjZToK
Pj4KPj4gwqAgaW50ZXJuYWxfY3JlYXRlX2dyb3VwKzB4YTIyLzB4ZGQ4Cj4+IMKgIHN5c2ZzX2Ny
ZWF0ZV9ncm91cCsweDIyLzB4MmUKPj4gwqAgcGxhdGZvcm1fcHJvZmlsZV9pbml0KzB4NzQvMHhi
Mgo+PiDCoCBkb19vbmVfaW5pdGNhbGwrMHgxOTgvMHhhOWUKPj4gwqAga2VybmVsX2luaXRfZnJl
ZWFibGUrMHg2ZDgvMHg3ODAKPj4gwqAga2VybmVsX2luaXQrMHgyOC8weDI0Ywo+PiDCoCByZXRf
ZnJvbV9mb3JrKzB4ZS8weDE4Cj4+Cj4+IEZpeCB0aGlzIGJ5IGNoZWNraW5nIGlmIGFjcGkgaXMg
ZW5hYmxlZCBiZWZvcmUgdHJ5aW5nIHRvIGNyZWF0ZSBzeXNmcwo+PiBlbnRyaWVzLgo+Cj4gSSBh
bHJlYWR5IHN1Ym1pdHRlZCBhIHBhdGNoIGZvciB0aGlzIHByb2JsZW0gKHNlZSAKPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1hY3BpL2E2ZDkyY2RkLTRkYzMtNDA4MC05ZWQ5LTViMWYw
MmYyNDdlMEBnbXguZGUvVC8pCj4gdGhhdCBvbmx5IGRpc2FibGVzIHRoZSBsZWdhY3kgc3lzZnMg
aW50ZXJmYWNlIHdoaWxlIGtlZXBpbmcgdGhlIAo+IGNsYXNzLWJhc2VkIGludGVyZmFjZSBmdW5j
dGlvbmFsCj4gYXMgaXQgZG9lcyBub3QgZGVwZW5kIG9uIEFDUEkgYXQgYWxsLgoKCkdyZWF0LCBJ
IHVuZGVyc3RhbmQgaWYgeW91ciBwYXRjaHNldCBpcyBub3QgbWVyZ2VkIGZvciByYzEgYnV0IGl0
IHdvdWxkIApiZSBuaWNlIHRvIGhhdmUgaXQgbWVyZ2VkIGluIDYuMTYgdGhvdWdoIHRvIGZpeCBy
aXNjdiBzeXprYWxsZXIgCmluc3RhbmNlLiBQZXJoYXBzIHlvdSBjb3VsZCBhZGQgdGhlIEZpeGVz
IHRhZyB0aGF0IEFybmQgbWVudGlvbmVkIHRvbz8KClRoYW5rcywKCkFsZXgKCgo+Cj4gVGhhbmss
Cj4gQXJtaW4gV29sZgo+Cj4+IEZpeGVzOiA3N2JlNWNhY2IyYzIgKCJBQ1BJOiBwbGF0Zm9ybV9w
cm9maWxlOiBDcmVhdGUgY2xhc3MgZm9yIEFDUEkgCj4+IHBsYXRmb3JtIHByb2ZpbGUiKQo+PiBT
aWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4+
IC0tLQo+PiDCoCBkcml2ZXJzL2FjcGkvcGxhdGZvcm1fcHJvZmlsZS5jIHwgMyArKysKPj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9hY3BpL3BsYXRmb3JtX3Byb2ZpbGUuYyAKPj4gYi9kcml2ZXJzL2FjcGkvcGxhdGZvcm1fcHJv
ZmlsZS5jCj4+IGluZGV4IGZmYmZkMzJmNGNmMS4uYjQzZjQ0NTlhNGY2IDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL2FjcGkvcGxhdGZvcm1fcHJvZmlsZS5jCj4+ICsrKyBiL2RyaXZlcnMvYWNwaS9w
bGF0Zm9ybV9wcm9maWxlLmMKPj4gQEAgLTY4OCw2ICs2ODgsOSBAQCBzdGF0aWMgaW50IF9faW5p
dCBwbGF0Zm9ybV9wcm9maWxlX2luaXQodm9pZCkKPj4gwqAgewo+PiDCoMKgwqDCoMKgIGludCBl
cnI7Cj4+IMKgICvCoMKgwqAgaWYgKGFjcGlfZGlzYWJsZWQpCj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gLUVPUE5PVFNVUFA7Cj4+ICsKPj4gwqDCoMKgwqDCoCBlcnIgPSBjbGFzc19yZWdpc3Rl
cigmcGxhdGZvcm1fcHJvZmlsZV9jbGFzcyk7Cj4+IMKgwqDCoMKgwqAgaWYgKGVycikKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiBlcnI7Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
