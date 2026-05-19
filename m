Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36ACCD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 20:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AstCj39hIIRHZXPYGXpysBeT+Pq9+EttSpsBYMwOiic=; b=AlCNJgZN0IocFS
	DESCScYWaoGwtQR+thPNa17/ysRB53nVGi5MYhhWIYcVYhNRWiQep6zLkc9yi20cfF9C7vsf0knY5
	V0hZOSc8mPGf+gvePOIZ18wCgbmMImYNOwk92cU7wyiaJLPxuPKVd6sexAfJLo273uRhPI3QBJJpN
	HGXe0+YZkOk8RYMD8nU1eh3Y/OQNzpimPh+4QsJdyXcDtH0+vwqLPHVVNirWJI+3vUyZ83uW5uJVk
	yrJeWUYF7VPNw2QykvDVvEgN1f+6SZfhdEltioRMvTh9eSkW1AwRiPxVGogNJ/fD7t6CI3dMIPWtV
	RkiRHFHHaWn69cd7sclQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRS2-00000002mdO-1dEG;
	Tue, 19 May 2026 20:54:06 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRRE-00000002mW6-3N7g
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 20:54:05 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso7216510a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 13:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779223995; cv=none;
        d=google.com; s=arc-20240605;
        b=R3tOqPCYhtiO5Ql9bSxWXSp4JiSBx6ltRNSasCgCC9JEnGqLR6GzmS9YHsyGS9Kuo6
         p2YFJbxnEU+fKvHhpasBIjT9Ci60KSS0KDy+U+RbvnVjT6PiuUxG6QI/y2bdazds5kDQ
         mgvk1Kwd1tQXItuX5nDJnFmdAiJtKpgafRNgz6dtUBKKcVIZWa5+4dSvp6YLl6Hf7Lpy
         F9WBESgZCWkc9q2Ay7tnCLd315nuHgI2vgjTK+uf3ErHx3u/VEgrKe0zddGCIIRCxQbm
         zSLJrsdXz7LPU8/Ru/lbj4KpKAC6p24tyZ2DgateHRGEwXpryz2WlLoNeEUrQpxx7Xj8
         vHaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ae+dijTOTo/8e3HvGN3FEZCQc/7H0q/1pnPZoGZAADo=;
        fh=c0AgVnGUcC9yA4aQlScsTxfOaySQGHMKMw8pUMz/F70=;
        b=KsYEx30SS15XZEa9z/MSPoQK176Cp3sZXEv/cu98PZIvarzeeWY3d5zirq5A1CiWuN
         17NeAlqsJ5GK0ay5RZMLq4UVcWLTFz9Q9lL9B6hOw9SrYoblGg63PTmMeFxpud+1nEUw
         zbLJqAZ+Rix9JBNLmgLkVXTyaarxr5F/qFl/k6Qd8JHl50wEL+OVSuD3PqWksWT8H4Ak
         QX6Y4YNeu4FLhhaUl+ljNHSFL4II3DZPLC5R0Z9b5QdZkntwpxS5Ms9aI16r7q6PwX5s
         pw7RvxI4cQmYhHdmEEqkjbswqFj+1XNoSlcznZszDGn6xM2GqafgOGR2RRLaagCTmikm
         K8Ig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779223995; x=1779828795; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ae+dijTOTo/8e3HvGN3FEZCQc/7H0q/1pnPZoGZAADo=;
        b=IrVp+opXrNxLUTK8wwjUs9X7y0WaYj3sHXbm+aBMdzgE39kjItaUaJd+6xFIPl1SqR
         m5wbzgxIrGLynAjrxA8oDWX84bHemnqF5XSqWF3KwIpYtkGz8UDukyCq0l5h/+tsO3n/
         QqUMnq9N0MquFEhtJr+1ozlC5tClT/QwOSWwEWeQEAIlMnxS+QNa0a2mlSNUg3M0dHb6
         fMVHoulXkv4Lu9VFEpT2VKTKi4Wd4UxsNHvJJuFqJrBJOrbAyTAsht6OWDdfMBdIPrCJ
         7nwyW/5qNtexOBWAZ3wvc35djXMhl8ep8Wi6nyb/YSwBghfxCuI30fMnCAohwyU05Sb6
         TCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779223995; x=1779828795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ae+dijTOTo/8e3HvGN3FEZCQc/7H0q/1pnPZoGZAADo=;
        b=jLYJb4lwwPEIthVA9kWpUinI0NEhuD77Ja4Rm8GTWdGoIxnasIci8d6pi0cYXoic2O
         sCQAtBkUHgdG1E5qEkKjourskN09JfCdDS3DUQKEe9ljipRK/4VvjGu/lhJbLlH2hYud
         C4iQvN2Rp4U1X0RzqjQE92Aqs8J7lkqKPCRsMOtrOVoGgjiU+Pppqcu/K11yPfkzlXy+
         NhRvBdPsbb74TX9jzw8HSegxUf/DHpkuyCUBEe2qQ9k0tuMzgc0JyNT4ctvGZFstBwaA
         /EO9gUIUE9kJmB+QuSgMBCkNZM4YrmtLIa70VKjJmG1GhZo6thhr8oEe64HHArcCU+6g
         5QZg==
X-Forwarded-Encrypted: i=1; AFNElJ/1/bk+W19h4mCZUX7ySaxZf38EHr3U3vLAL4jHFEa7WIWkrfCYGyklivLXiD5JrVQoc6cwZ3wx+UJ2hw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyN55ei7czr3oQAmqs1FyFiuh/+LcLYhOQG8IUcYq5kPe7BwzDZ
	MRQEVz+gfPGI5y15XjbdxlRhO573FUjbIYjyz/Z8tcuN2maWXOvuS1BO5TLfVE0OaBOYUEygTSG
	Lpk7PSyvEWcQoCuZH6T8VuIfM8Wtsrzo=
X-Gm-Gg: Acq92OGEtkDSSo2JB2PfEUu5HvtxXBhPntvsE1x//MYsnka5Ct/GrXYSl92E45aIoE6
	1ou/GSVprijMpeIdEaTb/akiiyfbEsphJ4Xp2hK+ykgbKIet6qhwxxH4yuRi9xZCiLNdDGzKpPj
	83RD22BIEzo3So0j5oTXTJcmzEiiuQZSlUOM3OFe50OSA2A0kxZRhq4TPnHX//oiTLueh7T2QeX
	buGxS+PdoW/jtKcp6XpDS714rnjzJ3aGCOdNQnZcyAMfs+t1tfnnamcJWHB9g09NgRZ0ov/NqSx
	ohV7ytVXnA==
X-Received: by 2002:a05:6402:24ce:b0:683:1cc8:84b5 with SMTP id
 4fb4d7f45d1cf-683bc1b7472mr10554792a12.4.1779223994390; Tue, 19 May 2026
 13:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <CAHbLzkrOSoh-jmR=uaNvx73n_wn+vExoKY0UzH5zGcfdAiDbNg@mail.gmail.com>
 <CAGsJ_4w_-Y8qNLDeLX9OWpLpK01YG2bF-N6_mGypgsauvfCvkA@mail.gmail.com> <CAHbLzkpbQ4Ca0xC74BJ6iJUVKdpH90qE+E=g7HkDXvcNH1+8+w@mail.gmail.com>
In-Reply-To: <CAHbLzkpbQ4Ca0xC74BJ6iJUVKdpH90qE+E=g7HkDXvcNH1+8+w@mail.gmail.com>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 19 May 2026 13:53:03 -0700
X-Gm-Features: AVHnY4IimOZqeIRblNaSy2KsMS8vB_GzCmlGYie_zXnP_ZtHrsCb1dPTmYJGNBE
Message-ID: <CAHbLzkp7WcXA6Zey2QjBDrcs1w2hP4dhBoda2G3XF+Q0h_hwsQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Barry Song <baohua@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, surenb@google.com, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, jack@suse.cz, 
	pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, 
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Nanzhe Zhao <nzzhao@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_135316_899194_36A6446A 
X-CRM114-Status: GOOD (  63.80  )
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

T24gVHVlLCBNYXkgMTksIDIwMjYgYXQgMTE6NTDigK9BTSBZYW5nIFNoaSA8c2h5ODI4MzAxQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAxOSwgMjAyNiBhdCA0OjA34oCvQU0gQmFy
cnkgU29uZyA8YmFvaHVhQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgTWF5IDE5
LCAyMDI2IGF0IDU6MjHigK9BTSBZYW5nIFNoaSA8c2h5ODI4MzAxQGdtYWlsLmNvbT4gd3JvdGU6
Cj4gPiA+Cj4gPiA+IE9uIFN1biwgTWF5IDE3LCAyMDI2IGF0IDE6NDXigK9BTSBCYXJyeSBTb25n
IDxiYW9odWFAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBTYXQsIE1heSAy
LCAyMDI2IGF0IDE6NTjigK9BTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4g
d3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gU2F0LCBNYXkgMDIsIDIwMjYgYXQgMDE6NDQ6
MzRBTSArMDgwMCwgQmFycnkgU29uZyB3cm90ZToKPiA+ID4gPiA+ID4gT24gRnJpLCBNYXkgMSwg
MjAyNiBhdCAxMDo1N+KAr1BNIE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPiB3
cm90ZToKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IE9uIEZyaSwgTWF5IDAxLCAyMDI2IGF0
IDA2OjQ5OjU4QU0gKzA4MDAsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiAxLiBU
aGVyZSBpcyBubyBkZXRlcm1pbmlzdGljIGxhdGVuY3kgZm9yIEkvTyBjb21wbGV0aW9uLiBJdCBk
ZXBlbmRzIG9uCj4gPiA+ID4gPiA+ID4gPiBib3RoIHRoZSBoYXJkd2FyZSBhbmQgdGhlIHNvZnR3
YXJlIHN0YWNrIChiaW8vcmVxdWVzdCBxdWV1ZXMgYW5kIHRoZQo+ID4gPiA+ID4gPiA+ID4gYmxv
Y2sgc2NoZWR1bGVyKS4gU29tZXRpbWVzIHRoZSBsYXRlbmN5IGlzIHNob3J0OyBhdCBvdGhlciB0
aW1lcyBpdCBjYW4KPiA+ID4gPiA+ID4gPiA+IGJlIHF1aXRlIGxvbmcuIEluIHN1Y2ggY2FzZXMs
IGEgaGlnaC1wcmlvcml0eSB0aHJlYWQgcGVyZm9ybWluZyBvcGVyYXRpb25zCj4gPiA+ID4gPiA+
ID4gPiBzdWNoIGFzIG1wcm90ZWN0LCB1bm1hcCwgcHJjdGxfc2V0X3ZtYSwgb3IgbWFkdmlzZSBt
YXkgYmUgZm9yY2VkIHRvIHdhaXQKPiA+ID4gPiA+ID4gPiA+IGZvciBhbiB1bnByZWRpY3RhYmxl
IGFtb3VudCBvZiB0aW1lLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gQnV0IGRvZXMgdGhh
dCBhY3R1YWxseSBoYXBwZW4/ICBJIGZpbmQgaXQgaGFyZCB0byBiZWxpZXZlIHRoYXQgdGhyZWFk
IEEKPiA+ID4gPiA+ID4gPiB1bm1hcHMgYSBWTUEgd2hpbGUgdGhyZWFkIEIgaXMgaW4gdGhlIG1p
ZGRsZSBvZiB0YWtpbmcgYSBwYWdlIGZhdWx0IGluCj4gPiA+ID4gPiA+ID4gdGhhdCBzYW1lIFZN
QS4gIG1wcm90ZWN0KCkgYW5kIG1hZHZpc2UoKSBhcmUgbW9yZSBsaWtlbHkgdG8gaGFwcGVuLCBi
dXQKPiA+ID4gPiA+ID4gPiBpdCBzdGlsbCBzZWVtcyByZWFsbHkgdW5saWtlbHkgdG8gbWUuCj4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEl0IGRvZXNu4oCZdCBoYXZlIHRvIGludm9sdmUgdW5tYXBw
aW5nIG9yIGFwcGx5aW5nIG1wcm90ZWN0IHRvCj4gPiA+ID4gPiA+IHRoZSBlbnRpcmUgVk1B4oCU
anVzdCBhIHBvcnRpb24gb2YgaXQgaXMgc3VmZmljaWVudC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBZ
ZXMsIGJ1dCB0aGF0IHN0aWxsIGZhaWxzIHRvIGFuc3dlciAiZG9lcyB0aGlzIGFjdHVhbGx5IGhh
cHBlbiIuICBIb3cgbXVjaAo+ID4gPiA+ID4gcGVyZm9ybWFuY2UgaXMgYWxsIHRoaXMgY29tcGxl
eGl0eSBpbiB0aGUgcGFnZSBmYXVsdCBoYW5kbGVyIGJ1eWluZyB1cz8KPiA+ID4gPiA+IElmIHlv
dSBkb24ndCBhbnN3ZXIgdGhpcyBxdWVzdGlvbiwgSSdtIGp1c3QgZ29pbmcgdG8gZ28gaW4gYW5k
IHJpcCBpdAo+ID4gPiA+ID4gYWxsIG91dC4KPiA+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBIaSBN
YXR0aGV3IChhbmQgTG9yZW56bywgSmFuLCBhbmQgYW55b25lIGVsc2Ugd2hvIG1heSBiZQo+ID4g
PiA+IHdhaXRpbmcgZm9yIGFuc3dlcnMpLAo+ID4gPiA+Cj4gPiA+ID4gQXMgcHJvbWlzZWQgZHVy
aW5nIExTRi9NTS9CUEYsIHdlIGNvbmR1Y3RlZCB0aG9yb3VnaAo+ID4gPiA+IHRlc3Rpbmcgb24g
QW5kcm9pZCBwaG9uZXMgdG8gZGV0ZXJtaW5lIHdoZXRoZXIgcGVyZm9ybWluZwo+ID4gPiA+IEkv
TyBpbiBgZmlsZW1hcF9mYXVsdCgpYCBjYW4gYmxvY2sgYHZtYV9zdGFydF93cml0ZSgpYC4KPiA+
ID4gPiBJIHdhbnRlZCB0byBnaXZlIGEgcXVpY2sgdXBkYXRlIG9uIHRoaXMgcXVlc3Rpb24uCj4g
PiA+ID4KPiA+ID4gPiBOYW56aGUgYXQgWGlhb21pIGNyZWF0ZWQgdHJhY2luZyBzY3JpcHRzIGFu
ZCByYW4gdmFyaW91cwo+ID4gPiA+IGFwcGxpY2F0aW9ucyBvbiBBbmRyb2lkIGRldmljZXMgd2l0
aCBJL08gcGVyZm9ybWVkIHVuZGVyCj4gPiA+ID4gdGhlIFZNQSBsb2NrIGluIGBmaWxlbWFwX2Zh
dWx0KClgLiBXZSBmb3VuZCB0aGF0Ogo+ID4gPiA+Cj4gPiA+ID4gMS4gVGhlcmUgYXJlIHZlcnkg
ZmV3IGNhc2VzIHdoZXJlIHVubWFwKCkgaXMgYmxvY2tlZCBieQo+ID4gPiA+ICAgIHBhZ2UgZmF1
bHRzLiBJIGFzc3VtZSB0aGlzIGlzIGR1ZSB0byBidWdneSB1c2VyIGNvZGUKPiA+ID4gPiAgICBv
ciBwb29yIHN5bmNocm9uaXphdGlvbiBiZXR3ZWVuIHJlYWRzIGFuZCB1bm1hcCgpLgo+ID4gPiA+
IFNvIEkgYXNzdW1lIGl0IGlzIG5vdCBhIHByb2JsZW0uCj4gPiA+ID4KPiA+ID4gPiAyLiBXZSBv
YnNlcnZlZCBtYW55IGNhc2VzIHdoZXJlIGB2bWFfc3RhcnRfd3JpdGUoKWAKPiA+ID4gPiAgICBp
cyBibG9ja2VkIGJ5IHBhZ2UtZmF1bHQgSS9PIGluIHNvbWUgYXBwbGljYXRpb25zLgo+ID4gPiA+
ICAgIFRoZSBibG9ja2luZyBvY2N1cnMgaW4gdGhlIGBkdXBfbW1hcCgpYCBwYXRoIGR1cmluZwo+
ID4gPiA+ICAgIGZvcmsoKS4KPiA+ID4gPgo+ID4gPiA+IFdpdGggU3VyZW4ncyBjb21taXQgZmI0
OWM0NTUzMjNmZiAoImZvcms6IGxvY2sgVk1BcyBvZgo+ID4gPiA+IHRoZSBwYXJlbnQgcHJvY2Vz
cyB3aGVuIGZvcmtpbmciKSwgd2Ugbm93IGFsd2F5cyBob2xkCj4gPiA+ID4gYHZtYV93cml0ZV9s
b2NrKClgIGZvciBlYWNoIFZNQS4gTm90ZSB0aGF0IHRoZQo+ID4gPiA+IGBtbWFwX2xvY2tgIHdy
aXRlIGxvY2sgaXMgYWxzbyBoZWxkLCB3aGljaCBjb3VsZCBsZWFkIHRvCj4gPiA+ID4gY2hhaW5l
ZCB3YWl0aW5nIGlmIHBhZ2UtZmF1bHQgSS9PIGlzIHBlcmZvcm1lZCB3aXRob3V0Cj4gPiA+ID4g
cmVsZWFzaW5nIHRoZSBWTUEgbG9jay4KPiA+ID4gPgo+ID4gPiA+IE15IGd1dCBmZWVsaW5nIGlz
IHRoYXQgU3VyZW4ncyBjb21taXQgbWF5IGJlIG92ZXJzaG9vdGluZywKPiA+ID4gPiBzbyBteSBy
b3VnaCBpZGVhIGlzIHRoYXQgd2UgbWlnaHQgd2FudCB0byBkbyBzb21ldGhpbmcgbGlrZQo+ID4g
PiA+IHRoZSBmb2xsb3dpbmcgKHdlIGhhdmVuJ3QgdGVzdGVkIGl0IHlldCBhbmQgaXQgbWlnaHQg
YmUKPiA+ID4gPiB3cm9uZyk6Cj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvbW0vbW1hcC5j
IGIvbW0vbW1hcC5jCj4gPiA+ID4gaW5kZXggMjMxMWFlN2MyZmY0Li41ZGRhZjI5N2YzMWEgMTAw
NjQ0Cj4gPiA+ID4gLS0tIGEvbW0vbW1hcC5jCj4gPiA+ID4gKysrIGIvbW0vbW1hcC5jCj4gPiA+
ID4gQEAgLTE3NjIsNyArMTc2MiwxMyBAQCBfX2xhdGVudF9lbnRyb3B5IGludCBkdXBfbW1hcChz
dHJ1Y3QgbW1fc3RydWN0Cj4gPiA+ID4gKm1tLCBzdHJ1Y3QgbW1fc3RydWN0ICpvbGRtbSkKPiA+
ID4gPiAgICAgICAgIGZvcl9lYWNoX3ZtYSh2bWksIG1wbnQpIHsKPiA+ID4gPiAgICAgICAgICAg
ICAgICAgc3RydWN0IGZpbGUgKmZpbGU7Cj4gPiA+ID4KPiA+ID4gPiAtICAgICAgICAgICAgICAg
cmV0dmFsID0gdm1hX3N0YXJ0X3dyaXRlX2tpbGxhYmxlKG1wbnQpOwo+ID4gPiA+ICsgICAgICAg
ICAgICAgICAvKgo+ID4gPiA+ICsgICAgICAgICAgICAgICAgKiBGb3IgYW5vbnltb3VzIG9yIHdy
aXRhYmxlIHByaXZhdGUgVk1BcywgcHJldmVudAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgKiBj
b25jdXJyZW50IENvVyBmYXVsdHMuCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAqLwo+ID4gPiA+
ICsgICAgICAgICAgICAgICBpZiAoIW1wbnQtPnZtX2ZpbGUgfHwgKCEobXBudC0+dm1fZmxhZ3Mg
JiBWTV9TSEFSRUQpICYmCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIChtcG50LT52bV9mbGFncyAmIFZNX1dSSVRFKSkpCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dmFsID0gdm1hX3N0YXJ0X3dyaXRlX2tpbGxhYmxlKG1wbnQpOwo+ID4g
PiA+ICAgICAgICAgICAgICAgICBpZiAocmV0dmFsIDwgMCkKPiA+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICBnb3RvIGxvb3Bfb3V0Owo+ID4gPiA+ICAgICAgICAgICAgICAgICBpZiAobXBu
dC0+dm1fZmxhZ3MgJiBWTV9ET05UQ09QWSkgewo+ID4gPgo+ID4gPiBNYXliZSBhIGxpdHRsZSBi
aXQgb2ZmIHRvcGljLiBUaGlzIGlzIGFuIGludGVyZXN0aW5nIGlkZWEuIEl0IHNlZW1zCj4gPiA+
IHBvc3NpYmxlIHdlIGRvbid0IGhhdmUgdG8gdGFrZSB2bWEgd3JpdGUgbG9jayB1bmNvbmRpdGlv
bmFsbHkuIElJVUMKPiA+ID4gdGhlIHdyaXRlIGxvY2sgaXMgbWFpbmx5IHVzZWQgdG8gc2VyaWFs
aXplIGFnYWluc3QgcGFnZSBmYXVsdCBhbmQKPiA+ID4gbWFkdmlzZSwgcmlnaHQ/IEkgZ290IGEg
Y3JhenkgaWRlYSBvZmYgdGhlIHRvcCBvZiBteSBoZWFkLiBXZSBtYXkgYmUKPiA+ID4gYWJsZSB0
byBqdXN0IHRha2Ugdm1hIHdyaXRlIGxvY2sgaWZmIHZtYS0+YW5vbl92bWEgaXMgbm90IE5VTEwu
Cj4gPiA+Cj4gPiA+IEZpcnN0IG9mIGFsbCwgd3JpdGUgbW1hcF9sb2NrIGlzIGhlbGQsIHNvIHRo
ZSB2bWEgY2FuJ3QgZ28gb3IgYmUKPiA+ID4gY2hhbmdlZCB1bmRlciB1cy4KPiA+ID4KPiA+ID4g
U2Vjb25kbHksIGlmIHZtYS0+YW5vbl92bWEgaXMgTlVMTCwgaXQgYmFzaWNhbGx5IG1lYW5zIGVp
dGhlciBubyBwYWdlCj4gPiA+IGZhdWx0IGhhcHBlbmVkIG9yIG5vIGNvdyBoYXBwZW5lZCwgc28g
dGhlcmUgaXMgbm8gcGFnZSB0YWJsZSB0byBjb3B5LAo+ID4gPiB0aGlzIGlzIGFsc28gd2hhdCBj
b3B5X3BhZ2VfcmFuZ2UoKSBkb2VzIGN1cnJlbnRseS4gU28gd2UgY2FuIHNocmluawo+ID4gPiB0
aGUgY3JpdGljYWwgc2VjdGlvbiB0bzoKPiA+ID4KPiA+ID4gaWYgKHZtYS0+YW5vbl92bWEpIHsK
PiA+ID4gICAgIHZtYV9zdGFydF93cml0ZV9raWxsYWJsZShzcmNfdm1hKTsKPiA+ID4gICAgIGFu
b25fdm1hX2ZvcmsoZHN0X3ZtYSwgc3JjX3ZtYSk7Cj4gPiA+ICAgICBjb3B5X3BhZ2VfcmFuZ2Uo
ZHN0X3ZtYSwgc3JjX3ZtYSk7Cj4gPiA+IH0KPiA+ID4KPiA+ID4gQnV0IHBhZ2UgZmF1bHQgY2Fu
IGhhcHBlbiBiZWZvcmUgd3JpdGUgbW1hcF9sb2NrIGlzIHRha2VuLCB3aGVuIHdlCj4gPiA+IGNo
ZWNrIHZtYS0+YW5vbl92bWEsIGl0IGlzIHBvc3NpYmxlIGl0IGhhcyBub3QgYmVlbiBzZXQgdXAg
eWV0LiBCdXQgaXQKPiA+ID4gc2VlbXMgdG8gYmUgZXF1aXZhbGVudCB0byBwYWdlIGZhdWx0IGFm
dGVyIGZvcmsgYW5kIHdvbid0IGJyZWFrIHRoZQo+ID4gPiBzZW1hbnRpYy4KPiA+Cj4gPiBSZS1y
ZWFkaW5nIFN1cmVuJ3MgY29tbWl0IGxvZyBmb3IgZmI0OWM0NTUzMjNmZjgKPiA+ICgiZm9yazog
bG9jayBWTUFzIG9mIHRoZSBwYXJlbnQgcHJvY2VzcyB3aGVuIGZvcmtpbmciKSwKPiA+IGl0IHNl
ZW1zIHRoYXQgdm1fc3RhcnRfd3JpdGUoKSBpcyB1c2VkIHRvIHByb3RlY3QKPiA+IGFnYWluc3Qg
YSByYWNlIHdoZXJlIGFub25fdm1hIGNoYW5nZXMgZnJvbSBOVUxMIHRvCj4gPiBub24tTlVMTCBk
dXJpbmcgZm9yay4gSW4gdGhhdCBzY2VuYXJpbywgd2UgaG9sZCB0aGUKPiA+IG1tYXBfbG9jayB3
cml0ZSBsb2NrLCBidXQgbm90IHZtYV9zdGFydF93cml0ZSgpLCBzbyBhCj4gPiBjb25jdXJyZW50
IGFub25fdm1hX3ByZXBhcmUoKSBjb3VsZCBzdGlsbCBpbnN0YWxsIGFuCj4gPiBhbm9uX3ZtYS4K
PiA+Cj4gPiAiICAgIEEgY29uY3VycmVudCBwYWdlIGZhdWx0IG9uIGEgcGFnZSBuZXdseSBtYXJr
ZWQgcmVhZC1vbmx5IGJ5IHRoZSBwYWdlCj4gPiAgICAgY29weSBtaWdodCB0cmlnZ2VyIHdwX3Bh
Z2VfY29weSgpIGFuZCBhIGFub25fdm1hX3ByZXBhcmUodm1hKSBvbiB0aGUKPiA+ICAgICBzb3Vy
Y2Ugdm1hLCBkZWZlYXRpbmcgdGhlIGFub25fdm1hX2Nsb25lKCkgdGhhdCB3YXNuJ3QgZG9uZSBi
ZWNhdXNlIHRoZQo+ID4gICAgIHBhcmVudCB2bWEgb3JpZ2luYWxseSBkaWRuJ3QgaGF2ZSBhbiBh
bm9uX3ZtYSwgYnV0IHdlIG5vdyBtaWdodCBlbmQgdXAKPiA+ICAgICBjb3B5aW5nIGEgcHRlIGVu
dHJ5IGZvciBhIHBhZ2UgdGhhdCBoYXMgb25lLgo+ID4gIgo+ID4KPiA+IElmIHRoYXQgaXMgdGhl
IGNhc2UsIHRoZW4geW91ciBjaGFuZ2UgZG9lcyBub3Qgd29yay4KPiA+Cj4gPiBOb3dhZGF5cywg
bm9ib2R5IGNhbGxzIGFub25fdm1hX3ByZXBhcmUodm1hKSBkaXJlY3RseS4KPiA+IEluc3RlYWQs
IHZtZl9hbm9uX3ByZXBhcmUoKSBpcyB1c2VkLCBhbmQgd2UgYWx3YXlzCj4gPiByZXF1aXJlIHRo
ZSBtbWFwX2xvY2sgcmVhZCBsb2NrIGJlZm9yZSBjYWxsaW5nCj4gPiBfX2Fub25fdm1hX3ByZXBh
cmUoKS4gQXMgYSByZXN1bHQsIGFub25fdm1hIGNhbm5vdAo+ID4gdHJhbnNpdGlvbiBmcm9tIE5V
TEwgdG8gbm9uLU5VTEwgZHVyaW5nIGZvcmsuCj4gPgo+ID4gU28gdGhlIG9yaWdpbmFsIHJhY2Ug
Y29uZGl0aW9uIGhhcyBlZmZlY3RpdmVseQo+ID4gZGlzYXBwZWFyZWQuCj4KPiBhbm9uX3ZtYV9w
cmVwYXJlKCkgaGFzIHNvbWUgdXNlY2FzZXMgdG9vLCBidXQgaXQgc2VlbXMgbGlrZSBpdAo+IHJl
cXVpcmVzIHRha2luZyByZWFkIG1tYXBfbG9jayB0b28gaWYgSSByZWFkIHRoZSBjb2RlIGNvcnJl
Y3RseS4KPgo+ID4KPiA+IFlvdSBhbHNvIG1lbnRpb25lZCB0aGUgbWFkdmlzZSgpIGNhc2UuIElm
IEkgdW5kZXJzdGFuZAo+ID4gY29ycmVjdGx5LCBtYWR2aXNlKCkgc2hvdWxkIHRha2UgbW1hcF9s
b2NrIGJlZm9yZQo+ID4gbW9kaWZ5aW5nIGFub25fdm1hLiBPbmx5IHNvbWUgcGFydHMgb2YgbWFk
dmlzZSgpIGNhbgo+ID4gc3VwcG9ydCBwZXItVk1BIGxvY2tpbmcuIFRoZXJlZm9yZSwgd2UgcHJv
YmFibHkgZG8gbm90Cj4gPiBuZWVkOgo+ID4KPiA+IGlmICh2bWEtPmFub25fdm1hKSB7Cj4gPiB2
bWFfc3RhcnRfd3JpdGVfa2lsbGFibGUoc3JjX3ZtYSk7Cj4gPiAuLi4KPiA+IH0KPgo+IEkgdGhp
bmsgd2Ugc3RpbGwgbmVlZCB3cml0ZSB2bWEgbG9jayB0byBzZXJpYWxpemUgYW5vbl92bWEgZm9y
awo+IG90aGVyd2lzZSB3ZSBtYXkgc2VlOgo+Cj4gICAgICAgICBDUFUgMCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBDUFUgMQo+IGZvcmsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFnZSBmYXVsdAo+
ICAgIHNyYyB2bWEgaGFzIG5vIGFub25fdm1hCj4gICAgICAgIHNraXAgdm1hIGZvcmsKPgo+IGFs
bG9jYXRlIGFub25fdm1hIGZvciBzcmMgdm1hCj4gdm1hX25lZWRzX2NvcHkoKSBzZWVzIGFub25f
dm1hCj4gY29weSBwYWdlCj4KPiBUaGVuIHdlIG1heSBlbmQgdXAgYmVpbmcgbm8gYW5vbl92bWEg
Zm9yIGRzdCB2bWEsIGJ1dCB3aXRoIHBhZ2VzIG1hcHBlZCBpbiBpdC4KClNvcnJ5LCB0aGlzIHNo
b3VsZCBub3QgaGFwcGVuIGJlY2F1c2UgY3JlYXRpbmcgYW5vbl92bWEgaW4gcGFnZSBmYXVsdApu
ZWVkcyB0byB0YWtlIG1tYXBfbG9jay4KClRoYW5rcywKWWFuZwoKPgo+IFRoYW5rcywKPiBZYW5n
Cj4KPiA+Cj4gPiA+Cj4gPiA+IEFueXdheSwganVzdCBhIGNyYXp5IGlkZWEsIEkgbWF5IG1pc3Mg
c29tZSBjb3JuZXIgY2FzZXMuCj4gPgo+ID4gVG8gbWUsIGl0IHNlZW1zIHRoYXQgd2UgY291bGQg
cmVtb3ZlIHZtYV9zdGFydF93cml0ZSgpCj4gPiBlbnRpcmVseSBub3cuIE9yIGlzIHRoYXQgYW4g
ZXZlbiBjcmF6aWVyIGlkZWE/Cj4KPgo+ID4KPiA+IFRoYW5rcwo+ID4gQmFycnkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
