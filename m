Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E4EC87FC5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 22:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOET9uL1nz3IuMKuMeA4MB53hP0zCFOToLDoj0pcan8=; b=j88vs81+bLLukB
	/pHoVvBzFN7RyPxYCLCQ7hWNACfPBYtVtKEPmiuu5Nd2+gEnAre/bRZm1mbTieDGGIEjj9EYP2YCf
	FI5HpJJwtxrdhtN+nYtgD3V0H4I30UHkXIaujyxM0hQ10TfUC4aQsfGYA8bKjMA73dNXXoGEzrczJ
	55uR7bFToG2ZnTnw4u5wR/9U4GVWsdnSDNb24PxmmGk3K25LiC2m6tzDaT6/BJTCQczDbarU4EsHt
	An1qh7zz+rY0Jp4h6X/y4l1kfP2EebtHr1S20szEnMrMkHIWVeQN1QbHMapxRy6yg5YGcOMIlmzEb
	jgtlvxhGr3s5MhJkW+4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4SS-00000008b1p-3C20;
	Thu, 24 Jul 2025 22:30:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4Bh-00000008ZD4-1eUS
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 22:13:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 798F060008;
	Thu, 24 Jul 2025 22:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B84C4CEED;
	Thu, 24 Jul 2025 22:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753395196;
	bh=+6PqI7wk8F+44CmUhhhxedAyzpbRRvtFWn62OQCLp1w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DY7//GDAoJpj2q4lePqWYrSLlldprUf9tIydinsX4uqwx73bzmlS0cV1xbN0hexUs
	 IvynkqCBPFhApYmOSbovmvcEAoQycfDjN4O8YrGLVzA0f03hLWQXO9z1kA6wPm1LEj
	 GT7yXWMFxZ//rGYBIhqa6URfEiN4P3eyqmszAVIknnAcD6cxKr4a+XajFjoysUf/sj
	 BPrw4NAnnHpu9G8NEUCQ4/8f8SjP3QpokNsgljANb/M0i2FGWvTfY/AmWz6tFQjaVk
	 lVS0XcnrZabaZTJJLEdqvYEUOwQZN7su3T8oIHZo2jQKl6Tr4+RLrp9qdzgQ9zMbE4
	 hFA7vU/PbEyVQ==
MIME-Version: 1.0
In-Reply-To: <776638cc-cbd9-4747-82eb-e11bcc6c8bdd@zohomail.com>
References: <20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com> <776638cc-cbd9-4747-82eb-e11bcc6c8bdd@zohomail.com>
Subject: Re: [PATCH v6 0/3] riscv: canaan: Add support for K230-Canmv clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>, Troy Mitchell <TroyMitchell988@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, Xukai Wang <kingxukai@zohomail.com>
Date: Thu, 24 Jul 2025 15:13:15 -0700
Message-ID: <175339519523.3513.2798631977806639092@lazor>
User-Agent: alot/0.11
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

UXVvdGluZyBYdWthaSBXYW5nICgyMDI1LTA3LTEzIDA5OjQ4OjQ0KQo+IAo+IEknbSB3b3JraW5n
IG9uIGEgTGludXggY2xvY2sgZHJpdmVyIGFuZCBoYXZlIGVuY291bnRlcmVkIGEgcXVlc3Rpb24K
PiByZWdhcmRpbmcgaG93IHRvIHByb3Blcmx5IHJlcHJlc2VudCBhIHBhcnRpY3VsYXIgdHlwZSBv
ZiBjbG9jayBzb3VyY2UuCj4gCj4gSW4gSzIzMCBTb0MsIHRoZXJlJ3MgYSBtdXggY2xvY2sgd2hv
c2UgcGFyZW50IGNhbiBvcHRpb25hbGx5IGJlIGFuCj4gZXh0ZXJuYWwgcHVsc2Ugc2lnbmFsLCB3
aGljaCBpcyBjb3VudGVkIHZpYSBhIHBpbiAodGhlIGlucHV0IGlzIG5vdAo+IGdlbmVyYXRlZCBp
bnRlcm5hbGx5IGJ1dCBjb21lcyBmcm9tIGFuIGV4dGVybmFsIHNvdXJjZSkuIEnigJltIHdvbmRl
cmluZzoKPiAKPiBTaG91bGQgdGhpcyBleHRlcm5hbCBwdWxzZSBzaWduYWwgYmUgbW9kZWxlZCBh
cyBhIGNsb2NrIHdpdGhpbiB0aGUKPiBDb21tb24gQ2xvY2sgRnJhbWV3b3JrIChDQ0YpPwoKTGlr
ZWx5LCB5ZXMuCgo+IAo+IElmIHNvLCB3aGF0IHdvdWxkIGJlIHRoZSBjb3JyZWN0IHdheSB0byBy
ZWdpc3RlciBvciBkZXNjcmliZSBzdWNoIGEKPiBjbG9jayBpbiB0aGUgZHJpdmVyPwoKSWYgaXQg
aXMgYSBmaXhlZCByYXRlIHB1bHNlIHNpZ25hbCBJIHdvdWxkIHVzZSBhIGZpeGVkIHJhdGUgY2xr
IG5vZGUgYXQKdGhlIHJvb3Qgb2YgdGhlIERUIHRyZWU6CgoJY2xvY2stNTAwMDAgewoJCWNvbXBh
dGlibGUgPSAiZml4ZWQtY2xvY2siOwoJCSNjbG9jay1jZWxscyA9IDwwPjsKCQljbG9jay1mcmVx
dWVuY3kgPSA8NTAwMDA+OwoJfQoKSWYgeW91IG5lZWQgcGluY3RybCBzZXR0aW5ncyB0byBtYWtl
IHRoYXQgY2xrIHdvcmsgeW91IGNhbiBhc3NpZ24gdGhlbQppbiB0aGF0IG5vZGUsIGFsdGhvdWdo
IEkgZG9uJ3Qga25vdyBpZiBJJ3ZlIGV2ZXIgc2VlbiBzdWNoIGEgY2FzZQpiZWZvcmUuIElmIHRo
ZSBleHRlcm5hbCBwYXJlbnQgY2xrIG5lZWRzIHRvIGJlIGdhdGVkIHlvdSdsbCBuZWVkIHRvCndy
aXRlIGEgbW9yZSBmZWF0dXJlZCBkcml2ZXIsIHVubGVzcyBpdCBjYW4gYmUgY29udHJvbGxlZCB3
aXRoIGEgZ3BpbyBvcgpzb21ldGhpbmcgbGlrZSB0aGF0LgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
