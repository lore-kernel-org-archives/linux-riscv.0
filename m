Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC21C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 11:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3XxV6pRPxuOU3vqb/3lgscEyjPsTBUyM9XVIB0QWIWU=; b=ODiC5L1+Nb4xFF
	apneAIE+ZxFSTMpGBXdFqrDj3cE/DaD6AY7rpbhIry+JEF/WvGDyuuJRZ4oFMraBqCr41US02TyKt
	TFG5+kiJ97T0YN8u/19BwgPIZ1tbpPJAHlI6gaFoBqRE5P4BbYIeCt+WVVgPgiNVdMUbo0hAdRKKW
	CpESU3OGTyXNZAUgv1HH2rrvZkvc7OBo4YLkJMrIFnj6+yuhg8TbMd1KgT1VxOwVAqm4QuxSnkqWO
	qr6Om4qOMwEQ6Ipzo6Q2/IEuTQ8m70uN8AMzSf54ERe1iwoUuI68Ee/NdcfMx1ct+rDUHwMSRB8ZU
	xGwaeL23LC7rMmDBiK1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKzGT-00AUoL-2o;
	Wed, 03 Jan 2024 11:18:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKzGQ-00AUnD-2A
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 11:18:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 49EDBB810F2;
	Wed,  3 Jan 2024 11:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2721AC433C7;
	Wed,  3 Jan 2024 11:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704280695;
	bh=7j4rRvQhFlXNPbxO4qDErGk4qOnDNU6odiqKx4NSeJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T33Dvq1B38BBStl8DVJQDWzr+/YVqnCcVcLSOREXVwVv7zndIJSkO0XbQ3wg71IBG
	 lKzYwWNCL2s7MsFCC73XrHm1Wgu9Fp6MzxvvnDYNaI352uUO0ZFPMkL2n8FiCxSD0M
	 houebhQytEz3Z1vmvPnuMD3xdBSzjYw4XE2CVGARVjxkMmOMNV/U5c4ptw9FqUK2qJ
	 pXqmSfvpmG4r3BuDqviG9zkipc9L45b88alCdoh9VxzB0q4Bm5t22rxHU26DBWwfbH
	 +tAW8UzptTScyiznIfSFmiF+LVjKYvNmUpQLbvsmSp/vesLPvD5n0sE5gNVRiVOcL0
	 tNULqAsPIfWvA==
Date: Wed, 3 Jan 2024 19:05:04 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: leobras.c@gmail.com
Cc: Leonardo =?utf-8?B?QnLDoXM=?= <leobras@redhat.com>,
	Palmer Dabbelt <palmer@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>,
	Will Deacon <will@kernel.org>, peterz@infradead.org,
	boqun.feng@gmail.com, Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	parri.andrea@gmail.com, andrzej.hajda@intel.com, guoren@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v5 5/5] riscv/cmpxchg: Implement xchg for variables
 of size 1 and 2
Message-ID: <ZZU/YNPMigiD/k1g@xhacker>
References: <mhng-92f37526-d36c-48c0-8fbd-7676df1b6086@palmer-ri-x1c9>
 <2a4f1f47e945772b9fbb53a51e148636e0ae6e48.camel@redhat.com>
 <ZW_GzKUoqO4fD4Je@LeoBras>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZW_GzKUoqO4fD4Je@LeoBras>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_031822_986858_42B7812A 
X-CRM114-Status: GOOD (  47.37  )
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

T24gVHVlLCBEZWMgMDUsIDIwMjMgYXQgMDk6NTY6NDRQTSAtMDMwMCwgbGVvYnJhcy5jQGdtYWls
LmNvbSB3cm90ZToKPiBGcm9tOiBMZW9uYXJkbyBCcmFzIDxsZW9icmFzQHJlZGhhdC5jb20+Cj4g
Cj4gT24gV2VkLCBBdWcgMzAsIDIwMjMgYXQgMDY6NTk6NDZQTSAtMDMwMCwgTGVvbmFyZG8gQnLD
oXMgd3JvdGU6Cj4gPiBPbiBUaHUsIDIwMjMtMDgtMTAgYXQgMDk6MjMgLTA3MDAsIFBhbG1lciBE
YWJiZWx0IHdyb3RlOgo+ID4gPiBPbiBUaHUsIDEwIEF1ZyAyMDIzIDA5OjA0OjA0IFBEVCAoLTA3
MDApLCBsZW9icmFzQHJlZGhhdC5jb20gd3JvdGU6Cj4gPiA+ID4gT24gVGh1LCAyMDIzLTA4LTEw
IGF0IDA4OjUxICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gPiA+ID4gT24gVGh1LCBB
dWcgMTAsIDIwMjMsIGF0IDA2OjAzLCBMZW9uYXJkbyBCcmFzIHdyb3RlOgo+ID4gPiA+ID4gPiB4
Y2hnIGZvciB2YXJpYWJsZXMgb2Ygc2l6ZSAxLWJ5dGUgYW5kIDItYnl0ZXMgaXMgbm90IHlldCBh
dmFpbGFibGUgZm9yCj4gPiA+ID4gPiA+IHJpc2N2LCBldmVuIHRob3VnaCBpdHMgcHJlc2VudCBp
biBvdGhlciBhcmNoaXRlY3R1cmVzIHN1Y2ggYXMgYXJtNjQgYW5kCj4gPiA+ID4gPiA+IHg4Ni4g
VGhpcyBjb3VsZCBsZWFkIHRvIG5vdCBiZWluZyBhYmxlIHRvIGltcGxlbWVudCBzb21lIGxvY2tp
bmcgbWVjaGFuaXNtcwo+ID4gPiA+ID4gPiBvciByZXF1aXJpbmcgc29tZSByZXdvcmsgdG8gbWFr
ZSBpdCB3b3JrIHByb3Blcmx5Lgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gSW1wbGVtZW50IDEt
Ynl0ZSBhbmQgMi1ieXRlcyB4Y2hnIGluIG9yZGVyIHRvIGFjaGlldmUgcGFyaXR5IHdpdGggb3Ro
ZXIKPiA+ID4gPiA+ID4gYXJjaGl0ZWN0dXJlcy4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IExlb25hcmRvIEJyYXMgPGxlb2JyYXNAcmVkaGF0LmNvbT4KPiA+ID4gPiA+
IAo+ID4gPiA+IAo+ID4gPiA+IEhlbGxvIEFybmQgQmVyZ21hbm4sIHRoYW5rcyBmb3IgcmV2aWV3
aW5nIQo+ID4gPiA+IAo+ID4gPiA+ID4gUGFyaXR5IHdpdGggb3RoZXIgYXJjaGl0ZWN0dXJlcyBi
eSBpdHNlbGYgaXMgbm90IGEgcmVhc29uIHRvIGRvIHRoaXMsCj4gPiA+ID4gPiBpbiBwYXJ0aWN1
bGFyIHRoZSBvdGhlciBhcmNoaXRlY3R1cmVzIHlvdSBsaXN0ZWQgaGF2ZSB0aGUgaW5zdHJ1Y3Rp
b25zCj4gPiA+ID4gPiBpbiBoYXJkd2FyZSB3aGlsZSByaXNjdiBkb2VzIG5vdC4KPiA+ID4gPiAK
PiA+ID4gPiBTdXJlLCBJIHVuZGVyc3RhbmQgUklTQy1WIGRvbid0IGhhdmUgbmF0aXZlIHN1cHBv
cnQgZm9yIHhjaGcgb24gdmFyaWFibGVzIG9mCj4gPiA+ID4gc2l6ZSA8IDRCLiBNeSBhcmd1bWVu
dCBpcyB0aGF0IGl0J3MgbmljZSB0byBoYXZlIGV2ZW4gYW4gZW11bGF0ZWQgdmVyc2lvbiBmb3IK
PiA+ID4gPiB0aGlzIGluIGNhc2UgYW55IGZ1dHVyZSBtZWNoYW5pc20gd2FudHMgdG8gdXNlIGl0
Lgo+ID4gPiA+IAo+ID4gPiA+IE5vdCBoYXZpbmcgaXQgbWF5IG1lYW4gd2Ugd29uJ3QgYmUgYWJs
ZSB0byBlbmFibGUgZ2l2ZW4gbWVjaGFuaXNtIGluIFJJU0MtVi4gCj4gPiA+IAo+ID4gPiBJSVVD
IHRoZSBhc2sgaXMgdG8gaGF2ZSBhIHVzZXIgd2l0aGluIHRoZSBrZXJuZWwgZm9yIHRoZXNlIGZ1
bmN0aW9ucy4gIAo+ID4gPiBUaGF0J3MgdGhlIGdlbmVyYWwgdGhpbmcgdG8gZG8sIGFuZCBsYXN0
IHRpbWUgdGhpcyBjYW1lIHVwIHRoZXJlIHdhcyBubyAKPiA+ID4gaW4ta2VybmVsIHVzZSBvZiBp
dCAtLSB0aGUgcXNwaW5sb2NrIHN0dWZmIHdvdWxkLCBidXQgd2UgaGF2ZW4ndCBlbmFibGVkIAo+
ID4gPiBpdCB5ZXQgYmVjYXVzZSB3ZSdyZSB3b3JyaWVkIGFib3V0IHRoZSBwZXJmb3JtYW5jZS9m
YWlybmVzcyBzdHVmZiB0aGF0IAo+ID4gPiBvdGhlciBwb3J0cyBoYXZlIHNlZW4gYW5kIG5vYm9k
eSdzIGdvdCBjb25jcmV0ZSBiZW5jaG1hcmtzIHlldCAodGhvdWdoIAo+ID4gPiB0aGVyZSdzIGFu
b3RoZXIgcGF0Y2ggc2V0IG91dCB0aGF0IEkgaGF2ZW4ndCBoYWQgdGltZSB0byBsb29rIHRocm91
Z2gsIAo+ID4gPiBzbyB0aGF0IG1heSBoYXZlIGNoYW5nZWQpLgo+ID4gPiAKPiA+ID4gU28gaWYg
c29tZXRoaW5nIHVzZXMgdGhlc2UgSSdtIGhhcHB5IHRvIGdvIGxvb2sgY2xvc2VyLgo+ID4gCj4g
PiBJSVVDIHBhdGNoZXMgNCAmIDUgd2lsbCBiZSB1c2VkIGJ5IHFzcGlubG9jaywgd2hpY2ggbWF5
IG5vdCBiZSBkb25lIHlldCwgc28gd2UKPiA+IGRvbid0IGhhdmUgYW4gdXNlIGZvciB0aGVtIGZv
ciB0aGUgdGltZSBiZWluZy4KPiA+IAo+ID4gT3RoZXJ3aXNlLCBhbnkgY29tbWVudHMgb24gcGF0
Y2hlcyAxLCAyICYgMz8KPiAKPiBwaW5nCgpIaSwKCkkgYmVsaWV2ZSB0aGUgIlJGQyIgbWFrZXMg
c29tZSByZXZpZXdlcnMgdGhpbmsgdGhlIHNlcmllcyBpc24ndCByZWFkeQpmb3IgcmV2aWV3LCBz
byBjb3VsZCB5b3UgcGxlYXNlIHNlbmQgYSBuZXcgb25lIHcvbyBSRkM/Cgp0aGFua3MKCj4gCj4g
PiAKPiA+ID4gCj4gPiA+ID4gPiBFbXVsYXRpbmcgdGhlIHNtYWxsIHhjaGcoKSB0aHJvdWdoIGNt
cHhjaGcoKSBpcyBwYXJ0aWN1bGFybHkgdHJpY2t5Cj4gPiA+ID4gPiBzaW5jZSBpdCdzIGVhc3kg
dG8gcnVuIGludG8gYSBjYXNlIHdoZXJlIHRoaXMgZG9lcyBub3QgZ3VhcmFudGVlCj4gPiA+ID4g
PiBmb3J3YXJkIHByb2dyZXNzLgo+ID4gPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gRGlkbid0IGdl
dCB0aGlzIHBhcnQ6Cj4gPiA+ID4gQnkgImVtdWxhdGluZyBzbWFsbCB4Y2hnKCkgdGhyb3VnaCBj
bXB4Y2hnKCkiLCBkaWQgeW91IG1lYW4gbGlrZSBlbXVsYXRpbmcgYW4KPiA+ID4gPiB4Y2hnICh1
c3VhbGx5IDEgaW5zdHJ1Y3Rpb24pIHdpdGggbHIgJiBzYyAoc2FtZSB1c2VkIGluIGNtcHhjaGcp
ID8KPiA+ID4gPiAKPiA+ID4gPiBJZiBzbywgeWVhaCwgaXQncyBhIGZhaXIgcG9pbnQ6IGluIHNv
bWUgZXh0cmVtZSBjYXNlIHdlIGNvdWxkIGhhdmUgbXVsdGlwbGUKPiA+ID4gPiB0aHJlYWRzIGFj
Y2Vzc2luZyBnaXZlbiBjYWNoZWxpbmUgYW5kIGhhdmUgc2MgYWx3YXlzIGZhaWxpbmcuIE9uIHRo
ZSBvdGhlciBoYW5kLAo+ID4gPiA+IHRoZXJlIGFyZSAyIGFyZ3VtZW50cyBvbiB0aGF0Ogo+ID4g
PiA+IAo+ID4gPiA+IDEgLSBPdGhlciBhcmNoaXRlY3R1cmVzLCAoc3VjaCBhcyBwb3dlcnBjLCBh
cm0gYW5kIGFybTY0IHdpdGhvdXQgTFNFIGF0b21pY3MpCj4gPiA+ID4gYWxzbyBzZWVtIHRvIHJl
bHkgaW4gdGhpcyBtZWNoYW5pc20gZm9yIGV2ZXJ5IHhjaGcgc2l6ZS4gQW5vdGhlciBhcmNocyBs
aWtlIGNza3kKPiA+ID4gPiBhbmQgbG9vbmdhcmNoIHVzZSBhc20gdGhhdCBsb29rIGxpa2UgbWlu
ZSB0byBoYW5kbGUgc2l6ZSA8IDRCIHhjaGcuIAo+ID4gPiA+ICAgICAKPiA+ID4gPiAKPiA+ID4g
PiA+ICBUaGlzIGlzIGFsc28gc29tZXRoaW5nIHRoYXQgYWxtb3N0IG5vIGFyY2hpdGVjdHVyZQo+
ID4gPiA+ID4gc3BlY2lmaWMgY29kZSByZWxpZXMgb24gKGdlbmVyaWMgcXNwaW5sb2NrIGJlaW5n
IGEgbm90YWJsZSBleGNlcHRpb24pLgo+ID4gPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gMiAtIEFz
IHlvdSBtZW50aW9uZWQsIHRoZXJlIHNob3VsZCBiZSB2ZXJ5IGxpdHRsZSBjb2RlIHRoYXQgd2ls
bCBhY3R1YWxseSBtYWtlCj4gPiA+ID4gdXNlIG9mIHhjaGcgZm9yIHZhcnMgPCA0Qiwgc28gaXQg
c2hvdWxkIGJlIHNhZmUgdG8gYXNzdW1lIGl0cyBmaW5lIHRvIG5vdAo+ID4gPiA+IGd1YXJhbnRl
ZSBmb3J3YXJkIHByb2dyZXNzIGZvciB0aG9zZSByYXJlIHVzYWdlcyAobGlrZSBzb21lIG9mIGFi
b3ZlIG1lbnRpb25lZAo+ID4gPiA+IGFyY2hzKS4KPiA+ID4gPiAKPiA+ID4gPiA+IEkgd291bGQg
cmVjb21tZW5kIGp1c3QgZHJvcHBpbmcgdGhpcyBwYXRjaCBmcm9tIHRoZSBzZXJpZXMsIGF0IGxl
YXN0Cj4gPiA+ID4gPiB1bnRpbCB0aGVyZSBpcyBhIG5lZWQgZm9yIGl0Lgo+ID4gPiA+IAo+ID4g
PiA+IFdoaWxlIEkgYWdyZWUgdGhpcyBpcyBhIHZhbGlkIHBvaW50LCBJIGJlbGlldmUgaXRzIG1v
cmUgaW50ZXJlc3RpbmcgdG8gaGF2ZSBpdAo+ID4gPiA+IGltcGxlbWVudGVkIGlmIGFueSBmdXR1
cmUgbWVjaGFuaXNtIHdhbnRzIHRvIG1ha2UgdXNlIG9mIHRoaXMuIAo+ID4gPiA+IAo+ID4gPiA+
IAo+ID4gPiA+IFRoYW5rcyEKPiA+ID4gPiBMZW8KPiA+ID4gCj4gPiAKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
