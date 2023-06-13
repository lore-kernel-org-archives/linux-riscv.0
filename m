Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB20CEB64D0
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 18:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IhBR64004aWBl0rWTBzjysf9yxrqzeDPGtQB7agZPiI=; b=Kzp+nvkwXJJgJc
	xP7BG1OvkB/DLh5HT2qGOnwLM0QPNjc0HaN9zaPzlhuzWQNgAIPfEaW5D9Z+/jXCx0ohWAceJEmx+
	+HqjPJf33E9a7PpS3I89UOOiP5ULh2+J2CXN/NwtCrgGST8ex2bdHFMZzQmz8Kr3iBlhp6BiYQCsK
	spZ20+jGvnykurCs6F0WpiJF5bhM6wt4rBr/ysd1s84nuwz/K0mEP6VXzdsm7tk/wO64WAnzRMFpv
	GQhlcKLrihNUmaKlHohiNXWgrTneusQqjDn5A9+eO4mLUJtcwAYl8ssQQt77BhNLLBi6TEgrNvhqt
	1NeOyWvD6g2jYaYQizZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q99C2-008uEy-0l;
	Tue, 13 Jun 2023 18:56:38 +0000
Received: from out-37.mta1.migadu.com ([95.215.58.37])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q99Bt-008uBA-35
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 18:56:36 +0000
Date: Tue, 13 Jun 2023 14:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1686682581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cI/+VKexODe7tgazUH0uBbszHN+Sh5VjQJKMcYicSKU=;
	b=UteSpuaAfbQ2NCJDHT0DaE6LH+0KCxqxliA1u1CiHpYLEp/BHx0yHT4z2wyOm1k0K155IH
	1TdtqXMsJtk9bqAzUZ31aQXTksL2s2n1Q4RGfHebraQUDr3MhWO8yy+4wsaox2mGxQ3YRe
	XgmITo5ci4OCni1zywcC85bIuHv1vdI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Mike Rapoport <rppt@kernel.org>
Cc: Song Liu <song@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Russell King <linux@armlinux.org.uk>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, netdev@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 00/13] mm: jit/text allocator
Message-ID: <ZIi7zmey0w61EG25@moria.home.lan>
References: <20230601101257.530867-1-rppt@kernel.org>
 <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan>
 <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
 <20230605092040.GB3460@kernel.org>
 <ZH20XkD74prrdN4u@FVFF77S0Q05N>
 <CAPhsuW7ntn_HpVWdGK_hYVd3zsPEFToBNfmtt0m6K8SwfxJ66Q@mail.gmail.com>
 <20230608184116.GJ52412@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230608184116.GJ52412@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_115631_111287_21142DA5 
X-CRM114-Status: GOOD (  23.87  )
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

T24gVGh1LCBKdW4gMDgsIDIwMjMgYXQgMDk6NDE6MTZQTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBPbiBUdWUsIEp1biAwNiwgMjAyMyBhdCAxMToyMTo1OUFNIC0wNzAwLCBTb25nIExp
dSB3cm90ZToKPiA+IE9uIE1vbiwgSnVuIDUsIDIwMjMgYXQgMzowOeKAr0FNIE1hcmsgUnV0bGFu
ZCA8bWFyay5ydXRsYW5kQGFybS5jb20+IHdyb3RlOgo+ID4gCj4gPiBbLi4uXQo+ID4gCj4gPiA+
ID4gPiA+IENhbiB5b3UgZ2l2ZSBtb3JlIGRldGFpbCBvbiB3aGF0IHBhcmFtZXRlcnMgeW91IG5l
ZWQ/IElmIHRoZSBvbmx5IGV4dHJhCj4gPiA+ID4gPiA+IHBhcmFtZXRlciBpcyBqdXN0ICJkb2Vz
IHRoaXMgYWxsb2NhdGlvbiBuZWVkIHRvIGxpdmUgY2xvc2UgdG8ga2VybmVsCj4gPiA+ID4gPiA+
IHRleHQiLCB0aGF0J3Mgbm90IHRoYXQgYmlnIG9mIGEgZGVhbC4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBNeSB0aGlua2luZyB3YXMgdGhhdCB3ZSBhdCBsZWFzdCBuZWVkIHRoZSBzdGFydCArIGVuZCBm
b3IgZWFjaCBjYWxsZXIuIFRoYXQKPiA+ID4gPiA+IG1pZ2h0IGJlIGl0LCB0YmguCj4gPiA+ID4K
PiA+ID4gPiBEbyB5b3UgbWVhbiB0aGF0IG1vZHVsZXMgd2lsbCBoYXZlIHNvbWV0aGluZyBsaWtl
Cj4gPiA+ID4KPiA+ID4gPiAgICAgICBqaXRfdGV4dF9hbGxvYyhzaXplLCBNT0RVTEVTX1NUQVJU
LCBNT0RVTEVTX0VORCk7Cj4gPiA+ID4KPiA+ID4gPiBhbmQga3Byb2JlcyB3aWxsIGhhdmUKPiA+
ID4gPgo+ID4gPiA+ICAgICAgIGppdF90ZXh0X2FsbG9jKHNpemUsIEtQUk9CRVNfU1RBUlQsIEtQ
Uk9CRVNfRU5EKTsKPiA+ID4gPiA/Cj4gPiA+Cj4gPiA+IFllcy4KPiA+IAo+ID4gSG93IGFib3V0
IHdlIHN0YXJ0IHdpdGggdHdvIEFQSXM6Cj4gPiAgICAgIGppdF90ZXh0X2FsbG9jKHNpemUpOwo+
ID4gICAgICBqaXRfdGV4dF9hbGxvY19yYW5nZShzaXplLCBzdGFydCwgZW5kKTsKPiA+IAo+ID4g
QUZBSUNULCBhcm02NCBpcyB0aGUgb25seSBhcmNoIHRoYXQgcmVxdWlyZXMgdGhlIGxhdHRlciBB
UEkuIEFuZCBUQkgsIEkgYW0KPiA+IG5vdCBxdWl0ZSBjb252aW5jZWQgaXQgaXMgbmVlZGVkLgo+
ICAKPiBSaWdodCBub3cgYXJtNjQgYW5kIHJpc2N2IG92ZXJyaWRlIGJwZiBhbmQga3Byb2JlcyBh
bGxvY2F0aW9ucyB0byB1c2UgdGhlCj4gZW50aXJlIHZtYWxsb2MgYWRkcmVzcyBzcGFjZSwgYnV0
IGhhdmluZyB0aGUgYWJpbGl0eSB0byBhbGxvY2F0ZSBnZW5lcmF0ZWQKPiBjb2RlIG91dHNpZGUg
b2YgbW9kdWxlcyBhcmVhIG1heSBiZSB1c2VmdWwgZm9yIG90aGVyIGFyY2hpdGVjdHVyZXMuCj4g
Cj4gU3RpbGwgdGhlIHN0YXJ0ICsgZW5kIGZvciB0aGUgY2FsbGVycyBmZWVscyBiYWNrd2FyZHMg
dG8gbWUgYmVjYXVzZSB0aGUKPiBjYWxsZXJzIGRvIG5vdCBkZWZpbmUgdGhlIHJhbmdlcywgYnV0
IHJhdGhlciB0aGUgYXJjaGl0ZWN0dXJlcywgc28gd2Ugc3RpbGwKPiBuZWVkIGEgd2F5IGZvciBh
cmNoaXRlY3R1cmVzIHRvIGRlZmluZSBob3cgdGhleSB3YW50IGFsbG9jYXRlIG1lbW9yeSBmb3IK
PiB0aGUgZ2VuZXJhdGVkIGNvZGUuCgpTbywgdGhlIHN0YXJ0ICsgZW5kIGp1c3QgY29tZXMgZnJv
bSB0aGUgbmVlZCB0byBrZWVwIHJlbGF0aXZlIHBvaW50ZXJzCnVuZGVyIGEgY2VydGFpbiBzaXpl
LiBJIHRoaW5rIHRoaXMgY291bGQgYmUganVzdCBhIGZsYWcsIEkgc2VlIG5vIHJlYXNvbgp0byBl
eHBvc2UgYWN0dWFsIGFkZHJlc3NlcyBoZXJlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
