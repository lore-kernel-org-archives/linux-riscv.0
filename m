Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494CAC87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 13:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aA6brEasIgjG158Hq6x305GfBm0Azjuc1KiXVEDq4pY=; b=WVLEuDsM2/XHomVwuafF/lkZN5
	x/y8lLbDivI4iJoPw9spXkIhi9HfffsSsGgtWEf/fMneebCHKMo69FXD/vvCoT5VB8PXpS60M31QA
	LjvahsS1YmkS9cy8r2L/buSSbxrIZlPRF1WAWtEj4YjGecPviFhWdVbfjkFbaJvJ3jvIQt5/HTGkr
	DM2RMcQPck5ue4W8Truj6tYVNK47yNQ3CqQcIkIPtAiey5ePSekjGzKG8Vifi4w/AfchrRSqUsY2a
	vpe4mNjaoufU5C//Kx6jzrjoQg84FOvS34C0sOERY51vBWLZMS5GFgSp1zmgaHVDMh6RM69x2QmUj
	H++1iF6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufIgr-00000009vm3-42hI;
	Fri, 25 Jul 2025 13:42:25 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufIgo-00000009vlN-2Aje
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 13:42:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B94D143173;
	Fri, 25 Jul 2025 13:42:15 +0000 (UTC)
Message-ID: <fa6f5e3c-3452-41ff-ab81-60f5f31ff797@ghiti.fr>
Date: Fri, 25 Jul 2025 15:42:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: uaccess: fix __put_user_nocheck for unaligned
 accesses
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
References: <20250724220853.1969954-1-aurelien@aurel32.net>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250724220853.1969954-1-aurelien@aurel32.net>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekfeeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhefgvdetjeeigfdvveekgfduheekkeehgfekvddtueegtdevffefjeehkedtgfenucfkphepleehrddugedurddutddvrddukeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepleehrddugedurddutddvrddukeeipdhhvghloheplgdutddruddtrddugeeirddvudejngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeejpdhrtghpthhtoheprghurhgvlhhivghnsegruhhrvghlfedvrdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegtlhgvghgvrhesr
 hhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_064222_701931_13E329B3 
X-CRM114-Status: GOOD (  16.68  )
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

SGkgQXVyw6lsaWVuLAoKT24gNy8yNS8yNSAwMDowOCwgQXVyZWxpZW4gSmFybm8gd3JvdGU6Cj4g
VGhlIHR5cGUgb2YgdGhlIHZhbHVlIHRvIHdyaXRlIHNob3VsZCBiZSBkZXRlcm1pbmVkIGJ5IHRo
ZSBzaXplIG9mIHRoZQo+IGRlc3RpbmF0aW9uLCBub3QgYnkgdGhlIHZhbHVlIGl0c2VsZiwgd2hp
Y2ggbWF5IGJlIGEgY29uc3RhbnQuIFRoaXMKPiBhbGlnbnMgdGhlIGJlaGF2aW9yIHdpdGggeDg2
XzY0LCB3aGVyZSBfX3R5cGVvZl9fKCooX19ndV9wdHIpKSBpcyB1c2VkCj4gdG8gaW5mZXIgdGhl
IGNvcnJlY3QgdHlwZS4KPgo+IFRoaXMgZml4ZXMgYW4gaXNzdWUgaW4gcHV0X2Ntc2csIHdoaWNo
IHdhcyBvbmx5IHdyaXRpbmcgNCBvdXQgb2YgOAo+IGJ5dGVzIHRvIHRoZSBjbXNnX2xlbiBmaWVs
ZCwgY2F1c2luZyB0aGUgZ2xpYmMgdHN0LXNvY2tldC10aW1lc3RhbXAgdGVzdAo+IHRvIGZhaWwu
Cj4KPiBGaXhlczogY2ExYTY2Y2RkNjg1ICgicmlzY3Y6IHVhY2Nlc3M6IGRvIG5vdCBkbyBtaXNh
bGlnbmVkIGFjY2Vzc2VzIGluIGdldC9wdXRfdXNlcigpIikKPiBTaWduZWQtb2ZmLWJ5OiBBdXJl
bGllbiBKYXJubyA8YXVyZWxpZW5AYXVyZWwzMi5uZXQ+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vdWFjY2Vzcy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiBpbmRleCBi
ODhhNjIxOGI3ZjI0Li4yMmUzZjUyYTc2M2QxIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdWFjY2Vzcy5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91YWNjZXNz
LmgKPiBAQCAtMzExLDcgKzMxMSw3IEBAIGRvIHsJCQkJCQkJCVwKPiAgIGRvIHsJCQkJCQkJCVwK
PiAgIAlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NF
U1MpICYmCVwKPiAgIAkgICAgIUlTX0FMSUdORUQoKHVpbnRwdHJfdClfX2d1X3B0ciwgc2l6ZW9m
KCpfX2d1X3B0cikpKSB7CVwKPiAtCQlfX2ludHR5cGUoeCkgX19fdmFsID0gKF9faW50dHlwZSh4
KSl4OwkJCVwKPiArCQlfX3R5cGVvZl9fKCooX19ndV9wdHIpKSBfX192YWwgPSAoeCk7CQlcCj4g
ICAJCWlmIChfX2FzbV9jb3B5X3RvX3VzZXJfc3VtX2VuYWJsZWQoX19ndV9wdHIsICYoX19fdmFs
KSwgc2l6ZW9mKCpfX2d1X3B0cikpKSBcCj4gICAJCQlnb3RvIGxhYmVsOwkJCQlcCj4gICAJCWJy
ZWFrOwkJCQkJCVwKCgpUaGFua3MgZm9yIGNhdGNoaW5nIHRoaXMgKEkgd2lsbCBhZGQgdGhlIGds
aWJjIHRlc3RzdWl0ZSB0byBvdXIgQ0kpLgoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8
YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkFsZXgKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
