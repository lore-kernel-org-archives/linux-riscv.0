Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9533ECAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 18:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybvET+dYvelCR0TmdwasAPl32rOq71XRMo1RBWFMv14=; b=U0UznxDlWEQoDd
	qrpnvxZULVqRdXpS6T9t8W5kUQFNpf32NEIbzPr2VcOtFXoDltHm3DHTphp/2Fg0EVdEM83bzJPni
	CjPw/x2N+yscN88H08NObFOBIfASY7yBCjHr0Ir2T/0VULueIP8j5r2tZxJNONgk67qe0b7mgus1S
	LOYhY0aVGPMcSCOuWDzA52qiXsalgcgI0ctxlaAnF2DLRpKhjtsXxP8l4WHbP8TTJx+pn3O8VWNcn
	As+S1cZ2zYE+aLb7U8Y3BVJ649LM4WlDKQYl5IfRVrtA350l0sCCREcSB1MpMd3WYduFBc4XTgvmi
	YwmkR/pqDsRMgQJ2K7pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41dn-00000008lF1-35Me;
	Wed, 01 Oct 2025 18:33:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41dl-00000008lEV-1xQ9
	for linux-riscv@lists.infradead.org;
	Wed, 01 Oct 2025 18:33:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D96764093C;
	Wed,  1 Oct 2025 18:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25BC5C4CEF9;
	Wed,  1 Oct 2025 18:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759343604;
	bh=ZLIoi/NYFfvh7MIGr5zx8UVJQvY41XwspSGk66LmUh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jQWE0MOnhjMNSXVa/1zMRyDFAdNQm/EYGzhoxA0dysuEBW5+sHphaUoLTcrA3fhZE
	 SATTt5c3i8IngdVcWA59VotNW/5nrxzWkHzxi+wbf5i7hoVihA4k6a0y1X6aQ87X9U
	 bAhkHrcLC6Z/47y0IEhk439RnjbvtZEGT/PrBVnvrno6OAkpDpbwOzWAua12TyVEjH
	 yNBG1HS/l1D5Isj0UQrlyg1GiQb2dw4FZnOprZbWQan/TCQ7J/GjUVTo0qWmTn7byA
	 FlvITMTH9WrbipDPvhIAmjRcZRd0DmHruMt8RCP4fFT26VrHaS3dojWa/ELJrsLrLL
	 N5ZfjZ/AMpwtQ==
Date: Wed, 1 Oct 2025 11:33:21 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V updates for v6.18-rc1
Message-ID: <20251001183321.GA2760@quark>
References: <2c804359-3d43-0fba-7173-a87f9aec4bd2@kernel.org>
 <066d70c7-b0a7-45e5-9337-17901bc95664@codethink.co.uk>
 <CAHk-=wgfpswvq0TypePyjv3dofO5YaUC_fSd_MjzY7jogCUnCg@mail.gmail.com>
 <CAHk-=wgYcOiFvsJzFb+HfB4n6Wj6zM5H5EghUMfpXSCzyQVSfA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wgYcOiFvsJzFb+HfB4n6Wj6zM5H5EghUMfpXSCzyQVSfA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_113325_543272_173A0F28 
X-CRM114-Status: GOOD (  29.59  )
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

T24gVHVlLCBTZXAgMzAsIDIwMjUgYXQgMDQ6NTM6MjRQTSAtMDcwMCwgTGludXMgVG9ydmFsZHMg
d3JvdGU6Cj4gT24gVHVlLCAzMCBTZXB0IDIwMjUgYXQgMDk6MDQsIExpbnVzIFRvcnZhbGRzCj4g
PHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPiB3cm90ZToKPiA+Cj4gPiBPaCBDaHJpc3Qu
IElzIHNvbWVib2R5IHNlcmlvdXNseSB3b3JraW5nIG9uIEJFIHN1cHBvcnQgaW4gMjAyNT8KPiAK
PiBPaywgSSBqdXN0IGdvb2dsZWQgdGhpcywgYW5kIEkgYW0gcHV0dGluZyBteSBmb290IGRvd246
Cj4gCj4gIFdFIEFSRSBOT1QgUFJFRU1QVElWRUxZIFNVUFBPUlRJTkcgQklHLUVORElBTiBPTiBS
SVNDLVYKPiAKPiBUaGUgZG9jdW1lbnRlZCAicmVhc29uaW5nIiBmb3IgdGhhdCBjcmF6aW5lc3Mg
aXMgdG9vIHN0dXBpZCBmb3Igd29yZHMsCj4gYnV0IHNpbmNlIHJpc2N2Lm9yZyBkaWQgcHV0IGl0
IGluIHdvcmRzLCBJJ2xsIGp1c3QgcXVvdGUgdGhvc2Ugd29yZHMKPiBoZXJlOgo+IAo+ICAiVGhl
cmUgYXJlIHN0aWxsIGFwcGxpY2F0aW9ucyB3aGVyZSB0aGUgd2F5IGRhdGEgaXMgc3RvcmVkIG1h
dHRlcnMsCj4gc3VjaCBhcyB0aGUgcHJvdG9jb2xzIHRoYXQgbW92ZSBkYXRhIGFjcm9zcyB0aGUg
SW50ZXJuZXQsIHdoaWNoIGFyZQo+IGRlZmluZWQgYXMgYmlnLWVuZGlhbi4gU28gd2hlbiBhIGxp
dHRsZS1lbmRpYW4gc3lzdGVtIG5lZWRzIHRvIGluc3BlY3QKPiBvciBtb2RpZnkgYSBuZXR3b3Jr
IHBhY2tldCwgaXQgaGFzIHRvIHN3YXAgdGhlIGJpZy1lbmRpYW4gdmFsdWVzIHRvCj4gbGl0dGxl
LWVuZGlhbiBhbmQgYmFjaywgYSBwcm9jZXNzIHRoYXQgY2FuIHRha2UgYXMgbWFueSBhcyAxMC0y
MAo+IGluc3RydWN0aW9ucyBvbiBhIFJJU0MtViB0YXJnZXQgd2hpY2ggZG9lc27igJl0IGltcGxl
bWVudCB0aGUgWmJiCj4gZXh0ZW5zaW9uIgo+IAo+IEluIG90aGVyIHdvcmRzLCBpdCBpcyBzdWdn
ZXN0aW5nIHRoYXQgUklTQy1WIGFkZCBhIGJpZy1lbmRpYW4gbW9kZSBkdWUgdG8KPiAKPiAgKGEp
IGludGVybmV0IHByb3RvY29scyAtIHdoZXJlIGJ5dGUgc3dhcHBpbmcgaXMgbm90IGFuIGlzc3Vl
Cj4gCj4gIChiKSB1c2luZyAic29tZSBSSVNDLVYgaW1wbGVtZW50YXRpb25zIGRvbid0IGRvIHRo
ZSBleGlzdGluZyBaYmIKPiBleHRlbnNpb24iIGFzIGFuIGV4Y3VzZQo+IAo+IFRoaXMgaXMgcGxh
aW4gaW5zYW5pdHkuIEZpcnN0IG9mZiwgZXZlbiBpZiBieXRlIHN3YXBwaW5nIHdhcyBhIHJlYWwK
PiBjb3N0IGZvciBuZXR3b3JraW5nIC0gaXQncyBub3QsIHRoZSByZWFsIGNvc3RzIHRlbmQgdG8g
YmUgYWxsIGluCj4gbWVtb3J5IHN1YnN5c3RlbXMgLSBqdXN0IGltcGxlbWVudCB0aGUgZGFtbiBa
YmIgZXh0ZW5zaW9uLgo+IAo+IERvbid0IGdvICJ3ZSdyZSB0b28gaW5jb21wZXRlbnQgdG8gaW1w
bGVtZW50IFpiYiwgc28gd2UncmUgbm93IGFza2luZwo+IHRoYXQgRVZFUllCT0RZIEVMU0UgZmVl
bCB0aGUgcGFpbiBvZiBhIG11Y2ggKndvcnNlKiBleHRlbnNpb24gYW5kCj4gZnJhZ21lbnRpbmcg
UklTQy1WIGZ1cnRoZXIiLgo+IAo+IEknbSBob3BpbmcgdGhpcyBpcyBzb21lIEFwcmlsIGZvb2xz
IGpva2UsIGJ1dCB0aGF0IHBhZ2UgaXMgZGF0ZWQKPiAiTWFyY2ggMTAsIDIwMjUiLiBDbG9zZSwg
YnV0IG5vdCBjbG9zZSBlbm91Z2guCj4gCj4gVGhpcyBpcyB0aGUga2luZCBvZiBzaWxseSBzdHVm
ZiB0aGF0IGp1c3QgbWFrZXMgUklTQy1WIGxvb2sgYmFkLgo+IAo+IEJlbiAtIEknbSBhZnJhaWQg
dGhhdCB0aGF0IHBhZ2UgaGFzICJmdXJ0aGVyIHJlYWRpbmciIHBvaW50aW5nIHRvIGNvZGV0aGlu
ay4KPiAKPiBJIHNlZSBzb21lIENPTkZJR19DUFVfQklHX0VORElBTiBoYXMgYWxyZWFkeSBtYWRl
IGl0IGluLCBidXQgdGhpcwo+IG5lZWRzIHRvIHN0b3AuCj4gCj4gVGhlIG1haW5saW5lIGtlcm5l
bCBpcyBmb3IgbWFpbmxpbmUgZGV2ZWxvcG1lbnQuIE5vdCBmb3IgcmFuZG9tCj4gZXhwZXJpbWVu
dHMgdGhhdCBtYWtlIHRoZSB3b3JsZCBhIHdvcnNlIHBsYWNlLgo+IAo+IEFuZCB5ZXMsIHdlJ3Jl
IG9wZW4gc291cmNlLCBhbmQgdGhhdCB2ZXJ5IG11Y2ggbWVhbnMgdGhhdCBhbnlib2R5IGlzCj4g
bW9yZSB0aGFuIHdlbGNvbWUgdG8gdHJ5IHRvIHByb3ZlIG1lIHdyb25nLgo+IAo+IElmIGl0IHR1
cm5zIG91dCB0aGF0IEJFIFJJU0MtViBiZWNvbWVzIGEgcmVhbCB0aGluZyB0aGF0IGlzIHJlbGV2
YW50Cj4gYW5kIGFjdHVhbGx5IGZpbmRzIGEgcGxhY2UgaW4gdGhlIFJJU0MtViBlY29zeXN0ZW0s
IHRoZW4gX29mX2NvdXJzZV8KPiB3ZSBzaG91bGQgc3VwcG9ydCBpdCBhdCB0aGF0IHBvaW50IGlu
IHRoZSBtYWlubGluZSBrZXJuZWwuCj4gCj4gQnV0IEkgcmVhbGx5IGRvIHRoaW5rIHRoYXQgaXQg
YWN0dWFsbHkgbWFrZXMgUklTQy1WIG9ubHkgd29yc2UsIGFuZAo+IHRoYXQgd2Ugc2hvdWxkICpu
b3QqIGFjdGl2ZWx5IGhlbHAgdGhlIGZyYWdtZW50YXRpb24uCgorMS4gIFBsZWFzZSwgbGV0J3Mg
bm90IGRvIGJpZyBlbmRpYW4gUklTQy1WIGtlcm5lbHMgOigKClRoaXMgbWlzdGFrZSB3YXMgbWFk
ZSBmb3IgYXJtNjQsIGl0J3MgZmluYWxseSBnZXR0aW5nIGZpeGVkLgpTZWUgaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDI1MDkxOTE4NDAyNS4xNTQxNi0xLXdpbGxAa2VybmVsLm9yZy8KTGV0
J3Mgbm90IG1ha2UgdGhlIHNhbWUgbWlzdGFrZSBhZ2Fpbi4KCkFuZCBhcyBzb21lb25lIHdobyB3
b3JrcyBvbiBvcHRpbWl6ZWQgY3J5cHRvIGFuZCBDUkMgY29kZSwgdGhlIGFybTY0IGJpZwplbmRp
YW4ga2VybmVsIHN1cHBvcnQgaGFzIGFsd2F5cyBiZWVuIHJlYWxseSBwcm9ibGVtYXRpYy4gIEl0
J3MgcmFyZWx5CnRlc3RlZCwgYW5kIGNvZGUgdGhhdCBwcm9kdWNlcyBpbmNvcnJlY3Qgb3V0cHV0
cyBvbiBhcm02NCBiaWcgZW5kaWFuCnJlZ3VsYXJseSBnZXRzIGNvbW1pdHRlZCBhbmQgcmVsZWFz
ZWQuICBJdCBzb21ldGltZXMgZ2V0cyBmaXhlZCwgYnV0IG5vdAphbHdheXM7IGN1cnJlbnRseSB0
aGUgYXJtNjQgU00zIGFuZCBTTTQgY29kZSBwcm9kdWNlcyBpbmNvcnJlY3Qgb3V0cHV0cwpvbiBi
aWcgZW5kaWFuIGluIG1haW5saW5lLiAgKEkgZG9uJ3QgcmVhbGx5IGNhcmUgZW5vdWdoIHRvIGZp
eCBpdCwgVEJILikKCkkgcmVjZW50bHkgYWRkZWQgYXJtNjQgYmlnIGVuZGlhbiB0byBteSBvd24g
dGVzdGluZyBtYXRyaXguICBCdXQgSSBsb29rCmZvcndhcmQgdG8gZHJvcHBpbmcgdGhhdCwgYXMg
d2VsbCBhcyAqbm90KiBoYXZpbmcgdG8gc3RhcnQgdGVzdGluZyBvbgpSSVNDLVYgYmlnIGVuZGlh
biB0b28uLi4KCk9mIGNvdXJzZSwgdGhhdCdzIGp1c3Qgb25lIGV4YW1wbGUgZnJvbSBteSBvd24g
ZXhwZXJpZW5jZS4gIFRoZXJlJ3MgYQpsb3QgbW9yZSB0aGF0IENPTkZJR19DUFVfQklHX0VORElB
TiBjcmVhdGVzIHByb2JsZW1zIGZvci4KCi0gRXJpYwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
