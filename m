Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AECCD4F3C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 10:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bKfWwd9uJnZTAQroPTwvouiBahTWXV7iHYtUEXMqlLk=; b=h/dZgw0MVCWNni
	+hR+fs+fE4EhUxBO7ply2dxjOb8/8uuHvpQ3XOJXj7WHLHT5tRWLDHH+tgu7y/QBvrNtyjRuPO8Kn
	3Wvmi4jqcP8bMspHHbl70BFBdtSrlUxKGLBbGmF30Va5TsHN12Nj33ypNUdwe+xbIKJItcKriTKAZ
	h9M59DrrXhIENl4EhzfgrWzQpYTyqH53Cb5f9HuGEsDLJCnH3ZhQlo0DjG4XHAiikbS/fKx1iFljc
	55V+5rshEfpzyHssoeaSK4YaAM0uNezfzGdbJfzmhtxoxZzWsP+8i4DFE3wa9xygK9YlhAOY9SGcY
	kL1Dxm3BeU/a3xaEgzCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdpz-00000004HFS-0Jku;
	Wed, 20 May 2026 10:07:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdpx-00000004HF3-355X;
	Wed, 20 May 2026 10:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5uTpCdf27XDZ7rU8VT2nSx6sZs8Bwa/a+nJN9dsTFZs=; b=UcTLeQiYMgix+wCRugC8vjxJpx
	iNhPVBrtpSyqovsexaHH9UjawwRCKb7FLGLg3MVnqfISqXFtaS6sJn32e7z1MijPN1IU3eDNv8jA0
	tpNOcmLDaI3t54iH16PNNuvyDnRo+3x6nR+ZowmNYfsZADTgRZN7AOqpmJxssGrJtjUiM/iEAaB1h
	d5mYcSzip6lcbimN33a2lS84Ntb836VmOb2cZ2S++sDOme/9VHWlWhdcyKTjHVNmYXav0VT45zt7l
	4e199G5jkwnmrgb0sWwVITekY25H6RxanKqWnQZ7aPdzHaB8XRrn64b3Rdpeh6pZ8xbnlbhEE3LPR
	vxi4QQAA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdpr-0000000GS5c-0iJ0;
	Wed, 20 May 2026 10:07:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F3C3F400E9;
	Wed, 20 May 2026 10:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8006B1F000E9;
	Wed, 20 May 2026 10:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271647;
	bh=5uTpCdf27XDZ7rU8VT2nSx6sZs8Bwa/a+nJN9dsTFZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bX7QZvvdTxa3YSpPgJR/CpVIiAr4LsFJHToqBiUpqQ7OjAJ3JKFYFh8HzISIXKnFl
	 1E+J/2n87sXxTBfiFUF8qRdzuKZRCrbEiW5rd6ddSTbKXsJZyMjM1T70x1mbw9v0iy
	 YXZDa7aQwxVF+CY8701SKVnLs7kwSt8WRsZCkxc6xexoxRufJyztW+awoUYKcSOR3V
	 ZphoL6Dwc5cIDbOia4oI1lg7iHirtApfH1lnEv5WUDqQL/WaQSKARD2Sz4E/mNZ0i/
	 CCS5/OgWZ5wmRKzFA5XnlGREVMcvJ2weIMSEG1wzLcm4yLFjdP3cRCAdnhnZwf44/+
	 wOJEQPBG/nIXg==
Date: Wed, 20 May 2026 11:07:18 +0100
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
Message-ID: <ag2GKrvRHzP4KhOl@lucifer>
References: <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer>
 <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <agxbq1TxJdniMQT3@lucifer>
 <CAGsJ_4zxyZP_xkFCGWfLyXkqomrX6DNqyMVirk=aggtwB1zExw@mail.gmail.com>
 <ag1mk2DSJsiORaxK@lucifer>
 <CAGsJ_4zN5ezh9vvvQDQdMF2KuuDGvkhNjTZWc0y0Lsa-P4Aahw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGsJ_4zN5ezh9vvvQDQdMF2KuuDGvkhNjTZWc0y0Lsa-P4Aahw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_110734_480549_A415C769 
X-CRM114-Status: GOOD (  47.97  )
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

T24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgMDU6MDc6MTZQTSArMDgwMCwgQmFycnkgU29uZyB3cm90
ZToKPiBPbiBXZWQsIE1heSAyMCwgMjAyNiBhdCAzOjUw4oCvUE0gTG9yZW56byBTdG9ha2VzIDxs
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgMDU6
MTg6NTJBTSArMDgwMCwgQmFycnkgU29uZyB3cm90ZToKPiA+ID4gT24gVHVlLCBNYXkgMTksIDIw
MjYgYXQgODo1M+KAr1BNIExvcmVuem8gU3RvYWtlcyA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+
ID4gPiA+Cj4gPiA+ID4gT24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgMTI6NTY6NTlQTSAtMDcwMCwg
U3VyZW4gQmFnaGRhc2FyeWFuIHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
IEkgdGhpbmsgd2UgZWl0aGVyIG5lZWQgdG8gZml4IGBmb3JrKClgLCBvciBrZWVwIHRoZSBjdXJy
ZW50Cj4gPiA+ID4gPiA+IGJlaGF2aW9yIG9mIGRyb3BwaW5nIHRoZSBWTUEgbG9jayBiZWZvcmUg
cGVyZm9ybWluZyBJL08uCj4gPiA+ID4gPgo+ID4gPiA+ID4gSSBzZWUuIFNvLCB0aGlzIHByb2Js
ZW0gYXJpc2VzIGZyb20gdGhlIGZhY3QgdGhhdCB3ZSBhcmUgY2hhbmdpbmcgdGhlCj4gPiA+ID4g
PiBwYWdlZmF1bHRzIHJlcXVpcmluZyBJL08gb3BlcmF0aW9uIHRvIGhvbGQgVk1BIGxvY2suLi4K
PiA+ID4gPiA+IEFuZCB5b3Ugd2FudCB0byBsb2NrIFZNQSBvbiBmb3JrIG9ubHkgaWYgdm1hX2lz
X2Fub255bW91cyh2bWEpIHx8Cj4gPiA+ID4gPiBpc19jb3dfbWFwcGluZyh2bWEtPnZtX2ZsYWdz
KS4gU28sIHdlIHdpbGwgYmUgYmxvY2tpbmcgcGFnZSBmYXVsdHMgZm9yCj4gPiA+ID4gPiBhbm9u
eW1vdXMgYW5kIENPVyBWTUFzIG9ubHkgd2hpbGUgaG9sZGluZyBtbWFwX3dyaXRlX2xvY2ssIHBy
ZXZlbnRpbmcKPiA+ID4gPiA+IGFueSBWTUEgbW9kaWZpY2F0aW9uLiBPbiB0aGUgc3VyZmFjZSwg
dGhhdCBsb29rcyBvayB0byBtZSBidXQgSSBtaWdodAo+ID4gPiA+ID4gYmUgbWlzc2luZyBzb21l
IGNvcm5lciBjYXNlcy4gSWYgbm9ib2R5IHNlZXMgYW55IG9idmlvdXMgaXNzdWVzLCBJCj4gPiA+
ID4gPiB0aGluayBpdCdzIHdvcnRoIGEgdHJ5Lgo+ID4gPiA+Cj4gPiA+ID4gTm90IHN1cmUgaWYg
eW91IG5vdGljZWQgYnV0IEkgZGlkIHJhaXNlIGNvbmNlcm5zIDspCj4gPiA+ID4KPiA+ID4gPiBJ
IHdvbmRlciBpZiB5b3UndmUgY29uZnVzZWQgdGhlIGZhdWx0IHBhdGggYW5kIGZvcmsgaGVyZSwg
YXMgSSB0aGluayBCYXJyeSBoYXMKPiA+ID4gPiBiZWVuIGEgbGl0dGxlIHVuY2xlYXIgb24gdGhh
dC4KPiA+ID4KPiA+ID4gSSB0aGluayBJ4oCZdmUgYmVlbiBhYnNvbHV0ZWx5IGNsZWFyIDotKQo+
ID4KPiA+IE9uIHRoaXMgcG9pbnQgc3VyZSwgSSB3b3VsZCBhcmd1ZSBsZXNzIHNvIGFyb3VuZCB0
aGUgZm9yayBzdHVmZiBidXQgSSByZXNwb25kZWQKPiA+IG9uIHRoYXQgc3BlY2lmaWNhbGx5IGVs
c2V3aGVyZSBzbyBsZXQncyBrZWVwIHRoaW5ncyBtb3ZpbmcgOj4pCj4gPgo+ID4gPiBXZSBzaG91
bGQgZWl0aGVyIHN0aWNrIHRvIHRoZSBjdXJyZW50IGJlaGF2aW9yIC0gZHJvcAo+ID4gPiB0aGUg
Vk1BIGxvY2sgYmVmb3JlIGRvaW5nIEkvTywgb3IgY2hhbmdlIGZvcmsoKSBzbyB0aGF0IGl0Cj4g
PiA+IGRvZXMgbm90IHdhaXQgb24gdm1hX3N0YXJ0X3dyaXRlKCkuCj4gPgo+ID4gQWdhaW4sIGFz
IEkgc2FpZCBlbHNld2hlcmUsIEkgdGhpbmsgdGhlcmUgbWlnaHQgYmUgYSAzcmQgd2F5IHBvc3Np
Ymx5LiBJdCdzIGEKPiA+IGJpZyBtaXN0YWtlIHRvIGFzc3VtZSB0aGF0IHRoZXJlIGFyZSBvbmx5
IHNwZWNpZmljIHNvbHV0aW9ucyB0byBwcm9ibGVtcyBpbiB0aGUKPiA+IGtlcm5lbCB0aGVuIHRv
IHByZXNlbnQgYSBmYWxzZSBkaWNob3RvbXkuCj4KPiBJIHJlY2FsbGVkIHRoYXQgd2hlbiB3ZSBk
aXNjdXNzZWQgdGhpcyBwYXJ0IGluIG15IHNsaWRlczoKPgo+IOKAmEZvciBzaW1wbGljaXR5LCBy
YXRoZXIgdGhhbiB1c2luZyBhIHdoaXRlbGlzdCBtZWNoYW5pc20gZm9yCj4gcGVyLVZNQSByZXRy
eSwgd2UgY291bGQgdXNlIGEgYmxhY2tsaXN0IGluc3RlYWQ6IGRlZmF1bHQgdG8KPiBhbHdheXMg
cmV0cnkgdmlhIHRoZSBWTUEgbG9jaywgYW5kIG9ubHkgYWxsb3cgbW1hcF9sb2NrLWJhc2VkCj4g
cGFnZS1mYXVsdCByZXRyeSBmb3Igc3BlY2lmaWMgY2FzZXMgc3VjaCBhcwo+IF9fdm1mX2Fub25f
cHJlcGFyZSgpLuKAmQoKWWVhaCB0aGF0J3MgYW4gaXRuZXJlc3RpbmcgYXBwcm9hY2ggYWN0dWFs
bHksIHNvcnJ5IGlmIEkgbWlzc2VkIHRoYXQuCgo+Cj4gU3VyZW4gbWVudGlvbmVkIGludHJvZHVj
aW5nIGEgRkFMTEJBQ0sgZmxhZy4gV2l0aCB0aGUKPiBGQUxMQkFDSyBmbGFnLCB3ZSB3b3VsZCBy
ZXRyeSB2aWEgbW1hcF9sb2NrOyB3aXRoIHRoZSBSRVRSWQo+IGZsYWcsIHdlIHdvdWxkIHJldHJ5
IHZpYSB0aGUgVk1BIGxvY2suCgpZZWFoLCBhbmQgaG9uZXN0bHkgSSdtIGJlZ2lubmluZyB0byB3
b25kZXIgaWYgd2UgZG9uJ3QganVzdCBoYXZlIHRvIHBheSB0aGUKY29tcGxleGl0eSB0YXggYW55
d2F5IGFuZCBlYXQgdGhlIGZhY3Qgd2UgaGF2ZSB0byBkZWFsIHdpdGggdGhhdC4KCkJ1dCBhcyBw
ZXIgSm9zZWYncyBjb21tZW50IHJlOiB0aGlzIHdob2xlIG1lY2hhbmlzbSwgc2ltcGx5IG5vdCB3
YWl0aW5nIGZvcgpmaWxlLWJhY2tlZCBJIHRoaW5rIGlzIGFub3RoZXIgb3B0aW9uIChidXQgSSBk
b24ndCByZWNhbGwgd2hlcmUgd2UgbGVmdCB0aGF0CmNvbnZlcnNhdGlvbiBhY3R1YWxseT8pCgpB
bnl3YXkgSSB3YW50IHRvIG1ha2Ugc3VyZSBhbnkgY29tcGxleGl0eSB3ZSBhZGQgaXMgbmVjZXNz
YXJ5IHNvIHdpbGwgdGFrZSBhCmxvb2sgdGhyb3VnaCBwYXRjaGVzIGFuZCBoYXZlIGEgdGhpbmsg
KGFuZCBvYnZpb3VzbHkgb3RoZXJzIHdpbGwgaGF2ZSB0aGVpciBvd24Kb3BpbmlvbnMhKQoKPgo+
IE5vdCBzdXJlIHdoZXRoZXIgdGhpcyBjb3VsZCByZWFsbHkgYmUgY2FsbGVkIGEg4oCYdGhpcmQg
d2F5LOKAmQo+IGJ1dCBpdCBzZWVtcyBtb3JlIGxpa2UgYSBzaGlmdCBmcm9tIGEgd2hpdGVsaXN0
IG1vZGVsIHRvIGEKPiBibGFja2xpc3QgbW9kZWwsIHdpdGhvdXQgY2hhbmdpbmcgdGhlIGZ1bmRh
bWVudGFsIGRlc2lnbiwgYnV0Cj4gaXQgZG9lcyBjaGFuZ2Ugd2hlcmUgd2Ugd291bGQgbmVlZCB0
byB0b3VjaCB0aGUgc291cmNlIGNvZGUuCgpSaWdodCB5ZWFoLCBnb29kIHRvIGhhdmUgbW9yZSBv
cHRpb25zLgoKPgo+ID4KPiA+IFdlIGFic29sdXRlbHkgaGVhciB5b3Ugb24gdGhpcyBiZWluZyBh
IHByb2JsZW0gYW5kIGl0IFdJTEwgYmUgYWRkcmVzc2VkIG9uZSB3YXkKPiA+IG9yIGFub3RoZXIu
Cj4KPiBUaGFua3MuIFRoaXMgaXMgYSBiaXQgb2YgbGlnaHQgaW4gd2hhdCBoYXMgZmVsdCBsaWtl
IGEgZmFpcmx5Cj4gZGFyayBzaXR1YXRpb24uIEkgcmVhbGx5IGFwcHJlY2lhdGUgeW91ciB0aG91
Z2h0ZnVsIGFuZAo+IHJlc3BvbnNpYmxlIGFwcHJvYWNoLgoKWWVzLCBzb3JyeSwgSSBtYXliZSB3
YXMgYSBiaXQgdG9vIGhhcnNoIGluIG15IHRvbmUgaGVyZSwgSSBkaWRuJ3QgcmVhbGx5IGludGVu
ZAp0byBiZSBuZWdhdGl2ZSBhcyB0byBhZGRyZXNpc25nIHRoZSBwcm9ibGVtIGFzIGEgd2hvbGUu
CgpNb3Jlc28gSSd2ZSBiZWVuIGNvbmNlcm5lZCBhYm91dCB0aGUgZm9yayBhcHByb2FjaCwgYW5k
IHRoYXQgaXMgd2hhdCdzIGxlZCB0byBtZQpiZWluZyBzaGFsbCB3ZSBzYXkgJ2VtcGhhdGljJyBh
Ym91dCBpdCA6KQoKQnV0IG9mIGNvdXJzZSBJIHNvbWV0aW1lcyBtYWtlIG1pc3Rha2VzIGluIHF1
aXRlIGhvdyBteSB0b25lIGNvbWVzIGFjcm9zcywgc28KYXBvbG9naWVzIGlmIGl0IGNhbWUgYWNy
b3NzIG92ZXJseSBuZWdhdGl2ZWx5IC0gSSBhbSBuZWdhdGl2ZSAob24gYSB0ZWNobmljYWwKbGV2
ZWwpIGFib3V0IHRoZSBmb3JrIGFwcHJvYWNoLCBidXQgbm90IHRoZSBmYWN0IHdlIHNob3VsZCBh
ZGRyZXNzIHRoaXMuCgpUbyBiZSBjbGVhciAtIEknbSB2ZXJ5IGdsYWQgeW91J3ZlIGJyb3VnaHQg
dGhpcyB1cCwgaXQncyBpbXBvcnRhbnQsIGFzIG11Y2ggYXMKaXQncyBwYWluZnVsIHRoYXQgd2Ug
aGF2ZSB0aGlzIGlzc3VlIGluIHRoZSBmaXJzdCBwbGFjZSEgOikKCj4KPiA+Cj4gPiBPZiB0aGUg
dHdvIGFwcHJvYWNoZXMsIGFzIEkgc2FpZCBlbHNld2hlcmUsIEkgcHJlZmVyIHdoYXQgeW91J3Zl
IGRvbmUgaW4gdGhpcwo+ID4gc2VyaWVzIHRvIGFueXRoaW5nIHRvdWNoaW5nIGZvcmsuCj4gPgo+
ID4gQnV0IGdpdmUgbWUgdGltZSB0byBsb29rIHRocm91Z2ggdGhlIHNlcmllcyBwbGVhc2UgKEkn
ZCBhbHNvIHN1Z2dlc3QgUkZDJ2luZwo+ID4gd2hlbiBpdCdzIHNvbWV0aGluZyBraW5kYSBmdW5k
YW1lbnRhbCB0aGF0IG1pZ2h0IGdlbmVyYXRlIGNvbnZlcmFzdGlvbiwgbWFrZXMKPiA+IGxpZmUg
YSBiaXQgZWFzaWVyIG9uIHRoZSByZXZpZXcgc2lkZSA6KQo+Cj4gVGhhbmtzISBTdXJlLCBJ4oCZ
bSBoYXBweSB0byB3YWl0IGFuZCB0aGVyZeKAmXMgbm8gdXJnZW5jeS4KPgo+IExhc3QgeWVhciB5
b3UgbWFkZSBxdWl0ZSBhIHNpZ25pZmljYW50IGNvbnRyaWJ1dGlvbiB0byB0aGUgd29yawo+IHdo
ZW4gSSB0cmllZCB0byByZW1vdmUgbW1hcF9sb2NrIGluIG1hZHZpc2UuIEkgcmVhbGx5Cj4gYXBw
cmVjaWF0ZWQgaXQuIE5vdyB3ZeKAmXJlIGJhY2sgdG8gdGhlIHNhbWUgbG9jayBhZ2FpbiwganVz
dCBpbgo+IGRpZmZlcmVudCBwbGFjZXMuCgpZZWFoIDopIG9uZSBkYXkgbWF5YmUgd2UgY2FuIGdl
dCByaWQgb2YgaXQgYWx0b2dldGhlciAobWF5YmUgSSdtIGRyZWFtaW5nIDopCgo+Cj4gQmVzdCBS
ZWdhcmRzCj4gQmFycnkKCkNoZWVycywgTG9yZW56bwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
