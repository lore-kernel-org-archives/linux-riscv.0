Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D145BC369D5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 07:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cjh5jJuJEwYRy/hcf2Treg5BS8Puad9LmDItOAUgccg=; b=PBEVSLyoXtpDfU
	8tvSgBk1VrPxEUbTw9b9ehc/HdF6J2l6od1B6XUE44zZETC7IbJVOuqZle8jG3zCk03C6KRdIsbQe
	4ThswGrTC6X+EhbaxZGPNJaVp0Q91Ytv9tRzVICHUN45i4Resib3sW2/ouXbmAhfuMwuZFnLw6zWi
	KiGjJgGlGsxn5pvk51FIfgclUlDdiIIhE7kVOoZmbeCto9klikbyCWtf3udcoo0cXzvRXkN+7xC3r
	/Vj6LT8+fPuThnMIq0ADxWu6xmnoGXH7SLcRNL5Gw3iRkMkEst2PsEJn8E71wA9IkuTQ50Vm2f1GL
	luxYjg//3PgiP8SrD02w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lLR-00000003lGi-1i8p;
	Mon, 21 Apr 2025 07:13:33 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lLO-00000003lG2-1PKx
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 07:13:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CA3943A5D;
	Mon, 21 Apr 2025 07:13:23 +0000 (UTC)
Message-ID: <f834a4dd-8c76-4246-9923-600979b1d983@ghiti.fr>
Date: Mon, 21 Apr 2025 09:13:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] riscv: misaligned: enable IRQs while handling
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
References: <20250414123543.1615478-1-cleger@rivosinc.com>
 <20250414123543.1615478-3-cleger@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250414123543.1615478-3-cleger@rivosinc.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedtgeeuhffhveeujeetveevieekleekvdffudefleevgefgieekkefggefhtddtveenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmedufhehjeemvgdutggumedukegutdemtgdtvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmedufhehjeemvgdutggumedukegutdemtgdtvdekpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmedufhehjeemvgdutggumedukegutdemtgdtvdekngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopegtlhgvghgvrhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrr
 dhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhhsvghlfhhtvghsthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_001330_502414_B87774A3 
X-CRM114-Status: GOOD (  13.71  )
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

T24gMTQvMDQvMjAyNSAxNDozNCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IFdlIGNhbiBzYWZl
bHkgcmVlbmFibGUgSVJRcyBpZiB0aGV5IHdlcmUgZW5hYmxlZCBpbiB0aGUgcHJldmlvdXMKPiBj
b250ZXh0LiBUaGlzIGFsbG93cyB0byBhY2Nlc3MgdXNlciBtZW1vcnkgdGhhdCBjb3VsZCBwb3Rl
bnRpYWxseQo+IHRyaWdnZXIgYSBwYWdlIGZhdWx0Lgo+Cj4gRml4ZXM6IGI2ODZlY2RlYWNmNiAo
InJpc2N2OiBtaXNhbGlnbmVkOiBSZXN0cmljdCB1c2VyIGFjY2VzcyB0byBrZXJuZWwgbWVtb3J5
IikKPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+
Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIHwgOCArKysrKysrKwo+ICAgMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gaW5kZXggNTVkOWYz
NDUwMzk4Li4zZWVjYzJhZGRjNDEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiBAQCAtMjA2LDYgKzIwNiwx
MSBAQCBlbnVtIG1pc2FsaWduZWRfYWNjZXNzX3R5cGUgewo+ICAgc3RhdGljIHZvaWQgZG9fdHJh
cF9taXNhbGlnbmVkKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBlbnVtIG1pc2FsaWduZWRfYWNjZXNz
X3R5cGUgdHlwZSkKPiAgIHsKPiAgIAlpcnFlbnRyeV9zdGF0ZV90IHN0YXRlID0gaXJxZW50cnlf
ZW50ZXIocmVncyk7Cj4gKwlib29sIGVuYWJsZV9pcnFzID0gIXJlZ3NfaXJxc19kaXNhYmxlZChy
ZWdzKTsKPiArCj4gKwkvKiBFbmFibGUgaW50ZXJydXB0cyBpZiB0aGV5IHdlcmUgZW5hYmxlZCBp
biB0aGUgaW50ZXJydXB0ZWQgY29udGV4dC4gKi8KPiArCWlmIChlbmFibGVfaXJxcykKPiArCQls
b2NhbF9pcnFfZW5hYmxlKCk7Cj4gICAKPiAgIAlpZiAodHlwZSA9PSAgTUlTQUxJR05FRF9MT0FE
KSB7Cj4gICAJCWlmIChoYW5kbGVfbWlzYWxpZ25lZF9sb2FkKHJlZ3MpKQo+IEBAIC0yMTcsNiAr
MjIyLDkgQEAgc3RhdGljIHZvaWQgZG9fdHJhcF9taXNhbGlnbmVkKHN0cnVjdCBwdF9yZWdzICpy
ZWdzLCBlbnVtIG1pc2FsaWduZWRfYWNjZXNzX3R5cGUKPiAgIAkJCQkgICAgICAiT29wcyAtIHN0
b3JlIChvciBBTU8pIGFkZHJlc3MgbWlzYWxpZ25lZCIpOwo+ICAgCX0KPiAgIAo+ICsJaWYgKGVu
YWJsZV9pcnFzKQo+ICsJCWxvY2FsX2lycV9kaXNhYmxlKCk7Cj4gKwo+ICAgCWlycWVudHJ5X2V4
aXQocmVncywgc3RhdGUpOwo+ICAgfQo+ICAgCgoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0
aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkFsZXgKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
