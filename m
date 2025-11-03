Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC7FCCF9F8
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 03:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2m3fJHjh49POzCQ/qusMVGzZLHODgq7TIzLowCKj6A=; b=1lNFLqx7BiCGHH
	R7EIarsGHSUbprefyq9j8TMYP26lUCbnzLwIFgCHtuyBEpiYvh4/x79OUKmwUxNN4bantpv65SlqR
	/fH0jHP8oSAbzYQy4dEo92SI4PEd3fRD2upSQ+XH21PNEkUlmaT2Ye+ItWVszKrj2nUrRuJCz2Bwt
	9+qwgK96duP/mJAvvFV1W/cd0Vy4x82n3rueQALdIbw5yVmMbBXDbx5PORPKbK/zU50/Mv7+6WX7u
	FJ0l9LRKf37BMrdlU7hthLmFQSW3wANJqmfUE806RD9JThtzGUGQ3Ra+3HKcG/9R2K6/VuCbHLwqa
	/b4eqggb7vXQskIqwjmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFlUe-000000098nM-1VHJ;
	Mon, 03 Nov 2025 03:44:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFlUc-000000098ms-1YQQ
	for linux-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 03:44:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1836B44412
	for <linux-riscv@lists.infradead.org>; Mon,  3 Nov 2025 03:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3CCC116B1
	for <linux-riscv@lists.infradead.org>; Mon,  3 Nov 2025 03:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762141468;
	bh=gdUkQPTJ/VPhEpfeRnKn2z1gE2JqH/SrDbDMetRQfZk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rFn57gkFOYHOJYiPiDrpFN7XEkqaE2BJq+5anLEYB8G6l66AA3IUCvyJMwDaOjEoK
	 3B0E7UJ61AaYjkaEnYJbQT23ySeTKck+dZgA7OqoJRM0qLJ8PDpjH8nb74MSJH+Gk2
	 phLG7W6t64H8JC1MVlzZEnqVRVQ0gi1L6q9fOjmZliQn5L2oqrxPDYEmWJicRkBC5I
	 2dUC441hdBc8FX4eXS7re4yHoCgyQnlK8G9dDH4iYkYfOdr5pkdf6eCbYc5qv8OTPq
	 c9ob5gNZQZZdZFSAXEMuMypKFePK1Nc4xV+xE/6kIgH8znRmGu8+F/LyQ6GhaHs2zI
	 RrvNx4ah/+oTA==
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso3056925f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 02 Nov 2025 19:44:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXjIPJAsYG0s4d6mSnt6c6pxLN/glotbw3SKqyJSUwkRaGKnwMiKlrYIXzefws3sTkLHBAazlAAgcgGWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjxxIN3E7YWt/edarOeQVk6UdOjV5zAmuOQ+w2oiPk6A9ZUm5k
	6hQz+Pk5lgQCICflk2Gef0wCBU1fpTwPHG7ImgcVbP9pzcqpKqSZX1VWw3DssUNegeIvRDHsZV1
	Sb5pMo8ShGSC/mv+TaHfabU7TcvXvDvU=
X-Google-Smtp-Source: AGHT+IHrpYfgDGvlMRoqjzYnuod0FjOaTVgsVNAdM4ECirng3fTqP+kR1omSMgHtLa5e0wNZ4Y8EENS3Is6VetOLc7A=
X-Received: by 2002:a05:6000:25c2:b0:429:b8c7:1848 with SMTP id
 ffacd0b85a97d-429bcd5c6ccmr9547366f8f.19.1762141467311; Sun, 02 Nov 2025
 19:44:27 -0800 (PST)
MIME-Version: 1.0
References: <20251030135652.63837-1-luxu.kernel@bytedance.com> <20251030135652.63837-5-luxu.kernel@bytedance.com>
In-Reply-To: <20251030135652.63837-5-luxu.kernel@bytedance.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 3 Nov 2025 11:44:15 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQXunyTdwKrLF2By13u3-n3LRNpC8j2Pnv6umCh89wCJQ@mail.gmail.com>
X-Gm-Features: AWmQ_blAzsZQaFgVv69HaEet96wXDSYvFZq30UlZuizoCFkbz_N3fvc6h5ZzmcA
Message-ID: <CAJF2gTQXunyTdwKrLF2By13u3-n3LRNpC8j2Pnv6umCh89wCJQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/4] riscv: mm: Perform tlb flush during context_switch
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_194430_473544_B75667B8 
X-CRM114-Status: GOOD (  19.76  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBPY3QgMzAsIDIwMjUgYXQgOTo1N+KAr1BNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IER1cmluZyBjb250ZXh0X3N3aXRjaCwgY2hlY2sgdGhlIHBl
cmNwdSB0bGIgZmx1c2ggcXVldWUgYW5kIGxhemlseQo+IHBlcmZvcm0gdGxiIGZsdXNoLgo+Cj4g
U2lnbmVkLW9mZi1ieTogWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+Cj4gLS0tCj4g
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCB8ICA0ICsrKysKPiAgYXJjaC9yaXNj
di9tbS9jb250ZXh0LmMgICAgICAgICAgIHwgIDYgKysrKysrCj4gIGFyY2gvcmlzY3YvbW0vdGxi
Zmx1c2guYyAgICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAg
MyBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJm
bHVzaC5oCj4gaW5kZXggZWVkMGFiYzQwNTE0My4uNzczNWMzNmYxM2Q5ZiAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgKPiArKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3RsYmZsdXNoLmgKPiBAQCAtNjYsNiArNjYsMTAgQEAgdm9pZCBhcmNoX3RsYmJh
dGNoX2FkZF9wZW5kaW5nKHN0cnVjdCBhcmNoX3RsYmZsdXNoX3VubWFwX2JhdGNoICpiYXRjaCwK
PiAgdm9pZCBhcmNoX3RsYmJhdGNoX2ZsdXNoKHN0cnVjdCBhcmNoX3RsYmZsdXNoX3VubWFwX2Jh
dGNoICpiYXRjaCk7Cj4KPiAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgdGxiX2ZsdXNoX2FsbF90aHJl
c2hvbGQ7Cj4gKwo+ICtERUNMQVJFX1BFUl9DUFUoYm9vbCwgbmVlZF90bGJfZmx1c2gpOwo+ICt2
b2lkIGxvY2FsX3RsYl9mbHVzaF9xdWV1ZV9kcmFpbih2b2lkKTsKPiArCj4gICNlbHNlIC8qIENP
TkZJR19NTVUgKi8KPiAgI2RlZmluZSBsb2NhbF9mbHVzaF90bGJfYWxsKCkgICAgICAgICAgICAg
ICAgICBkbyB7IH0gd2hpbGUgKDApCj4gICNlbmRpZiAvKiBDT05GSUdfTU1VICovCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvbW0vY29udGV4dC5jIGIvYXJjaC9yaXNjdi9tbS9jb250ZXh0LmMK
PiBpbmRleCA0ZDU3OTJjM2E4YzE5Li44MmI3NDNiYzgxZTRjIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3YvbW0vY29udGV4dC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9jb250ZXh0LmMKPiBAQCAt
MTk5LDYgKzE5OSwxMiBAQCBzdGF0aWMgdm9pZCBzZXRfbW1fYXNpZChzdHJ1Y3QgbW1fc3RydWN0
ICptbSwgdW5zaWduZWQgaW50IGNwdSkKPgo+ICAgICAgICAgaWYgKG5lZWRfZmx1c2hfdGxiKQo+
ICAgICAgICAgICAgICAgICBsb2NhbF9mbHVzaF90bGJfYWxsKCk7Cj4gKwo+ICsgICAgICAgLyog
UGFpcmVkIHdpdGggUklTQ1ZfRkVOQ0UgaW4gc2hvdWxkX2lwaV9mbHVzaCgpICovCj4gKyAgICAg
ICBSSVNDVl9GRU5DRSh3LCByKTsKPiArCj4gKyAgICAgICBpZiAodGhpc19jcHVfcmVhZChuZWVk
X3RsYl9mbHVzaCkpCj4gKyAgICAgICAgICAgICAgIGxvY2FsX3RsYl9mbHVzaF9xdWV1ZV9kcmFp
bigpOwo+ICB9Cj4KPiAgc3RhdGljIHZvaWQgc2V0X21tX25vYXNpZChzdHJ1Y3QgbW1fc3RydWN0
ICptbSkKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jIGIvYXJjaC9yaXNj
di9tbS90bGJmbHVzaC5jCj4gaW5kZXggZjQzMzNjM2E2ZDI1MS4uNjU5MmY3MjM1NGRmOSAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiArKysgYi9hcmNoL3Jpc2N2L21t
L3RsYmZsdXNoLmMKPiBAQCAtMTE1LDYgKzExNSw4IEBAIERFRklORV9QRVJfQ1BVKHN0cnVjdCB0
bGJfZmx1c2hfcXVldWUsIHRsYl9mbHVzaF9xdWV1ZSkgPSB7Cj4gICAgICAgICAubGVuID0gMCwK
PiAgfTsKPgo+ICtERUZJTkVfUEVSX0NQVShib29sLCBuZWVkX3RsYl9mbHVzaCkgPSBmYWxzZTsK
PiArCj4gIHN0YXRpYyBib29sIHNob3VsZF9pcGlfZmx1c2goaW50IGNwdSwgdm9pZCAqaW5mbykK
PiAgewo+ICAgICAgICAgc3RydWN0IHRsYl9mbHVzaF9xdWV1ZSAqcXVldWUgPSBwZXJfY3B1X3B0
cigmdGxiX2ZsdXNoX3F1ZXVlLCBjcHUpOwo+IEBAIC0xMzQsNiArMTM2LDE0IEBAIHN0YXRpYyBi
b29sIHNob3VsZF9pcGlfZmx1c2goaW50IGNwdSwgdm9pZCAqaW5mbykKPiAgICAgICAgIH0KPiAg
ICAgICAgIHJhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKCZxdWV1ZS0+bG9jaywgZmxhZ3MpOwo+
Cj4gKyAgICAgICAvKiBFbnN1cmUgdGxiIGZsdXNoIGluZm8gaXMgcXVldWVkIGJlZm9yZSBzZXR0
aW5nIG5lZWRfdGxiX2ZsdXNoIGZsYWcgKi8KPiArICAgICAgIHNtcF93bWIoKTsKPiArCj4gKyAg
ICAgICBwZXJfY3B1KG5lZWRfdGxiX2ZsdXNoLCBjcHUpID0gdHJ1ZTsKPiArCj4gKyAgICAgICAv
KiBQYWlyZWQgd2l0aCBSSVNDVl9GRU5DRSBpbiBzZXRfbW1fYXNpZCgpICovCj4gKyAgICAgICBS
SVNDVl9GRU5DRSh3LCByKTsKPiArCj4gICAgICAgICAvKiBSZWNoZWNrIHdoZXRoZXIgbG9hZGVk
X2FzaWQgY2hhbmdlZCBkdXJpbmcgZW5xdWV1ZWluZyB0YXNrICovCj4gICAgICAgICBpZiAocGVy
X2NwdShsb2FkZWRfYXNpZCwgY3B1KSA9PSBkLT5hc2lkKQo+ICAgICAgICAgICAgICAgICByZXR1
cm4gdHJ1ZTsKPiBAQCAtMTQ2LDYgKzE1Niw5IEBAIHN0YXRpYyB2b2lkIF9faXBpX2ZsdXNoX3Rs
Yl9yYW5nZV9hc2lkKHZvaWQgKmluZm8pCj4gICAgICAgICBzdHJ1Y3QgZmx1c2hfdGxiX3Jhbmdl
X2RhdGEgKmQgPSBpbmZvOwo+Cj4gICAgICAgICBsb2NhbF9mbHVzaF90bGJfcmFuZ2VfYXNpZChk
LT5zdGFydCwgZC0+c2l6ZSwgZC0+c3RyaWRlLCBkLT5hc2lkKTsKPiArCj4gKyAgICAgICBpZiAo
dGhpc19jcHVfcmVhZChuZWVkX3RsYl9mbHVzaCkpCj4gKyAgICAgICAgICAgICAgIGxvY2FsX3Rs
Yl9mbHVzaF9xdWV1ZV9kcmFpbigpOwo+ICB9Cj4KPiAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBs
b25nIGdldF9tbV9hc2lkKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+IEBAIC0yODAsMyArMjkzLDI0
IEBAIHZvaWQgYXJjaF90bGJiYXRjaF9mbHVzaChzdHJ1Y3QgYXJjaF90bGJmbHVzaF91bm1hcF9i
YXRjaCAqYmF0Y2gpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAwLCBGTFVTSF9UTEJfTUFY
X1NJWkUsIFBBR0VfU0laRSk7Cj4gICAgICAgICBjcHVtYXNrX2NsZWFyKCZiYXRjaC0+Y3B1bWFz
ayk7Cj4gIH0KPiArCj4gK3ZvaWQgbG9jYWxfdGxiX2ZsdXNoX3F1ZXVlX2RyYWluKHZvaWQpCj4g
K3sKPiArICAgICAgIHN0cnVjdCB0bGJfZmx1c2hfcXVldWUgKnF1ZXVlID0gdGhpc19jcHVfcHRy
KCZ0bGJfZmx1c2hfcXVldWUpOwo+ICsgICAgICAgc3RydWN0IGZsdXNoX3RsYl9yYW5nZV9kYXRh
ICpkOwo+ICsgICAgICAgdW5zaWduZWQgaW50IGk7Cj4gKwo+ICsgICAgICAgdGhpc19jcHVfd3Jp
dGUobmVlZF90bGJfZmx1c2gsIGZhbHNlKTsKPiArCj4gKyAgICAgICAvKiBFbnN1cmUgY2xlYXJp
bmcgdGhlIG5lZWRfdGxiX2ZsdXNoIGZsYWdzIGJlZm9yZSByZWFsIHRsYiBmbHVzaCAqLwo+ICsg
ICAgICAgc21wX3dtYigpOwo+ICsKPiArICAgICAgIHJhd19zcGluX2xvY2soJnF1ZXVlLT5sb2Nr
KTsKPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBxdWV1ZS0+bGVuOyBpKyspIHsKPiArICAgICAg
ICAgICAgICAgZCA9ICZxdWV1ZS0+dGFza3NbaV07Cj4gKyAgICAgICAgICAgICAgIGxvY2FsX2Zs
dXNoX3RsYl9yYW5nZV9hc2lkKGQtPnN0YXJ0LCBkLT5zaXplLCBkLT5zdHJpZGUsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGQtPmFzaWQpOwpIZXJlLCBkbyB3
ZSBuZWVkIGFuIGFjY3VyYXRlIGZsdXNoIGZvciBhIGRlbGF5IGZsdXNoPwoKPiArICAgICAgIH0K
PiArICAgICAgIHF1ZXVlLT5sZW4gPSAwOwo+ICsgICAgICAgcmF3X3NwaW5fdW5sb2NrKCZxdWV1
ZS0+bG9jayk7Cj4gK30KPiAtLQo+IDIuMjAuMQo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
