Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4998BC04E69
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 14:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MzOxp1drDyh123W1JpeUmCb/k2+bLKIpNibe6O7agoo=; b=A1gU7GvYC/SvaF
	JFp+WgILmX2A38aL3ZJ7/CBmZCycUocywvX1pMjLi5MLey0wccmi7U3gSD/clXHKPXok4mTBdF4Tg
	6oa1G8SBaSjBCJSZMjY5lNLEJye0sz69hS6Mge8iazDktBJr20VAK/zh1ybhXyiNz1CgvA7e01p5a
	ojAJaOIlquPyXXBHZo6vPvn12DGMDmnbuSR1mAh8q4vcfyGNzDc6j175P0g7Z1dUgk2OYz1lIRsVy
	Af976L/vukZhgwX0Q93fI7K+hUbWopJGnTyu/holAUP7W1N7GOILhZ/dyPCIDhFtrY9KbYZczaSFi
	jYtGCppr4sczrlNomN5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVYHZ-00HFCK-1h;
	Mon, 14 Aug 2023 14:10:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVYHX-00HFBp-0J
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 14:10:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8A8B161493;
	Mon, 14 Aug 2023 14:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D20C433C7;
	Mon, 14 Aug 2023 14:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692022254;
	bh=wIRU+TKzPDX43UA4ILBFZUuV1O5dayyLhaNRehSdSh4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ijde4UN2V3AV/c24wpWM5FOL39Qn01/lNwOuvLp8ohbBcp1tBpLAGyQafEPrMdxaM
	 QgHY7AHFFdwwVt0O+lIHb+biM7vOoZl66UAcllbgPjrUDobrEioI9RtPknBmraXZhU
	 o0jb/TnoAH+I5tYWfshb8xa/klZ6wAYktAwC63q6m6A7FMODQ07ZlLQO7oqPl4/we3
	 8NI5uALn3hGTr7rmgdiBtmiF8SAwWFpGz8nJThXHvIHVsfAYiUfTWd2bPdgRi0JSs2
	 smYo2Y6+UcPLyIiTno2f5M/ulsBvlgx5XzQO3zQVozn5n/eyUn/39iHMFIJkZ1wHh6
	 lTkY0IMQFWadQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Nam Cao <namcaov@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: test code for kprobe
In-Reply-To: <ZNoxGXcK9QOfAfbW@nam-dell>
References: <cover.1690704360.git.namcaov@gmail.com>
 <fc71730b9350026427fe1c2bdbce9b993d8bc6f5.1690704360.git.namcaov@gmail.com>
 <87il9hg65g.fsf@all.your.base.are.belong.to.us>
 <ZNoxGXcK9QOfAfbW@nam-dell>
Date: Mon, 14 Aug 2023 16:10:51 +0200
Message-ID: <87a5utg1ec.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_071055_177833_59DBF3F8 
X-CRM114-Status: GOOD (  13.71  )
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

TmFtIENhbyA8bmFtY2FvdkBnbWFpbC5jb20+IHdyaXRlczoKCj4gT24gTW9uLCBBdWcgMTQsIDIw
MjMgYXQgMDI6Mjg6MTFQTSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gTmFtIENhbyA8
bmFtY2FvdkBnbWFpbC5jb20+IHdyaXRlczoKPj4gCj4+IEEgUklTQy1WIHNwZWNpZmljIGtwcm9i
ZXMgdGVzdCAtLSBtdWNoIHdlbGNvbWUhCj4+IAo+PiBQbGVhc2UgYWRkIGEgcHJvcGVyIGNvbW1p
dCBtZXNzYWdlIGhlcmUuCj4+IAo+PiA+IC0tLQo+PiA+ICBkcml2ZXJzL3Rlc3Rfa3Byb2JlL01h
a2VmaWxlICAgICAgfCAgIDMgKwo+PiA+ICBkcml2ZXJzL3Rlc3Rfa3Byb2JlL3Rlc3Rfa3Byb2Jl
LmMgfCAyNjUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgMjY4IGluc2VydGlvbnMoKykKPj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
dGVzdF9rcHJvYmUvTWFrZWZpbGUKPj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdGVz
dF9rcHJvYmUvdGVzdF9rcHJvYmUuYwo+PiA+Cj4+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGVz
dF9rcHJvYmUvTWFrZWZpbGUgYi9kcml2ZXJzL3Rlc3Rfa3Byb2JlL01ha2VmaWxlCj4+IAo+PiBB
cmNoaXRlY3R1cmUgc3BlY2lmaWMgdGVzdCBjb2RlIHVzdWFsbHkgcmVzaWRlIGluICJhcmNoLyRB
UkNIIgo+PiAoYXJjaC9yaXNjdiksIGFuZCBpcyBwYXJ0IG9mIEtjb25maWcuZGVidWcuCj4+IAo+
PiBIYXZlIGEgbG9vayBhdDoKPj4gKiBncmVwIGZvciBBUk1fS1BST0JFU19URVNUIGluIGFyY2gv
YXJtCj4+ICogZ3JlcCBmb3IgS1BST0JFU19TQU5JVFlfVEVTVCwgYW5kIGluIGFyY2gvcG93ZXJw
YyBncmVwCj4+ICAgdGVzdF9lbXVsYXRlX3N0ZXAKPj4gKiBncmVwIFMzOTBfS1BST0JFU19TQU5J
VFlfVEVTVAo+Cj4gU29ycnkgdGhhdCBJIHdhc24ndCBjbGVhciB3aXRoIHRoaXM6IEkganVzdCB3
YW50ZWQgdG8gc2hvdyBob3cgdGVzdGluZyB3YXMgZG9uZS4KPiBUaGlzIGlzIG5vdCBtZWFudCB0
byBiZSBtZXJnZWQuCj4KPiBJIGRvIGhhdmUgcGxhbnMgdG8gY2xlYW4gdGhpcyB1cCBhbmQgc2Vu
ZCB1cHN0cmVhbSBpbiB0aGUgZnV0dXJlLCBidXQgbm90IHdpdGgKPiB0aGlzIHBhdGNoIHNlcmll
cy4KClBsZWFzZSBkbyEgQSBSSVNDLVYgc3BlY2lmaWMga3Byb2JlcyB0ZXN0IHdvdWxkIGJlIG5p
Y2UuCgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
