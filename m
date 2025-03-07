Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F72C282DE
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 09:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zxzl/9RVfVxRBR7kIR17eG1Ax0HmbiIK+7dwTVmfMg0=; b=u3SFd9BRF3jNmx
	TGk9NQgRJdhasyJb07mHHfNUuDUceZ8ltfjzTV4KFRT0oNCPe3GA7L+YYNlwptmq3b8/eN9g6sW0G
	r9yhYg+roAjYuVLD8Rr3qfY25p0Q2jfhg3R8icHkZiSm/ecLVxxORlwX0ZJOwUxgWTAFrp8nMpGy5
	+VqIea3gwiPKbevhJA6nmEhZqFh5j9CcfsMQkjMup0dXE+VKlbbUzhRJpJaj4ccxn9yJnbPSchRpI
	R1FLQd793wSm8xonLdoFL2ZFBhGfyRLla0uPt/TMOyvyRZznpyAq281kYzHI7iGFxbEqDl5QccEKz
	y9PI8qbeePLlA7v7Bn6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTha-0000000DekK-1mgT;
	Fri, 07 Mar 2025 09:09:06 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqThX-0000000DejD-0ebz
	for linux-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 09:09:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F71A43147;
	Fri,  7 Mar 2025 09:08:56 +0000 (UTC)
Message-ID: <d76f62d5-b461-4bff-baa7-62d0eabbf2cd@ghiti.fr>
Date: Fri, 7 Mar 2025 10:08:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [resend PATCH] riscv: fix memory leakage in
 process_accumulated_relocations
To: laokz <zhangkai@iscas.ac.cn>, Walmsley <paul.walmsley@sifive.com>,
 Dabbelt <palmer@dabbelt.com>, Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <a9058ac757636e4f5160a0bd11abeb3c111fc9a5.camel@iscas.ac.cn>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <a9058ac757636e4f5160a0bd11abeb3c111fc9a5.camel@iscas.ac.cn>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddtvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepuefffedvleetleetjefhjeehudejteetvedtvddvtdfhieetffelvdffgefgieeinecuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecukfhppeeghedrudeftddrvdefkedrudekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeghedrudeftddrvdefkedrudekfedphhgvlhhopegludelvddrudeikedrheehrdduheefngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepiihhrghnghhkrghisehishgtrghsrdgrtgdrtghnpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhto
 heplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_010903_346989_9908B087 
X-CRM114-Status: GOOD (  12.57  )
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

SGkgS2FpLAoKT24gMTYvMTEvMjAyNCAxMzowNywgbGFva3ogd3JvdGU6Cj4gU29ycnkgZm9yIGxh
c3Qgd2VpcmQgZW1haWwuCj4gLS0tCj4KPiBXaGVuIG1vZHVsZSByZWxvY2F0aW9uIGlzIGRvbmUs
IHByb2Nlc3NfYWNjdW11bGF0ZWRfcmVsb2NhdGlvbnMoKQo+IGZyZWVzIGFsbCBkeW5hbWljIGFs
bG9jYXRlZCBtZW1vcnkuIHJlbF9oZWFkX2l0ZXItPnJlbF9lbnRyeSBpcwo+IG1pc3NlZCB0byBm
cmVlIHRoYXQga21lbWxlYWsgbWlnaHQgcmVwb3J0Ogo+Cj4gdW5yZWZlcmVuY2VkIG9iamVjdCAw
eGZmZmZmZmQ4ODBjNWZjNDAgKHNpemUgMTYpOgo+ICDCoCBjb21tICJpbnNtb2QiLCBwaWQgMTEw
MSwgamlmZmllcyA0Mjk1MDQ1MTM4Cj4gIMKgIGhleCBkdW1wIChmaXJzdCAxNiBieXRlcyk6Cj4g
IMKgwqDCoCBlMCBjMCBmNSA4NyBkOCBmZiBmZiBmZiA2MCBjNSBmNSA4NyBkOCBmZiBmZiBmZsKg
IC4uLi4uLi4uYC4uLi4uLi4KPiAgwqAgYmFja3RyYWNlIChjcmMgZDJlY2IyMGMpOgo+ICDCoMKg
wqAgWzwwMDAwMDAwMGIwMTY1NWY2Pl0ga21hbGxvY190cmFjZV9ub3Byb2YrMHgyNjgvMHgyZjYK
PiAgwqDCoMKgIFs8MDAwMDAwMDA2ZGMwMDY3YT5dCj4gYWRkX3JlbG9jYXRpb25fdG9fYWNjdW11
bGF0ZS5jb25zdHByb3AuMCsweGYyLzB4MWFhCj4gIMKgwqDCoCBbPDAwMDAwMDAwZTFiMjlhMzY+
XSBhcHBseV9yZWxvY2F0ZV9hZGQrMHgxM2MvMHgzNmUKPiAgwqDCoMKgIFs8MDAwMDAwMDA3NTQz
ZjFmYj5dIGxvYWRfbW9kdWxlKzB4NWM2LzB4ODNlCj4gIMKgwqDCoCBbPDAwMDAwMDAwYWJjZTEy
ZTg+XSBpbml0X21vZHVsZV9mcm9tX2ZpbGUrMHg3NC8weGFhCj4gIMKgwqDCoCBbPDAwMDAwMDAw
NDk0MTNlM2Q+XSBpZGVtcG90ZW50X2luaXRfbW9kdWxlKzB4MTE2LzB4MjJlCj4gIMKgwqDCoCBb
PDAwMDAwMDAwZjliOThiODU+XSBfX3Jpc2N2X3N5c19maW5pdF9tb2R1bGUrMHg2Mi8weGFlCj4K
PiBTaWduZWQtb2ZmLWJ5OiBLYWkgWmhhbmcgPHpoYW5na2FpQGlzY2FzLmFjLmNuPgo+IC0tLQo+
ICDCoGFyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5jIHwgMSArCj4gIMKgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxl
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYwo+IGluZGV4IDFjZDQ2MWYzZDg3Li5mOGMz
YzRiNDdkYyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYwo+ICsrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5jCj4gQEAgLTY0Myw2ICs2NDMsNyBAQCBwcm9jZXNz
X2FjY3VtdWxhdGVkX3JlbG9jYXRpb25zKHN0cnVjdCBtb2R1bGUgKm1lLAo+ICDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiAgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWxvY19oYW5kbGVyc1tjdXJyX3R5cGVd
LmFjY3VtdWxhdGVfaGFuZGxlcigKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWUsIGxvY2F0aW9uLCBidWZmZXIpOwo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBrZnJlZShyZWxfaGVh
ZF9pdGVyLT5yZWxfZW50cnkpOwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGtmcmVlKHJlbF9oZWFkX2l0ZXIpOwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAga2ZyZWUoYnVj
a2V0X2l0ZXIpOwo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2CgoKVGhpcyBwYXRjaCBpcyBub3QgcmVsZXZhbnQgYW55bW9yZSBzaW5jZSBj
b21taXQgMDNmMGI1NDg1MzdmICgicmlzY3Y6IAptb2R1bGU6IHJlbW92ZSByZWxvY2F0aW9uX2hl
YWQgcmVsX2VudHJ5IG1lbWJlciBhbGxvY2F0aW9uIikgd2hpY2ggCnR1cm5lZCB0aGUgZHluYW1p
YyBhbGxvY2F0aW9uIG9mIHJlbF9lbnRyeSBpbnRvIGEgc3RhdGljIGFsbG9jYXRpb24uCgpUaGFu
a3MgYW55d2F5IEthaSwgdGhhdCB3YXMgYSBnb29kIGNhdGNoLgoKQWxleAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
