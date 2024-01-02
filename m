Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D35BC4706F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 02:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pd866KCD6WtzmIDjqTbtxFwodofgAkjFn88LvhlLbyc=; b=Y0yCkLwRKzTiws
	yX53vJRuY1QaKzBJJBytHRs3xV2cn0bBj5vFc/1pkN2apYWT5Ln30OE1+5OEElpbfeem/bwBA1S5s
	uj0ihbHdD7RPEUI7WxWsCNctnIMi/vxcyVI6iH1jHRlKmfMW0g9U89BFBh8VfCOUiII+S6CrpxjUa
	Y/+cuqHNi1fO91VBgWKlz4ZRrwEEJDMqGsh9RP8p2KWjAheipDCve65ML50lAp0t1x2pqk/ZQ11VW
	7pi6aFbZKt0gFBfBsmT8xC2JN4bWQNT0zn3g7tMv16t8Sho7eoTXIInxx0r2IjnQ2lmAjHQVVK8if
	lW9ukfqXIuvwefMgF9Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKUvM-006zpz-0S;
	Tue, 02 Jan 2024 02:54:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKUvI-006zoc-1C;
	Tue, 02 Jan 2024 02:54:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4CE23CE0B74;
	Tue,  2 Jan 2024 02:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A37C433C8;
	Tue,  2 Jan 2024 02:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704164065;
	bh=11z9yjbOWrH6tSiyWTkbin1v0ZP1GSqeHEVZ1qpwWW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cyJf3ixCiPi9UvwUkSVUpOmKCh2ropGCL0NBDwtKRDYXQBHVLgzbEDPcu3Fja3YJG
	 jSZs8VQEgmsEJFXxqzyDTpXLIyEvLGB9gRcZcYNrAM16lNkkiVRzm+TveG0nnUdsDO
	 Cz9Xw1AdV6g9B3vuf+hPBycNosrLD86ng+fYciVOev6XLcgrRF4jz70RQMH5NzMvdv
	 pcsyHKuZwX9hcMrpv5EtGFEKrqiVHYWwXPKdQhUADat9VR8ZW3EnNoQU9k4MY3EztT
	 7r9FaoDjSiOJIV8ph/7zp97UKkY4ISTBuOqOvwxFU52/3up2s1I2mMBs9cjS3+GXOv
	 b0gUGT9N0gE1A==
Date: Tue, 2 Jan 2024 10:41:40 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Nadav Amit <nadav.amit@broadcom.com>
Cc: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
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
Message-ID: <ZZN35DTJTNExCNXW@xhacker>
References: <20231228084642.1765-1-jszhang@kernel.org>
 <20231228084642.1765-2-jszhang@kernel.org>
 <204B6410-2EFA-462B-9DF7-64CC5F1D3AD2@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <204B6410-2EFA-462B-9DF7-64CC5F1D3AD2@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240101_185432_872010_F8AAFEA8 
X-CRM114-Status: GOOD (  39.32  )
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

T24gU2F0LCBEZWMgMzAsIDIwMjMgYXQgMTE6NTQ6MDJBTSArMDIwMCwgTmFkYXYgQW1pdCB3cm90
ZToKPiAKPiAKPiA+IE9uIERlYyAyOCwgMjAyMywgYXQgMTA6NDbigK9BTSwgSmlzaGVuZyBaaGFu
ZyA8anN6aGFuZ0BrZXJuZWwub3JnPiB3cm90ZToKPiA+IAo+ID4gRnJvbTogTmFkYXYgQW1pdCA8
bmFtaXRAdm13YXJlLmNvbT4KPiA+IAo+ID4gZnVsbG1tIGluIG1tdV9nYXRoZXIgaXMgc3VwcG9z
ZWQgdG8gaW5kaWNhdGUgdGhhdCB0aGUgbW0gaXMgdG9ybi1kb3duCj4gPiAoZS5nLiwgb24gcHJv
Y2VzcyBleGl0KSBhbmQgY2FuIHRoZXJlZm9yZSBhbGxvdyBjZXJ0YWluIG9wdGltaXphdGlvbnMu
Cj4gPiBIb3dldmVyLCB0bGJfZmluaXNoX21tdSgpIHNldHMgZnVsbG1tLCB3aGVuIGluIGZhY3Qg
aXQgd2FudCB0byBzYXkgdGhhdAo+ID4gdGhlIFRMQiBzaG91bGQgYmUgZnVsbHkgZmx1c2hlZC4K
PiA+IAo+ID4gQ2hhbmdlIHRsYl9maW5pc2hfbW11KCkgdG8gc2V0IG5lZWRfZmx1c2hfYWxsIGFu
ZCBjaGVjayB0aGlzIGZsYWcgaW4KPiA+IHRsYl9mbHVzaF9tbXVfdGxib25seSgpIHdoZW4gZGVj
aWRpbmcgd2hldGhlciBhIGZsdXNoIGlzIG5lZWRlZC4KPiA+IAo+ID4gQXQgdGhlIHNhbWUgdGlt
ZSwgYnJpbmcgdGhlIGFybTY0IGZ1bGxtbSBvbiBwcm9jZXNzIGV4aXQgb3B0aW1pemF0aW9uIGJh
Y2suCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE5hZGF2IEFtaXQgPG5hbWl0QHZtd2FyZS5jb20+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4g
PiBDYzogQW5kcmVhIEFyY2FuZ2VsaSA8YWFyY2FuZ2VAcmVkaGF0LmNvbT4KPiA+IENjOiBBbmRy
ZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+ID4gQ2M6IEFuZHkgTHV0b21p
cnNraSA8bHV0b0BrZXJuZWwub3JnPgo+ID4gQ2M6IERhdmUgSGFuc2VuIDxkYXZlLmhhbnNlbkBs
aW51eC5pbnRlbC5jb20+Cj4gPiBDYzogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQu
b3JnPgo+ID4gQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+ID4gQ2M6
IFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+Cj4gPiBDYzogWXUgWmhhbyA8eXV6aGFvQGdv
b2dsZS5jb20+Cj4gPiBDYzogTmljayBQaWdnaW4gPG5waWdnaW5AZ21haWwuY29tPgo+ID4gQ2M6
IHg4NkBrZXJuZWwub3JnCj4gPiAtLS0KPiA+IGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vdGxiLmgg
fCA1ICsrKystCj4gPiBpbmNsdWRlL2FzbS1nZW5lcmljL3RsYi5oICAgIHwgMiArLQo+ID4gbW0v
bW11X2dhdGhlci5jICAgICAgICAgICAgICB8IDIgKy0KPiA+IDMgZmlsZXMgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9pbmNsdWRlL2FzbS90bGIuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdGxiLmgKPiA+
IGluZGV4IDg0NmM1NjM2ODlhOC4uNjE2NGM1ZjNiNzhmIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9h
cm02NC9pbmNsdWRlL2FzbS90bGIuaAo+ID4gKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS90
bGIuaAo+ID4gQEAgLTYyLDcgKzYyLDEwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB0bGJfZmx1c2go
c3RydWN0IG1tdV9nYXRoZXIgKnRsYikKPiA+IAkgKiBpbnZhbGlkYXRpbmcgdGhlIHdhbGstY2Fj
aGUsIHNpbmNlIHRoZSBBU0lEIGFsbG9jYXRvciB3b24ndAo+ID4gCSAqIHJlYWxsb2NhdGUgb3Vy
IEFTSUQgd2l0aG91dCBpbnZhbGlkYXRpbmcgdGhlIGVudGlyZSBUTEIuCj4gPiAJICovCj4gPiAt
CWlmICh0bGItPmZ1bGxtbSkgewo+ID4gKwlpZiAodGxiLT5mdWxsbW0pCj4gPiArCQlyZXR1cm47
Cj4gPiArCj4gPiArCWlmICh0bGItPm5lZWRfZmx1c2hfYWxsKSB7Cj4gPiAJCWlmICghbGFzdF9s
ZXZlbCkKPiA+IAkJCWZsdXNoX3RsYl9tbSh0bGItPm1tKTsKPiA+IAkJcmV0dXJuOwo+ID4gCj4g
Cj4gVGhhbmtzIGZvciBwdWxsaW5nIG15IHBhdGNoIG91dCBvZiB0aGUgYWJ5c3MsIGJ1dCB0aGUg
Y2h1bmsgYWJvdmUKPiBkaWQgbm90IGNvbWUgZnJvbSBteSBvbGQgcGF0Y2guCgpJIHN0YXRlZCB0
aGlzIGluIGNvdmVyIGxldHRlciBtc2cgOykgSU1ITywgY3VycmVudCBhcm02NCB1c2VzIGZ1bGxt
bSBhcwpuZWVkX2ZsdXNoX2FsbCwgc28gSSB0aGluayB3ZSBuZWVkIGF0IGxlYXN0IHRoZSBuZWVk
X2ZsdXNoX2FsbCBsaW5lLgoKSSdkIGxpa2UgdG8gc2VlIGNvbW1lbnRzIGZyb20gYXJtNjQgZXhw
ZXJ0cy4KCj4gCj4gTXkga25vd2xlZGdlIG9mIGFybTY0IGlzIGEgYml0IGxpbWl0ZWQsIGJ1dCB0
aGUgY29kZSBkb2VzIG5vdCBzZWVtCj4gdG8gbWF0Y2ggdGhlIGNvbW1lbnQsIHNvIGlmIGl0IGlz
IGNvcnJlY3QgKHdoaWNoIEkgc3Ryb25nbHkgZG91YnQpLAo+IHRoZSBjb21tZW50IHNob3VsZCBi
ZSB1cGRhdGVkLgoKd2lsbCBkbyBpZiB0aGUgYWJvdmUgY2hhbmdlIGlzIGFjY2VwdGVkIGJ5IGFy
bTY0Cgo+IAo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMTAxMzEwMDExMzIu
MzM2ODI0Ny0yLW5hbWl0QHZtd2FyZS5jb20vCj4gCj4gCj4gLS0gCj4gVGhpcyBlbGVjdHJvbmlj
IGNvbW11bmljYXRpb24gYW5kIHRoZSBpbmZvcm1hdGlvbiBhbmQgYW55IGZpbGVzIHRyYW5zbWl0
dGVkIAo+IHdpdGggaXQsIG9yIGF0dGFjaGVkIHRvIGl0LCBhcmUgY29uZmlkZW50aWFsIGFuZCBh
cmUgaW50ZW5kZWQgc29sZWx5IGZvciAKPiB0aGUgdXNlIG9mIHRoZSBpbmRpdmlkdWFsIG9yIGVu
dGl0eSB0byB3aG9tIGl0IGlzIGFkZHJlc3NlZCBhbmQgbWF5IGNvbnRhaW4gCj4gaW5mb3JtYXRp
b24gdGhhdCBpcyBjb25maWRlbnRpYWwsIGxlZ2FsbHkgcHJpdmlsZWdlZCwgcHJvdGVjdGVkIGJ5
IHByaXZhY3kgCj4gbGF3cywgb3Igb3RoZXJ3aXNlIHJlc3RyaWN0ZWQgZnJvbSBkaXNjbG9zdXJl
IHRvIGFueW9uZSBlbHNlLiBJZiB5b3UgYXJlIAo+IG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50
IG9yIHRoZSBwZXJzb24gcmVzcG9uc2libGUgZm9yIGRlbGl2ZXJpbmcgdGhlIAo+IGUtbWFpbCB0
byB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCB5b3UgYXJlIGhlcmVieSBub3RpZmllZCB0aGF0IGFu
eSB1c2UsIAo+IGNvcHlpbmcsIGRpc3RyaWJ1dGluZywgZGlzc2VtaW5hdGlvbiwgZm9yd2FyZGlu
ZywgcHJpbnRpbmcsIG9yIGNvcHlpbmcgb2YgCj4gdGhpcyBlLW1haWwgaXMgc3RyaWN0bHkgcHJv
aGliaXRlZC4gSWYgeW91IHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCAKPiBwbGVhc2Ug
cmV0dXJuIHRoZSBlLW1haWwgdG8gdGhlIHNlbmRlciwgZGVsZXRlIGl0IGZyb20geW91ciBjb21w
dXRlciwgYW5kIAo+IGRlc3Ryb3kgYW55IHByaW50ZWQgY29weSBvZiBpdC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
