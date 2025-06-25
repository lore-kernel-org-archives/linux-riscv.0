Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB9EC8300F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 17:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ftomln09eJRnv1yt7rm571osB4tzFjo0xiRcRiAgY5U=; b=xVGYEM4WEuQm1/
	YvPqGRqXLYr04Z9Z5Zu0RBRsXnlP43XqbSbm7GrdTN2vE8tM0J/YSXiEaL/aIrqvzDsYAP6L/dVup
	knjnw9E7H/4PqSasyWawx1M6OFhoUn6YxpG0/P+eqktVAeBwJY0hUvxpGrar7+kF0i5O0U2mXQiNA
	ph8z2tZFiHZVC7ByuZhvauUVWjJI/k2lVQhRKIx0qYiDPxd4IBskbk/n7QH2xKOutZtHDKrlmW1a3
	Yba5ZVhbVNY+gY+i9OSCprAaXQt4t40/ORi4mhoBdXPFfqn7rQjTacn2KjhDXc0rJJovb24ahz/J0
	j965uiyt94z3i4utYUpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU2y-00000009SzF-14cN;
	Wed, 25 Jun 2025 17:36:32 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPM7-00000008dt7-0T1C
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 12:36:00 +0000
Message-ID: <c9168877-9d66-4963-b4a7-f0095ba2760f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750854955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBhxaGgNjA37rFka6DmFsDUeF2nq5c9Khk7gfBsLM70=;
	b=wgPth1dxQCRD0V3ed0dRj9oL9K1dKtEq8pPfSmknpZbvJKt1zMt+3QNhkKNfMfZLceO8Qz
	cPxPaRoBL8WCkPE1QYq1+gDJ6MBR7/n0ZwmoPuZBokr0YeUZSOSOzHn8u4cZN1bumaSLjB
	Pe1sgLMQ9jKHyZ+aeQC6qLoBmCS1cY8=
Date: Wed, 25 Jun 2025 20:35:37 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>, Barry Song <21cnbao@gmail.com>
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com>
 <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
 <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
 <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com>
 <CAGsJ_4zSGT05GjxM1H6JwSa5MhgtxaiYVa1Wtvm8+SmYkm=jmQ@mail.gmail.com>
 <6179dd30-5351-4a79-b0d6-f0e85650a926@redhat.com>
 <CAGsJ_4yTH5ngM++e=c+P7g0fXs-QQsOk2oxd1RWa3Qww97Knrw@mail.gmail.com>
 <5db6fb4c-079d-4237-80b3-637565457f39@redhat.com>
 <42f1d84f-2d17-43b7-8fa2-83322fcca44f@linux.dev>
 <9bb1e917-891d-4e1b-915f-98cdd5fc578b@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <9bb1e917-891d-4e1b-915f-98cdd5fc578b@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_053559_360055_21FCB790 
X-CRM114-Status: GOOD (  14.83  )
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

CgpPbiAyMDI1LzYvMjUgMjA6MjUsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IE9uIDI1LjA2
LjI1IDE0OjIwLCBMYW5jZSBZYW5nIHdyb3RlOgo+Pgo+Pgo+PiBPbiAyMDI1LzYvMjUgMjA6MDks
IERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+Pj4+Cj4+Pj4gU29tZWhvdywgSSBmZWVsIHdlIGNv
dWxkIGNvbWJpbmUgeW91ciBjbGVhbnVwIGNvZGXigJR3aGljaCBoYW5kbGVzIGEgCj4+Pj4gYmF0
Y2gKPj4+PiBzaXplIG9mICJuciIgYmV0d2VlbiAxIGFuZCBucl9wYWdlc+KAlHdpdGggdGhlCj4+
Pj4gImlmIChucl9wYWdlcyA9PSBmb2xpb19ucl9wYWdlcyhmb2xpbykpIGdvdG8gd2Fsa19kb25l
IiBjaGVjay4KPj4+Cj4+PiBZZWFoLCB0aGF0J3Mgd2hhdCBJIHdhcyBzdWdnZXN0aW5nLiBJdCB3
b3VsZCBoYXZlIHRvIGJlIHBhcnQgb2YgdGhlCj4+PiBjbGVhbnVwIEkgdGhpbmsuCj4+Pgo+Pj4g
SSdtIHN0aWxsIHdvbmRlcmluZyBpZiB0aGVyZSBpcyBhIGNhc2Ugd2hlcmUKPj4+Cj4+PiBpZiAo
bnJfcGFnZXMgPT0gZm9saW9fbnJfcGFnZXMoZm9saW8pKQo+Pj4gwqAgwqDCoMKgwqBnb3RvIHdh
bGtfZG9uZTsKPj4+Cj4+PiB3b3VsZCBiZSB3cm9uZyB3aGVuIGRlYWxpbmcgd2l0aCBzbWFsbCBm
b2xpb3MuCj4+Pgo+Pj4+IEluIHByYWN0aWNlLCB0aGlzIHdvdWxkIGxldCB1cyBza2lwIGFsbW9z
dCBhbGwgdW5uZWNlc3NhcnkgY2hlY2tzLAo+Pj4+IGV4Y2VwdCBmb3IgYSBmZXcgcmFyZSBjb3Ju
ZXIgY2FzZXMuCj4+Pj4KPj4+PiBGb3IgdGhvc2UgY29ybmVyIGNhc2VzIHdoZXJlICJuciIgdHJ1
bHkgZmFsbHMgYmV0d2VlbiAxIGFuZCBucl9wYWdlcywKPj4+PiB3ZSBjYW4ganVzdCBsZWF2ZSB0
aGVtIGFzLWlz4oCUcGVyZm9ybWluZyB0aGUgcmVkdW5kYW50IGNoZWNrIGluc2lkZQo+Pj4+IHBh
Z2Vfdm1hX21hcHBlZF93YWxrKCkuCj4+Pgo+Pj4gSSBtZWFuLCBiYXRjaGluZyBtYXBjb3VudCty
ZWZjb3VudCB1cGRhdGVzIGV0Yy4gaXMgYWx3YXlzIGEgd2luLiBJZiB3ZQo+Pj4gZW5kIHVwIGRv
aW5nIHNvbWUgdW5uZWNlc3NhcnkgcHRlX25vbmUoKSBjaGVja3MsIHRoYXQgbWlnaHQgYmUKPj4+
IHN1Ym9wdGltYWwgYnV0IG1vc3RseSBub2lzZSBpbiBjb250cmFzdCB0byB0aGUgb3RoZXIgc3R1
ZmYgd2Ugd2lsbAo+Pj4gb3B0aW1pemUgb3V0IPCfmYIKPj4+Cj4+PiBBZ3JlZWQgdGhhdCBpZiB3
ZSBjYW4gZWFzaWx5IGF2b2lkIHRoZXNlIHB0ZV9ub25lKCkgY2hlY2tzLCB3ZSBzaG91bGQgZG8K
Pj4+IHRoYXQuIE9wdGltaXppbmcgdGhhdCBmb3IgIm5yX3BhZ2VzID09IGZvbGlvX25yX3BhZ2Vz
KGZvbGlvKSIgbWFrZXMgCj4+PiBzZW5zZS4KPj4KPj4gSG1tLi4uIEkgaGF2ZSBhIHF1ZXN0aW9u
IGFib3V0IHRoZSByZWZlcmVuY2UgY291bnRpbmcgaGVyZSAuLi4KPj4KPj4gwqDCoMKgwqDCoMKg
wqAgaWYgKHZtYS0+dm1fZmxhZ3MgJiBWTV9MT0NLRUQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbWxvY2tfZHJhaW5fbG9jYWwoKTsKPj4gwqDCoMKgwqDCoMKgwqAgZm9saW9fcHV0KGZvbGlv
KTsKPj4gwqDCoMKgwqDCoMKgwqAgLyogV2UgaGF2ZSBhbHJlYWR5IGJhdGNoZWQgdGhlIGVudGly
ZSBmb2xpbyAqLwo+Pgo+PiBEb2VzIGFueW9uZSBlbHNlIHN0aWxsIGhvbGQgYSByZWZlcmVuY2Ug
dG8gdGhpcyBmb2xpbyBhZnRlciBmb2xpb19wdXQoKT8KPiAKPiBUaGUgY2FsbGVyIG9mIHRoZSB1
bm1hcCBvcGVyYXRpb24gc2hvdWxkIGJldHRlciBob2xkIGEgcmVmZXJlbmNlIDopCgpBaCwgeW91
J3JlIHJpZ2h0LiBJIHNob3VsZCBoYXZlIHJlYWxpemVkIHRoYXQgOigKClRoYW5rcywKTGFuY2UK
Cj4gCj4gQWxzbywgSSBhbSBub3Qgc3VyZSB3aHkgd2UgZG9uJ3QgcGVyZm9ybSBhCj4gCj4gZm9s
aW9fcHV0X3JlZnMoZm9saW8sIG5yX3BhZ2VzKTsKPiAKPiAuLi4gOikKPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
