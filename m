Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B055BC77B7A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 00:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jUgbYue4pirZl0keN/fLFckwsPXiLJZJuK7GZKPQVTk=; b=oLERv+JGqDHG31
	fNlaZJm0Qr/D9vXX0tiH7d0UwAyW4GFgsfpG8H94rmTU9KTJGwg7CO7+r4UFvY03RJlnEY/ZFT7HT
	ztnamJvPhEN/A31F/omYf61f+ireL3xRIqZ/ccuYqIFx+xjqVnCTvjzgA4d2AtrnGgG8LcABDS2ca
	VYnitmYvfXZR3x5IKtBieqNnqoUk9757dohPILOasj2UtUaTNqGh0kOW2u+kkAEzX5jce5GYDzTPx
	BtWHwwBy/bd9tu3c9hHUzCiY+SoxN3QxYrvY9McbACB1aQ0RNyJGMj5EQK2yXbAPypy+Gq0EXMvSJ
	y2ESHK00RdFC+GA17i6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4sFW-005Hq4-30;
	Fri, 02 Jun 2023 00:02:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4sFU-005Hob-1G;
	Fri, 02 Jun 2023 00:02:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EF6FB64B1B;
	Fri,  2 Jun 2023 00:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2F6C43444;
	Fri,  2 Jun 2023 00:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685664151;
	bh=tFm/VXuuVDtTlP6XBCrW6GQLEa1ct+xvVLB1UFiGIT0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qYjNYqSNzxNqNXQEvuTDm4cVTvwj06ebUZlXG1PmKZpv/oUAJkxMRyIi9Qqk6fybM
	 dQdJd7DQi003A1NJ7KBLljDhk+ZjuMYek/ZKPHAXidwXhZ1s3R4ZHt1xBaHj0zZQs2
	 rmsa6a8WYJvE893hGF1ou655eBiUV+JVdz9ypE378AM0hIbi503T1c1I0EN8zJnUI8
	 sZIGH8dOVTIMDe13Q4s6frR1cChTHG0ja5ME1I0mwKq5aFT87R7c5r4UfASH+0qiWG
	 9OonAfAvGjK4xpv01HhjH6IjeWJBWdpm5gSfsNWR7wd+bLF852YNCIA4IrM/bphCIN
	 ObhYO9ry6zCsw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f4b80bf93aso1964673e87.0;
        Thu, 01 Jun 2023 17:02:30 -0700 (PDT)
X-Gm-Message-State: AC+VfDzedP3lzov4ZwLiLqJe+/fZjHtu3rn4p6TUgivPjQO5SnCeEXNU
	y2jNbkACvy3QbZ0hJLRC5zQU5xQ6yoTKvPA/qTA=
X-Google-Smtp-Source: ACHHUZ5+AeCGOC7qHIq2jqRCeZpvT4cPqtj6GONlHu3ZGFgMYeuzIcV8ffuR5AKgvu/Von6c/0h12/a6PWP4XU2OyEA=
X-Received: by 2002:a05:6512:201:b0:4f2:4df1:9718 with SMTP id
 a1-20020a056512020100b004f24df19718mr780946lfo.17.1685664148535; Thu, 01 Jun
 2023 17:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230601101257.530867-1-rppt@kernel.org> <20230601101257.530867-13-rppt@kernel.org>
 <20230601103050.GT4253@hirez.programming.kicks-ass.net> <20230601110713.GE395338@kernel.org>
In-Reply-To: <20230601110713.GE395338@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 1 Jun 2023 17:02:16 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7J=4iMPQQw=V1C4MLFf=cP94gSwVx1g7M4YL0W6OLHRQ@mail.gmail.com>
Message-ID: <CAPhsuW7J=4iMPQQw=V1C4MLFf=cP94gSwVx1g7M4YL0W6OLHRQ@mail.gmail.com>
Subject: Re: [PATCH 12/13] x86/jitalloc: prepare to allocate exectuatble
 memory as ROX
To: Mike Rapoport <rppt@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller" <davem@davemloft.net>, 
	Dinh Nguyen <dinguyen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Luis Chamberlain <mcgrof@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Russell King <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_170232_502745_9E5EF709 
X-CRM114-Status: GOOD (  24.51  )
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

T24gVGh1LCBKdW4gMSwgMjAyMyBhdCA0OjA34oCvQU0gTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgSnVuIDAxLCAyMDIzIGF0IDEyOjMwOjUwUE0gKzAy
MDAsIFBldGVyIFppamxzdHJhIHdyb3RlOgo+ID4gT24gVGh1LCBKdW4gMDEsIDIwMjMgYXQgMDE6
MTI6NTZQTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiA+Cj4gPiA+ICtzdGF0aWMgdm9p
ZCBfX2luaXRfb3JfbW9kdWxlIGRvX3RleHRfcG9rZSh2b2lkICphZGRyLCBjb25zdCB2b2lkICpv
cGNvZGUsIHNpemVfdCBsZW4pCj4gPiA+ICt7Cj4gPiA+ICsgICBpZiAoc3lzdGVtX3N0YXRlIDwg
U1lTVEVNX1JVTk5JTkcpIHsKPiA+ID4gKyAgICAgICAgICAgdGV4dF9wb2tlX2Vhcmx5KGFkZHIs
IG9wY29kZSwgbGVuKTsKPiA+ID4gKyAgIH0gZWxzZSB7Cj4gPiA+ICsgICAgICAgICAgIG11dGV4
X2xvY2soJnRleHRfbXV0ZXgpOwo+ID4gPiArICAgICAgICAgICB0ZXh0X3Bva2UoYWRkciwgb3Bj
b2RlLCBsZW4pOwo+ID4gPiArICAgICAgICAgICBtdXRleF91bmxvY2soJnRleHRfbXV0ZXgpOwo+
ID4gPiArICAgfQo+ID4gPiArfQo+ID4KPiA+IFNvIEkgZG9uJ3QgbXVjaCBsaWtlIGRvX3RleHRf
cG9rZSgpOyB3aHk/Cj4KPiBJIGJlbGlldmUgdGhlIGlkZWEgd2FzIHRvIGtlZXAgbWVtY3B5IGZv
ciBlYXJseSBib290IGJlZm9yZSB0aGUga2VybmVsCj4gaW1hZ2UgaXMgcHJvdGVjdGVkIHdpdGhv
dXQgZ29pbmcgYW5kIGFkZGluZyBpZiAoaXNfbW9kdWxlX3RleHRfYWRkcmVzcygpKQo+IGFsbCBv
dmVyIHRoZSBwbGFjZS4KPgo+IEkgdGhpbmsgdGhpcyBjYW4gYmUgdXNlZCBpbnN0ZWFkIHdpdGhv
dXQgdXBkYXRpbmcgYWxsIHRoZSBjYWxsIHNpdGVzIG9mCj4gdGV4dF9wb2tlX2Vhcmx5KCk6Cj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYva2VybmVsL2FsdGVybmF0aXZlLmMgYi9hcmNoL3g4Ni9r
ZXJuZWwvYWx0ZXJuYXRpdmUuYwo+IGluZGV4IDkxMDU3ZGU4ZTZiYy4uZjk5NGU2M2U5OTAzIDEw
MDY0NAo+IC0tLSBhL2FyY2gveDg2L2tlcm5lbC9hbHRlcm5hdGl2ZS5jCj4gKysrIGIvYXJjaC94
ODYva2VybmVsL2FsdGVybmF0aXZlLmMKPiBAQCAtMTQ1OCw3ICsxNDU4LDcgQEAgdm9pZCBfX2lu
aXRfb3JfbW9kdWxlIHRleHRfcG9rZV9lYXJseSh2b2lkICphZGRyLCBjb25zdCB2b2lkICpvcGNv
ZGUsCj4gICAgICAgICAgICAgICAgICAqIGNvZGUgY2Fubm90IGJlIHJ1bm5pbmcgYW5kIHNwZWN1
bGF0aXZlIGNvZGUtZmV0Y2hlcyBhcmUKPiAgICAgICAgICAgICAgICAgICogcHJldmVudGVkLiBK
dXN0IGNoYW5nZSB0aGUgY29kZS4KPiAgICAgICAgICAgICAgICAgICovCj4gLSAgICAgICAgICAg
ICAgIG1lbWNweShhZGRyLCBvcGNvZGUsIGxlbik7Cj4gKyAgICAgICAgICAgICAgIHRleHRfcG9r
ZV9jb3B5KGFkZHIsIG9wY29kZSwgbGVuKTsKPiAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAg
ICAgICAgIGxvY2FsX2lycV9zYXZlKGZsYWdzKTsKPiAgICAgICAgICAgICAgICAgbWVtY3B5KGFk
ZHIsIG9wY29kZSwgbGVuKTsKPgoKVGhpcyBhbG9uZSBkb2Vzbid0IHdvcmssIGFzIHRleHRfcG9r
ZV9lYXJseSgpIGlzIGNhbGxlZApiZWZvcmUgYWRkciBpcyBhZGRlZCB0byB0aGUgbGlzdCBvZiBt
b2R1bGUgdGV4dHMuIFNvIHdlCnN0aWxsIHVzZSBtZW1jcHkoKSBoZXJlLgoKVGhhbmtzLApTb25n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
