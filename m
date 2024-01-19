Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE419C4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 08:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKrWZGKXd/Ot2Vp01dyi8nSWEt2J0Sf0pVvzdIKb4Ck=; b=wtJUCGVKmQAqX4
	c1Iv4CHQnyCHQv+1g8o4Zh2+pR5uKhUxCumqAN7gyHz6l99wZJCjtSEzUVTfb5EqvP/GXQcKCCPVO
	yIhNF0aln7dFiad3Y/Xs3dMbtOdlkaZIGnvFcP369+5Mp3Kkinr50AUmSB6xQP2lIqgAnvmjboYJY
	5yp+VBQswYbJ9H2E7VFvDbNHhJMuLqnMLja6vsURBaFUInELmvt5GETOZZ8AFySo15RRxXiNdg/pE
	fGjJoJz72Pffx2FVeMdFb+ZY87/rlPm5shZvnBMwco0HdsLqsVVzGWUCkut94F+c1QvI3zUF6qA5z
	D4MjhxnE7AIb5pguZChg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkSr-004sK5-1D;
	Fri, 19 Jan 2024 08:43:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkSn-004sIF-1K;
	Fri, 19 Jan 2024 08:42:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CBB5E61922;
	Fri, 19 Jan 2024 08:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D732C433F1;
	Fri, 19 Jan 2024 08:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705653745;
	bh=g5BoGuy/aNMWgkh7HES0ckmxP53aa40fqWFfKkEi5ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RUoTSPkLvPmGnMVOMJ1HuVQU6XfFhUmlMpbTrKyG6U8fqip+jV7+oHYufClRc2Byz
	 I3fuHmD32xA9G5aC/qgCk0gYD2vI2MQEFi09W0zbpuY8l7bMAjiVnFVTxzbC5teWMK
	 2ts22XzYj3hQvM/l0YmrlVjXLWu1vB29XDBEUj8NHEI4CKzhcPgj4wkLqJgR+twtIi
	 1e1W7S0aNeD7srev8SEKpVES97FlgnMqaSwICysppCZPOJOdR/q6MZgPu4DkdBn1e1
	 eGJEwySey3GhtxwqiPhQicHsJSJpxONbZ8rdyTC8j8SjIWuLoAXc0bc1dmrqTx86DO
	 cHge1k3R0OABQ==
Date: Fri, 19 Jan 2024 10:42:04 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Shijie Huang <shijie@amperemail.onmicrosoft.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	Huang Shijie <shijie@os.amperecomputing.com>,
	gregkh@linuxfoundation.org, patches@amperecomputing.com,
	rafael@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, kuba@kernel.org, vschneid@redhat.com,
	mingo@kernel.org, akpm@linux-foundation.org, vbabka@suse.cz,
	tglx@linutronix.de, jpoimboe@kernel.org, ndesaulniers@google.com,
	mikelley@microsoft.com, mhiramat@kernel.org, arnd@arndb.de,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org, chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org,
	cl@os.amperecomputing.com
Subject: Re: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of
 the correct node id
Message-ID: <Zao13I4Bb0tur0fZ@kernel.org>
References: <20240119033227.14113-1-shijie@os.amperecomputing.com>
 <Zan9sb0vtSvVvQeA@yury-ThinkPad>
 <1cd078fd-c345-4d85-a92f-04c806c20efa@amperemail.onmicrosoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1cd078fd-c345-4d85-a92f-04c806c20efa@amperemail.onmicrosoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_004257_552454_EAF0F116 
X-CRM114-Status: GOOD (  28.27  )
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

T24gRnJpLCBKYW4gMTksIDIwMjQgYXQgMDI6NDY6MTZQTSArMDgwMCwgU2hpamllIEh1YW5nIHdy
b3RlOgo+IAo+IOWcqCAyMDI0LzEvMTkgMTI6NDIsIFl1cnkgTm9yb3Yg5YaZ6YGTOgo+ID4gVGhp
cyBhZGRzIGFub3RoZXIgbGV2ZWwgb2YgaW5kaXJlY3Rpb24sIEkgdGhpbmsuIEN1cnJlbnRseSBj
cHVfdG9fbm9kZQo+ID4gaXMgYSBzaW1wbGUgaW5saW5lci4gQWZ0ZXIgdGhlIHBhdGNoIGl0IHdv
dWxkIGJlIGEgcmVhbCBmdW5jdGlvbiB3aXRoCj4gPiBhbGwgdGhlIGFzc29jaWF0ZSBvdmVyaGVh
ZC4gQ2FuIHlvdSBzaGFyZSBhIGJsb2F0LW8tbWV0ZXIgb3V0cHV0IGhlcmU/Cj4gIy4vc2NyaXB0
cy9ibG9hdC1vLW1ldGVyIHZtbGludXggdm1saW51eC5uZXcKPiBhZGQvcmVtb3ZlOiA2LzEgZ3Jv
dy9zaHJpbms6IDYxLzUxIHVwL2Rvd246IDExNjgvLTU4OCAoNTgwKQo+IEZ1bmN0aW9uwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIG9sZMKgwqDCoMKgIG5ld8KgwqAgZGVsdGEKPiBudW1hX3VwZGF0ZV9jcHXCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDE0
OMKgwqDCoMKgIDI0NMKgwqDCoMKgICs5Ngo+IAo+IMKgLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4odG8gbWFu
eSB0byBza2lwKQo+IAo+IFRvdGFsOiBCZWZvcmU9MzI5OTAxMzAsIEFmdGVyPTMyOTkwNzEwLCBj
aGcgKzAuMDAlCiAKSXQncyBub3Qgb25seSBhYm91dCB0ZXh0IHNpemUsIHRoZSBpbmRpcmVjdCBj
YWxsIGFsc28gaHVydHMgcGVyZm9ybWFuY2UKIAo+ID4gCj4gPiBSZWdhcmRsZXNzLCBJIGRvbid0
IHRoaW5rIHRoYXQgdGhlIGFwcHJvYWNoIGlzIGNvcnJlY3QuIEFzIHBlciB5b3VyCj4gPiBkZXNj
cmlwdGlvbiwgc29tZSBpbml0aWFsaXphdGlvbiBmdW5jdGlvbnMgZXJyb25lb3VzbHkgY2FsbAo+
ID4gY3B1X3RvX25vZGUoKSBpbnN0ZWFkIG9mIGVhcmx5X2NwdV90b19ub2RlKCkgd2hpY2ggZXhp
c3RzIHNwZWNpZmljYWxseQo+ID4gZm9yIHRoYXQgY2FzZS4KPiA+IAo+ID4gSWYgdGhlIGFib3Zl
IGNvcnJlY3QsIGl0J3MgY2xlYXJseSBhIGNhbGxlciBwcm9ibGVtLCBhbmQgdGhlIGZpeCBpcyB0
bwo+ID4gc2ltcGx5IHN3aXRjaCBhbGwgdGhvc2UgY2FsbGVycyB0byB1c2UgZWFybHkgdmVyc2lv
bi4KPiAKPiBJdCBpcyBlYXN5IHRvIGNoYW5nZSB0byBlYXJseV9jcHVfdG9fbm9kZSgpIGZvciBz
Y2hlZF9pbml0KCksCj4gaW5pdF9zY2hlZF9mYWlyX2NsYXNzKCkKPiAKPiBhbmQgd29ya3F1ZXVl
X2luaXRfZWFybHkoKS4gVGhlc2UgdGhyZWUgcGxhY2VzIGNhbGwgdGhlIGNwdV90b19ub2RlKCkg
aW4gdGhlCj4gX19pbml0IGZ1bmN0aW9uLgo+IAo+IAo+IEJ1dCBpdCBpcyBhIGxpdHRsZSBoYXJk
IHRvIGNoYW5nZSB0aGUgZWFybHlfdHJhY2VfaW5pdCgpLCBzaW5jZSBpdCBjYWxscwo+IGNwdV90
b19ub2RlIGluIHRoZSBkZWVwCj4gCj4gZnVuY3Rpb24gc3RhY2s6Cj4gCj4gwqAgZWFybHlfdHJh
Y2VfaW5pdCgpIC0tPiByaW5nX2J1ZmZlcl9hbGxvYygpIC0tPnJiX2FsbG9jYXRlX2NwdV9idWZm
ZXIoKQo+IAo+IAo+IEZvciBlYXJseV90cmFjZV9pbml0KCksIHdlIG5lZWQgdG8gY2hhbmdlIG1v
cmUgY29kZS4KPiAKPiAKPiBBbnl3YXksIElmIHdlIHRoaW5rIGl0IGlzIG5vdCBhIGdvb2QgaWRl
YSB0byBjaGFuZ2UgdGhlIGNvbW1vbiBjb2RlLCBJIGFtCj4gb2FreSB0b28uCiAKSXMgdGhlcmUg
YSBmdW5kYW1lbnRhbCByZWFzb24gdG8gaGF2ZSBlYXJseV9jcHVfdG9fbm9kZSgpIGF0IGFsbD8K
SXQgc2VlbXMgdGhhdCBhbGwgdGhlIG1hcHBpbmdzIGFyZSBrbm93biBieSB0aGUgZW5kIG9mIHNl
dHVwX2FyY2goKSBhbmQgdGhlCmluaXRpYWxpemF0aW9uIG9mIG51bWFfbm9kZSBjYW4gYmUgbW92
ZWQgZWFybGllci4gCiAKPiA+IEkgd291bGQgYWxzbyBpbml0aWFsaXplIHRoZSBudW1hX25vZGUg
d2l0aCBOVU1BX05PX05PREUgYXQgZGVjbGFyYXRpb24sCj4gPiBzbyB0aGF0IGlmIHNvbWVvbmUg
Y2FsbHMgY3B1X3RvX25vZGUoKSBiZWZvcmUgdGhlIHZhcmlhYmxlIGlzIHByb3Blcmx5Cj4gPiBp
bml0aWFsaXplZCBhdCBydW50aW1lLCBoZSdsbCBnZXQgTk9fTk9ERSwgd2hpY2ggaXMgb2J2aW91
c2x5IGFuIGVycm9yLgo+IAo+IEV2ZW4gd2Ugc2V0IHRoZSBudW1hX25vZGUgd2l0aCBOVU1BX05P
X05PREUsIGl0IGRvZXMgbm90IGFsd2F5cyBwcm9kdWNlCj4gZXJyb3IuCj4gCj4gUGxlYXNlIHNl
ZSB0aGUgYWxsb2NfcGFnZXNfbm9kZSgpLgo+IAo+IAo+IFRoYW5rcwo+IAo+IEh1YW5nIFNoaWpp
ZQo+IAoKLS0gClNpbmNlcmVseSB5b3VycywKTWlrZS4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
