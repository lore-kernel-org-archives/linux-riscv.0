Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A3FC3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 06:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rQoSScuK4tc59ULXGNS/49vl9PeMernEsBueudTjBsE=; b=gB52en3mwthCSK
	39dQg9sONB+N6ECjfWE67gJzEutOVuMvWSG8VRV2VPGl4QsvfYFoCr4bzjbmnq7AU/a+pIO6c089N
	pCP9jXuIOgMXnuX8ri49hFYMrj/Je1iiszcM6OFsoSvdRy1OO24EyJOdrrtEXG6xWDptaArgQgS7k
	Y8gyK4GoxjqoU1mAbu/gOHh8bA8t9xHd/x8kuZd6Ap9BGo4diCcYU5MIiBTA01Zr6boFluNDndlkD
	MmVamFUxkP5HJwQk2gp/aL3qAhjboxkvy8GPLi6hzkDV6r/lye8MEEHj8Uw0xme9aOpXv5PaGjHhJ
	cU0elsSQeC7J/0S2RlzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCb36-00HDgi-Fg; Tue, 03 Jan 2023 06:45:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCb2c-00HDOI-3R
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 06:44:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 92566611AD;
	Tue,  3 Jan 2023 06:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85993C433D2;
	Tue,  3 Jan 2023 06:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672728292;
	bh=/5lMFYxeFk4tjVM5Sh1D4dpCcs4gKL4U7mbXKFl9Uh8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XZ/vpsOESYRh8ZWz0uxpiUANHiIBRN71wk6PU5xY4tprr93vWqFQlUKy3GQS9ryA3
	 aN4b16a9Lo9jjGmWnl9abxUjVJzve6Rhy0a45zfdoNuJCbxvYlKH6y/8vHnTbxAHsG
	 286P8RV389ST+mFodfka7ZfNAgIko5hR6IOYE8SJRaEX/AYDFK16fXbihXO3oj/sWN
	 XvrU0EZqstjhw9egLIFzD8Wk43BXu2c3K44OvFkA7M/nQmekRyw9Y1nwnkTxGl3xKv
	 TBoMcEFYbWc62ULPdu4TWxAJ7fZl81ZX4jkP2yEKOCbbQg28N2v6p7OHSCw6j6Ckse
	 YlB7iYDZnikvg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv, kprobes: Stricter c.jr/c.jalr decoding
In-Reply-To: <Y7M/HlcF3u0qWIDJ@spud>
References: <20230102160748.1307289-1-bjorn@kernel.org> <Y7M/HlcF3u0qWIDJ@spud>
Date: Tue, 03 Jan 2023 07:44:49 +0100
Message-ID: <87sfgsp15q.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_224454_281202_BD2123A0 
X-CRM114-Status: GOOD (  19.94  )
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

Q29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cml0ZXM6Cgo+IEhleSBCam9ybiwKPgo+
IE9uIE1vbiwgSmFuIDAyLCAyMDIzIGF0IDA1OjA3OjQ4UE0gKzAxMDAsIEJqw7ZybiBUw7ZwZWwg
d3JvdGU6Cj4+IEZyb206IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPj4gCj4+
IEluIHRoZSBjb21wcmVzc2VkIGluc3RydWN0aW9uIGV4dGVuc2lvbiwgYy5qciwgYy5qYWxyLCBj
Lm12LCBhbmQgYy5hZGQKPj4gaXMgZW5jb2RlZCB0aGUgZm9sbG93aW5nIHdheSAoZWFjaCBpbnN0
cnVjdGlvbiBpcyAxNmIpOgo+PiAKPj4gLS0tKy0rLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0rLS0K
Pj4gMTAwIDAgcnMxWzQ6MF0hPTAgICAgICAgMDAwMDAgMTAgOiBjLmpyCj4+IDEwMCAxIHJzMVs0
OjBdIT0wICAgICAgIDAwMDAwIDEwIDogYy5qYWxyCj4+IDEwMCAwICByZFs0OjBdIT0wIHJzMls0
OjBdIT0wIDEwIDogYy5tdgo+PiAxMDAgMSAgcmRbNDowXSE9MCByczJbNDowXSE9MCAxMCA6IGMu
YWRkCj4+IAo+PiBUaGUgZm9sbG93aW5nIGxvZ2ljIGlzIHVzZWQgdG8gZGVjb2RlIGMuanIgYW5k
IGMuamFscjoKPj4gCj4+ICAgaW5zbiAmIDB4ZjAwNyA9PSAweDgwMDIgPT4gaW5zdHJ1Y3Rpb24g
aXMgYW4gYy5qcgo+PiAgIGluc24gJiAweGYwMDcgPT0gMHg5MDAyID0+IGluc3RydWN0aW9uIGlz
IGFuIGMuamFscgo+PiAKPj4gV2hlbiAweGYwMDcgaXMgdXNlZCB0byBtYXNrIHRoZSBpbnN0cnVj
dGlvbiwgYy5tdiBjYW4gYmUgaW5jb3JyZWN0bHkKPj4gZGVjb2RlZCBhcyBjLmpyLCBhbmQgYy5h
ZGQgYXMgYy5qYWxyLgo+PiAKPj4gQ29ycmVjdCB0aGUgZGVjb2RpbmcgYnkgY2hhbmdpbmcgdGhl
IG1hc2sgZnJvbSAweGYwMDcgdG8gMHhmMDdmLgo+PiAKPj4gRml4ZXM6IGMyMmIwYmNiMWRkMCAo
InJpc2N2OiBBZGQga3Byb2JlcyBzdXBwb3J0ZWQiKQo+PiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9rZXJuZWwv
cHJvYmVzL3NpbXVsYXRlLWluc24uaCB8IDQgKystLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC9wcm9iZXMvc2ltdWxhdGUtaW5zbi5oIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVz
L3NpbXVsYXRlLWluc24uaAo+PiBpbmRleCBjYjZmZjdkY2NiOTIuLmRlODQ3NDE0NmE5YiAxMDA2
NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL3NpbXVsYXRlLWluc24uaAo+PiAr
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvc2ltdWxhdGUtaW5zbi5oCj4+IEBAIC0zMSw5
ICszMSw5IEBAIF9fUklTQ1ZfSU5TTl9GVU5DUyhmZW5jZSwJMHg3ZiwgMHgwZik7Cj4+ICAJfSB3
aGlsZSAoMCkKPj4gIAo+PiAgX19SSVNDVl9JTlNOX0ZVTkNTKGNfaiwJCTB4ZTAwMywgMHhhMDAx
KTsKPj4gLV9fUklTQ1ZfSU5TTl9GVU5DUyhjX2pyLAkweGYwMDcsIDB4ODAwMik7Cj4KPiBIbW0s
IEkgd29uZGVyIHdoZXJlIHRoZSBtYXNrIG9yaWdpbmFsbHkgY2FtZSBmcm9tIQoKSSB0aGluayBp
dCdzIGp1c3QgYSBzaW1wbGUgYnVnIC0tIG1pc3NpbmcgdGhhdCAicnMyIiBtdXN0IGJlIHplcm8u
Cgo+IEkgaGFkIGEgbG9vayBhdCB0aGUgY29tcHJlc3NlZCBzcGVjLCBvZiB3aGljaCB0aGUgdmVy
c2lvbiBnb29nbGUgZ2F2ZSB0bwo+IG1lIHdhcyB2MS45IFsxXSwgYW5kIFRhYmxlIDEuNiBpbiB0
aGF0IChJbnN0cnVjdGlvbiBsaXN0aW5nIGZvciBSVkMsCj4gUXVhZHJhbnQgMikgc2VlbXMgdG8g
bGlzdCB0aGVtIGFsbCB0b2dldGhlci4KPiBUZWRpb3VzIGl0IG1heSBiZSwgYnV0IGZ1dHVyZSBp
bnN0cnVjdGlvbiBkZWNvZGluZyBiaXRzIHByb2JhYmx5IG5lZWQKPiBtb3JlIHNjcnV0aW55IGFz
IERyZXcgZm91bmQgYW5vdGhlciBjbGVhcmx5IHdyb25nIGJpdCBhIGZldyB3ZWVrcyBhZ28KPiBb
Ml0uCj4KPiBBbnl3YXlzLCBJIGNoZWNrZWQgYWdhaW5zdCB0aGUgZG9jIGFuZCB0aGUgbmV3IHZl
cnNpb25zIGxvb2sgZ29vZCB0bwo+IG1lLiBIb3cnZCB5b3Ugc3BvdCB0aGlzLCBhbmQgZGlkIHlv
dSBjaGVjayB0aGUgb3RoZXIgbWFza3M/CgpJIGdvdCBoaXQgYnkgaXQgd2hlbiB0ZXN0aW5nIHRo
ZSBvcHRwcm9iZSBzZXJpZXMgKGMubXYgd2FzIHJlamVjdGVkIGFzCmMuanIpLgoKU2tpbW1lZCB0
aGUgb3RoZXIgbWFza3MgcXVpY2tseSwgYnV0IHdpbGwgdGFrZSBhbm90aGVyIGxvb2suCgo+IFJl
dmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Cj4g
WzFdIC0KPiBodHRwczovL3Jpc2N2Lm9yZy93cC1jb250ZW50L3VwbG9hZHMvMjAxNS8xMS9yaXNj
di1jb21wcmVzc2VkLXNwZWMtdjEuOS5wZGYKCkMtZXh0IGlzIHBhcnQgb2YgdGhlIHVucHJpdiBz
cGVjOgpodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtaXNhLW1hbnVhbC9yZWxlYXNlcwoK
PiBbMl0gLSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIyMTIyMzIyMTMz
Mi40MTI3NjAyLTItaGVpa29Ac250ZWNoLmRlLwo+Cj4+ICtfX1JJU0NWX0lOU05fRlVOQ1MoY19q
ciwJMHhmMDdmLCAweDgwMDIpOwo+PiAgX19SSVNDVl9JTlNOX0ZVTkNTKGNfamFsLAkweGUwMDMs
IDB4MjAwMSk7Cj4+IC1fX1JJU0NWX0lOU05fRlVOQ1MoY19qYWxyLAkweGYwMDcsIDB4OTAwMik7
Cj4+ICtfX1JJU0NWX0lOU05fRlVOQ1MoY19qYWxyLAkweGYwN2YsIDB4OTAwMik7Cj4+ICBfX1JJ
U0NWX0lOU05fRlVOQ1MoY19iZXF6LAkweGUwMDMsIDB4YzAwMSk7Cj4+ICBfX1JJU0NWX0lOU05f
RlVOQ1MoY19ibmV6LAkweGUwMDMsIDB4ZTAwMSk7Cj4+ICBfX1JJU0NWX0lOU05fRlVOQ1MoY19l
YnJlYWssCTB4ZmZmZiwgMHg5MDAyKTsKPgo+IFdvcnRoIG5vdGluZyB0aGF0IHRoaXMgY29kZSBp
cyBnb25lIGluIHJpc2N2L2Zvci1uZXh0IHRoYW5rcyB0byBIZWlrbydzCj4gZGUtZHVwbGljYXRp
b246Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMjEyMjMyMjEzMzIu
NDEyNzYwMi03LWhlaWtvQHNudGVjaC5kZS8KCllheSEKCgpCasO2cm4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
