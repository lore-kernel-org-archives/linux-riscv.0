Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CD0C19776
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5/d4ZaPgYN3Bqji0o+7fRiAQkw15HjZEWR4cLuUUILM=; b=ndJ9FnaWyoVYu2
	1baH9SA/UBPh3IPXEoGXJHIr9erNA674HvxbiH/rRLkiNhvAzUSErQMmhZfnqJZ2Xyi9X8mqjm8HM
	A2oFSbXnFsI7zYhZUaWAZSJrwSuNLRq8wCSCWRDeN8d01tpoHwmNgP3wpZci6X7sFbu5FSnyeS9BL
	KpXJBdMiw9oW36HsQpVlEfOKyE47xs3Hso+nLTmJD8amwMyTQvdWP76UKm4HPce9J4EDrN1nV7VYF
	pjI2aULk17CEZnsRYUc1n6iGvpzMomSeFP5shkWzz1hTTau/RcYyYyIOEuS4kr+ZISemPxNONrE0q
	mp3UwqYJUq/eS9GdmJOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxNJ-0000000AXPB-1X56;
	Fri, 28 Feb 2025 10:13:45 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxKg-0000000AWed-42JY
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 10:11:06 +0000
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id EEAAD343132;
	Fri, 28 Feb 2025 10:10:54 +0000 (UTC)
Date: Fri, 28 Feb 2025 10:10:50 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] gpiolib: support parsing gpio three-cell interrupts
 scheme
Message-ID: <20250228101050-GYA52883@gentoo>
References: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
 <20250227-04-gpio-irq-threecell-v1-2-4ae4d91baadc@gentoo.org>
 <CACRpkdZ1X5kF-AyRBg9BYMiJscv0v-SGzcdetS0XDK3oPSu9QQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZ1X5kF-AyRBg9BYMiJscv0v-SGzcdetS0XDK3oPSu9QQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_021103_033241_E5CE21E3 
X-CRM114-Status: GOOD (  25.07  )
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

SGkgTGludXMgV2FsbGVpajoKCk9uIDEwOjExIEZyaSAyOCBGZWIgICAgICwgTGludXMgV2FsbGVp
aiB3cm90ZToKPiBIaSBZaXh1biwKPiAKPiB0aGFua3MgZm9yIHdvcmtpbmcgc28gaGFyZCBvbiB0
aGlzIQo+IAo+IEknbSByZWFsbHkgaGFwcHkgdG8gc2VlIHRoZSB0aHJlZWNlbGwgc3VwcG9ydCBp
bnRlZ3JhdGVkIGludG8gZ3Bpb2xpYi4KPiAKPiBPbiBUaHUsIEZlYiAyNywgMjAyNSBhdCAxMjoy
NeKAr1BNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28ub3JnPiB3cm90ZToKPiAKPiA+IGdwaW8gaXJx
IHdoaWNoIHVzaW5nIHRocmVlLWNlbGwgc2NoZW1lIHNob3VsZCBhbHdheXMgY2FsbAo+ID4gaW5z
dGFuY2VfbWF0Y2goKSBmdW5jdGlvbiB0byBmaW5kIHRoZSBjb3JyZWN0IGlycWRvbWFpbi4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZaXh1biBMYW4gPGRsYW5AZ2VudG9vLm9yZz4KPiA+IC0tLQo+
ID4gVGhlIHNlbGVjdCgpIGZ1bmN0aW9uIHdpbGwgYmUgY2FsbGVkIHdpdGggIURPTUFJTl9CVVNf
QU5ZLAo+ID4ga2VybmVsL2lycS9pcnFkb21haW4uYzo1NTY6IGlmIChoLT5vcHMtPnNlbGVjdCAm
JiBidXNfdG9rZW4gIT0gRE9NQUlOX0JVU19BTlkpCj4gPgo+ID4gc28gdmVuZG9yIGdwaW8gZHJp
dmVyIG5lZWQgdG8gZXhwbGljaXRseSBzZXQgYnVzX3Rva2VuLCBzb21ldGhpbmcgbGlrZToKPiA+
Cj4gPiBkcml2ZXJzL2dwaW8vZ3Bpby1zcGFjZW1pdC1rMS5jCj4gPiAgIGlycV9kb21haW5fdXBk
YXRlX2J1c190b2tlbihnaXJxLT5kb21haW4sIERPTUFJTl9CVVNfV0lSRUQpOwo+ID4KPiA+IEkg
aG9wZSB0aGlzIGlzIGEgZmVhc2libGUgd2F5Li4KPiAKPiBZZXMgdGhpcyBsb29rcyBmYWlyLCBJ
IHRoaW5rIHlvdSBjYW4gcHV0IHRoZSBkZXNjcmlwdGlvbiBpbnRvIHRoZQo+IGNvbW1pdCBtZXNz
YWdlLgo+IApvaywgd2lsbCBkbwo+ID4gICAgICAgICAvKiBXZSBzdXBwb3J0IHN0YW5kYXJkIERU
IHRyYW5zbGF0aW9uICovCj4gPiAtICAgICAgIGlmIChpc19vZl9ub2RlKGZ3c3BlYy0+Zndub2Rl
KSAmJiBmd3NwZWMtPnBhcmFtX2NvdW50ID09IDIpIHsKPiA+ICsgICAgICAgaWYgKGlzX29mX25v
ZGUoZndzcGVjLT5md25vZGUpICYmIGZ3c3BlYy0+cGFyYW1fY291bnQgPD0gMykKPiA+ICAgICAg
ICAgICAgICAgICByZXR1cm4gaXJxX2RvbWFpbl90cmFuc2xhdGVfdHdvY2VsbChkLCBmd3NwZWMs
IGh3aXJxLCB0eXBlKTsKPiA+IC0gICAgICAgfQo+IAo+IFRoaXMgbG9va3MgZ29vZC4KPiAKPiA+
ICtzdGF0aWMgaW50IGdwaW9jaGlwX2lycV9zZWxlY3Qoc3RydWN0IGlycV9kb21haW4gKmQsIHN0
cnVjdCBpcnFfZndzcGVjICpmd3NwZWMsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBlbnVt
IGlycV9kb21haW5fYnVzX3Rva2VuIGJ1c190b2tlbikKPiA+ICt7Cj4gPiArICAgICAgIHN0cnVj
dCBmd25vZGVfaGFuZGxlICpmd25vZGUgPSBmd3NwZWMtPmZ3bm9kZTsKPiA+ICsgICAgICAgc3Ry
dWN0IGdwaW9fY2hpcCAqZ2MgPSBkLT5ob3N0X2RhdGE7Cj4gPiArICAgICAgIHVuc2lnbmVkIGlu
dCBpbmRleCA9IGZ3c3BlYy0+cGFyYW1bMF07Cj4gPiArCj4gPiArICAgICAgIGlmICgoZ2MtPm9m
X2dwaW9fbl9jZWxscyA9PSAzKSAmJiBnYy0+b2Zfbm9kZV9pbnN0YW5jZV9tYXRjaCkKPiA+ICsg
ICAgICAgICAgICAgICByZXR1cm4gZ2MtPm9mX25vZGVfaW5zdGFuY2VfbWF0Y2goZ2MsIGluZGV4
KTsKPiAKPiBXZSBuZWVkIHRvIGhpZGUgdGhlIE9GLXNwZWNpZmljIHRoaW5ncyBpbnRvIGdwaW9s
aWItb2YuY3xoIHNvIHN5c3RlbXMKPiBub3QgdXNpbmcgT0YgZG9lcyBub3QgbmVlZCB0byBzZWUg
aXQuCj4gCj4gU29tZXRoaW5nIGxpa2U6Cj4gCj4gaWYgKGZ3c3BlYy0+cGFyYW1fY291bnQgPT0g
Mykgewo+ICAgICAgaWYgKGlzX29mX25vZGUoZndub2RlKSkKPiAgICAgICAgICByZXR1cm4gb2Zf
Z3Bpb2NoaXBfaW5zdGFuY2VfbWF0Y2goZ2MsIGluZGV4KTsKPiAgICAgLyogQWRkIG90aGVyIHRo
cmVlcGFyYW0gaGFuZGxlcnMgaGVyZSAqLwpub3Qgc3VyZSBpZiBub24gT0Ytc3BlY2lmaWMgZHJp
dmVyIHdpbGwgYWxzbyBzdXBwb3J0IHRocmVlY2VsbHMgbW9kZT8Kd2UgcHJvYmFibHkgY2FuIGFk
anVzdCB3aGVuIGl0IHJlYWxseSBkb2VzLCBzbyBub3cgSSB3b3VsZCBzaW1wbHkgbWFrZSBpdAoK
aWYgKGZ3c3BlYy0+cGFyYW1fY291bnQgPT0gMyAmJiBpc19vZl9ub2RlKGZ3bm9kZSkpCglyZXR1
cm4gb2ZfZ3Bpb2NoaXBfaW5zdGFuY2VfbWF0Y2goZ2MsIGluZGV4KTsKCj4gfQo+IAo+IFRoZW4g
YWRkIG9mX2dwaW9jaGlwX2luc3RhbmNlX21hdGNoKCkgaW50byBncGlvbGliLW9mLmggYXMgYQo+
IHN0YXRpYyBpbmxpbmUgKG5vIG5lZWQgdG8gYW4gZW50aXJlIGV4dGVybiBmdW5jdGlvbi4uLikK
PiAKPiBzdGF0aWMgaW5saW5lIGJvb2wgb2ZfZ3Bpb2NoaXBfaW5zdGFuY2VfbWF0Y2goc3RydWN0
IGdwaW9fY2hpcCAqZ2MsIGludCBpbmRleCkKPiB7Cj4gICAgIGlmICgoZ2MtPm9mX2dwaW9fbl9j
ZWxscyA9PSAzKSAmJiBnYy0+b2Zfbm9kZV9pbnN0YW5jZV9tYXRjaCkKPiAgICAgICAgICAgICAg
IHJldHVybiBnYy0+b2Zfbm9kZV9pbnN0YW5jZV9tYXRjaChnYywgaW5kZXgpOwo+IH0KPiAKPiBB
bmQgYWxzbyBhbiBlbXB0eSBzdHViIGZvciAhQ09ORklHX09GX0dQSU8gc28gd2UgZ2V0IHRoaXMg
Y29tcGlsZWQKPiBvdXQgaWYgT0YgaXMgbm90IGNvbmZpZ3VyZWQgaW4uCj4gCm9rLCBJIGdvdCB5
b3VyIGlkZWEsIHRoYW5rcwoKLS0gCllpeHVuIExhbiAoZGxhbikKR2VudG9vIExpbnV4IERldmVs
b3BlcgpHUEcgS2V5IElEIEFBQkVGRDU1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
