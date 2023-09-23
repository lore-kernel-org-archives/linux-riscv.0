Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11107CE7A89
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Sep 2023 22:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l89EHTjIqb65a8UDfqg7Clqyi2ePyNGzz65kQHOLRZs=; b=eWI9lSaJU2hEtg
	GHqvfrzYZB/MgIGs7rL/1lbbzk8hpsZ7jAeo2z3fdKX4rqZ7r1LWKHjDZq29FO1sd1Zib4LNeR2Nn
	HoExQdAXRdt4L1SMR+6xprHR5k1RMTaJJF2uC9t84YOLy8dq5p3umGZ4evdTNoKZdthPR8wnl31AP
	6ipTyM5ULHwyJeMUTwY9KKi+qxbizez7nJsxYeRHLjfqx558L4jCK1D6sGReSYaS0AWZ9ypPSQDdV
	HUQIf7gA7IDWpw5ETik6Qs4ovw8tmj2ECd0WAJn5qxfJlpDZ4d9ChsBpbDZgQE6eDXCimnT7rc+Ij
	pEVDQpzbjAD79cpY70ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkBEg-00BVLO-0C;
	Sat, 23 Sep 2023 22:36:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkBEa-00BVHz-35;
	Sat, 23 Sep 2023 22:36:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D93660A3D;
	Sat, 23 Sep 2023 22:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A639EC433C7;
	Sat, 23 Sep 2023 22:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695508575;
	bh=p6KwkG6gIDCpi+5ECOWCYMC6fT/RtPXwryMv7tZb+xk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Sdoueq4M4QTiFNPfWfSloC8UKyAofVMUXLdmfW+XAUHMMD2LvJyRaeus5UjoSPFlr
	 88Wh6CmBckFHEhnxKycvXUfGgEmVhnkNg21KC23xUdnnlxkbYasPjPKkQlrcNAebr5
	 9pHynRgrmwdFQyLAu3/g4ssd40NJcoo3KIo3EFZJ61BFYwbJKaub/jIgdHGDYqoLbp
	 CkKxHqxZ+lcZkLuiQ0SW3Jhlx3Q2UF/lc1lkzKluKqJLT3FIFmzOl5wuIzY8rKKn7h
	 rcNc8n7xzQhAsBwvPQXPLNwkEJiEajEWMRQOGpAKemjtGyymfK7KXS5SUzAoMHpafQ
	 UD9dEvhoDjHEA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b9338e4695so68340961fa.2;
        Sat, 23 Sep 2023 15:36:15 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw81O4gRVtANLB09dsudba9eGUahcRd0aBjAfvtqRRgicqMBL1Y
	LdhA9jL5Hew8pFLuDbwnQ6HvneKBpf4VgH4OYcY=
X-Google-Smtp-Source: AGHT+IHGEMyzPMP0PdtKXqSKknw0oXHfeYEIvmKQhWxGVhq9jrC3LZkcXvNIlQvBWHbanSZQKP0MnXe/fed+WldiSzw=
X-Received: by 2002:a05:6512:250d:b0:4fb:90c6:c31a with SMTP id
 be13-20020a056512250d00b004fb90c6c31amr2958776lfb.14.1695508573892; Sat, 23
 Sep 2023 15:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230918072955.2507221-1-rppt@kernel.org> <20230918072955.2507221-3-rppt@kernel.org>
 <CAPhsuW5-=H1V=VXUYxyGnUdJuNUpRt44QmpwjkDUD=9i0itjuw@mail.gmail.com> <20230923153808.GI3303@kernel.org>
In-Reply-To: <20230923153808.GI3303@kernel.org>
From: Song Liu <song@kernel.org>
Date: Sat, 23 Sep 2023 15:36:01 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6TxG87ZBwQ_027iiE+_UmXweZEPh8wKHkHo7wA+qXZUg@mail.gmail.com>
Message-ID: <CAPhsuW6TxG87ZBwQ_027iiE+_UmXweZEPh8wKHkHo7wA+qXZUg@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] mm: introduce execmem_text_alloc() and execmem_free()
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nadav Amit <nadav.amit@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_153621_077615_CD8E5ED6 
X-CRM114-Status: GOOD (  19.48  )
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

T24gU2F0LCBTZXAgMjMsIDIwMjMgYXQgODozOeKAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIFNlcCAyMSwgMjAyMyBhdCAwMzozNDoxOFBNIC0w
NzAwLCBTb25nIExpdSB3cm90ZToKPiA+IE9uIE1vbiwgU2VwIDE4LCAyMDIzIGF0IDEyOjMw4oCv
QU0gTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+Cj4gPiBb
Li4uXQo+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9rZXJuZWwvbW9kdWxlLmMgYi9h
cmNoL3MzOTAva2VybmVsL21vZHVsZS5jCj4gPiA+IGluZGV4IDQyMjE1Zjk0MDRhZi4uZGI1NTYx
ZDBjMjMzIDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3MzOTAva2VybmVsL21vZHVsZS5jCj4gPiA+
ICsrKyBiL2FyY2gvczM5MC9rZXJuZWwvbW9kdWxlLmMKPiA+ID4gQEAgLTIxLDYgKzIxLDcgQEAK
PiA+ID4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGVsb2FkZXIuaD4KPiA+ID4gICNpbmNsdWRlIDxs
aW51eC9idWcuaD4KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9tZW1vcnkuaD4KPiA+ID4gKyNpbmNs
dWRlIDxsaW51eC9leGVjbWVtLmg+Cj4gPiA+ICAjaW5jbHVkZSA8YXNtL2FsdGVybmF0aXZlLmg+
Cj4gPiA+ICAjaW5jbHVkZSA8YXNtL25vc3BlYy1icmFuY2guaD4KPiA+ID4gICNpbmNsdWRlIDxh
c20vZmFjaWxpdHkuaD4KPiA+ID4gQEAgLTc2LDcgKzc3LDcgQEAgdm9pZCAqbW9kdWxlX2FsbG9j
KHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiA+ID4gICNpZmRlZiBDT05GSUdfRlVOQ1RJT05fVFJBQ0VS
Cj4gPiA+ICB2b2lkIG1vZHVsZV9hcmNoX2NsZWFudXAoc3RydWN0IG1vZHVsZSAqbW9kKQo+ID4g
PiAgewo+ID4gPiAtICAgICAgIG1vZHVsZV9tZW1mcmVlKG1vZC0+YXJjaC50cmFtcG9saW5lc19z
dGFydCk7Cj4gPiA+ICsgICAgICAgZXhlY21lbV9mcmVlKG1vZC0+YXJjaC50cmFtcG9saW5lc19z
dGFydCk7Cj4gPiA+ICB9Cj4gPiA+ICAjZW5kaWYKPiA+ID4KPiA+ID4gQEAgLTUxMCw3ICs1MTEs
NyBAQCBzdGF0aWMgaW50IG1vZHVsZV9hbGxvY19mdHJhY2VfaG90cGF0Y2hfdHJhbXBvbGluZXMo
c3RydWN0IG1vZHVsZSAqbWUsCj4gPiA+Cj4gPiA+ICAgICAgICAgc2l6ZSA9IEZUUkFDRV9IT1RQ
QVRDSF9UUkFNUE9MSU5FU19TSVpFKHMtPnNoX3NpemUpOwo+ID4gPiAgICAgICAgIG51bXBhZ2Vz
ID0gRElWX1JPVU5EX1VQKHNpemUsIFBBR0VfU0laRSk7Cj4gPiA+IC0gICAgICAgc3RhcnQgPSBt
b2R1bGVfYWxsb2MobnVtcGFnZXMgKiBQQUdFX1NJWkUpOwo+ID4gPiArICAgICAgIHN0YXJ0ID0g
ZXhlY21lbV90ZXh0X2FsbG9jKEVYRUNNRU1fRlRSQUNFLCBudW1wYWdlcyAqIFBBR0VfU0laRSk7
Cj4gPgo+ID4gVGhpcyBzaG91bGQgYmUgRVhFQ01FTV9NT0RVTEVfVEVYVD8KPgo+IFRoaXMgaXMg
YW4gZnRyYWNlIHRyYW1wb2xpbmUsIHNvIEkgdGhpbmsgaXQgc2hvdWxkIGJlIEZUUkFDRSB0eXBl
IG9mCj4gYWxsb2NhdGlvbi4KClllYWgsIEkgd2FzIGF3YXJlIG9mIHRoZSBmdHJhY2UgdHJhbXBv
bGluZS4gTXkgcG9pbnQgd2FzLCBmdHJhY2UgdHJhbXBvbGluZQpkb2Vzbid0IHNlZW0gdG8gaGF2
ZSBhbnkgc3BlY2lhbCByZXF1aXJlbWVudHMuIFRoZXJlZm9yZSwgaXQgaXMgcHJvYmFibHkgbm90
Cm5lY2Vzc2FyeSB0byBoYXZlIGEgc2VwYXJhdGUgdHlwZSBqdXN0IGZvciBpdC4KCkFGQUlDVCwg
a3Byb2JlLCBmdHJhY2UsIGFuZCBCUEYgKEpJVCBhbmQgdHJhbXBvbGluZSkgY2FuIHNoYXJlIHRo
ZSBzYW1lCmV4ZWNtZW1fdHlwZS4gV2UgbWF5IG5lZWQgc29tZSB3b3JrIGZvciBzb21lIGFyY2hz
LCBidXQgbm90aGluZyBpcwpmdW5kYW1lbnRhbGx5IGRpZmZlcmVudCBhbW9uZyB0aGVzZS4KClRo
YW5rcywKU29uZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
