Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BFBD111A8
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Nov 2025 05:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29knC+QXwNFKWECY8v3MM03fU//zsIN3u/ZGZPX0cfo=; b=nHnw8lHUTRN6q9
	HtHkJH5ITXXNmZSkNfROG9XlinOujXvA9l4mCazYQY4KcvD+NdW7HbkF7eiVGklniiHeoiscn+a64
	WGK67vik0ps9aduLUk76oP2UTEm6eZTTiGbadX2WshIx57RiIyTF93rNMQm/ahYSGr+Phmerylb8P
	whfQV48Hn1i9nuvySw4sRI32mUOProMRRqFFiaMw22wwYC7ZQA+DcSKHGzGfpurDa6Z94hD5JtSRg
	RDtYdBMyYH1u9oQys3Yn2yPg5R2tpo+nwDQkdvEOlZ8YKiRY42bQ36+N0LFGpEfQrmnfCNMKaZJEi
	/cJfRkK1cFYtaOtoWFMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPa8v-000000024BL-0ftx;
	Sun, 30 Nov 2025 05:38:41 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPa8s-0000000249c-1utZ
	for linux-riscv@lists.infradead.org;
	Sun, 30 Nov 2025 05:38:39 +0000
Date: Sat, 29 Nov 2025 21:38:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764481106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WMFM3mZm3tfpZm9opFnIUzFCaL9Wf3MxVqcMizCNUwo=;
	b=mzyQTml2HeLVP/7KkNdTn5q52aTUXfw24UVLKCemUVyERxGGs6BfXps44VPj/aI0p2bjyv
	KMjhAOW0HBu+NVi0mdYKElpoDb/9sqzgpso500188A+9PEXABE1B4WxKsO43Lp+jFHQO1d
	m7bA8X9LFJTjAWdANdBQuTczyx3HC7g=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Matthew Wilcox <willy@infradead.org>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
Message-ID: <6xwf5rtl6ccmeera55oz6xsubsljibxb7gfv63ul4locgfiipd@dhjxr6gqrfvh>
References: <20251127011438.6918-1-21cnbao@gmail.com>
 <aSfO7fA-04SBtTug@casper.infradead.org>
 <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
 <aSip2mWX13sqPW_l@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aSip2mWX13sqPW_l@casper.infradead.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_213838_671055_21660855 
X-CRM114-Status: GOOD (  21.79  )
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

T24gVGh1LCBOb3YgMjcsIDIwMjUgYXQgMDc6NDM6MjJQTSArMDAwMCwgTWF0dGhldyBXaWxjb3gg
d3JvdGU6Cj4gW2Ryb3BwaW5nIGluZGl2aWR1YWxzLCBsZWF2aW5nIG9ubHkgbWFpbGluZyBsaXN0
cy4gIHBsZWFzZSBkb24ndCBzZW5kCj4gdGhpcyBraW5kIG9mIHRoaW5nIHRvIHNvIG1hbnkgcGVv
cGxlIGluIGZ1dHVyZV0KPiAKPiBPbiBUaHUsIE5vdiAyNywgMjAyNSBhdCAxMjoyMjoxNlBNICsw
ODAwLCBCYXJyeSBTb25nIHdyb3RlOgo+ID4gT24gVGh1LCBOb3YgMjcsIDIwMjUgYXQgMTI6MDni
gK9QTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IE9uIFRodSwgTm92IDI3LCAyMDI1IGF0IDA5OjE0OjM2QU0gKzA4MDAsIEJhcnJ5IFNvbmcg
d3JvdGU6Cj4gPiA+ID4gVGhlcmUgaXMgbm8gbmVlZCB0byBhbHdheXMgZmFsbCBiYWNrIHRvIG1t
YXBfbG9jayBpZiB0aGUgcGVyLVZNQQo+ID4gPiA+IGxvY2sgd2FzIHJlbGVhc2VkIG9ubHkgdG8g
d2FpdCBmb3IgcGFnZWNhY2hlIG9yIHN3YXBjYWNoZSB0bwo+ID4gPiA+IGJlY29tZSByZWFkeS4K
PiA+ID4KPiA+ID4gU29tZXRoaW5nIEkndmUgYmVlbiB3b25kZXJpbmcgYWJvdXQgaXMgcmVtb3Zp
bmcgYWxsIHRoZSAiZHJvcCB0aGUgTU0KPiA+ID4gbG9ja3Mgd2hpbGUgd2Ugd2FpdCBmb3IgSS9P
IiBndW5rLiAgSXQncyBhIG5pY2UgYW1vdW50IG9mIGNvZGUgcmVtb3ZlZDoKPiA+IAo+ID4gSSB0
aGluayB0aGUgcG9pbnQgaXMgdGhhdCBwYWdlIGZhdWx0IGhhbmRsZXJzIHNob3VsZCBhdm9pZCBo
b2xkaW5nIHRoZSBWTUEKPiA+IGxvY2sgb3IgbW1hcF9sb2NrIGZvciB0b28gbG9uZyB3aGlsZSB3
YWl0aW5nIGZvciBJL08uIE90aGVyd2lzZSwgdGhvc2UKPiA+IHdyaXRlcnMgYW5kIHJlYWRlcnMg
d2lsbCBiZSBzdHVjayBmb3IgYSB3aGlsZS4KPiAKPiBUaGVyZSdzIGEgdXNlY2FzZSBzb21lIG9m
IHVzIGhhdmUgYmVlbiBkaXNjdXNzaW5nIG9mZi1saXN0IGZvciBhIGZldwo+IHdlZWtzIHRoYXQg
b3VyIGN1cnJlbnQgc3RyYXRlZ3kgcGVzc2ltaXNlcy4gIEl0J3MgYSBwcm9jZXNzIHdpdGgKPiB0
aG91c2FuZHMgKG1heWJlIHRlbnMgb2YgdGhvdXNhbmRzKSBvZiB0aHJlYWRzLiAgSXQgaGFzIG11
Y2ggbW9yZSBtYXBwZWQKPiBmaWxlcyB0aGFuIGl0IGhhcyBtZW1vcnkgdGhhdCBjZ3JvdXBzIHdp
bGwgYWxsb3cgaXQgdG8gdXNlLiAgU28gb24gYQo+IHBhZ2UgZmF1bHQsIHdlIGRyb3AgdGhlIHZt
YSBsb2NrLCBhbGxvY2F0ZSBhIHBhZ2Ugb2YgcmFtLCBraWNrIG9mZiB0aGUKPiByZWFkLCBzbGVl
cCB3YWl0aW5nIGZvciB0aGUgZm9saW8gdG8gY29tZSB1cHRvZGF0ZSwgb25jZSBpdCBpcyByZXR1
cm4sCj4gZXhwZWN0aW5nIHRoZSBwYWdlIHRvIHN0aWxsIGJlIHRoZXJlIHdoZW4gd2UgcmVlbnRl
ciBmaWxlbWFwX2ZhdWx0Lgo+IEJ1dCBpdCdzIHVuZGVyIHNvIG11Y2ggbWVtb3J5IHByZXNzdXJl
IHRoYXQgaXQncyBhbHJlYWR5IGJlZW4gcmVjbGFpbWVkCj4gYnkgdGhlIHRpbWUgd2UgZ2V0IGJh
Y2sgdG8gaXQuICBTbyBhbGwgdGhlIHRocmVhZHMganVzdCBiYXR0ZXIgdGhlCj4gc3RvcmFnZSBy
ZS1yZWFkaW5nIGRhdGEuCgpJIHdvdWxkIGNhdXRpb24gYWdhaW5zdCBjaGFuZ2luZyBrZXJuZWwg
Zm9yIHN1Y2ggdXNlY2FzZS4gQWN0dWFsbHkgSQp3b3VsZCBjYWxsIGl0IGEgbWlzY29uZmlndXJl
ZCBzeXN0ZW0gaW5zdGVhZCBvZiBhIHVzZWNhc2UuIElmIGEKd29ya2xvYWQgaXMgdW5kZXIgdGhh
dCBtdWNoIG1lbW9yeSBwcmVzc3VyZSB0aGF0IGl0cyByZWZhdWx0ZWQgcGFnZXMKYXJlIGdldHRp
bmcgcmVjbGFpbWVkIHRoZW4gaXQgbWVhbnMgaXRzIHdvcmtpbmdzZXQgaXMgbGFyZ2VyIHRoYW4g
dGhlCmF2YWlsYWJsZSBtZW1vcnkgYW5kIGlzIHRocmFzaGluZy4gVGhlIG9ubHkgb3B0aW9uIGhl
cmUgaXMgdG8gZWl0aGVyCmluY3JlYXNlIHRoZSBtZW1vcnkgbGltaXRzIG9yIGtpbGwgdGhlIHdv
cmtsb2FkIGFuZCByZXNjaGVkdWxlIG9uIHRoZQpzeXN0ZW0gd2l0aCBlbm91Z2ggbWVtb3J5IGF2
YWlsYWJsZS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
