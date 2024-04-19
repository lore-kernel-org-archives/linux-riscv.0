Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE23C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 06:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmGt6WPpOPqLYiHAokq1GCkxGvcQD9nwatVdej6aHV8=; b=LtJrTxXDat5aY4
	eIbGjAu953xfBFCKuT/RKUZzMoxHMc5KVdOrQsRTO+dT40lYF0iTda8fieZvzZo72jtI3SyNjyUvw
	K+C46N08E7Y/i5YLparXUkQHQXyL7/NFaycCQL0GGPOSJGMqMC119+fIQvzsnf7Tybs5bhYn59N2i
	ugZHu4Tf6bBY7WavX45zh55uY3WbhTOhqAV8pF7llfH3ehI/Zgcq5qBsrgkiyY4n3aKxmJjyq69Cx
	ZcLk04KLFifk6SFWF7KqHTsXHEmnMNrIKzjx6wKldERnw4yrapVeO6rw71q3ouOWUPN4VVP12Y9hc
	sNOY6Yva/CqtP3CNNyWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxiAx-00000004goo-1avz;
	Fri, 19 Apr 2024 06:56:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxiAo-00000004gkV-2T5s;
	Fri, 19 Apr 2024 06:56:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9E2956034B;
	Fri, 19 Apr 2024 06:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5881C072AA;
	Fri, 19 Apr 2024 06:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713509797;
	bh=QyMnC6yNCYeGf0vrwo+bvOEGlhU1enTkpEMS1UdTz3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GGPxC8PCY8SnZrF0RCOMbIgSLrKy8hMUcTwQhGg04AArCCIqcrHmv5Ozj+/15Mxmb
	 Z5tAH7Vdwb4CwNtAt3c/UrCpMIZJPngEV7ak2csa/7FlHToGNqqaiOtjXXYFiXJWt3
	 6ObsP+646nnF8SnH5skC5WEdWELGtHSHzBDWXZqXYwBofamn2QdDvdgy5CTKGNpPOO
	 1v84dtOt7AKF4KxvZWU3TOdBN2g9tkVxrJyakFg/qwL0NKQfGsXLfFOWV0O05jtLTZ
	 wM29U64qOuZV772RLQ5j7ljjoO+qx0/azdfHFMH7xioH9AhimXQ/fqnfmBiI3Sy0+P
	 8Za6g/P3pUaVg==
Date: Fri, 19 Apr 2024 09:55:16 +0300
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
Message-ID: <ZiIVVBgaDN4RsroT@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net>
 <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
 <Zh4nJp8rv1qRBs8m@kernel.org>
 <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
 <ZiE91CJcNw7gBj9g@kernel.org>
 <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
 <ZiFd567L4Zzm2okO@kernel.org>
 <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_235638_771203_8DB91926 
X-CRM114-Status: GOOD (  23.02  )
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

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMDI6MDE6MjJQTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6
Cj4gT24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMTA6NTTigK9BTSBNaWtlIFJhcG9wb3J0IDxycHB0
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgQXByIDE4LCAyMDI0IGF0IDA5OjEz
OjI3QU0gLTA3MDAsIFNvbmcgTGl1IHdyb3RlOgo+ID4gPiBPbiBUaHUsIEFwciAxOCwgMjAyNCBh
dCA4OjM34oCvQU0gTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gSSdtIGxvb2tpbmcgYXQgZXhlY21lbV90eXBlcyBtb3JlIGFzIGRl
ZmluaXRpb24gb2YgdGhlIGNvbnN1bWVycywgbWF5YmUgSQo+ID4gPiA+ID4gPiBzaG91bGQgaGF2
ZSBuYW1lZCB0aGUgZW51bSBleGVjbWVtX2NvbnN1bWVyIGF0IHRoZSBmaXJzdCBwbGFjZS4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiBJIHRoaW5rIGxvb2tpbmcgYXQgZXhlY21lbV90eXBlIGZyb20gY29u
c3VtZXJzJyBwb2ludCBvZiB2aWV3IGFkZHMKPiA+ID4gPiA+IHVubmVjZXNzYXJ5IGNvbXBsZXhp
dHkuIElJVUMsIGZvciBtb3N0IChpZiBub3QgYWxsKSBhcmNocywgZnRyYWNlLCBrcHJvYmUsCj4g
PiA+ID4gPiBhbmQgYnBmIChhbmQgbWF5YmUgYWxzbyBtb2R1bGUgdGV4dCkgYWxsIGhhdmUgdGhl
IHNhbWUgcmVxdWlyZW1lbnRzLgo+ID4gPiA+ID4gRGlkIEkgbWlzcyBzb21ldGhpbmc/Cj4gPiA+
ID4KPiA+ID4gPiBJdCdzIGVub3VnaCB0byBoYXZlIG9uZSBhcmNoaXRlY3R1cmUgd2l0aCBkaWZm
ZXJlbnQgY29uc3RyYWlucyBmb3Iga3Byb2Jlcwo+ID4gPiA+IGFuZCBicGYgdG8gd2FycmFudCBh
IHR5cGUgZm9yIGVhY2guCj4gPiA+Cj4gPiA+IEFGQUlDVCwgc29tZSBvZiB0aGVzZSBjb25zdHJh
aW50cyBjYW4gYmUgY2hhbmdlZCB3aXRob3V0IHRvbyBtdWNoIHdvcmsuCj4gPgo+ID4gQnV0IHdo
eT8KPiA+IEkgaG9uZXN0bHkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IGFyZSB5b3UgdHJ5aW5nIHRv
IG9wdGltaXplIGhlcmUuIEEgZmV3Cj4gPiBsaW5lcyBvZiBpbml0aWFsaXphdGlvbiBpbiBleGVj
bWVtX2luZm8/Cj4gCj4gSUlVQywgaGF2aW5nIHNlcGFyYXRlIEVYRUNNRU1fQlBGIGFuZCBFWEVD
TUVNX0tQUk9CRSBtYWtlcyBpdAo+IGhhcmRlciBmb3IgYnBmIGFuZCBrcHJvYmUgdG8gc2hhcmUg
dGhlIHNhbWUgUk9YIHBhZ2UuIEluIG1hbnkgdXNlIGNhc2VzLAo+IGEgMk1pQiBwYWdlIChhc3N1
bWluZyB4ODZfNjQpIGlzIGVub3VnaCBmb3IgYWxsIEJQRiwga3Byb2JlLCBmdHJhY2UsIGFuZAo+
IG1vZHVsZSB0ZXh0LiBJdCBpcyBub3QgZWZmaWNpZW50IGlmIHdlIGhhdmUgdG8gYWxsb2NhdGUg
c2VwYXJhdGUgcGFnZXMgZm9yIGVhY2gKPiBvZiB0aGVzZSB1c2UgY2FzZXMuIElmIHRoaXMgaXMg
bm90IGEgcHJvYmxlbSwgdGhlIGN1cnJlbnQgYXBwcm9hY2ggd29ya3MuCgpUaGUgY2FjaGluZyBv
ZiBsYXJnZSBST1ggcGFnZXMgZG9lcyBub3QgbmVlZCB0byBiZSBwZXIgdHlwZS4gCgpJbiB0aGUg
UE9DIEkndmUgcG9zdGVkIGZvciBjYWNoaW5nIG9mIGxhcmdlIFJPWCBwYWdlcyBvbiB4ODYgWzFd
LCB0aGUgY2FjaGUgaXMKZ2xvYmFsIGFuZCB0byBtYWtlIGtwcm9iZXMgYW5kIGJwZiB1c2UgaXQg
aXQncyBlbm91Z2ggdG8gc2V0IGEgZmxhZyBpbgpleGVjbWVtX2luZm8uCgpbMV0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNDExMTYwNTI2LjIwOTM0MDgtMS1ycHB0QGtlcm5lbC5v
cmcKCj4gVGhhbmtzLAo+IFNvbmcKCi0tIApTaW5jZXJlbHkgeW91cnMsCk1pa2UuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
