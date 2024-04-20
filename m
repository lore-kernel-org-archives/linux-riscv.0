Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B737C05023
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Apr 2024 09:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9jLgJwZdjcKaC6lieDSx1pqEP4nEdYL7MftCoBiIqNg=; b=aM1lNuArlvaxnd
	AB/tkAelZ+xPnfKHaAZZxjdMScDwAlhXcpUSnNT0l7LeR5TgzJyQMGm4yHrRezObjthw7tC71Dy0t
	e5mE4p1smqJurwyt4AhH5lrvC1QAl/WQHDgR9DCtwMyP8UQIXntoA5mottkE13nW27UDRaKxXWLEG
	VgqjhbYeppz2I/XI02tE143qNS15vFE5zCqQLbDVVlBEELldGoNSr/GFm80p3/qWg1S8ZCfysaLpP
	o4vJkMp6YsqywbYlsopsduuYUpRcOOz/iBaFSCviOcYk/2AyY2g/NzBPQAIGWFY7IZ3CE2fStHuDx
	CoFgqXZMMio5fs/CQwzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ry6oY-00000008BHE-1alI;
	Sat, 20 Apr 2024 09:15:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ry6oU-00000008BFF-14po;
	Sat, 20 Apr 2024 09:15:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 58511CE0B43;
	Sat, 20 Apr 2024 09:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CFFC072AA;
	Sat, 20 Apr 2024 09:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713604511;
	bh=gV7rq1jKylsNR0A2TW7KiHW+6f/l5HNOVcKuwfOfcOQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aBds/mgWklBGTNfKNq4+Z+94Zp0L3MS4pRFwWjdivOkW3wt77ZSOQfMjY+YYfJZ22
	 EbOsSdkOWssNdBi3AWqliDK9OwzxsFKXe7srGGHbb4foIL1rR+4xeE7wz/4thWRvf3
	 BmKK1D9Se8H0/h0Uw/vLAld6i8akxChgiSs8Oa4Avx+zJ1C5hFs5npdPznTRfCWZrf
	 th5mEJA/mw5c94mvYsJOBeAvvZwpVWPpCkBwxsqSy7LgrPU1ayqlu8b38rvXCOVsAE
	 WTdAfWWtTcOpMJCjvDynmh95BCxhT0vOjYzaGiV5GDS7KPjZZmh5efTkoPiO6btvOI
	 JgxLZzkBg4/CA==
Date: Sat, 20 Apr 2024 18:15:00 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre
 Ghiti <alexghiti@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, "David S. Miller" <davem@davemloft.net>, Dinh
 Nguyen <dinguyen@kernel.org>, Donald Dutile <ddutile@redhat.com>, Eric
 Chanudet <echanude@redhat.com>, Heiko Carstens <hca@linux.ibm.com>, Helge
 Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Kent
 Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain
 <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, Song
 Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
 <tglx@linutronix.de>, Will Deacon <will@kernel.org>, "bpf@vger.kernel.org"
 <bpf@vger.kernel.org>, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "x86@kernel.org"
 <x86@kernel.org>
Subject: Re: [PATCH v4 14/15] kprobes: remove dependency on CONFIG_MODULES
Message-Id: <20240420181500.07b39c77f1ca086e8a5161b4@kernel.org>
In-Reply-To: <ZiNv0jY7Ebw75iQl@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
	<20240411160051.2093261-15-rppt@kernel.org>
	<20240418061615.5fad23b954bf317c029acc4d@gmail.com>
	<ZiKSffcTiP2c6fbs@kernel.org>
	<321def3e-8bf1-4920-92dd-037b20f1272d@csgroup.eu>
	<ZiNv0jY7Ebw75iQl@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_021514_700323_1A1AFC46 
X-CRM114-Status: GOOD (  28.53  )
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

T24gU2F0LCAyMCBBcHIgMjAyNCAxMDozMzozOCArMDMwMApNaWtlIFJhcG9wb3J0IDxycHB0QGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBGcmksIEFwciAxOSwgMjAyNCBhdCAwMzo1OTo0MFBNICsw
MDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+ID4gCj4gPiAKPiA+IExlIDE5LzA0LzIwMjQg
w6AgMTc6NDksIE1pa2UgUmFwb3BvcnQgYSDDqWNyaXTCoDoKPiA+ID4gSGkgTWFzYW1pLAo+ID4g
PiAKPiA+ID4gT24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMDY6MTY6MTVBTSArMDkwMCwgTWFzYW1p
IEhpcmFtYXRzdSB3cm90ZToKPiA+ID4+IEhpIE1pa2UsCj4gPiA+Pgo+ID4gPj4gT24gVGh1LCAx
MSBBcHIgMjAyNCAxOTowMDo1MCArMDMwMAo+ID4gPj4gTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJu
ZWwub3JnPiB3cm90ZToKPiA+ID4+Cj4gPiA+Pj4gRnJvbTogIk1pa2UgUmFwb3BvcnQgKElCTSki
IDxycHB0QGtlcm5lbC5vcmc+Cj4gPiA+Pj4KPiA+ID4+PiBrcHJvYmVzIGRlcGVuZGVkIG9uIENP
TkZJR19NT0RVTEVTIGJlY2F1c2UgaXQgaGFzIHRvIGFsbG9jYXRlIG1lbW9yeSBmb3IKPiA+ID4+
PiBjb2RlLgo+ID4gPj4+Cj4gPiA+Pj4gU2luY2UgY29kZSBhbGxvY2F0aW9ucyBhcmUgbm93IGlt
cGxlbWVudGVkIHdpdGggZXhlY21lbSwga3Byb2JlcyBjYW4gYmUKPiA+ID4+PiBlbmFibGVkIGlu
IG5vbi1tb2R1bGFyIGtlcm5lbHMuCj4gPiA+Pj4KPiA+ID4+PiBBZGQgI2lmZGVmIENPTkZJR19N
T0RVTEUgZ3VhcmRzIGZvciB0aGUgY29kZSBkZWFsaW5nIHdpdGgga3Byb2JlcyBpbnNpZGUKPiA+
ID4+PiBtb2R1bGVzLCBtYWtlIENPTkZJR19LUFJPQkVTIHNlbGVjdCBDT05GSUdfRVhFQ01FTSBh
bmQgZHJvcCB0aGUKPiA+ID4+PiBkZXBlbmRlbmN5IG9mIENPTkZJR19LUFJPQkVTIG9uIENPTkZJ
R19NT0RVTEVTLgo+ID4gPj4KPiA+ID4+IFRoYW5rcyBmb3IgdGhpcyB3b3JrLCBidXQgdGhpcyBj
b25mbGljdHMgd2l0aCB0aGUgbGF0ZXN0IGZpeCBpbiB2Ni45LXJjNC4KPiA+ID4+IEFsc28sIGNh
biB5b3UgdXNlIElTX0VOQUJMRUQoQ09ORklHX01PRFVMRVMpIGluc3RlYWQgb2YgI2lmZGVmcyBp
bgo+ID4gPj4gZnVuY3Rpb24gYm9keT8gV2UgaGF2ZSBlbm91Z2ggZHVtbXkgZnVuY3Rpb25zIGZv
ciB0aGF0LCBzbyBpdCBzaG91bGQKPiA+ID4+IG5vdCBtYWtlIGEgcHJvYmxlbS4KPiA+ID4gCj4g
PiA+IFRoZSBjb2RlIGluIGNoZWNrX2twcm9iZV9hZGRyZXNzX3NhZmUoKSB0aGF0IGdldHMgdGhl
IG1vZHVsZSBhbmQgY2hlY2tzIGZvcgo+ID4gPiBfX2luaXQgZnVuY3Rpb25zIGRvZXMgbm90IGNv
bXBpbGUgd2l0aCBJU19FTkFCTEVEKENPTkZJR19NT0RVTEVTKS4KPiA+ID4gSSBjYW4gcHVsbCBp
dCBvdXQgdG8gYSBoZWxwZXIgb3IgbGVhdmUgI2lmZGVmIGluIHRoZSBmdW5jdGlvbiBib2R5LAo+
ID4gPiB3aGljaGV2ZXIgeW91IHByZWZlci4KPiA+IAo+ID4gQXMgZmFyIGFzIEkgY2FuIHNlZSwg
dGhlIG9ubHkgcHJvYmxlbSBpcyBNT0RVTEVfU1RBVEVfQ09NSU5HLgo+ID4gQ2FuIHdlIG1vdmUg
J2VudW0gbW9kdWxlX3N0YXRlJyBvdXQgb2YgI2lmZGVmIENPTkZJR19NT0RVTEVTIGluIG1vZHVs
ZS5oICA/Cj4gCj4gVGhlcmUncyBkZXJlZmVyZW5jZSBvZiAnc3RydWN0IG1vZHVsZScgdGhlcmU6
Cj4gIAo+IAkJKCpwcm9iZWRfbW9kKS0+c3RhdGUgIT0gTU9EVUxFX1NUQVRFX0NPTUlORykgewo+
IAkJCS4uLgo+IAkJfQo+IAo+IHNvIG1vdmluZyBvdXQgJ2VudW0gbW9kdWxlX3N0YXRlJyB3b24n
dCBiZSBlbm91Z2guCgpIbW0sIHRoaXMgcGFydCBzaG91bGQgYmUgaW5saW5lIGZ1bmN0aW9ucyBs
aWtlOwoKI2lmZGVmIENPTkZJR19NT0RVTEVTCnN0YXRpYyBpbmxpbmUgYm9vbCBtb2R1bGVfaXNf
Y29taW5nKHN0cnVjdCBtb2R1bGUgKm1vZCkKewoJcmV0dXJuIG1vZC0+c3RhdGUgPT0gTU9EVUxF
X1NUQVRFX0NPTUlORzsKfQojZWxzZQojZGVmaW5lIG1vZHVsZV9pc19jb21pbmcobW9kKSAoZmFs
c2UpCiNlbmRpZgoKVGhlbiB3ZSBkb24ndCBuZWVkIHRoZSBlbnVtLgpUaGFuayB5b3UsCgo+ICAK
PiA+ID4gICAKPiA+ID4+IC0tIAo+ID4gPj4gTWFzYW1pIEhpcmFtYXRzdQo+ID4gPiAKPiAKPiAt
LSAKPiBTaW5jZXJlbHkgeW91cnMsCj4gTWlrZS4KPiAKCgotLSAKTWFzYW1pIEhpcmFtYXRzdSAo
R29vZ2xlKSA8bWhpcmFtYXRAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
