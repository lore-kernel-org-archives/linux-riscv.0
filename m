Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C76EC1EA6
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 11:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggj5gqAw3rwUWWlpChyYVAF152BKj3r3keOcp4HqYQk=; b=R7C+D6MU+A1t2d
	oRVGfuy035hUyi9adVQZxfDX0oFWVCOvqqv2in81mWwi+Za5FyG8SD2Hn7ITfOg5q94p7hPGuRkYi
	X/Qzr+tOYiuXoT1JjTKJBRjWsO41pywzKqZu88yvVdDz1oZuwuK+At1zqgX6jujQkvscmRRxrlcqO
	MDWZIJGg+cVmpmPwkXHc2k0TSbB3aoHZXOdaoK21OHAKOHRe5Igv/adPi9H4R+dfRH+249z51MbCe
	00h+4+MzeSNs2WaHZwLiykaxMja0/0u5W39dhSKbhPQBHY2D/CgQghVKHGmBvYKCYOJJUDD1aerAU
	PO8POLSkOU6fq/3pJN7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnxeS-00000009q3v-43FR;
	Thu, 05 Feb 2026 11:36:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnxeS-00000009q3p-18GB
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 11:36:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D6A260122;
	Thu,  5 Feb 2026 11:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E695BC4CEF7;
	Thu,  5 Feb 2026 11:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770291359;
	bh=3sMz1aXuuijzMsHvvObi2VXR9fx4WgEVichiU4CKZDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cu7s1t/w6916Ya6ixpS6ttgjpMI2URV57aNBympnofTya/gxFpRRp61I06akmavdL
	 eQu0GohOQWs/g6dXAoYwIi5nj7gz2j0M7LOYJZJ5sO9IqcKJrdbCLpskJNbMSlFWLX
	 UG82wzpZSIE1w8UVOTbUcAxsMVVkI/nPtrOynuoG/DJFIg48BaVfjnNV+Nmj2kH21A
	 EQ3LaZKgCM/XBi+WtrdE/qdIFQLWJC8TURH7/eQznHgVg9EwRXhzMmSgN1/e7LpGdL
	 He24meVNRkv/Ke8oXQ6sEJ2GN+y3q74OQtXvENKyJXDzJ3ctLSrOyGZyQdaKGC3nch
	 Pv/Wt/rESj1UQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id EDAACF4006C;
	Thu,  5 Feb 2026 06:35:56 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 05 Feb 2026 06:35:56 -0500
X-ME-Sender: <xms:nICEaW_GvSSBINXf0ofq_x-yLSb58h8Og9sxOg20LDUUqtVKPd2rGw>
    <xme:nICEaS84tMRreNW5lZJAPhpBScOsKOGhe6iSr3R_x1nVEK-b0PtH-38d0qQvhAlfd
    3s4NizCjv59vM_uLsgD3MC1EKHuXUlovGPmlKJdkjJUzkee04UF42Q>
X-ME-Received: <xmr:nICEaVquclR8ZwZTFgdXvcQmyteANYL9y2MDtUACN47OUj1NDZeNvAxb9eMqNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeehvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefmihhrhihl
    ucfuhhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeeigfdvtdekveejhfehtdduueeuieekjeekvdfggfdtkeegieevjedvgeetvdeh
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkih
    hrihhllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieeh
    hedqvdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovh
    drnhgrmhgvpdhnsggprhgtphhtthhopeehiedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepuggrvhhiugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghkphhmsehlih
    hnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehmuhgthhhunhdrshho
    nhhgsehlihhnuhigrdguvghvpdhrtghpthhtohepuggrvhhiugesrhgvughhrghtrdgtoh
    hmpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthho
    pehushgrmhgrrghrihhfieegvdesghhmrghilhdrtghomhdprhgtphhtthhopehfvhgulh
    esghhoohhglhgvrdgtohhmpdhrtghpthhtohepohhsrghlvhgrughorhesshhushgvrdgu
    vgdprhgtphhtthhopehrphhptheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:nICEaexJkDciWL0gFKUnWwSDONB_D9Vg9IWhiPLedXxhJBnzDgZGKg>
    <xmx:nICEaUn-QwjMmOgHFazrgt66R5nUW1MxGWRvDl-sNftjNrODSjgR2w>
    <xmx:nICEaanFFBKtYwPiT8WBYCH1FdMASU4t8LDB18cpKxTCSriwe6BV7g>
    <xmx:nICEaazz6wcm51a7dwkOdM8i3af2JSfws-k5O4hX_h4YlCy-sTkk0g>
    <xmx:nICEaRZub43Z5DZ1aTG6jE-RP89KGBpGg0cgqYFgv_KJH-iiJipqwpQ_>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Feb 2026 06:35:54 -0500 (EST)
Date: Thu, 5 Feb 2026 11:35:50 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>, 
	Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>, 
	Frank van der Linden <fvdl@google.com>, Oscar Salvador <osalvador@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCHv6 02/17] mm: Change the interface of prep_compound_tail()
Message-ID: <aYR-YULI3lBtl9y_@thinkstation>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-3-kas@kernel.org>
 <a61bc0a8-cf5a-418a-aeb4-96553b87f043@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a61bc0a8-cf5a-418a-aeb4-96553b87f043@kernel.org>
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

T24gV2VkLCBGZWIgMDQsIDIwMjYgYXQgMDU6MTQ6MTJQTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgKGFybSkgd3JvdGU6Cj4gT24gMi8yLzI2IDE2OjU2LCBLaXJ5bCBTaHV0c2VtYXUgd3JvdGU6
Cj4gPiBJbnN0ZWFkIG9mIHBhc3NpbmcgZG93biB0aGUgaGVhZCBwYWdlIGFuZCB0YWlsIHBhZ2Ug
aW5kZXgsIHBhc3MgdGhlIHRhaWwKPiA+IGFuZCBoZWFkIHBhZ2VzIGRpcmVjdGx5LCBhcyB3ZWxs
IGFzIHRoZSBvcmRlciBvZiB0aGUgY29tcG91bmQgcGFnZS4KPiA+IAo+ID4gVGhpcyBpcyBhIHBy
ZXBhcmF0aW9uIGZvciBjaGFuZ2luZyBob3cgdGhlIGhlYWQgcG9zaXRpb24gaXMgZW5jb2RlZCBp
bgo+ID4gdGhlIHRhaWwgcGFnZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogS2lyeWwgU2h1dHNl
bWF1IDxrYXNAa2VybmVsLm9yZz4KPiA+IFJldmlld2VkLWJ5OiBNdWNodW4gU29uZyA8bXVjaHVu
LnNvbmdAbGludXguZGV2Pgo+ID4gUmV2aWV3ZWQtYnk6IFppIFlhbiA8eml5QG52aWRpYS5jb20+
Cj4gPiAtLS0KPiA+ICAgaW5jbHVkZS9saW51eC9wYWdlLWZsYWdzLmggfCAgNCArKystCj4gPiAg
IG1tL2h1Z2V0bGIuYyAgICAgICAgICAgICAgIHwgIDggKysrKystLS0KPiA+ICAgbW0vaW50ZXJu
YWwuaCAgICAgICAgICAgICAgfCAxMiArKysrKystLS0tLS0KPiA+ICAgbW0vbW1faW5pdC5jICAg
ICAgICAgICAgICAgfCAgMiArLQo+ID4gICBtbS9wYWdlX2FsbG9jLmMgICAgICAgICAgICB8ICAy
ICstCj4gPiAgIDUgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25z
KC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3BhZ2UtZmxhZ3MuaCBiL2lu
Y2x1ZGUvbGludXgvcGFnZS1mbGFncy5oCj4gPiBpbmRleCBmN2EwZTRhZjBjNzMuLjhhMzY5NDM2
OWUxNSAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvcGFnZS1mbGFncy5oCj4gPiArKysg
Yi9pbmNsdWRlL2xpbnV4L3BhZ2UtZmxhZ3MuaAo+ID4gQEAgLTg2NSw3ICs4NjUsOSBAQCBzdGF0
aWMgaW5saW5lIGJvb2wgZm9saW9fdGVzdF9sYXJnZShjb25zdCBzdHJ1Y3QgZm9saW8gKmZvbGlv
KQo+ID4gICAJcmV0dXJuIGZvbGlvX3Rlc3RfaGVhZChmb2xpbyk7Cj4gPiAgIH0KPiA+IC1zdGF0
aWMgX19hbHdheXNfaW5saW5lIHZvaWQgc2V0X2NvbXBvdW5kX2hlYWQoc3RydWN0IHBhZ2UgKnBh
Z2UsIHN0cnVjdCBwYWdlICpoZWFkKQo+ID4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBz
ZXRfY29tcG91bmRfaGVhZChzdHJ1Y3QgcGFnZSAqcGFnZSwKPiA+ICsJCQkJCSAgICAgIGNvbnN0
IHN0cnVjdCBwYWdlICpoZWFkLAo+ID4gKwkJCQkJICAgICAgdW5zaWduZWQgaW50IG9yZGVyKQo+
IAo+IFR3byB0YWIgaW5kZW50cyBwbGVhc2Ugb24gc2Vjb25kKyBwYXJhbWV0ZXIgbGlzdCB3aGVu
ZXZlciB5b3UgdG91Y2ggY29kZS4KCkRvIHdlIGhhdmUgdGhpcyBjb2Rpbmcgc3R5bGUgcHJlZmVy
ZW5jZSB3cml0dGVuIGRvd24gc29tZXdoZXJlPwoKLXRpcCB0cmVlIHdhbnRzIHRoZSBvcHBvc2l0
ZS4gRG9jdW1lbnRhdGlvbi9wcm9jZXNzL21haW50YWluZXItdGlwLnJzdDoKCglXaGVuIHNwbGl0
dGluZyBmdW5jdGlvbiBkZWNsYXJhdGlvbnMgb3IgZnVuY3Rpb24gY2FsbHMsIHRoZW4gcGxlYXNl
IGFsaWduCgl0aGUgZmlyc3QgYXJndW1lbnQgaW4gdGhlIHNlY29uZCBsaW5lIHdpdGggdGhlIGZp
cnN0IGFyZ3VtZW50IGluIHRoZSBmaXJzdAoJbGluZTo6CgpJIHdhbnQgdGhlIGVkaXRvciB0byBk
byBUaGUgUmlnaHQgVGhpbmfihKIgd2l0aG91dCBteSBicmFpbiBpbnZvbHZlbWVudC4KSGF2aW5n
IGRpZmZlcmVudCBjb2Rpbmcgc3R5bGVzIGluIGRpZmZlcmVudCBjb3JuZXJzIG9mIHRoZSBrZXJu
ZWwgbWFrZXMKaXQgaGFyZC4KCj4gCj4gPiAgIHsKPiA+ICAgCVdSSVRFX09OQ0UocGFnZS0+Y29t
cG91bmRfaGVhZCwgKHVuc2lnbmVkIGxvbmcpaGVhZCArIDEpOwo+ID4gICB9Cj4gPiBkaWZmIC0t
Z2l0IGEvbW0vaHVnZXRsYi5jIGIvbW0vaHVnZXRsYi5jCj4gPiBpbmRleCA2ZTg1NWEzMmRlM2Qu
LjU0YmE3Y2QwNWE4NiAxMDA2NDQKPiAKPiAKPiBbLi4uXQo+IAo+ID4gZGlmZiAtLWdpdCBhL21t
L2ludGVybmFsLmggYi9tbS9pbnRlcm5hbC5oCj4gPiBpbmRleCBkNjdlOGJiNzU3MzQuLjAzN2Rk
Y2RhMjVmZiAxMDA2NDQKPiA+IC0tLSBhL21tL2ludGVybmFsLmgKPiA+ICsrKyBiL21tL2ludGVy
bmFsLmgKPiA+IEBAIC04NzksMTMgKzg3OSwxMyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcHJlcF9j
b21wb3VuZF9oZWFkKHN0cnVjdCBwYWdlICpwYWdlLCB1bnNpZ25lZCBpbnQgb3JkZXIpCj4gPiAg
IAkJSU5JVF9MSVNUX0hFQUQoJmZvbGlvLT5fZGVmZXJyZWRfbGlzdCk7Cj4gPiAgIH0KPiA+IC1z
dGF0aWMgaW5saW5lIHZvaWQgcHJlcF9jb21wb3VuZF90YWlsKHN0cnVjdCBwYWdlICpoZWFkLCBp
bnQgdGFpbF9pZHgpCj4gPiArc3RhdGljIGlubGluZSB2b2lkIHByZXBfY29tcG91bmRfdGFpbChz
dHJ1Y3QgcGFnZSAqdGFpbCwKPiAKPiBKdXN0IHdvbmRlcmluZyB3aGV0aGVyIHdlIHNob3VsZCBj
YWxsIHRoaXMgInN0cnVjdCBwYWdlICpwYWdlIiBmb3IKPiBjb25zaXN0ZW5jeSB3aXRoIHNldF9j
b21wb3VuZF9oZWFkKCkuCj4gCj4gT3IgYWx0ZXJuYXRpdmVseSwgY2FsbCBpdCBhbHNvICJ0YWls
IiBpbiBzZXRfY29tcG91bmRfaGVhZCgpLgoKSSB3aWxsIHRha2UgdGhlIGFsdGVybmF0aXZlIHBh
dGggOikKCj4gCj4gPiArCQkJCSAgICAgIGNvbnN0IHN0cnVjdCBwYWdlICpoZWFkLAo+ID4gKwkJ
CQkgICAgICB1bnNpZ25lZCBpbnQgb3JkZXIpCj4gCj4gVHdvIHRhYiBpbmRlbnQsIHRoZW4gdGhp
cyBmaXRzIGludG8gdHdvIGxpbmVzIGluIHRvdGFsLgo+IAo+ID4gICB7Cj4gPiAtCXN0cnVjdCBw
YWdlICpwID0gaGVhZCArIHRhaWxfaWR4Owo+ID4gLQo+ID4gLQlwLT5tYXBwaW5nID0gVEFJTF9N
QVBQSU5HOwo+ID4gLQlzZXRfY29tcG91bmRfaGVhZChwLCBoZWFkKTsKPiA+IC0Jc2V0X3BhZ2Vf
cHJpdmF0ZShwLCAwKTsKPiA+ICsJdGFpbC0+bWFwcGluZyA9IFRBSUxfTUFQUElORzsKPiA+ICsJ
c2V0X2NvbXBvdW5kX2hlYWQodGFpbCwgaGVhZCwgb3JkZXIpOwo+ID4gKwlzZXRfcGFnZV9wcml2
YXRlKHRhaWwsIDApOwo+ID4gICB9Cj4gT25seSBuaXRzLCBpbiBnZW5lcmFsIExHVE0KPiAKPiBB
Y2tlZC1ieTogRGF2aWQgSGlsZGVuYnJhbmQgKGFybSkgPGRhdmlkQGtlcm5lbC5vcmc+CgpUaGFu
a3MhCgotLSAKICBLaXJ5bCBTaHV0c2VtYXUgLyBLaXJpbGwgQS4gU2h1dGVtb3YKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
