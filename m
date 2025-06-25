Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BC4C7EE31
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 16:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UrRQCjQ5jlerZdhk12+Q27kP0ZFsOCfu6LtqtVUtRc8=; b=uXOTyzRjKMkOsi
	h1QT5xt5qMBdr7oBtVMfW32xWBY7sjvEJ1CT8e8r325p+ZWyOzM7bZMrCzhrojXe/ORXo5HiV9V1m
	l/gTcvQ0Pt4TtjcN9M10BmBPnFXr3els8r7XJ0xnK5//JRkdfpjjsKIMcQRb1zvB9vodJHTA2V5R7
	fRBn6gre29oyYA4i/rtXX/nD3dikCCMOh8VhcoUQ4mNh3/P2keuMdwRQuYfd4refFl7TC905LcNAe
	qSf5CU5b3qgfJ1Kwid3bn4EiSZiCiIr8mdJlocJQdOMnhLMRL/FV67fXuV63qDKJVKY+Q/eLLCCRf
	14pl51MQAATGKHebhlsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUT2C-00000009JGB-1K13;
	Wed, 25 Jun 2025 16:31:40 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUP7q-00000008bZM-0ccD
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 12:21:15 +0000
Message-ID: <42f1d84f-2d17-43b7-8fa2-83322fcca44f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750854071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqF4hhowZcujiHY+iHQl6x5APphUIOsbur9usB3fHMI=;
	b=dbqPp1zP9dlPKWTDlI3t3zLN5/ONrptH3RYgCcrl9omGqZ7+bmrO3bJa0JRrkvhXraycoV
	elWuByVDPJUxyjtr6uiYD7om3L3B+0RvEw5odBoxkKBn51UWDL3LIG2VCW5LCytZ2sryAb
	zKos2fVOnRiQvX68sWQjMUop6cK7z4g=
Date: Wed, 25 Jun 2025 20:20:59 +0800
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
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <5db6fb4c-079d-4237-80b3-637565457f39@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_052114_331251_8C8FBA65 
X-CRM114-Status: GOOD (  17.13  )
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

CgpPbiAyMDI1LzYvMjUgMjA6MDksIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+Pgo+PiBTb21l
aG93LCBJIGZlZWwgd2UgY291bGQgY29tYmluZSB5b3VyIGNsZWFudXAgY29kZeKAlHdoaWNoIGhh
bmRsZXMgYSBiYXRjaAo+PiBzaXplIG9mICJuciIgYmV0d2VlbiAxIGFuZCBucl9wYWdlc+KAlHdp
dGggdGhlCj4+ICJpZiAobnJfcGFnZXMgPT0gZm9saW9fbnJfcGFnZXMoZm9saW8pKSBnb3RvIHdh
bGtfZG9uZSIgY2hlY2suCj4gCj4gWWVhaCwgdGhhdCdzIHdoYXQgSSB3YXMgc3VnZ2VzdGluZy4g
SXQgd291bGQgaGF2ZSB0byBiZSBwYXJ0IG9mIHRoZSAKPiBjbGVhbnVwIEkgdGhpbmsuCj4gCj4g
SSdtIHN0aWxsIHdvbmRlcmluZyBpZiB0aGVyZSBpcyBhIGNhc2Ugd2hlcmUKPiAKPiBpZiAobnJf
cGFnZXMgPT0gZm9saW9fbnJfcGFnZXMoZm9saW8pKQo+ICDCoMKgwqDCoGdvdG8gd2Fsa19kb25l
Owo+IAo+IHdvdWxkIGJlIHdyb25nIHdoZW4gZGVhbGluZyB3aXRoIHNtYWxsIGZvbGlvcy4KPiAK
Pj4gSW4gcHJhY3RpY2UsIHRoaXMgd291bGQgbGV0IHVzIHNraXAgYWxtb3N0IGFsbCB1bm5lY2Vz
c2FyeSBjaGVja3MsCj4+IGV4Y2VwdCBmb3IgYSBmZXcgcmFyZSBjb3JuZXIgY2FzZXMuCj4+Cj4+
IEZvciB0aG9zZSBjb3JuZXIgY2FzZXMgd2hlcmUgIm5yIiB0cnVseSBmYWxscyBiZXR3ZWVuIDEg
YW5kIG5yX3BhZ2VzLAo+PiB3ZSBjYW4ganVzdCBsZWF2ZSB0aGVtIGFzLWlz4oCUcGVyZm9ybWlu
ZyB0aGUgcmVkdW5kYW50IGNoZWNrIGluc2lkZQo+PiBwYWdlX3ZtYV9tYXBwZWRfd2FsaygpLgo+
IAo+IEkgbWVhbiwgYmF0Y2hpbmcgbWFwY291bnQrcmVmY291bnQgdXBkYXRlcyBldGMuIGlzIGFs
d2F5cyBhIHdpbi4gSWYgd2UgCj4gZW5kIHVwIGRvaW5nIHNvbWUgdW5uZWNlc3NhcnkgcHRlX25v
bmUoKSBjaGVja3MsIHRoYXQgbWlnaHQgYmUgCj4gc3Vib3B0aW1hbCBidXQgbW9zdGx5IG5vaXNl
IGluIGNvbnRyYXN0IHRvIHRoZSBvdGhlciBzdHVmZiB3ZSB3aWxsIAo+IG9wdGltaXplIG91dCDw
n5mCCj4gCj4gQWdyZWVkIHRoYXQgaWYgd2UgY2FuIGVhc2lseSBhdm9pZCB0aGVzZSBwdGVfbm9u
ZSgpIGNoZWNrcywgd2Ugc2hvdWxkIGRvIAo+IHRoYXQuIE9wdGltaXppbmcgdGhhdCBmb3IgIm5y
X3BhZ2VzID09IGZvbGlvX25yX3BhZ2VzKGZvbGlvKSIgbWFrZXMgc2Vuc2UuCgpIbW0uLi4gSSBo
YXZlIGEgcXVlc3Rpb24gYWJvdXQgdGhlIHJlZmVyZW5jZSBjb3VudGluZyBoZXJlIC4uLgoKCQlp
ZiAodm1hLT52bV9mbGFncyAmIFZNX0xPQ0tFRCkKCQkJbWxvY2tfZHJhaW5fbG9jYWwoKTsKCQlm
b2xpb19wdXQoZm9saW8pOwoJCS8qIFdlIGhhdmUgYWxyZWFkeSBiYXRjaGVkIHRoZSBlbnRpcmUg
Zm9saW8gKi8KCkRvZXMgYW55b25lIGVsc2Ugc3RpbGwgaG9sZCBhIHJlZmVyZW5jZSB0byB0aGlz
IGZvbGlvIGFmdGVyIGZvbGlvX3B1dCgpPwoKCQlpZiAobnJfcGFnZXMgPT0gZm9saW9fbnJfcGFn
ZXMoZm9saW8pKQoJCQlnb3RvIHdhbGtfZG9uZTsKCQljb250aW51ZTsKd2Fsa19hYm9ydDoKCQly
ZXQgPSBmYWxzZTsKd2Fsa19kb25lOgoJCXBhZ2Vfdm1hX21hcHBlZF93YWxrX2RvbmUoJnB2bXcp
OwoJCWJyZWFrOwoJfQoKVGhhbmtzLApMYW5jZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
