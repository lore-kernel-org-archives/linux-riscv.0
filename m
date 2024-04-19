Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97609C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 17:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PK2Wdhi7nZDY88DDfveaHKwQtHZfqkd1Jb9WuYzSXA=; b=wu+VSvnSUASg3Y
	5zO38rjdUIe0F8mLTNJ+42H7+B+2ws5LVXnGiYpKRdLAUAxFrVEdQ36/akzU96w1N7Oqp3E3/xy4q
	UcpObvCanpMBgY7FhatpWF7T25xYtB9bF7T9X0w/8VTB4GDwp3jBaSqk+DKxQMUMZfvOgGsqxcaXt
	aVhfe1ztt9WrlWFjqBG+vKUDIRDoU76tbZ8EGppfSaJWaUpMQr1uxFBewCXQrfYgd2PNDO+h87yNq
	RgFT59rSeej5nwWBfYXgnYAW3941wVRsozAIiSvXnPgN+CLAdoC7687n3vOeQ/88cAzsd/VwLw057
	cOrzAiJ8L1eBtUcyM1TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxreM-00000006Twz-0Kxj;
	Fri, 19 Apr 2024 17:03:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxreH-00000006TtB-12zr;
	Fri, 19 Apr 2024 17:03:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2F75061A85;
	Fri, 19 Apr 2024 17:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D36C3277B;
	Fri, 19 Apr 2024 17:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713546218;
	bh=jFxi5qZrScF2xjH3z+fMU0rA+S3WPw/R5/k/PlfLlD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RUL9Opqg9lVQKyIEyIuq2xjKwlBEmIHBH/IVoveA6aP2JLQi0uzPvTDRn7OmSzfgD
	 nIb4g/5o2RBtfUp3FCsBZLo4UMhQBN8itmVTPuHB1vCt7tnCtqGOlM7w17hYv3aiWy
	 FPRpIYW/h0QBF2/1gYcg2KSSl6cBIyHw8P1BRp78GQ/1rnAZNqj1HgINRQQE2y6kx8
	 pa/lP0BVFbrI+oqwHSJpzLJUH1OONwzfgc8jyKWmKgwbnoS/jGKAA+PE+NrL1eKBBr
	 VPLO+D3Fy9QluAkUMgIaLcYTb9+hJ5Az7wIHrpBlSplLPGXqXzT9s0UFhk3C1grs7n
	 akOPXTz5YdCXA==
Date: Fri, 19 Apr 2024 20:02:17 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Topel <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Donald Dutile <ddutile@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nadav Amit <nadav.amit@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
Message-ID: <ZiKjmaDgz_56ovbv@kernel.org>
References: <20240415075241.GF40213@noisy.programming.kicks-ass.net>
 <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
 <Zh4nJp8rv1qRBs8m@kernel.org>
 <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
 <ZiE91CJcNw7gBj9g@kernel.org>
 <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
 <ZiFd567L4Zzm2okO@kernel.org>
 <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
 <ZiIVVBgaDN4RsroT@kernel.org>
 <CAPhsuW7WoU+a46FhqqH8f-3=ehxeD4wSgKDWegMin1pT49OSWw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW7WoU+a46FhqqH8f-3=ehxeD4wSgKDWegMin1pT49OSWw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_100341_432801_32C3DF35 
X-CRM114-Status: GOOD (  30.40  )
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

T24gRnJpLCBBcHIgMTksIDIwMjQgYXQgMDg6NTQ6NDBBTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6
Cj4gT24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMTE6NTbigK9QTSBNaWtlIFJhcG9wb3J0IDxycHB0
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgQXByIDE4LCAyMDI0IGF0IDAyOjAx
OjIyUE0gLTA3MDAsIFNvbmcgTGl1IHdyb3RlOgo+ID4gPiBPbiBUaHUsIEFwciAxOCwgMjAyNCBh
dCAxMDo1NOKAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+
ID4KPiA+ID4gPiBPbiBUaHUsIEFwciAxOCwgMjAyNCBhdCAwOToxMzoyN0FNIC0wNzAwLCBTb25n
IExpdSB3cm90ZToKPiA+ID4gPiA+IE9uIFRodSwgQXByIDE4LCAyMDI0IGF0IDg6MzfigK9BTSBN
aWtlIFJhcG9wb3J0IDxycHB0QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPiA+IEknbSBsb29raW5nIGF0IGV4ZWNtZW1fdHlwZXMgbW9yZSBhcyBkZWZpbml0
aW9uIG9mIHRoZSBjb25zdW1lcnMsIG1heWJlIEkKPiA+ID4gPiA+ID4gPiA+IHNob3VsZCBoYXZl
IG5hbWVkIHRoZSBlbnVtIGV4ZWNtZW1fY29uc3VtZXIgYXQgdGhlIGZpcnN0IHBsYWNlLgo+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSSB0aGluayBsb29raW5nIGF0IGV4ZWNtZW1fdHlwZSBm
cm9tIGNvbnN1bWVycycgcG9pbnQgb2YgdmlldyBhZGRzCj4gPiA+ID4gPiA+ID4gdW5uZWNlc3Nh
cnkgY29tcGxleGl0eS4gSUlVQywgZm9yIG1vc3QgKGlmIG5vdCBhbGwpIGFyY2hzLCBmdHJhY2Us
IGtwcm9iZSwKPiA+ID4gPiA+ID4gPiBhbmQgYnBmIChhbmQgbWF5YmUgYWxzbyBtb2R1bGUgdGV4
dCkgYWxsIGhhdmUgdGhlIHNhbWUgcmVxdWlyZW1lbnRzLgo+ID4gPiA+ID4gPiA+IERpZCBJIG1p
c3Mgc29tZXRoaW5nPwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJdCdzIGVub3VnaCB0byBoYXZl
IG9uZSBhcmNoaXRlY3R1cmUgd2l0aCBkaWZmZXJlbnQgY29uc3RyYWlucyBmb3Iga3Byb2Jlcwo+
ID4gPiA+ID4gPiBhbmQgYnBmIHRvIHdhcnJhbnQgYSB0eXBlIGZvciBlYWNoLgo+ID4gPiA+ID4K
PiA+ID4gPiA+IEFGQUlDVCwgc29tZSBvZiB0aGVzZSBjb25zdHJhaW50cyBjYW4gYmUgY2hhbmdl
ZCB3aXRob3V0IHRvbyBtdWNoIHdvcmsuCj4gPiA+ID4KPiA+ID4gPiBCdXQgd2h5Pwo+ID4gPiA+
IEkgaG9uZXN0bHkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IGFyZSB5b3UgdHJ5aW5nIHRvIG9wdGlt
aXplIGhlcmUuIEEgZmV3Cj4gPiA+ID4gbGluZXMgb2YgaW5pdGlhbGl6YXRpb24gaW4gZXhlY21l
bV9pbmZvPwo+ID4gPgo+ID4gPiBJSVVDLCBoYXZpbmcgc2VwYXJhdGUgRVhFQ01FTV9CUEYgYW5k
IEVYRUNNRU1fS1BST0JFIG1ha2VzIGl0Cj4gPiA+IGhhcmRlciBmb3IgYnBmIGFuZCBrcHJvYmUg
dG8gc2hhcmUgdGhlIHNhbWUgUk9YIHBhZ2UuIEluIG1hbnkgdXNlIGNhc2VzLAo+ID4gPiBhIDJN
aUIgcGFnZSAoYXNzdW1pbmcgeDg2XzY0KSBpcyBlbm91Z2ggZm9yIGFsbCBCUEYsIGtwcm9iZSwg
ZnRyYWNlLCBhbmQKPiA+ID4gbW9kdWxlIHRleHQuIEl0IGlzIG5vdCBlZmZpY2llbnQgaWYgd2Ug
aGF2ZSB0byBhbGxvY2F0ZSBzZXBhcmF0ZSBwYWdlcyBmb3IgZWFjaAo+ID4gPiBvZiB0aGVzZSB1
c2UgY2FzZXMuIElmIHRoaXMgaXMgbm90IGEgcHJvYmxlbSwgdGhlIGN1cnJlbnQgYXBwcm9hY2gg
d29ya3MuCj4gPgo+ID4gVGhlIGNhY2hpbmcgb2YgbGFyZ2UgUk9YIHBhZ2VzIGRvZXMgbm90IG5l
ZWQgdG8gYmUgcGVyIHR5cGUuCj4gPgo+ID4gSW4gdGhlIFBPQyBJJ3ZlIHBvc3RlZCBmb3IgY2Fj
aGluZyBvZiBsYXJnZSBST1ggcGFnZXMgb24geDg2IFsxXSwgdGhlIGNhY2hlIGlzCj4gPiBnbG9i
YWwgYW5kIHRvIG1ha2Uga3Byb2JlcyBhbmQgYnBmIHVzZSBpdCBpdCdzIGVub3VnaCB0byBzZXQg
YSBmbGFnIGluCj4gPiBleGVjbWVtX2luZm8uCj4gPgo+ID4gWzFdIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDI0MDQxMTE2MDUyNi4yMDkzNDA4LTEtcnBwdEBrZXJuZWwub3JnCj4gCj4g
Rm9yIHRoZSBST1ggdG8gd29yaywgd2UgbmVlZCBkaWZmZXJlbnQgdXNlcnMgKG1vZHVsZSB0ZXh0
LCBrcHJvYmUsIGV0Yy4pIHRvIGhhdmUKPiB0aGUgc2FtZSBleGVjbWVtX3JhbmdlLiBGcm9tIFsx
XToKPiAKPiBzdGF0aWMgdm9pZCAqZXhlY21lbV9jYWNoZV9hbGxvYyhzdHJ1Y3QgZXhlY21lbV9y
YW5nZSAqcmFuZ2UsIHNpemVfdCBzaXplKQo+IHsKPiAuLi4KPiAgICAgICAgcCA9IF9fZXhlY21l
bV9jYWNoZV9hbGxvYyhzaXplKTsKPiAgICAgICAgaWYgKHApCj4gICAgICAgICAgICAgICAgcmV0
dXJuIHA7Cj4gICAgICAgZXJyID0gZXhlY21lbV9jYWNoZV9wb3B1bGF0ZShyYW5nZSwgc2l6ZSk7
Cj4gLi4uCj4gfQo+IAo+IFdlIGFyZSBjYWxsaW5nIF9fZXhlY21lbV9jYWNoZV9hbGxvYygpIHdp
dGhvdXQgcmFuZ2UuIEZvciB0aGlzIHRvIHdvcmssCj4gd2UgY2FuIG9ubHkgY2FsbCBleGVjbWVt
X2NhY2hlX2FsbG9jKCkgd2l0aCBvbmUgZXhlY21lbV9yYW5nZS4KCkFjdHVhbGx5LCBvbiB4ODYg
dGhpcyB3aWxsICJqdXN0IHdvcmsiIGJlY2F1c2UgZXZlcnl0aGluZyBzaGFyZXMgdGhlIHNhbWUK
YWRkcmVzcyBzcGFjZSA6KQoKVGhlIDJNIHBhZ2VzIGluIHRoZSBjYWNoZSB3aWxsIGJlIGluIHRo
ZSBtb2R1bGVzIHNwYWNlLCBzbwpfX2V4ZWNtZW1fY2FjaGVfYWxsb2MoKSB3aWxsIGFsd2F5cyBy
ZXR1cm4gbWVtb3J5IGZyb20gdGhhdCBhZGRyZXNzIHNwYWNlLgoKRm9yIG90aGVyIGFyY2hpdGVj
dHVyZXMgdGhpcyBpbmRlZWQgbmVlZHMgdG8gYmUgZml4ZWQgd2l0aCBwYXNzaW5nIHRoZQpyYW5n
ZSB0byBfX2V4ZWNtZW1fY2FjaGVfYWxsb2MoKSBhbmQgbGltaXRpbmcgc2VhcmNoIGluIHRoZSBj
YWNoZSBmb3IgdGhhdApyYW5nZS4KIAo+IERpZCBJIG1pc3Mgc29tZXRoaW5nPwo+IAo+IFRoYW5r
cywKPiBTb25nCgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
