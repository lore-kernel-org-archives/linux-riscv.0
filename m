Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AD2C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 18:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VSAJfzXuLAtEqPyLLLSJ8lXhQdJYviCT9OVFCreIwiM=; b=gvBND/IhE5kq9Y
	7rCB92F88E0ksOiNO9TptDTsXadYoB+BqA2b4eFD2DQuW1w2G+bpdzuOOlBwGqSmLtH0SS0LZs9hQ
	7CgAjFv5H3IQiQv9QIItbHSslSIOFXS88NIavSL31FXWVisZlSo9fJD65I+hKoYBvkYeWwpq01X3/
	HcNHWdDQ+FFG/YkDoLLtoUhW9FsjGSbUTv9+YurVke4Mjic2qS02VJUVJDn81IAzW5L942HqwW+oF
	AmHcqpwe2SYJtQzj1NFyOR4L/HkCGk324sez931Oaiz/LjJaTZDUxG7W+ZWep4yKPbtAg4mSWqnkS
	bivqbXMLlbZEqG9gx0xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Ka4-00ABv7-1x;
	Thu, 08 Jun 2023 18:41:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Ka0-00ABtj-1N;
	Thu, 08 Jun 2023 18:41:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4D0F465066;
	Thu,  8 Jun 2023 18:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A486DC433D2;
	Thu,  8 Jun 2023 18:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686249710;
	bh=4a7fPJtZnT2G3XUHjxk53JytGZ7vtRhXAZPweGPLJ7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zf6igQH5RfRjPL1LLNRp2u8iNNy6O+kF/bGYFX3Nrh8fUdglTmP/qjkVHeDHFuQNr
	 jn2Uh6KySMX6f0GTo02MvlJp6Rv68cW/69I/MFZtSdKzOt0NBFweVHnVybdzHgWXfl
	 KvtLJ4ESmigmI/uc0oNYGCIO7NHmoF2IrKkybPAl+gdBXFQ0P23XDeYWK4z9h15oKv
	 ZKGiTpWdZVp/QxM4gHnWF1LN14ykgAc8/vUL3ndVfxx63Am/uu3wKbhKbUkF+Bi6Ox
	 4oM/zbXXCqLIwER2tnq6O7dDS4+mh/aE4qybCY5QC5PMes/KnyWH9l0FxBIq6F8Dg4
	 8wj5ZhMvd7MFQ==
Date: Thu, 8 Jun 2023 21:41:16 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
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
Subject: Re: [PATCH 00/13] mm: jit/text allocator
Message-ID: <20230608184116.GJ52412@kernel.org>
References: <20230601101257.530867-1-rppt@kernel.org>
 <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan>
 <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
 <20230605092040.GB3460@kernel.org>
 <ZH20XkD74prrdN4u@FVFF77S0Q05N>
 <CAPhsuW7ntn_HpVWdGK_hYVd3zsPEFToBNfmtt0m6K8SwfxJ66Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW7ntn_HpVWdGK_hYVd3zsPEFToBNfmtt0m6K8SwfxJ66Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_114152_558920_67A1CE0D 
X-CRM114-Status: GOOD (  32.34  )
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

T24gVHVlLCBKdW4gMDYsIDIwMjMgYXQgMTE6MjE6NTlBTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6
Cj4gT24gTW9uLCBKdW4gNSwgMjAyMyBhdCAzOjA54oCvQU0gTWFyayBSdXRsYW5kIDxtYXJrLnJ1
dGxhbmRAYXJtLmNvbT4gd3JvdGU6Cj4gCj4gWy4uLl0KPiAKPiA+ID4gPiA+IENhbiB5b3UgZ2l2
ZSBtb3JlIGRldGFpbCBvbiB3aGF0IHBhcmFtZXRlcnMgeW91IG5lZWQ/IElmIHRoZSBvbmx5IGV4
dHJhCj4gPiA+ID4gPiBwYXJhbWV0ZXIgaXMganVzdCAiZG9lcyB0aGlzIGFsbG9jYXRpb24gbmVl
ZCB0byBsaXZlIGNsb3NlIHRvIGtlcm5lbAo+ID4gPiA+ID4gdGV4dCIsIHRoYXQncyBub3QgdGhh
dCBiaWcgb2YgYSBkZWFsLgo+ID4gPiA+Cj4gPiA+ID4gTXkgdGhpbmtpbmcgd2FzIHRoYXQgd2Ug
YXQgbGVhc3QgbmVlZCB0aGUgc3RhcnQgKyBlbmQgZm9yIGVhY2ggY2FsbGVyLiBUaGF0Cj4gPiA+
ID4gbWlnaHQgYmUgaXQsIHRiaC4KPiA+ID4KPiA+ID4gRG8geW91IG1lYW4gdGhhdCBtb2R1bGVz
IHdpbGwgaGF2ZSBzb21ldGhpbmcgbGlrZQo+ID4gPgo+ID4gPiAgICAgICBqaXRfdGV4dF9hbGxv
YyhzaXplLCBNT0RVTEVTX1NUQVJULCBNT0RVTEVTX0VORCk7Cj4gPiA+Cj4gPiA+IGFuZCBrcHJv
YmVzIHdpbGwgaGF2ZQo+ID4gPgo+ID4gPiAgICAgICBqaXRfdGV4dF9hbGxvYyhzaXplLCBLUFJP
QkVTX1NUQVJULCBLUFJPQkVTX0VORCk7Cj4gPiA+ID8KPiA+Cj4gPiBZZXMuCj4gCj4gSG93IGFi
b3V0IHdlIHN0YXJ0IHdpdGggdHdvIEFQSXM6Cj4gICAgICBqaXRfdGV4dF9hbGxvYyhzaXplKTsK
PiAgICAgIGppdF90ZXh0X2FsbG9jX3JhbmdlKHNpemUsIHN0YXJ0LCBlbmQpOwo+IAo+IEFGQUlD
VCwgYXJtNjQgaXMgdGhlIG9ubHkgYXJjaCB0aGF0IHJlcXVpcmVzIHRoZSBsYXR0ZXIgQVBJLiBB
bmQgVEJILCBJIGFtCj4gbm90IHF1aXRlIGNvbnZpbmNlZCBpdCBpcyBuZWVkZWQuCiAKUmlnaHQg
bm93IGFybTY0IGFuZCByaXNjdiBvdmVycmlkZSBicGYgYW5kIGtwcm9iZXMgYWxsb2NhdGlvbnMg
dG8gdXNlIHRoZQplbnRpcmUgdm1hbGxvYyBhZGRyZXNzIHNwYWNlLCBidXQgaGF2aW5nIHRoZSBh
YmlsaXR5IHRvIGFsbG9jYXRlIGdlbmVyYXRlZApjb2RlIG91dHNpZGUgb2YgbW9kdWxlcyBhcmVh
IG1heSBiZSB1c2VmdWwgZm9yIG90aGVyIGFyY2hpdGVjdHVyZXMuCgpTdGlsbCB0aGUgc3RhcnQg
KyBlbmQgZm9yIHRoZSBjYWxsZXJzIGZlZWxzIGJhY2t3YXJkcyB0byBtZSBiZWNhdXNlIHRoZQpj
YWxsZXJzIGRvIG5vdCBkZWZpbmUgdGhlIHJhbmdlcywgYnV0IHJhdGhlciB0aGUgYXJjaGl0ZWN0
dXJlcywgc28gd2Ugc3RpbGwKbmVlZCBhIHdheSBmb3IgYXJjaGl0ZWN0dXJlcyB0byBkZWZpbmUg
aG93IHRoZXkgd2FudCBhbGxvY2F0ZSBtZW1vcnkgZm9yCnRoZSBnZW5lcmF0ZWQgY29kZS4KCj4g
PiA+IEl0IHNpbGwgY2FuIGJlIGFjaGlldmVkIHdpdGggYSBzaW5nbGUgaml0X2FsbG9jX2FyY2hf
cGFyYW1zKCksIGp1c3QgYnkKPiA+ID4gYWRkaW5nIGVudW0gaml0X3R5cGUgcGFyYW1ldGVyIHRv
IGppdF90ZXh0X2FsbG9jKCkuCj4gPgo+ID4gVGhhdCBmZWVscyBiYWNrd2FyZHMgdG8gbWU7IGl0
IGNlbnRyYWxpemVzIGEgYnVuY2ggb2YgaW5mb3JtYXRpb24gYWJvdXQKPiA+IGRpc3RpbmN0IHVz
ZXJzIHRvIGJlIGFibGUgdG8gc2hvdmUgdGhhdCBpbnRvIGEgc3RhdGljIGFycmF5LCB3aGVuIHRo
ZSBjYWxsc2l0ZXMKPiA+IGNhbiBwYXNzIHRoYXQgaW5mb3JtYXRpb24uCj4gCj4gSSB0aGluayB3
ZSBvbmx5IHR3byB0eXBlIG9mIHVzZXJzOiBtb2R1bGUgYW5kIGV2ZXJ5dGhpbmcgZWxzZSAoZnRy
YWNlLCBrcHJvYmUsCj4gYnBmIHN0dWZmKS4gVGhlIGtleSBkaWZmZXJlbmNlcyBhcmU6Cj4gCj4g
ICAxLiBtb2R1bGUgdXNlcyB0ZXh0IGFuZCBkYXRhOyB3aGlsZSBldmVyeXRoaW5nIGVsc2Ugb25s
eSB1c2VzIHRleHQuCj4gICAyLiBtb2R1bGUgY29kZSBpcyBnZW5lcmF0ZWQgYnkgdGhlIGNvbXBp
bGVyLCBhbmQgdGh1cyBoYXMgc3Ryb25nZXIKPiAgIHJlcXVpcmVtZW50cyBpbiBhZGRyZXNzIHJh
bmdlczsgZXZlcnl0aGluZyBlbHNlIGFyZSBnZW5lcmF0ZWQgdmlhIHNvbWUKPiAgIEpJVCBvciBt
YW51YWwgd3JpdHRlbiBhc3NlbWJseSwgc28gdGhleSBhcmUgbW9yZSBmbGV4aWJsZSB3aXRoIGFk
ZHJlc3MKPiAgIHJhbmdlcyAoaW4gSklULCB3ZSBjYW4gYXZvaWQgdXNpbmcgaW5zdHJ1Y3Rpb25z
IHRoYXQgcmVxdWlyZXMgYSBzcGVjaWZpYwo+ICAgYWRkcmVzcyByYW5nZSkuCj4gCj4gVGhlIG5l
eHQgcXVlc3Rpb24gaXMsIGNhbiB3ZSBoYXZlIHRoZSB0d28gdHlwZXMgb2YgdXNlcnMgc2hhcmUg
dGhlIHNhbWUKPiBhZGRyZXNzIHJhbmdlcz8gSWYgbm90LCB3ZSBjYW4gcmVzZXJ2ZSB0aGUgcHJl
ZmVycmVkIHJhbmdlIGZvciBtb2R1bGVzLAo+IGFuZCBsZXQgZXZlcnl0aGluZyBlbHNlIHVzZSB0
aGUgb3RoZXIgcmFuZ2UuIEkgZG9uJ3Qgc2VlIHJlYXNvbnMgdG8gZnVydGhlcgo+IHNlcGFyYXRl
IHVzZXJzIGluIHRoZSAiZXZlcnl0aGluZyBlbHNlIiBncm91cC4KIApJIGFncmVlIHRoYXQgd2Ug
Y2FuIGRlZmluZSBvbmx5IHR3byB0eXBlczogbW9kdWxlcyBhbmQgZXZlcnl0aGluZyBlbHNlIGFu
ZApsZXQgdGhlIGFyY2hpdGVjdHVyZXMgZGVmaW5lIGlmIHRoZXkgbmVlZCBkaWZmZXJlbnQgcmFu
Z2VzIGZvciB0aGVzZSB0d28KdHlwZXMsIG9yIHdhbnQgdGhlIHNhbWUgcmFuZ2UgZm9yIGV2ZXJ5
dGhpbmcuCgpXaXRoIG9ubHkgdHdvIHR5cGVzIHdlIGNhbiBoYXZlIHR3byBBUEkgY2FsbHMgZm9y
IGFsbG9jLCBhbmQgYSBzaW5nbGUKc3RydWN0dXJlIHRoYXQgZGVmaW5lcyB0aGUgcmFuZ2VzIGV0
YyBmcm9tIHRoZSBhcmNoaXRlY3R1cmUgc2lkZSByYXRoZXIKdGhhbiBzcHJlYWQgYWxsIG92ZXIu
CgpMaWtlIHNvbWV0aGluZyBhbG9uZyB0aGVzZSBsaW5lczoKCglzdHJ1Y3QgZXhlY21lbV9yYW5n
ZSB7CgkJdW5zaWduZWQgbG9uZyAgIHN0YXJ0OwoJCXVuc2lnbmVkIGxvbmcgICBlbmQ7CgkJdW5z
aWduZWQgbG9uZyAgIGZhbGxiYWNrX3N0YXJ0OwoJCXVuc2lnbmVkIGxvbmcgICBmYWxsYmFja19l
bmQ7CgkJcGdwcm90X3QgICAgICAgIHBncHJvdDsKCQl1bnNpZ25lZCBpbnQJYWxpZ25tZW50OwoJ
fTsKCglzdHJ1Y3QgZXhlY21lbV9tb2R1bGVzX3JhbmdlIHsKCQllbnVtIGV4ZWNtZW1fbW9kdWxl
X2ZsYWdzIGZsYWdzOwoJCXN0cnVjdCBleGVjbWVtX3JhbmdlIHRleHQ7CgkJc3RydWN0IGV4ZWNt
ZW1fcmFuZ2UgZGF0YTsKCX07CgoJc3RydWN0IGV4ZWNtZW1faml0X3JhbmdlIHsKCQlzdHJ1Y3Qg
ZXhlY21lbV9yYW5nZSB0ZXh0OwoJfTsKCglzdHJ1Y3QgZXhlY21lbV9wYXJhbXMgewoJCXN0cnVj
dCBleGVjbWVtX21vZHVsZXNfcmFuZ2UJbW9kdWxlczsKCQlzdHJ1Y3QgZXhlY21lbV9qaXRfcmFu
Z2UJaml0OwoJfTsKCglzdHJ1Y3QgZXhlY21lbV9wYXJhbXMgKmV4ZWNtZW1fYXJjaF9wYXJhbXMo
dm9pZCk7CgoJdm9pZCAqZXhlY21lbV90ZXh0X2FsbG9jKHNpemVfdCBzaXplKTsKCXZvaWQgKmV4
ZWNtZW1fZGF0YV9hbGxvYyhzaXplX3Qgc2l6ZSk7Cgl2b2lkIGV4ZWNtZW1fZnJlZSh2b2lkICpw
dHIpOwoKCXZvaWQgKmppdF90ZXh0X2FsbG9jKHNpemVfdCBzaXplKTsKCXZvaWQgaml0X2ZyZWUo
dm9pZCAqcHRyKTsKCk1vZHVsZXMgb3IgYW55dGhpbmcgdGhhdCBtdXN0IGxpdmUgY2xvc2UgdG8g
dGhlIGtlcm5lbCBpbWFnZSBjYW4gdXNlCmV4ZWNtZW1fKl9hbGxvYygpIGFuZCB0aGUgY2FsbGVy
cyB0aGF0IGRvbid0IGdlbmVyYWxseSBjYXJlIGFib3V0IHJlbGF0aXZlCmFkZHJlc3Npbmcgd2ls
bCB1c2Ugaml0X3RleHRfYWxsb2MoKSwgcHJlc3VtaW5nIHRoYXQgYXJjaCB3aWxsIHJlc3RyaWN0
IGppdApyYW5nZSBpZiBuZWNlc3NhcnksIGxpa2UgZS5nLiBiZWxvdyBmb3IgYXJtNjQgaml0IGNh
biBiZSBhbnl3aGVyZSBpbgp2bWFsbG9jIGFuZCBmb3IgeDg2IGFuZCBzMzkwIGl0IHdpbGwgc2hh
cmUgdGhlIG1vZHVsZXMgcmFuZ2UuIAoKCglzdHJ1Y3QgZXhlY21lbV9wYXJhbXMgYXJtNjRfZXhl
Y21lbSA9IHsKCQkubW9kdWxlcyA9IHsKCQkJLmZsYWdzID0gS0FTQU4sCgkJCS50ZXh0ID0gewoJ
CQkJLnN0YXJ0ID0gTU9EVUxFU19WQUREUiwKCQkJCS5lbmQgPSBNT0RVTEVTX0VORCwKCQkJCS5w
Z3Byb3QgPSBQQUdFX0tFUk5FTF9ST1gsCgkJCQkuZmFsbGJhY2tfc3RhcnQgPSBWTUFMTE9DX1NU
QVJULAoJCQkJLmZhbGxiYWNrX3N0YXJ0ID0gVk1BTExPQ19FTkQsCgkJCX0sCgkJfSwKCQkuaml0
ID0gewoJCQkudGV4dCA9IHsKCQkJCS5zdGFydCA9IFZNQUxMT0NfU1RBUlQsCgkJCQkuZW5kID0g
Vk1BTExPQ19FTkQsCgkJCQkucGdwcm90ID0gUEFHRV9LRVJORUxfUk9YLAoJCQl9LAoJCX0sCgl9
OwoKCS8qIHg4NiBhbmQgczM5MCAqLwoJc3RydWN0IGV4ZWNtZW1fcGFyYW1zIGNpc2NfZXhlY21l
bSA9IHsKCQkubW9kdWxlcyA9IHsKCQkJLmZsYWdzID0gS0FTQU4sCgkJCS50ZXh0ID0gewoJCQkJ
LnN0YXJ0ID0gTU9EVUxFU19WQUREUiwKCQkJCS5lbmQgPSBNT0RVTEVTX0VORCwKCQkJCS5wZ3By
b3QgPSBQQUdFX0tFUk5FTF9ST1gsCgkJCX0sCgkJfSwKCQkuaml0X3JhbmdlID0ge30sCS8qIGlt
cHBsaWVzIHJldXNpbmcgLm1vZHVsZXMgKi8KCX07CgoJc3RydWN0IGV4ZWNtZW1fcGFyYW1zIGRl
ZmF1bHRfZXhlY21lbSA9IHsKCQkubW9kdWxlcyA9IHsKCQkJLmZsYWdzID0gS0FTQU4sCgkJCS50
ZXh0ID0gewoJCQkJLnN0YXJ0ID0gVk1BTExPQ19TVEFSVCwKCQkJCS5lbmQgPSBWTUFMTE9DX0VO
RCwKCQkJCS5wZ3Byb3QgPSBQQUdFX0tFUk5FTF9FWEVDLAoJCQl9LAoJCX0sCgl9OwoKLS0gClNp
bmNlcmVseSB5b3VycywKTWlrZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
