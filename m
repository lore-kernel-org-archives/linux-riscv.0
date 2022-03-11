Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57E2C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Mar 2022 05:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FLlLbZa0R8jcBbAf5QxP1fuEt377/5dfCrNKvP8TTN0=; b=0dZxdL8wQRZPbv
	TSyrZijieUgCQUkgG3IjeS/wdpbbcp+8xvtDsKw1BvI4KuOw4B88dUlWOGJDfnn7QwT4Ue5hSC0sd
	FkQL+p7WpVkDG4GVbANTGnSBf/zNf1SRKAnMWPJ7m4GWTTxMeYxqm2uw1/HkjSiVdQi/y7QlRMgrU
	Mdb+0hQoxrLZ2TclvpeW1Nq57kAynhsi9u+DXyDUjQrpseQ9HzUPvfeyK8l5dN0IKSLu+5Pyaw2NJ
	KGMykiule5Yv7JvSKJtsLHp9WEgubDw0Ef6MPCGDRjd1Y6RwIaeOBWeFwWvyQ9p4X9b04XFgbzrha
	8h+8v69cHDkVLlH9ODdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSXW3-00F7VF-VY; Fri, 11 Mar 2022 05:08:40 +0000
Received: from m228-4.mailgun.net ([159.135.228.4])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSXIJ-00F2BG-TO
 for linux-riscv@lists.infradead.org; Fri, 11 Mar 2022 04:54:30 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=michaelkloos.com;
 q=dns/txt; 
 s=k1; t=1646974467; h=Content-Transfer-Encoding: MIME-Version:
 Content-Type: References: In-Reply-To: Date: Cc: To: To: From: From:
 Subject: Subject: Message-ID: Sender: Sender;
 bh=JOz+7bTl9V5VGYNsQB9j2Hw+GRpuYoU7noklRjo2KqY=;
 b=gnWqjcN6n9i+l4N/EDNYb+ghyBox3lMyx2d0e8c4/FEV2BCGLyCqtVqOMReSGxY5ma+SKFal
 Je3eFwvbC7wCQlreAih30ctivNQ1XdCSfIeUbBg+WAVOEgOx1kCnBgzRL4Wy/n9Qlu12YtCl
 ijw61hHpEcKNdGFOUlj7rmIcFdw=
X-Mailgun-Sending-Ip: 159.135.228.4
X-Mailgun-Sid: WyIxOGJjMSIsICJsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnIiwgIjQ4Y2MwIl0=
Received: from drop1.michaelkloos.com (drop1.michaelkloos.com
 [67.205.190.89]) by smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 622ad602ea5f8dddb5c5d48f (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Fri, 11 Mar 2022 04:54:26 GMT
Received: from qpc.home.michaelkloos.com
 (cpe-173-88-115-50.columbus.res.rr.com [173.88.115.50])
 by drop1.michaelkloos.com (Postfix) with ESMTPSA id 35D70400C2;
 Fri, 11 Mar 2022 04:54:25 +0000 (UTC)
Message-ID: <e880a9421239e388ebce74f3cd41637886930f03.camel@michaelkloos.com>
Subject: Re: [PATCH] riscv: Work to remove kernel dependence on the M-extension
From: "Michael T. Kloos" <michael@michaelkloos.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Christoph Hellwig <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Date: Thu, 10 Mar 2022 23:54:24 -0500
In-Reply-To: <mhng-97bc7422-36da-436a-a326-1705ef6fcace@palmer-ri-x1c9>
References: <mhng-97bc7422-36da-436a-a326-1705ef6fcace@palmer-ri-x1c9>
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_205428_079395_550CD13D 
X-CRM114-Status: GOOD (  32.52  )
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

V2VsbCBhdCBsZWFzdCBJIGNhbiB0YWtlIHNvbWUgc2F0aXNmYWN0aW9uIGluIHRoYXQgaXQgc2Vl
bXMgdGhhdCBvbiBteQoybmQgcGF0Y2ggc2VudCB0byB0aGUgTGludXgga2VybmVsLCBJIGdvdCBp
dCByaWdodCB0aGUgZmlyc3QgdGltZS4gIE5vCm9uZSBoYXMgY29tcGxhaW5lZCBhYm91dCBwcm9i
bGVtcyB3aXRoIHRoZSBjb2RlIGl0c2VsZiwganVzdCB0aGF0IHRoZXkKZG9uJ3Qgd2FudCB0aGUg
ZmVhdHVyZS4gIEkgaGF2ZSBhbHNvIHJlY2VpdmVkIG5vIGVycm9ycyBiYWNrIGZyb20gdGhlCmJ1
aWxkIGJvdC4KCkZvciBub3csIEkgd2lsbCB0cnkgdG8gbWFpbnRhaW4gdGhpcyBwb3J0IG9uIG15
IG93bi4gIFRoYW5rIHlvdSBmb3IgdGhlCmNvbnNpZGVyYXRpb24gUGFsbWVyLgoKCU1pY2hhZWwK
Ck9uIFRodSwgMjAyMi0wMy0xMCBhdCAyMDoyOSAtMDgwMCwgUGFsbWVyIERhYmJlbHQgd3JvdGU6
Cj4gT24gVGh1LCAxMCBNYXIgMjAyMiAwNTozNzoyNyBQU1QgKC0wODAwKSwgTWljaGFlbEBNaWNo
YWVsS2xvb3MuY29tIHdyb3RlOgo+ID4gSXMgdGhlcmUgc29tZXRoaW5nIEkgY2FuIGRvIHRoYXQg
d291bGQgaGVscCBhbGxldmlhdGUgeW91ciBjb25jZXJucyBvcgo+ID4gYXBwcmVoZW5zaW9uPwo+
IAo+IElNTyB0aGlzIGlzIG9uZSBvZiB0aG9zZSBjYXNlcyB3aGVyZSBoYXZpbmcgaGFyZHdhcmUg
aXMgcmVxdWlyZWQuCj4gCj4gSSBjYW4gdW5kZXJzdGFuZCB0aGUgZ29hbCBvZiBwcm92aWRpbmcg
YSBMaW51eCBwb3J0IGZvciB0aGUgbWluaW1hbCAKPiBSSVNDLVYgY29tcGF0aWJsZSBzeXN0ZW0s
IGJ1dCBJSVVDIHRoZSBtaW5pbWFsIFJJU0MtViBjb21wYXRpYmxlIHN5c3RlbSAKPiBpcyBhbnkg
b2JqZWN0IGFzc29jaWF0ZWQgd2l0aCBhIG1lbWJlciBvZiB0aGUgUklTQy1WIGZvdW5kYXRpb24g
dGhhdCAKPiBzYWlkIG1lbWJlciBhdHRlc3RzIGlzIGEgUklTQy1WIHN5c3RlbS4gIFRoZXJlJ3Mg
cmVhbGx5IG5vIHdheSB0byAKPiBpbXBsZW1lbnQgTGludXggb24gYWxsIHN1Y2ggc3lzdGVtcyBz
byB3ZSBoYXZlIHRvIHNldCB0aGUgYmFyIHNvbWV3aGVyZSwgCj4gYW5kIGJhciBpcyBnZW5lcmFs
bHkgc2V0IGF0ICJtb3JlIHRpbWUgd2lsbCBiZSBzcGVudCB1c2luZyB0aGlzIHRoYW4gCj4gbWFp
bnRhaW5pbmcgaXQiLiAgU3lzdGVtcyB3aXRob3V0IE0gaGF2ZSBnZW5lcmFsbHkgbm90IG1ldCB0
aGF0IGJhciwgYW5kIAo+IEkgZG9uJ3Qgc2VlIGFueXRoaW5nIGNoYW5naW5nIG5vdy4KPiAKPiBJ
ZiB5b3UgaGF2ZSB1c2VycyB0aGVuIEknbSBoYXBweSB0byByZWNvbnNpZGVyLCB0aGUgZ29hbCBo
ZXJlIGlzIHRvIG1ha2UgCj4gcmVhbCBzeXN0ZW1zIHdvcmsuICBUaGF0IHNhaWQ6IHdlJ3ZlIGFs
cmVhZHkgZ290IGVub3VnaCB0cm91YmxlIHRyeWluZyAKPiB0byBtYWtlIGFjdHVhbCBzaGlwcGlu
ZyBoYXJkd2FyZSBmdW5jdGlvbiBjb3JyZWN0bHksIHdlJ3JlIGFsbCBnb2luZyB0byAKPiBsb3Nl
IG91ciBtaW5kcyB0cnlpbmcgdG8gY2hhc2UgYXJvdW5kIGV2ZXJ5dGhpbmcgdGhhdCBjb3VsZCBp
biB0aGVvcnkgYmUgCj4gYSBSSVNDLVYgc3lzdGVtIGJ1dCBkb2Vzbid0IGFjdHVhbGx5IGV4aXN0
Lgo+IAo+ID4gCj4gPiBPbiAzLzEwLzIwMjIgODoyMiBBTSwgTWljaGFlbCBULiBLbG9vcyB3cm90
ZToKPiA+IAo+ID4gPiBTb21lIG90aGVyIHRob3VnaHRzOgo+ID4gPiBJdCBzb3VuZHMgbGlrZSBJ
IGFtIG5vdCB0aGUgZmlyc3QgcGVyc29uIHRvIHdhbnQgdGhpcyBmZWF0dXJlIGFuZCBJCj4gPiA+
IHByb2JhYmx5IHdvbid0IGJlIHRoZSBsYXN0LsKgIEkgY3JlYXRlZCB0aGUgY2hhbmdlIGZvciBt
eSBvd24gcmVhc29ucywgdGhlCj4gPiA+IHNhbWUgYXMgYW55IG90aGVyIGNvbnRyaWJ1dG9yLsKg
IEkgdGhpbmsgd2UgYWxsIGtub3cgdGhhdCBJIGNhbiBub3QgcHVsbAo+ID4gPiBvdXQgc29tZSBj
aGFydCBhbmQgc2F5LCAiVGhpcyBtYW55IHBlb3BsZSB3YW50IHRoaXMgYW5kIGhlcmUgaXMgd2h5
LiLCoCBJCj4gPiA+IGxpdmUgaW4gY2VudHJhbCBPaGlvIGFuZCBoYXZlIGJlZW4gZG9pbmcgdGhp
cyBhcyBhIGhvYmJ5LsKgIEkgZG9uJ3QgZXZlbgo+ID4gPiBrbm93IGFueW9uZSBlbHNlIHdobyBr
bm93cyBhYm91dCBzeXN0ZW1zIGFuZCBvcGVyYXRpbmcgc3lzdGVtIGRldmVsb3BtZW50Lgo+ID4g
PiBJZiB0aGUganVzdGlmaWNhdGlvbiB0aGF0IHlvdSBhcmUgbG9va2luZyBmb3IgaXMgdGhhdCBJ
IGFzIHNvbWUKPiA+ID4gaHlwb3RoZXRpY2FsIGRldmVsb3BlciBhdCBhIG1ham9yIHRlY2ggY29t
cGFueSBpcyBhYm91dCB0byByZWxlYXNlIGEgbmV3Cj4gPiA+IFJJU0MtViBjaGlwIHdpdGhvdXQg
TSBzdXBwb3J0IGJ1dCB3ZSB3YW50IGl0IHRvIHJ1biBMaW51eCwgSSBjYW4gbm90Cj4gPiA+IHBy
b3ZpZGUgdGhhdCBhbnN3ZXIuwqAgSXQgc291bmRzIGEgYml0IGxpa2Ugc29tZSBzb2Z0d2FyZSBv
ciBoYXJkd2FyZSwKPiA+ID4gY2hpY2tlbiBvciB0aGUgZWdnIGFueXdheS7CoCBUcnlpbmcgdG8g
bWFpbnRhaW4gbXkgb3duIGZvcmsgaWYgcGVvcGxlCj4gPiA+IHN0YXJ0IGNvbnRyaWJ1dGluZyBw
YXRjaGVzIHdpdGggaW5jb21wYXRpYmxlIGFzc2VtYmx5IHNjYXJlcyBtZS4KPiA+ID4gIMKgwqDC
oMKgTWljaGFlbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
