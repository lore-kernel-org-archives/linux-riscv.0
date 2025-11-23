Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F80CCFA46B
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Nov 2025 19:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:Cc:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjXDB6yF6tySvys8tJ1oG+L1g17KIEGp/WWjolUA2Lk=; b=U+FUYb1w1kkWAd
	QMKDcpLTQ2uP7WRyJ+6R+P0+nStEhnttLUYy0Rt9+y4R2jVcZV/6l9x3KMtD/O/cOCBDyIAWDf8IT
	GrTygm77XU/KfSazBj7i/XBCLk0MTcXcePoUzKXnl1Scnd6rsCQ6AwOdFtE30tTfciV47pnim9lPj
	TSRT5yx8B58C9gog8heuTvx4fuwO60nBvc6j/zg4SncfZ7Kb2oonnTToJUyMkJi6N8cLkVgTNZmw9
	XBcdSGNI56Eja6BsfYQMaseS15dYfKRHWxCrBiBL0jmh5jXq5d+NBai3N9SwcF0fMlPmUt5HnUgUE
	iPeCC2YdL4fahEflWPfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNFZj-0000000Adny-36lc;
	Sun, 23 Nov 2025 19:16:43 +0000
Received: from exactco.de ([176.9.10.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNFZh-0000000Adna-07Nx
	for linux-riscv@lists.infradead.org;
	Sun, 23 Nov 2025 19:16:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
	In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=8cfzktMbCGODeLJgi02gnnc1YATBfFPCaWrjrPkTVVA=; b=pLWSZmcLVml269kYmBe6L81TvY
	Et4waFvtkCUBTh2KBKnqsQZKxtFwL3z6e2kHDJ7rG2xU5EgajIjzGI+/YHy3lFC+zPYRD0SmH7M0U
	+pjeMxnuGWWITwA7KDKi6JiHRT3AOpI4LAAo+lKojhZ6yAru+MlrqMKTynq2JtNuJuzxsB8CavRv6
	m2g/TCXyHm7NmH2jFguw9hn6PEjIk/oJOfAYPJJV5kMAwQD2++KmglKvCvwGAqTwnFuWKuHokMLD/
	aOxD6ctaQkoNvwEVHvX8iiyT9FVIA7ygosBDe99XKnqpgvxQWNN5vPi2ExuWZADz5ZSm4CYxB5YEC
	MdebBHpw==;
Date: Sun, 23 Nov 2025 20:16:52 +0100 (CET)
Message-Id: <20251123.201652.423330903509523481.rene@exactco.de>
To: conor@kernel.org
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com
Subject: Re: [PATCH] riscv: dts: sifive: unmatched: Add PWM controlled fans
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
In-Reply-To: <20251123-widow-prowler-9cedafa7bf3d@spud>
References: <20251122.131940.192031134976081316.rene@exactco.de>
	<20251123-widow-prowler-9cedafa7bf3d@spud>
X-Mailer: Mew version 6.10 on Emacs 30.2
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_111641_370743_30FF217C 
X-CRM114-Status: GOOD (  11.59  )
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

SGksCgpPbiBTdW4sIDIzIE5vdiAyMDI1IDE5OjAwOjIxICswMDAwLCBDb25vciBEb29sZXkgPGNv
bm9yQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiA+IC0tLQo+ID4gVGVzdGVkIG9uIFNpRml2ZSBIaUZp
dmUgVW5tYXRjaGVkIEEwMCBydW5uaW5nIFQyL0xpbnV4Lgo+IAo+IFdhcyB0aGlzIGdlbmVyYXRl
ZCBvbiB0b3Agb2YgYSB0cmVlIHRoYXQgaW5jbHVkZXMgN2RiYzQ0MzJlYTZiICgicHdtOgo+IHNp
Zml2ZTogRml4IFBXTSBhbGdvcml0aG0gYW5kIGNsYXJpZnkgaW52ZXJ0ZWQgY29tcGFyZSBiZWhh
dmlvciIpPwo+IFRoYXQnZCBiZSA2LjE3LXJjMSBvciBsYXRlci4KClllcywgbGludXMnIDYuMTgt
cmMuLi4gdGlwCgo+IElmIG5vdCwgdGhlIHBvbGFyaXR5IG9mIHRoZSBwd21zIHdpbGwgbmVlZCB0
byBiZSBzd2l0Y2hlZCBiZWNhdXNlIHRoZQo+IG9yaWdpbmFsIGRyaXZlciBhdXRob3IgaW50ZW50
aW9uYWxseSBnb3QgaXQgd3JvbmcgYW5kIHNvIDYuMTctcmMxIGFuZAo+IGxhdGVyIGhhdmUgdGhl
IGNvcnJlY3QgcG9sYXJpdHkuLi4KCkluZGVlZCwgSSB3b25kZXJlZCBhYm91dCB0aGlzIGFuZCBq
dXN0IGludmVydGVkIGl0IHllc3RlcmRheSB0bwp1cHN0cmVhbS4gIEkgaGFkIHRoaXMgcHdtIGZh
bnMgcGF0Y2hlZCBmb3IgYSB5ZWFyIGFscmVhZHkgYW5kIGxpa2V3aXNlCmludmVydGVkIHRoZW0g
YmVmb3JlLgoKVGhhbmtzIQoKCVJlbsOpCgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9ib290L2R0
cy9zaWZpdmUvaGlmaXZlLXVubWF0Y2hlZC1hMDAuZHRzIHwgMTAgKysrKysrKysrKwo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMKPiA+IGluZGV4IDAz
Y2UyY2VlNGU5Ny4uODUwZmExZDI1YmU3IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290
L2R0cy9zaWZpdmUvaGlmaXZlLXVubWF0Y2hlZC1hMDAuZHRzCj4gPiArKysgYi9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMKPiA+IEBAIC00Nyw2ICs0
NywxNiBAQCBncGlvLXBvd2Vyb2ZmIHsKPiA+ICAJCWdwaW9zID0gPCZncGlvIDIgR1BJT19BQ1RJ
VkVfTE9XPjsKLS0gClJlbsOpIFJlYmUsIEV4YWN0Q09ERSBHbWJILCBCZXJsaW4sIEdlcm1hbnkK
aHR0cHM6Ly9leGFjdGNvLmRlIOKAoiBodHRwczovL3QybGludXguY29tIOKAoiBodHRwczovL3Bh
dHJlb24uY29tL3JlbmVyZWJlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
