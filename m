Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF5DEB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 20:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/vucw8vVKxcoxJ1k2PiaqcfTF/+MN9MLB5pduRGbr78=; b=00rASEZ9jUb/jZ
	kKbDTRi9otByl3aYLJ7IEHxMy6UxPjg7CCJp+OGyW5E/R+so+GJsBMm8cieTRfN9AmXuWGyTtaAFX
	9NidOXZqXMCj77c/7zXqM0/lzB4lz7tSCiRg7jkRfKuxiPTf5cZeNQ/uhkIJoATPEE1dQ2oUeFe/k
	P6AnxJ57B8dIt91sANRdi1un5eUOPvMwYAfbUwUnBbdRopH2pcw64mGNXwx5sDapxmqWEHMUzIWHe
	ZyqGND16PC8Tig8q1np89NErJmNqsJFL+9cNMOxsUwdxpMsXZT6j1etCwnrYTifms/QgiCY2Og25x
	bCaXGo2cK9/x/n8k4Txg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCR27-001fTE-0d;
	Thu, 22 Jun 2023 20:35:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCR24-001fSF-2E
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 20:35:58 +0000
Received: from i53875bdf.versanet.de ([83.135.91.223] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qCR1z-00020C-4S; Thu, 22 Jun 2023 22:35:51 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, Stefan O'Rear <sorear@fastmail.com>
Cc: linux-riscv@lists.infradead.org, samuel@sholland.org, guoren@kernel.org,
 christoph.muellner@vrull.eu, conor.dooley@microchip.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] RISC-V: add T-Head vector errata handling
Date: Thu, 22 Jun 2023 22:35:50 +0200
Message-ID: <9132027.CDJkKcVGEf@diego>
In-Reply-To: <23381fc8-c297-46ed-9e11-a2643e18e4c9@app.fastmail.com>
References: <20230228215435.3366914-1-heiko@sntech.de> <1941316.PYKUYFuaPT@diego>
 <23381fc8-c297-46ed-9e11-a2643e18e4c9@app.fastmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_133556_729317_FFE207B9 
X-CRM114-Status: GOOD (  19.85  )
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

SGkgU3RlZmFuLAoKQW0gRG9ubmVyc3RhZywgMjIuIEp1bmkgMjAyMywgMjA6NTg6MzcgQ0VTVCBz
Y2hyaWViIFN0ZWZhbiBPJ1JlYXI6Cj4gT24gVGh1LCBKdW4gMjIsIDIwMjMsIGF0IDE6MzkgUE0s
IEhlaWtvIFN0w7xibmVyIHdyb3RlOgo+ID4gQW0gRGllbnN0YWcsIDEzLiBKdW5pIDIwMjMsIDA4
OjM1OjUzIENFU1Qgc2NocmllYiBTdGVmYW4gTydSZWFyOgo+ID4+IHZ4cm0gYW5kIHZ4c2F0IGFy
ZSBwYXJ0IG9mIGZjc3IgaW4gMC43LjEsIHNvIHRoZXkgc2hvdWxkIGFscmVhZHkgaGF2ZSBiZWVu
Cj4gPj4gaGFuZGxlZCBieSBfX2ZzdGF0ZV9zYXZlIGFuZCBfX2ZzdGF0ZV9yZXN0b3JlLCBhbmQg
dGhpcyBjb2RlIGlzIGxpa2VseSB0bwo+ID4+IG1pc2JlaGF2ZSAoc2F2aW5nIHRoZSBuZXcgcHJv
Y2VzcydzIHZ4cm0vdnhzYXQgaW4gdGhlIG9sZCBwcm9jZXNzJ3Mgc2F2ZSBhcmVhCj4gPj4gYmVj
YXVzZSBmbG9hdCBzdGF0ZSBpcyBzd2FwcGVkIGJlZm9yZSB2ZWN0b3Igc3RhdGUgaW4gX19zd2l0
Y2hfdG8pLgo+ID4KPiA+IEknbSBub3Qgc3VyZSBJIGZvbGxvdyB5b3VyIGRlc2NyaXB0aW9uIGJ1
dCBtYXkgYmUgb3Zlcmxvb2tpbmcgb3IgaGF2ZQo+ID4gbWlzdW5kZXJzdG9vZCBzb21ldGhpbmcu
Cj4gPgo+ID4gU29tZWhvdyBJIHdheSB0byBvZnRlbiBoYXZlIHRyb3VibGUgcmVzb2x2aW5nIENT
UiBhZGRyZXNzZXMsIGJ1dCBhY2NvcmRpbmcKPiA+IHRvIG9wZW5TQkksIEZDU1IgaGFzIHRoZSBs
b2NhdGlvbiBvZiAweDMKPiA+ICgjZGVmaW5lIENTUl9GQ1NSIDB4MDAzIGluIGluY2x1ZGUvc2Jp
L3Jpc2N2X2VuY29kaW5nLmgpCj4gPgo+ID4gd2hlcmUgQ1NSX1ZYU0FUIGFuZCBDU1JfVlhSTSBh
cmUgYXQgMHg5IGFuZCAweGEgcmVzcGVjdGl2ZWx5Lgo+ID4gKCNkZWZpbmUgQ1NSX1ZYU0FUIDB4
OSBhbmQgICNkZWZpbmUgQ1NSX1ZYUk0gMHhhKQo+ID4KPiA+Cj4gPiBBbmQgbG9va2luZyBhdCBf
X2ZzdGF0ZV9zYXZlICsgX19mc3RhdGVfcmVzdG9yZSB0aGUgb25seSBDU1JzIGFjY2Vzc2VkIHNl
ZW0KPiA+IHRvIGJlIENTUl9TVEFUVVMgYW5kIEZDU1IgaXRzZWxmLgo+ID4KPiA+IEkgZGVmaW5p
dGx5IHdvbid0IGNsYWltIHRvIGJlIHJpZ2h0LCBidXQgZG9uJ3Qgc2VlIHRoZSBpc3N1ZSB5ZXQu
Cj4gPgo+ID4KPiA+IFRoYW5rcyBmb3IgYSBoaW50Cj4gPiBIZWlrbwo+IAo+IEFyZSB5b3UgYXdh
cmUgb2YgIjMuNy4gVmVjdG9yIEZpeGVkLVBvaW50IEZpZWxkcyBpbiBmY3NyIiBpbgo+IHJpc2N2
LXYtc3BlYy0wLjcuMS5wZGY/CgpvaCB3b3csIHRoYW5rcyBhIGxvdCBmb3IgdGhhdCBwb2ludGVy
LCBub3cgSSB1bmRlcnN0YW5kIHlvdXIgY29uY2Vybi4KClNvIGluIHZlY3Rvci0wLjcuMSBmY3Ny
WzEwOjldIG1pcnJvcnMgdnhybSBhbmQgZmNzcls4XSBtaXJyb3JzIHZ4c2F0LgoKCk9uIGEgcG9z
aXRpdmUgbm90ZSwgdGhlIFQtSGVhZCBjb3JlcyBzZWVtIHRvIG5vdCBpbXBsZW1lbnQgdGhlIGZ1
bGwKdmVjdG9yIDAuNy4xIHNwZWNpZmljYXRpb24gYWZ0ZXIgYWxsLCBpbiB0aGUgZG9jdW1lbnRh
dGlvbiBJIGhhdmUgWzBdCmZjc3JbMzE6OF0gYXJlIGRlY2xhcmVkIGFzICIwIiBhbmQgdXBwZXJt
b3N0IGJpdHMgYXJlIFs3OjVdIGZvciB0aGUgImZybSIKZmllbGQuCgpTbyBJIGd1ZXNzIGEgY29k
ZSBjb21tZW50IHNob3VsZCBzdWZmaWNlIHRvIGV4cGxhaW4gOi0pCgoKUmVnYXJkcwpIZWlrbwoK
ClswXSBodHRwczovL2dpdGh1Yi5jb20vVC1oZWFkLVNlbWkvb3BlbmM5MDYvYmxvYi9tYWluL2Rv
Yy8lRTclOEUlODQlRTklOTMlODFDOTA2JUU3JTk0JUE4JUU2JTg4JUI3JUU2JTg5JThCJUU1JTg2
JThDLnBkZgoxNi4zLjEuMyDmta7ngrnmjqfliLbnirbmgIHlr4TlrZjlmajvvIhGQ1NS77yJIG9u
IHBhZ2UgMzM0CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
