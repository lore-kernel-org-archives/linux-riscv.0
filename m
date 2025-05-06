Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09493C3ABC0
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 09:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZR91ucj8PChoeI0ZaOMV1V72/8lgmsnitg54LW6nsc=; b=nvLRdnCfsGUE+HHHgV9Sdl8ZIV
	2uMkY9cke/hHtTZdD8iMZdB0wFql9Uqe/r0Jo2daurUCOt22wnAJ1wxVojATX4WKt6yAdW+epwbkH
	l4nfY75m0coGKLv6MRtc5/oJHY57s86pTIUg48hvK/6Y+DioSBE98vGxkuLO+YcBeWOepSIOIjcFf
	GMCJoVJwRqmXQb89wJOgMhj1iDzDmX+CECX+HvH4s/NW2R5ghSLQLs8zwLVJK3I1gQgzXCjli5tHL
	DnFSq6K5Yo7u0rI5puQ8DPnPTIHlk9Grp6pJ2N2y6jzdYhMInXuF+LIRcgpVrznmt2zoKN8Xxc7g1
	3uR0nJyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEHe-0000000BHXm-3dXd;
	Tue, 06 May 2025 09:08:14 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDk2-0000000BB8g-16k5
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 08:33:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FBA243A6C;
	Tue,  6 May 2025 08:33:24 +0000 (UTC)
Message-ID: <ceccc081-2dd5-4828-8eaf-148b48e05eda@ghiti.fr>
Date: Tue, 6 May 2025 10:33:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Improve Kconfig help for RISCV_ISA_V_PREEMPTIVE
Content-Language: en-US
To: mikisabate@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250501130309.14803-1-mikisabate@gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250501130309.14803-1-mikisabate@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeefheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhefgvdetjeeigfdvveekgfduheekkeehgfekvddtueegtdevffefjeehkedtgfenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeehkegvudemfhdvsgegmeejrgelvdemfedvledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeehkegvudemfhdvsgegmeejrgelvdemfedvledtpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeehkegvudemfhdvsgegmeejrgelvdemfedvledtngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepmhhikhhishgrsggrthgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvhesl
 hhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_013330_430738_AD6C2970 
X-CRM114-Status: GOOD (  13.16  )
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

SGkgTWlxdWVsLAoKWW91ciBwYXRjaCB0aXRsZSBzaG91bGQgYmUgcHJlZml4ZWQgd2l0aCAicmlz
Y3YiIG9yICJSSVNDLVYiLCBidXQgbm8gCm5lZWQgdG8gcmVzZW5kLCBJJ2xsIGZpeCBpdCB3aGVu
IEkgbWVyZ2UgeW91ciBwYXRjaC4KCk9uIDAxLzA1LzIwMjUgMTU6MDMsIG1pa2lzYWJhdGVAZ21h
aWwuY29tIHdyb3RlOgo+IEZyb206IE1pcXVlbCBTYWJhdMOpIFNvbMOgIDxtaWtpc2FiYXRlQGdt
YWlsLmNvbT4KPgo+IEZpeCBhIGNvdXBsZSBvZiBzcGVsbGluZyBpc3N1ZXMgcGx1cyBzb21lIG1p
bm9yIGRldGFpbHMgb24gdGhlIGdyYW1tYXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgU2Fi
YXTDqSBTb2zDoCA8bWlraXNhYmF0ZUBnbWFpbC5jb20+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L0tj
b25maWcgfCA4ICsrKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gv
cmlzY3YvS2NvbmZpZwo+IGluZGV4IDFmZDE5N2FmZDJmNy4uM2Y0MGUzM2JjMTE1IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IEBA
IC02NjQsMTIgKzY2NCwxMiBAQCBjb25maWcgUklTQ1ZfSVNBX1ZfUFJFRU1QVElWRQo+ICAgCWRl
ZmF1bHQgeQo+ICAgCWhlbHAKPiAgIAkgIFVzdWFsbHksIGluLWtlcm5lbCBTSU1EIHJvdXRpbmVz
IGFyZSBydW4gd2l0aCBwcmVlbXB0aW9uIGRpc2FibGVkLgo+IC0JICBGdW5jdGlvbnMgd2hpY2gg
ZW52b2tlIGxvbmcgcnVubmluZyBTSU1EIHRodXMgbXVzdCB5aWVsZCBjb3JlJ3MKPiArCSAgRnVu
Y3Rpb25zIHdoaWNoIGludm9rZSBsb25nIHJ1bm5pbmcgU0lNRCB0aHVzIG11c3QgeWllbGQgdGhl
IGNvcmUncwo+ICAgCSAgdmVjdG9yIHVuaXQgdG8gcHJldmVudCBibG9ja2luZyBvdGhlciB0YXNr
cyBmb3IgdG9vIGxvbmcuCj4gICAKPiAtCSAgVGhpcyBjb25maWcgYWxsb3dzIGtlcm5lbCB0byBy
dW4gU0lNRCB3aXRob3V0IGV4cGxpY2l0bHkgZGlzYWJsZQo+IC0JICBwcmVlbXB0aW9uLiBFbmFi
bGluZyB0aGlzIGNvbmZpZyB3aWxsIHJlc3VsdCBpbiBoaWdoZXIgbWVtb3J5Cj4gLQkgIGNvbnN1
bXB0aW9uIGR1ZSB0byB0aGUgYWxsb2NhdGlvbiBvZiBwZXItdGFzaydzIGtlcm5lbCBWZWN0b3Ig
Y29udGV4dC4KPiArCSAgVGhpcyBjb25maWcgYWxsb3dzIHRoZSBrZXJuZWwgdG8gcnVuIFNJTUQg
d2l0aG91dCBleHBsaWNpdGx5IGRpc2FibGluZwo+ICsJICBwcmVlbXB0aW9uLiBFbmFibGluZyB0
aGlzIGNvbmZpZyB3aWxsIHJlc3VsdCBpbiBoaWdoZXIgbWVtb3J5IGNvbnN1bXB0aW9uCj4gKwkg
IGR1ZSB0byB0aGUgYWxsb2NhdGlvbiBvZiBwZXItdGFzaydzIGtlcm5lbCBWZWN0b3IgY29udGV4
dC4KPiAgIAo+ICAgY29uZmlnIFJJU0NWX0lTQV9aQVdSUwo+ICAgCWJvb2wgIlphd3JzIGV4dGVu
c2lvbiBzdXBwb3J0IGZvciBtb3JlIGVmZmljaWVudCBidXN5IHdhaXRpbmciCgoKUmV2aWV3ZWQt
Ynk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkFs
ZXgKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
