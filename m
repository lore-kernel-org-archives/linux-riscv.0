Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E88C61DB8
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+oPbcpq8/eCFM+jgoCNtLDaxOas54/otIko/7nUbteg=; b=NawfFIYgm3z37y
	v3wvtcb2yhzRH+jkidBMzgC15onu4K/XZ/RDkiR7m+GGWfsWXr6sK7qxbudqQxHewpzEKeREQNfyP
	0DPagdpgUkaaY1vKH/MQg6tMLDmB32ZzKZ0+oDAtbCXAsSnynyu6CPVwfsfAWLsHk+FYs397Bbnvv
	ZFCN7OHvCOozmTPTW1ZjCmrPpNhY4BsJJ/h+N/0/6BXEifY+i3vopi+Zu4bfHDlP/394O/s9eM+DQ
	E4FqYDqMxo4xZj6QZDCTkYFDR4+ILsYTyPBaguIWjUY8uR0WdxIQRqvOAKdeMSOpMMt03Uw6fJmvs
	bvnJ6HSawuKwkMUZknyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjju-0000000Cvg5-3lee;
	Wed, 04 Jun 2025 08:44:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMj9a-0000000Cqb3-06o7
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 08:07:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 589AFA50155;
	Wed,  4 Jun 2025 08:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A0AC4CEE7;
	Wed,  4 Jun 2025 08:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749024437;
	bh=yhf7uIemDFvOFZs2ab9B2tbrEfAJeioCFyGpvougiYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UkoN+a3zAHKzxBIHiRC/IlPuT0QSuatYT+VGDnR+NiAJTDjSYu7ZxSKc6OtO3Sjnm
	 p9OKsigQudSpIeAXqCHw/58NONlyuoRuEXMP3isFFcNjqKiLC1mfn0HvwTt6lVdy2J
	 W5V6zRyyi7KgHPk9CsPgnCjTZSvT9Y6yl9RO+baEI1r3bqZC8IO3brMlu8pGr5dQlB
	 JJuNJ+yyDgAz/Ro7+eGjf3MrBrzlv9RVLswj2/I0pUN8Ae1nA0CzPMWIV49FLAj2dX
	 ovNfHEuBbIS2qc7uGqlkuB7GuYGHvg9vuitN6/j5zZhFB8kPoIC4zmvLHgUU15nvUt
	 qEKucBZNRJ20g==
Date: Wed, 4 Jun 2025 11:07:05 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Barry Song <baohua@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jann Horn <jannh@google.com>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH RESEND] mm/pagewalk: split walk_page_range_novma() into
 kernel/user parts
Message-ID: <aD_-qdg2OvKQIyRg@kernel.org>
References: <20250603192213.182931-1-lorenzo.stoakes@oracle.com>
 <51ec4269-b132-4163-9cb5-766042a3769d@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51ec4269-b132-4163-9cb5-766042a3769d@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_010718_195896_31E78A96 
X-CRM114-Status: GOOD (  29.10  )
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

T24gV2VkLCBKdW4gMDQsIDIwMjUgYXQgMDk6Mzk6MzBBTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gT24gMDMuMDYuMjUgMjE6MjIsIExvcmVuem8gU3RvYWtlcyB3cm90ZToKPiA+
IFRoZSB3YWxrX3BhZ2VfcmFuZ2Vfbm92bWEoKSBmdW5jdGlvbiBpcyByYXRoZXIgY29uZnVzaW5n
IC0gaXQgc3VwcG9ydHMgdHdvCj4gPiBtb2Rlcywgb25lIHVzZWQgb2Z0ZW4sIHRoZSBvdGhlciB1
c2VkIG9ubHkgZm9yIGRlYnVnZ2luZy4KPiA+IAo+ID4gVGhlIGZpcnN0IG1vZGUgaXMgdGhlIGNv
bW1vbiBjYXNlIG9mIHRyYXZlcnNhbCBvZiBrZXJuZWwgcGFnZSB0YWJsZXMsIHdoaWNoCj4gPiBp
cyB3aGF0IG5lYXJseSBhbGwgY2FsbGVycyB1c2UgdGhpcyBmb3IuCj4gCj4gLi4uIGFuZCB3aGF0
IHBlb3BsZSBzaG91bGQgYmUgdXNpbmcgaXQgZm9yIPCfmYIKPiAKPiA+IAo+ID4gU2Vjb25kbHkg
aXQgcHJvdmlkZXMgYW4gdW51c3VhbCBkZWJ1Z2dpbmcgaW50ZXJmYWNlIHRoYXQgYWxsb3dzIGZv
ciB0aGUKPiA+IHRyYXZlcnNhbCBvZiBwYWdlIHRhYmxlcyBpbiBhIHVzZXJsYW5kIHJhbmdlIG9m
IG1lbW9yeSBldmVuIGZvciB0aGF0IG1lbW9yeQo+ID4gd2hpY2ggaXMgbm90IGRlc2NyaWJlZCBi
eSBhIFZNQS4KPiA+IAo+ID4gVGhpcyBpcyBoaWdobHkgdW51c3VhbCBhbmQgaXQgaXMgZmFyIGZy
b20gY2VydGFpbiB0aGF0IHN1Y2ggcGFnZSB0YWJsZXMKPiA+IHNob3VsZCBldmVuIGV4aXN0LCBi
dXQgcGVyaGFwcyB0aGlzIGlzIHByZWNpc2VseSB3aHkgaXQgaXMgdXNlZnVsIGFzIGEKPiA+IGRl
YnVnZ2luZyBtZWNoYW5pc20uCj4gPiAKPiA+IEFzIGEgcmVzdWx0LCB0aGlzIGlzIHV0aWxpc2Vk
IGJ5IHB0ZHVtcCBvbmx5LiBIaXN0b3JpY2FsbHksIHRoaW5ncyB3ZXJlCj4gPiByZXZlcnNlZCAt
IHB0ZHVtcCB3YXMgdGhlIG9ubHkgdXNlciwgYW5kIG90aGVyIHBhcnRzIG9mIHRoZSBrZXJuZWwg
ZXZvbHZlZAo+ID4gdG8gdXNlIHRoZSBrZXJuZWwgcGFnZSB0YWJsZSB3YWxraW5nIGhlcmUuCj4g
PiAKPiA+IFNpbmNlIHdlIGhhdmUgc29tZSBjb21wbGljYXRlZCBhbmQgY29uZnVzaW5nIGxvY2tp
bmcgcnVsZXMgZm9yIHRoZSBub3ZtYQo+ID4gY2FzZSwgaXQgbWFrZXMgc2Vuc2UgdG8gc2VwYXJh
dGUgdGhlIHR3byB1c2FnZXMgaW50byB0aGVpciBvd24gZnVuY3Rpb25zLgo+ID4gCj4gPiBEb2lu
ZyB0aGlzIGFsc28gcHJvdmlkZSBzZWxmLWRvY3VtZW50YXRpb24gYXMgdG8gdGhlIGludGVudCBv
ZiB0aGUgY2FsbGVyIC0KPiA+IGFyZSB0aGV5IGRvaW5nIHNvbWV0aGluZyByYXRoZXIgdW51c3Vh
bCBvciBhcmUgdGhleSBzaW1wbHkgZG9pbmcgYSBzdGFuZGFyZAo+ID4ga2VybmVsIHBhZ2UgdGFi
bGUgd2Fsaz8KPiA+IAo+ID4gV2UgdGhlcmVmb3JlIG1haW50YWluIHdhbGtfcGFnZV9yYW5nZV9u
b3ZtYSgpIGZvciB0aGlzIHNpbmdsZSB1c2FnZSwgYW5kCj4gPiBkb2N1bWVudCB0aGUgZnVuY3Rp
b24gYXMgc3VjaC4KPiAKPiBJZiB3ZSBoYXZlIHRvIGtlZXAgdGhpcyBkYW5nZXJvdXMgaW50ZXJm
YWNlLCBpdCBzaG91bGQgcHJvYmFibHkgYmUKPiAKPiB3YWxrX3BhZ2VfcmFuZ2VfZGVidWcoKSBv
ciB3YWxrX3BhZ2VfcmFuZ2VfZHVtcCgpCgpXZSBjYW4gYWxzbyBtb3ZlIGl0IGZyb20gaW5jbHVk
ZS9saW51eC9wYWdld2Fsay5oIHRvIG1tL2ludGVybmFsLmgKIAo+ID4gCj4gPiBOb3RlIHRoYXQg
cHRkdW1wIHVzZXMgdGhlIHByZWNpc2Ugc2FtZSBmdW5jdGlvbiBmb3Iga2VybmVsIHdhbGtpbmcg
YXMgYQo+ID4gY29udmVuaWVuY2UsIHNvIHdlIHBlcm1pdCB0aGlzIGJ1dCBtYWtlIGl0IHZlcnkg
ZXhwbGljaXQgYnkgaGF2aW5nCj4gPiB3YWxrX3BhZ2VfcmFuZ2Vfbm92bWEoKSBpbnZva2Ugd2Fs
a19wYWdlX3JhbmdlX2tlcm5lbCgpIGluIHRoaXMgY2FzZS4KPiA+IAo+ID4gV2UgaW50cm9kdWNl
IHdhbGtfcGFnZV9yYW5nZV9rZXJuZWwoKSBmb3IgdGhlIGZhciBtb3JlIGNvbW1vbiBjYXNlIG9m
Cj4gPiBrZXJuZWwgcGFnZSB0YWJsZSB0cmF2ZXJzYWwuCj4gCj4gSSB3b25kZXIgaWYgd2Ugc2hv
dWxkIGdpdmUgaXQgYSBjb21wbGV0ZWx5IGRpZmZlcmVudCBuYW1lIHNjaGVtZSB0bwo+IGhpZ2hs
aWdodCB0aGF0IHRoaXMgaXMgc29tZXRoaW5nIGNvbXBsZXRlbHkgZGlmZmVyZW50Lgo+IAo+IHdh
bGtfa2VybmVsX3BhZ2VfdGFibGVfcmFuZ2UoKQo+IAo+IGV0Yy4KPiAKPiAKPiAtLSAKPiBDaGVl
cnMsCj4gCj4gRGF2aWQgLyBkaGlsZGVuYgo+IAoKLS0gClNpbmNlcmVseSB5b3VycywKTWlrZS4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
