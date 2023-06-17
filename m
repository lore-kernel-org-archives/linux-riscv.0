Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68145EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 20:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vh/rOlh5nFput0ULrZMAo8lWT9yrn8KGaoNx8WS0J4Q=; b=dmBVXP7V01jbBy
	CM8Unk2sZHl8Z8KzQLRl1yktIcfZKSIhG82uZlXQhfSBDowaKFGUlnLgTunJSIw0tsMLlA68e74it
	D19wxD5u3fINrP2gd0prjY3/XAVK/Q4EQHtPOxwiTzuIXrpi6cPaoSd+e/r8YT+Usq8ocUTYdHPna
	x7Do+gYKjBRc3+tA2gQvNH+vJujRI7Re4JxIrekwVpvP531eebmVaPmql7J946KLfiVrOSanOFJ7d
	8i/eA/nsJfXPRFnKweCKI3e3FaNu2WBBAnUGnBYg2VmWtB4xZ1T2dypikVKbRkTYQta8Xk3z6Mpj/
	Qu1eZRLKY64UKXXGzcgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAcg1-004K2B-1z;
	Sat, 17 Jun 2023 20:37:41 +0000
Received: from out-8.mta1.migadu.com ([95.215.58.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAcfz-004K07-0F
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jun 2023 20:37:40 +0000
Date: Sat, 17 Jun 2023 16:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1687034256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q0VmYCbqCGEwwRm9p2gHyBMkJehgKoo9YX+I+uEXlwI=;
	b=dfNjewHVuYudVnc8TKpcch6UyyxsC62EekInr+KCF+/d5W19oLEbYgWNkxwMPmu6LU+6YJ
	DDxDUAUrcbSRUp/oMghsBWa2J9HukZTCZ/JGCQrtkNxjPDHNM3pSHNKVBsHXTHpr3HEdfU
	c38+ELnaz0YDpRbuK0hGGk55HYtUVFk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Song Liu <song@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nadav Amit <nadav.amit@gmail.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, netdev@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 07/12] arm64, execmem: extend execmem_params for
 generated code definitions
Message-ID: <ZI4Zifzfi/5qBNMw@moria.home.lan>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-8-rppt@kernel.org>
 <CAPhsuW6BG2oVrGDOpCKyOEvU9fBOboYYhducv96KUBe276Mvng@mail.gmail.com>
 <20230617065759.GT52412@kernel.org>
 <ZI3TGhJ2y5SBWmnA@moria.home.lan>
 <CAPhsuW4KDriCDfQ40MKKQ3AjyeRbEUJxjqoBLipe5AJMxY3U-w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW4KDriCDfQ40MKKQ3AjyeRbEUJxjqoBLipe5AJMxY3U-w@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230617_133739_258972_6F764950 
X-CRM114-Status: GOOD (  26.27  )
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

T24gU2F0LCBKdW4gMTcsIDIwMjMgYXQgMDk6Mzg6MTdBTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6
Cj4gT24gU2F0LCBKdW4gMTcsIDIwMjMgYXQgODozN+KAr0FNIEtlbnQgT3ZlcnN0cmVldAo+IDxr
ZW50Lm92ZXJzdHJlZXRAbGludXguZGV2PiB3cm90ZToKPiA+Cj4gPiBPbiBTYXQsIEp1biAxNywg
MjAyMyBhdCAwOTo1Nzo1OUFNICswMzAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+ID4gPiA+IFRo
aXMgaXMgZ3Jvd2luZyBmYXN0LiA6KSBXZSBoYXZlIDMgbm93OiB0ZXh0LCBkYXRhLCBqaXQuIEFu
ZCBpdCB3aWxsIGJlCj4gPiA+ID4gNSB3aGVuIHdlIHNwbGl0IGRhdGEgaW50byBydyBkYXRhLCBy
byBkYXRhLCBybyBhZnRlciBpbml0IGRhdGEuIEkgd29uZGVyCj4gPiA+ID4gd2hldGhlciB3ZSBz
aG91bGQgc3RpbGwgZG8gc29tZSB0eXBlIGVudW0gaGVyZS4gQnV0IHdlIGNhbiByZXZpc2l0Cj4g
PiA+ID4gdGhpcyB0b3BpYyBsYXRlci4KPiA+ID4KPiA+ID4gSSBkb24ndCB0aGluayB3ZSdkIG5l
ZWQgNS4gRm91ciBhdCBtb3N0IDopCj4gPiA+Cj4gPiA+IEkgZG9uJ3Qga25vdyB5ZXQgd2hhdCB3
b3VsZCBiZSB0aGUgYmVzdCB3YXkgdG8gZGlmZmVyZW50aWF0ZSBSVyBhbmQgUk8KPiA+ID4gZGF0
YSwgYnV0IHJvX2FmdGVyX2luaXQgc3VyZWx5IHdvbid0IG5lZWQgYSBuZXcgdHlwZS4gSXQgZWl0
aGVyIHdpbGwgYmUKPiA+ID4gYWxsb2NhdGVkIGFzIFJXIGFuZCB0aGVuIHRoZSBjYWxsZXIgd2ls
bCBoYXZlIHRvIHNldCBpdCBSTyBhZnRlcgo+ID4gPiBpbml0aWFsaXphdGlvbiBpcyBkb25lLCBv
ciBpdCB3aWxsIGJlIGFsbG9jYXRlZCBhcyBSTyBhbmQgdGhlIGNhbGxlciB3aWxsCj4gPiA+IGhh
dmUgdG8gZG8gc29tZXRoaW5nIGxpa2UgdGV4dF9wb2tlIHRvIHVwZGF0ZSBpdC4KPiA+Cj4gPiBQ
ZXJoYXBzIHJvX2FmdGVyX2luaXQgY291bGQgdXNlIHRoZSBzYW1lIGFsbG9jYXRpb24gaW50ZXJm
YWNlIGFuZCBzaGFyZQo+ID4gcGFnZXMgd2l0aCBybyBwYWdlcyAtIGlmIHdlIGp1c3QgYWRkZWQg
YSByZWZjb3VudCBmb3IgInRoaXMgcGFnZQo+ID4gY3VycmVudGx5IG5lZWRzIHRvIGJlIHJ3LCBt
b2R1bGUgaXMgc3RpbGwgbG9hZGluZz8iCj4gCj4gSWYgd2UgZG9uJ3QgcmVsYXggcnVsZXMgd2l0
aCByZWFkIG9ubHksIHdlIHdpbGwgaGF2ZSB0byBzZXBhcmF0ZSBydywgcm8sCj4gYW5kIHJvX2Fm
dGVyX2luaXQuIEJ1dCB3ZSBjYW4gc3RpbGwgaGF2ZSBwYWdlIHNoYXJpbmc6Cj4gCj4gVHdvIG1v
ZHVsZXMgY2FuIHB1dCBydyBkYXRhIG9uIHRoZSBzYW1lIHBhZ2UuCj4gV2l0aCB0ZXh0IHBva2Ug
KHJvIGRhdGEgcG9rZSB0byBiZSBhY2N1cmF0ZSksIHR3byBtb2R1bGVzIGNhbiBwdXQKPiBybyBk
YXRhIG9uIHRoZSBzYW1lIHBhZ2UuCj4gCj4gPiB0ZXh0X3Bva2UoKSBhcHByb2FjaCB3b3VsZG4n
dCBiZSB3b3JrYWJsZSwgeW91J2QgaGF2ZSB0byBhdWRpdCBhbmQgZml4Cj4gPiBhbGwgbW9kdWxl
IGluaXQgY29kZSBpbiB0aGUgZW50aXJlIGtlcm5lbC4KPiAKPiBBZ3JlZWQuIEZvciB0aGlzIHJl
YXNvbiwgZWFjaCBtb2R1bGUgaGFzIHRvIGhhdmUgaXRzIG93biBwYWdlKHMpIGZvcgo+IHJvX2Fm
dGVyX2luaXQgZGF0YS4KClJlbGF4aW5nIHBhZ2UgcGVybWlzc2lvbnMgdG8gYWxsb3cgZm9yIHBh
Z2Ugc2hhcmluZyBjb3VsZCBhbHNvIGJlIGEKY29uZmlnIG9wdGlvbi4gRm9yIGFyY2hzIHdpdGgg
NjRrIHBhZ2VzIGl0IHNlZW1zIHdvcnRod2hpbGUuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
