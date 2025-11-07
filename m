Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAB9CCFA05
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 01:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omfaoh4rOXJrUId+26JlMJV9DHb/AxxOwG54C3O3xR0=; b=AkO5baSV8NLijU
	jo1tsJCkxES0vk9Wk+Dc6brvzg0XSTrQqrvyRAV03jJnHVJDjY4P2CocKMhrbS5viuD6Tssd3EAbx
	kWSl6yGCBn93C2n4jHN+B+0pe6nfxozs9/PCpf93agDGUQDnzNTW7mPMbziDYOGMa7AmSgQTQDNb1
	RSLi3PS7kfQBlNzNDHEMznLkoY9jTfuNaMIXJ7LoZK3vnAK/2b48PXQDLdBwzZ45YstTpSE4ctfbV
	KVreUyuyghQb4p/VPPYbBUPxBDGig+J+hkCZcANIPmm+HWYXwKHLG9kXIOq8RJ7cv/pbacqmiX9Qp
	Ekw9tHjOMUzMq8e4zOhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHBhy-0000000GXbx-1nj8;
	Fri, 07 Nov 2025 01:56:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHBhw-0000000GXbk-1rQB
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 01:56:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 920E2601CD
	for <linux-riscv@lists.infradead.org>; Fri,  7 Nov 2025 01:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42370C16AAE
	for <linux-riscv@lists.infradead.org>; Fri,  7 Nov 2025 01:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762480567;
	bh=U/5Gf2mYzxk1MNILsZoteKsMvo2KOHGu8VCc+rGrsOg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ic3brTNwMLAorC+gxpbXti0fu+4P39P7xNE+9926SDPuVywzTMGimRlXqEcqXcj2q
	 w42JjQdQz7opAzxMRkARQUheMXtwU+tLteVfeWXLG7jw9YPut1dinZVQvnQ1XpeM7a
	 QL20di+/SejW8D1vwmB4FxLZ0oWaVqoYthUHDABkE+Zainu5ERUuWcihhdk+AdbFgr
	 NuEfgntV9bJ7CnLPyBqYESlojSf+s8o3UNcZSAce5QeEoGErFfflsZ3MeLpb6cCpO4
	 wI4i0U0Rwl3lKDxe4RKyFfM3AuIjDsfp35y/svfSWuEpXbYw3DR7LfArNS6Mo4SArz
	 +mY0rGY7CtPmg==
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4710665e7deso881505e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Nov 2025 17:56:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUeRRUHe4U/37Bkt8grLuwO/bcXGCKEiDEJRhIdsCTguxbICCOcUodGgVs1qU6Ydj4+r9maBWTQZVS+A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx01YTmEGmqIi1O2lYvpezYwvybmRtJoX6m/XMc6HxR10nyuMao
	d/BC/nRtmPXZaNQSzqzsISNUP2ipYLe5BXJ+ZwpwXkjk5rqLVgCOaJgdGaOD7rKVXxDju5axHlQ
	T/mhpPZWpinSEhAgUCJXlWJ18EFjkOX0=
X-Google-Smtp-Source: AGHT+IEor+2dI4OqNs5NW5mjQ+1lwHQyr994AWzvFdgZaaQu0e1GxyccqrO1isGGhTB8B5q5jbjQHSC3VP0rbLBjI84=
X-Received: by 2002:a05:600c:444b:b0:477:3543:3a38 with SMTP id
 5b1f17b1804b1-4776bca7d60mr8818545e9.1.1762480565818; Thu, 06 Nov 2025
 17:56:05 -0800 (PST)
MIME-Version: 1.0
References: <20251030135652.63837-1-luxu.kernel@bytedance.com>
In-Reply-To: <20251030135652.63837-1-luxu.kernel@bytedance.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 7 Nov 2025 09:55:53 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ8TGWQWU8rKstGwuEz1hE97cgwzNsugzKzxwJdd-TNDg@mail.gmail.com>
X-Gm-Features: AWmQ_blwsNd28hWAF_kEz2l_K99GqHJ9hzdELZe5cCqxZ2WTM89bjodhPLNmRQU
Message-ID: <CAJF2gTQ8TGWQWU8rKstGwuEz1hE97cgwzNsugzKzxwJdd-TNDg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/4] riscv: mm: Defer tlb flush to context_switch
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gVGh1LCBPY3QgMzAsIDIwMjUgYXQgOTo1N+KAr1BNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IFdoZW4gbmVlZCB0byBmbHVzaCB0bGIgb2YgYSByZW1vdGUg
Y3B1LCB0aGVyZSBpcyBubyBuZWVkIHRvIHNlbmQgYW4gSVBJCj4gaWYgdGhlIHRhcmdldCBjcHUg
aXMgbm90IHVzaW5nIHRoZSBhc2lkIHdlIHdhbnQgdG8gZmx1c2guIEluc3RlYWQsIHdlCj4gY2Fu
IGNhY2hlIHRoZSB0bGIgZmx1c2ggaW5mbyBpbiBwZXJjcHUgYnVmZmVyLCBhbmQgZGVmZXIgdGhl
IHRsYiBmbHVzaAo+IHRvIHRoZSBuZXh0IGNvbnRleHRfc3dpdGNoLgo+Cj4gVGhpcyByZWR1Y2Vz
IHRoZSBudW1iZXIgb2YgSVBJIGR1ZSB0byB0bGIgZmx1c2g6Cj4KPiAqIGx0cCAtIG1tYXBzdHJl
c3MwMQo+IEJlZm9yZTogfjEwOGsKPiBBZnRlcjogfjQ2awoKQ291bGQgeW91IGFkZCB0aGUgcmVz
dWx0cyBmb3IgdGhlc2UgdHdvIHRlc3QgY2FzZXMgdG8gdGhlIG5leHQgdmVyc2lvbj8KCiogbG1i
ZW5jaCAtIGxhdF9wYWdlZmF1bHQKKiBsbWJlbmNoIC0gbGF0X21tYXAKClRoYW5rIHlvdSEKCj4K
PiBGdXR1cmUgcGxhbiBpbiB0aGUgbmV4dCB2ZXJzaW9uOgo+Cj4gLSBUaGlzIHBhdGNoIHNlcmll
cyByZWR1Y2VzIElQSSBieSBkZWZlcnJpbmcgdGxiIGZsdXNoIHRvCj4gY29udGV4dF9zd2l0Y2gu
IEl0IGRvZXMgbm90IGNsZWFyIHRoZSBtbV9jcHVtYXNrIG9mIHRhcmdldCBtbV9zdHJ1Y3QuIElu
Cj4gdGhlIG5leHQgdmVyc2lvbiwgSSB3aWxsIGFwcGx5IGEgdGhyZXNob2xkIHRvIHRoZSBudW1i
ZXIgb2YgQVNJRHMKPiBtYWludGFpbmVkIGJ5IGVhY2ggY3B1J3MgdGxiLiBPbmNlIHRoZSB0aHJl
c2hvbGQgaXMgZXhjZWVkZWQsIEFTSUQgdGhhdAo+IGhhcyBub3QgYmVlbiB1c2VkIGZvciB0aGUg
bG9uZ2VzdCB0aW1lIHdpbGwgYmUgZmx1c2hlZCBvdXQuIEFuZCBjdXJyZW50Cj4gY3B1IHdpbGwg
YmUgY2xlYXJlZCBpbiB0aGUgbW1fY3B1bWFzay4KPgo+IFRoYW5rcyBpbiBhZHZhbmNlIGZvciB5
b3VyIGNvbW1lbnRzLgo+Cj4gWHUgTHUgKDQpOgo+ICAgcmlzY3Y6IG1tOiBJbnRyb2R1Y2UgcGVy
Y3B1IGxvYWRlZF9hc2lkCj4gICByaXNjdjogbW06IEludHJvZHVjZSBwZXJjcHUgdGxiIGZsdXNo
IHF1ZXVlCj4gICByaXNjdjogbW06IEVucXVldWUgdGxiZmx1c2ggaW5mbyBpZiB0YXNrIGlzIG5v
dCBydW5uaW5nIG9uIHRhcmdldCBjcHUKPiAgIHJpc2N2OiBtbTogUGVyZm9ybSB0bGIgZmx1c2gg
ZHVyaW5nIGNvbnRleHRfc3dpdGNoCj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9tbXVfY29u
dGV4dC5oIHwgIDEgKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggICAgfCAg
NCArKwo+ICBhcmNoL3Jpc2N2L21tL2NvbnRleHQuYyAgICAgICAgICAgICAgfCAxMCArKysrCj4g
IGFyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyAgICAgICAgICAgICB8IDc2ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKy0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA5MCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiAtLQo+IDIuMjAuMQo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
