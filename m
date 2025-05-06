Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F83C3ABBE
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 20:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjWHdJvZ1VhkyoRAE3iPwdum0+kd6vB8b2kgZqEGdW4=; b=i9yUSJO4IG7ax0
	1GF1+pRGxQPXjv8gmFoHNPftfwDvoQdmDsOmgTV+EbGG0CzXZdezJ3c4+z30KCC6RDEpRoq5WsFLX
	HlN+dTPwtJhhSgOHzuJdGqw71Hu2zz7gCblgRMRlWBhtAqYmKH3vmAW4JuLLqadgJi4RIFgIUFMMf
	LlA1rYqjZMn6ul08HbxyGT0FSFTVbxzRwOo++eP5F7kiWCtWcj8+QNoA+n+dF8JYqgSNMdSZm+lQ3
	mKDt60Yfegk/b6GFjqGNUqa/ZensaUhS+pESxuNIdn0cdARaUScM8wNPxGcSJGAR/HgrrkKhXAO2c
	u6tzJ2An0/r0cH5P7CJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOkz-0000000DMCc-36Fp;
	Tue, 06 May 2025 20:19:13 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLCx-0000000CgOt-41ut
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 16:31:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFBBB43B1A;
	Tue,  6 May 2025 16:31:42 +0000 (UTC)
Message-ID: <570ce61a-00ca-446f-ae89-7ab7c340828f@ghiti.fr>
Date: Tue, 6 May 2025 18:31:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Fix kernel crash due to PR_SET_TAGGED_ADDR_CTRL
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250504101920.3393053-1-namcao@linutronix.de>
 <c59f2632-d96f-43c6-869d-5e5f743f2dbd@ghiti.fr>
 <20250505160722.s_w3u1pd@linutronix.de>
 <d7232e99-e899-4e50-b60f-2527be709d2c@ghiti.fr>
In-Reply-To: <d7232e99-e899-4e50-b60f-2527be709d2c@ghiti.fr>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeggeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuhffvvehfjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeffudduledvfeehvdefueduveffkedugeetjeetveduvddtudehieduudehtdfhueenucffohhmrghinhepmhgrnhhgohhpihdrohhrghdpihhnfhhrrgguvggrugdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmegstdgvieemhehfgehfmeefugejrgemrgdvfhdtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmegstdgvieemhehfgehfmeefugejrgemrgdvfhdtpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmegstdgvieemhehfgehfmeefugejrgemrgdvfhdtngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepnhgrmhgtrghosehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhif
 hhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehsrghmuhgvlhdrhhholhhlrghnugesshhifhhivhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_093152_131995_C6819E49 
X-CRM114-Status: GOOD (  17.51  )
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

T24gMDUvMDUvMjAyNSAyMToyNywgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IE9uIDA1LzA1LzIw
MjUgMTg6MDcsIE5hbSBDYW8gd3JvdGU6Cj4+IEhpIEFsZXgsCj4+Cj4+IE9uIE1vbiwgTWF5IDA1
LCAyMDI1IGF0IDA2OjAyOjI2UE0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4+IE9u
IDA0LzA1LzIwMjUgMTI6MTksIE5hbSBDYW8gd3JvdGU6Cj4+Pj4gV2hlbiB1c2Vyc3BhY2UgZG9l
cyBQUl9TRVRfVEFHR0VEX0FERFJfQ1RSTCwgYnV0IFN1cG0gZXh0ZW5zaW9uIGlzIG5vdAo+Pj4+
IGF2YWlsYWJsZSwgdGhlIGtlcm5lbCBjcmFzaGVzOgo+Pj4+Cj4+Pj4gT29wcyAtIGlsbGVnYWwg
aW5zdHJ1Y3Rpb24gWyMxXQo+Pj4+IMKgwqDCoMKgwqAgW3NuaXBdCj4+Pj4gZXBjIDogc2V0X3Rh
Z2dlZF9hZGRyX2N0cmwrMHgxMTIvMHgxNWEKPj4+PiDCoMKgIHJhIDogc2V0X3RhZ2dlZF9hZGRy
X2N0cmwrMHg3NC8weDE1YQo+Pj4+IGVwYyA6IGZmZmZmZmZmODAwMTFhY2UgcmEgOiBmZmZmZmZm
ZjgwMDExYTMwIHNwIDogZmZmZmZmYzYwMDM5YmUxMAo+Pj4+IMKgwqDCoMKgwqAgW3NuaXBdCj4+
Pj4gc3RhdHVzOiAwMDAwMDAwMjAwMDAwMTIwIGJhZGFkZHI6IDAwMDAwMDAwMTBhNzkwNzMgY2F1
c2U6IAo+Pj4+IDAwMDAwMDAwMDAwMDAwMDIKPj4+PiDCoMKgwqDCoMKgIHNldF90YWdnZWRfYWRk
cl9jdHJsKzB4MTEyLzB4MTVhCj4+Pj4gwqDCoMKgwqDCoCBfX3Jpc2N2X3N5c19wcmN0bCsweDM1
Mi8weDczYwo+Pj4+IMKgwqDCoMKgwqAgZG9fdHJhcF9lY2FsbF91KzB4MTdjLzB4MjBjCj4+Pj4g
wqDCoMKgwqDCoCBhbmRsZV9leGNlcHRpb24rMHgxNTAvMHgxNWMKPj4+Cj4+PiBJdCBzZWVtcyBs
aWtlIHRoZSBjc3Igd3JpdGUgaXMgdHJpZ2dlcmluZyB0aGlzIGlsbGVnYWwgaW5zdHJ1Y3Rpb24s
IAo+Pj4gY2FuIHlvdQo+Pj4gY29uZmlybSBpdCBpcz8KPj4gWWVzLCBpdCBpcyB0aGUgImNzcl93
cml0ZShDU1JfRU5WQ0ZHLCBlbnZjZmcpOyIgaW4gZW52Y2ZnX3VwZGF0ZV9iaXRzKCkuCj4+Cj4+
PiBJZiBzbywgSSBjYW4ndCBmaW5kIGluIHRoZSBzcGVjaWZpY2F0aW9uIHRoYXQgYW4gaW1wbGVt
ZW50YXRpb24gCj4+PiBzaG91bGQgZG8KPj4+IHRoYXQgd2hlbiB3cml0aW5nIGVudmNmZyBhbmQg
SSBjYW4ndCByZXByb2R1Y2UgaXQgb24gcWVtdS4gV2hlcmUgZGlkIAo+Pj4geW91Cj4+PiBzZWUg
dGhpcyBvb3BzPwo+PiBJIGNhbid0IGZpbmQgaXQgaW4gdGhlIHNwZWMgZWl0aGVyLiBJIHRoaW5r
IGl0IGlzIHVwIHRvIHRoZSAKPj4gaW1wbGVtZW50YXRpb24uCj4KPgo+IFRoZSByZXNlcnZlZCBm
aWVsZHMgb2Ygc2VudmNmZyBhcmUgV1BSSSBhbmQgY29udHJhcnkgdG8gV0xSTCwgaXQgZG9lcyAK
PiBub3QgZXhwbGljaXRseSAicGVybWl0IiB0byByYWlzZSBhbiBpbGxlZ2FsIGluc3RydWN0aW9u
IHNvIEknZCBzYXkgaXQgCj4gaXMgbm90IHVwIHRvIHRoZSBpbXBsZW1lbnRhdGlvbiwgSSdsbCBh
c2sgYXJvdW5kLgoKClNvIEkgaGFkIGNvbmZpcm1hdGlvbiB0aGF0IFdQUkkgc2hvdWxkIG5vdCBy
YWlzZSBhbiBpbGxlZ2FsIGluc3RydWN0aW9uIApzbyB0aGF0J3MgYW4gaXNzdWUgd2l0aCB0aGUg
cGxhdGZvcm0uIFlvdXIgcGF0Y2ggaXMgbm90IHdyb25nIGJ1dCBJJ2QgCnJhdGhlciBoYXZlIGFu
IGV4cGxpY2l0IGVycmF0YSwgd2hhdCBkbyB5b3UgdGhpbms/CgpUaGFua3MsCgpBbGV4CgoKPgo+
IFRoYW5rcywKPgo+IEFsZXgKPgo+Cj4+Cj4+IEkgZ290IHRoaXMgY3Jhc2ggb24gdGhlIE1hbmdv
UEkgYm9hcmQ6Cj4+IGh0dHBzOi8vbWFuZ29waS5vcmcvbXFwcm8KPj4KPj4gQmVzdCByZWdhcmRz
LAo+PiBOYW0KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
