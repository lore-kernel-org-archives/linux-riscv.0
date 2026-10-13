Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920C3CA9EC5
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 02:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2zNOuy4WLxhNSnBPl3Njd7DlFGBL3tSNTqKmNBsGXZo=; b=erUZwdiGCgh5Jj
	x2uQG9eBob8kwqSlOAZElX77A8T1zUuEE9nKfHv5jZGiUO9bu0BJjCGCDE1HGKVqafVxfsH5JJcpp
	vQ4yrOwvlPQS6NGfAaCvaG5vTbvNVM3ju/3WM57uzUxdDZowkpSYh+9l1xCarWlJgrV+3+bZvGA4K
	REdHVQC6NcmnFJMoA8972z0K6XBrB30L9qhlr4E7VlQzSPwTvT3t6bhVHy4R7T6l87ZujLuOp8DNO
	KboDkCg0fZoYYT24E9H3MbuDztBBgsSii4wKXHMrxeuuGTN8EIWnnJJ6wu7ADQvPYZK17Xa5i3lPK
	wcahfBKNV8xUA9mSFVCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSIQ-0000000BnuY-1W1N;
	Tue, 13 Oct 2026 02:31:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSIO-0000000BnuA-3BZK;
	Tue, 13 Oct 2026 02:31:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 84E03405C7;
	Tue, 13 Oct 2026 02:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3AE01F00893;
	Tue, 13 Oct 2026 02:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791858675;
	bh=neF1X1SW8f+CZ9aYnUdm8uqTfZ53Y+iDZ67qd/EFbto=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ex3bO/Fc0+ngjO39stCKwVk9Hhrd7Rifhq8ICQiBsfVb3HzvVvtZSrGzLxkxqd+0U
	 VLhJbkRlvRhudx0ySSyQeBPTjSDeHdu/kDYU/bsXoTKFOYkEV6o2q2M5XgxrDd31WQ
	 PGabwoaz3EcC7qUr+ttZxY9i9xXwWCFmuR7C0n1Q=
Date: Mon, 12 Oct 2026 19:31:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, Muchun Song
 <songmuchun@bytedance.com>, David Hildenbrand <david@kernel.org>, Oscar
 Salvador <osalvador@suse.de>, Dave Hansen <dave.hansen@intel.com>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?Qmo=?=
 =?UTF-8?B?w7ZybiBUw7ZwZWw=?= <bjorn@rivosinc.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] mm: fix missing page-table destructor in
 pagetable_free()
Message-Id: <20261012193114.77147e0a43affa8ee1ae896c@linux-foundation.org>
In-Reply-To: <145CD5DC-6457-4E1E-8B9D-AE7D1EDB0AB8@linux.dev>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
	<20261010112457.49485-2-songmuchun@bytedance.com>
	<asy-b7_C3SjnmSaS@gmail.com>
	<145CD5DC-6457-4E1E-8B9D-AE7D1EDB0AB8@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

T24gTW9uLCAxMiBPY3QgMjAyNiAyMDo1NTowNiArMDgwMCBNdWNodW4gU29uZyA8bXVjaHVuLnNv
bmdAbGludXguZGV2PiB3cm90ZToKCj4gCj4gCj4gPiBPbiBPY3QgMTIsIDIwMjYsIGF0IDE5OjE1
LCBKb3NlIEEuIFBlcmV6IGRlIEF6cGlsbGFnYSA8YXpwaWpyQGdtYWlsLmNvbT4gd3JvdGU6Cj4g
PiAKPiA+IE9uIFNhdCwgT2N0IDEwLCAyMDI2IGF0IDA3OjI0OjU0UE0gKzA4MDAsIE11Y2h1biBT
b25nIHdyb3RlOgo+ID4+IFNpbmNlIGNvbW1pdCA0OWY1OTk2NjY0MjAgKCJtbTogY2FsbCBjdG9y
L2R0b3IgZm9yIGtlcm5lbCBQVEVzIiksCj4gPj4gcHRlX2FsbG9jX29uZV9rZXJuZWwoKSBydW5z
IHRoZSBwYWdlLXRhYmxlIGNvbnN0cnVjdG9yIGZvciBrZXJuZWwgUFRFCj4gPj4gdGFibGVzLgo+
ID4+IAo+ID4+IEhWTyAoSHVnZVRMQiBWbWVtbWFwIE9wdGltaXphdGlvbikgdXNlcyBwdGVfYWxs
b2Nfb25lX2tlcm5lbCgpIHdoZW4KPiA+PiBzcGxpdHRpbmcgYSBQTUQuIFJlc3RvcmluZyB0aGUg
dm1lbW1hcCBiYWNraW5nIHBhZ2VzIGRvZXMgbm90IGNvbGxhcHNlCj4gPj4gdGhlIFBURSB0YWJs
ZSwgc28gYSBsYXRlciBtZW1vcnkgaG90LXJlbW92ZSBldmVudHVhbGx5IGZyZWVzIGl0IHRocm91
Z2gKPiA+PiBwYWdldGFibGVfZnJlZSgpIG9uIHg4Ni02NC4gVGhhdCByZWxlYXNlcyB0aGUgcGFn
ZSB3aXRob3V0IHJ1bm5pbmcgdGhlCj4gPj4gbWF0Y2hpbmcgZGVzdHJ1Y3RvciBhbmQgbGVhdmVz
IE5SX1BBR0VUQUJMRSBlbGV2YXRlZC4KPiA+PiAKPiA+PiBNYWtlIHBhZ2V0YWJsZV9mcmVlKCkg
ZGV0ZWN0IGNvbnN0cnVjdG9yLWJhY2tlZCBwYWdlcyBhbmQgcnVuIHRoZQo+ID4+IGRlc3RydWN0
b3IgYmVmb3JlIHJlbGVhc2luZyB0aGVpciBtZW1vcnkgdG8gZml4IHRoZSBwcm9ibGVtLgo+ID4+
IAo+ID4+IEZpeGVzOiA0OWY1OTk2NjY0MjAgKCJtbTogY2FsbCBjdG9yL2R0b3IgZm9yIGtlcm5l
bCBQVEVzIikKPiA+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gCj4gPiBpcyB0aGUg
eDg2IGNhc2UgY292ZXJlZCBmb3IgNi4xNi02LjE4PyBhcyBmYXIgYXMgSSBjYW4gc2VlLCB4ODYK
PiA+IGZyZWVfcGFnZXRhYmxlKCkgb25seSB1c2VzIHBhZ2V0YWJsZV9mcmVlKCkgc2luY2UgYmY5
ZTRlMzBmMzUzCj4gPiAoIng4Ni9tbTogdXNlIHBhZ2V0YWJsZV9mcmVlKCkiKSBpbiB2Ni4xOSwg
c28gdGhlIGJhY2twb3J0IHdvdWxkbid0Cj4gPiBjaGFuZ2UgYW55dGhpbmcgdGhlcmUuIG9yIGFt
IEkgbWlzc2luZyBzb21ldGhpbmc/Cj4gCj4gWWVzLCB5b3UgYXJlIGFic29sdXRlbHkgcmlnaHQg
4oCUIHRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcy4KPiAKPiBJIGRvdWJsZS1jaGVja2VkIGFuZCBp
bmRlZWQgeDg2J3MgZnJlZV9wYWdldGFibGUoKSBvbmx5IHN0YXJ0cyB1c2luZwo+IHBhZ2V0YWJs
ZV9mcmVlKCkgc2luY2UgYmY5ZTRlMzBmMzUzICgieDg2L21tOiB1c2UgcGFnZXRhYmxlX2ZyZWUo
KSIpLAo+IHdoaWNoIGxhbmRlZCBpbiB2Ni4xOS4gU28gZm9yIDYuMTYtNi4xOCB0aGUgcHJlcmVx
dWlzaXRlIGlzIG5vdCBwcmVzZW50Cj4gYW5kIHRoZSBiYWNrcG9ydCB3b3VsZCBiZSBhIG5vLW9w
IHRoZXJlLgo+IAo+IFRoZSBjb3JyZWN0IHRyYWlsZXIgaXM6Cj4gCj4gQ2M6IDxzdGFibGVAdmdl
ci5rZXJuZWwub3JnPiAjIDYuMTYtNi4xODogYmY5ZTRlMzBmMzUzOiB4ODYvbW06IHVzZSBwYWdl
dGFibGVfZnJlZSgpCj4gCj4gQW5kcmV3LCB3b3VsZCB5b3UgYmUgYWJsZSB0byB1cGRhdGUgdGhl
IHRyYWlsZXIgaW4gdGhlIHBhdGNoIHdoZW4geW91Cj4gcGljayBpdCB1cD8gSWYgdGhlcmUgYXJl
IGZ1cnRoZXIgcmV2aWV3IGNvbW1lbnRzIHRoYXQgcmVxdWlyZSBjb2RlCj4gY2hhbmdlcywgSSds
bCBmaXggdGhpcyB0cmFpbGVyIGFzIHBhcnQgb2YgdGhlIHYzIHJlc3Bpbi4gVGhhbmtzIGEgbG90
IQoKSSBkb24ndCBrbm93IGlmL2hvdyB0aGUgLXN0YWJsZSBtYWludGFpbmVycyBoYW5kbGUgYSBj
b21tZW50IGxpa2UgdGhhdC4KSSBleHBlY3QgaXQncyBtb3JlIHJlbGlhYmxlIHRvIGRvIHRoaXMg
dmlhIEZpeGVzOi4gIFBvc3NpYmxlPwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
