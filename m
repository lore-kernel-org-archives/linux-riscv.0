Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EC2C4829A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 09:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lGt9rYAvzaW5iMj7pL4xGOKek2OeiXj4h5F/elG3TBg=; b=uN05j/QWxA0pMu
	gfukhCPDg3E9qTPAKHPoLwtNWd8B6P3v0zg2kRA7OSiCquWBJWHYxZ72JqeBkW0fC+eCjaNTigymR
	Kkud9mBUAHjlQiBKbQZE4c657JZ3klQ/YZFikfUflwnsdE1VClLfq6it2ELGaCjkMWYc0qJ3Qo+YK
	pb3RqdoxFlR+f+V4kBl+gsYKOBpx4hJ2ZiaWhAE0TERpsO4qnQsmg48vae0+2r1q7QyAVLA4oZyDB
	rAm4b8Lmt00ezLJLRn4tNSLgopGXm4LfGNppoXiQ/RRpULNRpIhuA9PL8lGMBHqxZ5BI2KglnRk0K
	HaOkPJM+qP7s+dZXmaNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXeMf-0000000AD27-0qQJ;
	Wed, 07 Feb 2024 09:37:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXeMb-0000000AD10-43tm;
	Wed, 07 Feb 2024 09:37:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 342CACE1884;
	Wed,  7 Feb 2024 09:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA331C433F1;
	Wed,  7 Feb 2024 09:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707298623;
	bh=aoRH2DoNT3Z90bz2In+tDxMUOuyrpumWFsvVUaOg/ko=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VVfxXSKqvYjuDvHtZM27s+bZk+wuzliRqQ+rtpvOJ9ruL3yzq22IGY/WvFPYcJ+ny
	 7gMKc6INqBfJNjJ67kZ2k54a+9YbxXpUK+VBZIbPOpXl6Hz7Ss+/8W9VLii2bJco7w
	 5TijiDWiUIhZAEX8mlbMVouiABg69OrxyLlKuiIwObAr4KpVSB1ZXuozgsvAj0rs9w
	 NYibP3naf1M+s6Rf33frNPRHS6fpwegJXmEHRJuuNLyIET2i7WjultE0MPVnf20inh
	 aakWrnaJtHxxAmybC6evHWxtbh2ZHjby6jsrSKaVz0V7WdTRLUHjFGsH/2uygalQQO
	 3OcTVQr/ob+Dw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner
 <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc
 Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Atish Patra
 <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andrew Jones
 <ajones@ventanamicro.com>
Subject: Re: [PATCH v12 00/25] Linux RISC-V AIA Support
In-Reply-To: <CAK9=C2XJYTfY4nXWtjK9OP1iXLDXBVF-=mN1SmJDmJ_dO5CohA@mail.gmail.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <87h6ily53k.fsf@all.your.base.are.belong.to.us>
 <CAAhSdy2PPjS6++Edh8NkgiBmcovTUjS5oXE2eR5ZwPfAfVA0ng@mail.gmail.com>
 <874jekag3w.fsf@all.your.base.are.belong.to.us>
 <CAK9=C2XJYTfY4nXWtjK9OP1iXLDXBVF-=mN1SmJDmJ_dO5CohA@mail.gmail.com>
Date: Wed, 07 Feb 2024 10:37:00 +0100
Message-ID: <87plx8y5s3.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_013706_382120_2BCC3333 
X-CRM114-Status: GOOD (  25.36  )
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

QW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKCj4+IE5vcGUuIFNh
bWUgbWVjaGFuaWNzIG9uIHg4NiAtLSB0aGUgY2xlYW51cCBoYXMgdG8gYmUgZG9uZSBvbmUgdGhl
Cj4+IG9yaWdpbmF0aW5nIGNvcmUuIFdoYXQgSSBhc2tlZCB3YXMgIndoYXQgYWJvdXQgdXNpbmcg
YSB0aW1lciBpbnN0ZWFkIG9mCj4+IGFuIElQSSIuIEkgdGhpbmsgdGhpcyB3YXMgdXAgaW4gdGhl
IGxhc3QgcmV2IGFzIHdlbGw/Cj4+Cj4+IENoZWNrIG91dCBjb21taXQgYmRjMWRhZDI5OWJiICgi
eDg2L3ZlY3RvcjogUmVwbGFjZQo+PiBJUlFfTU9WRV9DTEVBTlVQX1ZFQ1RPUiB3aXRoIGEgdGlt
ZXIgY2FsbGJhY2siKSBTcGVjaWZpY2FsbHksIHRoZQo+PiBjb21tZW50IGFib3V0IGxvc3QgaW50
ZXJydXB0cywgYW5kIHRoZSByYXRpb25hbCBmb3Iga2VlcGluZyB0aGUgb3JpZ2luYWwKPj4gdGFy
Z2V0IGFjdGl2ZSB1bnRpbCB0aGVyZSdzIGEgbmV3IGludGVycnVwdCBvbiB0aGUgbmV3IGNwdS4K
Pgo+IFRyeWluZyB0aW1lciBpbnRlcnJ1cHQgaXMgc3RpbGwgVEJEIG9uIG15IHNpZGUgYmVjYXVz
ZSB3aXRoIHYxMgo+IG15IGdvYWwgd2FzIHRvIGltcGxlbWVudCBwZXItZGV2aWNlIE1TSSBkb21h
aW5zLiBMZXQgbWUKPiBleHBsb3JlIHRpbWVyIGludGVycnVwdHMgZm9yIHYxMy4KCk9LIQoKPj4g
Pj4gSSB3b25kZXIgaWYgdGhpcyBjbGVhbiB1cCBpcyBsZXNzIGludHJ1c2l2ZSwgYW5kIHlvdSBq
dXN0IG5lZWQgdG8KPj4gPj4gcGVyZm9ybSB3aGF0J3MgaW4gdGhlIHBlci1saXN0IGluc3RlYWQg
b2YgZGVhbGluZyB3aXRoIHRoZQo+PiA+PiBpZHNfZW5hYmxlZF9iaXRtYXA/IE1heWJlIHdlIGNh
biBldmVuIHJlbW92ZSB0aGF0IGJpdG1hcCBhcyB3ZWxsLiBUaGUKPj4gPj4gY2hpcF9kYXRhL2Rl
c2MgaGFzIHRoYXQgaW5mb3JtYXRpb24uIFRoaXMgd291bGQgbWVhbiB0aGF0Cj4+ID4+IGltc2lj
X2xvY2FsX3ByaXYoKSB3b3VsZCBvbmx5IGhhdmUgdGhlIGxvY2FsIHZlY3RvcnMgKGNoaXBfZGF0
YSksIGFuZAo+PiA+PiBhIGNsZWFudXAgbGlzdC90aW1lci4KPj4gPj4KPj4gPj4gTXkgZ2VuZXJh
bCBjb21tZW50IGlzIHRoYXQgaW5zdGVhZCBvZiBoYXZpbmcgdGhlc2UgZ2xvYmFsIGlkLXRyYWNr
aW5nCj4+ID4+IHN0cnVjdHVyZXMsIHVzZSB0aGUgbWF0cml4IHRvZ2V0aGVyIHdpdGggc29tZSBk
ZXNjL2NoaXBfZGF0YSBsb2NhbAo+PiA+PiBkYXRhLCB3aGljaCBzaG91bGQgYmUgc3VmZmljaWVu
dC4KPj4gPgo+PiA+IFRoZSAiaWRzX2VuYWJsZWRfYml0bWFwIiwgImR1bW15IGh3aXJxcyIgYW5k
IHByaXZhdGUgaW1zaWNfdmVjdG9ycwo+PiA+IGFyZSByZXF1aXJlZCBzaW5jZSB0aGUgbWF0cml4
IGFsbG9jYXRvciBvbmx5IG1hbmFnZXMgYWxsb2NhdGlvbiBvZgo+PiA+IHBlci1DUFUgSURzLgo+
Pgo+PiBUaGUgaW5mb3JtYXRpb24gaW4gaWRzX2VuYWJsZWRfYml0bWFwIGlzL2NvdWxkIGJlIGlu
aGVyZW50IGluCj4+IGltc2ljX2xvY2FsX3ByaXYudmVjdG9ycyAoZ3Vlc3Mgd2hhdCB4ODYgZG9l
cy4uLiA7LSkpLgo+Pgo+PiBEdW1teSBod2lycXMgY291bGQgYmUgcmVwbGFjZWQgd2l0aCB0aGUg
dmlycS4KPj4KPj4gSG1tLCBzZWVtcyBsaWtlIHdlJ3JlIHRhbGtpbmcgcGFzdCBlYWNoIG90aGVy
LCBvciBhdCBsZWFzdCBJIGdldCB0aGUKPj4gZmVlbGluZyBJIGNhbid0IGdldCBteSBvcGluaW9u
cyBvdXQgcmlnaHQuIEknbGwgdHJ5IHRvIGRvIGEgcXVpY2sgUG9DLAo+PiB0byBzaG93IHlvdSB3
aGF0IEkgbWVhbi4gVGhhdCdzIHByb2JhYmx5IGVhc2llciB0aGFuIGp1c3QgdGFsa2luZyBhYm91
dAo+PiBpdC4gLi4uYW5kIG1heWJlIEknbGwgY29tZSByZWFsaXppbmcgSSdtIGFsbCB3cm9uZyEK
Pgo+IEkgc3VnZ2VzdCB0byB3YWl0IGZvciBteSB2MTMgYW5kIHRyeSBzb21ldGhpbmcgb24gdG9w
IG9mIHRoYXQKPiBvdGhlcndpc2Ugd2UgbWlnaHQgZHVwbGljYXRlIGVmZm9ydHMuCgpPSyEKCj4+
ID4gSSBkaWQgbm90IHNlZSBhbnkgUENJZSBvciBwbGF0Zm9ybSBkZXZpY2UgcmVxdWlyaW5nIHRo
aXMga2luZCBvZgo+PiA+IHJlc2VydmF0aW9uLiBBbnkgZXhhbXBsZXMgPwo+Pgo+PiBJdCdzIG5v
dCBhIHJlcXVpcmVtZW50LiBTb21lIGRldmljZXMgYWxsb2NhdGUgYSBnYXppbGxpb24gaW50ZXJy
dXB0cwo+PiAoTklDcyB3aXRoIG1hbnkgUW9TIHF1ZXVlcywgZS5nLiksIGJ1dCBvbmx5IGFjdGl2
YXRlIGEgc3Vic2V0ICh2aWEKPj4gcmVxdWVzdF9pcnEoKSkuIEEgc3lzdGVtIHVzaW5nIHRoZXNl
IGtpbmQgb2YgZGV2aWNlcyBtaWdodCBydW4gb3V0IG9mCj4+IGludGVycnVwdHMuCj4KPiBJIGRv
bid0IHNlZSBob3cgdGhpcyBpcyBub3QgcG9zc2libGUgY3VycmVudGx5LgoKQWdhaW4sIHRoaXMg
aXMgc29tZXRoaW5nIHdlIGNhbiBpbXByb3ZlIG9uIGxhdGVyLiBCdXQsIHRoaXMKaW1wbGVtZW50
YXRpb24gYWN0aXZhdGVzIHRoZSBpbnRlcnJ1cHQgYXQgYWxsb2NhdGlvbiB0aW1lLCBubz8KCj4+
IFByb2JsZW1zIHlvdSBydW4gaW50byBvbmNlIHlvdSBsZWF2ZSB0aGUgZW1iZWRkZWQgd29ybGQs
IHByZXR0eSBtdWNoLgo+Pgo+PiA+PiAqIEhhbmRsZSBtYW5hZ2VkIGludGVycnVwdHMKPj4gPgo+
PiA+IEFueSBleGFtcGxlcyBvZiBtYW5hZ2VkIGludGVycnVwdHMgaW4gdGhlIFJJU0MtViB3b3Js
ZCA/Cj4+Cj4+IEUuZy4gYWxsIG52bWUgZHJpdmVzOiBudm1lX3NldHVwX2lycXMoKSwgYW5kIEkn
ZCBhc3N1bWUgY29udGVtcG9yYXJ5Cj4+IG5ldGRldiBkcml2ZXJzIHdvdWxkIHVzZSBpdC4gVHlw
aWNhbGx5IGRldmljZXMgd2l0aCBwZXItY3B1IHF1ZXVlcy4KPgo+IFdlIGhhdmUgdGVzdGVkIHdp
dGggTlZNZSBkZXZpY2VzLCBlMTAwMGUsIFZpcnRJTy1uZXQsIGV0YyBhbmQgSSBkaWQKPiBub3Qg
c2VlIGFueSBpc3N1ZS4KPgo+IFdlIGNhbiBhbHdheXMgYWRkIG5ldyBmZWF0dXJlcyBhcyBzZXBh
cmF0ZSBpbmNyZW1lbnRhbCBzZXJpZXMgYXMgbG9uZwo+IGFzIHRoZXJlIGlzIGNsZWFyIHVzZS1j
YXVzZSBiYWNrZWQgYnkgcmVhbC13b3JsZCBkZXZpY2VzLgoKQWdyZWVkLiBMZXQncyBub3QgZmVh
dHVyZSBjcmVlcC4KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
