Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01F7CD5BB3
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 15:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e4xhp/PJTf+DpmRY1685pjHNTcTCJ/wBTtSBspqoC8g=; b=cdqkTw2bkFLdIL
	55OdOSKsNUxOvCtrcgCsw0XKA+FTqKsA0b0tFdAttDJn+7992rTFzYa3WY1fX9BqpGFygJm7G+Xsd
	Gkyw+z2v431os7QmDkgavK64KHODayDHZH3OGw5V7VGn4uZbiwnuON0ytDk4hR8KAZXC6VrEjQmAF
	wqUeVbErWxiAnbTEEcLA82NBwaQXHiNaCAj2Vd03651Nqu1rMzr0zidLSXobJzTUtW1MH1DRveF9U
	zSoP/zLaEfejReXANPC9p15Ln+YlF00E7B69OI6oadz/3akv55ejKbiSdBZsRLRtPsF7ISlbeDDSC
	b+6foecgGTJZE3b5RUyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRws-0000000BHHI-2P3C;
	Fri, 22 May 2026 15:38:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRwq-0000000BHGD-2Exr;
	Fri, 22 May 2026 15:38:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE1CE41738;
	Fri, 22 May 2026 15:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4206E1F000E9;
	Fri, 22 May 2026 15:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779464283;
	bh=Ue6+BrgA5cCiK29yEQFjVEW/61iWgshQWpISoK0a5mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e3S85iit9E//Da14omyK4sSzq5E+5P6CirUlrWrNKkWRCr0gH3q2SRSlfFihqMpFf
	 lNIJ+Ym6rgTd0CfoB7Pca50HGx7yg/Kc5w/2lEe4qOmRDVIKJHaZ2mwp0lyokkwzMM
	 6vLSr5NafsQy9TfFAYNw8jc2lOZNyREETBaXhqe0wsF6vVu5L5ph14ppOzYFh+6m+v
	 gJ/dcbqjjuTKEbZXZCc79Pa0JwpRwFDh/QUW0F5E1DEDjYhtDdgK1JyVd4OtmokLSn
	 On0u89WSmNioM38n363WRHRzMjaBZLPk3SQhu/mA8NqmleLSnwm2/5ltuBOTzidZnQ
	 dj5LZD2lAZZXQ==
Date: Fri, 22 May 2026 16:37:54 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Yang Shi <shy828301@gmail.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Barry Song <baohua@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, bhe@redhat.com, 
	youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <ahB3DSwipVXw6tmK@lucifer>
References: <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer>
 <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <agxbq1TxJdniMQT3@lucifer>
 <e6d1017a-e4c5-493e-bfca-932c6d64eaac@kernel.org>
 <CAHbLzkq3S7NDYe4LXjurKNQU+40-wtqrD_PT18YcyHbAcNxiRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHbLzkq3S7NDYe4LXjurKNQU+40-wtqrD_PT18YcyHbAcNxiRQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_083804_618814_F1B4DFAA 
X-CRM114-Status: GOOD (  40.17  )
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

T24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgMDI6Mzk6NDlQTSAtMDcwMCwgWWFuZyBTaGkgd3JvdGU6
Cj4gT24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgMzozNOKAr0FNIERhdmlkIEhpbGRlbmJyYW5kIChB
cm0pCj4gPGRhdmlkQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIDUvMTkvMjYgMTQ6NTMs
IExvcmVuem8gU3RvYWtlcyB3cm90ZToKPiA+ID4gT24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgMTI6
NTY6NTlQTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2FyeWFuIHdyb3RlOgo+ID4gPgo+ID4gPj4+Cj4g
PiA+Pj4gSSB0aGluayB3ZSBlaXRoZXIgbmVlZCB0byBmaXggYGZvcmsoKWAsIG9yIGtlZXAgdGhl
IGN1cnJlbnQKPiA+ID4+PiBiZWhhdmlvciBvZiBkcm9wcGluZyB0aGUgVk1BIGxvY2sgYmVmb3Jl
IHBlcmZvcm1pbmcgSS9PLgo+ID4gPj4KPiA+ID4+IEkgc2VlLiBTbywgdGhpcyBwcm9ibGVtIGFy
aXNlcyBmcm9tIHRoZSBmYWN0IHRoYXQgd2UgYXJlIGNoYW5naW5nIHRoZQo+ID4gPj4gcGFnZWZh
dWx0cyByZXF1aXJpbmcgSS9PIG9wZXJhdGlvbiB0byBob2xkIFZNQSBsb2NrLi4uCj4gPiA+PiBB
bmQgeW91IHdhbnQgdG8gbG9jayBWTUEgb24gZm9yayBvbmx5IGlmIHZtYV9pc19hbm9ueW1vdXMo
dm1hKSB8fAo+ID4gPj4gaXNfY293X21hcHBpbmcodm1hLT52bV9mbGFncykuIFNvLCB3ZSB3aWxs
IGJlIGJsb2NraW5nIHBhZ2UgZmF1bHRzIGZvcgo+ID4gPj4gYW5vbnltb3VzIGFuZCBDT1cgVk1B
cyBvbmx5IHdoaWxlIGhvbGRpbmcgbW1hcF93cml0ZV9sb2NrLCBwcmV2ZW50aW5nCj4gPiA+PiBh
bnkgVk1BIG1vZGlmaWNhdGlvbi4gT24gdGhlIHN1cmZhY2UsIHRoYXQgbG9va3Mgb2sgdG8gbWUg
YnV0IEkgbWlnaHQKPiA+ID4+IGJlIG1pc3Npbmcgc29tZSBjb3JuZXIgY2FzZXMuIElmIG5vYm9k
eSBzZWVzIGFueSBvYnZpb3VzIGlzc3VlcywgSQo+ID4gPj4gdGhpbmsgaXQncyB3b3J0aCBhIHRy
eS4KPiA+ID4KPiA+ID4gTm90IHN1cmUgaWYgeW91IG5vdGljZWQgYnV0IEkgZGlkIHJhaXNlIGNv
bmNlcm5zIDspCj4gPiA+Cj4gPiA+IEkgd29uZGVyIGlmIHlvdSd2ZSBjb25mdXNlZCB0aGUgZmF1
bHQgcGF0aCBhbmQgZm9yayBoZXJlLCBhcyBJIHRoaW5rIEJhcnJ5IGhhcwo+ID4gPiBiZWVuIGEg
bGl0dGxlIHVuY2xlYXIgb24gdGhhdC4KPiA+ID4KPiA+ID4gV2hhdCdzIGJlaW5nIHN1Z2dlc3Rl
ZCBpbiB0aGlzIHRocmVhZCBpcyB0byBmdW5kYW1lbnRhbGx5IGNoYW5nZSBmb3JrIGJlaGF2aW91
cgo+ID4gPiBzbyBpdCdzIGRpZmZlcmVudCBmcm9tIHRoZSBlbnRpcmUgaGlzdG9yeSBvZiB0aGUg
a2VybmVsIChvciAtIHByZXN1bWFibHkgLSBhdAo+ID4gPiBsZWFzdCByZWNlbnQgaGlzdG9yeSA6
KQo+ID4gSSBkb24ndCB3YW50IGZvcmsoKSB0byBiZWNvbWUgZGlmZmVyZW50IGluIHRoYXQgcmVn
YXJkLgo+ID4KPiA+IFRoZXJlIGlzIGFscmVhZHkgYSBzbGlnaHQgZGlmZmVyZW5jZSB3aXRoIHZz
LiB3aXRob3V0IHBlci1WTUEgbG9ja3MsIGJlY2F1c2UKPiA+IHRoZXJlIGlzIGEgd2luZG93IGlu
LWJldHdlZW4gdXMgdGFraW5nIHRoZSB3cml0ZSBtbWFwX2xvY2sgYW5kIGFsbCB0aGUgcGVyLVZN
QQo+ID4gbG9ja3MuIEkgcmFpc2VkIHRoYXQgcHJldmlvdXNseSBbMV0gYW5kIGFzc3VtZWQgdGhh
dCBpdCBpcyBwcm9iYWJseSBmaW5lLgo+ID4KPiA+IEkgYWxzbyByYWlzZWQgaW4gdGhlIHBhc3Qg
d2h5IEkgdGhpbmsgd2UgbXVzdCBub3QgYWxsb3cgY29uY3VycmVudCBwYWdlIGZhdWx0cywKPiA+
IGF0IGxlYXN0IGFzIHNvb24gYXMgYW5vbnltb3VzIG1lbW9yeSBpcyBpbnZvbHZlZCBbMl0uCj4K
PiBUaGFua3MgZm9yIHNoYXJpbmcgdGhlIGNvbnRleHQsIGl0IGlzIHF1aXRlIGhlbHBmdWwgdG8g
dW5kZXJzdGFuZCB0aGUKPiByYWNlIGNvbmRpdGlvbnMuIEJlY2F1c2UgTG9yZW56byBhbHNvIHJh
aXNlZCB0aGUgY29uY2VybiBhYm91dCBwYWdlCj4gZmF1bHQgcmFjZSwgSSB3aWxsIHJlcGx5IHRv
IGFsbCB0aGUgY29uY2VybnMgcmVnYXJkaW5nIHBhZ2UgZmF1bHQgcmFjZQo+IHRvZ2V0aGVyIGlu
IHRoaXMgdGhyZWFkLgo+Cj4gSUlVQywgdGhlcmUgaXMgYWxyZWFkeSBzb21lIHNvcnQgb2YgcmFj
ZSB3aXRoIHBlciB2bWEgbG9jay4gQmVmb3JlIHBlcgo+IHZtYSBsb2NrLCBtbWFwX2xvY2sgZGlk
IGxvY2sgZXZlcnl0aGluZy4gU28gcGFnZSBmYXVsdCBoYXBwZW5lZCBlaXRoZXIKPiBiZWZvcmUg
Zm9yayBvciBhZnRlciBmb3JrLiBCdXQgcGFnZSBmYXVsdCBjYW4gaGFwcGVuIG9uIG90aGVyIFZN
QXMKPiB3aGljaCBoYXZlIG5vdCBiZWVuIGxvY2snZWQgeWV0IGR1cmluZyBmb3JrIHdpdGggcGVy
IHZtYSBsb2NrLiBGb3IKPiBleGFtcGxlLCB3ZSBoYXZlIDMgVk1Bcywgd2UgbG9jayB0aGUgZmly
c3QgVk1BLCBidXQgcGFnZSBmYXVsdCBzdGlsbAo+IGNhbiBoYXBwZW4gb24gdGhlIG90aGVyIDIg
Vk1BcyBkdXJpbmcgZm9yayBpZiB0aGV5IGFscmVhZHkgaGF2ZQo+IGFub25fdm1hLiBUaGlzIGlz
IHRoZSBzdGF0dXMgcXVvIG5vdywgYnV0IGl0IHNlZW1zIG5vdCBoYXJtZnVsLgo+Cj4gVGhlIGJh
ZCByYWNlIHNoYXJlZCBieSBEYXZpZCBpcyBjYXVzZWQgYnkgcmFjaW5nIHdpdGggY29weSBwYWdl
LiBTbyBpdAo+IHNlZW1zIGxpa2UgaXQgd2lsbCBiZSBmaW5lIGFzIGxvbmcgYXMgd2Ugc2VyaWFs
aXplIGNvcHkgcGFnZSBhZ2FpbnN0Cj4gcGFnZSBmYXVsdCBpZiBJIGRvbid0IG1pc3MgYW55dGhp
bmcuIFNpbmNlIHdlIGRlY2lkZSB3aGV0aGVyIHRvIGNvcHkKPiBwYWdlIG9yIG5vdCBieSBjaGVj
a2luZyB2bWEtPmFub25fdm1hLCBzbyBpdCBzZWVtcyBmaW5lIHRvIG5vdCB0YWtlCj4gdm1hIGxv
Y2sgaWYgdm1hLT5hbm9uX3ZtYSBpcyBOVUxMLiBUaGlzIHdpbGwgbm90IGludHJvZHVjZSBtb3Jl
IHJhY2UKPiBlaXRoZXIgYmVjYXVzZSBzZXR0aW5nIHVwIGEgbmV3ICBhbm9uX3ZtYSBpbiBwYWdl
IGZhdWx0IG9yIG1hZHZpc2UKPiByZXF1aXJlcyB0YWtpbmcgbW1hcF9sb2NrIGFjY29yZGluZyB0
byB0aGUgZWFybGllciBkaXNjdXNzaW9ucy4KCk5BSy4gTm8uCgpXZSdyZSBub3QgZG9pbmcgdGhp
cywgd2UncmUgbm90IGNoYW5naW5nIGhvdyBmb3JrIGZ1bmRhbWVudGFsbHkgYmVoYXZlcyBiZWNh
dXNlCm9mIGNvbmNlcm5zIGFib3V0IHRoZSBmYXVsdCBwYXRoLgoKSSd2ZSBkZWxpbmVhdGVkIGV4
YWN0bHkgd2h5IEkgdGhpbmsgdGhpcyBpcyBhIHByb2JsZW0gYW5kIHlvdSdyZSBwcmVzc2luZyBh
aGVhZAp3aXRob3V0IGFkZHJlc3NpbmcgdGhvc2UgY29uY2VybnMuCgpTbyBhdCB0aGlzIHBvaW50
IEknbSBnb2luZyB0byBiZSBhIGdydW1weSBtYWludGFpbmVyIGFuZCBqdXN0IHNheSBubywgc3Rv
cApwbGVhc2UgOikKCkxldCdzIGZpeCB0aGlzIGluIHRoZSByaWdodCBwbGFjZS4gWW91IGRvbid0
IGZpeCBhIGxlYWsgaW4gdGhlIHJvb2YgYnkgcmVwYWlyaW5nCmEgc2hlbGYgbmV4dCBkb29yIDop
CgpUaGFua3MsIExvcmVuem8KCgo+Cj4gVGhhbmtzLAo+IFlhbmcKPgo+ID4KPiA+IC4uLiBhbmQg
SSByYWlzZWQgdGhhdCB0aGlzIGlzIHByZXR0eSBtdWNoIHNsb3dlciBieSBkZXNpZ24gcmlnaHQg
bm93OiAiV2VsbCwgdGhlCj4gPiBkZXNpZ24gZGVjaXNpb24gdGhhdCBDT05GSUdfUEVSX1ZNQV9M
T0NLIG1hZGUgZm9yIG5vdyB0byBtYWtlIHBhZ2UgZmF1bHRzIGZhc3QKPiA+IGFuZCB0byBtYWtl
IGJsb2NraW5nIGFueSBwYWdlIGZhdWx0cyBmcm9tIGhhcHBlbmluZyB0byAgYmUgc2xvd2VyIC4u
LiIgWzNdCj4gPgo+ID4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC85NzAyOTVhYi1l
ODVkLTdhZjMtNzZlNi1kZjUzYTVjNTJmOGJAcmVkaGF0LmNvbS8KPiA+IFsyXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvN2UzZjM1Y2MtNTliOS1iZjEyLWI4YjEtNGVkNzgyMjM4NDRhQHJl
ZGhhdC5jb20vCj4gPiBbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzJlZmEyYzg5LTM3
NjUtNzIxZC0yYzNjLTAwNTkwMDU0YWE1YkByZWRoYXQuY29tLwo+ID4KPiA+IC0tCj4gPiBDaGVl
cnMsCj4gPgo+ID4gRGF2aWQKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
