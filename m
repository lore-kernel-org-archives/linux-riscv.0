Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCB0C47422
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 12:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3kkZpowqYBi1fXd8Szyjf0WAHv6TaMHX3ftwLnxWXhk=; b=iOs4xu/fEGpJuM
	KCFbeV8xRZawYUKVqmhrALdUTT768W01DE/H/Vveuwzgmvf9VlcGN3Qw5IPZwtRs1B+glwtxsGfo6
	LYLsqxgK+tRjmZ8n7RrDqfY+aXc3yWU3qeQvvE9BWLSGwdHVX89vuDbhWNSC57GR2uQkn7oklMeBR
	gl2t9PisvouT2FF9BLNuuDRbicPFZymGENK0B4jtYIOcQroBfSFLqbruShlIwfJ196qoFMA4wi4+z
	a3ua9dwiqKammu5MhguOgdBb8XKDoXCVi7i5CyFxRzkt2OHO+dbKwwVH7jiWcKuXsAFJPmuQhneJM
	tq7GnX0OFzHT5pE+F6Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUQOG-0000000CXHO-4Avv;
	Mon, 29 Jan 2024 12:05:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUQOE-0000000CXGY-0W9N
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 12:05:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36EB861E27;
	Mon, 29 Jan 2024 12:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43055C43399;
	Mon, 29 Jan 2024 12:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706529924;
	bh=B31YqXWo2jR6Q6dfmNlAsdyMk4Lj6GHmNj2kx0cjzZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qb3eCHxgl85vWgSsclmEXDaKG08hwQgCm5ulSL8tMkw4n9V1qQENErMX3CNueOhRC
	 MrkxftfhKBdvIVA8t+k0jSLhr/aXd157nuL1BFQw2secdXQELTYQrzBUx+C37E1qde
	 x1kxlouM4lP5HzpmDIo9Zb0jnQSTUQN0r4DT3hZmvqgOfhnH4WGAfw7LG6noAmhXD1
	 PVKFoPMhw5GGKHpOjDWFKTadgqFBgzzMwtaDmeBEQzgmfdY+vLVp+E6G5+M0BqdgiK
	 P7QVswmFsdY9o6IuaK5A7E7aCmmFQe3VlWeTrSHmKSzqvhKL4r7+XovFGmvg3lReG8
	 VjrK6uFIt3+Yg==
Date: Mon, 29 Jan 2024 19:52:33 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com, samuel.holland@sifive.com,
	ajones@ventanamicro.com, mchitale@ventanamicro.com,
	dylan@andestech.com, sergey.matyukevich@syntacore.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, apatel@ventanamicro.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [External] Re: [PATCH] RISC-V: add uniprocessor
 flush_tlb_range() support
Message-ID: <ZbeRgRBhvNnnTd8h@xhacker>
References: <20240125062044.63344-1-cuiyunhui@bytedance.com>
 <ZbdYijWK1PnHXn47@xhacker>
 <CAEEQ3wnSN8dLh3FcmHq5yPwQRdjLQa_VjcuTH+7YYZLOqCzaCQ@mail.gmail.com>
 <ZbdyLJ24I2fa6oNb@xhacker>
 <CAEEQ3w=gpSTxzxTzh-zHbP37P8s5eVCzG6RZndBXF-U+mNrziw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3w=gpSTxzxTzh-zHbP37P8s5eVCzG6RZndBXF-U+mNrziw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_040526_297435_B2199080 
X-CRM114-Status: GOOD (  25.11  )
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

T24gTW9uLCBKYW4gMjksIDIwMjQgYXQgMDc6MDI6MTBQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBKaXNoZW5nLAo+IAo+IE9uIE1vbiwgSmFuIDI5LCAyMDI0IGF0IDU6NTHigK9QTSBK
aXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwg
SmFuIDI5LCAyMDI0IGF0IDA0OjI2OjU3UE0gKzA4MDAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4gPiA+
IEhpIEppc2hlbmcsCj4gPiA+Cj4gPiA+IE9uIE1vbiwgSmFuIDI5LCAyMDI0IGF0IDQ6MDLigK9Q
TSBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+
ID4gT24gVGh1LCBKYW4gMjUsIDIwMjQgYXQgMDI6MjA6NDRQTSArMDgwMCwgWXVuaHVpIEN1aSB3
cm90ZToKPiA+ID4gPiA+IEFkZCBzdXBwb3J0IGZvciBmbHVzaF90bGJfcmFuZ2UoKSB0byBpbXBy
b3ZlIFRMQiBwZXJmb3JtYW5jZSBmb3IKPiA+ID4gPiA+IFVQIHN5c3RlbXMuIEluIG9yZGVyIHRv
IGF2b2lkIHRoZSBtdXR1YWwgaW5jbHVzaW9uIG9mIHRsYmZsdXNoLmgKPiA+ID4gPiA+IGFuZCBo
dWdldGxiLmgsIHRoZSBVUCBwYXJ0IGlzIGFsc28gaW1wbGVtZW50ZWQgaW4gdGxiZmx1c2guYy4K
PiA+ID4gPgo+ID4gPiA+IEhpIFl1bmh1aSwKPiA+ID4gPgo+ID4gPiA+IElJUkMsIFNhbXVlbCBz
ZW50IHNpbWlsYXIgcGF0Y2ggc2VyaWVzIGEgZmV3IHdlZWtzIGFnby4KPiA+ID4gPgo+ID4gPiA+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwMTAyMjIwMTM0LjMyMjkx
NTYtMS1zYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tLwo+ID4gPiA+Cj4gPiA+ID4gQWZ0ZXIgdGhh
dCBzZXJpZXMsIGRvIHlvdSBzdGlsbCBuZWVkIHRoaXMgcGF0Y2g/Cj4gPiA+Cj4gPiA+IFRoYW5r
IHlvdSBmb3IgeW91ciByZW1pbmRlci4gSSBkaWRuJ3QgZmluZCBpdCBiZWZvcmUgSSBtYWlsZWQg
bXkKPiA+ID4gcGF0Y2guIEkganVzdCBsb29rZWQgYXQgdGhlIGNvbnRlbnQgb2YgdGhpcyBwYXRj
aC4gSSB1bmRlcnN0YW5kIHRoYXQKPiA+ID4gbXkgcGF0Y2ggaXMgbmVlZGVkLiBGb3IgYSBzaW5n
bGUgY29yZSwgYSBtb3JlIGNvbmNpc2UgVExCIGZsdXNoIGxvZ2ljCj4gPiA+IGlzIG5lZWRlZCwg
YW5kIGl0IGlzIGhlbHBmdWwgdG8gaW1wcm92ZSBwZXJmb3JtYW5jZS4KPiA+Cj4gPiBDdXJyZW50
bHksIHJpc2N2IFVQIGZsdXNoX3RsYl9yYW5nZSBzdGlsbCB1c2UgZmx1c2ggYWxsIFRMQiBlbnRy
aWVzLAo+ID4gb2J2aW91c2x5IGl0J3MgaXMgYSBiaWcgaGFtbWVyLCB0aGlzIGlzIHdoYXQgeW91
ciBwYXRjaCBpcyB0cnlpbmcgdG8KPiA+IG9wdGltaXplLiBJJ20gbm90IHN1cmUgd2hldGhlciBJ
IHVuZGVyc3RhbmQgeW91ciBjb2RlIGNvcnJlY3RseSBvciBub3QuCj4gPiBMZXQgbWUga25vdyBp
ZiBJIG1pc3VuZGVyc3RhbmQgeW91ciBjb2RlLgo+ID4KPiA+IEFmdGVyIHBhdGNoNSBvZiB0aGUg
U2FtdWVsJ3Mgc2VyaWVzLCBfX2ZsdXNoX3RsYl9yYW5nZSBpcyB1bmlmaWVkIGZvcgo+ID4gU01Q
IGFuZCBVUCwgc28gdGhhdCBVUCBjYW4gYWxzbyBiZW5lZml0IGZyb20gcmVjZW50IGltcHJvdmVt
ZW50cywgc3VjaAo+ID4gYXMgcmFuZ2UgZmx1c2ggcmF0aGVyIHRoYW4gYWxsLgo+IAo+IEluIG15
IG9waW5pb24sIFVQIGRvZXMgbm90IG5lZWQgdG8gY29tYmluZSBzb21lIFNNUCBpZi4uLiBlbHNl
LAo+IG9uX2VhY2hfY3B1KC4uLikgbG9naWMsIHdoaWNoIGlzIGFsc28gYSBtYW5pZmVzdGF0aW9u
IG9mIHBlcmZvcm1hbmNlCgpIaSBZdW5odWksCgpJSVJDLCB0aGUgY29tcGlsZXIgd2lsbCBvcHRp
bWlzZSBvdXQgdGhlIHVubmVjZXNzYXJ5IGxvZ2ljIHVuZGVyIFVQLCBJCm1heSBtaXNyZWFkIHRo
ZSBjb2RlLiBCdXQgaWYgbm8sIGluZGVlZCwgdGhlcmUncyBpbXByb3ZlbWVudCByb29tLgpIb3dl
dmVyLCBldmVuIGluIHRoaXMgY2FzZSwgSU1ITywgaXQncyBiZXR0ZXIgaWYgeW91IGNhbiBiYXNl
IG9uClNhbXVlbCdzIHNlcmllcy4KQW55d2F5LCB0aGUgb3B0aW1pemF0aW9uKHJhbmdlIHRsYiBl
bnRyaWVzIHJhdGhlciB0aGFuICphbGwqIGVudHJpZXMgdW5kZXIKVVAgY2FzZSkgeW91IHdhbnQg
dG8gZG8gaGFzIGJlZW4gaW1wbGVtZW50ZWQuIFdoaWxlIEknbSBub3Qgc3VyZSB3aGV0aGVyCndl
IGNhbiByZWx5IG9uIHRoZSBjb21waWxlciB0byBvcHRpbWl6ZSBvdXQgYWxsIHVubmVjZXNzYXJ5
IGxvZ2ljcy4KClRoYW5rcwo+IGltcHJvdmVtZW50LiB3aGF0IGRvIHlvdSB0aGluaz8KPiBUaGFu
a3MsCj4gWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
