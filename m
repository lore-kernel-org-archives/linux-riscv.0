Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090C4C7EE31
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 17:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uHnWJLUtcsDBfbl3IORSWH4vv53ajCRDEOs9vkdrOTg=; b=WsQb6P+p7KZM9X
	41n2OjX99+azMYpryctUL3/ixhcpdc3CiZxSfOiU3t8A+zFhPOLZV/aiAVwwgKJo8Z4KvPLnlDgUt
	S5cS95v4qiYQukE1/RlvsPBAeb3E7r8lE9OizZ9bfLFkJYqNz+3+8d+rYKASVw/Rf9UV5KzRgErhX
	9qC/DlX2tdt6ISRCy++u5oBOUPKV4ZlzDRO7Mb4eQKV4gBr2PX2ynDXWlxPOvnz919z6orNCiQujA
	XLDsNOD/BPs0yjLL04SPyW5o7zFz8PWi7PCb61+t3Zv/+yN3Ix6F8cisAXnFavgirBel1lzYJ5IKD
	ouaeevNvX00j6hqIaf+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU3G-00000009TLY-0M11;
	Wed, 25 Jun 2025 17:36:50 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPhy-00000008iRd-0n6v;
	Wed, 25 Jun 2025 12:58:35 +0000
Message-ID: <f1ee8679-88b4-4712-b2ed-c3eec179b430@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750856311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lY4C+H8rjCf0tB+LlRLUjdQXLKGrHdCeK+5aYVx8K34=;
	b=H0RQVztbREsh2CeBNzfiHRG3ArsNptNh9e4vAD7piCsogyawFZAZ0h7oX5wxSxKudfeOx8
	zmgi8lKBBJDJyX+yA3Bd/pjb8f4zMM6qXYyQr+ccBk4iLesagodds3gfB2bKoUezfMEyH5
	9KebcsTF3oF2ez4v96G72qSVlbShipA=
Date: Wed, 25 Jun 2025 20:58:12 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>
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
X-CRM114-CacheID: sfid-20250625_055834_681578_4EFA53C6 
X-CRM114-Status: GOOD (  26.37  )
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

CgpPbiAyMDI1LzYvMjUgMjA6MDksIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IE9uIDI1LjA2
LjI1IDEzOjQyLCBCYXJyeSBTb25nIHdyb3RlOgo+PiBPbiBXZWQsIEp1biAyNSwgMjAyNSBhdCAx
MToyN+KAr1BNIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPiAKPj4gd3JvdGU6
Cj4+Pgo+Pj4gT24gMjUuMDYuMjUgMTM6MTUsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4+Pj4gT24gV2Vk
LCBKdW4gMjUsIDIwMjUgYXQgMTE6MDHigK9QTSBEYXZpZCBIaWxkZW5icmFuZCAKPj4+PiA8ZGF2
aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+Pj4+Cj4+Pj4+IE9uIDI1LjA2LjI1IDEyOjU3LCBCYXJy
eSBTb25nIHdyb3RlOgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBOb3RlIHRoYXQgSSBkb24ndCBxdWl0ZSB1
bmRlcnN0YW5kIHdoeSB3ZSBoYXZlIHRvIGJhdGNoIHRoZSAKPj4+Pj4+Pj4gd2hvbGUgdGhpbmcK
Pj4+Pj4+Pj4gb3IgZmFsbGJhY2sgdG8KPj4+Pj4+Pj4gaW5kaXZpZHVhbCBwYWdlcy4gV2h5IGNh
bid0IHdlIHBlcmZvcm0gb3RoZXIgYmF0Y2hlcyB0aGF0IHNwYW4gCj4+Pj4+Pj4+IG9ubHkgc29t
ZQo+Pj4+Pj4+PiBQVEVzPyBXaGF0J3Mgc3BlY2lhbAo+Pj4+Pj4+PiBhYm91dCAxIFBURSB2cy4g
MiBQVEVzIHZzLiBhbGwgUFRFcz8KPj4+Pj4+Pgo+Pj4+Pj4+IFRoYXQncyBhIGdvb2QgcG9pbnQg
YWJvdXQgdGhlICJhbGwtb3Itbm90aGluZyIgYmF0Y2hpbmcgbG9naWMgOykKPj4+Pj4+Pgo+Pj4+
Pj4+IEl0IHNlZW1zIHRoZSAiYWxsLW9yLW5vdGhpbmciIGFwcHJvYWNoIGlzIHNwZWNpZmljIHRv
IHRoZSAKPj4+Pj4+PiBsYXp5ZnJlZSB1c2UKPj4+Pj4+PiBjYXNlLCB3aGljaCBuZWVkcyB0byB1
bm1hcCB0aGUgZW50aXJlIGZvbGlvIGZvciByZWNsYW1hdGlvbi4gSWYgCj4+Pj4+Pj4gdGhhdCdz
Cj4+Pj4+Pj4gbm90IHBvc3NpYmxlLCBpdCBmYWxscyBiYWNrIHRvIHRoZSBzaW5nbGUtcGFnZSBz
bG93IHBhdGguCj4+Pj4+Pgo+Pj4+Pj4gT3RoZXIgY2FzZXMgYWR2YW5jZSB0aGUgUFRFIHRoZW1z
ZWx2ZXMsIHdoaWxlIHRyeV90b191bm1hcF9vbmUoKSAKPj4+Pj4+IHJlbGllcwo+Pj4+Pj4gb24g
cGFnZV92bWFfbWFwcGVkX3dhbGsoKSB0byBhZHZhbmNlIHRoZSBQVEUuIFVubGVzcyB3ZSB3YW50
IHRvIAo+Pj4+Pj4gbWFudWFsbHkKPj4+Pj4+IG1vZGlmeSBwdm13LnB0ZSBhbmQgcHZtdy5hZGRy
ZXNzIG91dHNpZGUgb2YgCj4+Pj4+PiBwYWdlX3ZtYV9tYXBwZWRfd2FsaygpLCB3aGljaAo+Pj4+
Pj4gdG8gbWUgc2VlbXMgbGlrZSBhIHZpb2xhdGlvbiBvZiBsYXllcnMuIDotKQo+Pj4+Pgo+Pj4+
PiBQbGVhc2UgZXhwbGFpbiB0byBtZSB3aHkgdGhlIGZvbGxvd2luZyBpcyBub3QgY2xlYXJlciBh
bmQgYmV0dGVyOgo+Pj4+Cj4+Pj4gVGhpcyBwYXJ0IGlzIG11Y2ggY2xlYXJlciwgYnV0IHRoYXQg
ZG9lc27igJl0IG5lY2Vzc2FyaWx5IGltcHJvdmUgdGhlIAo+Pj4+IG92ZXJhbGwKPj4+PiBwaWN0
dXJlLiBUaGUgbWFpbiBjaGFsbGVuZ2UgaXMgaG93IHRvIGV4aXQgdGhlIGl0ZXJhdGlvbiBvZgo+
Pj4+IHdoaWxlIChwYWdlX3ZtYV9tYXBwZWRfd2FsaygmcHZtdykpLgo+Pj4KPj4+IE9rYXksIEkg
Z2V0IHdoYXQgeW91IG1lYW4gbm93Lgo+Pj4KPj4+Pgo+Pj4+IFJpZ2h0IG5vdywgd2UgaGF2ZSBp
dCBsYWlkIG91dCBxdWl0ZSBzdHJhaWdodGZvcndhcmRseToKPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC8qIFdlIGhhdmUgYWxyZWFkeSBiYXRjaGVkIHRoZSBlbnRpcmUg
Zm9saW8gKi8KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChucl9w
YWdlcyA+IDEpCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZ290byB3YWxrX2RvbmU7Cj4+Pgo+Pj4KPj4+IEdpdmVuIHRoYXQgdGhlIGNvbW1l
bnQgaXMgY29tcGxldGVseSBjb25mdXNpbmcgd2hlbnMgc2VlaW5nIHRoZSAKPj4+IGNoZWNrIC4u
LiA6KQo+Pj4KPj4+IC8qCj4+PiDCoMKgICogSWYgd2UgYXJlIHN1cmUgdGhhdCB3ZSBiYXRjaGVk
IHRoZSBlbnRpcmUgZm9saW8gYW5kIGNsZWFyZWQgYWxsIAo+Pj4gUFRFcywKPj4+IMKgwqAgKiB3
ZSBjYW4ganVzdCBvcHRpbWl6ZSBhbmQgc3RvcCByaWdodCBoZXJlLgo+Pj4gwqDCoCAqLwo+Pj4g
aWYgKG5yX3BhZ2VzID09IGZvbGlvX25yX3BhZ2VzKGZvbGlvKSkKPj4+IMKgwqDCoMKgwqDCoMKg
wqAgZ290byB3YWxrX2RvbmU7Cj4+Pgo+Pj4gd291bGQgbWFrZSB0aGUgY29tbWVudCBtYXRjaC4K
Pj4KPj4gWWVzLCB0aGF0IGNsYXJpZmllcyBpdC4KPj4KPj4+Cj4+Pj4KPj4+PiB3aXRoIGFueSBu
ciBiZXR3ZWVuIDEgYW5kIGZvbGlvX25yX3BhZ2VzKCksIHdlIGhhdmUgdG8gY29uc2lkZXIgdHdv
IAo+Pj4+IGlzc3VlczoKPj4+PiAxLiBIb3cgdG8gc2tpcCBQVEUgY2hlY2tzIGluc2lkZSBwYWdl
X3ZtYV9tYXBwZWRfd2FsayBmb3IgZW50cmllcyB0aGF0Cj4+Pj4gd2VyZSBhbHJlYWR5IGhhbmRs
ZWQgaW4gdGhlIHByZXZpb3VzIGJhdGNoOwo+Pj4KPj4+IFRoZXkgYXJlIGNsZWFyZWQgaWYgd2Ug
cmVhY2ggdGhhdCBwb2ludC4gU28gdGhlIHB0ZV9ub25lKCkgY2hlY2tzIHdpbGwKPj4+IHNpbXBs
eSBza2lwIHRoZW0/Cj4+Pgo+Pj4+IDIuIEhvdyB0byBicmVhayB0aGUgaXRlcmF0aW9uIHdoZW4g
dGhpcyBiYXRjaCBoYXMgYXJyaXZlZCBhdCB0aGUgZW5kLgo+Pj4KPj4+IHBhZ2Vfdm1hX21hcHBl
ZF93YWxrKCkgc2hvdWxkIGJlIGRvaW5nIHRoYXQ/Cj4+Cj4+IEl0IHNlZW1zIHlvdSBtaWdodCBo
YXZlIG1pc3NlZCB0aGUgcGFydCBpbiBteSByZXBseSB0aGF0IHNheXM6Cj4+ICJPZiBjb3Vyc2Us
IHdlIGNvdWxkIGF2b2lkIGJvdGgsIGJ1dCB0aGF0IHdvdWxkIG1lYW4gcGVyZm9ybWluZyAKPj4g
dW5uZWNlc3NhcnkKPj4gY2hlY2tzIGluc2lkZSBwYWdlX3ZtYV9tYXBwZWRfd2FsaygpLiIKPiAg
PiA+IFRoYXTigJlzIHRydWUgZm9yIGJvdGguIEJ1dCBJ4oCZbSB3b25kZXJpbmcgd2h5IHdl4oCZ
cmUgc3RpbGwgZG9pbmcgdGhlIAo+IGNoZWNrLAo+PiBldmVuIHdoZW4gd2XigJlyZSBmYWlybHkg
c3VyZSB0aGV54oCZdmUgYWxyZWFkeSBiZWVuIGNsZWFyZWQgb3Igd2XigJl2ZSByZWFjaGVkCj4+
IHRoZSBlbmQgOi0pCj4gCj4gOikKPiAKPj4KPj4gU29tZWhvdywgSSBmZWVsIHdlIGNvdWxkIGNv
bWJpbmUgeW91ciBjbGVhbnVwIGNvZGXigJR3aGljaCBoYW5kbGVzIGEgYmF0Y2gKPj4gc2l6ZSBv
ZiAibnIiIGJldHdlZW4gMSBhbmQgbnJfcGFnZXPigJR3aXRoIHRoZQo+PiAiaWYgKG5yX3BhZ2Vz
ID09IGZvbGlvX25yX3BhZ2VzKGZvbGlvKSkgZ290byB3YWxrX2RvbmUiIGNoZWNrLgo+IAo+IFll
YWgsIHRoYXQncyB3aGF0IEkgd2FzIHN1Z2dlc3RpbmcuIEl0IHdvdWxkIGhhdmUgdG8gYmUgcGFy
dCBvZiB0aGUgCj4gY2xlYW51cCBJIHRoaW5rLgo+IAo+IEknbSBzdGlsbCB3b25kZXJpbmcgaWYg
dGhlcmUgaXMgYSBjYXNlIHdoZXJlCj4gCj4gaWYgKG5yX3BhZ2VzID09IGZvbGlvX25yX3BhZ2Vz
KGZvbGlvKSkKPiAgwqDCoMKgwqBnb3RvIHdhbGtfZG9uZTsKPiAKPiB3b3VsZCBiZSB3cm9uZyB3
aGVuIGRlYWxpbmcgd2l0aCBzbWFsbCBmb2xpb3MuCgpXZSBjYW4gbWFrZSB0aGUgY2hlY2sgbW9y
ZSBleHBsaWNpdCB0byBhdm9pZCBhbnkgZnV0dXJlIHRyb3VibGUgOykKCmlmIChucl9wYWdlcyA+
IDEgJiYgbnJfcGFnZXMgPT0gZm9saW9fbnJfcGFnZXMoZm9saW8pKQogICAgIGdvdG8gd2Fsa19k
b25lOwoKSXQgc2hvdWxkIGJlIHNhZmUgZm9yIHNtYWxsIGZvbGlvcy4KClRoYW5rcywKTGFuY2UK
Cj4gCj4+IEluIHByYWN0aWNlLCB0aGlzIHdvdWxkIGxldCB1cyBza2lwIGFsbW9zdCBhbGwgdW5u
ZWNlc3NhcnkgY2hlY2tzLAo+PiBleGNlcHQgZm9yIGEgZmV3IHJhcmUgY29ybmVyIGNhc2VzLgo+
Pgo+PiBGb3IgdGhvc2UgY29ybmVyIGNhc2VzIHdoZXJlICJuciIgdHJ1bHkgZmFsbHMgYmV0d2Vl
biAxIGFuZCBucl9wYWdlcywKPj4gd2UgY2FuIGp1c3QgbGVhdmUgdGhlbSBhcy1pc+KAlHBlcmZv
cm1pbmcgdGhlIHJlZHVuZGFudCBjaGVjayBpbnNpZGUKPj4gcGFnZV92bWFfbWFwcGVkX3dhbGso
KS4KPiAKPiBJIG1lYW4sIGJhdGNoaW5nIG1hcGNvdW50K3JlZmNvdW50IHVwZGF0ZXMgZXRjLiBp
cyBhbHdheXMgYSB3aW4uIElmIHdlIAo+IGVuZCB1cCBkb2luZyBzb21lIHVubmVjZXNzYXJ5IHB0
ZV9ub25lKCkgY2hlY2tzLCB0aGF0IG1pZ2h0IGJlIAo+IHN1Ym9wdGltYWwgYnV0IG1vc3RseSBu
b2lzZSBpbiBjb250cmFzdCB0byB0aGUgb3RoZXIgc3R1ZmYgd2Ugd2lsbCAKPiBvcHRpbWl6ZSBv
dXQgOikKPiAKPiBBZ3JlZWQgdGhhdCBpZiB3ZSBjYW4gZWFzaWx5IGF2b2lkIHRoZXNlIHB0ZV9u
b25lKCkgY2hlY2tzLCB3ZSBzaG91bGQgZG8gCj4gdGhhdC4gT3B0aW1pemluZyB0aGF0IGZvciAi
bnJfcGFnZXMgPT0gZm9saW9fbnJfcGFnZXMoZm9saW8pIiBtYWtlcyBzZW5zZS4KPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
