Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B80C531D0
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 16:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nc17IzCzycBbnFYHT67IG7lZ/5yH9Du8IiHMR4LPdSc=; b=t6t8KW/AZ8GHPR
	RlpyyRkaVuAIS7mx0eCHdhu50sZgawwZnyok1GYVt38n6K1UnUFISvhekX9PabdHUqVSc6G1e64Wi
	oE7m17DxcxOlSJz07KDsMgqne9UaUCBE+gPq6DXIEx1RgA8QePSpXIie9OOF/xkmN24stjtjpdTu5
	BN3pORjhziMdV8T3dBzeHEDENFU265wa6PSqAn32GJumEQMN4ujKODIgTnRxYhLHxyRq+WAjmAJLx
	SqIPn8++TW7zAxhk8xb38xGcavPDQ7jz0GotOQapuansmZ3gGfosuD1HEMWwLClvyBSs6SPrM19xS
	9AFRPtCW5BuU611A4RDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnf0D-00000000W0d-3fMw;
	Sat, 25 Jul 2026 16:13:29 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnf09-00000000W0F-3pDX
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 16:13:28 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id E7E86C289F;
	Sat, 25 Jul 2026 19:13:21 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro E7E86C289F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1784996003;
	bh=YI32JWrMTg8CystnwVwPIZbj+64IR2ZStKiHxrt8NMk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=hOU8HOw48svZKptUQRFuMvQJ0atEuRvEQEBVEhjdV4kHqq7HWn05uv6Gi4yNYKCC6
	 8o2Sv9+zu5uxdI3E+M/GRxj1oo15iW/kpRSurmGoLuTaoOtW4OO2PTNxdzFCpbZEGI
	 E61lCiyX715tyqEg1Iht7msBmaU/nTqZ27lnmKIIlXId5rwPZtW+LPm3Z619z9NE5H
	 N/yKz9o/ewdh8gf+QB44uCD7PtmDpr/8ABG/zJC4hky5i9xNzXntIqyLWDSU7ABfn2
	 jToMNLcZvVku5mviq1KZUehJbr6Y78HJUlmQz++iO4KtbDAmXWzc9QILwisyiS5NYm
	 wLOr0U8gMdStw==
Message-ID: <7a124c80a48d2ada6ad21c1ac27e9fd888ae1a56.camel@rendec.net>
Subject: Re: [PATCH 01/16] irqchip/riscv-imsic: fix MMIO lookup OOB and NULL
 cleanup
From: Radu Rendec <radu@rendec.net>
To: Haofeng Li <lihaofeng@kylinos.cn>, tglx@kernel.org
Cc: linux-kernel@vger.kernel.org, Haofeng Li <13266079573@163.com>, Anup
 Patel	 <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti	 <alex@ghiti.fr>, =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?=
 <bjorn@rivosinc.com>, 	linux-riscv@lists.infradead.org
Date: Sat, 25 Jul 2026 12:13:20 -0400
In-Reply-To: <20260714122351.3274006-2-lihaofeng@kylinos.cn>
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
	 <20260714122351.3274006-2-lihaofeng@kylinos.cn>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_091326_398430_BDF4609F 
X-CRM114-Status: GOOD (  14.08  )
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

T24gVHVlLCAyMDI2LTA3LTE0IGF0IDIwOjIzICswODAwLCBIYW9mZW5nIExpIHdyb3RlOgo+IFRo
ZSBNU0kgcGFnZSBsb29rdXAgbG9vcCB1c2VzOgo+IAo+IAlmb3IgKGogPSAwOyBucl9tbWlvczsg
aisrKQo+IAo+IFdoZW4gbnJfbW1pb3MgaXMgbm9uLXplcm8gdGhlIGNvbmRpdGlvbiBpcyBhbHdh
eXMgdHJ1ZSwgc28gaiBpcyBuZXZlcgo+IGJvdW5kZWQuIElmIHJlbG9mZiBkb2VzIG5vdCBmYWxs
IGluIGFueSBNTUlPIHJlZ2lvbiB0aGUgbG9vcCBpbmRleGVzCj4gcGFzdCBtbWlvc1tdIGFuZCBt
YXkgaGFuZyBvciBmYXVsdC4KPiAKPiBBbHNvLCBtbWlvc192YSBzdGFydHMgYXMgTlVMTC4gSWYg
aXRzIGFsbG9jYXRpb24gZmFpbHMsIHRoZSBvdXRfaW91bm1hcAo+IHBhdGggaW5kZXhlcyBtbWlv
c192YVtpXSBhbmQgTlVMTC1kZXJlZmVyZW5jZXMuCj4gCj4gQm91bmQgdGhlIGxvb3Agd2l0aCBq
IDwgbnJfbW1pb3MsIGFuZCBndWFyZCB0aGUgaW91bm1hcC9rZnJlZSBjbGVhbnVwCj4gd2l0aCBp
ZiAobW1pb3NfdmEpLgo+IAo+IEZpeGVzOiAyMWE4ZjhhMGViMzUgKCJpcnFjaGlwOiBBZGQgUklT
Qy1WIGluY29taW5nIE1TSSBjb250cm9sbGVyIGVhcmx5IGRyaXZlciIpCj4gU2lnbmVkLW9mZi1i
eTogSGFvZmVuZyBMaSA8bGloYW9mZW5nQGt5bGlub3MuY24+Cj4gLS0tCj4gwqBkcml2ZXJzL2ly
cWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMgfCAxMiArKysrKysrLS0tLS0KPiDCoDEgZmls
ZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYyBiL2RyaXZlcnMvaXJx
Y2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYwo+IGluZGV4IGI4ZDFiYmJmNDJmNy4uMTlmNzRj
Zjc5OTg4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3Rh
dGUuYwo+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYwo+IEBA
IC04OTYsNyArODk2LDcgQEAgaW50IF9faW5pdCBpbXNpY19zZXR1cF9zdGF0ZShzdHJ1Y3QgZndu
b2RlX2hhbmRsZSAqZndub2RlLCB2b2lkICpvcGFxdWUpCj4gwqAJCWluZGV4ID0gbnJfbW1pb3M7
Cj4gwqAJCXJlbG9mZiA9IGkgKiBCSVQoZ2xvYmFsLT5ndWVzdF9pbmRleF9iaXRzKSAqCj4gwqAJ
CQkgSU1TSUNfTU1JT19QQUdFX1NaOwo+IC0JCWZvciAoaiA9IDA7IG5yX21taW9zOyBqKyspIHsK
PiArCQlmb3IgKGogPSAwOyBqIDwgbnJfbW1pb3M7IGorKykgewo+IMKgCQkJaWYgKHJlbG9mZiA8
IHJlc291cmNlX3NpemUoJm1taW9zW2pdKSkgewo+IMKgCQkJCWluZGV4ID0gajsKPiDCoAkJCQli
cmVhazsKPiBAQCAtOTUzLDExICs5NTMsMTMgQEAgaW50IF9faW5pdCBpbXNpY19zZXR1cF9zdGF0
ZShzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLCB2b2lkICpvcGFxdWUpCj4gwqBvdXRfbG9j
YWxfY2xlYW51cDoKPiDCoAlpbXNpY19sb2NhbF9jbGVhbnVwKCk7Cj4gwqBvdXRfaW91bm1hcDoK
PiAtCWZvciAoaSA9IDA7IGkgPCBucl9tbWlvczsgaSsrKSB7Cj4gLQkJaWYgKG1taW9zX3ZhW2ld
KQo+IC0JCQlpb3VubWFwKG1taW9zX3ZhW2ldKTsKPiArCWlmIChtbWlvc192YSkgewo+ICsJCWZv
ciAoaSA9IDA7IGkgPCBucl9tbWlvczsgaSsrKSB7Cj4gKwkJCWlmIChtbWlvc192YVtpXSkKPiAr
CQkJCWlvdW5tYXAobW1pb3NfdmFbaV0pOwo+ICsJCX0KPiArCQlrZnJlZShtbWlvc192YSk7Cj4g
wqAJfQo+IC0Ja2ZyZWUobW1pb3NfdmEpOwo+IMKgCWtmcmVlKG1taW9zKTsKPiDCoG91dF9mcmVl
X2xvY2FsOgo+IMKgCWZyZWVfcGVyY3B1KGltc2ljLT5nbG9iYWwubG9jYWwpOwoKUmV2aWV3ZWQt
Ynk6IFJhZHUgUmVuZGVjIDxyYWR1QHJlbmRlYy5uZXQ+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
