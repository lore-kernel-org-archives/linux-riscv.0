Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9E0CD4F3C
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 14:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pten25+49qrGHOdPQnv6Dt4tPeawky2AoqkZoX2y1s8=; b=lLY639+l/wyPhC
	oVXPlCNhIYAGkhWU29o6v71KsRPGe4XC7iJqRFB/o8IpugN3LpcEshPcIJ6sIhjau0+w6Ri/yUcC7
	F4WVXwwpVOIy3jLLqFZYlVGUuTNyA8+AsDGZ3ixFNEbCWWvg51s38R8zR4avmkoKE2XdxPsb9zN93
	pdXyI23LiNxaCavfSAdDQyEBmmg4A6ZuUZ3pk9a00/lEllWrb6SFeQLGupJIPBxplFySAK5YfCd+r
	DAW1EnD6wPh//TRYmmkkYLOH9jIaULIc2TG837f3NMPFGLZk0TmTGeEfK7DDqzKZfw0UQ/nRAfp8f
	+4dUmU4r9jOYXmhpbqAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLGc-00000001nIu-2iia;
	Tue, 19 May 2026 14:17:54 +0000
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLGV-00000001nH3-2Vp1;
	Tue, 19 May 2026 14:17:47 +0000
Date: Tue, 19 May 2026 10:17:34 -0400
From: "Liam R. Howlett" <liam@infradead.org>
To: Barry Song <baohua@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, vbabka@kernel.org, rppt@kernel.org, 
	mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, 
	chentao@kylinos.cn, lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, 
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <5zdaa5uv5oj27q3taopl3amops57ouxgyfsdveudz4ovmbdw7z@6lwrlyvmhcp2>
References: <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer>
 <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <CAGsJ_4zgeE3ebEJ+j7GJFzWVoVYHeiOn4dOoOsmWCLA6s=oECQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGsJ_4zgeE3ebEJ+j7GJFzWVoVYHeiOn4dOoOsmWCLA6s=oECQ@mail.gmail.com>
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

T24gMjYvMDUvMTkgMDU6MTRBTSwgQmFycnkgU29uZyB3cm90ZToKPiBPbiBUdWUsIE1heSAxOSwg
MjAyNiBhdCAzOjU34oCvQU0gU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgNDoyNuKAr0FNIEJhcnJ5IFNv
bmcgPGJhb2h1YUBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gTW9uLCBNYXkgMTgs
IDIwMjYgYXQgNTo0N+KAr1BNIExvcmVuem8gU3RvYWtlcyA8bGpzQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+ID4gPiA+Cj4gPiA+ID4gT24gU3VuLCBNYXkgMTcsIDIwMjYgYXQgMDQ6NDU6MTVQTSArMDgw
MCwgQmFycnkgU29uZyB3cm90ZToKPiBbLi4uXQo+ID4gPgo+ID4gPiBJIHRoaW5rIHdlIGVpdGhl
ciBuZWVkIHRvIGZpeCBgZm9yaygpYCwgb3Iga2VlcCB0aGUgY3VycmVudAo+ID4gPiBiZWhhdmlv
ciBvZiBkcm9wcGluZyB0aGUgVk1BIGxvY2sgYmVmb3JlIHBlcmZvcm1pbmcgSS9PLgo+ID4KPiA+
IEkgc2VlLiBTbywgdGhpcyBwcm9ibGVtIGFyaXNlcyBmcm9tIHRoZSBmYWN0IHRoYXQgd2UgYXJl
IGNoYW5naW5nIHRoZQo+ID4gcGFnZWZhdWx0cyByZXF1aXJpbmcgSS9PIG9wZXJhdGlvbiB0byBo
b2xkIFZNQSBsb2NrLi4uCj4gPiBBbmQgeW91IHdhbnQgdG8gbG9jayBWTUEgb24gZm9yayBvbmx5
IGlmIHZtYV9pc19hbm9ueW1vdXModm1hKSB8fAo+ID4gaXNfY293X21hcHBpbmcodm1hLT52bV9m
bGFncykuIFNvLCB3ZSB3aWxsIGJlIGJsb2NraW5nIHBhZ2UgZmF1bHRzIGZvcgo+ID4gYW5vbnlt
b3VzIGFuZCBDT1cgVk1BcyBvbmx5IHdoaWxlIGhvbGRpbmcgbW1hcF93cml0ZV9sb2NrLCBwcmV2
ZW50aW5nCj4gPiBhbnkgVk1BIG1vZGlmaWNhdGlvbi4gT24gdGhlIHN1cmZhY2UsIHRoYXQgbG9v
a3Mgb2sgdG8gbWUgYnV0IEkgbWlnaHQKPiA+IGJlIG1pc3Npbmcgc29tZSBjb3JuZXIgY2FzZXMu
IElmIG5vYm9keSBzZWVzIGFueSBvYnZpb3VzIGlzc3VlcywgSQo+ID4gdGhpbmsgaXQncyB3b3J0
aCBhIHRyeS4KCkZyb20gQmFycnkncyBkZXNjcmlwdGlvbiwgSSB0aGluayB3aGF0IGhlIGlzIHNh
eWluZyBpcyB0aGF0IHRoZSB2bWEKbG9ja2luZyBoYXMgY2F1c2VkIHRoZSBtbWFwX2xvY2sgdG8g
YmVjb21lIHVuZmFpcj8gIEkgdGhpbmsgd2hhdCBpcwppbXBsaWVkIGlzIHRoYXQgdGhlIHBlci12
bWEgbG9ja2luZyBtYXkgc3RhbGwgbW1hcF9sb2NrIHdyaXRlcyBmb3IKbG9uZ2VyIHRoYW4gaWYg
dGhlIG1tYXBfbG9jayB3YXMgdGFrZW4gaW4gcmVhZCBtb2RlPyAgQmFycnksIGlzIHRoYXQKY29y
cmVjdD8KClNpbmNlIEFuZHJvaWQgaXMgZG9pbmcgc29tZXRoaW5nIChhY2NvcmRpbmcgdG8gQmFy
cnkpIHRoYXQgc2hvdWxkIG5vdCBiZQpkb25lIChhY2NvcmRpbmcgdG8gV2lsbHkpLCBib3RoIG9m
IHRoZXNlIHRvZ2V0aGVyIGFyZSBjYXVzaW5nIHNsb3cgZG93bj8KCj4gCj4gVGhhbmtzLiBCZXNp
ZGVzIHRoZSBjcmVhdGlvbiBvZiBwcm9jZXNzZXMgdmlhIGZvcmsoKSwgSQo+IGFtIGFsc28gYmVn
aW5uaW5nIHRvIHdvcnJ5IGFib3V0IHRoZSBkZWF0aCBvZiBwcm9jZXNzZXMuCj4gCj4gT25lIHRo
aW5nIHRoYXQgY2FtZSB0byBteSBtaW5kIHRoaXMgbW9ybmluZwo+IGlzIHRoYXQgd2hlbiBsb3dt
ZW1vcnlraWxsZXIgZGVjaWRlcyB0byBraWxsIGFuIGFwcCwgd2UKPiB3YW50IHRoZSBtZW1vcnkg
dG8gYmUgcmVsZWFzZWQgYXMgcXVpY2tseSBhcyBwb3NzaWJsZSBzbwo+IHRoZSBuZXcgYXBwIG9y
IHVzZXIgc2NlbmFyaW8gY2FuIGdldCBtZW1vcnkgc29vbmVyLgo+IAo+IEluIHRoYXQgY2FzZSwg
aWYgdGhlIGFwcCBiZWluZyBraWxsZWQgaXMgcGVyZm9ybWluZyBJL08KPiB3aGlsZSBob2xkaW5n
IHRoZSBWTUEgbG9jaywgdGhlIHVubWFwcGluZyBwcm9jZWR1cmUKPiBjb3VsZCBlbmQgdXAgYmVp
bmcgYmxvY2tlZCBhcyB3ZWxsLgo+IAo+IElmIHdlIHJlbGVhc2UgdGhlIFZNQSBsb2NrIGFzIHdl
IGN1cnJlbnRseSBkbywgd2UgYWxsb3cKPiBwcm9jZXNzIGV4aXQgdG8gcHJvY2VlZC4KPiAKPiBJ
IGhhdmVuJ3QgdGhvdWdodCBpdCB0aHJvdWdoIHZlcnkgY2xlYXJseSB5ZXQsIGFuZCBJCj4gbWF5
IGJlIHdyb25nLiBJJ2QgbGlrZSB0byBkbyBtb3JlIGludmVzdGlnYXRpb24uIEkgaG9wZQo+IHRo
ZSBhcHBzIGJlaW5nIGtpbGxlZCBzdGF5IHZlcnkgc3RpbGwsIGJ1dCB3aG8ga25vd3PigJR3ZQo+
IGhhdmUgc28gbWFueSBhcHBsaWNhdGlvbnMgaW4gdGhlIG1hcmtldC4KPiAKPiBNZWFud2hpbGUs
IGlmIHlvdSBoYXZlIGFueSBjb21tZW50cyByZWdhcmRpbmcgdGhlIGRlYXRoCj4gb2YgcHJvY2Vz
c2VzLCB0aGV5IHdvdWxkIGJlIHZlcnkgd2VsY29tZS4KClRoZSBvb20ga2lsbGVyIG9ubHkgY2xl
YW5zIG91dCBhbm9uL25vdCBzaGFyZWQgdm1hcyBbMV0uICBTbywgd2hhdCB0aGlzCndvdWxkIGhv
bGQgdXAgd291bGQgYmUgdGhlIGFjdHVhbCBwcm9jZXNzIGV4aXQgcGF0aC4gIEFsdGhvdWdoIHRo
YXQKd291bGQgaGF2ZSByZXNvdXJjZXMgYXNzb2NpYXRlZCB3aXRoIGl0LCB0aGUgYW1vdW50IG9m
IHJlc291cmNlcyBzaG91bGQKYmUgcmVsYXRpdmVseSBsb3cgY29tcGFyZWQgdG8gdGhlIGFtb3Vu
dCBmcmVlZCBieSB0aGUgb29tIHJlYXBlciwgcmlnaHQ/CgpUaGUgb3RoZXIgZW50cnkgcG9pbnQg
dGhhdCdzIG1vc3RseSB0byBkbyB3aXRoIGFuZHJvaWQsCnByb2Nlc3NfbXJlbGVhc2UoKSBbMl0g
d2lsbCBlbmQgdXAgaW4gdGhlIHNhbWUgIF9fb29tX3JlYXBfdGFza19tbSgpCmZ1bmN0aW9uLgoK
U28sIGZvciB0aGUgbW9zdCBwYXJ0LCB0aGUgbWVtb3J5IHdpbGwgYmUgZnJlZWQgd2hpbGUgdGhl
IGZpbGUgYmFja2VkCnZtYSBjb21wbGV0ZXMgSU8gYW5kIHRoYXQgc291bmRzIGxpa2UgdGhlIHJp
Z2h0IHRoaW5nIHRvIGRvIGFueXdheXMuCgpUaGFua3MsCkxpYW0KClsxXS4gaHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvdjcuMS1yYzQvc291cmNlL21tL29vbV9raWxsLmMjTDU0Nwpb
Ml0uIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE4LjYvc291cmNlL21tL29v
bV9raWxsLmMjTDEyMTAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
