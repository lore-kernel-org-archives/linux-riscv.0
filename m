Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FCEEB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 16:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DoIoPOK8GOsT+PaQXHvbLvRluYq/kmNcF+/rumnBxto=; b=QF4d1rZWPFOns8
	4R5t3+EV6wtoSN4KP24hm+EmeLNPTFOdQ12ULe7l0wCYho4QbaPa2aXrT64uMxvIjCVKelw6X7dNm
	XO6NxpBXjkO8Knx/h/pp+iGwXV/j1Mp6v0LThPKTYExPATJPFFAePgvhSkWBsFwBAnFUX1c2ujzJl
	Tk1CE87CReyHELXCayYjVxqAUrB118MnsAK1lJjIQGbOsCVZUw122p2y0F7+grgzuFcpEUoLwJ1qv
	OLAJwlAEUqHe2JevrncqpifFOtg7W9TSKqMuZndPbDpFjXm1CvIoczooWPCcpqSym4nc3+sD96yJa
	KiLe6AZm85I583QKtHZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBI34-008zGu-27;
	Mon, 19 Jun 2023 16:48:14 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBI32-008zFs-06
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 16:48:13 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 62AE449B;
	Mon, 19 Jun 2023 16:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 62AE449B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1687193287; bh=8mEQ2qVV3NQ4ryWzZHEZukEHUKHAb2sehmACRxBJOtA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VL5sJ1X0jkd152hPF9+Ibi6d/g3SjtNhHWIXDYGjhSEs8A3W+4o7Hjw+KkuZlkcCu
	 35G3rTcG76vCRJ9itFN4aVqaVRk/nRrcHGAYBj50dafgxCaEajW2SvX4GvKIOKqb3k
	 GossMbnM+Ht9Jo3ZqqNe4eUZ5a3ZV6vQXT6IYb5IiTSPnzndlV92CfF8Fgjc+UI2kb
	 CqVt4JG6lNzFO5I2SNMP0h47va+q2VR3T/pEoRaU8f2B0BNJatxvdD85iG4wklVxOX
	 EdyOPbuJV3bTmnvk28yRvjCkjq+P4zsAMT8Di0g4n/iTAfTfQW7WMjJGQOopuSyJ5D
	 nVDRiuSzxvfdQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Atish Kumar Patra
 <atishp@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation: riscv: Add early boot document
In-Reply-To: <20230619-sponge-armful-6beeaf4a8624@spud>
References: <20230619094705.51337-1-alexghiti@rivosinc.com>
 <20230619-kerchief-unmixed-cfdbeb1cf242@wendy>
 <CAHVXubjV=0HNyc0-UMAQRQfi4ZUnwH8dmghV-BGogZsJiumtZA@mail.gmail.com>
 <20230619-sponge-armful-6beeaf4a8624@spud>
Date: Mon, 19 Jun 2023 10:48:06 -0600
Message-ID: <87r0q7v1o9.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_094812_077186_2E6B6F28 
X-CRM114-Status: GOOD (  17.14  )
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

Q29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cml0ZXM6Cgo+IE9uIE1vbiwgSnVuIDE5
LCAyMDIzIGF0IDA0OjA0OjUyUE0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4gT24g
TW9uLCBKdW4gMTksIDIwMjMgYXQgMjoyNuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5
QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+PiA+IE9uIE1vbiwgSnVuIDE5LCAyMDIzIGF0IDExOjQ3
OjA0QU0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPgo+PiA+ID4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vcmlzY3YvYm9vdC5yc3QgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L2Jvb3Qu
cnN0Cj4+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiA+ID4gaW5kZXggMDAwMDAwMDAwMDAw
Li5iMDIyMzA4MThiNzkKPj4gPiA+IC0tLSAvZGV2L251bGwKPj4gPiA+ICsrKyBiL0RvY3VtZW50
YXRpb24vcmlzY3YvYm9vdC5yc3QKPj4gPiA+IEBAIC0wLDAgKzEsMTgxIEBACj4+ID4gPiArLi4g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPj4gPiA+ICsKPj4gPiA+ICs9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4gPiA+ICtFYXJseSBib290
IHJlcXVpcmVtZW50cy9jb25zdHJhaW50cyBvbiBSSVNDLVYKPj4gPiA+ICs9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4gPgo+PiA+IFBsZWFzZSB1c2UgInRp
dGxlIGNhc2UiLCBoZXJlIGFuZCBlbHNld2hlcmUgaW4gdGhlIGRvYy4KPj4gCj4+IFlvdSBtZWFu
IHVzaW5nICJ0aXRsZTogIiBpbnN0ZWFkIG9mICI9PT09Ij8gT3IgdXNpbmcgdXBwZXJjYXNlIGZv
ciB0aGUKPj4gZmlyc3QgbGV0dGVyIG9mIGVhY2ggd29yZD8gRllJIEkgZm9sbG93ZWQKPj4gaHR0
cHM6Ly9kb2NzLmtlcm5lbC5vcmcvZG9jLWd1aWRlL3NwaGlueC5odG1sP2hpZ2hsaWdodD10aXRs
ZSNzcGVjaWZpYy1ndWlkZWxpbmVzLWZvci10aGUta2VybmVsLWRvY3VtZW50YXRpb24KPgo+IFRo
ZSBsYXR0ZXIuIFRoYXQncyB3ZWlyZCwgSSBndWVzcyBpdCB3b3VsZCBiZSBuaWNlIHRvIHNlZSB3
aGF0IEpvbgo+IHRoaW5rcyBhYm91dCB0aGF0LgoKSSBoYXZlIE5ldmVyIEJlZW4gRm9uZCBvZiBF
eGNlc3NpdmUgVXNlIG9mIENhcGl0YWwgTGV0dGVycywgc28gbXkKcHJlZmVyZW5jZSB3b3VsZCBi
ZSBjYXBpdGFsaXphdGlvbiBhcyBpbiBhIG5vcm1hbCBzZW50ZW5jZS4KClRoYXQgc2FpZCwgSSBk
b24ndCByZWFsbHkgZmVlbCB0aGF0IHNvbWV0aGluZyBsaWtlIHRoaXMgaXMgaW1wb3J0YW50CmVu
b3VnaCB0aGF0IHdlIG5lZWQgdG8gZGVmaW5lIGFuZCBlbmZvcmNlIGEgcG9saWN5IGFyb3VuZCBp
dC4gIElmIHRoZQptYWludGFpbmVycyBmb3Igc3BlY2lmaWMgc3Vic3lzdGVtcyBmZWVsIGRpZmZl
cmVudGx5LCB0aGVuIEkgZ3Vlc3MKdGhhdCdzIHVwIHRvIHRoZW0uCgpUaGFua3MsCgpqb24KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
