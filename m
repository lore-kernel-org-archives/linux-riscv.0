Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C2DCA9ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 12:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJcOnVFw0zBIKZUr+sR+Py2exSZFSnxgLxZ+NMRN7fw=; b=yqVbJyl/lgp3wl
	lsvg3NjuZzPCZFxeBAfbgoLzoRTJLRMy+X2YOki6caCOKMEuookirTN/IrAZnRlG587rgoU1ogLhq
	cbuDSOA+nWqkPpSxaYUEiqUbpaWLv9Ega9ItSGjcfxLuAm2Q10m0C4QFfSQdRB7UM5n4Y50wDp0Xu
	cDhsfWUNwPLKh5TkHYn/H3EGdxH0HwA1uGRzGtnPxx2s1jIGY8izY4drjfY7BXeAJlrFkbZGlqOgq
	wO5ySJblJcqnO/1zmhsCTaYOPj4gDitennv30IRD946ylh7hPGEzzu59MbUvT6S1aGdQnShiQqbXD
	dv3pYOsZ01w+mwgPnvTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFZP-0000000AVZP-2YEI;
	Mon, 12 Oct 2026 12:55:59 +0000
Received: from out-72.mta1.migadu.com ([2001:41d0:203:375::48] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFZM-0000000AVYW-1HHQ
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 12:55:58 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=zVdDm9vWio9URlOBbk5H1FhupUhm6ZtZOBzYo8Bfqf8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791809752; v=1; x=1792414552;
 b=XAu/7C3rb/MZ5dpABy25laQ+yvYFKm3jheT5YLO5dLGM8GxZNKSkbbWwuhJ9SEenvzOqbKe+
 0YxDDs/UTQYCjF5V5k4VSp8AhWwcF4nVcYAW6TY0rLP0PqMN9sj3YrGtoc3RhOdNrYZ7YO3XjJi
 GbkgpeK1G0tNxMZ7rEWHlVR4=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta11.migadu.com with ESMTPS id 018eb001ca5c019a;
	Mon, 12 Oct 2026 12:55:25 +0000
X-Mizu-Trace-ID: 018eb001ca5c019a
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 1/4] mm: fix missing page-table destructor in
 pagetable_free()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <asy-b7_C3SjnmSaS@gmail.com>
Date: Mon, 12 Oct 2026 20:55:06 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Dave Hansen <dave.hansen@intel.com>,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org,
 linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Message-Id: <145CD5DC-6457-4E1E-8B9D-AE7D1EDB0AB8@linux.dev>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-2-songmuchun@bytedance.com>
 <asy-b7_C3SjnmSaS@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_055557_200906_3276771E 
X-CRM114-Status: GOOD (  13.25  )
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

Cgo+IE9uIE9jdCAxMiwgMjAyNiwgYXQgMTk6MTUsIEpvc2UgQS4gUGVyZXogZGUgQXpwaWxsYWdh
IDxhenBpanJAZ21haWwuY29tPiB3cm90ZToKPiAKPiBPbiBTYXQsIE9jdCAxMCwgMjAyNiBhdCAw
NzoyNDo1NFBNICswODAwLCBNdWNodW4gU29uZyB3cm90ZToKPj4gU2luY2UgY29tbWl0IDQ5ZjU5
OTY2NjQyMCAoIm1tOiBjYWxsIGN0b3IvZHRvciBmb3Iga2VybmVsIFBURXMiKSwKPj4gcHRlX2Fs
bG9jX29uZV9rZXJuZWwoKSBydW5zIHRoZSBwYWdlLXRhYmxlIGNvbnN0cnVjdG9yIGZvciBrZXJu
ZWwgUFRFCj4+IHRhYmxlcy4KPj4gCj4+IEhWTyAoSHVnZVRMQiBWbWVtbWFwIE9wdGltaXphdGlv
bikgdXNlcyBwdGVfYWxsb2Nfb25lX2tlcm5lbCgpIHdoZW4KPj4gc3BsaXR0aW5nIGEgUE1ELiBS
ZXN0b3JpbmcgdGhlIHZtZW1tYXAgYmFja2luZyBwYWdlcyBkb2VzIG5vdCBjb2xsYXBzZQo+PiB0
aGUgUFRFIHRhYmxlLCBzbyBhIGxhdGVyIG1lbW9yeSBob3QtcmVtb3ZlIGV2ZW50dWFsbHkgZnJl
ZXMgaXQgdGhyb3VnaAo+PiBwYWdldGFibGVfZnJlZSgpIG9uIHg4Ni02NC4gVGhhdCByZWxlYXNl
cyB0aGUgcGFnZSB3aXRob3V0IHJ1bm5pbmcgdGhlCj4+IG1hdGNoaW5nIGRlc3RydWN0b3IgYW5k
IGxlYXZlcyBOUl9QQUdFVEFCTEUgZWxldmF0ZWQuCj4+IAo+PiBNYWtlIHBhZ2V0YWJsZV9mcmVl
KCkgZGV0ZWN0IGNvbnN0cnVjdG9yLWJhY2tlZCBwYWdlcyBhbmQgcnVuIHRoZQo+PiBkZXN0cnVj
dG9yIGJlZm9yZSByZWxlYXNpbmcgdGhlaXIgbWVtb3J5IHRvIGZpeCB0aGUgcHJvYmxlbS4KPj4g
Cj4+IEZpeGVzOiA0OWY1OTk2NjY0MjAgKCJtbTogY2FsbCBjdG9yL2R0b3IgZm9yIGtlcm5lbCBQ
VEVzIikKPj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiAKPiBpcyB0aGUgeDg2IGNhc2Ug
Y292ZXJlZCBmb3IgNi4xNi02LjE4PyBhcyBmYXIgYXMgSSBjYW4gc2VlLCB4ODYKPiBmcmVlX3Bh
Z2V0YWJsZSgpIG9ubHkgdXNlcyBwYWdldGFibGVfZnJlZSgpIHNpbmNlIGJmOWU0ZTMwZjM1Mwo+
ICgieDg2L21tOiB1c2UgcGFnZXRhYmxlX2ZyZWUoKSIpIGluIHY2LjE5LCBzbyB0aGUgYmFja3Bv
cnQgd291bGRuJ3QKPiBjaGFuZ2UgYW55dGhpbmcgdGhlcmUuIG9yIGFtIEkgbWlzc2luZyBzb21l
dGhpbmc/CgpZZXMsIHlvdSBhcmUgYWJzb2x1dGVseSByaWdodCDigJQgdGhhbmtzIGZvciBjYXRj
aGluZyB0aGlzLgoKSSBkb3VibGUtY2hlY2tlZCBhbmQgaW5kZWVkIHg4NidzIGZyZWVfcGFnZXRh
YmxlKCkgb25seSBzdGFydHMgdXNpbmcKcGFnZXRhYmxlX2ZyZWUoKSBzaW5jZSBiZjllNGUzMGYz
NTMgKCJ4ODYvbW06IHVzZSBwYWdldGFibGVfZnJlZSgpIiksCndoaWNoIGxhbmRlZCBpbiB2Ni4x
OS4gU28gZm9yIDYuMTYtNi4xOCB0aGUgcHJlcmVxdWlzaXRlIGlzIG5vdCBwcmVzZW50CmFuZCB0
aGUgYmFja3BvcnQgd291bGQgYmUgYSBuby1vcCB0aGVyZS4KClRoZSBjb3JyZWN0IHRyYWlsZXIg
aXM6CgpDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgNi4xNi02LjE4OiBiZjllNGUzMGYz
NTM6IHg4Ni9tbTogdXNlIHBhZ2V0YWJsZV9mcmVlKCkKCkFuZHJldywgd291bGQgeW91IGJlIGFi
bGUgdG8gdXBkYXRlIHRoZSB0cmFpbGVyIGluIHRoZSBwYXRjaCB3aGVuIHlvdQpwaWNrIGl0IHVw
PyBJZiB0aGVyZSBhcmUgZnVydGhlciByZXZpZXcgY29tbWVudHMgdGhhdCByZXF1aXJlIGNvZGUK
Y2hhbmdlcywgSSdsbCBmaXggdGhpcyB0cmFpbGVyIGFzIHBhcnQgb2YgdGhlIHYzIHJlc3Bpbi4g
VGhhbmtzIGEgbG90IQoKVGhhbmtzLApNdWNodW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
