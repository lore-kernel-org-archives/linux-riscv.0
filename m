Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF32EC04FF6
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 15:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LaDx9PxC/zOxd/vYY2GkGrdT5jmp4yNP5qtXqo9noIw=; b=uRvVhdeTv/gg+L
	uzcjt9f1MQdm8RgO5sSUs27hHLBc5nV90hiATNxHDmlthL7954Fejm5hrW2BdWxVzrysIIHZ63XIM
	FJVZotBGyomB5JDoPr0RXFQkJfmIFx7vSAfJmFjZ7Wr5+h1Pwl5ZokGWfgzwa8t+b6QE55kdBUWUv
	Wrl1M8MEh3ObSAq6ka+kaigG9sPy6NQJbREOTrbXwWQTflVCYAOP1aclLdJFg4N+Slbk0M3qyPMtn
	cixmwH+BG6D3wOkO9AlFTFCZTfRSf2+liOh0x5Ni6gmQzM22tDAaQB1zBKPDMN5cYCg0Y2aVsWaDd
	VcCimmP6PamOULEHJ3oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxqaA-00000006GRL-0ihj;
	Fri, 19 Apr 2024 15:55:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxqa5-00000006GPB-0FZx;
	Fri, 19 Apr 2024 15:55:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1730CCE1AF8;
	Fri, 19 Apr 2024 15:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A421C32782;
	Fri, 19 Apr 2024 15:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713542114;
	bh=PNzXHy/tRctT7iPO4Hxb0l/pQDROtMOUfttALn8mdWw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pqf8XrEo/ZXtoYY6s3PyoZrVaUFPmoHxFRVaIVD+cv3s9s0b57yKCkZBfgw3J/DFY
	 ItFu/AL8+h/o6KzZv3W/jgdaahJ+fBSkuBMaq6Fa9gIV+jIx0BRXS0xUN7/X5dBPCS
	 CtUI7XjfYrMseAEBlWGp1/BlZfgiFr+70fAxlZPMxdU8CUsp8cqjeiGh7fSLDtYeJ4
	 ci293wBMZSj5XVodFvDDRPQI2WnRMIxx356QO12oxl9Vr7bTlPCN/kbkpDTGdnUTk0
	 OJtvbGt6roHNq6+muZAwUQgB2hXjVyHoavfSajpvVRjHUvmn/YdlEKZxa/rSjatbO9
	 x3piRqi1B5HPQ==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a5224dfa9adso386573966b.0;
        Fri, 19 Apr 2024 08:55:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbSEaOLTvYn1+6epyB4GTZd83L9TITCRIWq9ot0baEDDmJsBnKZ9Zos794cqIJPVZshVAw55QC/eGcEy4mA02gR7px4EP9/Fw1U9Aof0ldjdmzrPAvVyvWkFUhPvV7mHOupbR08mfwUJQNee4jF1GgjWpTS9I=
X-Gm-Message-State: AOJu0Yx8ExfrD7t4udsoJTo3gMikdNHpwvdKvZVqU2Xv6PFA5IzBF1NQ
	2xCiFgUOqnXHoyRb9UiQJEJVfZrcpqDm+RaUdzKp2EYo7HCAQCbeF7Q6t9fQttkMkpSxIwPZrwe
	nLQT6eyDKBxYdfCUf0C+wBhrjXmo=
X-Google-Smtp-Source: AGHT+IGasMltj1XTiWxWNEYkPSMxwP63y2jyTt8tLpdHn26unpYTPPkYdRp/dT6gEwD6NrNiKXUtIlL7PF9cDNubUq4=
X-Received: by 2002:ac2:5f9b:0:b0:519:ab33:7459 with SMTP id
 r27-20020ac25f9b000000b00519ab337459mr752898lfe.30.1713542091952; Fri, 19 Apr
 2024 08:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240411160051.2093261-1-rppt@kernel.org> <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net> <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
 <Zh4nJp8rv1qRBs8m@kernel.org> <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
 <ZiE91CJcNw7gBj9g@kernel.org> <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
 <ZiFd567L4Zzm2okO@kernel.org> <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
 <ZiIVVBgaDN4RsroT@kernel.org>
In-Reply-To: <ZiIVVBgaDN4RsroT@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 19 Apr 2024 08:54:40 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7WoU+a46FhqqH8f-3=ehxeD4wSgKDWegMin1pT49OSWw@mail.gmail.com>
Message-ID: <CAPhsuW7WoU+a46FhqqH8f-3=ehxeD4wSgKDWegMin1pT49OSWw@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
To: Mike Rapoport <rppt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Bjorn Topel <bjorn@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Donald Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_085517_471956_DF5D2C9F 
X-CRM114-Status: GOOD (  23.89  )
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

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMTE6NTbigK9QTSBNaWtlIFJhcG9wb3J0IDxycHB0QGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMDI6MDE6MjJQTSAt
MDcwMCwgU29uZyBMaXUgd3JvdGU6Cj4gPiBPbiBUaHUsIEFwciAxOCwgMjAyNCBhdCAxMDo1NOKA
r0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9u
IFRodSwgQXByIDE4LCAyMDI0IGF0IDA5OjEzOjI3QU0gLTA3MDAsIFNvbmcgTGl1IHdyb3RlOgo+
ID4gPiA+IE9uIFRodSwgQXByIDE4LCAyMDI0IGF0IDg6MzfigK9BTSBNaWtlIFJhcG9wb3J0IDxy
cHB0QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSSdtIGxv
b2tpbmcgYXQgZXhlY21lbV90eXBlcyBtb3JlIGFzIGRlZmluaXRpb24gb2YgdGhlIGNvbnN1bWVy
cywgbWF5YmUgSQo+ID4gPiA+ID4gPiA+IHNob3VsZCBoYXZlIG5hbWVkIHRoZSBlbnVtIGV4ZWNt
ZW1fY29uc3VtZXIgYXQgdGhlIGZpcnN0IHBsYWNlLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJ
IHRoaW5rIGxvb2tpbmcgYXQgZXhlY21lbV90eXBlIGZyb20gY29uc3VtZXJzJyBwb2ludCBvZiB2
aWV3IGFkZHMKPiA+ID4gPiA+ID4gdW5uZWNlc3NhcnkgY29tcGxleGl0eS4gSUlVQywgZm9yIG1v
c3QgKGlmIG5vdCBhbGwpIGFyY2hzLCBmdHJhY2UsIGtwcm9iZSwKPiA+ID4gPiA+ID4gYW5kIGJw
ZiAoYW5kIG1heWJlIGFsc28gbW9kdWxlIHRleHQpIGFsbCBoYXZlIHRoZSBzYW1lIHJlcXVpcmVt
ZW50cy4KPiA+ID4gPiA+ID4gRGlkIEkgbWlzcyBzb21ldGhpbmc/Cj4gPiA+ID4gPgo+ID4gPiA+
ID4gSXQncyBlbm91Z2ggdG8gaGF2ZSBvbmUgYXJjaGl0ZWN0dXJlIHdpdGggZGlmZmVyZW50IGNv
bnN0cmFpbnMgZm9yIGtwcm9iZXMKPiA+ID4gPiA+IGFuZCBicGYgdG8gd2FycmFudCBhIHR5cGUg
Zm9yIGVhY2guCj4gPiA+ID4KPiA+ID4gPiBBRkFJQ1QsIHNvbWUgb2YgdGhlc2UgY29uc3RyYWlu
dHMgY2FuIGJlIGNoYW5nZWQgd2l0aG91dCB0b28gbXVjaCB3b3JrLgo+ID4gPgo+ID4gPiBCdXQg
d2h5Pwo+ID4gPiBJIGhvbmVzdGx5IGRvbid0IHVuZGVyc3RhbmQgd2hhdCBhcmUgeW91IHRyeWlu
ZyB0byBvcHRpbWl6ZSBoZXJlLiBBIGZldwo+ID4gPiBsaW5lcyBvZiBpbml0aWFsaXphdGlvbiBp
biBleGVjbWVtX2luZm8/Cj4gPgo+ID4gSUlVQywgaGF2aW5nIHNlcGFyYXRlIEVYRUNNRU1fQlBG
IGFuZCBFWEVDTUVNX0tQUk9CRSBtYWtlcyBpdAo+ID4gaGFyZGVyIGZvciBicGYgYW5kIGtwcm9i
ZSB0byBzaGFyZSB0aGUgc2FtZSBST1ggcGFnZS4gSW4gbWFueSB1c2UgY2FzZXMsCj4gPiBhIDJN
aUIgcGFnZSAoYXNzdW1pbmcgeDg2XzY0KSBpcyBlbm91Z2ggZm9yIGFsbCBCUEYsIGtwcm9iZSwg
ZnRyYWNlLCBhbmQKPiA+IG1vZHVsZSB0ZXh0LiBJdCBpcyBub3QgZWZmaWNpZW50IGlmIHdlIGhh
dmUgdG8gYWxsb2NhdGUgc2VwYXJhdGUgcGFnZXMgZm9yIGVhY2gKPiA+IG9mIHRoZXNlIHVzZSBj
YXNlcy4gSWYgdGhpcyBpcyBub3QgYSBwcm9ibGVtLCB0aGUgY3VycmVudCBhcHByb2FjaCB3b3Jr
cy4KPgo+IFRoZSBjYWNoaW5nIG9mIGxhcmdlIFJPWCBwYWdlcyBkb2VzIG5vdCBuZWVkIHRvIGJl
IHBlciB0eXBlLgo+Cj4gSW4gdGhlIFBPQyBJJ3ZlIHBvc3RlZCBmb3IgY2FjaGluZyBvZiBsYXJn
ZSBST1ggcGFnZXMgb24geDg2IFsxXSwgdGhlIGNhY2hlIGlzCj4gZ2xvYmFsIGFuZCB0byBtYWtl
IGtwcm9iZXMgYW5kIGJwZiB1c2UgaXQgaXQncyBlbm91Z2ggdG8gc2V0IGEgZmxhZyBpbgo+IGV4
ZWNtZW1faW5mby4KPgo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA0MTEx
NjA1MjYuMjA5MzQwOC0xLXJwcHRAa2VybmVsLm9yZwoKRm9yIHRoZSBST1ggdG8gd29yaywgd2Ug
bmVlZCBkaWZmZXJlbnQgdXNlcnMgKG1vZHVsZSB0ZXh0LCBrcHJvYmUsIGV0Yy4pIHRvIGhhdmUK
dGhlIHNhbWUgZXhlY21lbV9yYW5nZS4gRnJvbSBbMV06CgpzdGF0aWMgdm9pZCAqZXhlY21lbV9j
YWNoZV9hbGxvYyhzdHJ1Y3QgZXhlY21lbV9yYW5nZSAqcmFuZ2UsIHNpemVfdCBzaXplKQp7Ci4u
LgogICAgICAgcCA9IF9fZXhlY21lbV9jYWNoZV9hbGxvYyhzaXplKTsKICAgICAgIGlmIChwKQog
ICAgICAgICAgICAgICByZXR1cm4gcDsKICAgICAgZXJyID0gZXhlY21lbV9jYWNoZV9wb3B1bGF0
ZShyYW5nZSwgc2l6ZSk7Ci4uLgp9CgpXZSBhcmUgY2FsbGluZyBfX2V4ZWNtZW1fY2FjaGVfYWxs
b2MoKSB3aXRob3V0IHJhbmdlLiBGb3IgdGhpcyB0byB3b3JrLAp3ZSBjYW4gb25seSBjYWxsIGV4
ZWNtZW1fY2FjaGVfYWxsb2MoKSB3aXRoIG9uZSBleGVjbWVtX3JhbmdlLgoKRGlkIEkgbWlzcyBz
b21ldGhpbmc/CgpUaGFua3MsClNvbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
