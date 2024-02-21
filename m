Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E601C48BEB
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sEA70gyglNYn8vOF7FcdTRkckAbtGLmPTjx3XU08+Vg=; b=Tk3dxX+drZeyYW
	cxn96VK3RBxJ7WT4M48DGBRCufBzfv6EjEAnEQucQ5lbuAipYyQ4Z+EG3pW9zRaA1YhJoVXq6aKnE
	XrsXnA5AceNrCi7S0sykENNsv6pCo+njO15/ryKGjH5fJXC+XTOUPpNtbZe+p7txDWhjjJcqw3cXO
	m7LZAhymx59kb1f4D+9c+gSs/gf3YNoifPF8UV+2ukeGhGAgnifeC5MUVjuNVDwNC4FT9PwWkigmM
	kEK7w+Vw9S9Pp3LEMavz8sWocaMG3zpLQfKMyJA4QYdSiC//81Eg2rvorXzDp29I4FgzLURTuBWjX
	pGDaYOvp2DaS4rdV1Ffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcqIz-00000001u8f-1rv9;
	Wed, 21 Feb 2024 17:22:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcqIv-00000001u6x-3MxJ;
	Wed, 21 Feb 2024 17:22:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 229BFCE187D;
	Wed, 21 Feb 2024 17:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE996C433C7;
	Wed, 21 Feb 2024 17:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708536163;
	bh=blg5JU8tDMyTEMnxPmEINNG8w4b5crwe8Ll8EbiY46w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=uS6BeSvp5tQGb7tUlatSA/6AdxlnEqgjZPLPhr6LKL2tCyHmyDbdKRfzPS5FAWS9h
	 5m1LOHkjES0ipSOeDSL5tcJz44ykKBaIkXK8HNmJI96vuZZ3SAnXIoqD45xVPGoOYt
	 o8QzAj15C6JcXC/J6h42DDG/vCskLuUz3ocow7c4bExBhrXzOZumMNiTCvqsInTi5C
	 PvHc0P00mfCSC2JJZ2ksFd/m4QmfmQy5BhzTAnSFHQoJBD1ZndQam64PHic0VPDW9S
	 rI+bVOD5JBrV2noI1rPqGMASyOA+IQuUeceifL3AcwuLzdiwnImYBY46T27+Ob5deH
	 k03G6v925g45Q==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc
 Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v13 06/13] irqchip: Add RISC-V incoming MSI controller
 early driver
In-Reply-To: <CAK9=C2WXR49KZg3rstChqAHda+hUhPm3AEo6o2jh0NM3kvoSUA@mail.gmail.com>
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-7-apatel@ventanamicro.com>
 <87frxnfj3p.fsf@all.your.base.are.belong.to.us>
 <CAK9=C2Xnzg3KAVETXN+ZGLWhVtaJuU4uXs3WH2ZondkBJMHFcA@mail.gmail.com>
 <874je2yqn9.fsf@all.your.base.are.belong.to.us>
 <CAK9=C2WXR49KZg3rstChqAHda+hUhPm3AEo6o2jh0NM3kvoSUA@mail.gmail.com>
Date: Wed, 21 Feb 2024 18:22:40 +0100
Message-ID: <87frxl3f6n.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_092246_461365_42F59DED 
X-CRM114-Status: GOOD (  28.08  )
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

QW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKCj4gT24gV2VkLCBG
ZWIgMjEsIDIwMjQgYXQgNToyOeKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+
IHdyb3RlOgo+Pgo+PiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JpdGVz
Ogo+Pgo+PiA+PiA+ICt2b2lkIGltc2ljX3ZlY3Rvcl9tYXNrKHN0cnVjdCBpbXNpY192ZWN0b3Ig
KnZlYykKPj4gPj4gPiArewo+PiA+PiA+ICsgICAgIHN0cnVjdCBpbXNpY19sb2NhbF9wcml2ICps
cHJpdjsKPj4gPj4gPiArCj4+ID4+ID4gKyAgICAgbHByaXYgPSBwZXJfY3B1X3B0cihpbXNpYy0+
bHByaXYsIHZlYy0+Y3B1KTsKPj4gPj4gPiArICAgICBpZiAoV0FSTl9PTigmbHByaXYtPnZlY3Rv
cnNbdmVjLT5sb2NhbF9pZF0gIT0gdmVjKSkKPj4gPj4gPiArICAgICAgICAgICAgIHJldHVybjsK
Pj4gPj4gPiArCj4+ID4+ID4gKyAgICAgLyoKPj4gPj4gPiArICAgICAgKiBUaGlzIGZ1bmN0aW9u
IGlzIGNhbGxlZCB0aHJvdWdoIExpbnV4IGlycSBzdWJzeXN0ZW0gd2l0aAo+PiA+PiA+ICsgICAg
ICAqIGlycXMgZGlzYWJsZWQgc28gbm8gbmVlZCB0byBzYXZlL3Jlc3RvcmUgaXJxIGZsYWdzLgo+
PiA+PiA+ICsgICAgICAqLwo+PiA+PiA+ICsKPj4gPj4gPiArICAgICByYXdfc3Bpbl9sb2NrKCZs
cHJpdi0+bG9jayk7Cj4+ID4+ID4gKwo+PiA+PiA+ICsgICAgIHZlYy0+ZW5hYmxlID0gZmFsc2U7
Cj4+ID4+ID4gKyAgICAgYml0bWFwX3NldChscHJpdi0+ZGlydHlfYml0bWFwLCB2ZWMtPmxvY2Fs
X2lkLCAxKTsKPj4gPj4gPiArICAgICBfX2ltc2ljX3JlbW90ZV9zeW5jKGxwcml2LCB2ZWMtPmNw
dSk7Cj4+ID4+ID4gKwo+PiA+PiA+ICsgICAgIHJhd19zcGluX3VubG9jaygmbHByaXYtPmxvY2sp
Owo+PiA+PiA+ICt9Cj4+ID4+Cj4+ID4+IFJlYWxseSBuaWNlIHRoYXQgeW91J3JlIHVzaW5nIGEg
dGltZXIgZm9yIHRoZSB2ZWN0b3IgYWZmaW5pdHkgY2hhbmdlLAo+PiA+PiBhbmQgZ290IHJpZCBv
ZiB0aGUgc3BlY2lhbC93ZWlyZCBJTVNJQy9zeW5jIElQSS4gQ2FuIHlvdSByZWFsbHkgdXNlIGEK
Pj4gPj4gdGltZXIgZm9yIG1hc2svdW5tYXNrPyBUaGF0IG1ha2VzIHRoZSBtYXNrL3VubWFzayBv
cGVyYXRpb24KPj4gPj4gYXN5bmNocm9ub3VzIQo+PiA+Pgo+PiA+PiBUaGF0IHdhcyB3aGF0IEkg
d2FzIHRyeWluZyB0byBnZXQgdGhvdWdoIHdpdGggdGhpcyBjb21tZW50Ogo+PiA+PiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi84N3NmMjRtbzFnLmZzZkBhbGwueW91ci5iYXNl
LmFyZS5iZWxvbmcudG8udXMvCj4+ID4+Cj4+ID4+IEFsc28sIHVzaW5nIHRoZSBzbXBfKiBJUEkg
ZnVuY3Rpb25zLCB5b3UgY2FuIHBhc3MgYXJndW1lbnRzLCBzbyB5b3UKPj4gPj4gZG9uJ3QgbmVl
ZCB0aGUgZGlydHlfYml0bWFwIHRyYWNraW5nIHRoZSBjaGFuZ2VzLgo+PiA+Cj4+ID4gVGhlIG1h
c2svdW5tYXNrIG9wZXJhdGlvbnMgYXJlIGNhbGxlZCB3aXRoIGlycXMgZGlzYWJsZWQgc28gaWYK
Pj4gPiBDUFUgWCBkb2VzIHN5bmNocm9ub3VzIElQSSB0byBhbm90aGVyIENQVSBZIGZyb20gbWFz
ay91bm1hc2sKPj4gPiBvcGVyYXRpb24gdGhlbiB3aGlsZSBDUFUgWCBpcyB3YWl0aW5nIGZvciBJ
UEkgdG8gY29tcGxldGUgaXQgY2Fubm90Cj4+ID4gcmVjZWl2ZSBJUEkgZnJvbSBvdGhlciBDUFVz
IHdoaWNoIGNhbiBsZWFkIHRvIGNyYXNoZXMgYW5kIHN0YWxscy4KPj4gPgo+PiA+IEluIGdlbmVy
YWwsIHdlIHNob3VsZCBub3QgZG8gYW55IGJsb2NrL2J1c3ktd2FpdCB3b3JrIGluCj4+ID4gbWFz
ay91bm1hc2sgb3BlcmF0aW9uIG9mIGFuIGlycWNoaXAgZHJpdmVyLgo+Pgo+PiBIbW0sIE9LLiBT
dGlsbCwgYSBiaXQgb2RkIHRoYXQgd2hlbiB0aGUgLmlycV9tYXNrIGNhbGxiYWNrIHJldHVybiwg
dGhlCj4+IG1hc2tpbmcgaXMgbm90IGFjdHVhbGx5IGNvbXBsZXRlZC4KPj4KPj4gMS4gQ1BVIDAg
dHJpZXMgdG8gbWFzayBhbiBpbnRlcnJ1cHQgdHJpZWQgdG8gQ1BVIDEuCj4+IDIuIFRoZSB0aW1l
ciBpcyBxdWV1ZWQgb24gQ1BVIDEuCj4+IDMuIFRoZSBjYWxsIGlycV9tYXNrIHJldHVybnMgb24g
Q1BVIDAKPj4gNC4gLi4udGhlIGlycSBpcyBtYXNrZWQgYXQgc29tZSBmdXR1cmUgcG9pbnQsIGRl
dGVybWluZWQgYnkgdGhlIGNhbGxiYWNrCj4+ICAgIGF0IENQVSAxCj4+Cj4+IElzIHRoYXQgdGhl
IGV4cGVjdGVkIG91dGNvbWU/Cj4KPiBZZXMsIHRoYXQncyByaWdodC4KPgo+Pgo+PiBUaGVyZSBh
cmUgLmlycV9tYXNrIGltcGxlbWVudGF0aW9uIHRoYXQgZG9lcyBzZWVtIHRvIGdvIGF0IGxlbmd0
aAo+PiAoYmxvY2tpbmcpIHRvIHBlcmZvcm0gdGhlIG1hc2ssIGUuZy46IGdpY19tYXNrX2lycSgp
IHdoaWNoIGNhbGxzCj4+IGdpY197cmUsfWRpc3Rfd2FpdF9mb3JfcndwIHRoYXQgaGF2ZSBzbGVl
cC9yZXRyeSBsb29wcy4gVGhlIEdJQzMgSVRTCj4+IGNvZGUgaGFzIHNpbWlsYXIgdGhpbmdzIGdv
aW5nIG9uLgo+Cj4gVGhlIGdpY197cmUsfWRpc3Rfd2FpdF9mb3JfcndwKCkgcG9sbHMgb24gYSBI
VyByZWdpc3RlciBmb3IgY29tcGxldGlvbgo+IHdoaWNoIHdpbGwgY2VydGFpbmx5IGNvbXBsZXRl
IGluIGEgcHJlZGljdGFibGUgdGltZSB3aGVyZWFzIHdhaXRpbmcKPiBmb3IgSVBJIHRvIGJlIGV4
ZWN1dGVkIGJ5IGFub3RoZXIgQ1BVIGlzIG5vdCBwcmVkaWN0YWJsZSBhbmQgZnJhZ2lsZS4KPgo+
Pgo+PiBJJ20gbm90IHNheWluZyB5b3UncmUgd3JvbmcsIEknbSBqdXN0IHRyeWluZyB0byB3cmFw
IG15IGhlYWQgYXJvdW5kIHRoZQo+PiBtYXNraW5nIHNlbWFudGljcy4KPj4KPj4gPiBUaGUgQUlB
IElNU0lDIHNwZWMgYWxsb3dzIHNldHRpbmcgSUQgcGVuZGluZyBiaXQgdXNpbmcgTVNJIHdyaXRl
Cj4+ID4gaXJyZXNwZWN0aXZlIHdoZXRoZXIgSUQgaXMgZW5hYmxlZCBvciBub3QgYnV0IHRoZSBp
bnRlcnJ1cHQgd2lsbCBiZQo+PiA+IHRha2VuIG9ubHkgYWZ0ZXIgSUQgaXMgZW5hYmxlZC4gSW4g
b3RoZXIgd29yZHMsIHRoZXJlIHdpbGwgYmUgbm8KPj4gPiBsb3NzIG9mIGludGVycnVwdCB3aXRo
IGRlbGF5ZWQgbWFzay91bm1hc2sgdXNpbmcgYXN5bmMgSVBJIG9yCj4+ID4gbGF6eSB0aW1lci4K
Pj4KPj4gTm8gbG9zcywgYnV0IHdlIG1pZ2h0ICpnZXQqIGFuIGludGVycnVwdCB3aGVuIHdlIGV4
cGxpY2l0bHkgYXNrZWQgbm90IHRvCj4+IGdldCBhbnkuIE1heWJlIHRoYXQncyBvaz8KPj4KPgo+
IFRoZSBkZWxheWVkIHNwdXJpb3VzIGludGVycnVwdCBhZnRlciBtYXNraW5nIGlzIGF2b2lkZWQg
YnkgYWRkaXRpb25hbAo+IG1hc2tpbmcgYXQgdGhlIHNvdXJjZSBvZiBpbnRlcnJ1cHQuIEZvciB3
aXJlZC10by1NU0kgaW50ZXJydXB0cywgd2UgaGF2ZQo+IGFkZGl0aW9uYWwgbWFza2luZyBvbiB0
aGUgQVBMSUMgTVNJLW1vZGUuIEZvciBQQ0kgTVNJIGludGVycnVwdHMsIHdlCj4gaGF2ZSBhZGRp
dGlvbmFsIG1hc2tpbmcgYXQgUENJIGRldmljZSBsZXZlbCB1c2luZyBwY2lfbXNpX21hc2tfaXJx
KCkuCgpUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9ucywgQW51cCEgTXVjaCBhcHByZWNpYXRl
ZCEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
