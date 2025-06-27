Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82841C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wAWSglYD4N9s6NeTYlgkX0g7otekn1KzUgdErxMKLQM=; b=cb/Aa6A5gNOklH
	oN8MewmD+azbnh+KTBviO4CI0m3F8qnwE4wCiBupK80QHJtzjhb5dNKvY9KAWlD5cqQQzxyCNPXL/
	cmN8oB50fVT8RvfEfFyrAGIs+hCfuN0IxnhMl1ylsHujYZDn7s71FElDr5GWW018Vz5ihkyeZUMIq
	k2pDWMmWoJe7N4bnZKHgvCfapd78S9cj5Q83df0aHfFD86pZCgMyC2cWIoz3VmlLmfjGCxQWiJ8SW
	reWhhlfTtPymMQHNDGq8Hna/0FluiWnAfXImfes5u9bE5asXK9N7kSs3Y0Z/d+0Xr1HalJMlizaww
	iS/8QBLZH8ew3Eikp9hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBo1-0000000FEi8-10Gl;
	Fri, 27 Jun 2025 16:20:01 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVB1U-0000000F6jA-3EvW
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 15:29:54 +0000
Message-ID: <530101b3-34d2-49bb-9a12-c7036b0c0a69@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751038189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sLiuMRtcmExZlAb2vPZafFZMyEqiWSdyJ2XHpTWjryU=;
	b=jojdp3aJ6B+Xgwpz/k6+OhYLJXmPgXf95Us1PNv0bB6R1+gv6FBAjoT2fm5yhc9bnqacrM
	dJgOVT4u5v1BYJtWnvmK5l8QzMJqxt7gFKd8YtXf0nkUr4H7+W/qnhtPH/Z0E7K4fZlxiG
	YH3Sa6PrtnlBPZ17rz56nOlQAruaDLA=
Date: Fri, 27 Jun 2025 23:29:11 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, riel@surriel.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, harry.yoo@oracle.com,
 mingzhe.yang@ly.com, stable@vger.kernel.org, Lance Yang <ioworker0@gmail.com>
References: <20250627062319.84936-1-lance.yang@linux.dev>
 <CAGsJ_4xQW3O=-VoC7aTCiwU4NZnK0tNsG1faAUgLvf4aZSm8Eg@mail.gmail.com>
 <CAGsJ_4z+DU-FhNk9vkS-epdxgUMjrCvh31ZBwoAs98uWnbTK-A@mail.gmail.com>
 <1d39b66e-4009-4143-a8fa-5d876bc1f7e7@linux.dev>
 <CAGsJ_4xX+kW1msaXpEPqX7aQ-GYG9QVMo+JYBc18BfLCs8eFyA@mail.gmail.com>
 <609409c7-91a8-4898-ab29-fa00eb36df02@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <609409c7-91a8-4898-ab29-fa00eb36df02@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_082953_167259_718B3FC5 
X-CRM114-Status: GOOD (  21.54  )
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

CgpPbiAyMDI1LzYvMjcgMTg6MTMsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IE9uIDI3LjA2
LjI1IDA5OjM2LCBCYXJyeSBTb25nIHdyb3RlOgo+PiBPbiBGcmksIEp1biAyNywgMjAyNSBhdCA3
OjE14oCvUE0gTGFuY2UgWWFuZyA8bGFuY2UueWFuZ0BsaW51eC5kZXY+IHdyb3RlOgo+Pj4KPj4+
Cj4+Pgo+Pj4gT24gMjAyNS82LzI3IDE0OjU1LCBCYXJyeSBTb25nIHdyb3RlOgo+Pj4+IE9uIEZy
aSwgSnVuIDI3LCAyMDI1IGF0IDY6NTLigK9QTSBCYXJyeSBTb25nIDwyMWNuYmFvQGdtYWlsLmNv
bT4gd3JvdGU6Cj4+Pj4+Cj4+Pj4+IE9uIEZyaSwgSnVuIDI3LCAyMDI1IGF0IDY6MjPigK9QTSBM
YW5jZSBZYW5nIDxpb3dvcmtlcjBAZ21haWwuY29tPiAKPj4+Pj4gd3JvdGU6Cj4+Pj4+Pgo+Pj4+
Pj4gRnJvbTogTGFuY2UgWWFuZyA8bGFuY2UueWFuZ0BsaW51eC5kZXY+Cj4+Pj4+Pgo+Pj4+Pj4g
QXMgcG9pbnRlZCBvdXQgYnkgRGF2aWRbMV0sIHRoZSBiYXRjaGVkIHVubWFwIGxvZ2ljIGluIAo+
Pj4+Pj4gdHJ5X3RvX3VubWFwX29uZSgpCj4+Pj4+PiBjYW4gcmVhZCBwYXN0IHRoZSBlbmQgb2Yg
YSBQVEUgdGFibGUgaWYgYSBsYXJnZSBmb2xpbyBpcyBtYXBwZWQgCj4+Pj4+PiBzdGFydGluZyBh
dAo+Pj4+Pj4gdGhlIGxhc3QgZW50cnkgb2YgdGhhdCB0YWJsZS4gSXQgd291bGQgYmUgcXVpdGUg
cmFyZSBpbiBwcmFjdGljZSwgYXMKPj4+Pj4+IE1BRFZfRlJFRSB0eXBpY2FsbHkgc3BsaXRzIHRo
ZSBsYXJnZSBmb2xpbyA7KQo+Pj4+Pj4KPj4+Pj4+IFNvIGxldCdzIGZpeCB0aGUgcG90ZW50aWFs
IG91dC1vZi1ib3VuZHMgcmVhZCBieSByZWZhY3RvcmluZyB0aGUgCj4+Pj4+PiBsb2dpYyBpbnRv
Cj4+Pj4+PiBhIG5ldyBoZWxwZXIsIGZvbGlvX3VubWFwX3B0ZV9iYXRjaCgpLgo+Pj4+Pj4KPj4+
Pj4+IFRoZSBuZXcgaGVscGVyIG5vdyBjb3JyZWN0bHkgY2FsY3VsYXRlcyB0aGUgc2FmZSBudW1i
ZXIgb2YgcGFnZXMgCj4+Pj4+PiB0byBzY2FuIGJ5Cj4+Pj4+PiBsaW1pdGluZyB0aGUgb3BlcmF0
aW9uIHRvIHRoZSBib3VuZGFyaWVzIG9mIHRoZSBjdXJyZW50IFZNQSBhbmQgCj4+Pj4+PiB0aGUg
UFRFCj4+Pj4+PiB0YWJsZS4KPj4+Pj4+Cj4+Pj4+PiBJbiBhZGRpdGlvbiwgdGhlICJhbGwtb3It
bm90aGluZyIgYmF0Y2hpbmcgcmVzdHJpY3Rpb24gaXMgcmVtb3ZlZCB0bwo+Pj4+Pj4gc3VwcG9y
dCBwYXJ0aWFsIGJhdGNoZXMuIFRoZSByZWZlcmVuY2UgY291bnRpbmcgaXMgYWxzbyBjbGVhbmVk
IHVwIAo+Pj4+Pj4gdG8gdXNlCj4+Pj4+PiBmb2xpb19wdXRfcmVmcygpLgo+Pj4+Pj4KPj4+Pj4+
IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS8gCj4+Pj4+PiBhNjk0Mzk4Yy05
ZjAzLTQ3MzctODFiOS03ZTQ5Yzg1N2ZjYmVAcmVkaGF0LmNvbQo+Pj4+Pj4KPj4+Pj4KPj4+Pj4g
V2hhdCBhYm91dCA/Cj4+Pj4+Cj4+Pj4+IEFzIHBvaW50ZWQgb3V0IGJ5IERhdmlkWzFdLCB0aGUg
YmF0Y2hlZCB1bm1hcCBsb2dpYyBpbiAKPj4+Pj4gdHJ5X3RvX3VubWFwX29uZSgpCj4+Pj4+IG1h
eSByZWFkIHBhc3QgdGhlIGVuZCBvZiBhIFBURSB0YWJsZSB3aGVuIGEgbGFyZ2UgZm9saW8gc3Bh
bnMgCj4+Pj4+IGFjcm9zcyB0d28gUE1EcywKPj4+Pj4gcGFydGljdWxhcmx5IGFmdGVyIGJlaW5n
IHJlbWFwcGVkIHdpdGggbXJlbWFwKCkuIFRoaXMgcGF0Y2ggZml4ZXMgdGhlCj4+Pj4+IHBvdGVu
dGlhbCBvdXQtb2YtYm91bmRzIGFjY2VzcyBieSBjYXBwaW5nIHRoZSBiYXRjaCBhdCB2bV9lbmQg
YW5kIAo+Pj4+PiB0aGUgUE1ECj4+Pj4+IGJvdW5kYXJ5Lgo+Pj4+Pgo+Pj4+PiBJdCBhbHNvIHJl
ZmFjdG9ycyB0aGUgbG9naWMgaW50byBhIG5ldyBoZWxwZXIsIAo+Pj4+PiBmb2xpb191bm1hcF9w
dGVfYmF0Y2goKSwKPj4+Pj4gd2hpY2ggc3VwcG9ydHMgYmF0Y2hpbmcgYmV0d2VlbiAxIGFuZCBm
b2xpb19ucl9wYWdlcy4gVGhpcyBpbXByb3ZlcyAKPj4+Pj4gY29kZQo+Pj4+PiBjbGFyaXR5LiBO
b3RlIHRoYXQgc3VjaCBjYXNlcyBhcmUgcmFyZSBpbiBwcmFjdGljZSwgYXMgTUFEVl9GUkVFIAo+
Pj4+PiB0eXBpY2FsbHkKPj4+Pj4gc3BsaXRzIGxhcmdlIGZvbGlvcy4KPj4+Pgo+Pj4+IFNvcnJ5
LCBJIG1lYW50IHRoYXQgTUFEVl9GUkVFIHR5cGljYWxseSBzcGxpdHMgbGFyZ2UgZm9saW9zIGlm
IHRoZSAKPj4+PiBzcGVjaWZpZWQKPj4+PiByYW5nZSBkb2Vzbid0IGNvdmVyIHRoZSBlbnRpcmUg
Zm9saW8uCj4+Pgo+Pj4gSG1tLi4uIEkgZ290IGl0IHdyb25nIGFzIHdlbGwgOiggSXQncyB0aGUg
cGFydGlhbCBjb3ZlcmFnZSB0aGF0IHRyaWdnZXJzCj4+PiB0aGUgc3BsaXQuCj4+Pgo+Pj4gaG93
IGFib3V0IHRoaXMgcmV2aXNlZCB2ZXJzaW9uOgo+Pj4KPj4+IEFzIHBvaW50ZWQgb3V0IGJ5IERh
dmlkWzFdLCB0aGUgYmF0Y2hlZCB1bm1hcCBsb2dpYyBpbiAKPj4+IHRyeV90b191bm1hcF9vbmUo
KQo+Pj4gbWF5IHJlYWQgcGFzdCB0aGUgZW5kIG9mIGEgUFRFIHRhYmxlIHdoZW4gYSBsYXJnZSBm
b2xpbyBzcGFucyBhY3Jvc3MgdHdvCj4+PiBQTURzLCBwYXJ0aWN1bGFybHkgYWZ0ZXIgYmVpbmcg
cmVtYXBwZWQgd2l0aCBtcmVtYXAoKS4gVGhpcyBwYXRjaCBmaXhlcwo+Pj4gdGhlIHBvdGVudGlh
bCBvdXQtb2YtYm91bmRzIGFjY2VzcyBieSBjYXBwaW5nIHRoZSBiYXRjaCBhdCB2bV9lbmQgYW5k
IAo+Pj4gdGhlCj4+PiBQTUQgYm91bmRhcnkuCj4+Pgo+Pj4gSXQgYWxzbyByZWZhY3RvcnMgdGhl
IGxvZ2ljIGludG8gYSBuZXcgaGVscGVyLCBmb2xpb191bm1hcF9wdGVfYmF0Y2goKSwKPj4+IHdo
aWNoIHN1cHBvcnRzIGJhdGNoaW5nIGJldHdlZW4gMSBhbmQgZm9saW9fbnJfcGFnZXMuIFRoaXMg
aW1wcm92ZXMgY29kZQo+Pj4gY2xhcml0eS4gTm90ZSB0aGF0IHN1Y2ggYm91bmRhcnktc3RyYWRk
bGluZyBjYXNlcyBhcmUgcmFyZSBpbiAKPj4+IHByYWN0aWNlLCBhcwo+Pj4gTUFEVl9GUkVFIHdp
bGwgdHlwaWNhbGx5IHNwbGl0IGEgbGFyZ2UgZm9saW8gaWYgdGhlIGFkdmljZSByYW5nZSBkb2Vz
IAo+Pj4gbm90Cj4+PiBjb3ZlciB0aGUgZW50aXJlIGZvbGlvLgo+Pgo+PiBJIGFzc3VtZSB0aGUg
b3V0LW9mLWJvdW5kcyBhY2Nlc3MgbXVzdCBiZSBmaXhlZCwgZXZlbiB0aG91Z2ggaXQgaXMgdmVy
eQo+PiB1bmxpa2VseS4gSXQgbWlnaHQgb2NjdXIgYWZ0ZXIgYSBsYXJnZSBmb2xpbyBpcyBtYXJr
ZWQgd2l0aCBNQURWX0ZSRUUgYW5kCj4+IHRoZW4gcmVtYXBwZWQgdG8gYW4gdW5hbGlnbmVkIGFk
ZHJlc3MsIHBvdGVudGlhbGx5IGNyb3NzaW5nIHR3byBQVEUgCj4+IHRhYmxlcy4KPiAKPiBSaWdo
dC4gSWYgaXQgY2FuIGJlIHRyaWdnZXJlZCBmcm9tIHVzZXJzcGFjZSwgaXQgZG9lc24ndCBtYXR0
ZXIgaG93IAo+IGxpa2VseS9jb21tb24vd2hhdGV2ZXIgaXQgaXMuIEl0IG11c3QgYmUgZml4ZWQu
CgpBZ3JlZWQuIEl0IG11c3QgYmUgZml4ZWQgcmVnYXJkbGVzcyBvZiBob3cgcmFyZSB0aGUgc2Nl
bmFyaW8gaXMgOykKCj4gCj4+Cj4+IEEgYmF0Y2ggc2l6ZSBiZXR3ZWVuIDIgYW5kIG5yX3BhZ2Vz
IC0gMSBpcyBwcmFjdGljYWxseSByYXJlLCBhcyB3ZSAKPj4gdHlwaWNhbGx5Cj4+IHNwbGl0IGxh
cmdlIGZvbGlvcyB3aGVuIE1BRFZfRlJFRSBkb2VzIG5vdCBjb3ZlciB0aGUgZW50aXJlIGZvbGlv
IHJhbmdlLgo+PiBDYXNlcyB3aGVyZSBhIGJhdGNoIG9mIHNpemUgMiBvciBucl9wYWdlcyAtIDEg
b2NjdXJzIG1heSBvbmx5IGhhcHBlbiBpZiBhCj4+IGxhcmdlIGZvbGlvIGlzIHBhcnRpYWxseSB1
bm1hcHBlZCBhZnRlciBiZWluZyBtYXJrZWQgTUFEVl9GUkVFLCB3aGljaCBpcwo+PiBxdWl0ZSBh
biB1bnVzdWFsIHBhdHRlcm4gaW4gdXNlcnNwYWNlLgo+IAo+IEkgdGhpbmsgdGhlIHBvaW50IGlz
IHJhdGhlciAiU2ltcGxpZnkgdGhlIGNvZGUgYnkgbm90IHNwZWNpYWwtY2FzaW5nIGZvciAKPiBj
b21wbGV0ZWx5IG1hcHBlZCBmb2xpb3MsIHRoZXJlIGlzIG5vIHJlYWwgcmVhc29uIHdoeSB3ZSBj
YW5ub3QgYmF0Y2ggCj4gcmFuZ2VzIHRoYXQgZG9uJ3QgY292ZXIgdGhlIGNvbXBsZXRlIGZvbGlv
LiIuCgpZZWFoLiBUaGF0IG1ha2VzIHRoZSBjb2RlIGNsZWFuZXIgYW5kIG1vcmUgZ2VuZXJpYywg
YXMgdGhlcmUgaXMgbm8Kc3Ryb25nIHJlYXNvbiB0byBzcGVjaWFsLWNhc2UgZm9yIGZ1bGx5IG1h
cHBlZCBmb2xpb3MgOykKCkJhc2VkIG9uIHRoYXQsIEkgdGhpbmsgd2UncmUgb24gdGhlIHNhbWUg
cGFnZSBub3cuIEknZCBsaWtlIHRvIHBvc3QKdGhlIGZvbGxvd2luZyBjb21taXQgbWVzc2FnZSBm
b3IgdGhlIG5leHQgdmVyc2lvbjoKCmBgYApBcyBwb2ludGVkIG91dCBieSBEYXZpZFsxXSwgdGhl
IGJhdGNoZWQgdW5tYXAgbG9naWMgaW4gdHJ5X3RvX3VubWFwX29uZSgpCm1heSByZWFkIHBhc3Qg
dGhlIGVuZCBvZiBhIFBURSB0YWJsZSB3aGVuIGEgbGFyZ2UgZm9saW8ncyBQVEUgbWFwcGluZ3MK
YXJlIG5vdCBmdWxseSBjb250YWluZWQgd2l0aGluIGEgc2luZ2xlIHBhZ2UgdGFibGUuCgpXaGls
ZSB0aGlzIHNjZW5hcmlvIG1pZ2h0IGJlIHJhcmUsIGFuIGlzc3VlIHRyaWdnZXJhYmxlIGZyb20g
dXNlcnNwYWNlIG11c3QKYmUgZml4ZWQgcmVnYXJkbGVzcyBvZiBpdHMgbGlrZWxpaG9vZC4gVGhp
cyBwYXRjaCBmaXhlcyB0aGUgb3V0LW9mLWJvdW5kcwphY2Nlc3MgYnkgcmVmYWN0b3JpbmcgdGhl
IGxvZ2ljIGludG8gYSBuZXcgaGVscGVyLCBmb2xpb191bm1hcF9wdGVfYmF0Y2goKS4KClRoZSBu
ZXcgaGVscGVyIGNvcnJlY3RseSBjYWxjdWxhdGVzIHRoZSBzYWZlIGJhdGNoIHNpemUgYnkgY2Fw
cGluZyB0aGUKc2NhbiBhdCBib3RoIHRoZSBWTUEgYW5kIFBNRCBib3VuZGFyaWVzLiBUbyBzaW1w
bGlmeSB0aGUgY29kZSwgaXQgYWxzbwpzdXBwb3J0cyBwYXJ0aWFsIGJhdGNoaW5nIChpLmUuLCBh
bnkgbnVtYmVyIG9mIHBhZ2VzIGZyb20gMSB1cCB0byB0aGUKY2FsY3VsYXRlZCBzYWZlIG1heGlt
dW0pLCBhcyB0aGVyZSBpcyBubyBzdHJvbmcgcmVhc29uIHRvIHNwZWNpYWwtY2FzZQpmb3IgZnVs
bHkgbWFwcGVkIGZvbGlvcy4KYGBgCgpTbywgd2R5dD8KClRoYW5rcywKTGFuY2UKCgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
