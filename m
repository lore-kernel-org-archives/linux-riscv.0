Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309CFC47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 14:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PtU2RXGHSSrfrAEqPwq+Gu7Iv4HXDOxkwL14f/agFjM=; b=a+epN2PmCp6iqs
	TU6rTNKeFPfj6jLESMzDqyN1xkmspK5TI/Us/l4mpiAjCXAqicW6DxqSd5Rkwv5st8bfYCaS1NgDL
	O1E+xwhU5urBrKM/UqEhtsVh9vIaCWJWE79U7QncKs+4zEsqM86i5GO/ZK/ojWmO12PmTtXZFJ3D5
	QpQaoqD7BKN5aocNGt9JVxMu91/XdB18/mnoMDbST/t+aG/qo/iRadWpaIEYGbnHtk1u++3TL2S9q
	PGFpYyeR30drAch6eepEyz1WePukXeB33bO+WDLfezoS71z0fX+Z/e280OcS6p+VM8VJFOzBsIZTg
	Eg8X7/81QJMn07LH2BWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLOtW-00ENgn-0v;
	Thu, 04 Jan 2024 14:40:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLOtT-00ENeE-1M;
	Thu, 04 Jan 2024 14:40:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B0393B81909;
	Thu,  4 Jan 2024 14:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0633AC433C7;
	Thu,  4 Jan 2024 14:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704379221;
	bh=mKB4DEZxIw57eKu739it6g3eVDl5U5ssEGaV5HTsHMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CmMMliqpZQ3d3p5RkVIPwbQ8Unhh9n57IKcVI9zAgcZFqIqGa9h0Hu+55ZdK0D5nq
	 wt6xrFMuRiHKv/RvSMSvDQFyGvXZxrodci/0xVv4XS49CDNeNLVxXvmY3QEZhQHayg
	 daO/lorO4VIRrEm//7YzcjlSaAzPRU+1qK7nNO7IptjTby4G8GP/yybFjxN5CN3L7f
	 UnTX0iHH4qx/J9L22NBgxcfDBVKYRDTZrnbVvl2NMekyRJ9x5bvZVHeLJFOd3DXFyH
	 1obF2vxG5o8SLmHhqrTE6QMA3pUGnaA2Jlw+hSvh1a+6tx0CfrWYTq2Qr1laOTlWAj
	 mRjU16QNsUJqA==
Date: Thu, 4 Jan 2024 14:40:13 +0000
From: Will Deacon <will@kernel.org>
To: Nadav Amit <nadav.amit@broadcom.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org, linux-mm <linux-mm@kvack.org>,
	linux-arm-kernel@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv@lists.infradead.org, Nadav Amit <namit@vmware.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Yu Zhao <yuzhao@google.com>,
	the arch/x86 maintainers <x86@kernel.org>
Subject: Re: [PATCH 1/2] mm/tlb: fix fullmm semantics
Message-ID: <20240104144013.GA7179@willie-the-truck>
References: <20231228084642.1765-1-jszhang@kernel.org>
 <20231228084642.1765-2-jszhang@kernel.org>
 <204B6410-2EFA-462B-9DF7-64CC5F1D3AD2@broadcom.com>
 <ZZN35DTJTNExCNXW@xhacker>
 <0468E994-273E-4A8B-A521-150723DA9774@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0468E994-273E-4A8B-A521-150723DA9774@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_064023_616146_F98697BA 
X-CRM114-Status: GOOD (  22.85  )
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

T24gVGh1LCBKYW4gMDQsIDIwMjQgYXQgMDM6MjY6NDNQTSArMDIwMCwgTmFkYXYgQW1pdCB3cm90
ZToKPiAKPiAKPiA+IE9uIEphbiAyLCAyMDI0LCBhdCA0OjQx4oCvQU0sIEppc2hlbmcgWmhhbmcg
PGpzemhhbmdAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiAKPiA+IE9uIFNhdCwgRGVjIDMwLCAyMDIz
IGF0IDExOjU0OjAyQU0gKzAyMDAsIE5hZGF2IEFtaXQgd3JvdGU6Cj4gPiAKPiA+PiAKPiA+PiBN
eSBrbm93bGVkZ2Ugb2YgYXJtNjQgaXMgYSBiaXQgbGltaXRlZCwgYnV0IHRoZSBjb2RlIGRvZXMg
bm90IHNlZW0KPiA+PiB0byBtYXRjaCB0aGUgY29tbWVudCwgc28gaWYgaXQgaXMgY29ycmVjdCAo
d2hpY2ggSSBzdHJvbmdseSBkb3VidCksCj4gPj4gdGhlIGNvbW1lbnQgc2hvdWxkIGJlIHVwZGF0
ZWQuCj4gPiAKPiA+IHdpbGwgZG8gaWYgdGhlIGFib3ZlIGNoYW5nZSBpcyBhY2NlcHRlZCBieSBh
cm02NAo+IAo+IEppc2hlbmcsIEkgZXhwZWN0ZWQgc29tZWJvZHkgd2l0aCBhcm02NCBrbm93bGVk
Z2UgdG8gcG9pbnQgaXQgb3V0LCBhbmQKPiBtYXliZSBJIGFtIHdyb25nLCBidXQgSSByZWFsbHkg
ZG9u4oCZdCB1bmRlcnN0YW5kIHNvbWV0aGluZyBhYm91dCB0aGUKPiBjb3JyZWN0bmVzcywgaWYg
eW91IGNhbiBwbGVhc2UgZXhwbGFpbi4KPiAKPiBJbiB0aGUgZm9sbG93aW5nIGNvZGU6Cj4gCj4g
LS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS90bGIuaAo+ICsrKyBiL2FyY2gvYXJtNjQvaW5j
bHVkZS9hc20vdGxiLmgKPiBAQCAtNjIsNyArNjIsMTAgQEAgc3RhdGljIGlubGluZSB2b2lkIHRs
Yl9mbHVzaChzdHJ1Y3QgbW11X2dhdGhlciAqdGxiKQo+IAkgKiBpbnZhbGlkYXRpbmcgdGhlIHdh
bGstY2FjaGUsIHNpbmNlIHRoZSBBU0lEIGFsbG9jYXRvciB3b24ndAo+IAkgKiByZWFsbG9jYXRl
IG91ciBBU0lEIHdpdGhvdXQgaW52YWxpZGF0aW5nIHRoZSBlbnRpcmUgVExCLgo+IAkgKi8KPiAt
CWlmICh0bGItPmZ1bGxtbSkgewo+ICsJaWYgKHRsYi0+ZnVsbG1tKQo+ICsJCXJldHVybjsKPiAK
PiBZb3Ugc2tpcCBmbHVzaCBpZiBmdWxsbW0gaXMgb24uIEJ1dCBpZiBwYWdlLXRhYmxlcyBhcmUg
ZnJlZWQsIHlvdSBtYXkKPiB3YW50IHRvIGZsdXNoIGltbWVkaWF0ZWx5IGFuZCBub3Qgd2FpdCBm
b3IgQVNJRCB0byBiZSBmcmVlZCB0byBhdm9pZAo+IHNwZWN1bGF0aXZlIHBhZ2Ugd2Fsa3M7IHRo
ZXNlIHdhbGtzIGF0IGxlYXN0IG9uIHg4NiBjYXVzZWQgYSBtZXNzLgo+IAo+IE5vPwoKSSB0aGlu
ayBDYXRhbGluIG1hZGUgdGhlIHNhbWUgb2JzZXJ2YXRpb24gaGVyZToKCmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvWlpXaDRjM1pVdGFkRnFEMUBhcm0uY29tCgphbmQgaXQgZG9lcyBpbmRlZWQg
bG9vayBicm9rZW4uCgpXaWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
