Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B998FC7EE31
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 07:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ApCrrieHkiB8bk8diZhb1jS6tsky+2c37/tYHjlbInM=; b=B+qS/z1pD363Z3
	++20Lip+op2frkNFy9jMMB8ffnIQ0eKIe6AgMbr53Q7PZSm0Rpg8IcTHooiMc8Bval5raraWvq98A
	46J8HkVtXymFle2J0zN0RbhRdLo2eLv/SVh85nccXjrfw1dN5J4IqVQgBpAFKx5kryKBVykivV629
	j8S4jPEv7kTai1jVlwClWm5NjtM7W8P5YVgwffy80Njs4zWKwo+HEWMx4s4k1UTLqQ9h8794sr5/M
	gXRt3yvULKhjglWafGMZqL265CsYbn6tH9i6qwSsdG+YTAlBYn7dlKsy4wo+2Z13FaOVKVrU9bglk
	cwLUYS2kD7oTv+1+/lqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3Zn-0000000DpoT-47LQ;
	Fri, 27 Jun 2025 07:32:47 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3Ja-0000000Do4z-3m7B
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 07:16:04 +0000
Message-ID: <1d39b66e-4009-4143-a8fa-5d876bc1f7e7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751008550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2YlWsvrV7BaACfyKv597+qNsvY3pISsv0aYbyAd91Ns=;
	b=b/S9FkV17dZyBU9gyIoqvCZ9lEWKMXK/izhpXtTf2yF3lzMVVnGX5YDWIEAMOyw+JsnWYy
	ZS/rlXdv+yGYpIGe7LtEkl5IvH7HC+w5BVIfUfUlYeVeQFfEQNv2+ilmf3FIPf6WpIp1B5
	GZr8YjBl/kjDa13f8vVty5wzMBiXjgI=
Date: Fri, 27 Jun 2025 15:15:41 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
Content-Language: en-US
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, david@redhat.com,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, huang.ying.caritas@gmail.com, zhengtangquan@oppo.com,
 riel@surriel.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 harry.yoo@oracle.com, mingzhe.yang@ly.com, stable@vger.kernel.org,
 Lance Yang <ioworker0@gmail.com>
References: <20250627062319.84936-1-lance.yang@linux.dev>
 <CAGsJ_4xQW3O=-VoC7aTCiwU4NZnK0tNsG1faAUgLvf4aZSm8Eg@mail.gmail.com>
 <CAGsJ_4z+DU-FhNk9vkS-epdxgUMjrCvh31ZBwoAs98uWnbTK-A@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <CAGsJ_4z+DU-FhNk9vkS-epdxgUMjrCvh31ZBwoAs98uWnbTK-A@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_001603_072213_D09C42B0 
X-CRM114-Status: GOOD (  12.94  )
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

CgpPbiAyMDI1LzYvMjcgMTQ6NTUsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gT24gRnJpLCBKdW4gMjcs
IDIwMjUgYXQgNjo1MuKAr1BNIEJhcnJ5IFNvbmcgPDIxY25iYW9AZ21haWwuY29tPiB3cm90ZToK
Pj4KPj4gT24gRnJpLCBKdW4gMjcsIDIwMjUgYXQgNjoyM+KAr1BNIExhbmNlIFlhbmcgPGlvd29y
a2VyMEBnbWFpbC5jb20+IHdyb3RlOgo+Pj4KPj4+IEZyb206IExhbmNlIFlhbmcgPGxhbmNlLnlh
bmdAbGludXguZGV2Pgo+Pj4KPj4+IEFzIHBvaW50ZWQgb3V0IGJ5IERhdmlkWzFdLCB0aGUgYmF0
Y2hlZCB1bm1hcCBsb2dpYyBpbiB0cnlfdG9fdW5tYXBfb25lKCkKPj4+IGNhbiByZWFkIHBhc3Qg
dGhlIGVuZCBvZiBhIFBURSB0YWJsZSBpZiBhIGxhcmdlIGZvbGlvIGlzIG1hcHBlZCBzdGFydGlu
ZyBhdAo+Pj4gdGhlIGxhc3QgZW50cnkgb2YgdGhhdCB0YWJsZS4gSXQgd291bGQgYmUgcXVpdGUg
cmFyZSBpbiBwcmFjdGljZSwgYXMKPj4+IE1BRFZfRlJFRSB0eXBpY2FsbHkgc3BsaXRzIHRoZSBs
YXJnZSBmb2xpbyA7KQo+Pj4KPj4+IFNvIGxldCdzIGZpeCB0aGUgcG90ZW50aWFsIG91dC1vZi1i
b3VuZHMgcmVhZCBieSByZWZhY3RvcmluZyB0aGUgbG9naWMgaW50bwo+Pj4gYSBuZXcgaGVscGVy
LCBmb2xpb191bm1hcF9wdGVfYmF0Y2goKS4KPj4+Cj4+PiBUaGUgbmV3IGhlbHBlciBub3cgY29y
cmVjdGx5IGNhbGN1bGF0ZXMgdGhlIHNhZmUgbnVtYmVyIG9mIHBhZ2VzIHRvIHNjYW4gYnkKPj4+
IGxpbWl0aW5nIHRoZSBvcGVyYXRpb24gdG8gdGhlIGJvdW5kYXJpZXMgb2YgdGhlIGN1cnJlbnQg
Vk1BIGFuZCB0aGUgUFRFCj4+PiB0YWJsZS4KPj4+Cj4+PiBJbiBhZGRpdGlvbiwgdGhlICJhbGwt
b3Itbm90aGluZyIgYmF0Y2hpbmcgcmVzdHJpY3Rpb24gaXMgcmVtb3ZlZCB0bwo+Pj4gc3VwcG9y
dCBwYXJ0aWFsIGJhdGNoZXMuIFRoZSByZWZlcmVuY2UgY291bnRpbmcgaXMgYWxzbyBjbGVhbmVk
IHVwIHRvIHVzZQo+Pj4gZm9saW9fcHV0X3JlZnMoKS4KPj4+Cj4+PiBbMV0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtbW0vYTY5NDM5OGMtOWYwMy00NzM3LTgxYjktN2U0OWM4NTdmY2Jl
QHJlZGhhdC5jb20KPj4+Cj4+Cj4+IFdoYXQgYWJvdXQgPwo+Pgo+PiBBcyBwb2ludGVkIG91dCBi
eSBEYXZpZFsxXSwgdGhlIGJhdGNoZWQgdW5tYXAgbG9naWMgaW4gdHJ5X3RvX3VubWFwX29uZSgp
Cj4+IG1heSByZWFkIHBhc3QgdGhlIGVuZCBvZiBhIFBURSB0YWJsZSB3aGVuIGEgbGFyZ2UgZm9s
aW8gc3BhbnMgYWNyb3NzIHR3byBQTURzLAo+PiBwYXJ0aWN1bGFybHkgYWZ0ZXIgYmVpbmcgcmVt
YXBwZWQgd2l0aCBtcmVtYXAoKS4gVGhpcyBwYXRjaCBmaXhlcyB0aGUKPj4gcG90ZW50aWFsIG91
dC1vZi1ib3VuZHMgYWNjZXNzIGJ5IGNhcHBpbmcgdGhlIGJhdGNoIGF0IHZtX2VuZCBhbmQgdGhl
IFBNRAo+PiBib3VuZGFyeS4KPj4KPj4gSXQgYWxzbyByZWZhY3RvcnMgdGhlIGxvZ2ljIGludG8g
YSBuZXcgaGVscGVyLCBmb2xpb191bm1hcF9wdGVfYmF0Y2goKSwKPj4gd2hpY2ggc3VwcG9ydHMg
YmF0Y2hpbmcgYmV0d2VlbiAxIGFuZCBmb2xpb19ucl9wYWdlcy4gVGhpcyBpbXByb3ZlcyBjb2Rl
Cj4+IGNsYXJpdHkuIE5vdGUgdGhhdCBzdWNoIGNhc2VzIGFyZSByYXJlIGluIHByYWN0aWNlLCBh
cyBNQURWX0ZSRUUgdHlwaWNhbGx5Cj4+IHNwbGl0cyBsYXJnZSBmb2xpb3MuCj4gCj4gU29ycnks
IEkgbWVhbnQgdGhhdCBNQURWX0ZSRUUgdHlwaWNhbGx5IHNwbGl0cyBsYXJnZSBmb2xpb3MgaWYg
dGhlIHNwZWNpZmllZAo+IHJhbmdlIGRvZXNuJ3QgY292ZXIgdGhlIGVudGlyZSBmb2xpby4KCkht
bS4uLiBJIGdvdCBpdCB3cm9uZyBhcyB3ZWxsIDooIEl0J3MgdGhlIHBhcnRpYWwgY292ZXJhZ2Ug
dGhhdCB0cmlnZ2VycyAKdGhlIHNwbGl0LgoKaG93IGFib3V0IHRoaXMgcmV2aXNlZCB2ZXJzaW9u
OgoKQXMgcG9pbnRlZCBvdXQgYnkgRGF2aWRbMV0sIHRoZSBiYXRjaGVkIHVubWFwIGxvZ2ljIGlu
IHRyeV90b191bm1hcF9vbmUoKQptYXkgcmVhZCBwYXN0IHRoZSBlbmQgb2YgYSBQVEUgdGFibGUg
d2hlbiBhIGxhcmdlIGZvbGlvIHNwYW5zIGFjcm9zcyB0d28KUE1EcywgcGFydGljdWxhcmx5IGFm
dGVyIGJlaW5nIHJlbWFwcGVkIHdpdGggbXJlbWFwKCkuIFRoaXMgcGF0Y2ggZml4ZXMKdGhlIHBv
dGVudGlhbCBvdXQtb2YtYm91bmRzIGFjY2VzcyBieSBjYXBwaW5nIHRoZSBiYXRjaCBhdCB2bV9l
bmQgYW5kIHRoZQpQTUQgYm91bmRhcnkuCgpJdCBhbHNvIHJlZmFjdG9ycyB0aGUgbG9naWMgaW50
byBhIG5ldyBoZWxwZXIsIGZvbGlvX3VubWFwX3B0ZV9iYXRjaCgpLAp3aGljaCBzdXBwb3J0cyBi
YXRjaGluZyBiZXR3ZWVuIDEgYW5kIGZvbGlvX25yX3BhZ2VzLiBUaGlzIGltcHJvdmVzIGNvZGUK
Y2xhcml0eS4gTm90ZSB0aGF0IHN1Y2ggYm91bmRhcnktc3RyYWRkbGluZyBjYXNlcyBhcmUgcmFy
ZSBpbiBwcmFjdGljZSwgYXMKTUFEVl9GUkVFIHdpbGwgdHlwaWNhbGx5IHNwbGl0IGEgbGFyZ2Ug
Zm9saW8gaWYgdGhlIGFkdmljZSByYW5nZSBkb2VzIG5vdApjb3ZlciB0aGUgZW50aXJlIGZvbGlv
LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
