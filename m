Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4055FCD4F54
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 21:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZn0nxTRU5MCUXWTjlqBFjJAOKiDQiYYxsMMU7uDFs4=; b=IkvV9OlwLrkUOT
	kzdrpyP2EpR5TN6/sf1aaKZJqI92F7w021IWEHDAhl5QB2mgx08ghTbv2QbHQE3AANByO/sNu+MOw
	1Z3fwaaxzODfrHixDpV8C65OgwHd4HKaljx8URkVdWfUaJzlXfQFho3U4Bmv5C3HEYYFZ1pt0wA7A
	6mvX+iJ83gQp1WqsdIppIKAB9JDdN+X7vO6T+kGyxj30TdyDUg5dfMwDYSUdjy3PB4i0JF/d2YNSU
	DPXvWDnGkxTJh7tb8BWWPol1YZcdCQvXvHDEqvlb/JL7SzVgkA+qR/Ah641Sc0eFHsty4A7qDBzhy
	mVG/jF0kcHIRSKijZ7dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRqI-00000002p1i-14uP;
	Tue, 19 May 2026 21:19:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRqF-00000002p0O-1p4y
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 21:19:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B70E643CFB
	for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 21:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6E11F0089A
	for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 21:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779225545;
	bh=smo6PG71gks5CdB+S9N8OQcbl9Tnm001jvZXKeMS2ow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IuJhnnCs9B9YmsKmO6m3+Qhj4z5T6+OeMhTdQehdO4b+N2yxZ83/r9ANCYX0Tb1gw
	 DMyMD1bSvprYJ53QJhpWIZp0zflRYn3U8y52c/3W7wyU+vTXkGSvxapMxD8ZMFoVrc
	 j81p9X/NkxkhnK4vwIaVlAOuf+pLyT9aF9yygdR/2/hANkFwQFOFO4wDZEIidDDq9R
	 uA6CZqNER3t3OhIApelv4GoVAkcKHuoy9ZaUjDwUGarkWsSPmhbSSWSXLZP+neWk8q
	 Uc/3dypd996tr7HIMcfSCcSuCTMwIefm47+tzU4EQvXFpy6MvKpcLMGnWevG8Go+EQ
	 PuMTrRLgsb6EQ==
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-90ca6f20872so627321585a.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 14:19:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9qPzJSFd9Z7Uze0kr4+TSPhjk6Y+if6zQ2XhebnuCzMvyWDiQDxhVRK38b1cPmjAGgE6UhZFHpXJmm6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDITrE2tIQsnLFsOw/yxqqjJkeI5+IPvxb0upZK1tvtZHieIJT
	+UdM+Zq6JVa+e/TpjWyyLyBsPh2EzgwD9+gDIQa0vcZ4K3mb1JmaGs8e8DwGwk1QEMQ/QgAMe0L
	VS4NM33ox0mqD6vKcJ7XkeSKqc/FNPdA=
X-Received: by 2002:a05:622a:8599:b0:50e:32cd:52fa with SMTP id
 d75a77b69052e-5164155aed1mr241957021cf.3.1779225544934; Tue, 19 May 2026
 14:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer> <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com> <agxbq1TxJdniMQT3@lucifer>
In-Reply-To: <agxbq1TxJdniMQT3@lucifer>
From: Barry Song <baohua@kernel.org>
Date: Wed, 20 May 2026 05:18:52 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zxyZP_xkFCGWfLyXkqomrX6DNqyMVirk=aggtwB1zExw@mail.gmail.com>
X-Gm-Features: AVHnY4J8Vo_CuCIfUx0l4iAJBGF2Iz4ZMOGZd3FV7sXmKyNFMh0JMXgCJ8QhKkw
Message-ID: <CAGsJ_4zxyZP_xkFCGWfLyXkqomrX6DNqyMVirk=aggtwB1zExw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_141907_512911_7BE1673C 
X-CRM114-Status: GOOD (  23.80  )
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

T24gVHVlLCBNYXkgMTksIDIwMjYgYXQgODo1M+KAr1BNIExvcmVuem8gU3RvYWtlcyA8bGpzQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgMTI6NTY6NTlQTSAt
MDcwMCwgU3VyZW4gQmFnaGRhc2FyeWFuIHdyb3RlOgo+Cj4gPiA+Cj4gPiA+IEkgdGhpbmsgd2Ug
ZWl0aGVyIG5lZWQgdG8gZml4IGBmb3JrKClgLCBvciBrZWVwIHRoZSBjdXJyZW50Cj4gPiA+IGJl
aGF2aW9yIG9mIGRyb3BwaW5nIHRoZSBWTUEgbG9jayBiZWZvcmUgcGVyZm9ybWluZyBJL08uCj4g
Pgo+ID4gSSBzZWUuIFNvLCB0aGlzIHByb2JsZW0gYXJpc2VzIGZyb20gdGhlIGZhY3QgdGhhdCB3
ZSBhcmUgY2hhbmdpbmcgdGhlCj4gPiBwYWdlZmF1bHRzIHJlcXVpcmluZyBJL08gb3BlcmF0aW9u
IHRvIGhvbGQgVk1BIGxvY2suLi4KPiA+IEFuZCB5b3Ugd2FudCB0byBsb2NrIFZNQSBvbiBmb3Jr
IG9ubHkgaWYgdm1hX2lzX2Fub255bW91cyh2bWEpIHx8Cj4gPiBpc19jb3dfbWFwcGluZyh2bWEt
PnZtX2ZsYWdzKS4gU28sIHdlIHdpbGwgYmUgYmxvY2tpbmcgcGFnZSBmYXVsdHMgZm9yCj4gPiBh
bm9ueW1vdXMgYW5kIENPVyBWTUFzIG9ubHkgd2hpbGUgaG9sZGluZyBtbWFwX3dyaXRlX2xvY2ss
IHByZXZlbnRpbmcKPiA+IGFueSBWTUEgbW9kaWZpY2F0aW9uLiBPbiB0aGUgc3VyZmFjZSwgdGhh
dCBsb29rcyBvayB0byBtZSBidXQgSSBtaWdodAo+ID4gYmUgbWlzc2luZyBzb21lIGNvcm5lciBj
YXNlcy4gSWYgbm9ib2R5IHNlZXMgYW55IG9idmlvdXMgaXNzdWVzLCBJCj4gPiB0aGluayBpdCdz
IHdvcnRoIGEgdHJ5Lgo+Cj4gTm90IHN1cmUgaWYgeW91IG5vdGljZWQgYnV0IEkgZGlkIHJhaXNl
IGNvbmNlcm5zIDspCj4KPiBJIHdvbmRlciBpZiB5b3UndmUgY29uZnVzZWQgdGhlIGZhdWx0IHBh
dGggYW5kIGZvcmsgaGVyZSwgYXMgSSB0aGluayBCYXJyeSBoYXMKPiBiZWVuIGEgbGl0dGxlIHVu
Y2xlYXIgb24gdGhhdC4KCkkgdGhpbmsgSeKAmXZlIGJlZW4gYWJzb2x1dGVseSBjbGVhciA6LSkK
V2Ugc2hvdWxkIGVpdGhlciBzdGljayB0byB0aGUgY3VycmVudCBiZWhhdmlvciAtIGRyb3AKdGhl
IFZNQSBsb2NrIGJlZm9yZSBkb2luZyBJL08sIG9yIGNoYW5nZSBmb3JrKCkgc28gdGhhdCBpdApk
b2VzIG5vdCB3YWl0IG9uIHZtYV9zdGFydF93cml0ZSgpLgoKQmVmb3JlIHBlci1WTUEgbG9ja3Ms
IHBhZ2UgZmF1bHRzIGRyb3BwZWQgbW1hcF9sb2NrIGJlZm9yZQpkb2luZyBJL08uIEFmdGVyIHBl
ci1WTUEgbG9ja3MsIHBhZ2UgZmF1bHRzIGRyb3BwZWQgdGhlClZNQSBsb2NrIGJlZm9yZSBkb2lu
ZyBJL08uIEluIGJvdGggY2FzZXMsIGZvcmsoKSB3b3VsZCBub3QKd2FpdCBmb3IgSS9PIGluIHRo
ZSBwYWdlLWZhdWx0IHBhdGguCgpOb3cgeW91IGd1eXMgYXJlIHN1Z2dlc3RpbmcgcGVyZm9ybWlu
ZyBJL08gd2hpbGUgaG9sZGluZwp0aGUgVk1BIGxvY2ssIHdoaWNoIG1lYW5zIGZvcmsoKSBtdXN0
IHdhaXQgZm9yIHRoYXQgSS9PIHRvCmNvbXBsZXRlLiBTaW5jZSBhbiBhcHBsaWNhdGlvbiBjYW4g
aGF2ZSBtb3JlIHRoYW4gMTAwMApWTUFzLCBhbmQgSS9PIGNhbiBiZSBzdGFsbGVkIGZvciBhbiB1
bnByZWRpY3RhYmxlIGFtb3VudApvZiB0aW1lIGluIHRoZSBiaW8vcmVxdWVzdCBxdWV1ZSBvciBm
aWxlc3lzdGVtIEdDLCBmb3JrKCkKY291bGQgZW5kIHVwIGJsb2NrZWQgb24gbXVsdGlwbGUgVk1B
cyB3aGlsZSB0YWtpbmcKdm1hX3N0YXJ0X3dyaXRlKCkgZm9yIGVhY2ggb2YgdGhlbS4KCkFzIGEg
cmVzdWx0LCBmb3JrKCkgY291bGQgaG9sZCBtbWFwX2xvY2sgZm9yIGEgdmVyeSwgdmVyeSwKdmVy
eSBsb25nIHRpbWUuIGZvcmsoKSBpdHNlbGYgd291bGQgYmVjb21lIGV4dHJlbWVseSBzbG93LAph
bmQgYW55IG90aGVyIHRhc2sgbmVlZGluZyBtbWFwX2xvY2sgd291bGQgYWxzbyBiZSBibG9ja2Vk
CmJlaGluZCBpdC4KCj4KPiBXaGF0J3MgYmVpbmcgc3VnZ2VzdGVkIGluIHRoaXMgdGhyZWFkIGlz
IHRvIGZ1bmRhbWVudGFsbHkgY2hhbmdlIGZvcmsgYmVoYXZpb3VyCj4gc28gaXQncyBkaWZmZXJl
bnQgZnJvbSB0aGUgZW50aXJlIGhpc3Rvcnkgb2YgdGhlIGtlcm5lbCAob3IgLSBwcmVzdW1hYmx5
IC0gYXQKPiBsZWFzdCByZWNlbnQgaGlzdG9yeSA6KSBhbmQgcGVybWl0IGNvbmN1cnJlbnQgcGFn
ZSBmYXVsdHMgdG8gb2NjdXIgb24gYSBmb3JraW5nCj4gcHJvY2Vzcy4KPgo+IEkgYWJzb2x1dGVs
eSBvYmplY3QgdG8gdGhpcyBmb3IgYmVpbmcgcHJldHR5IGNyYXp5LiBJIG1lYW4gSSdtIG5vdCBz
dXJlIHdlCj4gcmVhbGx5IHdhbnQgdG8gYmUgc2ltdWx0YW5lb3VzbHkgbW9kaWZ5aW5nIHBhZ2Ug
dGFibGVzIHdoaWxlIGludm9raW5nCj4gY29weV9wYWdlX3JhbmdlKCk/IE5vPwoKSWYgeW91IG9i
amVjdCB0byB0b3VjaGluZyBmb3JrKCksIGNhbiB5b3UgYXQgbGVhc3QgYWNjZXB0CmtlZXBpbmcg
dGhlIGV4aXN0aW5nIGJlaGF2aW9yIG9mIGRyb3BwaW5nIHRoZSBWTUEgbG9jawpiZWZvcmUgZG9p
bmcgSS9PPyBJZiB5b3Ugb2JqZWN0IHRvIGJvdGggYXBwcm9hY2hlcywgdGhlbiBJCnJlYWxseSBk
byBub3Qga25vdyBob3cgd2UgY2FuIGNvbnRpbnVlIDotKQoKVGhhbmtzCkJhcnJ5CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
