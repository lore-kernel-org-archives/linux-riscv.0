Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA94C04FF6
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 20:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iN2pY4dLIFN9wBvQTjXnonupJU0G8HDdf0EkiVfFcVg=; b=ZbjPww9Qo6L0R4
	NmdYTPk6VkHw44gbOZkAk/F8yJwUXBGcOFPpd+zRD8H8o9+9EKm2Ltc62I+vWoQMO82oV0B+qZXIV
	xwTCjVKZCT1y0ZpyQswkiQWq1EeFpUlpJlVNby/g/Rh+NcI5Jo7xU5UvgHUs3WC4eGVf4o2sfNnUX
	sBc8rFtzQTepNvE+fv+om3w4/FYwnOWjfgt8ML8F4aRLXyMSfkPb0kiYj12HYRVb1OyLVdMUMcFt7
	EgPVsSncazKPdHb6gliodoXwKDGspKOboEMuGRLYc6Gu8tduuQvRoXtXHsem3raJT4drjO+BeJuIg
	UxMjoWliQjsJGBkW79rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxuPg-00000006qjv-2nE2;
	Fri, 19 Apr 2024 20:00:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxuPc-00000006qgh-0YMW;
	Fri, 19 Apr 2024 20:00:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 815A661A8B;
	Fri, 19 Apr 2024 20:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E93C116B1;
	Fri, 19 Apr 2024 20:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713556842;
	bh=1irIlRUcjlhAgXQYQkJd/oGHdCUHLQFxqqgY1XfLhP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hePROBT+glizGF2HhWjQfOISipAvaDLeIwoPfB6eB/130EUaYxI8C9JiOZ0p4IuPP
	 wJr3uvJ18Qdtvzvp+1EN21A1wIYXV57CwgYBWxwwSTpuZVC3Y+zaCK4bAzWjqyz19x
	 of4ezj0xR0KrcZGKrma2TwE1tPaK9aqfe2f5ZULEd8dNouln7cfqCdOX1Qzu+4TMk8
	 WLbPp6C0rIz8BNuB+lG6UD/vpJZsyvT1zRcqUNkcRP+vw16ocKGnhDqx8/KxOoGcQD
	 fvWWbiJ1tqrYnX18IQfVwbrFy6dcbjd61pDUGP6pZkbtq0sqUsgCyvD6UjOkfp09sG
	 phC1jK7//sNkA==
Date: Fri, 19 Apr 2024 22:59:22 +0300
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
Message-ID: <ZiLNGgVSQ7_cg58y@kernel.org>
References: <Zh4nJp8rv1qRBs8m@kernel.org>
 <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
 <ZiE91CJcNw7gBj9g@kernel.org>
 <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
 <ZiFd567L4Zzm2okO@kernel.org>
 <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
 <ZiIVVBgaDN4RsroT@kernel.org>
 <CAPhsuW7WoU+a46FhqqH8f-3=ehxeD4wSgKDWegMin1pT49OSWw@mail.gmail.com>
 <ZiKjmaDgz_56ovbv@kernel.org>
 <CAPhsuW7Nj1Sa_9xQtTgHz9AmX39zdh2x2COqA-qmkfpfX9hNWw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW7Nj1Sa_9xQtTgHz9AmX39zdh2x2COqA-qmkfpfX9hNWw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_130044_321984_6C4501E2 
X-CRM114-Status: GOOD (  21.76  )
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

T24gRnJpLCBBcHIgMTksIDIwMjQgYXQgMTA6MzI6MzlBTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6
Cj4gT24gRnJpLCBBcHIgMTksIDIwMjQgYXQgMTA6MDPigK9BTSBNaWtlIFJhcG9wb3J0IDxycHB0
QGtlcm5lbC5vcmc+IHdyb3RlOgo+IFsuLi5dCj4gPiA+ID4KPiA+ID4gPiBbMV0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNDExMTYwNTI2LjIwOTM0MDgtMS1ycHB0QGtlcm5lbC5v
cmcKPiA+ID4KPiA+ID4gRm9yIHRoZSBST1ggdG8gd29yaywgd2UgbmVlZCBkaWZmZXJlbnQgdXNl
cnMgKG1vZHVsZSB0ZXh0LCBrcHJvYmUsIGV0Yy4pIHRvIGhhdmUKPiA+ID4gdGhlIHNhbWUgZXhl
Y21lbV9yYW5nZS4gRnJvbSBbMV06Cj4gPiA+Cj4gPiA+IHN0YXRpYyB2b2lkICpleGVjbWVtX2Nh
Y2hlX2FsbG9jKHN0cnVjdCBleGVjbWVtX3JhbmdlICpyYW5nZSwgc2l6ZV90IHNpemUpCj4gPiA+
IHsKPiA+ID4gLi4uCj4gPiA+ICAgICAgICBwID0gX19leGVjbWVtX2NhY2hlX2FsbG9jKHNpemUp
Owo+ID4gPiAgICAgICAgaWYgKHApCj4gPiA+ICAgICAgICAgICAgICAgIHJldHVybiBwOwo+ID4g
PiAgICAgICBlcnIgPSBleGVjbWVtX2NhY2hlX3BvcHVsYXRlKHJhbmdlLCBzaXplKTsKPiA+ID4g
Li4uCj4gPiA+IH0KPiA+ID4KPiA+ID4gV2UgYXJlIGNhbGxpbmcgX19leGVjbWVtX2NhY2hlX2Fs
bG9jKCkgd2l0aG91dCByYW5nZS4gRm9yIHRoaXMgdG8gd29yaywKPiA+ID4gd2UgY2FuIG9ubHkg
Y2FsbCBleGVjbWVtX2NhY2hlX2FsbG9jKCkgd2l0aCBvbmUgZXhlY21lbV9yYW5nZS4KPiA+Cj4g
PiBBY3R1YWxseSwgb24geDg2IHRoaXMgd2lsbCAianVzdCB3b3JrIiBiZWNhdXNlIGV2ZXJ5dGhp
bmcgc2hhcmVzIHRoZSBzYW1lCj4gPiBhZGRyZXNzIHNwYWNlIDopCj4gPgo+ID4gVGhlIDJNIHBh
Z2VzIGluIHRoZSBjYWNoZSB3aWxsIGJlIGluIHRoZSBtb2R1bGVzIHNwYWNlLCBzbwo+ID4gX19l
eGVjbWVtX2NhY2hlX2FsbG9jKCkgd2lsbCBhbHdheXMgcmV0dXJuIG1lbW9yeSBmcm9tIHRoYXQg
YWRkcmVzcyBzcGFjZS4KPiA+Cj4gPiBGb3Igb3RoZXIgYXJjaGl0ZWN0dXJlcyB0aGlzIGluZGVl
ZCBuZWVkcyB0byBiZSBmaXhlZCB3aXRoIHBhc3NpbmcgdGhlCj4gPiByYW5nZSB0byBfX2V4ZWNt
ZW1fY2FjaGVfYWxsb2MoKSBhbmQgbGltaXRpbmcgc2VhcmNoIGluIHRoZSBjYWNoZSBmb3IgdGhh
dAo+ID4gcmFuZ2UuCj4gCj4gSSB0aGluayB3ZSBhdCBsZWFzdCBuZWVkIHRoZSAibWFwIHRvIiBj
b25jZXB0IChpbml0aWFsbHkgcHJvcG9zZWQgYnkgVGhvbWFzKQo+IHRvIGdldCB0aGlzIHdvcmsu
IEZvciBleGFtcGxlLCBFWEVDTUVNX0JQRiBhbmQgRVhFQ01FTV9LUFJPQkUKPiBtYXBzIHRvIEVY
RUNNRU1fTU9EVUxFX1RFWFQsIHNvIHRoYXQgYWxsIHRoZXNlIGFjdHVhbGx5IHNoYXJlCj4gdGhl
IHNhbWUgcmFuZ2UuCgpXaHk/CiAKPiBEb2VzIHRoaXMgbWFrZSBzZW5zZT8KPiAKPiBTb25nCgot
LSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
