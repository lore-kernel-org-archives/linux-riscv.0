Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9AAC4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Apr 2024 09:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BoFoEuZBZ2GmgT6nTY1yj8VyWaMDsukznPzPW7inFGs=; b=OlmsyEezt8mlGV
	7ZkSvyakzK7jqxpmDU53kWFTEEKhm0TmT+IWac66EE0BwocSwKutCq3UZIiMlo26TROSmZu+z8KoW
	ieGPTC2cPCnt/yIsIytt7xHokNU6WwVgYNkuuml6H832eBQdGgJaaB6f422J6CrNTrn3U6ZvLdeas
	zGgvrAS0D1DVsCReAS8T7EH44wQP76ACZE+erTaKNYzzNB+uRZjgffb8Tat2Vqe5dr+imVeIjcReL
	2WISOuNeNA9OHXO00sUsRJJCPiFvJDOYeCuNCHHup1XnIfmRKGt4oqisDY22T7nMEIFQOkRanYmzd
	RODPUb/RAkqbZbMSbtqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ry6l1-00000008A6x-0OVH;
	Sat, 20 Apr 2024 09:11:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ry6kx-00000008A4N-13fA;
	Sat, 20 Apr 2024 09:11:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9266A60677;
	Sat, 20 Apr 2024 09:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72072C072AA;
	Sat, 20 Apr 2024 09:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713604294;
	bh=gx+4p/uDBfF9iByUyBCzGltg748yzYFaTBhBB8UsaaI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WiOFFcIsUZjqS2Hu+iFB3XXcMZa5pzL1HBjixIci52d8Dz9R1WD9G9VB56jkKYeZ0
	 yDy0eI1sbeixq6g8aSxoZ6nlN7GVrsoYNR+OtdV5qezCXWWNalxmX0AQMOmxxVvjB8
	 mDIxwHW3sBjsjL/fldCkVAVACyfuDXihwfUSyE32m5VVdZN1QGS01/8WCa5+GHvn0e
	 eqnq4e8Pva3SV5BNn9cHwpijQL1+svPQU6wcQztqSBwE5iNQ3v/A2Gh1fOxnMqAWe6
	 p9b3Z1WSt5cu2C+P9w6zBxw+xdBSQlJVW4JFCyv2uFOrSDGSq+nT5wb2kq12tKe8xw
	 OK7o8nQPMJ1wg==
Date: Sat, 20 Apr 2024 18:11:21 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Song Liu <song@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Peter
 Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, Alexandre
 Ghiti <alexghiti@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Topel <bjorn@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller"
 <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, Donald Dutile
 <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>, Heiko Carstens
 <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen
 <chenhuacai@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, Luis
 Chamberlain <mcgrof@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nadav Amit <nadav.amit@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Puranjay Mohan <puranjay12@gmail.com>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, Steven
 Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, Will
 Deacon <will@kernel.org>, bpf@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and
 execmem_free()
Message-Id: <20240420181121.d6c7be11a6f98dc2462f8b41@kernel.org>
In-Reply-To: <ZiNDGjkcqEPqruza@kernel.org>
References: <ZiE91CJcNw7gBj9g@kernel.org>
	<CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
	<ZiFd567L4Zzm2okO@kernel.org>
	<CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
	<ZiIVVBgaDN4RsroT@kernel.org>
	<CAPhsuW7WoU+a46FhqqH8f-3=ehxeD4wSgKDWegMin1pT49OSWw@mail.gmail.com>
	<ZiKjmaDgz_56ovbv@kernel.org>
	<CAPhsuW7Nj1Sa_9xQtTgHz9AmX39zdh2x2COqA-qmkfpfX9hNWw@mail.gmail.com>
	<ZiLNGgVSQ7_cg58y@kernel.org>
	<CAPhsuW4KRM4O4RFbYQrt=Coqyh9w29WiF2YF=8soDfauLFsKBA@mail.gmail.com>
	<ZiNDGjkcqEPqruza@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_021135_430981_1BDF893C 
X-CRM114-Status: GOOD (  33.44  )
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

T24gU2F0LCAyMCBBcHIgMjAyNCAwNzoyMjo1MCArMDMwMApNaWtlIFJhcG9wb3J0IDxycHB0QGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBGcmksIEFwciAxOSwgMjAyNCBhdCAwMjo0MjoxNlBNIC0w
NzAwLCBTb25nIExpdSB3cm90ZToKPiA+IE9uIEZyaSwgQXByIDE5LCAyMDI0IGF0IDE6MDDigK9Q
TSBNaWtlIFJhcG9wb3J0IDxycHB0QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBG
cmksIEFwciAxOSwgMjAyNCBhdCAxMDozMjozOUFNIC0wNzAwLCBTb25nIExpdSB3cm90ZToKPiA+
ID4gPiBPbiBGcmksIEFwciAxOSwgMjAyNCBhdCAxMDowM+KAr0FNIE1pa2UgUmFwb3BvcnQgPHJw
cHRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gWy4uLl0KPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA0MTExNjA1MjYuMjA5
MzQwOC0xLXJwcHRAa2VybmVsLm9yZwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBGb3IgdGhlIFJP
WCB0byB3b3JrLCB3ZSBuZWVkIGRpZmZlcmVudCB1c2VycyAobW9kdWxlIHRleHQsIGtwcm9iZSwg
ZXRjLikgdG8gaGF2ZQo+ID4gPiA+ID4gPiB0aGUgc2FtZSBleGVjbWVtX3JhbmdlLiBGcm9tIFsx
XToKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gc3RhdGljIHZvaWQgKmV4ZWNtZW1fY2FjaGVfYWxs
b2Moc3RydWN0IGV4ZWNtZW1fcmFuZ2UgKnJhbmdlLCBzaXplX3Qgc2l6ZSkKPiA+ID4gPiA+ID4g
ewo+ID4gPiA+ID4gPiAuLi4KPiA+ID4gPiA+ID4gICAgICAgIHAgPSBfX2V4ZWNtZW1fY2FjaGVf
YWxsb2Moc2l6ZSk7Cj4gPiA+ID4gPiA+ICAgICAgICBpZiAocCkKPiA+ID4gPiA+ID4gICAgICAg
ICAgICAgICAgcmV0dXJuIHA7Cj4gPiA+ID4gPiA+ICAgICAgIGVyciA9IGV4ZWNtZW1fY2FjaGVf
cG9wdWxhdGUocmFuZ2UsIHNpemUpOwo+ID4gPiA+ID4gPiAuLi4KPiA+ID4gPiA+ID4gfQo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiBXZSBhcmUgY2FsbGluZyBfX2V4ZWNtZW1fY2FjaGVfYWxsb2Mo
KSB3aXRob3V0IHJhbmdlLiBGb3IgdGhpcyB0byB3b3JrLAo+ID4gPiA+ID4gPiB3ZSBjYW4gb25s
eSBjYWxsIGV4ZWNtZW1fY2FjaGVfYWxsb2MoKSB3aXRoIG9uZSBleGVjbWVtX3JhbmdlLgo+ID4g
PiA+ID4KPiA+ID4gPiA+IEFjdHVhbGx5LCBvbiB4ODYgdGhpcyB3aWxsICJqdXN0IHdvcmsiIGJl
Y2F1c2UgZXZlcnl0aGluZyBzaGFyZXMgdGhlIHNhbWUKPiA+ID4gPiA+IGFkZHJlc3Mgc3BhY2Ug
OikKPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGUgMk0gcGFnZXMgaW4gdGhlIGNhY2hlIHdpbGwgYmUg
aW4gdGhlIG1vZHVsZXMgc3BhY2UsIHNvCj4gPiA+ID4gPiBfX2V4ZWNtZW1fY2FjaGVfYWxsb2Mo
KSB3aWxsIGFsd2F5cyByZXR1cm4gbWVtb3J5IGZyb20gdGhhdCBhZGRyZXNzIHNwYWNlLgo+ID4g
PiA+ID4KPiA+ID4gPiA+IEZvciBvdGhlciBhcmNoaXRlY3R1cmVzIHRoaXMgaW5kZWVkIG5lZWRz
IHRvIGJlIGZpeGVkIHdpdGggcGFzc2luZyB0aGUKPiA+ID4gPiA+IHJhbmdlIHRvIF9fZXhlY21l
bV9jYWNoZV9hbGxvYygpIGFuZCBsaW1pdGluZyBzZWFyY2ggaW4gdGhlIGNhY2hlIGZvciB0aGF0
Cj4gPiA+ID4gPiByYW5nZS4KPiA+ID4gPgo+ID4gPiA+IEkgdGhpbmsgd2UgYXQgbGVhc3QgbmVl
ZCB0aGUgIm1hcCB0byIgY29uY2VwdCAoaW5pdGlhbGx5IHByb3Bvc2VkIGJ5IFRob21hcykKPiA+
ID4gPiB0byBnZXQgdGhpcyB3b3JrLiBGb3IgZXhhbXBsZSwgRVhFQ01FTV9CUEYgYW5kIEVYRUNN
RU1fS1BST0JFCj4gPiA+ID4gbWFwcyB0byBFWEVDTUVNX01PRFVMRV9URVhULCBzbyB0aGF0IGFs
bCB0aGVzZSBhY3R1YWxseSBzaGFyZQo+ID4gPiA+IHRoZSBzYW1lIHJhbmdlLgo+ID4gPgo+ID4g
PiBXaHk/Cj4gPiAKPiA+IElJVUMsIHdlIG5lZWQgdG8gdXBkYXRlIF9fZXhlY21lbV9jYWNoZV9h
bGxvYygpIHRvIHRha2UgYSByYW5nZSBwb2ludGVyIGFzCj4gPiBpbnB1dC4gbW9kdWxlIHRleHQg
d2lsbCB1c2UgInJhbmdlIiBmb3IgRVhFQ01FTV9NT0RVTEVfVEVYVCwgd2hpbGUga3Byb2JlCj4g
PiB3aWxsIHVzZSAicmFuZ2UiIGZvciBFWEVDTUVNX0tQUk9CRS4gV2l0aG91dCAibWFwIHRvIiBj
b25jZXB0IG9yIHNoYXJpbmcKPiA+IHRoZSAicmFuZ2UiIG9iamVjdCwgd2Ugd2lsbCBoYXZlIHRv
IGNvbXBhcmUgZGlmZmVyZW50IHJhbmdlIHBhcmFtZXRlcnMgdG8gY2hlY2sKPiA+IHdlIGNhbiBz
aGFyZSBjYWNoZWQgcGFnZXMgYmV0d2VlbiBtb2R1bGUgdGV4dCBhbmQga3Byb2JlLCB3aGljaCBp
cyBub3QKPiA+IGVmZmljaWVudC4gRGlkIEkgbWlzcyBzb21ldGhpbmc/CgpTb25nLCB0aGFua3Mg
Zm9yIHRyeWluZyB0byBlcGxhaW4uIEkgdGhpbmsgSSBuZWVkIHRvIGV4cGxhaW4gd2h5IEkgdXNl
ZAptb2R1bGVfYWxsb2MoKSBvcmlnaW5hbGx5LgoKVGhpcyBkZXBlbmRzIG9uIGhvdyBrcHJvYmUg
ZmVhdHVyZXMgYXJlIGltcGxlbWVudGVkIG9uIHRoZSBhcmNoaXRlY3R1cmUsIGFuZApob3cgbXVj
aCBmZWF0dXJlcyBhcmUgc3VwcG9ydGVkIG9uIGtwcm9iZXMuCgpCZWNhdXNlIGtwcm9iZSBqdW1w
IG9wdGltaXphdGlvbiBhbmQga3Byb2JlIGp1bXAtYmFjayBvcHRpbWl6YXRpb24gbmVlZCB0bwp1
c2UgYSBqdW1wIGluc3RydWN0aW9uIHRvIGp1bXAgaW50byB0aGUgdHJhbXBvbGluZSBhbmQganVt
cCBiYWNrIGZyb20gdGhlCnRyYW1wb2xpbmUgZGlyZWN0bHksIGlmIHRoZSBhcmNoaXRlY3V0dXJl
IGptcCBpbnN0cnVjdGlvbiBzdXBwb3J0cyArLTJHQiByYW5nZQpsaWtlIHg4NiwgaXQgbmVlZHMg
dG8gYWxsb2NhdGUgdGhlIHRyYW1wb2xpbmUgYnVmZmVyIGluc2lkZSBzdWNoIGFkZHJlc3Mgc3Bh
Y2UuClRoaXMgcmVxdWlyZW1lbnQgaXMgc2ltaWxhciB0byB0aGUgbW9kdWxlcyAoYmVjYXVzZSBt
b2R1bGUgZnVuY3Rpb24gbmVlZHMgdG8KY2FsbCBvdGhlciBmdW5jdGlvbnMgaW4gdGhlIGtlcm5l
bCBldGMuKSwgYXQgbGVhc3Qga3Byb2JlcyBvbiB4ODYgdXNlZAptb2R1bGVfYWxsb2MoKS4KCkhv
d2V2ZXIsIGlmIGFuIGFyY2hpdGVjdHVyZSBvbmx5IHN1cHBvcnRzIGJyZWFrcG9pbnQvdHJhcCBi
YXNlZCBrcHJvYmUsCml0IGRvZXMgbm90IG5lZWQgdG8gY29uc2lkZXIgd2hldGhlciB0aGUgZXhl
Y21lbSBpcyBhbGxvY2F0ZWQuCgo+IAo+IFdlIGNhbiBhbHdheXMgc2hhcmUgbGFyZ2UgUk9YIHBh
Z2VzIGFzIGxvbmcgYXMgdGhleSBhcmUgd2l0aGluIHRoZSBjb3JyZWN0Cj4gYWRkcmVzcyBzcGFj
ZS4gVGhlIHBlcm1pc3Npb25zIGZvciB0aGVtIGFyZSBST1ggYW5kIHRoZSBhbGlnbm1lbnQKPiBk
aWZmZXJlbmNlcyBhcmUgZHVlIHRvIEtBU0FOIGFuZCB0aGlzIGlzIGhhbmRsZWQgZHVyaW5nIGFs
bG9jYXRpb24gb2YgdGhlCj4gbGFyZ2UgcGFnZSB0byByZWZpbGwgdGhlIGNhY2hlLiBfX2V4ZWNt
ZW1fY2FjaGVfYWxsb2MoKSBvbmx5IG5lZWRzIHRvIGxpbWl0Cj4gdGhlIHNlYXJjaCBmb3IgdGhl
IGFkZHJlc3Mgc3BhY2Ugb2YgdGhlIHJhbmdlLgoKU28gSSBkb24ndCB0aGluayBFWEVDTUVNX0tQ
Uk9CRSBhbHdheXMgc2FtZSBhcyBFWEVDTUVNX01PRFVMRV9URVhULCBpdApzaG91bGQgYmUgY29u
ZmlndXJlZCBmb3IgZWFjaCBhcmNoLiBFc3BlY2lhbGx5LCBpZiBpdCBpcyBvbmx5IHVzZWQgZm9y
CnNlYXJjaGluZyBwYXJhbWV0ZXIsIGl0IGxvb2tzIE9LIHRvIG1lLgoKVGhhbmsgeW91LAoKPiAK
PiBBbmQgcmVnYXJkbGVzcywgdGhleSB3YXkgd2UgZGVhbCB3aXRoIHNoYXJpbmcgb2YgdGhlIGNh
Y2hlIGNhbiBiZSBzb3J0ZWQKPiBvdXQgbGF0ZXIuCj4gCj4gPiBUaGFua3MsCj4gPiBTb25nCj4g
Cj4gLS0gCj4gU2luY2VyZWx5IHlvdXJzLAo+IE1pa2UuCj4gCgoKLS0gCk1hc2FtaSBIaXJhbWF0
c3UgKEdvb2dsZSkgPG1oaXJhbWF0QGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
