Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5D0C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 06:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X6NgwORzVZ3on/AoYY6xN8wcPe/bjOfwkkzi93gAIUY=; b=ATXtG1ZOrO1jFX
	c/rWzdL6rvBZWzTRjp5I8MuQKRJhcyXSNPVW6csK9wDnXRqN/BbWN1LON30Qs5noMcc8E7KUIaho7
	mYd6LEkG+c86VdqnkT4+ILGjvqRAZZu6FSwRP1iCZfBkefFJ73WM5OuEAxUOvZONAbWbJS+QuSy/a
	TxKv4FS/jBJkOQjCEx2R+6Y4IZDIkfL6yex3/rwJEZYiQeN44UfAengNAfS8/E0MLhAhCxKih5/IT
	HPxU9FisB2g8evgILY1og/l2rlb+B5m5yUuDjHILm4bktA/ovrXrHBsUdr1jysRxYTPklT81TlkEp
	L9S0Ik2Xt/e/hhnoUBOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz9NS-0000000G6Dy-2uWe;
	Tue, 23 Apr 2024 06:11:39 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz9NP-0000000G6DV-0Vh5
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 06:11:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0398040003;
	Tue, 23 Apr 2024 06:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713852691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=emJM6JECa8OhqTBhCwE/o7mPRrnseSWT8F4796SNfSo=;
	b=iGvnYS9mH/mNc/kmCknZxVTnmloR18k9z0DPL8exdP8dQHbFcbnLPPd7SO92i9nzwJF7fV
	e3+9O8qpfpMLpeH7KUpcT+PLXw1Z9+K+M5Z8p/tFiPi406YfxBKTlAj8V3cjwhAZX/fu8T
	x5XnOy9qcqZJITmZty25Mkggh3IWfqSWwyj0K34V6dqftxq+YpGdkUTUhoP51FLNST82cV
	47kThbG+YS2Jr0HhluoyZYQov8N+PJ3g+WxAkjakwgC2TXKt3qwrG0WOk88hWfENB8rQ0g
	LwNUnED1+tvTj4/EaoxD2xM0HkLNlBihmWOP9xHl0CpKJMFWW7Vozx1jaR4QIw==
Message-ID: <fbdcc77e-eab4-41da-803c-d65405f37f02@bootlin.com>
Date: Tue, 23 Apr 2024 08:11:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@bootlin.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] riscv: dts: sophgo: add initial Milk-V Duo S board
 support
To: Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20240417065311.3881023-1-michael.opdenacker@bootlin.com>
 <20240417065311.3881023-3-michael.opdenacker@bootlin.com>
 <IA1PR20MB49539A380E44459ACE19DEB6BB0F2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <e457d5f6-3289-4049-b663-2ebcfe78dce4@bootlin.com>
 <IA1PR20MB4953D0D45EB0EDB6E8046664BB132@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <IA1PR20MB4953D0D45EB0EDB6E8046664BB132@IA1PR20MB4953.namprd20.prod.outlook.com>
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_231135_564892_9BCB8CA2 
X-CRM114-Status: GOOD (  14.23  )
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

SGkgSW5vY2hpLAoKVGhhbmtzIGZvciB0aGUgYWR2aWNlLgoKT24gNC8yMS8yNCBhdCAwODozMCwg
SW5vY2hpIEFtYW90byB3cm90ZToKPiBPbiBTdW4sIEFwciAyMSwgMjAyNCBhdCAwNzo1NzowMUFN
IEdNVCwgTWljaGFlbCBPcGRlbmFja2VyIHdyb3RlOgo+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9k
dHMvc29waGdvL3NnMjAwMC1taWxrdi1kdW9zLmR0cwo+IEBAIC0wLDAgKzEsMzQgQEAKPiArLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIE1JVCkKPiArLyoKPiArICogQ29w
eXJpZ2h0IChDKSAyMDI0IE1pY2hhZWwgT3BkZW5hY2tlciA8bWljaGFlbC5vcGRlbmFja2VyQGJv
b3RsaW4uY29tPgo+ICsgKi8KPiArCj4gKy9kdHMtdjEvOwo+ICsKPiArI2luY2x1ZGUgImN2MTgx
MmguZHRzaSIKPiArCj4gKy8gewo+ICsJbW9kZWwgPSAiTWlsay1WIER1byBTIjsKPiArCWNvbXBh
dGlibGUgPSAibWlsa3YsZHVvcyIsICJzb3BoZ28sY3YxODEyaCI7Cj4gKwo+ICsJYWxpYXNlcyB7
Cj4gKwkJc2VyaWFsMCA9ICZ1YXJ0MDsKPiArCX07Cj4gKwo+ICsJY2hvc2VuIHsKPiArCQlzdGRv
dXQtcGF0aCA9ICJzZXJpYWwwOjExNTIwMG44IjsKPiArCX07Cj4gKwo+ICsJbWVtb3J5QDgwMDAw
MDAwIHsKPiArCQlkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwo+ICsJCXJlZyA9IDwweDgwMDAwMDAw
IDB4MjAwMDAwMDA+Owo+ICsJfTsKPj4+IEFkZCBhIGNwdSBzcGVjaWZpYyBmaWxlLCBhbmQgbW92
ZSB0aGlzIHRvIGl0Lgo+PiBOb3cgdGhhdCBJJ20gaW5jbHVkaW5nICJjdjE4MTJoLmR0c2kiLCB3
aGljaCBoYXMgdGhlIHNhbWUgc3RydWN0dXJlLCBhbGwgSQo+PiBuZWVkIGlzIHRvIGNoYW5nZSB0
aGUgcmVnIHNldHRpbmcgdG8gaGF2ZSA1MTIgTUIgb2YgUkFNIGluc3RlYWQgb2YgMjU2TUIsCj4+
IHJpZ2h0PyBTZWUgdGhlIFY2IEknbSBzZW5kaW5nIHNvb24uCj4+Cj4gTm8sIER1byBTIGRvZXMg
bm90IHVzZSBjdjE4MTJoLCBpbiBhbnkgbWVhbnMuIEkganVzdCB0b2xkIHlvdSB0byB1c2UKPiBj
djE4MTJoIGZvciBsb2NhbCB0ZXN0LiBJZiB5b3Ugd2FudCB0byB1cHN0cmVhbSBEdW8gUywgeW91
IG11c3QgYWRkCj4gdGhlIHJpZ2h0IGNwdSBjb21wYXRpYmxlcyBhbmQgbmVjZXNzYXJ5IG5vZGVz
LiBUaGVzZSB0d28gYXJlIGRpZmZlcmVudAo+IHRoaW5ncy4KClNvLCBkbyB5b3UgbWVhbiBJIHNo
b3VsZCBjcmVhdGUgYSBuZXcgInNvcGhnbyxzZzIwMDAiIGNvbXBhdGlibGUsIAp0b2dldGhlciB3
aXRowqAgYSBuZXcgInNnMjAwMC5kdHNpIiAob3IgInNnMjAweC5kdHNpIj8pIGZpbGU/IENvdWxk
IHRoaXMgCmZpbGUgaW5jbHVkZSAiY3YxOHh4LmR0c2kiPwoKQnkgdGhlIHdheSwgd2hlcmUncyB0
aGUgYmVzdCBzb3VyY2Ugb2YgaW5mb3JtYXRpb24gYWJvdXQgdGhlIFNvcGhnbyAKc2cyMDAwIGFu
ZCBzZzIwMDIgcHJvY2Vzc29ycz8gRXZlbiB0aGUgU29waGdvIHdlYnNpdGUgZG9lc24ndCBzZWVt
IHRvIApoYXZlIHRoZW0gOi0vIC4gSXQganVzdCBtZW50aW9ucyB0aGUgQ1YxOHh4IG9uZXMuCgpU
aGFua3MgYWdhaW4KQ2hlZXJzCk1pY2hhZWwuCgotLSAKTWljaGFlbCBPcGRlbmFja2VyLCBCb290
bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGlu
LmNvbQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
