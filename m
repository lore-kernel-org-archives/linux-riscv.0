Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1982CC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 18:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KAIt2D5TjbrBHFUSyphK1HGsY91C9RCRYk6lpc0lnUY=; b=IXtKOZ3OtroZ4i
	B5BiacYtt01XLB3FJZsJdlF7/ssgTt2r2IQYmzpXpDkpcgXu/m6va26aqExZCmsFzrIjs5YPQwlov
	Jq2wfQrmx1V3av0x5kviKkc/d+v7xScNsht8bgqh/u34Yqlm6KIylQVH9h8/f6SnN2nthq7I1dupf
	EXVhDUbCTz7nlG03eDb7fm26OlVyQVW9pkZ40wxwiPDaJMEblcUN/cegdQmzMkNKvWpMc63B5KyNz
	WNr0o2t/9RcXu6DoTL3YyND7kodJt5PX9sL9O9OjzzEkseS+of7p8MsVlsRvcql5WDMB09psEi9Gr
	P4uL+i9xOw6KE/IrkU1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwoAc-000kIu-2h;
	Sat, 28 Oct 2023 18:36:26 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwoAa-000kIT-1Q
	for linux-riscv@lists.infradead.org;
	Sat, 28 Oct 2023 18:36:25 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698518182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y+JcIxwCXoDSqf+artDzmxw4NchEsdASLJbThyKqdKo=;
	b=XPD1tQNetxvEMQ5Fs4mzhtA/G5HWxqiD9ADxCIt7lYfraNqzOMel6WUxppBbqdi0bgI8aZ
	3rPQzNZs9PUl2jp/jDJY2L4QntS1kpl91bgcoQ8MwxMNYCKU40QO7P9NsDtqVkoHPAClvL
	l9Ypj6JGrlL6oh82hFpbPRFKtkzuzehhR65XTPO0nAGcN9vge7E/sYR1ZlCZlBdTUGXvum
	fYXhCUPu6U1EscBv3oubTAhyVMdv3h8CHa+y5E4EtnPUo0zDFZy+A0MI5NJV9UW1cJ1lan
	V7JKOjHUv+9AL7BsjcQiBzM9/OdO3TClZ5ZNgh66xWjZ4stz3rc6q78CJ+tyyQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698518182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y+JcIxwCXoDSqf+artDzmxw4NchEsdASLJbThyKqdKo=;
	b=M3mwqGYRAOI6KGdDqVCILcqh8Ql5h8OW+P1CEwmVfh4n9f9Nn8Lo5wD7FszZtGyZKCGF0j
	WXB1fuwq/1Jxa9Bw==
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [PATCH v11 09/14] irqchip/riscv-imsic: Add support for PCI MSI
 irqdomain
In-Reply-To: <87jzrbf5cw.fsf@all.your.base.are.belong.to.us>
References: <20231023172800.315343-1-apatel@ventanamicro.com>
 <20231023172800.315343-10-apatel@ventanamicro.com>
 <8734y0rwtw.fsf@all.your.base.are.belong.to.us>
 <CAK9=C2UVgTd-a0671Lab_ZeOPWP3=wHY+pydKHqaR-Yg65YhrA@mail.gmail.com>
 <87jzrbf5cw.fsf@all.your.base.are.belong.to.us>
Date: Sat, 28 Oct 2023 20:36:22 +0200
Message-ID: <87y1fmzja1.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_113624_627649_BCB9DC77 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBPY3QgMjUgMjAyMyBhdCAxMDo1NSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gTm93
IGZvciBJTVNJQy1QQ0kgZG9tYWluLCB0aGUgUENJIGZyYW1ld29yayBleHBlY3RzIHRoZQo+PiBw
Y2lfbXNpX21hc2svdW5tYXNrX2lycSgpIGZ1bmN0aW9ucyB0byBiZSBjYWxsZWQgYnV0IGlmCj4+
IHdlIGRpcmVjdGx5IHBvaW50IHBjaV9tc2lfbWFzay91bm1hc2tfaXJxKCkgaW4gdGhlIElNU0lD
LVBDSQo+PiBpcnFjaGlwIHRoZW4gSU1TSUMtQkFTRSAocGFyZW50IGRvbWFpbikgaXJxX21hc2sv
dW1hc2sKPj4gd29uJ3QgYmUgY2FsbGVkIGhlbmNlIHRoZSBJUlEgd29uJ3QgYmUgbWFza2VkL3Vu
bWFzay4KPj4gRHVlIHRvIHRoaXMsIHdlIGNhbGwgYm90aCBwY2lfbXNpX21hc2svdW5tYXNrX2ly
cSgpIGFuZAo+PiBpcnFfY2hpcF9tYXNrL3VubWFza19wYXJlbnQoKSBmb3IgSU1TSUMtUENJIGRv
bWFpbi4KPgo+IE9rLiBJIHdvbnQgZGlnIG1vcmUgaW50byBpdCBmb3Igbm93ISBJZiB0aGUgaW50
ZXJydXB0IGlzIGRpc2FibGVkIGF0Cj4gUENJLCBpdCBzZWVtcyBhIGJpdCBvdmVya2lsbCB0byAq
YWxzbyogbWFzayBpdCBhdCB0aGUgSU1TSUMgbGV2ZWwuLi4KCk9ubHkgX2lmXyB0aGUgZGV2aWNl
IHByb3ZpZGVzIE1TSSBtYXNraW5nLCBidXQgdGhhdCBleHRyYSBtYXNrL3VubWFzayBpcwpub3Qg
dGhlIGVuZCBvZiB0aGUgd29ybGQuCgpUaGFua3MsCgogICAgICAgIHRnbHgKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
