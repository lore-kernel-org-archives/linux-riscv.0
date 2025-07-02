Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AC6C83013
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 12:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/zPRsagRQPEbEeycu7kgnmCuEjXoCEbYQ676fAKeJXE=; b=gagUU9oFefzm4+
	fhaR5oQo4+RaulDlAQ0j7h9oAwETS7lFHVGo5Q631ruDimuIRQoA98a/dwA51U4YZjX43sELMWPM3
	rLi7+1fQwF2M7xcqUuWoA2cOCMUH5/VSMN7nzP1eqS+7rgXCpQFCz+ZijcmDtiadh+UPOd3ZhSVhZ
	KdqjH88ifiqxtNKYsqyAPVzEqG+xA9UgK4j403hagY38tl64XwcYGUFngy/CkqbnNrV3nIdwBDaeP
	M73iJvS+aMW8olgefIHIpK+Afk+hRXfeiCq0vgd2yAnb7p55tYjuV4al0dn7wDQ3371VaoZcsXo9h
	3sQY1CZayq+3IbWyo7hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwCb-00000008F2R-3EDj;
	Wed, 02 Jul 2025 12:04:37 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvGe-000000084Jw-2MoF
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 11:04:45 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5550dca1241so4330266e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 04:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751454282; x=1752059082; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIO4kRErh11jy7TmCP0YkdztWKE/kaiytblz1fDz4a0=;
        b=hN2Q/D68Eo5oDc9dpKuGWGmuWa5vlgu5zIrAahJuPT17NWBoAh0l9mJ8eMV9AKm5KA
         ID57KiofYwq5NOj3y9zRijiFIyMEOchx2wyVsWN4o7jVOKP+cevF0czK8UqwkDI17HCE
         Ly5eDkfSrnsYY2IW8C8XJMZHiwhCSDWYERbEAebhyKG0Lw5RdTCBYsVMEu3kcrruh55O
         04zI1Lw2Y3IaM6Fu9bUIu9jpakNDDbj0SrXSo2Kr61skTrxtwo+vd/wsBYhzms3ucrPP
         wSiB33OIcnbfItKwb4yM12HjQn0JwmW1kAYpDq/ypFNBE/4p1v128roMU0JYjC1s+bAS
         NIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751454282; x=1752059082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIO4kRErh11jy7TmCP0YkdztWKE/kaiytblz1fDz4a0=;
        b=aTQPgrQiAtXCjh/rjAtWWKEAIbmrWfYwLbIRdipFPuy87a69GUken7XMiccjA8ibjE
         avkB8Jk3HvzR5/X7hMVVb6kQVnpZCNrsm3c+xjTp/3d52bHd4XcpYaBg5geW9TkgQ2ZR
         VETZ50EO3lMF5rnV4zFQ/TjKLmLO2rq2dOb/ZRhvGYMvgS7O8vMNb7MgLkvpqny0b9VF
         pZUv8vG+N3Q+gFQlhMlmBUh4c4xzf2vDrGl3IgmpUPztTbHrjmvTikgNbXbVZzdS0eMK
         /JH3d7bFsXCUQtwew5D+1IgaKd5aK+BEYiWWIiyl9ondpjRMpBfzzoppj0nrqkgKREqk
         Q75g==
X-Forwarded-Encrypted: i=1; AJvYcCVvTdpB7O7re6Y5czZmBa3uK31/6gotLxZ8jNAreWzUAapFN7Ep23o8e3ISL4oeY5kxYt+2ERDZqbWK4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUSwMdTXJ1N2vM03GO0RW1PTbfTDL3TcScHjBT+qZRTG8ItQ8k
	RkSl9n42D9Ws/cIeRvFoS2wUaEwH46/qeRAwkut6vBjJu3cIZZD4Lm0RmviTQecoAxFNYPIWLwC
	W002p5YDuQygtbk3j3bpjDUDg249dJfC1i5Gpcw6Uvw==
X-Gm-Gg: ASbGnct/hx/ui1nFpJH14TlkJUXG7VT2e5LP0v6Qt/URqpW3r1+IlZS1AQaUG09My2R
	C+K+jZ46OsszRkezmG1UhGlyGdQnpI8pdbH+VkX33DHjPDGvmHFcIQpl4pyQm/aNaF23jhD/8aJ
	sQ8z8zfqttPWIRrX4U2zGKCF+6vxAA/kieNJxyV8unaX0+
X-Google-Smtp-Source: AGHT+IGSDJNqIbDFzqak4r2BGWXjw343zIhJGh0HVunBXOW/GFwnNwsW8KCXGLfWRyUIYjnvV9Y3uHTO0FTpSpd8arQ=
X-Received: by 2002:a05:6512:33c3:b0:553:3621:efee with SMTP id
 2adb3069b0e04-55628376b73mr910658e87.50.1751454282296; Wed, 02 Jul 2025
 04:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250625161715.1003948-1-apatel@ventanamicro.com>
 <87wm8tmcsr.ffs@tglx> <CAK9=C2Ue36iF8X17n-D70BkMk69bGKb+8dSmro6SEo5i2d+OSg@mail.gmail.com>
 <87ikkcmkje.ffs@tglx>
In-Reply-To: <87ikkcmkje.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 2 Jul 2025 16:34:29 +0530
X-Gm-Features: Ac12FXxlQtBoP2wnUwftAZfKRl4x57RrJbhO7WA0tbv3mASPe9I66ZZKjnYy204
Message-ID: <CAK9=C2U7Ze=q12N+_MM5c+nsJEBkuCoHs-GUsM0qdfVSyR2QVQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip: riscv-imsic: Add kernel parameter to disable IPIs
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_040444_611530_59AABAAD 
X-CRM114-Status: GOOD (  23.76  )
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

T24gVHVlLCBKdWwgMSwgMjAyNSBhdCAxOjA04oCvUE0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxp
bnV0cm9uaXguZGU+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdWwgMDEgMjAyNSBhdCAxMjowMCwgQW51
cCBQYXRlbCB3cm90ZToKPiA+IE9uIE1vbiwgSnVuIDMwLCAyMDI1IGF0IDk6MznigK9QTSBUaG9t
YXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4gd3JvdGU6Cj4gPj4gPiBXaGVuIGluamVj
dGluZyBJUElzIHRvIGEgc2V0IG9mIGhhcnRzLCB0aGUgSU1TSUMgSVBJIHN1cHBvcnQgd2lsbAo+
ID4+ID4gZG8gYSBzZXBhcmF0ZSBNTUlPIHdyaXRlIHRvIFNFVElQTlVNX0xFIHJlZ2lzdGVyIG9m
IGVhY2ggdGFyZ2V0Cj4gPj4gPiBoYXJ0LiBUaGlzIG1lYW5zIG9uIGEgcGxhdGZvcm0gd2hlcmUg
SU1TSUMgaXMgdHJhcC1uLWVtdWxhdGVkLAo+ID4+ID4gdGhlcmUgd2lsbCBiZSBOIE1NSU8gdHJh
cHMgd2hlbiBpbmplY3RpbmcgSVBJIHRvIE4gdGFyZ2V0IGhhcnRzCj4gPj4gPiBoZW5jZSBJUElz
IGJhc2VkIG9uIElNU0lDIHNvZnR3YXJlIGluamVjdGVkIE1TSSBpcyBzbG93IGNvbXBhcmVkCj4g
Pj4gPiB0byB0aGUgU0JJIElQSSBleHRlbnNpb24uCj4gPj4gPgo+ID4+ID4gQWRkIGEga2VybmVs
IHBhcmFtZXRlciB0byBkaXNhYmxlIElQSXMgaW4gSU1TSUMgZHJpdmVyIGZvciBwbGF0Zm9ybXMK
PiA+PiA+IHdpdGggdHJhcC1uLWVtdWxhdGVkIElNU0lDLgo+ID4+Cj4gPj4gV2h5IGRvIHlvdSBu
ZWVkIGEga2VybmVsIHBhcmFtZXRlciBmb3IgdGhhdC4gSWYgdGhlIHBsYXRmb3JtIHVzZXMgdHJh
cC1uCj4gPj4gZW11bGF0aW9uLCB0aGVuIGRpc2FibGUgdGhlIElQSSBtdWNrIGF1dG9tYXRpY2Fs
bHksIG5vPwo+ID4+Cj4gPiBVbmZvcnR1bmF0ZWx5LCB3ZSBkb24ndCBoYXZlIERULCBBQ1BJLCBv
ciBhbnkgb3RoZXIgd2F5IG9mIGRpc2NvdmVyaW5nCj4gPiB3aGV0aGVyIHVuZGVybHlpbmcgSU1T
SUMgaXMgdHJhcC1uLWVtdWxhdGVkLiBJbiBmYWN0LCB0aGUgRFQgb3IgQUNQSQo+ID4gcGFzc2Vk
IHRvIGEgS1ZNIEd1ZXN0IGlzIHRoZSBzYW1lIGlycmVzcGVjdGl2ZSBvZiB3aGV0aGVyIHVuZGVy
bHlpbmcKPiA+IElNU0lDIGlzIHRyYXAtbi1lbXVsYXRlZCBvciBiYWNrZWQgYnkgaGFyZHdhcmUg
SU1TSUMgVlMtZmlsZS4KPgo+IFNpZ2guCj4KPiA+IFVzaW5nIHNvZnR3YXJlIGluamVjdGVkIE1T
SXMgYXMgSVBJcyBpcyBwdXJlbHkgYSBzb2Z0d2FyZSBjaG9pY2UgaW4gdGhlCj4gPiBJTVNJQyBk
cml2ZXIgc28gdGhpcyBuZXcga2VybmVsIHBhcmFtZXRlciBhbGxvd3MgdXNlcnMgdG8gb3ZlcnJp
ZGUgaXQuCj4KPiBQbGVhc2UgYWRkIHRoYXQgaW5mb3JtYXRpb24gdG8gdGhlIGNoYW5nZSBsb2cu
Cj4KCk9rYXksIEkgd2lsbCBhZGQgdGhlc2UgZGV0YWlscyB0byB0aGUgcGF0Y2ggZGVzY3JpcHRp
b24uCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
