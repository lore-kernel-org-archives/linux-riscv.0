Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E02C3ABAC
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 13:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXX69xWxlSrq3srlxqY9ZrpjGognZOW4FKgAUiEuU5A=; b=i7vhb+Vs3nOKs7
	3U+Q9UwATi4ovMBpoP6kWw7Gs3VFqYE9jTq0qXUx7fYiek0UadVu58qVWMBRx3FS/AwQjCelqU70c
	WQdzojMTMJdj6kHI8N7XUvpYnXBjHZizXtEgmWamem/dTobap+NnzLUCWid8/5TSS0Jjo2BjJ9b7B
	TFNQkLeMxNBi/lCpHuB8zXka1w3RzRlAyw5FhrtpRsqOfvhyeHs4ktfF/6G1AZdNkeW70SjFrsjU1
	On7JcfykIlXezRfUgZ5fZy85atl0NT90IzFcOaFEALe6/AFVEHo8gev4YCJa/pYMIjtaFrlVmEofr
	Fk+OvhZsmubVswB/Jmqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIWK-0000000CABd-1lze;
	Tue, 06 May 2025 13:39:40 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCG9c-0000000Bfue-2aMR
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 11:08:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81F364396C;
	Tue,  6 May 2025 11:07:58 +0000 (UTC)
Message-ID: <7db8ae4f-4cde-43b4-9ec5-5a8818d79637@ghiti.fr>
Date: Tue, 6 May 2025 13:07:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] riscv: misaligned: enable IRQs while handling
 misaligned accesses
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
 Andrew Jones <ajones@ventanamicro.com>,
 Samuel Holland <samuel.holland@sifive.com>
References: <20250422162324.956065-1-cleger@rivosinc.com>
 <20250422162324.956065-3-cleger@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250422162324.956065-3-cleger@rivosinc.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeefkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedtgeeuhffhveeujeetveevieekleekvdffudefleevgefgieekkefggefhtddtveenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeehkegvudemfhdvsgegmeejrgelvdemfedvledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeehkegvudemfhdvsgegmeejrgelvdemfedvledtpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeehkegvudemfhdvsgegmeejrgelvdemfedvledtngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopegtlhgvghgvrhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrr
 dhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhhsvghlfhhtvghsthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_040804_783152_C6BDB548 
X-CRM114-Status: GOOD (  13.45  )
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

T24gMjIvMDQvMjAyNSAxODoyMywgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IFdlIGNhbiBzYWZl
bHkgcmVlbmFibGUgSVJRcyBpZiBjb21pbmcgZnJvbSB1c2Vyc3BhY2UuIFRoaXMgYWxsb3dzIHRv
Cj4gYWNjZXNzIHVzZXIgbWVtb3J5IHRoYXQgY291bGQgcG90ZW50aWFsbHkgdHJpZ2dlciBhIHBh
Z2UgZmF1bHQuCj4KPiBGaXhlczogYjY4NmVjZGVhY2Y2ICgicmlzY3Y6IG1pc2FsaWduZWQ6IFJl
c3RyaWN0IHVzZXIgYWNjZXNzIHRvIGtlcm5lbCBtZW1vcnkiKQo+IFNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgIGFyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzLmMgfCAxMiArKysrKysrKy0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiBpbmRleCBiMWQ5OTFj
NzhhMjMuLjljODM4NDg3OTdhNyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFw
cy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+IEBAIC0yMjAsMTkgKzIyMCwy
MyBAQCBzdGF0aWMgdm9pZCBkb190cmFwX21pc2FsaWduZWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3Ms
IGVudW0gbWlzYWxpZ25lZF9hY2Nlc3NfdHlwZQo+ICAgewo+ICAgCWlycWVudHJ5X3N0YXRlX3Qg
c3RhdGU7Cj4gICAKPiAtCWlmICh1c2VyX21vZGUocmVncykpCj4gKwlpZiAodXNlcl9tb2RlKHJl
Z3MpKSB7Cj4gICAJCWlycWVudHJ5X2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MpOwo+IC0JZWxz
ZQo+ICsJCWxvY2FsX2lycV9lbmFibGUoKTsKPiArCX0gZWxzZSB7Cj4gICAJCXN0YXRlID0gaXJx
ZW50cnlfbm1pX2VudGVyKHJlZ3MpOwo+ICsJfQo+ICAgCj4gICAJaWYgKG1pc2FsaWduZWRfaGFu
ZGxlclt0eXBlXS5oYW5kbGVyKHJlZ3MpKQo+ICAgCQlkb190cmFwX2Vycm9yKHJlZ3MsIFNJR0JV
UywgQlVTX0FEUkFMTiwgcmVncy0+ZXBjLAo+ICAgCQkJICAgICAgbWlzYWxpZ25lZF9oYW5kbGVy
W3R5cGVdLnR5cGVfc3RyKTsKPiAgIAo+IC0JaWYgKHVzZXJfbW9kZShyZWdzKSkKPiArCWlmICh1
c2VyX21vZGUocmVncykpIHsKPiArCQlsb2NhbF9pcnFfZGlzYWJsZSgpOwo+ICAgCQlpcnFlbnRy
eV9leGl0X3RvX3VzZXJfbW9kZShyZWdzKTsKPiAtCWVsc2UKPiArCX0gZWxzZSB7Cj4gICAJCWly
cWVudHJ5X25taV9leGl0KHJlZ3MsIHN0YXRlKTsKPiArCX0KPiAgIH0KPiAgIAo+ICAgYXNtbGlu
a2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBkb190cmFwX2xvYWRfbWlzYWxpZ25l
ZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKCgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxh
bGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKVGhhbmtzLAoKQWxleAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
