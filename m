Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF78CD4F25
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 08:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yUPaHLvcrOBkIkAEpj3fA8vmsk8dguestIxLEqiJJ/0=; b=K7F6vNyFeikwCT
	2m//QETwlJN7V1/3K4a+QGaaMbJ1IAKVErnYiHlCPWzsUFwagvx26m3T1S6ONnkyjfwdR/Zjamg2v
	DM5KQQJ9nVLWb72pNB1Qx9n6O5ULNh2r53uPTAL7YLtnSrz+azRzZEOJ4x2Abx7CZ43UUPGaMU1M1
	b3Yanlyh3GxYabVMjLF5KnplAfq8YW56Zle86Q8d5R77Rni9eHCefcmiE6PyfTC7fnO4/Yyx/3tiH
	pHcmTp36iCo0pLBQFpzZTdCeTtAS6CgX1U3kZieQ8pHEqDfNn4lhGTK0h7f6IPS0PR3ROEpZHJFda
	u1omkwU5rSMFKJ43jnsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOX7p-0000000COcw-41uZ;
	Sun, 17 May 2026 08:45:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOX7o-0000000COch-3Jhu
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 08:45:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B6015601E9
	for <linux-riscv@lists.infradead.org>; Sun, 17 May 2026 08:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66856C2BCFA
	for <linux-riscv@lists.infradead.org>; Sun, 17 May 2026 08:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779007527;
	bh=p/9AJiwpH9htKz1qH1Sl1BuAo/sVquMqqj2hIHE2j60=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IcZT9tUolcrkwWW0g0RY9HTDkbfvMUWKMC+4fxz9cOlxN5nLUbfxb37rlEv77K6Yz
	 91/W8a+pD9VIXpnwYL9jbGNNe64gmPI7/gmARH/LrsqxjAESIXXbB0hoqlAI/eOVyA
	 71yxBQAqlF7qQVourMYDTKkIlJOEhH+OOJG8NyQvxKt+Jkv+ZeuvJZZuT8Uv72hHKe
	 5Uy2D1EisdI1IXy6U24mBXVmBUDot+lzpFzHE4Dt6atMPLsp/jew4RZqdckHNc2wLr
	 FmqGPcBeg679dY+2flLU2OkyQdSmrf0RqKFym7/EfEyCQaoVLB61fYxtlxJ1BqzoTE
	 TcjhzGKbClSVA==
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8c9166b26b4so18535266d6.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 May 2026 01:45:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8E0CWviit21s/UJoeOIH7aj3FKv7KygBD65O5yNNyiMP540+NKudYpeq9/JFmiGmmmK9mFFvU415M7aQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YymPTmuvZvesBozAgdnLevRegvom/FYvPVEBPkiJcc7eUlmYfaH
	MMJsFY8YzTNAQqGgfa7kwiIR4FKsrqKbFxYAhMRBYqcr5/FYCq8zO6o6h/QFu1gg7ZTj+KNPST1
	whYJYMAtyz49YZGnGIxc1U+9sUKjTI8E=
X-Received: by 2002:a05:6214:1c82:b0:8be:7ed5:477b with SMTP id
 6a1803df08f44-8ca0f6b95a0mr188510036d6.22.1779007526681; Sun, 17 May 2026
 01:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
In-Reply-To: <afTpoL3FklpQZNMM@casper.infradead.org>
From: Barry Song <baohua@kernel.org>
Date: Sun, 17 May 2026 16:45:15 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
X-Gm-Features: AVHnY4ICHad0vRrEOEwJ7DjNSE1jL9epFkBx0OBK2sLJbi9Nv2hHU65J8Z0HpVM
Message-ID: <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Matthew Wilcox <willy@infradead.org>, surenb@google.com
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org, 
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, 
	chentao@kylinos.cn, lianux.mm@gmail.com, kunwu.chan@gmail.com, 
	liyangouwen1@oppo.com, chrisl@kernel.org, kasong@tencent.com, 
	shikemeng@huaweicloud.com, nphamcs@gmail.com, bhe@redhat.com, 
	youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
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

T24gU2F0LCBNYXkgMiwgMjAyNiBhdCAxOjU44oCvQU0gTWF0dGhldyBXaWxjb3ggPHdpbGx5QGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBNYXkgMDIsIDIwMjYgYXQgMDE6NDQ6MzRB
TSArMDgwMCwgQmFycnkgU29uZyB3cm90ZToKPiA+IE9uIEZyaSwgTWF5IDEsIDIwMjYgYXQgMTA6
NTfigK9QTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPiA+
Cj4gPiA+IE9uIEZyaSwgTWF5IDAxLCAyMDI2IGF0IDA2OjQ5OjU4QU0gKzA4MDAsIEJhcnJ5IFNv
bmcgd3JvdGU6Cj4gPiA+ID4gMS4gVGhlcmUgaXMgbm8gZGV0ZXJtaW5pc3RpYyBsYXRlbmN5IGZv
ciBJL08gY29tcGxldGlvbi4gSXQgZGVwZW5kcyBvbgo+ID4gPiA+IGJvdGggdGhlIGhhcmR3YXJl
IGFuZCB0aGUgc29mdHdhcmUgc3RhY2sgKGJpby9yZXF1ZXN0IHF1ZXVlcyBhbmQgdGhlCj4gPiA+
ID4gYmxvY2sgc2NoZWR1bGVyKS4gU29tZXRpbWVzIHRoZSBsYXRlbmN5IGlzIHNob3J0OyBhdCBv
dGhlciB0aW1lcyBpdCBjYW4KPiA+ID4gPiBiZSBxdWl0ZSBsb25nLiBJbiBzdWNoIGNhc2VzLCBh
IGhpZ2gtcHJpb3JpdHkgdGhyZWFkIHBlcmZvcm1pbmcgb3BlcmF0aW9ucwo+ID4gPiA+IHN1Y2gg
YXMgbXByb3RlY3QsIHVubWFwLCBwcmN0bF9zZXRfdm1hLCBvciBtYWR2aXNlIG1heSBiZSBmb3Jj
ZWQgdG8gd2FpdAo+ID4gPiA+IGZvciBhbiB1bnByZWRpY3RhYmxlIGFtb3VudCBvZiB0aW1lLgo+
ID4gPgo+ID4gPiBCdXQgZG9lcyB0aGF0IGFjdHVhbGx5IGhhcHBlbj8gIEkgZmluZCBpdCBoYXJk
IHRvIGJlbGlldmUgdGhhdCB0aHJlYWQgQQo+ID4gPiB1bm1hcHMgYSBWTUEgd2hpbGUgdGhyZWFk
IEIgaXMgaW4gdGhlIG1pZGRsZSBvZiB0YWtpbmcgYSBwYWdlIGZhdWx0IGluCj4gPiA+IHRoYXQg
c2FtZSBWTUEuICBtcHJvdGVjdCgpIGFuZCBtYWR2aXNlKCkgYXJlIG1vcmUgbGlrZWx5IHRvIGhh
cHBlbiwgYnV0Cj4gPiA+IGl0IHN0aWxsIHNlZW1zIHJlYWxseSB1bmxpa2VseSB0byBtZS4KPiA+
Cj4gPiBJdCBkb2VzbuKAmXQgaGF2ZSB0byBpbnZvbHZlIHVubWFwcGluZyBvciBhcHBseWluZyBt
cHJvdGVjdCB0bwo+ID4gdGhlIGVudGlyZSBWTUHigJRqdXN0IGEgcG9ydGlvbiBvZiBpdCBpcyBz
dWZmaWNpZW50Lgo+Cj4gWWVzLCBidXQgdGhhdCBzdGlsbCBmYWlscyB0byBhbnN3ZXIgImRvZXMg
dGhpcyBhY3R1YWxseSBoYXBwZW4iLiAgSG93IG11Y2gKPiBwZXJmb3JtYW5jZSBpcyBhbGwgdGhp
cyBjb21wbGV4aXR5IGluIHRoZSBwYWdlIGZhdWx0IGhhbmRsZXIgYnV5aW5nIHVzPwo+IElmIHlv
dSBkb24ndCBhbnN3ZXIgdGhpcyBxdWVzdGlvbiwgSSdtIGp1c3QgZ29pbmcgdG8gZ28gaW4gYW5k
IHJpcCBpdAo+IGFsbCBvdXQuCj4KCkhpIE1hdHRoZXcgKGFuZCBMb3JlbnpvLCBKYW4sIGFuZCBh
bnlvbmUgZWxzZSB3aG8gbWF5IGJlCndhaXRpbmcgZm9yIGFuc3dlcnMpLAoKQXMgcHJvbWlzZWQg
ZHVyaW5nIExTRi9NTS9CUEYsIHdlIGNvbmR1Y3RlZCB0aG9yb3VnaAp0ZXN0aW5nIG9uIEFuZHJv
aWQgcGhvbmVzIHRvIGRldGVybWluZSB3aGV0aGVyIHBlcmZvcm1pbmcKSS9PIGluIGBmaWxlbWFw
X2ZhdWx0KClgIGNhbiBibG9jayBgdm1hX3N0YXJ0X3dyaXRlKClgLgpJIHdhbnRlZCB0byBnaXZl
IGEgcXVpY2sgdXBkYXRlIG9uIHRoaXMgcXVlc3Rpb24uCgpOYW56aGUgYXQgWGlhb21pIGNyZWF0
ZWQgdHJhY2luZyBzY3JpcHRzIGFuZCByYW4gdmFyaW91cwphcHBsaWNhdGlvbnMgb24gQW5kcm9p
ZCBkZXZpY2VzIHdpdGggSS9PIHBlcmZvcm1lZCB1bmRlcgp0aGUgVk1BIGxvY2sgaW4gYGZpbGVt
YXBfZmF1bHQoKWAuIFdlIGZvdW5kIHRoYXQ6CgoxLiBUaGVyZSBhcmUgdmVyeSBmZXcgY2FzZXMg
d2hlcmUgdW5tYXAoKSBpcyBibG9ja2VkIGJ5CiAgIHBhZ2UgZmF1bHRzLiBJIGFzc3VtZSB0aGlz
IGlzIGR1ZSB0byBidWdneSB1c2VyIGNvZGUKICAgb3IgcG9vciBzeW5jaHJvbml6YXRpb24gYmV0
d2VlbiByZWFkcyBhbmQgdW5tYXAoKS4KU28gSSBhc3N1bWUgaXQgaXMgbm90IGEgcHJvYmxlbS4K
CjIuIFdlIG9ic2VydmVkIG1hbnkgY2FzZXMgd2hlcmUgYHZtYV9zdGFydF93cml0ZSgpYAogICBp
cyBibG9ja2VkIGJ5IHBhZ2UtZmF1bHQgSS9PIGluIHNvbWUgYXBwbGljYXRpb25zLgogICBUaGUg
YmxvY2tpbmcgb2NjdXJzIGluIHRoZSBgZHVwX21tYXAoKWAgcGF0aCBkdXJpbmcKICAgZm9yaygp
LgoKV2l0aCBTdXJlbidzIGNvbW1pdCBmYjQ5YzQ1NTMyM2ZmICgiZm9yazogbG9jayBWTUFzIG9m
CnRoZSBwYXJlbnQgcHJvY2VzcyB3aGVuIGZvcmtpbmciKSwgd2Ugbm93IGFsd2F5cyBob2xkCmB2
bWFfd3JpdGVfbG9jaygpYCBmb3IgZWFjaCBWTUEuIE5vdGUgdGhhdCB0aGUKYG1tYXBfbG9ja2Ag
d3JpdGUgbG9jayBpcyBhbHNvIGhlbGQsIHdoaWNoIGNvdWxkIGxlYWQgdG8KY2hhaW5lZCB3YWl0
aW5nIGlmIHBhZ2UtZmF1bHQgSS9PIGlzIHBlcmZvcm1lZCB3aXRob3V0CnJlbGVhc2luZyB0aGUg
Vk1BIGxvY2suCgpNeSBndXQgZmVlbGluZyBpcyB0aGF0IFN1cmVuJ3MgY29tbWl0IG1heSBiZSBv
dmVyc2hvb3RpbmcsCnNvIG15IHJvdWdoIGlkZWEgaXMgdGhhdCB3ZSBtaWdodCB3YW50IHRvIGRv
IHNvbWV0aGluZyBsaWtlCnRoZSBmb2xsb3dpbmcgKHdlIGhhdmVuJ3QgdGVzdGVkIGl0IHlldCBh
bmQgaXQgbWlnaHQgYmUKd3JvbmcpOgoKZGlmZiAtLWdpdCBhL21tL21tYXAuYyBiL21tL21tYXAu
YwppbmRleCAyMzExYWU3YzJmZjQuLjVkZGFmMjk3ZjMxYSAxMDA2NDQKLS0tIGEvbW0vbW1hcC5j
CisrKyBiL21tL21tYXAuYwpAQCAtMTc2Miw3ICsxNzYyLDEzIEBAIF9fbGF0ZW50X2VudHJvcHkg
aW50IGR1cF9tbWFwKHN0cnVjdCBtbV9zdHJ1Y3QKKm1tLCBzdHJ1Y3QgbW1fc3RydWN0ICpvbGRt
bSkKICAgICAgICBmb3JfZWFjaF92bWEodm1pLCBtcG50KSB7CiAgICAgICAgICAgICAgICBzdHJ1
Y3QgZmlsZSAqZmlsZTsKCi0gICAgICAgICAgICAgICByZXR2YWwgPSB2bWFfc3RhcnRfd3JpdGVf
a2lsbGFibGUobXBudCk7CisgICAgICAgICAgICAgICAvKgorICAgICAgICAgICAgICAgICogRm9y
IGFub255bW91cyBvciB3cml0YWJsZSBwcml2YXRlIFZNQXMsIHByZXZlbnQKKyAgICAgICAgICAg
ICAgICAqIGNvbmN1cnJlbnQgQ29XIGZhdWx0cy4KKyAgICAgICAgICAgICAgICAqLworICAgICAg
ICAgICAgICAgaWYgKCFtcG50LT52bV9maWxlIHx8ICghKG1wbnQtPnZtX2ZsYWdzICYgVk1fU0hB
UkVEKSAmJgorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKG1wbnQtPnZt
X2ZsYWdzICYgVk1fV1JJVEUpKSkKKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dmFsID0gdm1h
X3N0YXJ0X3dyaXRlX2tpbGxhYmxlKG1wbnQpOwogICAgICAgICAgICAgICAgaWYgKHJldHZhbCA8
IDApCiAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gbG9vcF9vdXQ7CiAgICAgICAgICAgICAg
ICBpZiAobXBudC0+dm1fZmxhZ3MgJiBWTV9ET05UQ09QWSkgewoKQmFzZWQgb24gdGhlIGFib3Zl
LCB3ZSBtYXkgd2FudCB0byByZS1jaGVjayB3aGV0aGVyIGZvcmsoKQpjYW4gYmUgYmxvY2tlZCBi
eSBwYWdlIGZhdWx0cy4gQXQgdGhlIHNhbWUgdGltZSwgaWYgU3VyZW4sCnlvdSwgb3IgYW55b25l
IGVsc2UgaGFzIGFueSBjb21tZW50cywgcGxlYXNlIGZlZWwgZnJlZSB0bwpzaGFyZSB0aGVtLgoK
QmVzdCBSZWdhcmRzCkJhcnJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
