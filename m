Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935E7CFD2F6
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 19:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Raasjjmpq7a0joB4Hq/sqm+CiQoasHacVUBiZ4movL0=; b=JGs3ACZQMYKfpY
	WUmylWlyLsDKxy6r+1OWLrO5U+ULQLNyYqJxkUvb04J1TV1rmAKbGS3EpQpcsM1vH75EtCtZq64XI
	4stO48OHDg35Nf9CIg4Fdfjca3KW/k0Y+8qgMj2K7/rO4f6Y3HhoBvfdnvun40xN6rQB8HHoJbfOj
	8eC3/blNcVBzO28lvaRVqDo5VHy0BaPBu7eg82z4xenSrCzElnuvKuDOHRB1r18yP/DYxnFPPbsXz
	hZvwVVfAc0WxeQoWjdibns+1FR2VOzRUAMJUJOBKrKwLDxVbHpRaZFINl1WVVsE64wj2XmBye9V8O
	pBxa/Qee57OXCVldJp4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhtm-0000000H9pv-1ABP;
	Thu, 27 Nov 2025 19:43:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhtk-0000000H9pO-2Tfn;
	Thu, 27 Nov 2025 19:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JQe+g5ZvR6KeivPEwk1LBLbeVJ2/39tSJLB6nZ8TM10=; b=bLoT/FglVGFQTp6ZQ56Yle6fs8
	ptqzHTWL95KXuhjuxl7XPt2gLgIOgk1wweluHsPyQ38cpDssH97HG3X9erEgS+i3X/bNy+BrSNtZX
	0Nx+1/7AoEl05gpR3MVH+L9M0aocNk7ibz8QPD2KslaJzakC7Ok8gfVaNO2YEVazZb2xxnmCHFpPF
	IGRfMUCoFpNAy2XF/qaFP5T/vm4M4wGNn6/Yp6Tnduny8zxbeHx1WOFYhR2vZjAP7vXkPR/loRBbS
	yrzAGHclbg4deP4UOsDu2voNxG+3XLZD1UdKAL75EZWsX6Dwl59DS2irr+1duhO8HSc3s96oSDErT
	Uno8xeEw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhti-0000000CBWb-3MlU;
	Thu, 27 Nov 2025 19:43:22 +0000
Date: Thu, 27 Nov 2025 19:43:22 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
Message-ID: <aSip2mWX13sqPW_l@casper.infradead.org>
References: <20251127011438.6918-1-21cnbao@gmail.com>
 <aSfO7fA-04SBtTug@casper.infradead.org>
 <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
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

W2Ryb3BwaW5nIGluZGl2aWR1YWxzLCBsZWF2aW5nIG9ubHkgbWFpbGluZyBsaXN0cy4gIHBsZWFz
ZSBkb24ndCBzZW5kCnRoaXMga2luZCBvZiB0aGluZyB0byBzbyBtYW55IHBlb3BsZSBpbiBmdXR1
cmVdCgpPbiBUaHUsIE5vdiAyNywgMjAyNSBhdCAxMjoyMjoxNlBNICswODAwLCBCYXJyeSBTb25n
IHdyb3RlOgo+IE9uIFRodSwgTm92IDI3LCAyMDI1IGF0IDEyOjA54oCvUE0gTWF0dGhldyBXaWxj
b3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgTm92IDI3LCAy
MDI1IGF0IDA5OjE0OjM2QU0gKzA4MDAsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gPiA+IFRoZXJlIGlz
IG5vIG5lZWQgdG8gYWx3YXlzIGZhbGwgYmFjayB0byBtbWFwX2xvY2sgaWYgdGhlIHBlci1WTUEK
PiA+ID4gbG9jayB3YXMgcmVsZWFzZWQgb25seSB0byB3YWl0IGZvciBwYWdlY2FjaGUgb3Igc3dh
cGNhY2hlIHRvCj4gPiA+IGJlY29tZSByZWFkeS4KPiA+Cj4gPiBTb21ldGhpbmcgSSd2ZSBiZWVu
IHdvbmRlcmluZyBhYm91dCBpcyByZW1vdmluZyBhbGwgdGhlICJkcm9wIHRoZSBNTQo+ID4gbG9j
a3Mgd2hpbGUgd2Ugd2FpdCBmb3IgSS9PIiBndW5rLiAgSXQncyBhIG5pY2UgYW1vdW50IG9mIGNv
ZGUgcmVtb3ZlZDoKPiAKPiBJIHRoaW5rIHRoZSBwb2ludCBpcyB0aGF0IHBhZ2UgZmF1bHQgaGFu
ZGxlcnMgc2hvdWxkIGF2b2lkIGhvbGRpbmcgdGhlIFZNQQo+IGxvY2sgb3IgbW1hcF9sb2NrIGZv
ciB0b28gbG9uZyB3aGlsZSB3YWl0aW5nIGZvciBJL08uIE90aGVyd2lzZSwgdGhvc2UKPiB3cml0
ZXJzIGFuZCByZWFkZXJzIHdpbGwgYmUgc3R1Y2sgZm9yIGEgd2hpbGUuCgpUaGVyZSdzIGEgdXNl
Y2FzZSBzb21lIG9mIHVzIGhhdmUgYmVlbiBkaXNjdXNzaW5nIG9mZi1saXN0IGZvciBhIGZldwp3
ZWVrcyB0aGF0IG91ciBjdXJyZW50IHN0cmF0ZWd5IHBlc3NpbWlzZXMuICBJdCdzIGEgcHJvY2Vz
cyB3aXRoCnRob3VzYW5kcyAobWF5YmUgdGVucyBvZiB0aG91c2FuZHMpIG9mIHRocmVhZHMuICBJ
dCBoYXMgbXVjaCBtb3JlIG1hcHBlZApmaWxlcyB0aGFuIGl0IGhhcyBtZW1vcnkgdGhhdCBjZ3Jv
dXBzIHdpbGwgYWxsb3cgaXQgdG8gdXNlLiAgU28gb24gYQpwYWdlIGZhdWx0LCB3ZSBkcm9wIHRo
ZSB2bWEgbG9jaywgYWxsb2NhdGUgYSBwYWdlIG9mIHJhbSwga2ljayBvZmYgdGhlCnJlYWQsIHNs
ZWVwIHdhaXRpbmcgZm9yIHRoZSBmb2xpbyB0byBjb21lIHVwdG9kYXRlLCBvbmNlIGl0IGlzIHJl
dHVybiwKZXhwZWN0aW5nIHRoZSBwYWdlIHRvIHN0aWxsIGJlIHRoZXJlIHdoZW4gd2UgcmVlbnRl
ciBmaWxlbWFwX2ZhdWx0LgpCdXQgaXQncyB1bmRlciBzbyBtdWNoIG1lbW9yeSBwcmVzc3VyZSB0
aGF0IGl0J3MgYWxyZWFkeSBiZWVuIHJlY2xhaW1lZApieSB0aGUgdGltZSB3ZSBnZXQgYmFjayB0
byBpdC4gIFNvIGFsbCB0aGUgdGhyZWFkcyBqdXN0IGJhdHRlciB0aGUKc3RvcmFnZSByZS1yZWFk
aW5nIGRhdGEuCgpJZiB3ZSBkb24ndCBkcm9wIHRoZSB2bWEgbG9jaywgd2UgY2FuIGluc2VydCB0
aGUgcGFnZXMgaW4gdGhlIHBhZ2UgdGFibGUKYW5kIHJldHVybiwgbWF5YmUgZ2V0dGluZyBzb21l
IHdvcmsgZG9uZSBiZWZvcmUgdGhpcyB0aHJlYWQgaXMKZGVzY2hlZHVsZWQuCgpUaGlzIHVzZSBj
YXNlIGFsc28gbWFuYWdlcyB0byBnZXQgdXR0ZXJseSBodW5nLXVwIHRyeWluZyB0byBkbyByZWNs
YWltCnRvZGF5IHdpdGggdGhlIG1tYXBfbG9jayBoZWxkLiAgU08gaXQgbWFuaWZlc3RzIHNvbWV3
aGF0IHNpbWlsYXJseSB0bwp5b3VyIHByb2JsZW0gKGV2ZXJ5Ym9keSBlbmRzIHVwIGJsb2NrZWQg
b24gbW1hcF9sb2NrKSBidXQgaXQgaGFzIGEKcmF0aGVyIGRpZmZlcmVudCByb290IGNhdXNlLgoK
PiBJIGFncmVlIHRoZXJl4oCZcyByb29tIGZvciBpbXByb3ZlbWVudCwgYnV0IG1lcmVseSByZW1v
dmluZyB0aGUgImRyb3AgdGhlIE1NCj4gbG9ja3Mgd2hpbGUgd2FpdGluZyBmb3IgSS9PIiBjb2Rl
IGlzIHVubGlrZWx5IHRvIGltcHJvdmUgcGVyZm9ybWFuY2UuCgpJJ20gbm90IHN1cmUgaXQnZCBo
dXJ0IHBlcmZvcm1hbmNlLiAgVGhlICJkcm9wIG1tYXAgbG9ja3MgZm9yIEkvTyIgY29kZQp3YXMg
d3JpdHRlbiBiZWZvcmUgdGhlIFZNQSBsb2NraW5nIGNvZGUgd2FzIHdyaXR0ZW4uICBJIGRvbid0
IGtub3cgdGhhdAppdCdzIGFjdHVhbGx5IGhlbHBpbmcgdGhlc2UgZGF5cy4KCj4gVGhlIGNoYW5n
ZSB3b3VsZCBiZSBtdWNoIG1vcmUgY29tcGxleCwgc28gSeKAmWQgcHJlZmVyIHRvIGxhbmQgdGhl
IGN1cnJlbnQKPiBwYXRjaHNldCBmaXJzdC4gQXQgbGVhc3QgdGhpcyB3YXksIHdlIGF2b2lkIGZh
bGxpbmcgYmFjayB0byBtbWFwX2xvY2sgYW5kCj4gY2F1c2luZyBjb250ZW50aW9uIG9yIHByaW9y
aXR5IGludmVyc2lvbiwgd2l0aCBtaW5pbWFsIGNoYW5nZXMuCgpVaCwgdGhpcyBpcyBhbiBSRkMg
cGF0Y2hzZXQuICBJJ20gZ2l2aW5nIHlvdSBteSBjb21tZW50LCB3aGljaCBpcyB0aGF0IEkKZG9u
J3QgdGhpbmsgdGhpcyBpcyB0aGUgcmlnaHQgZGlyZWN0aW9uIHRvIGdvIGluLiAgQW55IHRhbGsg
b2YgImxhbmRpbmciCnRoZXNlIHBhdGNoZXMgaXMgZXh0cmVtZWx5IHByZW1hdHVyZS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
