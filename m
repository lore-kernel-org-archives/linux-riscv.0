Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46C9C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Apr 2024 06:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OD8QnGd2Xf7WE99th+yXFYqL3Cnvsbs21hZhy8CH84A=; b=yDOzlw0ODddp+0
	SeViRPspFBmESyZiDO6+NFuGPn4DDqDo2o48oi1ywlBOx69eJecwqW2zPk/VQ3JzPpnPepzaN/jgu
	k1X8eitZjTSqJko9A6o87HG21X1j/bNm4WMKG7akRAonwa8d3VNH5gQeYbyEYn3r3aCMvFKiZmXqg
	l3O7MiXGcjiVaX0LtezlyLs/Yb3SwzTySksQq/9yW4bVqLhhwv3Zz3kAIQW3Uw+Wbt65R6yX/Q1Xq
	h8WmrW2fB7911jvlXfPZfGFrBXHaor6LvUW82YMFDfr3eUBI+r/cexhdu96kZ/enaLpnTM3uXADzE
	1Q2jjOl5F2ZFUrow/I7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0ySp-0000000H0e5-18g2;
	Sun, 28 Apr 2024 06:56:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0ySk-0000000H0bF-3aca;
	Sun, 28 Apr 2024 06:56:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C1EA5CE01BD;
	Sun, 28 Apr 2024 06:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702DBC113CC;
	Sun, 28 Apr 2024 06:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714287393;
	bh=r0oXOuLVQhCBCby5vRLJpkXcTQDGNz/eiiiW5fCcIdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XTZs9sEmm6/FaMuCbn9MAi43Dw5JaVHQ6Qo9kJKbgmQydz8t76xJqWvnLhWUbFuTg
	 eamwTb265HrxR6LlvTN02ea5enG0DyL5UUA409iL+FIlWuV8f+cOfIaceW/tsQa49F
	 k2+JGlrBeOuDTKAFlJG+dXckGS6E9qKllGv1lUiwvcOxOHi2PgVOFnk2K6JjT6mOLy
	 8wMBJhYy7rqcZ88dgAjki/503FzqraXQOZ8LtGXr77oJlvx8mQlCJ0bpcLxvSbj8II
	 FNv6UFgUz6gnk7tZPPzx3XToNx6Luyxbilf/EWAJ9azbxmvqxQI0iy3aMf/86QxAUL
	 09CFFAwUkdXQQ==
Date: Sun, 28 Apr 2024 09:55:02 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
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
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nadav Amit <nadav.amit@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Sam Ravnborg <sam@ravnborg.org>,
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
Subject: Re: [PATCH v6 08/16] mm/execmem, arch: convert remaining overrides
 of module_alloc to execmem
Message-ID: <Zi3yxk_7rMEPp0lT@kernel.org>
References: <20240426082854.7355-1-rppt@kernel.org>
 <20240426082854.7355-9-rppt@kernel.org>
 <CAPhsuW52MYy4Md5O=7XVGvkw395-LB+BiSadxoDdw8CrLw5t7A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW52MYy4Md5O=7XVGvkw395-LB+BiSadxoDdw8CrLw5t7A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_235639_271233_C1101C8F 
X-CRM114-Status: GOOD (  16.54  )
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

T24gRnJpLCBBcHIgMjYsIDIwMjQgYXQgMTI6MDE6MzRQTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6
Cj4gT24gRnJpLCBBcHIgMjYsIDIwMjQgYXQgMTozMOKAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gRnJvbTogIk1pa2UgUmFwb3BvcnQgKElCTSkiIDxy
cHB0QGtlcm5lbC5vcmc+Cj4gPgo+ID4gRXh0ZW5kIGV4ZWNtZW0gcGFyYW1ldGVycyB0byBhY2Nv
bW1vZGF0ZSBtb3JlIGNvbXBsZXggb3ZlcnJpZGVzIG9mCj4gPiBtb2R1bGVfYWxsb2MoKSBieSBh
cmNoaXRlY3R1cmVzLgo+ID4KPiA+IFRoaXMgaW5jbHVkZXMgc3BlY2lmaWNhdGlvbiBvZiBhIGZh
bGxiYWNrIHJhbmdlIHJlcXVpcmVkIGJ5IGFybSwgYXJtNjQKPiA+IGFuZCBwb3dlcnBjLCBFWEVD
TUVNX01PRFVMRV9EQVRBIHR5cGUgcmVxdWlyZWQgYnkgcG93ZXJwYywgc3VwcG9ydCBmb3IKPiA+
IGFsbG9jYXRpb24gb2YgS0FTQU4gc2hhZG93IHJlcXVpcmVkIGJ5IHMzOTAgYW5kIHg4NiBhbmQg
c3VwcG9ydCBmb3IKPiA+IGxhdGUgaW5pdGlhbGl6YXRpb24gb2YgZXhlY21lbSByZXF1aXJlZCBi
eSBhcm02NC4KPiA+Cj4gPiBUaGUgY29yZSBpbXBsZW1lbnRhdGlvbiBvZiBleGVjbWVtX2FsbG9j
KCkgdGFrZXMgY2FyZSBvZiBzdXBwcmVzc2luZwo+ID4gd2FybmluZ3Mgd2hlbiB0aGUgaW5pdGlh
bCBhbGxvY2F0aW9uIGZhaWxzIGJ1dCB0aGVyZSBpcyBhIGZhbGxiYWNrIHJhbmdlCj4gPiBkZWZp
bmVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgKElCTSkgPHJwcHRAa2Vy
bmVsLm9yZz4KPiA+IEFja2VkLWJ5OiBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3JnPgo+IAo+
IG5pdDogV2Ugc2hvdWxkIHByb2JhYmx5IG1vdmUgdGhlIGxvZ2ljIGZvciBBUkNIX1dBTlRTX0VY
RUNNRU1fTEFURQo+IHRvIGEgc2VwYXJhdGUgcGF0Y2guCgpUaGlzIHdvdWxkIHJlcXVpcmUgdG8g
c3BsaXQgYXJtNjQgYW5kIEkgcHJlZmVyIHRvIGtlZXAgYWxsIHRoZXNlIGNoYW5nZXMKdG9nZXRo
ZXIuIAoKPiBPdGhlcndpc2UsCj4gCj4gQWNrZWQtYnk6IFNvbmcgTGl1IDxzb25nQGtlcm5lbC5v
cmc+CiAKVGhhbmtzIQoKLS0gClNpbmNlcmVseSB5b3VycywKTWlrZS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
