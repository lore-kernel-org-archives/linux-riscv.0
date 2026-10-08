Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CFACA600A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 07:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WnALTJuU+bwtWbywHUMrM7jEACEtCW8eWDHZCj8N1gQ=; b=gHZq7P9UVCJw7t
	QL4H+DUUBvNx9Sun4NQWZoRsY1vyGKUXa/tkNY7ZF5jLaWWWz25Bilc3AC+gtUrMJNrqEdJLSxEhX
	tHgXqGM1SkjBqhZllLo6PoAbXQ1IwemE1kDxX71jnJEC2ZSt32EwvvMrWIwp03HeynIO5kZmW0eaR
	/FOMcyDsrwr0Lq6tYXU32tqcGuDzilk3dFFNqw7qBddZ56ZpoWBnkyJZ0XJixH1q5j56hwyCSFMDg
	d3OoVsAnJCgVkxVcYkCq2OQkCI/Crov+tc8xSTTfc8Y/oCu6VKfaVuhkxhOCrDW0xrEShUWmVhaXU
	u3YkgH5fb1TGDa998GkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiCW-00000003hNO-0zmY;
	Thu, 08 Oct 2026 07:06:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiCV-00000003hNE-0N2c
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 07:05:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DE7BA601F9
	for <linux-riscv@lists.infradead.org>; Thu,  8 Oct 2026 07:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905CE1F000FF
	for <linux-riscv@lists.infradead.org>; Thu,  8 Oct 2026 07:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791443157;
	bh=7RVIAn66HRCraiUM72IrINA9AXT9I9GJcBky7xKAoTc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O1LkijrtSQ7kpPs5XJShC1SUzOda49DYOcDVEgSui5xTwacgtT4QnWa3rR5Gfuo2g
	 TW/bPG++0ILtWVFkViQFj17O07cT+wLBfxSWh8Gqco+CigLxDUrunPOxIX0k0X3Q93
	 wdrNOvFtpCZjYQ3K2fmWum1P0pF5dSiwnEfG9DoTLxx/hAlrNBVafFcV4KN6dfBhOr
	 yqUnIfvsQwdfJae5RuEeuYYGJtDPJvR3rN/UdYpCZzzg6ygnGttDvPJ1eSmxVU43x9
	 MmVdO3EGbxlJRnLZ7snLtA2Ntypsay6HF6rO6iIM6fi06aPXdKF68yaGhUXomiKp3p
	 ahrbsVIOQoukA==
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49e73611928so2355385e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 00:05:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzDsOJ3UpjbHNRY/q56bHCPMCLJfT21prE68zYf8nsWfOfiEeKqomBvNfeugB6F3DICfx9XzRi65i0Kmw==@lists.infradead.org
X-Gm-Message-State: AFuF++n9cRXrAT8L8WfZb8kETMQ90WKbD7G/ITVlpMJVLR8XoyAo5zYQ
	ajn46wCNuHciYK1P4vwX7fVOtNgViWwgz5gE8LSEz9CQuDOTO5WXzeeihBZsMqWbAKi9x+la8SV
	d+wrJJk+6nJREx4MA7QLq7mD1SlV/hWo=
X-Received: by 2002:a05:600c:3d8f:b0:49e:6581:7baf with SMTP id
 5b1f17b1804b1-4a1851a3ebcmr26672575e9.2.1791443156091; Thu, 08 Oct 2026
 00:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
In-Reply-To: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 8 Oct 2026 15:05:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTQd0mEH_w1e3qTaf6ZeXABfeNo5FT+u8tbtszU8h_ADA@mail.gmail.com>
X-Gm-Features: AclHuK-LtllWkZaK2JqJZIIbCTc7f4mQYjC688eVVYvorAtkBlIlHduDa8O5vKI
Message-ID: <CAJF2gTTQd0mEH_w1e3qTaf6ZeXABfeNo5FT+u8tbtszU8h_ADA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: dts: thead: Add Milk-V Meles support
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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

T24gVGh1LCBPY3QgMSwgMjAyNiBhdCAzOjQ04oCvUE0gSGFuIEdhbyA8Z2FvaGFuQGlzY2FzLmFj
LmNuPiB3cm90ZToKPgo+IE1pbGstViBNZWxlcyBpcyBhIHNpbmdsZS1ib2FyZCBjb21wdXRlciBw
b3dlcmVkIGJ5IFQtSEVBRCdzIFRIMTUyMAo+IFNvQyB3aXRoIGZvdXIgQzkxMCBSSVNDLVYgY29y
ZXMuIEFkZCB0aGUgYm9hcmQgY29tcGF0aWJsZSBhbmQgZGV2aWNlCj4gdHJlZSBmb3IgdGhlIE1p
bGstViBNZWxlcy4KPgo+IEVuYWJsZSBVQVJUMCwgZU1NQywgbWljcm9TRCwgR2lnYWJpdCBFdGhl
cm5ldCBhbmQgdGhlIFBXTSBmYW4sIGFuZAo+IG5hbWUgdGhlIEdQSU8gbGluZXMgZXhwb3NlZCBv
biB0aGUgNDAtcGluIGhlYWRlci4gQWRkIEFQNjI1NiBXaS1GaQo+IHN1cHBvcnQgb3ZlciBTRElP
IGFuZCBlbmFibGUgSERNSSBvdXRwdXQgdGhyb3VnaCB0aGUgREM4MjAwIGRpc3BsYXkKPiBjb250
cm9sbGVyIGFuZCBEVy1IRE1JIHRyYW5zbWl0dGVyLgo+Cj4gQm9hcmQgZGV0YWlsczoKPiBodHRw
czovL21pbGt2LmlvL2RvY3MvbWVsZXMvb3ZlcnZpZXcKPgo+IFNpZ25lZC1vZmYtYnk6IEhhbiBH
YW8gPGdhb2hhbkBpc2Nhcy5hYy5jbj4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+IC0gR3JvdXAg
QmVhZ2xlViBBaGVhZCBhbmQgTWlsay1WIE1lbGVzIGNvbXBhdGlibGVzIGluIGEgY29tbW9uIFRI
MTUyMAo+ICAgZW51bSwgYXMgcmVxdWVzdGVkIGJ5IEtyenlzenRvZiBLb3psb3dza2kuCj4gLSBF
eHBsaWNpdGx5IHNlbGVjdCB0aGUgR1BJTyBmdW5jdGlvbiBmb3IgdGhlIFdpLUZpIGhvc3Qtd2Fr
ZSBwaW4sCj4gICBhcyByZXBvcnRlZCBieSBTYXNoaWtvIGFuZCBjb25maXJtZWQgYnkgRHJldyBG
dXN0aW5pLgo+IC0gQWRkIERyZXcgRnVzdGluaSdzIFJldmlld2VkLWJ5IHRhZ3MgdG8gcGF0Y2hl
cyAyLTQuCj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwOTI5
LXJ2LW1lbGVzLXYxLTAtZWZmZGQxNGE3NmU4QGlzY2FzLmFjLmNuCj4KPiAtLS0KPiBIYW4gR2Fv
ICg0KToKPiAgICAgICBkdC1iaW5kaW5nczogcmlzY3Y6IHRoZWFkOiBhZGQgTWlsay1WIE1lbGVz
Cj4gICAgICAgcmlzY3Y6IGR0czogdGhlYWQ6IGFkZCBNaWxrLVYgTWVsZXMKPiAgICAgICByaXNj
djogZHRzOiB0aGVhZDogZW5hYmxlIEFQNjI1NiBXaS1GaSBvbiBNaWxrLVYgTWVsZXMKPiAgICAg
ICByaXNjdjogZHRzOiB0aGVhZDogZW5hYmxlIEhETUkgb24gTWlsay1WIE1lbGVzCj4KPiAgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3RoZWFkLnlhbWwgfCAgIDYgKy0K
PiAgYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAg
IDEgKwo+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1taWxrdi1tZWxlcy5kdHMg
ICB8IDM0NiArKysrKysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAzNTEgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAtLS0KPiBiYXNlLWNvbW1pdDogNzJkM2ZjZjgw
MmM0NWQwMGIzMDBmMjViODQ4YTkzYzNhMmJkN2M3ZQo+IGNoYW5nZS1pZDogMjAyNjA5MjktcnYt
bWVsZXMtMjVkMTAxNDhkYzBjCj4KPiBCZXN0IHJlZ2FyZHMsCj4gLS0KPiBIYW4gR2FvIDxnYW9o
YW5AaXNjYXMuYWMuY24+Cj4KVGhpcyBzZXJpZXMgbG9va3MgZ29vZCB0byBtZS4KClJldmlld2Vk
LWJ5OiBHVU8gUmVuIChYdWFuVGllKSA8Z3VvcmVuQGtlcm5lbC5vcmc+CgotLSAKQmVzdCBSZWdh
cmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
