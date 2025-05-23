Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DE9C54ED0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 20:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmAaNDggYS5oRHV6P+bRofNvclkveclr5g548+bbQD4=; b=OXEl7daHCjk750
	8/SuobQ1MSNALkY/TkY3VV+9SRDl9gdqCegrKXH53chcm218Wbf3qnzWWN8+w0+A87f68HrhHBguc
	YFAS0XajyWjw/E+qNuQUv+jD13ln6/HRpFmZ+5j9Y+qX1/o4X4Cq1LaIWrO+86B55pGPr7VwF6xEl
	nJX/KsoFfJ/dEdbTG/pAbpeAUOqO0rHKypg8CRtqeoEV9tRjGdfsxahGEftKiGPAH7AGOIe6Wsngi
	zsy/ICPaHji+sBF/i7D+NbyjXO0IutjBEdvlLFw9ALfO5fwLPVTNrTftqkmfWU3OMARY3pivJiG8K
	joOQHe5RtWvRXfXKnaoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIYa5-00000004qci-1Vkz;
	Fri, 23 May 2025 20:01:25 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIYa2-00000004qbl-2462
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 20:01:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A969C43987;
	Fri, 23 May 2025 20:01:17 +0000 (UTC)
Message-ID: <f12632df-927e-4bdd-930e-5724e142af77@ghiti.fr>
Date: Fri, 23 May 2025 22:01:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: acpi: Fix platform profile driver on !acpi
 platforms
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Armin Wolf <W_Armin@gmx.de>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Len Brown <lenb@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, Arnd Bergmann <arnd@arndb.de>,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250522141410.31315-1-alexghiti@rivosinc.com>
 <91458376-dfc7-46fc-8523-aa176907d703@gmx.de>
 <83e02a52-86ad-45e5-ba87-6c17dc6f59b5@ghiti.fr>
 <CAJZ5v0iPVx0KXB5qQ46iQ7CKG6KJC1CnXogQ=e8or24vZuytrw@mail.gmail.com>
 <CAJZ5v0iwH3p_A=f0g7+EsPbP7KBJS_LbT9+_gXNLBbXqW8vMFg@mail.gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAJZ5v0iwH3p_A=f0g7+EsPbP7KBJS_LbT9+_gXNLBbXqW8vMFg@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeljeeiucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeduffeugedvtdegleeuhfeuteetueegfeefkefhheffvdduhfegvdehuddukeffgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhinhhfrhgruggvrggurdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemvgeljedvmegutgdumeejvdduugemiedtsgdtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmegvleejvdemuggtudemjedvudgumeeitdgstddphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemvgeljedvmegutgdumeejvdduugemiedtsgdtngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephggptehrmhhinhesghhmgidru
 ggvpdhrtghpthhtoheprghlvgigghhhihhtihesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheplhgvnhgssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgrrhhiohdrlhhimhhonhgtihgvlhhlohesrghmugdrtghomhdprhgtphhtthhopehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_130122_665299_FFE0D418 
X-CRM114-Status: GOOD (  19.15  )
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

SGkgUmFmYWVsLAoKT24gNS8yMy8yNSAxNjo0NiwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4g
T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMTI6NTDigK9QTSBSYWZhZWwgSi4gV3lzb2NraSA8cmFm
YWVsQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiBPbiBGcmksIE1heSAyMywgMjAyNSBhdCAxMjoxMeKA
r1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4gd3JvdGU6Cj4+PiBPbiA1LzIyLzI1
IDIyOjA0LCBBcm1pbiBXb2xmIHdyb3RlOgo+Pj4+IEFtIDIyLjA1LjI1IHVtIDE2OjEzIHNjaHJp
ZWIgQWxleGFuZHJlIEdoaXRpOgo+Pj4+Cj4+Pj4+IFRoZSBwbGF0Zm9ybSBwcm9maWxlIGRyaXZl
ciBpcyBsb2FkZWQgZXZlbiBvbiBwbGF0Zm9ybXMgdGhhdCBkbyBub3QgaGF2ZQo+Pj4+PiBhY3Bp
IGVuYWJsZWQuIFRoZSBpbml0aWFsaXphdGlvbiBvZiB0aGUgc3lzZnMgZW50cmllcyB3YXMgcmVj
ZW50bHkgbW92ZWQKPj4+Pj4gZnJvbSBwbGF0Zm9ybV9wcm9maWxlX3JlZ2lzdGVyKCkgdG8gdGhl
IG1vZHVsZSBpbml0IGNhbGwsIGFuZCB0aG9zZQo+Pj4+PiBlbnRyaWVzIG5lZWQgYWNwaV9rb2Jq
IHRvIGJlIGluaXRpYWxpemVkIHdoaWNoIGlzIG5vdCB0aGUgY2FzZSB3aGVuIGFjcGkKPj4+Pj4g
aXMgZGlzYWJsZWQuCj4+Pj4+Cj4+Pj4+IFRoaXMgcmVzdWx0cyBpbiB0aGUgZm9sbG93aW5nIHdh
cm5pbmc6Cj4+Pj4+Cj4+Pj4+ICAgIFdBUk5JTkc6IENQVTogNSBQSUQ6IDEgYXQgZnMvc3lzZnMv
Z3JvdXAuYzoxMzEKPj4+Pj4gaW50ZXJuYWxfY3JlYXRlX2dyb3VwKzB4YTIyLzB4ZGQ4Cj4+Pj4+
ICAgIE1vZHVsZXMgbGlua2VkIGluOgo+Pj4+PiAgICBDUFU6IDUgVUlEOiAwIFBJRDogMSBDb21t
OiBzd2FwcGVyLzAgVGFpbnRlZDogRyBXCj4+Pj4+IDYuMTUuMC1yYzctZGlydHkgIzYgUFJFRU1Q
VAo+Pj4+PiAgICBUYWludGVkOiBbV109V0FSTgo+Pj4+PiAgICBIYXJkd2FyZSBuYW1lOiByaXNj
di12aXJ0aW8scWVtdSAoRFQpCj4+Pj4+ICAgIGVwYyA6IGludGVybmFsX2NyZWF0ZV9ncm91cCsw
eGEyMi8weGRkOAo+Pj4+PiAgICAgcmEgOiBpbnRlcm5hbF9jcmVhdGVfZ3JvdXArMHhhMjIvMHhk
ZDgKPj4+Pj4KPj4+Pj4gICAgQ2FsbCBUcmFjZToKPj4+Pj4KPj4+Pj4gICAgaW50ZXJuYWxfY3Jl
YXRlX2dyb3VwKzB4YTIyLzB4ZGQ4Cj4+Pj4+ICAgIHN5c2ZzX2NyZWF0ZV9ncm91cCsweDIyLzB4
MmUKPj4+Pj4gICAgcGxhdGZvcm1fcHJvZmlsZV9pbml0KzB4NzQvMHhiMgo+Pj4+PiAgICBkb19v
bmVfaW5pdGNhbGwrMHgxOTgvMHhhOWUKPj4+Pj4gICAga2VybmVsX2luaXRfZnJlZWFibGUrMHg2
ZDgvMHg3ODAKPj4+Pj4gICAga2VybmVsX2luaXQrMHgyOC8weDI0Ywo+Pj4+PiAgICByZXRfZnJv
bV9mb3JrKzB4ZS8weDE4Cj4+Pj4+Cj4+Pj4+IEZpeCB0aGlzIGJ5IGNoZWNraW5nIGlmIGFjcGkg
aXMgZW5hYmxlZCBiZWZvcmUgdHJ5aW5nIHRvIGNyZWF0ZSBzeXNmcwo+Pj4+PiBlbnRyaWVzLgo+
Pj4+IEkgYWxyZWFkeSBzdWJtaXR0ZWQgYSBwYXRjaCBmb3IgdGhpcyBwcm9ibGVtIChzZWUKPj4+
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hY3BpL2E2ZDkyY2RkLTRkYzMtNDA4MC05
ZWQ5LTViMWYwMmYyNDdlMEBnbXguZGUvVC8pCj4+Pj4gdGhhdCBvbmx5IGRpc2FibGVzIHRoZSBs
ZWdhY3kgc3lzZnMgaW50ZXJmYWNlIHdoaWxlIGtlZXBpbmcgdGhlCj4+Pj4gY2xhc3MtYmFzZWQg
aW50ZXJmYWNlIGZ1bmN0aW9uYWwKPj4+PiBhcyBpdCBkb2VzIG5vdCBkZXBlbmQgb24gQUNQSSBh
dCBhbGwuCj4+Pgo+Pj4gR3JlYXQsIEkgdW5kZXJzdGFuZCBpZiB5b3VyIHBhdGNoc2V0IGlzIG5v
dCBtZXJnZWQgZm9yIHJjMSBidXQgaXQgd291bGQKPj4+IGJlIG5pY2UgdG8gaGF2ZSBpdCBtZXJn
ZWQgaW4gNi4xNiB0aG91Z2ggdG8gZml4IHJpc2N2IHN5emthbGxlcgo+Pj4gaW5zdGFuY2UuIFBl
cmhhcHMgeW91IGNvdWxkIGFkZCB0aGUgRml4ZXMgdGFnIHRoYXQgQXJuZCBtZW50aW9uZWQgdG9v
Pwo+PiBJIGFjdHVhbGx5IHByZWZlciB5b3VyIHBhdGNoIHRvIHRoZSBBcm1pbidzIG9uZSBiZWNh
dXNlIHRoZXJlIGFyZQo+PiBxdWVzdGlvbnMgcmVnYXJkaW5nIHRoZSBsYXR0ZXIgKHNlZSB0aGUg
bW9zdCByZWNlbnQgbWVzc2FnZSBmcm9tIEFybmQKPj4gaW4gdGhpcyB0aHJlYWQpLgo+IEFuZCBz
byBpdCBoYXMgYmVlbiBhcHBsaWVkIGFzIDYuMTYgbWF0ZXJpYWwgbm93LCB0aGFua3MhCgoKVGhh
bmsgeW91IHZlcnkgbXVjaCEKCkFsZXgKCgo+Cj4+Pj4+IEZpeGVzOiA3N2JlNWNhY2IyYzIgKCJB
Q1BJOiBwbGF0Zm9ybV9wcm9maWxlOiBDcmVhdGUgY2xhc3MgZm9yIEFDUEkKPj4+Pj4gcGxhdGZv
cm0gcHJvZmlsZSIpCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICAgIGRyaXZlcnMvYWNwaS9wbGF0Zm9y
bV9wcm9maWxlLmMgfCAzICsrKwo+Pj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvcGxhdGZvcm1fcHJvZmls
ZS5jCj4+Pj4+IGIvZHJpdmVycy9hY3BpL3BsYXRmb3JtX3Byb2ZpbGUuYwo+Pj4+PiBpbmRleCBm
ZmJmZDMyZjRjZjEuLmI0M2Y0NDU5YTRmNiAxMDA2NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy9hY3Bp
L3BsYXRmb3JtX3Byb2ZpbGUuYwo+Pj4+PiArKysgYi9kcml2ZXJzL2FjcGkvcGxhdGZvcm1fcHJv
ZmlsZS5jCj4+Pj4+IEBAIC02ODgsNiArNjg4LDkgQEAgc3RhdGljIGludCBfX2luaXQgcGxhdGZv
cm1fcHJvZmlsZV9pbml0KHZvaWQpCj4+Pj4+ICAgIHsKPj4+Pj4gICAgICAgIGludCBlcnI7Cj4+
Pj4+ICAgICsgICAgaWYgKGFjcGlfZGlzYWJsZWQpCj4+Pj4+ICsgICAgICAgIHJldHVybiAtRU9Q
Tk9UU1VQUDsKPj4+Pj4gKwo+Pj4+PiAgICAgICAgZXJyID0gY2xhc3NfcmVnaXN0ZXIoJnBsYXRm
b3JtX3Byb2ZpbGVfY2xhc3MpOwo+Pj4+PiAgICAgICAgaWYgKGVycikKPj4+Pj4gICAgICAgICAg
ICByZXR1cm4gZXJyOwo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4+Pj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+Pj4gbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
