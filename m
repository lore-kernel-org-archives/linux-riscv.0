Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49671C48BF6
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 15:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/WNbo78NnC4yQJJK/lwuGS2NryyRlXgbWJDs7lqbYrk=; b=ACmx5o8ABvgDwS
	Gwkm6aoj4eHjCKoP6j5PhBcFXF2x45eyywoT/WOnuL4lzOnsy0XKc3TKqoEVtU1nOxHwKNShZ96qd
	q+azKYrlwsmAeGkOVZg3qBl7nHCpjwsszfiEYA0df0yMCZg3fT5Te1p+4cLanOp61JeQdXkVBTvcF
	D5kiitUM8RhmhMJqDl3VzezAIC5O17JLtUSAGvWSX/EpawBdJ3UQnFW807ahUBJTbt7JplXrgZ56b
	uDKrg733NvFVkOM+yV3g8IKokp1OVxWuDZ8ZxDyOcn40gV8kKd8rovMUmhLxvLrxcH/JIwz8PtYHe
	TlvX38Yh6/13P42CXsXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riFFF-00000005Ag4-2Fve;
	Thu, 07 Mar 2024 15:01:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riFFC-00000005Aeq-2YJK;
	Thu, 07 Mar 2024 15:01:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EE29D60FD8;
	Thu,  7 Mar 2024 15:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00BC8C433F1;
	Thu,  7 Mar 2024 15:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709823673;
	bh=pQOSBvGr2PdFDDcAF4v1xGbCwkIdtH4hpyIk5PVZU7g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=uUxYiWnEqKVWLcW0IYvhhO3XJxsl7pxYgIiOF+omyTeO5SHAB42GvaEVHrOoaYYid
	 +wfamRpY9Mr6uApWQtRsatDqM5l8+PXB9JJ1/ZKpSXYHrWOdoTS2OSM8+QmIAJ9xVL
	 UkCVhYw9I45iHVOLFJ25RS/tfKw1XfxhftVbDPe7lm+IF8PO8tDl1xhid5GFtZlYKA
	 sLm91iv2OEkV6ZOGRv4wxmUAwy96yueck46fIhF0DmGkKs2HmHJ6BQ4DC4bX6WvdOH
	 MHCGvJmkaCJXuyVkVS296MbkWwqSwxmf8pMecOByqUTI53At6eW0lTr0/unP3HXKrx
	 76GZYQ84e70jQ==
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
Subject: Re: [PATCH v15 08/10] irqchip/riscv-aplic: Add support for MSI-mode
In-Reply-To: <CAK9=C2Ud+CJzWfY0Lp97OMt9QvJBFX=hHJidn_90XY5cEB9LHw@mail.gmail.com>
References: <20240226040746.1396416-1-apatel@ventanamicro.com>
 <20240226040746.1396416-9-apatel@ventanamicro.com>
 <87y1avbboj.fsf@all.your.base.are.belong.to.us>
 <CAK9=C2Ud+CJzWfY0Lp97OMt9QvJBFX=hHJidn_90XY5cEB9LHw@mail.gmail.com>
Date: Thu, 07 Mar 2024 16:01:09 +0100
Message-ID: <871q8mdr2i.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_070114_719210_F9DAA347 
X-CRM114-Status: GOOD (  15.47  )
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

QW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKCj4gT24gV2VkLCBN
YXIgNiwgMjAyNCBhdCA5OjIy4oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4g
d3JvdGU6Cj4+Cj4+IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cml0ZXM6
Cj4+Cj4+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbXNp
LmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1zaS5jCj4+ID4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmIyYTI1ZTAxMWJiMgo+PiA+IC0t
LSAvZGV2L251bGwKPj4gPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1z
aS5jCj4+ID4gK3N0YXRpYyB2b2lkIGFwbGljX21zaV93cml0ZV9tc2coc3RydWN0IGlycV9kYXRh
ICpkLCBzdHJ1Y3QgbXNpX21zZyAqbXNnKQo+PiA+ICt7Cj4+ID4gKyAgICAgdW5zaWduZWQgaW50
IGdyb3VwX2luZGV4LCBoYXJ0X2luZGV4LCBndWVzdF9pbmRleCwgdmFsOwo+PiA+ICsgICAgIHN0
cnVjdCBhcGxpY19wcml2ICpwcml2ID0gaXJxX2RhdGFfZ2V0X2lycV9jaGlwX2RhdGEoZCk7Cj4+
ID4gKyAgICAgc3RydWN0IGFwbGljX21zaWNmZyAqbWMgPSAmcHJpdi0+bXNpY2ZnOwo+PiA+ICsg
ICAgIHBoeXNfYWRkcl90IHRwcG4sIHRicHBuLCBtc2dfYWRkcjsKPj4gPiArICAgICB2b2lkIF9f
aW9tZW0gKnRhcmdldDsKPj4gPiArCj4+ID4gKyAgICAgLyogRm9yIHplcm9lZCBNU0ksIHNpbXBs
eSB3cml0ZSB6ZXJvIGludG8gdGhlIHRhcmdldCByZWdpc3RlciAqLwo+PiA+ICsgICAgIGlmICgh
bXNnLT5hZGRyZXNzX2hpICYmICFtc2ctPmFkZHJlc3NfbG8gJiYgIW1zZy0+ZGF0YSkgewo+PiA+
ICsgICAgICAgICAgICAgdGFyZ2V0ID0gcHJpdi0+cmVncyArIEFQTElDX1RBUkdFVF9CQVNFOwo+
PiA+ICsgICAgICAgICAgICAgdGFyZ2V0ICs9IChkLT5od2lycSAtIDEpICogc2l6ZW9mKHUzMik7
Cj4+ID4gKyAgICAgICAgICAgICB3cml0ZWwoMCwgdGFyZ2V0KTsKPj4KPj4gSXMgdGhlIGZlbmNl
IG5lZWRlZCBoZXJlICh3cml0ZWxfcmVsYXhlZCgpKS4uLgo+Cj4gVGhlIHBjaV93cml0ZV9tc2df
bXNpeCgpIChjYWxsZWQgdmlhIHBjaV9tc2lfZG9tYWluX3dyaXRlX21zZygpKQo+IHVzZXMgd3Jp
dGVsKCkgaGVuY2UgdGFraW5nIGluc3BpcmF0aW9uIGZyb20gdGhhdCB3ZSB1c2Ugd3JpdGVsKCkg
b3ZlciBoZXJlCj4gYXMgd2VsbC4KPgo+IElmIHRoYXQncyB3cm9uZyB0aGVuIHBjaV93cml0ZV9t
c2dfbXNpeCgpIG11c3QgYmUgZml4ZWQgYXMgd2VsbC4KCkh1aD8gVGhlIHdyaXRlbCgpcyBpbiBw
Y2lfd3JpdGVfbXNnX21zaXgoKSBhcmUgYmVjYXVzZSB0aGVyZSdzIGFuCm9yZGVyaW5nIGNvbnN0
cmFpbnQsIGFuZCBjb2RlIHdvdWxkIGJlIGJyb2tlbiB3L28gaXQuIE15IHF1ZXN0aW9uIHdhcwoi
d2hhdCBhcmUgdGhlIG9yZGVyaW5nIGNvbnN0cmFpbnRzIGZvciB0aGlzIHBpZWNlIG9mIGNvZGUi
LCBiZWNhdXNlIGl0Cmxvb2tzIGxpa2UgdGhpcyBpcyBhIHNpbmdsZSBJL08gd3JpdGUgd2l0aG91
dCBhbnkgb3JkZXJpbmcgY29uc3RyYWludHMuCgpJJ20gbm90IGEgZmFuIG9mIHNwcmlua2xpbmcg
ZmVuY2VzIGFyb3VuZCAidG8gYmUgc2FmZSIsIGJ1dCBJIGRvbid0IHdhbnQKdG8gZGVsYXkgdGhl
IHYxNiBiZWNhdXNlIG9mIGl0LiBJdCBjYW4gYmUgZml4ZWQgbGF0ZXIsIGlmIGl0J3Mgbm90Cm5l
ZWRlZC4KCgpDaGVlcnMsIGFuZCB0aGFua3MgZm9yIHlvdXIgaGFyZCB3b3JrIQpCasO2cm4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
