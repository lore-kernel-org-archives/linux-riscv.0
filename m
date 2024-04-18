Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7362AC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 15:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ElCkYU0ApDdnc1JS+H66q7/F3sTicfB8JfhLzQKpLYw=; b=2R1PGSCYXOyL3x
	eV7+WfzztF/tllJM4FRPssTCW+I2P2XGPsusmKdnmy7v9g4Eg7G+dz5S4zsl/tcnutlFtslNmRWRr
	sfC0AaIFoS1JVVqUZN0BGyElbOJcvN/23fEas8gOyU3F00cR6gWYeSSMaTQUdqHVqVfgpA68lH9hy
	mfmrrOA8v/7StK3m4huSd5+vluJyccDnoHixE11Oy9KRNzZkUUYFX2Nr5mCRI4EYZuxgVBju6e/ri
	zafl3tmTvTyQdwjrfJgAQI6XTKM8qKik+EaAh+tUTIoz9620J1CvHKQ9n7ADcbOFBXsdHJr1RAQF1
	kNyPccoU5qU4nuvufsHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTp1-00000002pPG-45OZ;
	Thu, 18 Apr 2024 15:37:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTox-00000002pMu-3fRf;
	Thu, 18 Apr 2024 15:37:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2418A6189A;
	Thu, 18 Apr 2024 15:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B5DC113CC;
	Thu, 18 Apr 2024 15:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713454626;
	bh=/6e7koqBjxGvjgcyfyqozsKjWrzhFa989KlG6h+G83A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aeWcQxDnlnHobtWl/wSsLjnz0sXveyb3C9ZWUzhRio2isgl/ECkWL5MfHpcmEMTW7
	 /3gTsH9zle5F7iUK2MtYGoEYVXSVNBMbfrRBJdAbuLXT5C4Rci/tim3vMb2/HkXNT3
	 0BdaT4fZ5qEwRw4j04psUJzOpDE+rRKi3VjZ9pFXSPLklZtfjmSfaFH4UR8286lGH5
	 60/sHoFS02dtG3EW7cMEMNkjH3P1jYGW/oaOVey/LIzfE2ojr8NLFIf5bqbQCitx7d
	 hsc5w5cHL6aJI5zSA/0oAAIzFKyYOhtBXIDwcp4O2/SqIU/0gLgXdRamRK8O7d7lre
	 JIoqk7vYwCgbA==
Date: Thu, 18 Apr 2024 18:35:48 +0300
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
Message-ID: <ZiE91CJcNw7gBj9g@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net>
 <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
 <Zh4nJp8rv1qRBs8m@kernel.org>
 <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_083708_334608_1CB9FE8D 
X-CRM114-Status: GOOD (  41.59  )
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

T24gV2VkLCBBcHIgMTcsIDIwMjQgYXQgMDQ6MzI6NDlQTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6
Cj4gT24gVHVlLCBBcHIgMTYsIDIwMjQgYXQgMTI6MjPigK9BTSBNaWtlIFJhcG9wb3J0IDxycHB0
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgQXByIDE1LCAyMDI0IGF0IDA2OjM2
OjM5UE0gKzAxMDAsIE1hcmsgUnV0bGFuZCB3cm90ZToKPiA+ID4gT24gTW9uLCBBcHIgMTUsIDIw
MjQgYXQgMDk6NTI6NDFBTSArMDIwMCwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gPiA+ID4gT24g
VGh1LCBBcHIgMTEsIDIwMjQgYXQgMDc6MDA6NDFQTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3cm90
ZToKPiA+ID4gPiA+ICsvKioKPiA+ID4gPiA+ICsgKiBlbnVtIGV4ZWNtZW1fdHlwZSAtIHR5cGVz
IG9mIGV4ZWN1dGFibGUgbWVtb3J5IHJhbmdlcwo+ID4gPiA+ID4gKyAqCj4gPiA+ID4gPiArICog
VGhlcmUgYXJlIHNldmVyYWwgc3Vic3lzdGVtcyB0aGF0IGFsbG9jYXRlIGV4ZWN1dGFibGUgbWVt
b3J5Lgo+ID4gPiA+ID4gKyAqIEFyY2hpdGVjdHVyZXMgZGVmaW5lIGRpZmZlcmVudCByZXN0cmlj
dGlvbnMgb24gcGxhY2VtZW50LAo+ID4gPiA+ID4gKyAqIHBlcm1pc3Npb25zLCBhbGlnbm1lbnQg
YW5kIG90aGVyIHBhcmFtZXRlcnMgZm9yIG1lbW9yeSB0aGF0IGNhbiBiZSB1c2VkCj4gPiA+ID4g
PiArICogYnkgdGhlc2Ugc3Vic3lzdGVtcy4KPiA+ID4gPiA+ICsgKiBUeXBlcyBpbiB0aGlzIGVu
dW0gaWRlbnRpZnkgc3Vic3lzdGVtcyB0aGF0IGFsbG9jYXRlIGV4ZWN1dGFibGUgbWVtb3J5Cj4g
PiA+ID4gPiArICogYW5kIGxldCBhcmNoaXRlY3R1cmVzIGRlZmluZSBwYXJhbWV0ZXJzIGZvciBy
YW5nZXMgc3VpdGFibGUgZm9yCj4gPiA+ID4gPiArICogYWxsb2NhdGlvbnMgYnkgZWFjaCBzdWJz
eXN0ZW0uCj4gPiA+ID4gPiArICoKPiA+ID4gPiA+ICsgKiBARVhFQ01FTV9ERUZBVUxUOiBkZWZh
dWx0IHBhcmFtZXRlcnMgdGhhdCB3b3VsZCBiZSB1c2VkIGZvciB0eXBlcyB0aGF0Cj4gPiA+ID4g
PiArICogYXJlIG5vdCBleHBsY2l0bHkgZGVmaW5lZC4KPiA+ID4gPiA+ICsgKiBARVhFQ01FTV9N
T0RVTEVfVEVYVDogcGFyYW1ldGVycyBmb3IgbW9kdWxlIHRleHQgc2VjdGlvbnMKPiA+ID4gPiA+
ICsgKiBARVhFQ01FTV9LUFJPQkVTOiBwYXJhbWV0ZXJzIGZvciBrcHJvYmVzCj4gPiA+ID4gPiAr
ICogQEVYRUNNRU1fRlRSQUNFOiBwYXJhbWV0ZXJzIGZvciBmdHJhY2UKPiA+ID4gPiA+ICsgKiBA
RVhFQ01FTV9CUEY6IHBhcmFtZXRlcnMgZm9yIEJQRgo+ID4gPiA+ID4gKyAqIEBFWEVDTUVNX1RZ
UEVfTUFYOgo+ID4gPiA+ID4gKyAqLwo+ID4gPiA+ID4gK2VudW0gZXhlY21lbV90eXBlIHsKPiA+
ID4gPiA+ICsgRVhFQ01FTV9ERUZBVUxULAo+ID4gPiA+ID4gKyBFWEVDTUVNX01PRFVMRV9URVhU
ID0gRVhFQ01FTV9ERUZBVUxULAo+ID4gPiA+ID4gKyBFWEVDTUVNX0tQUk9CRVMsCj4gPiA+ID4g
PiArIEVYRUNNRU1fRlRSQUNFLAo+ID4gPiA+ID4gKyBFWEVDTUVNX0JQRiwKPiA+ID4gPiA+ICsg
RVhFQ01FTV9UWVBFX01BWCwKPiA+ID4gPiA+ICt9Owo+ID4gPiA+Cj4gPiA+ID4gQ2FuIHdlIHBs
ZWFzZSBnZXQgYSBicmVhay1kb3duIG9mIGhvdyBhbGwgdGhlc2UgdHlwZXMgYXJlIGFjdHVhbGx5
Cj4gPiA+ID4gZGlmZmVyZW50IGZyb20gb25lIGFub3RoZXI/Cj4gPiA+ID4KPiA+ID4gPiBJJ20g
dGhpbmtpbmcgc29tZSBwbGF0Zm9ybXMgaGF2ZSBhIHRpbnkgaW1tZWRpYXRlIHNwYWNlIChhcm02
NCBjb21lcyB0bwo+ID4gPiA+IG1pbmQpIGFuZCBoYXMgbGVzcyBzdHJpY3QgcGxhY2VtZW50IGNv
bnN0cmFpbnRzIGZvciBzb21lIG9mIHRoZW0/Cj4gPiA+Cj4gPiA+IFllYWgsIGFuZCByZWFsbHkg
SSdkICptdWNoKiByYXRoZXIgZGVhbCB3aXRoIHRoYXQgaW4gYXJjaCBjb2RlLCBhcyBJIGhhdmUg
c2FpZAo+ID4gPiBzZXZlcmFsIHRpbWVzLgo+ID4gPgo+ID4gPiBGb3IgYXJtNjQgd2UgaGF2ZSB0
d28gYnNhaWMgcmVzdHJpY3Rpb25zOgo+ID4gPgo+ID4gPiAxKSBEaXJlY3QgYnJhbmNoZXMgY2Fu
IGdvICsvLTEyOE0KPiA+ID4gICAgV2UgY2FuIGV4cGFuZCB0aGlzIHJhbmdlIGJ5IGhhdmluZyBk
aXJlY3QgYnJhbmNoZXMgZ28gdG8gUExUcywgYXQgYQo+ID4gPiAgICBwZXJmb3JtYW5jZSBjb3N0
Lgo+ID4gPgo+ID4gPiAyKSBQUkVMMzIgcmVsb2NhdGlvbnMgY2FuIGdvICsvLTJHCj4gPiA+ICAg
IFdlIGNhbm5vdCBleHBhbmQgdGhpcyBmdXJ0aGVyLgo+ID4gPgo+ID4gPiAqIFdlIGRvbid0IG5l
ZWQgdG8gYWxsb2NhdGUgbWVtb3J5IGZvciBmdHJhY2UuIFdlIGRvIG5vdCB1c2UgdHJhbXBvbGlu
ZXMuCj4gPiA+Cj4gPiA+ICogS3Byb2JlcyBYT0wgYXJlYXMgZG9uJ3QgY2FyZSBhYm91dCBlaXRo
ZXIgb2YgdGhvc2U7IHdlIGRvbid0IHBsYWNlIGFueQo+ID4gPiAgIFBDLXJlbGF0aXZlIGluc3Ry
dWN0aW9ucyBpbiB0aG9zZS4gTWF5YmUgd2Ugd2FudCB0byBpbiBmdXR1cmUuCj4gPiA+Cj4gPiA+
ICogTW9kdWxlcyBjYXJlIGFib3V0IGJvdGg7IHdlJ2QgKnByZWZlciogdG8gcGxhY2UgdGhlbSB3
aXRoaW4gKy8tMTI4TSBvZiBhbGwKPiA+ID4gICBvdGhlciBrZXJuZWwvbW9kdWxlIGNvZGUsIGJ1
dCBpZiB0aGVyZSdzIG5vIHNwYWNlIHdlIGNhbiB1c2UgUExUcyBhbmQgZXhwYW5kCj4gPiA+ICAg
dGhhdCB0byArLy0yRy4gU2luY2UgbW9kdWxlcyBjYW4gcmVmcmVlbmNlIG90aGVyIG1vZHVsZXMs
IHRoYXQgZW5kcyB1cAo+ID4gPiAgIGFjdHVhbGx5IGJlaW5nIGhhbHZlZCwgYW5kIG1vZHVsZXMg
aGF2ZSB0byBmaXQgd2l0aGluIHNvbWUgMkcgd2luZG93IHRoYXQKPiA+ID4gICBhbHNvIGNvdmVy
cyB0aGUga2VybmVsLgo+IAo+IElzICsvLSAyRyBlbm91Z2ggZm9yIGFsbCByZWFsaXN0aWMgdXNl
IGNhc2VzPyBJZiBzbywgSSBndWVzcyB3ZSBkb24ndAo+IHJlYWxseSBuZWVkCj4gRVhFQ01FTV9B
TllXSEVSRSBiZWxvdz8KPiAKPiA+ID4KPiA+ID4gKiBJJ20gbm90IHN1cmUgYWJvdXQgQlBGJ3Mg
cmVxdWlyZW1lbnRzOyBpdCBzZWVtcyBoYXBweSBkb2luZyB0aGUgc2FtZSBhcwo+ID4gPiAgIG1v
ZHVsZXMuCj4gPgo+ID4gQlBGIGFyZSBoYXBweSB3aXRoIHZtYWxsb2MoKS4KPiA+Cj4gPiA+IFNv
IGlmIHdlICptdXN0KiB1c2UgYSBjb21tb24gZXhlY21lbSBhbGxvY2F0b3IsIHdoYXQgd2UnZCBy
ZWFsbCB3YW50IGlzIG91ciBvd24KPiA+ID4gdHlwZXMsIGUuZy4KPiA+ID4KPiA+ID4gICAgICAg
RVhFQ01FTV9BTllXSEVSRQo+ID4gPiAgICAgICBFWEVDTUVNX05PUExUCj4gPiA+ICAgICAgIEVY
RUNNRU1fUFJFTDMyCj4gPiA+Cj4gPiA+IC4uLiBhbmQgdGhlbiB3ZSB1c2UgdGhvc2UgaW4gYXJj
aCBjb2RlIHRvIGltcGxlbWVudCBtb2R1bGVfYWxsb2MoKSBhbmQgZnJpZW5kcy4KPiA+Cj4gPiBJ
J20gbG9va2luZyBhdCBleGVjbWVtX3R5cGVzIG1vcmUgYXMgZGVmaW5pdGlvbiBvZiB0aGUgY29u
c3VtZXJzLCBtYXliZSBJCj4gPiBzaG91bGQgaGF2ZSBuYW1lZCB0aGUgZW51bSBleGVjbWVtX2Nv
bnN1bWVyIGF0IHRoZSBmaXJzdCBwbGFjZS4KPiAKPiBJIHRoaW5rIGxvb2tpbmcgYXQgZXhlY21l
bV90eXBlIGZyb20gY29uc3VtZXJzJyBwb2ludCBvZiB2aWV3IGFkZHMKPiB1bm5lY2Vzc2FyeSBj
b21wbGV4aXR5LiBJSVVDLCBmb3IgbW9zdCAoaWYgbm90IGFsbCkgYXJjaHMsIGZ0cmFjZSwga3By
b2JlLAo+IGFuZCBicGYgKGFuZCBtYXliZSBhbHNvIG1vZHVsZSB0ZXh0KSBhbGwgaGF2ZSB0aGUg
c2FtZSByZXF1aXJlbWVudHMuCj4gRGlkIEkgbWlzcyBzb21ldGhpbmc/CgpJdCdzIGVub3VnaCB0
byBoYXZlIG9uZSBhcmNoaXRlY3R1cmUgd2l0aCBkaWZmZXJlbnQgY29uc3RyYWlucyBmb3Iga3By
b2JlcwphbmQgYnBmIHRvIHdhcnJhbnQgYSB0eXBlIGZvciBlYWNoLgoKV2hlcmUgZG8geW91IHNl
ZSB1bm5lY2Vzc2FyeSBjb21wbGV4aXR5PwogCj4gSU9XLCB3ZSBoYXZlCj4gCj4gZW51bSBleGVj
bWVtX3R5cGUgewo+ICAgICAgICAgRVhFQ01FTV9ERUZBVUxULAo+ICAgICAgICAgRVhFQ01FTV9U
RVhULAo+ICAgICAgICAgRVhFQ01FTV9LUFJPQkVTID0gRVhFQ01FTV9URVhULAo+ICAgICAgICAg
RVhFQ01FTV9GVFJBQ0UgPSBFWEVDTUVNX1RFWFQsCj4gICAgICAgICBFWEVDTUVNX0JQRiA9IEVY
RUNNRU1fVEVYVCwgICAgICAvKiB3ZSBtYXkgZW5kIHVwIHdpdGhvdXQKPiBfS1BST0JFLCBfRlRS
QUNFLCBfQlBGICovCj4gICAgICAgICBFWEVDTUVNX0RBVEEsICAvKiBydyAqLwo+ICAgICAgICAg
RVhFQ01FTV9ST19EQVRBLAo+ICAgICAgICAgRVhFQ01FTV9ST19BRlRFUl9JTklULAo+ICAgICAg
ICAgRVhFQ01FTV9UWVBFX01BWCwKPiB9Owo+IAo+IERvZXMgdGhpcyBtYWtlIHNlbnNlPwogCkhv
dyBkbyB5b3Ugc3VnZ2VzdCB0byBkZWFsIHdpdGggZS5nLiByaXNjdiB0aGF0IGhhcyBzZXBhcmF0
ZSBhZGRyZXNzIHNwYWNlcwpmb3IgbW9kdWxlcywga3Byb2JlcyBhbmQgYnBmPwoKPiBUaGFua3Ms
Cj4gU29uZwoKLS0gClNpbmNlcmVseSB5b3VycywKTWlrZS4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
