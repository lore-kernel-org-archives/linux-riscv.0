Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3B0FA1FED
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2026 19:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jo0FlbU9KqKDmcXNyHBVbTsOGFw+jQDhxqd2HMdIr0U=; b=AHWkbKrSl0VwXg
	qacHCjXh5/l2Z4AGtKyVZ2S2P0RIE6X2o6ReeW1X83RBN7pr+ohrH69T769w5PACmPRaXp+GkL7oq
	V0TKVg3Tf5zjBH8edaHigi+F4GPcnsKPHrSS39gYX2Ed1npfaA2BCXKRiBmN99IGmn1yQRYg5b7cn
	wm80lwhYKryoKpV2g6fMXEZQTanY73kTTq357q/pYqMvFAY/7Gv4tqyMqAXs4ykzy/PDoCFfis23e
	GluMhgO13YdmW2kfbHjUnZFgFugMHOqThWCrCGBM6leTEK84n6t02c97wMdQIvfPm4/r0g5oJ9vYU
	U5OlsBbpmmnNbP45KxEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFdch-0000000AhPT-0s1k;
	Wed, 22 Apr 2026 19:52:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFdce-0000000AhOu-06XT
	for linux-riscv@lists.infradead.org;
	Wed, 22 Apr 2026 19:52:33 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776887550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xVBGF+nbrhf38KaRbyHp2NMIEb9Bubh5xq3tZt2H+ww=;
	b=CjYuzCCNzWOFRouWPMxwzPcG+9qwZESG3C2DlUTOe9FoOj556OGIc90Koi11uaFyUcYZpN
	IuhwHT3deFgXCFsHHWrxMr56LTdJ/Z65jdOygnlmheY4DV9Ei0VA/yUrhgUhHarQ+6cOUi
	lmhisUi2Rs1eMjFnU9OQWJCjfEQbgn6SpG0d/vkgxCG4UF+ZHup9JDSgC6nBY4yvgswckU
	LRPv4xzwtLYWossanAQrZgM7+2NOnu2uyAjc07YYy4r0MPky2KuGKjPU1bOqWW5OWa4k7Y
	0TxWyyZ3JstuKzMcpxGSqzxy05eusGimts8Ds3qCdX9QXmMBxvNwyqyPwi+ndg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776887550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xVBGF+nbrhf38KaRbyHp2NMIEb9Bubh5xq3tZt2H+ww=;
	b=ECOitHdOwdqGpRWFbnVAF2GY5zTBTplF1N7YyPEhtObX3/qQ3o8e4eeRAErkoOlr7PiUtv
	AokkrK80QRHIm4Cw==
To: Thorsten Leemhuis <regressions@leemhuis.info>, Uwe =?utf-8?Q?Kleine-K?=
 =?utf-8?Q?=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
Subject: Re: [Patch] PCI/MSI: Handle lack of irqdomain gracefully
In-Reply-To: <30a50474-a2e4-4b0e-be8c-8050b0356db9@leemhuis.info>
References: <20241213115704.353665-1-alexghiti@rivosinc.com>
 <87v7vn917f.ffs@tglx>
 <CAHVXubiNMp9chdUdvYjiQC2LMhNMMaGEiLMWZ-4RSV54jakP3g@mail.gmail.com>
 <87ed2a8ow5.ffs@tglx> <abE_QoS5DM-ZltaV@monoceros>
 <30a50474-a2e4-4b0e-be8c-8050b0356db9@leemhuis.info>
Date: Wed, 22 Apr 2026 21:52:29 +0200
Message-ID: <87tst222o2.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_125232_203034_E9EDE1A4 
X-CRM114-Status: GOOD (  11.20  )
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
Cc: "Aaron D. Johnson" <debbugreporter@fnord.greeley.co.us>, Alexandre Ghiti <alexghiti@rivosinc.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 1127635@bugs.debian.org, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <helgaas@kernel.org>, linux-riscv@lists.infradead.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBBcHIgMjIgMjAyNiBhdCAxMDo1MCwgVGhvcnN0ZW4gTGVlbWh1aXMgd3JvdGU6Cj4g
T24gMy8xMS8yNiAxMjoyMiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4+IENvbnRyb2w6IGZv
cndhcmRlZCAtMSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL2FiRV9Rb1M1RE0tWmx0YVZA
bW9ub2Nlcm9zCj4+IAo+PiAjcmVnemJvdCBpbnRyb2R1Y2VkOiBhNjBiOTkwNzk4ZWIxNzQzM2Qw
MjgzNzg4MjgwNDIyYjFiZDk0YjE4Cj4KPiBUaG9tYXMsIGluIGNhc2UgeW91IG1pc3NlZCBpdDog
dGhpcyBpcyBhIGNoYW5nZSBvZiB5b3VyczogYTYwYjk5MDc5OGViMTcKPiAoIlBDSS9NU0k6IEhh
bmRsZSBsYWNrIG9mIGlycWRvbWFpbiBncmFjZWZ1bGx5IikgW3Y2LjEzLXJjNV0KClllcy4gVGhh
dCBmZWxsIHRocm91Z2ggdGhlIGNyYWNrcy4KCj4+ICNyZWd6Ym90IGZyb206ICJBYXJvbiBELiBK
b2huc29uIiA8ZGViYnVncmVwb3J0ZXJAZm5vcmQuZ3JlZWxleS5jby51cz4KPj4gI3JlZ3pib3Qg
bW9uaXRvcjogaHR0cHM6Ly9idWdzLmRlYmlhbi5vcmcvMTEyNzYzNQo+Cj4gVGh4IGZvciBmb3J3
YXJkaW5nIHRoZSByZWdyZXNzaW9uLiBOb3RoaW5nIGhhcHBlbmVkIHNpbmNlIHRoZW4gLS0gb3Ig
YW0KPiBJIG1pc3Npbmcgc29tZXRoaW5nPyBJZiBzbzogaXMgdGhhdCBva2F5IGZvciBldmVyeWJv
ZHksIG9yIHNob3VsZCB3ZSBkbwo+IGFueXRoaW5nIGFib3V0IHRoaXM/Cj4KPiBCVFcsIGRpZCBh
bnlvbmUgY2hlY2sgaWYgdGhpcyBoYXBwZW5zIHdpdGggbWFpbmxpbmUgKDYuMTMvNy4wKSBhcyB3
ZWxsCj4gdG8gcnVsZSBvdXQgdGhhdCB0aGlzIGlzIHNvbWV0aGluZyB0aGF0IG9ubHkgaGFwcGVu
ZW5zIGluIHRoZSBzdGFibGUKPiBzZXJpZXMgaXQgd2FzIGJhY2twb3J0ZWQgdG9vPyBJZiBpdCdz
IHRoZSBsYXR0ZXIgSSB3b25kZXIgaWYgcmV2ZXJ0aW5nCj4gaXQgdGhlcmUgbWlnaHQgYmUgYSBl
YXN5IHdheSB0byByZXNvbHZlIHRoaXMuCgpMZXQgbWUgaGF2ZSBhIGxvb2suCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
