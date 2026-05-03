Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9E6CD3424
	for <linux-riscv@archiver.kernel.org>; Sun,  3 May 2026 19:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0iZIUpTANmOFvRXgOnsK3or371t9HVkDarkKSlV9jTs=; b=dbkoRFrrWjBzR5
	gAtyTTr29z2VhhAqZZF8ObyU6AOWB125Ds85FEURLBYFQJrnl4UHaHXDoXFZ0Wo558C8RYoHRpFI/
	j5zDOGXIZp7/yaEnk96sX7mJSATG9tcESQKHxVOQK9x0+U1i7hmRXRWD3pn6cv9jMdiRzETn6t61C
	7RgCxCEiRISrJfy2n3jYi+pPXD+OyX+2GxCIhiJWijaqmUqS3YPRHSKocfOsS0YoJl7WprooY6yYm
	2TZbELrbfIVWr0Bv1aclPM4k9PMbvmMZwEAPd7ZOeRWx/Sm3aU5fqMPY+3p1/E/sHOYWXXIAdEn39
	STfzb9Nv3xULXDYmZMTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJcv2-0000000Bcsr-1zYN;
	Sun, 03 May 2026 19:56:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJcuz-0000000Bcrx-2qqP
	for linux-riscv@lists.infradead.org;
	Sun, 03 May 2026 19:55:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7F0E44421
	for <linux-riscv@lists.infradead.org>; Sun,  3 May 2026 19:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDE3C2BCFA
	for <linux-riscv@lists.infradead.org>; Sun,  3 May 2026 19:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777838155;
	bh=q0YQtTiiL7ieGdsHU5xDXtyCdqIQKThOK+46A5C32Gs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I2LrCfTKxq4IVaLNDuZ1S09XfDfyfhD4jomMUPbzrmQVVmcYTxvqMttecoq9syWRx
	 j2vqFmHkN3FN4QFvwP4rqOmeCxhkL3/9+Bf9OwTlICDDmZv2TBM43XaoWDOVyoxB9O
	 uXfZCP7LEJ1jMnUHvhQL84OeO100SA13TNQodxkYjrsA0+sOi7PC/ZW73GD+6l+XD/
	 Xm0wkYGd28jiSG0a9eJ3ab+nn3cED9SDxF2uHkNytaBziig812s1tkcKSi+3YhsN76
	 r/1UtWafHIKEOYHQJo2v3bIDjTh7LI+ZVE8DI4a3fwLchTaxIVBaugdBeS7ao0E3yy
	 OWM41KwIlqxxg==
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8d4f78fc9f6so384486585a.3
        for <linux-riscv@lists.infradead.org>; Sun, 03 May 2026 12:55:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ZF96/ziwYb6BsRgUpwdl980tApgGeYEZPGnjFtQPfOku9YJ9Y5258zQ0W+FPi3tG4Q6j3xLD5T/tPog==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSzaDYehfQ7lTgzeH+g2xdV/eB4Mh4rmSpSTbEScE2bZLuXw3h
	vohw24mDbOGjS68CgCN00rEHxPfvYO0qHdX4ydWI0n37K+e1+E16/3PhAiTT/6RAb+NDEREYXqV
	Zpuddh216isZcWl7m4Efph+4Ld9G559I=
X-Received: by 2002:a05:620a:4706:b0:8ee:f390:8f85 with SMTP id
 af79cd13be357-8fd154fbfdemr1048725085a.3.1777838154653; Sun, 03 May 2026
 12:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <yezmezj26xntushmylductlmytfgvwsnbnzlhffkfwugfxkt6m@gleq22spziyk>
In-Reply-To: <yezmezj26xntushmylductlmytfgvwsnbnzlhffkfwugfxkt6m@gleq22spziyk>
From: Barry Song <baohua@kernel.org>
Date: Mon, 4 May 2026 03:55:43 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4y8JtCxEy9hVxVd8eaf8D9WC8BcRQp9afUVu=FJA1-awA@mail.gmail.com>
X-Gm-Features: AVHnY4Ib9xDIPW1tJ1arRI_zR4ugsASIRuQ44tzF-c_n00UjvUcn8YpRrQawfp8
Message-ID: <CAGsJ_4y8JtCxEy9hVxVd8eaf8D9WC8BcRQp9afUVu=FJA1-awA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Jan Kara <jack@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_125557_768518_0A832546 
X-CRM114-Status: GOOD (  32.14  )
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

T24gTW9uLCBNYXkgNCwgMjAyNiBhdCAyOjE34oCvQU0gSmFuIEthcmEgPGphY2tAc3VzZS5jej4g
d3JvdGU6Cj4KPiBPbiBGcmkgMDEtMDUtMjYgMTg6NTc6NTIsIE1hdHRoZXcgV2lsY294IHdyb3Rl
Ogo+ID4gT24gU2F0LCBNYXkgMDIsIDIwMjYgYXQgMDE6NDQ6MzRBTSArMDgwMCwgQmFycnkgU29u
ZyB3cm90ZToKPiA+ID4gT24gRnJpLCBNYXkgMSwgMjAyNiBhdCAxMDo1N+KAr1BNIE1hdHRoZXcg
V2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIEZy
aSwgTWF5IDAxLCAyMDI2IGF0IDA2OjQ5OjU4QU0gKzA4MDAsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4g
PiA+ID4gPiAxLiBUaGVyZSBpcyBubyBkZXRlcm1pbmlzdGljIGxhdGVuY3kgZm9yIEkvTyBjb21w
bGV0aW9uLiBJdCBkZXBlbmRzIG9uCj4gPiA+ID4gPiBib3RoIHRoZSBoYXJkd2FyZSBhbmQgdGhl
IHNvZnR3YXJlIHN0YWNrIChiaW8vcmVxdWVzdCBxdWV1ZXMgYW5kIHRoZQo+ID4gPiA+ID4gYmxv
Y2sgc2NoZWR1bGVyKS4gU29tZXRpbWVzIHRoZSBsYXRlbmN5IGlzIHNob3J0OyBhdCBvdGhlciB0
aW1lcyBpdCBjYW4KPiA+ID4gPiA+IGJlIHF1aXRlIGxvbmcuIEluIHN1Y2ggY2FzZXMsIGEgaGln
aC1wcmlvcml0eSB0aHJlYWQgcGVyZm9ybWluZyBvcGVyYXRpb25zCj4gPiA+ID4gPiBzdWNoIGFz
IG1wcm90ZWN0LCB1bm1hcCwgcHJjdGxfc2V0X3ZtYSwgb3IgbWFkdmlzZSBtYXkgYmUgZm9yY2Vk
IHRvIHdhaXQKPiA+ID4gPiA+IGZvciBhbiB1bnByZWRpY3RhYmxlIGFtb3VudCBvZiB0aW1lLgo+
ID4gPiA+Cj4gPiA+ID4gQnV0IGRvZXMgdGhhdCBhY3R1YWxseSBoYXBwZW4/ICBJIGZpbmQgaXQg
aGFyZCB0byBiZWxpZXZlIHRoYXQgdGhyZWFkIEEKPiA+ID4gPiB1bm1hcHMgYSBWTUEgd2hpbGUg
dGhyZWFkIEIgaXMgaW4gdGhlIG1pZGRsZSBvZiB0YWtpbmcgYSBwYWdlIGZhdWx0IGluCj4gPiA+
ID4gdGhhdCBzYW1lIFZNQS4gIG1wcm90ZWN0KCkgYW5kIG1hZHZpc2UoKSBhcmUgbW9yZSBsaWtl
bHkgdG8gaGFwcGVuLCBidXQKPiA+ID4gPiBpdCBzdGlsbCBzZWVtcyByZWFsbHkgdW5saWtlbHkg
dG8gbWUuCj4gPiA+Cj4gPiA+IEl0IGRvZXNu4oCZdCBoYXZlIHRvIGludm9sdmUgdW5tYXBwaW5n
IG9yIGFwcGx5aW5nIG1wcm90ZWN0IHRvCj4gPiA+IHRoZSBlbnRpcmUgVk1B4oCUanVzdCBhIHBv
cnRpb24gb2YgaXQgaXMgc3VmZmljaWVudC4KPiA+Cj4gPiBZZXMsIGJ1dCB0aGF0IHN0aWxsIGZh
aWxzIHRvIGFuc3dlciAiZG9lcyB0aGlzIGFjdHVhbGx5IGhhcHBlbiIuICBIb3cgbXVjaAo+ID4g
cGVyZm9ybWFuY2UgaXMgYWxsIHRoaXMgY29tcGxleGl0eSBpbiB0aGUgcGFnZSBmYXVsdCBoYW5k
bGVyIGJ1eWluZyB1cz8KPiA+IElmIHlvdSBkb24ndCBhbnN3ZXIgdGhpcyBxdWVzdGlvbiwgSSdt
IGp1c3QgZ29pbmcgdG8gZ28gaW4gYW5kIHJpcCBpdAo+ID4gYWxsIG91dC4KPgo+IEkgZnVsbHkg
YWdyZWUgd2l0aCB5b3Ugd2Ugc2hvdWxkIHZlcmlmeSB3aGV0aGVyIHRoZSByZXRyeSBjb2RlIHN0
aWxsIGJyaW5ncwo+IGluIHJlYWwtd29ybGQgYWR2YW50YWdlIHRvZGF5IHdpdGggVk1BIGxvY2tz
LiBBZnRlciBhbGwgdGhlIHJldHJ5IGxvZ2ljIGhhcwo+IGJlZW4gaW50cm9kdWNlZCBpbiAyMDEw
LiBUaGF0IGJlaW5nIHNhaWQgaWYgdGhlcmUgYXJlIHJlYWxpc3RpYyBsb2FkcyB3aGVyZQo+IG9u
ZSB0aHJlYWQgbmVlZHMgVk1BIHdyaXRlIGxvY2sgd2hpbGUgYW5vdGhlciB0aHJlYWQgaXMgZmF1
bHRpbmcgdGhlIFZNQSwKPiB0aGVuIHRoZSBsYXRlbmNpZXMgY2FuIGJlIGluZGVlZCBleHRyZW1l
LiBGb3IgZXhhbXBsZSB0aGluZ3MgbGlrZSBjZ3JvdXAgSU8KPiB0aHJvdHRsaW5nIGhhcHBlbiBv
biB0aGUgSU8gcGF0aCBhbmQgdGh1cyBjYW4gdGhyb3R0bGUgSU8gb2YgYSBsb3ctcHJpb3JpdHkK
PiB0aHJlYWQgZm9yIGEgbG9uZyB0aW1lLgoKSeKAmW0gcXVpdGUgc3VyZSB0aGF0IHN3YXAtaW4g
YW5kIFZNQSB3cml0ZXMgY2FuIG9jY3VyCmNvbmN1cnJlbnRseSwgYW5kIHRoaXMgaXMgZmFpcmx5
IGNvbW1vbi4gRm9yIGV4YW1wbGUsCkphdmEgR0MgbWF5IHVzZSBtcHJvdGVjdCBvciB1c2VyZmF1
bHRmZCBvbiBhIHNtYWxsCnBvcnRpb24gb2YgYSBsYXJnZSBKYXZhIGhlYXAgd2hpbGUgb3RoZXIg
cG9ydGlvbnMgYXJlCnN0aWxsIHVuZGVyIGRvX3N3YXBfcGFnZSgpLgoKSWYgd2Ugc3RhcnQgZXhw
bG9yaW5nIGRpZmZlcmVudCBhcHByb2FjaGVzIGZvciBhbm9uIGFuZApmaWxlLCBJIGFncmVlIEkg
Y2FuIHJldmlzaXQgdGhpcyBvbiBhbiBBbmRyb2lkIHBob25lIGlmCnRoZXJlIGlzIGEgcmVhbCwg
c2VyaW91cyBjYXNlIHdoZXJlIGEgZmlsZSBWTUEgY2FuIGJlCndyaXR0ZW4gYW5kIGEgcGFnZSBm
YXVsdCBvY2N1cnMgYXQgdGhlIHNhbWUgdGltZS4KClBsZWFzZSBub3RlIHRoYXQsIGFzIGFuIEFu
ZHJvaWQgZGV2ZWxvcGVyLCBJIGFtIHBhcnRpY3VsYXJseQpjYXV0aW91cyBhYm91dCBwcmlvcml0
eSBpbnZlcnNpb24uIEEgcmVjZW50IGlzc3VlIGNhdXNpbmcKc2V2ZXJlIHByaW9yaXR5IGludmVy
c2lvbiBpcyB6cmFtIGF0dGVtcHRpbmcgdG8gc3VwcG9ydApwcmVlbXB0aW9uWzFdLiBXaGVuIGEg
dGFzayBwZXJmb3JtaW5nIGNvbXByZXNzaW9uIG9yCmRlY29tcHJlc3Npb24gaXMgbWlncmF0ZWQg
dG8gYW5vdGhlciBDUFUgYW5kIHRoZW4gcHJlZW1wdGVkCmJ5IG90aGVyIHRhc2tzLCBoaWdoLXBy
aW9yaXR5IHRhc2tzIHdhaXRpbmcgb24gdGhlIG11dGV4IG1heQpiZSBzaWduaWZpY2FudGx5IGRl
bGF5ZWQsIGltcGFjdGluZyB1c2VyIGV4cGVyaWVuY2UuCgo+Cj4gQlRXIEknbSBub3Qgc3VyZSBJ
IHF1aXRlIHVuZGVyc3RhbmQgQmFycnkncyBwcmlvcml0eSBpbnZlcnNpb24gcHJvYmxlbQo+IHNp
bmNlIEknZCBleHBlY3QgYWxsIHRocmVhZHMgb2YgYSB0YXNrIHRvIGdlbmVyYWxseSBiZSB0cmVh
dGVkIHdpdGggdGhlCj4gc2FtZSBwcmlvcml0eS4uLgoKRXhhY3RseSBub3QuIE1heWJlIHRoZXNl
IHNsaWRlc1syXSBhbmQgdGhpcyBwcm9qZWN0WzNdIGNhbiBnaXZlCnlvdSBhIGhpbnTigJR0aGV5
IGFpbSB0byBzdGFuZGFyZGl6ZSB0aGluZ3Mgb24gTGludXggYnkKbGVhcm5pbmcgZnJvbSBBcHBs
ZSBPUy4gQmFzaWNhbGx5LCB0YXNrcyBhcmUgY2xhc3NpZmllZAppbnRvIGZpdmUgdHlwZXM6CgpV
U0VSX0lOVEVSQUNUSVZFOiBSZXF1aXJlcyBpbW1lZGlhdGUgcmVzcG9uc2UuClVTRVJfSU5JVElB
VEVEOiBUb2xlcmF0ZXMgYSBzaG9ydCBkZWxheSwgYnV0IG11c3QgcmVzcG9uZCBxdWlja2x5IHN0
aWxsLgpVVElMSVRZOiBUb2xlcmF0ZXMgbG9uZyBkZWxheXMsIGJ1dCBub3QgcHJvbG9uZ2VkIG9u
ZXMuCkJBQ0tHUk9VTkQ6IERvZXNu4oCZdCBtaW5kIHByb2xvbmdlZCBkZWxheXMuCkRFRkFVTFQ6
IFN5c3RlbSBkZWZhdWx0IGJlaGF2aW9yLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LW1tLzIwMjUwMzAzMDIyNDI1LjI4NTk3MS0zLXNlbm96aGF0c2t5QGNocm9taXVtLm9yZy8K
WzJdIGh0dHBzOi8vbHBjLmV2ZW50cy9ldmVudC8xOS9jb250cmlidXRpb25zLzIwODkvYXR0YWNo
bWVudHMvMTc5Ny8zODc3L1VzZXJzcGFjZSUyMEFzc2lzdGVkJTIwU2NoZWR1bGluZyUyMHZpYSUy
MFNjaGVkJTIwUW9TLnBkZgpbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI2MDQx
NTAwMDkxMC4yaDVtaXN2d2M0NWJkdW11QGFpcmJ1bnR1LwoKVGhhbmtzCkJhcnJ5CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
