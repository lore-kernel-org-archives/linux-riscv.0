Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A599BCCD199
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 18:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJ5YfYuNX/40Blf8wjl/SdTTOWbXnMOdOpCrqbyRJlQ=; b=BJaoJH7XFpew9p
	pq2/UIOWLUF7Fc2Z9q4F6PRgP6Ey8YrqLjXbfTpM0e3/FIFuRTTaPDUW28EiDdFHLOKafwC/gfL3d
	woabND0eMhDXZ/ZrDoJXyHbIf45oq6dJKxpT41I1qo0zqzRN6Q9Xu7Tcgq2TemY54OQfwplIlNZOY
	HP2+884tVfPI39C04E/8JIDXJQwXhMYwWw6O3UbFkZd+vEpffcrVK0K2eBcWOz8KcIZJserDaSxno
	nQtDwfdWOmj8ZSZGU1hK+6IIiP0O0f080rOuo5veEDeAFfq4+VMjflrcz2S5UwiO8atmWHsVyTeK8
	tuIX+QOJi02u/jtlHYhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9SKa-00000005epm-0sps;
	Thu, 16 Oct 2025 18:04:04 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9SKW-00000005epG-3l6g
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 18:04:02 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760637836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CmaG09FybF1QSupTskdEfI0OuLqWwGIEPddqcjGF0uA=;
	b=WgKcr8kjH6FfiUxbBMzY+bOuxxa0uJx9ZfPX+bktVJeKvLh63qriIiM1dOe05YedZlNt2P
	SqwgwAluZHVfuHR69WLystKoHybkTgpi3ja/NkFs/eLfky5ABzvO6UwK8ZEB61C2fP/FjI
	P5EdOgPXJwkfT8jtpV1XBz9+Jj3paSCD/PgGxsLsT5Mg9ssadXEFQeDz7+7GbeKnvAEdPO
	gyBLHpoDJpoXTZuP4+VpLfUq+REoxBpsJKrVsGoVoyG323K3CMQ+Mg7I7h6zzgBmOlAFNJ
	qvWe4rFFs0JtRwOXbR0GS1t9z1azF07i/816gfCyPrL/Vu3e6ty9Cl6TWvoqsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760637836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CmaG09FybF1QSupTskdEfI0OuLqWwGIEPddqcjGF0uA=;
	b=iLgXZLXvAsqSuL4039yFWiptIlpAqYFTWXBTu3nSxJKFRpxJ10YaIX4gYfJOYsBPHQ5zC9
	gYasGwhAFrIXN6Cw==
To: Charles Mirabile <cmirabil@redhat.com>
Cc: Lucas Zampieri <lzampier@redhat.com>, linux-kernel@vger.kernel.org, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Vivian Wang <dramforever@live.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Zhang
 Xincheng <zhangxincheng@ultrarisc.com>
Subject: Re: [PATCH v5 3/3] irqchip/plic: add support for UltraRISC DP1000 PLIC
In-Reply-To: <CABe3_aH3YE9wWonH1j09-eCarhzhhRReNAOwmEMs5YjkOvvoiQ@mail.gmail.com>
References: <20251016084301.27670-1-lzampier@redhat.com>
 <20251016084301.27670-4-lzampier@redhat.com> <87plan0yvd.ffs@tglx>
 <CABe3_aGj68qM1bNZ3LExbexO=9FO4RzJxhUy2T+HKK1qZfBmtw@mail.gmail.com>
 <87ms5q25cm.ffs@tglx>
 <CABe3_aH3YE9wWonH1j09-eCarhzhhRReNAOwmEMs5YjkOvvoiQ@mail.gmail.com>
Date: Thu, 16 Oct 2025 19:53:26 +0200
Message-ID: <87h5vy20o9.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_110401_076559_1622DB5C 
X-CRM114-Status: GOOD (  16.72  )
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

T24gVGh1LCBPY3QgMTYgMjAyNSBhdCAxMjo1MiwgQ2hhcmxlcyBNaXJhYmlsZSB3cm90ZToKPiBP
biBUaHUsIE9jdCAxNiwgMjAyNSBhdCAxMjoxMuKAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPj4gPj4gICAgICAgICBiaXQgPSBmZnMocGVuZGluZykgLSAx
Owo+PiA+PiAgICAgICAgIGhhbmRsZXItPmVuYWJsZWRfY2xlYXJbZ3JvdXBdIHw9IEJJVChiaXQp
Owo+PiA+PiAgICAgICAgIGZvciAoaW50IGkgPSAwOyBpIDwgbnJfaXJxX2dyb3VwczsgaSsrKQo+
PiA+PiAgICAgICAgICAgICAgICAgd3JpdGVsX3JlbGF4ZWQoaGFuZGxlci0+ZW5hYmxlZF9jbGVh
cltpXSwgZW5hYmxlICsgaSAqIHNpemVvZih1MzIpKTsKPj4gPj4gICAgICAgICBoYW5kbGVyLT5l
bmFibGVkX2NsZWFyW2dyb3VwXSA9IDA7Cj4+ID4+Cj4+ID4+IE5vPwo+PiA+Cj4+ID4gU3VyZSB0
aGF0IHdvdWxkIGFsc28gd29yaywgYnV0IHdoeSBhcmUgd2UgdXNpbmcgZmZzIChzbG93KSBvbmx5
IHRvCj4+ID4gc2hpZnQgdGhlIHJlc3VsdCBiYWNrIHRvIG1ha2UgYSBuZXcgbWFzayB3aGVuICh4
ICYgLXgpIGlzIGZhc3RlciBhbmQKPj4gPiBza2lwcyB0aGUgaW50ZXJtZWRpYXRlIHN0ZXAgZGVs
aXZlcmluZyBpbW1lZGlhdGVseSB0aGUgbWFzayBvZiB0aGUKPj4gPiBsb3dlc3QgYml0Lgo+Pgo+
PiBCZWNhdXNlIEkgZGlkIG5vdCBzcGVuZCB0aW1lIHRoaW5raW5nIGFib3V0IGl0Lgo+Cj4gU29y
cnksIGRpZCB5b3UgbWVhbiAiYmVjYXVzZSBJIGhhZCBub3QgY29uc2lkZXJlZCB0aGUgb3JpZ2lu
YWwKPiBhcHByb2FjaCBjYXJlZnVsbHkgZW5vdWdoIiBvciAiYmVjYXVzZSB0aGlzIG90aGVyIGFw
cHJvYWNoLCB3aGlsZQo+IHNsb3dlciwgaXMgbW9yZSBzZWxmIGV2aWRlbnRseSBjb3JyZWN0LiIK
CkkgZGlkIG5vdCB0aGluayBhYm91dCB4ICYgLXggOikKCj4+IEl0J3MgYSBwb2ludGVyIGluIHN0
cnVjdCBwbGljX2hhbmRsZXIgKG9yIHdoYXRldmVyIGl0J3MgbmFtZWQpIGFuZCB5b3UKPj4gY2Fu
IGFsbG9jYXRlIGl0IHdoZW4gdGhlIHF1aXJrIGlzIHJlcXVpcmVkLiBUaGUgcG9pbnRlciBpcyBk
ZWZpbml0ZWx5Cj4+IG5vdCBhIGJ1cmRlbiBmb3IgYW55b25lIGVsc2UuCj4KPiBUaGlzIEkgc3Rp
bGwgZG9uJ3QgdW5kZXJzdGFuZCBob3cgdGhpcyBpcyBwYXJ0aWN1YXJseSBoZWxwZnVsLiBTaW5j
ZQo+IHdlIGFyZSBkb2luZyBtbWlvLCB0aGlzIGlzIGdvaW5nIHRvIGJlIGFuIGV4cGxpY2l0IGxv
b3AgYW5kIG5vdCBhCj4gbWVtY3B5LiBUaGUgY29kZSBpcyBicmFuY2hsZXNzIGluIGVpdGhlciBj
YXNlIChzZXQgZXF1YWwgZm9yIHRoZSBjaGVjawo+IG9mIGkgYWdhaW5zdCBqIG5lZ2F0ZSBhbmQg
YW5kIHdpdGggbWFzayBiZWZvcmUgbG9hZGluZyBpbnRvIHRoZSBtbWlvKS4KCkZhaXIgZW5vdWdo
LiBJIGRpZCBub3QgdGhpbmsgaW4gUklTQyBBU00gOikKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
