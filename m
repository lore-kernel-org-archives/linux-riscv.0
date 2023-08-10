Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C2BC001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 11:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/r7rADMEk5BnT/9OXA0MfPymxz7L4JAnqC6ZbEhNty4=; b=MOtm42qUsPupjg
	RXxwxM0BaKeIQxXwvZrJ9fRvLaqx1ftm+/NZol/IPrI+4LM43mqz3PlqHaKl79+xc9VWB6H4H/gM/
	Y7xuMJd+JNIxdAxNPbnM94zTZAO1s9my2Tg5aBLbCu1zMNH/9GiqUkA/t8tUByDEwTrjLvCpABips
	k80XNyNB7jN9O4tmgB84XJW0B3Q5bRh3OU/9iUV8ArJxGn1vkjqmmZYMWttI+vyeC86NZ0LoTYmt4
	HnFabc1mkzbHeSXrrGUY/lMgOXlHRjSL4SciuP7NxpJTNE1BZr0BzIgXsNbpRMSoN1DAcm2CsBgGN
	TISQVY7gSRYLodU47xww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU3Xj-007LR9-1E;
	Thu, 10 Aug 2023 11:09:27 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU3Xf-007LQM-2a
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 11:09:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1051FF808;
	Thu, 10 Aug 2023 11:09:17 +0000 (UTC)
Message-ID: <c16d0b21-6daf-997d-b9c1-0e25b5ddb534@ghiti.fr>
Date: Thu, 10 Aug 2023 13:09:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: potential riscv special bug maybe found
Content-Language: en-US
To: Aurelien Jarno <aurelien@aurel32.net>, linux-riscv@lists.infradead.org
Cc: Bo YU <tsu.yubo@gmail.com>, Andreas Gruenbacher <agruenba@redhat.com>
References: <20230309151841.bomov6hq3ybyp42a@debian>
 <ZNOnCakhwIeue3yr@aurel32.net>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <ZNOnCakhwIeue3yr@aurel32.net>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_040923_996343_7B34B59F 
X-CRM114-Status: GOOD (  20.06  )
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

SGkgQXVyw6lsaWVuLCBCbywKCgpPbiAwOS8wOC8yMDIzIDE2OjQ3LCBBdXJlbGllbiBKYXJubyB3
cm90ZToKPiBIaSwKPgo+IE9uIDIwMjMtMDMtMDkgMjM6MTgsIEJvIFlVIHdyb3RlOgo+PiBIaSwK
Pj4KPj4gSSBhbSBzb3JyeSBpZiB0aGlzIGlzIG5vaXNlLgo+Pgo+PiBTb21lIGRheXMgYWdvIEkg
bm90aWNlZCBzdHJhY2UgNi4yIHdhcyBidWlsdCBmYWlsZWQgb24gcmlzY3Y2NCBkdWUgdG8KPj4g
dGVzdCBjYXNlc1swXS4gVGhlcmUgaXMgb25lIHByb2dyYW0gZnJvbSBzdHJhY2UgY2FuIHJlcHJv
ZHVjZSBpdDoKPj4KPj4gYGBgCj4+IC4vdGVzdHMvcmVhZC13cml0ZSBgYGAKPj4KPj4gSXQgd2ls
bCBiZSBoYW5nLgo+Pgo+PiBJbiBmYWN0LCB0aGUgaXNzdWUgaGFzIGV4aXN0ZWQgc2luY2UgNS4x
OC4gSSBgZ2l0IGJpc2VjdGAgYW5kIGZpbmFsbHkKPj4gZm91bmQgb3V0IHRoZSBpc3N1ZSB3YXMg
aW50cm9kdWNlZCBieSB0aGUgY29tbWl0WzFdOgo+Pgo+PiBjb21taXQgNjMxZjg3MWYwNzE3NDY3
ODllOTI0MmU1MTRhYjBmNDkwNjdmYTk3YQo+PiBBdXRob3I6IEFuZHJlYXMgR3J1ZW5iYWNoZXIg
PGFncnVlbmJhQHJlZGhhdC5jb20+Cj4+IERhdGU6ICAgVHVlIE5vdiA5IDEyOjU2OjA2IDIwMjEg
KzAxMDAKPj4KPj4gICAgICBmcy9pb21hcDogRml4IGJ1ZmZlcmVkIHdyaXRlIHBhZ2UgcHJlZmF1
bHRpbmcKPj4KPj4gSSBkbyBub3QgdGhpbmsgdGhlcmUgaXMgYSBwcm9ibGVtIHdpdGggdGhpcyBj
b21taXQsIGJlY2F1c2UgaXQgZG9lcyBub3QKPj4gYWZmZWN0IG90aGVycyBhcmNoIGV4cGVjdCBy
aXNjdiBhbmQgYWZ0ZXIgSSByZXZlcnRlZCBpdCwgaXQgd2lsbCBwYXNzCj4+IGFsbCB0ZXN0IGNh
c2VzIGZyb20gc3RyYWNlKFRoZXJlIGlzIHN0aWxsIG9uZSBjYXNlIGZhaWxlZCBvbiBxZW11LCBi
dXQKPj4gdGhpcyBpcyBhbm90aGVyIHN0b3JlKS4KPj4KPj4gSSB0cnkgdG8gZGVidWcgc29tZXRo
aW5nIGJ1dCBmYWlsZWQuCj4+IFdvdWxkIGJlIGFwcHJlY2lhdGVkIGl0IGFueSBoZWxwLgo+IFBs
ZWFzZSBmaW5kIGF0dGFjaGVkIGEgc2ltcGxlciByZXByb2R1Y2VyIGV4dHJhY3RlZCBmcm9tIHN0
cmFjZSwgd2hpY2gKPiBzaG91bGQgbWFrZSB0aGUgaXNzdWUgZWFzaWVyIHRvIHJlcHJvZHVjZS4g
SXQgaGFuZ3Mgb24gcmlzY3Y2NCBhbmQgbmVlZHMKPiB0byBiZSBraWxsZWQgd2l0aCAtOSwgd2hp
bGUgaXQgd29ya3MgZmluZSBvbiBhbWQ2NC4KCgpUaGFua3MgZm9yIHRoZSByZXByb2R1Y2VyLCBJ
IHdhcyBhYmxlIHRvIHJlcHJvZHVjZSB0aGUgcHJvYmxlbTogdGhlIAprZXJuZWwgaXMgc3R1Y2sg
dHJ5aW5nIHRvIGNvcHkgZGF0YSBmcm9tIHVzZXIsIEknbSBsb29raW5nIGludG8gaXQgcmlnaHQg
Cm5vdyBhcyB0aGlzIHNlZW1zIHZlcnkgd2VpcmQuIE5vdGUgdGhhdCBJIHdpbGwgYmUgb24gdmFj
YXRpb24gYXQgdGhlIGVuZCAKb2YgdGhlIHdlZWssIGlmIEkgZG9uJ3QgaGF2ZSB0aW1lIHRvIGZp
eCB0aGlzLCBJJ2xsIHBvc3QgbXkgZmluZGluZ3MgaGVyZS4KCgpUaGFua3MgYWdhaW4sCgpBbGV4
CgoKPiBSZWdhcmRzCj4gQXVyZWxpZW4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
