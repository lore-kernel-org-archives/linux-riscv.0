Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BC8CD4F4A
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 21:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gsLiVFdKfF8wAhMT0kASAvvsZ1Rui0bOM4ODIqaFLH4=; b=JeR9uM72mVM6EI
	TtINLfXlOfIDiRuQ77s02Y7dQ2wGP0RP7EiBuMtSWHDPQ8RH1TATuk1TCSEMR+zRY0gvVQmt7Dhmf
	EIezp/5yZ4xzxPgvqUZ6PXNZWPIdBqvdywF56v6vwepojTFW7DUwvm4NTtGmd7MR0uWRLzo9/bp/d
	g1Kev3OkFEz8FgrORq6XzgsU3pPKPnz98LDeuF6jjN9gnhoyCPm64mp9HPIdTGuAX6achbZC+lIJ8
	W6UKV7GMvJjd1ThYLYrrwZM06Vb8xar2/0rm1Wdntwne1l2tGuj5IsrGzBdGG6zE3REe8TOynhJbG
	fLdN3vPVy3r5DxSaU8Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5Ik-0000000Gy8K-0Zhy;
	Mon, 18 May 2026 21:15:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5Ih-0000000Gy6Z-0iho
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 21:15:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 84341445CB
	for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 21:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE13C2BD05
	for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 21:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779138898;
	bh=rs2uqTkIc7aAMCm9u6DZxVd5AsfHqGkk6OElJunpKgE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LKnQHg2EuuoiFeAFnxbyqE2fDmZVEFfJR4ym+5yVJgFpQm71jto6sLdg5WZBmxtnG
	 feASvKZV1Hz5s2U3CIOgVNjCbMO2KjX0U8n0MqD5oIETyTM4cq2dp1kF8q1re74vLb
	 j2vE2OH/h90vuhLO9gHN2qcX8iyk6Gj1VD31+RAQ6EyTWZ4iOjRfdPPOVrvYcxkaZB
	 XBfLDuqUgKG5MGYNKIrR4nHOZTbtTfEwI8Yhu+ZJ5BbOAt8fRt2kA+h5FZmAtjQcpZ
	 rnFDFHuQ6kgr2W3lu3RNNXviIak6dJ8MP1UOPZWyzYJ4m9mWzT3WG+SsY25Gg+DtTb
	 3+Mm4p2TcK06g==
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6312a0d556cso1223013137.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 14:14:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9wR2wEKi9m7znTAJuy0S/0ACbmaCHRAqM8f0PC+wQldvg3tOTLxa45qEeCBhEo81USyUgJAyk4IjSBUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCKukm+5h/db8myZVlMUz3zo2ERZH63TncQV19DrGrveGvbJVk
	SHup619gcIAnNy5oShmPBnEwy2tXg/oDsnyUslqkzkTQU9XXBOJBoYa4yS0WK7Vp/fI/GYevwBy
	ToX4zgXxc3cinVgSwJMlO3eKInoBEe9E=
X-Received: by 2002:a67:e70a:0:b0:611:e0c2:1604 with SMTP id
 ada2fe7eead31-63a3ee862bemr7850443137.19.1779138897435; Mon, 18 May 2026
 14:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer> <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
In-Reply-To: <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 19 May 2026 05:14:45 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zgeE3ebEJ+j7GJFzWVoVYHeiOn4dOoOsmWCLA6s=oECQ@mail.gmail.com>
X-Gm-Features: AVHnY4KjG65G1ecWJLmAXfyGgeXMxqs_Hs937nQXWNlaevhV7YwGMAI3sK3pWtE
Message-ID: <CAGsJ_4zgeE3ebEJ+j7GJFzWVoVYHeiOn4dOoOsmWCLA6s=oECQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Suren Baghdasaryan <surenb@google.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, 
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
X-CRM114-CacheID: sfid-20260518_141500_017743_8D2C28A8 
X-CRM114-Status: GOOD (  17.51  )
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

T24gVHVlLCBNYXkgMTksIDIwMjYgYXQgMzo1N+KAr0FNIFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3Vy
ZW5iQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgNDoyNuKA
r0FNIEJhcnJ5IFNvbmcgPGJhb2h1YUBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24s
IE1heSAxOCwgMjAyNiBhdCA1OjQ34oCvUE0gTG9yZW56byBTdG9ha2VzIDxsanNAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFN1biwgTWF5IDE3LCAyMDI2IGF0IDA0OjQ1OjE1UE0g
KzA4MDAsIEJhcnJ5IFNvbmcgd3JvdGU6ClsuLi5dCj4gPgo+ID4gSSB0aGluayB3ZSBlaXRoZXIg
bmVlZCB0byBmaXggYGZvcmsoKWAsIG9yIGtlZXAgdGhlIGN1cnJlbnQKPiA+IGJlaGF2aW9yIG9m
IGRyb3BwaW5nIHRoZSBWTUEgbG9jayBiZWZvcmUgcGVyZm9ybWluZyBJL08uCj4KPiBJIHNlZS4g
U28sIHRoaXMgcHJvYmxlbSBhcmlzZXMgZnJvbSB0aGUgZmFjdCB0aGF0IHdlIGFyZSBjaGFuZ2lu
ZyB0aGUKPiBwYWdlZmF1bHRzIHJlcXVpcmluZyBJL08gb3BlcmF0aW9uIHRvIGhvbGQgVk1BIGxv
Y2suLi4KPiBBbmQgeW91IHdhbnQgdG8gbG9jayBWTUEgb24gZm9yayBvbmx5IGlmIHZtYV9pc19h
bm9ueW1vdXModm1hKSB8fAo+IGlzX2Nvd19tYXBwaW5nKHZtYS0+dm1fZmxhZ3MpLiBTbywgd2Ug
d2lsbCBiZSBibG9ja2luZyBwYWdlIGZhdWx0cyBmb3IKPiBhbm9ueW1vdXMgYW5kIENPVyBWTUFz
IG9ubHkgd2hpbGUgaG9sZGluZyBtbWFwX3dyaXRlX2xvY2ssIHByZXZlbnRpbmcKPiBhbnkgVk1B
IG1vZGlmaWNhdGlvbi4gT24gdGhlIHN1cmZhY2UsIHRoYXQgbG9va3Mgb2sgdG8gbWUgYnV0IEkg
bWlnaHQKPiBiZSBtaXNzaW5nIHNvbWUgY29ybmVyIGNhc2VzLiBJZiBub2JvZHkgc2VlcyBhbnkg
b2J2aW91cyBpc3N1ZXMsIEkKPiB0aGluayBpdCdzIHdvcnRoIGEgdHJ5Lgo+CgpUaGFua3MuIEJl
c2lkZXMgdGhlIGNyZWF0aW9uIG9mIHByb2Nlc3NlcyB2aWEgZm9yaygpLCBJCmFtIGFsc28gYmVn
aW5uaW5nIHRvIHdvcnJ5IGFib3V0IHRoZSBkZWF0aCBvZiBwcm9jZXNzZXMuCgpPbmUgdGhpbmcg
dGhhdCBjYW1lIHRvIG15IG1pbmQgdGhpcyBtb3JuaW5nCmlzIHRoYXQgd2hlbiBsb3dtZW1vcnlr
aWxsZXIgZGVjaWRlcyB0byBraWxsIGFuIGFwcCwgd2UKd2FudCB0aGUgbWVtb3J5IHRvIGJlIHJl
bGVhc2VkIGFzIHF1aWNrbHkgYXMgcG9zc2libGUgc28KdGhlIG5ldyBhcHAgb3IgdXNlciBzY2Vu
YXJpbyBjYW4gZ2V0IG1lbW9yeSBzb29uZXIuCgpJbiB0aGF0IGNhc2UsIGlmIHRoZSBhcHAgYmVp
bmcga2lsbGVkIGlzIHBlcmZvcm1pbmcgSS9PCndoaWxlIGhvbGRpbmcgdGhlIFZNQSBsb2NrLCB0
aGUgdW5tYXBwaW5nIHByb2NlZHVyZQpjb3VsZCBlbmQgdXAgYmVpbmcgYmxvY2tlZCBhcyB3ZWxs
LgoKSWYgd2UgcmVsZWFzZSB0aGUgVk1BIGxvY2sgYXMgd2UgY3VycmVudGx5IGRvLCB3ZSBhbGxv
dwpwcm9jZXNzIGV4aXQgdG8gcHJvY2VlZC4KCkkgaGF2ZW4ndCB0aG91Z2h0IGl0IHRocm91Z2gg
dmVyeSBjbGVhcmx5IHlldCwgYW5kIEkKbWF5IGJlIHdyb25nLiBJJ2QgbGlrZSB0byBkbyBtb3Jl
IGludmVzdGlnYXRpb24uIEkgaG9wZQp0aGUgYXBwcyBiZWluZyBraWxsZWQgc3RheSB2ZXJ5IHN0
aWxsLCBidXQgd2hvIGtub3dz4oCUd2UKaGF2ZSBzbyBtYW55IGFwcGxpY2F0aW9ucyBpbiB0aGUg
bWFya2V0LgoKTWVhbndoaWxlLCBpZiB5b3UgaGF2ZSBhbnkgY29tbWVudHMgcmVnYXJkaW5nIHRo
ZSBkZWF0aApvZiBwcm9jZXNzZXMsIHRoZXkgd291bGQgYmUgdmVyeSB3ZWxjb21lLgoKQmVzdCBS
ZWdhcmRzCkJhcnJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
