Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC5AC25B67
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 14:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3PBGlAUE7CE4/MB4lJuzeWF2H0QHGvLy8EA3K/PZQUc=; b=BD68HqkjA4ePtr
	oR2YruzkZ1ADAjpzho5tnFaS8MmWd78whetX/RAZUyVfKS3brNfLQ7n3WvSjxmOhsffjhY9pMVnxw
	AfL/zvypFJwlBNmoRQ298li2qNfJaGsmf+hRldgtyx5KHbK1lXvZ2p1hs+L7TEbVDY3ObQnFmEvCl
	t6y7PvRjUjHOwgnethHyUDD7HBx5em9Eno19TXqCjfxELL9AbuebS/oAOkW/Pmk23ToqAHGnfLYVS
	omO5NsCsOBPfEjhZWy30OoHRn9Kho61I+4H5JV1s8b5M3FbdYYrKKU9mZYYpC0xSkiycHYn/IxXck
	3ZYLzaOrITW/LRc/ADsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw19O-00EdtY-1o;
	Thu, 26 Oct 2023 14:15:54 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw19K-00Edrs-2k
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 14:15:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE5F11C000E;
	Thu, 26 Oct 2023 14:15:39 +0000 (UTC)
Message-ID: <32d9627c-821a-48f0-b430-0532a47b8699@ghiti.fr>
Date: Thu, 26 Oct 2023 16:15:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes 0/2] Fix set_huge_pte_at()
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Jones <ajones@ventanamicro.com>,
 Qinglin Pan <panqinglin2020@iscas.ac.cn>, Ryan Roberts
 <ryan.roberts@arm.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <20230928151846.8229-1-alexghiti@rivosinc.com>
 <305b4dec-c99d-3cee-4563-8d7dcbae9384@ghiti.fr>
 <20231003090443.67a2e2692b68211e05b53248@linux-foundation.org>
 <CAHVXubi5C0hBaXx5tqVHZAJSd1zvHRqoxUEkk9ZbmZ5mq2=mAw@mail.gmail.com>
 <20231026071300.e12dab3be1edd26007db85ee@linux-foundation.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20231026071300.e12dab3be1edd26007db85ee@linux-foundation.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_071551_054926_ED4B0C01 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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

biAyNi8xMC8yMDIzIDE2OjEzLCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+IE9uIFRodSwgMjYgT2N0
IDIwMjMgMTA6NTc6MjcgKzAyMDAgQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMu
Y29tPiB3cm90ZToKPgo+PiBPbiBUdWUsIE9jdCAzLCAyMDIzIGF0IDY6MDTigK9QTSBBbmRyZXcg
TW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPiB3cm90ZToKPj4+IE9uIFR1ZSwgMyBP
Y3QgMjAyMyAxNzo0MzoxMCArMDIwMCBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+IHdy
b3RlOgo+Pj4KPj4+PiArY2MgQW5kcmV3OiBXb3VsZCAgeW91IG1pbmQgdGFraW5nIHRoaXMgcGF0
Y2hzZXQgaW4geW91ciB0cmVlIGZvciB0aGUKPj4+PiBuZXh0IHJjPyBUaGlzIHBhdGNoc2V0IGRl
cGVuZHMgb24gYSBwcmV2aW91cyBmaXggZm9yIGFybTY0IHRoYXQgeW91Cj4+Pj4gbWVyZ2VkIGlu
IHJjNCB3aGljaCBpcyBub3QgaW4gdGhlIHJpc2N2IC1maXhlcyBicmFuY2ggeWV0Lgo+Pj4+Cj4+
Pj4gSSBzYXcgd2l0aCBQYWxtZXIgYW5kIGhlIHNob3VsZCBhY2sgdGhpcyBzaG9ydGx5Lgo+Pj4g
V2VsbCBJIGdyYWJiZWQgdGhlbSBpbnRvIG1tLmdpdCdzIG1tLWhvdGZpeGVzLXVuc3RhYmxlIHF1
ZXVlLiAgQWxsCj4+PiBiZWluZyB3ZWxsIEknbGwgbW92ZSB0aGVtIGludG8gbW0taG90Zml4ZXMt
c3RhYmxlIHdpdGhpbiBhIHdlZWsgdGhlbgo+Pj4gaW50byBMaW51cyBzaG9ydGx5IGFmdGVyLgo+
PiBUaG9zZSBmaXhlcyBmaW5hbGx5IGRpZCBub3QgbWFrZSBpdCB0byA2LjYsIEkgd2FzIGhvcGlu
ZyBmb3IgdGhlbSB0bwo+PiBsYW5kIGluIC1yYzYgb3IgLXJjNzogZm9yIHRoZSBmdXR1cmUsIHdo
YXQgc2hvdWxkIGhhdmUgSSBkb25lIHRvIGF2b2lkCj4+IHRoYXQ/Cj4gVGhleSdyZSBtZXJnZWQg
aW4gTGludXMncyB0cmVlLgo+Cj4gNmYxYmFjZTlhOWZiIGFybTY0OiBodWdldGxiOiBmaXggc2V0
X2h1Z2VfcHRlX2F0KCkgdG8gd29yayB3aXRoIGFsbCBzd2FwIGVudHJpZXMKPiA5MzVkNGYwYzZk
YzggbW06IGh1Z2V0bGI6IGFkZCBodWdlIHBhZ2Ugc2l6ZSBwYXJhbSB0byBzZXRfaHVnZV9wdGVf
YXQoKQoKCk9vcHMsIHNvcnJ5LCBJIG1pc3NlZCB0aGVtIHRoaXMgbW9ybmluZyEKClRoYW5rcywK
CkFsZXgKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
