Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D56BC48BC4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 20:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0hqHSw9Ck63Hhhy5oAyuQNlF21Fzl0WqcY/QQqSMBI=; b=5CKlDjvGsAyIhk
	F4ICjuaCIU2c79/wp9f6rcr3hcyZSIv8PEYSfBH0lGQ9lYCMJPuyxEASLDlXn/b/CTYH1DfJZ982C
	SLjdNsD8GePk1wasm3XzT78u+6+nUzpBeI2z5ejDPJF8QlcDISM7VL4LiG9bOR7lD6RREkqsxIbKC
	RRi9ngtuh367/QjezWaJitgzGz1YrQaeKSGGnBWm3NTmaVZ90rZygbVDOdLBHsQl+XH6/ql8k13h1
	IEvUb1GIMi5JhTxr4vrlDj0GQ6Vk4FFUavpKYzI53LiQkfjUvHzqpIOA5y9+CtfDdE5vJvMAWqQYa
	meeqnE6zC1bPoTdYM20Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcWLJ-0000000G32g-2Lpk;
	Tue, 20 Feb 2024 20:03:53 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcWLE-0000000G2zj-2Vzk;
	Tue, 20 Feb 2024 20:03:51 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708459424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jJRsPsyZ6zDS1QWFQN2wLBFM6mS+0QImDjTMgSPiL7I=;
	b=aYQmsEOwQopLCUpYpAQuDyrIpn/ZjclA2riggfw0WWir8TT6NmiPQZJzpeC9YRHKgp0rWt
	k9TQyzVThpxVBDmox2nnESsknS5oTRd4VzFt0IU9vtyq1EJQHNR2c8XYNJ501UxxiXHAvM
	kXdsE5fN2sy9MVO94uyCUiwX4v8h1pq6bevWl8yrwk+XqoCaj9mBmXHCJGdlZPtLIuvqLX
	3q+Zma5P0XbwLUpcToklgoNTEsCISC+ORpEWQc1gQ0abV9ucGF0qXfXXUnwwqsBvpXZvEQ
	4wLIzGkKNOg+Vur2e3RHi5rEfoxeWqrJBnwmSEj0b/eNkGMG09MxRmsKO7Z1XQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708459424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jJRsPsyZ6zDS1QWFQN2wLBFM6mS+0QImDjTMgSPiL7I=;
	b=0bZpy8Ucv4te6DfmhFa1QQKyXrhJJterh1+UZ0hC/H+1QXta7TTSsn4wIZdFftqnZDB7KQ
	v4NtqSu0q+WZZFDw==
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v13 08/13] irqchip/riscv-imsic: Add device MSI domain
 support for PCI devices
In-Reply-To: <CAK9=C2UgYpVtjFZ4NLzOCP6f3LQ=Fx7kPMywwQyFiNMcKmPyLw@mail.gmail.com>
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-9-apatel@ventanamicro.com> <8734tni7h3.ffs@tglx>
 <CAK9=C2UgYpVtjFZ4NLzOCP6f3LQ=Fx7kPMywwQyFiNMcKmPyLw@mail.gmail.com>
Date: Tue, 20 Feb 2024 21:03:43 +0100
Message-ID: <87jzmyhpi8.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_120348_812375_3D80B9F4 
X-CRM114-Status: GOOD (  12.52  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgMjAgMjAyNCBhdCAyMjo1MSwgQW51cCBQYXRlbCB3cm90ZToKCj4gT24gVHVl
LCBGZWIgMjAsIDIwMjQgYXQgNzowNeKAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJv
bml4LmRlPiB3cm90ZToKPj4KPj4gT24gVHVlLCBGZWIgMjAgMjAyNCBhdCAxMTozNywgQW51cCBQ
YXRlbCB3cm90ZToKPj4gPiAgc3RhdGljIGJvb2wgaW1zaWNfaW5pdF9kZXZfbXNpX2luZm8oc3Ry
dWN0IGRldmljZSAqZGV2LAo+PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgaXJxX2RvbWFpbiAqZG9tYWluLAo+PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgaXJxX2RvbWFpbiAqcmVhbF9wYXJlbnQsCj4+ID4gQEAgLTIxOCw2ICsy
NDEsNyBAQCBzdGF0aWMgYm9vbCBpbXNpY19pbml0X2Rldl9tc2lfaW5mbyhzdHJ1Y3QgZGV2aWNl
ICpkZXYsCj4+ID4KPj4gPiAgICAgICAvKiBNU0kgcGFyZW50IGRvbWFpbiBzcGVjaWZpYyBzZXR0
aW5ncyAqLwo+PiA+ICAgICAgIHN3aXRjaCAocmVhbF9wYXJlbnQtPmJ1c190b2tlbikgewo+PiA+
ICsgICAgIGNhc2UgRE9NQUlOX0JVU19QQ0lfTVNJOgo+Pgo+PiAgICAgICAgIGNhc2UgRE9NQUlO
X0JVU19QQ0lfREVWSUNFX01TSVg6Cj4+Cj4+ID8KPgo+IEFjdHVhbGx5LCB0aGUgRE9NQUlOX0JV
U19QQ0lfTVNJIGlzIG5vdCBuZWVkZWQgYmVjYXVzZQo+IHRoZSByZWFsIHBhcmVudCBkb21haW4g
aXMgYWx3YXlzIHRoZSBJTVNJQyBiYXNlIGlycV9kb21haW4KPiBzbyBET01BSU5fQlVTX05FWFVT
IGlzIHN1ZmZpY2llbnQuCgpJbmRlZWQuIE9idmlvdXNseSBJIGNhbid0IHJlYWQuCgo+IEJldHRl
ciB0byBqdXN0IGRyb3AgRE9NQUlOX0JVU19QQ0lfTVNJIGZyb20gdGhpcyBzd2l0Y2ggY2FzZSA/
CgpZZXMuIEkgYWN0dWFsbHkgd291bGQgYmUgYSBidWcgaWYgdGhhdCBlbmRzIHVwIGFzIHRoZSBy
ZWFsIHBhcmVudApkb21haW4uCgpUaGFua3MsCgogICAgICAgdGdseAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
