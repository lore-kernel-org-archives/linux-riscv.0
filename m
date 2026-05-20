Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C650CD4F5E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 07:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A2qctZ4YrtyfNNh0BX56JLSqIK/F7eM6nCcY3YM5XRo=; b=EH6M8muCujEiQg
	E13GBGI+rZDHAFwV51OgIlfotNq8Z9ZPEno0PtwiRiyqdIx4y+PuUoqFB3O9Wnos+q45kd9JwwbNL
	dJ88CfsORsz8bpdJsMI2+9nVF4V+LyJBtJOA3OKulo5tPz2SnUSt1kiwfxsL6NFkmQOhZt6KLT9oA
	zBodN6Lne3ZUBkjBri6dOnv7bnOgGaC346ov9eX0kNt3o4pFqbA83V7uXpbU1DgJHp4qqOHFukiqe
	HETZpAsWWihQqP5zGOkPhxjkKm2TBgHcMJIRTzeHWImkpC2opGPNYgHaOZqzaJoVp7iq4qeveGBC7
	fdr22B2Ai8n6dHcLtxSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbhE-00000003r6H-0t8h;
	Wed, 20 May 2026 07:50:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbhB-00000003r55-0pht;
	Wed, 20 May 2026 07:50:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B429431C9;
	Wed, 20 May 2026 07:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B43D1F00893;
	Wed, 20 May 2026 07:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779263424;
	bh=8h8QzQ3bvGW1O7RXX739a+wEI+Rm3n1kyOMDOPSvEn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gEybL7aBm3ng+QrbW0I+5Hs8oWbvhLnqN9+2v+IeAKE9ieM9FaKfZzY/r0KtvGAMv
	 UlbzgbPaCjqJHKsyF34JuP43LJBXrfZAZzHDm+DgqhrfaYDvVdJKPK2wZl0LGe4aDV
	 DBmnddYsaubogT9yRSf7C3WuNGyGQjd901PXhgvoWTTKLjmCjQCIVi1K4OqAzSKlXj
	 61TWkO1lsLpElgwhATl1xyR4ojLPcrMK/IY8eJJgK50WvGOcidhzXThsmufAMeqiFt
	 PseREKIwrtV7FeW3hPz53msuOkY9tNmm/x3Njh/sOFlQGLBEaSTgEbViYdNEZovb3M
	 9u5XlFtsz9bdw==
Date: Wed, 20 May 2026 08:50:14 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Barry Song <baohua@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, 
	Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, bhe@redhat.com, 
	youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <ag1mk2DSJsiORaxK@lucifer>
References: <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer>
 <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <agxbq1TxJdniMQT3@lucifer>
 <CAGsJ_4zxyZP_xkFCGWfLyXkqomrX6DNqyMVirk=aggtwB1zExw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGsJ_4zxyZP_xkFCGWfLyXkqomrX6DNqyMVirk=aggtwB1zExw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_005025_281184_92F98EBD 
X-CRM114-Status: GOOD (  37.17  )
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

T24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgMDU6MTg6NTJBTSArMDgwMCwgQmFycnkgU29uZyB3cm90
ZToKPiBPbiBUdWUsIE1heSAxOSwgMjAyNiBhdCA4OjUz4oCvUE0gTG9yZW56byBTdG9ha2VzIDxs
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgMTI6
NTY6NTlQTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2FyeWFuIHdyb3RlOgo+ID4KPiA+ID4gPgo+ID4g
PiA+IEkgdGhpbmsgd2UgZWl0aGVyIG5lZWQgdG8gZml4IGBmb3JrKClgLCBvciBrZWVwIHRoZSBj
dXJyZW50Cj4gPiA+ID4gYmVoYXZpb3Igb2YgZHJvcHBpbmcgdGhlIFZNQSBsb2NrIGJlZm9yZSBw
ZXJmb3JtaW5nIEkvTy4KPiA+ID4KPiA+ID4gSSBzZWUuIFNvLCB0aGlzIHByb2JsZW0gYXJpc2Vz
IGZyb20gdGhlIGZhY3QgdGhhdCB3ZSBhcmUgY2hhbmdpbmcgdGhlCj4gPiA+IHBhZ2VmYXVsdHMg
cmVxdWlyaW5nIEkvTyBvcGVyYXRpb24gdG8gaG9sZCBWTUEgbG9jay4uLgo+ID4gPiBBbmQgeW91
IHdhbnQgdG8gbG9jayBWTUEgb24gZm9yayBvbmx5IGlmIHZtYV9pc19hbm9ueW1vdXModm1hKSB8
fAo+ID4gPiBpc19jb3dfbWFwcGluZyh2bWEtPnZtX2ZsYWdzKS4gU28sIHdlIHdpbGwgYmUgYmxv
Y2tpbmcgcGFnZSBmYXVsdHMgZm9yCj4gPiA+IGFub255bW91cyBhbmQgQ09XIFZNQXMgb25seSB3
aGlsZSBob2xkaW5nIG1tYXBfd3JpdGVfbG9jaywgcHJldmVudGluZwo+ID4gPiBhbnkgVk1BIG1v
ZGlmaWNhdGlvbi4gT24gdGhlIHN1cmZhY2UsIHRoYXQgbG9va3Mgb2sgdG8gbWUgYnV0IEkgbWln
aHQKPiA+ID4gYmUgbWlzc2luZyBzb21lIGNvcm5lciBjYXNlcy4gSWYgbm9ib2R5IHNlZXMgYW55
IG9idmlvdXMgaXNzdWVzLCBJCj4gPiA+IHRoaW5rIGl0J3Mgd29ydGggYSB0cnkuCj4gPgo+ID4g
Tm90IHN1cmUgaWYgeW91IG5vdGljZWQgYnV0IEkgZGlkIHJhaXNlIGNvbmNlcm5zIDspCj4gPgo+
ID4gSSB3b25kZXIgaWYgeW91J3ZlIGNvbmZ1c2VkIHRoZSBmYXVsdCBwYXRoIGFuZCBmb3JrIGhl
cmUsIGFzIEkgdGhpbmsgQmFycnkgaGFzCj4gPiBiZWVuIGEgbGl0dGxlIHVuY2xlYXIgb24gdGhh
dC4KPgo+IEkgdGhpbmsgSeKAmXZlIGJlZW4gYWJzb2x1dGVseSBjbGVhciA6LSkKCk9uIHRoaXMg
cG9pbnQgc3VyZSwgSSB3b3VsZCBhcmd1ZSBsZXNzIHNvIGFyb3VuZCB0aGUgZm9yayBzdHVmZiBi
dXQgSSByZXNwb25kZWQKb24gdGhhdCBzcGVjaWZpY2FsbHkgZWxzZXdoZXJlIHNvIGxldCdzIGtl
ZXAgdGhpbmdzIG1vdmluZyA6PikKCj4gV2Ugc2hvdWxkIGVpdGhlciBzdGljayB0byB0aGUgY3Vy
cmVudCBiZWhhdmlvciAtIGRyb3AKPiB0aGUgVk1BIGxvY2sgYmVmb3JlIGRvaW5nIEkvTywgb3Ig
Y2hhbmdlIGZvcmsoKSBzbyB0aGF0IGl0Cj4gZG9lcyBub3Qgd2FpdCBvbiB2bWFfc3RhcnRfd3Jp
dGUoKS4KCkFnYWluLCBhcyBJIHNhaWQgZWxzZXdoZXJlLCBJIHRoaW5rIHRoZXJlIG1pZ2h0IGJl
IGEgM3JkIHdheSBwb3NzaWJseS4gSXQncyBhCmJpZyBtaXN0YWtlIHRvIGFzc3VtZSB0aGF0IHRo
ZXJlIGFyZSBvbmx5IHNwZWNpZmljIHNvbHV0aW9ucyB0byBwcm9ibGVtcyBpbiB0aGUKa2VybmVs
IHRoZW4gdG8gcHJlc2VudCBhIGZhbHNlIGRpY2hvdG9teS4KCldlIGFic29sdXRlbHkgaGVhciB5
b3Ugb24gdGhpcyBiZWluZyBhIHByb2JsZW0gYW5kIGl0IFdJTEwgYmUgYWRkcmVzc2VkIG9uZSB3
YXkKb3IgYW5vdGhlci4KCk9mIHRoZSB0d28gYXBwcm9hY2hlcywgYXMgSSBzYWlkIGVsc2V3aGVy
ZSwgSSBwcmVmZXIgd2hhdCB5b3UndmUgZG9uZSBpbiB0aGlzCnNlcmllcyB0byBhbnl0aGluZyB0
b3VjaGluZyBmb3JrLgoKQnV0IGdpdmUgbWUgdGltZSB0byBsb29rIHRocm91Z2ggdGhlIHNlcmll
cyBwbGVhc2UgKEknZCBhbHNvIHN1Z2dlc3QgUkZDJ2luZwp3aGVuIGl0J3Mgc29tZXRoaW5nIGtp
bmRhIGZ1bmRhbWVudGFsIHRoYXQgbWlnaHQgZ2VuZXJhdGUgY29udmVyYXN0aW9uLCBtYWtlcwps
aWZlIGEgYml0IGVhc2llciBvbiB0aGUgcmV2aWV3IHNpZGUgOikKCj4KPiBCZWZvcmUgcGVyLVZN
QSBsb2NrcywgcGFnZSBmYXVsdHMgZHJvcHBlZCBtbWFwX2xvY2sgYmVmb3JlCj4gZG9pbmcgSS9P
LiBBZnRlciBwZXItVk1BIGxvY2tzLCBwYWdlIGZhdWx0cyBkcm9wcGVkIHRoZQo+IFZNQSBsb2Nr
IGJlZm9yZSBkb2luZyBJL08uIEluIGJvdGggY2FzZXMsIGZvcmsoKSB3b3VsZCBub3QKPiB3YWl0
IGZvciBJL08gaW4gdGhlIHBhZ2UtZmF1bHQgcGF0aC4KPgo+IE5vdyB5b3UgZ3V5cyBhcmUgc3Vn
Z2VzdGluZyBwZXJmb3JtaW5nIEkvTyB3aGlsZSBob2xkaW5nCj4gdGhlIFZNQSBsb2NrLCB3aGlj
aCBtZWFucyBmb3JrKCkgbXVzdCB3YWl0IGZvciB0aGF0IEkvTyB0bwo+IGNvbXBsZXRlLiBTaW5j
ZSBhbiBhcHBsaWNhdGlvbiBjYW4gaGF2ZSBtb3JlIHRoYW4gMTAwMAo+IFZNQXMsIGFuZCBJL08g
Y2FuIGJlIHN0YWxsZWQgZm9yIGFuIHVucHJlZGljdGFibGUgYW1vdW50Cj4gb2YgdGltZSBpbiB0
aGUgYmlvL3JlcXVlc3QgcXVldWUgb3IgZmlsZXN5c3RlbSBHQywgZm9yaygpCj4gY291bGQgZW5k
IHVwIGJsb2NrZWQgb24gbXVsdGlwbGUgVk1BcyB3aGlsZSB0YWtpbmcKPiB2bWFfc3RhcnRfd3Jp
dGUoKSBmb3IgZWFjaCBvZiB0aGVtLgo+Cj4gQXMgYSByZXN1bHQsIGZvcmsoKSBjb3VsZCBob2xk
IG1tYXBfbG9jayBmb3IgYSB2ZXJ5LCB2ZXJ5LAo+IHZlcnkgbG9uZyB0aW1lLiBmb3JrKCkgaXRz
ZWxmIHdvdWxkIGJlY29tZSBleHRyZW1lbHkgc2xvdywKPiBhbmQgYW55IG90aGVyIHRhc2sgbmVl
ZGluZyBtbWFwX2xvY2sgd291bGQgYWxzbyBiZSBibG9ja2VkCj4gYmVoaW5kIGl0LgoKWWVwIGF3
YXJlLCB3ZSBzcG9rZSBpbiBaYWdyZWIgYWJvdXQgdGhpcywgYW5kIG9uIHRoaXMgdGhyZWFkLCB3
ZSBrbm93IDopCgo+Cj4gPgo+ID4gV2hhdCdzIGJlaW5nIHN1Z2dlc3RlZCBpbiB0aGlzIHRocmVh
ZCBpcyB0byBmdW5kYW1lbnRhbGx5IGNoYW5nZSBmb3JrIGJlaGF2aW91cgo+ID4gc28gaXQncyBk
aWZmZXJlbnQgZnJvbSB0aGUgZW50aXJlIGhpc3Rvcnkgb2YgdGhlIGtlcm5lbCAob3IgLSBwcmVz
dW1hYmx5IC0gYXQKPiA+IGxlYXN0IHJlY2VudCBoaXN0b3J5IDopIGFuZCBwZXJtaXQgY29uY3Vy
cmVudCBwYWdlIGZhdWx0cyB0byBvY2N1ciBvbiBhIGZvcmtpbmcKPiA+IHByb2Nlc3MuCj4gPgo+
ID4gSSBhYnNvbHV0ZWx5IG9iamVjdCB0byB0aGlzIGZvciBiZWluZyBwcmV0dHkgY3JhenkuIEkg
bWVhbiBJJ20gbm90IHN1cmUgd2UKPiA+IHJlYWxseSB3YW50IHRvIGJlIHNpbXVsdGFuZW91c2x5
IG1vZGlmeWluZyBwYWdlIHRhYmxlcyB3aGlsZSBpbnZva2luZwo+ID4gY29weV9wYWdlX3Jhbmdl
KCk/IE5vPwo+Cj4gSWYgeW91IG9iamVjdCB0byB0b3VjaGluZyBmb3JrKCksIGNhbiB5b3UgYXQg
bGVhc3QgYWNjZXB0Cj4ga2VlcGluZyB0aGUgZXhpc3RpbmcgYmVoYXZpb3Igb2YgZHJvcHBpbmcg
dGhlIFZNQSBsb2NrCj4gYmVmb3JlIGRvaW5nIEkvTz8gSWYgeW91IG9iamVjdCB0byBib3RoIGFw
cHJvYWNoZXMsIHRoZW4gSQo+IHJlYWxseSBkbyBub3Qga25vdyBob3cgd2UgY2FuIGNvbnRpbnVl
IDotKQoKQWdhaW4gYXMgcGVyIGFib3ZlLCBsZXQncyBub3QgaW1wb3NlIGEgZmFsc2UgZGljaHRv
bXksIGxldCdzIHRha2Ugb3VyIHRpbWUsIGFuZApzcGVjaWZpY2FsbHkgLSBwbGVhc2UgZ2l2ZSBt
ZSB0aW1lIHRvIHJlYWQgdGhyb3VnaCB0aGUgc2VyaWVzIGFuZCB0aGluayBhYm91dAp0aGlzLgoK
Pgo+IFRoYW5rcwo+IEJhcnJ5CgpUaGFua3MsIExvcmVuem8KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
