Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B9CC77B73
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 15:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ob9tAj/kG9uylG+rfi/lFoigrT8lC4Lds9dllod5laQ=; b=sEj+XYBBROIPko
	TSBotL8xWl7FhJeVxvw5JYqnJ6gzabkFnjmYoIV3n5EoPIUBUTb+FreEH9cyQMGFmbEYIM8yp3cMl
	KZFWth/HtIkbjU9wrK0+DiQhW/ldKaHfuywnu33DcoiW5j2pn4ZnYrfzwBaOCh2Hs6ptJjo8egu5R
	LdyJ+5ukG+cnJQaLumuxnpaCU6hP/xemkZFXGPZZ1O0vtYGhLeg5ZnIdq9yTpJHupXC5nghooUV/Z
	WSLz1olcZnWi/cBLQ6yj0f07dg9aJCVJ1sxeZ7jw3Hq6wDGeKz117Yhqna49zjKSCrwxCtdAXddUA
	RlnvLCaih1Cxdd4H/PVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0l8S-0046N9-3B;
	Sun, 21 May 2023 15:38:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0l8Q-0046Mm-1M
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 15:38:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 980F4611E4
	for <linux-riscv@lists.infradead.org>; Sun, 21 May 2023 15:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF48C433A1
	for <linux-riscv@lists.infradead.org>; Sun, 21 May 2023 15:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684683492;
	bh=rsSKWKgzrdYi2+QrzmaBdQMUeBWsskCgLQSydAupoTA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uO1GsGo6L8h0keFRtS8rfzjy3kjMJN12IyX/tV/BWBNWgkWDAh4ufpzSqF0hEPSW1
	 lJEJFKwx0dF9JqLZafqpRwygl1/nxMl7kbcw9nXfyBWdUn8mgnh31yD13JrXCLGFAD
	 DvolpFOy7wpNBlxsigCOnewvM2xTjHqForyrY9HgctdCvJhlsUD0uq75t6qV5ojZLQ
	 3N1fQ+GgmFy/c9RI5+6aDex3ASQ9AOyRTHPTSKDMg90hizw19K1aILfAYLwZSUBX8G
	 tE2cJtTHoyOLd6tHoqJrQw20YTspRPIsNo5R0Gtlatnud0yLI5GLHU1huuPnOw3njx
	 iL9twuwm8cLsg==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-96fbe7fbdd4so128320066b.3
        for <linux-riscv@lists.infradead.org>; Sun, 21 May 2023 08:38:11 -0700 (PDT)
X-Gm-Message-State: AC+VfDxDkw6ew5yl0/6fVKqPP6MmeLsgJV87YPVzsJF1sdQRqv1G4AcW
	Ksn2tHguapL6HBUmeuvdXwQmzdICdyEnYYBT1h4=
X-Google-Smtp-Source: ACHHUZ5CViNXL356WnB7eKprukgeq44eBPyn5myooMQtHmUvgxxC0NILsR5aCx0KAsnQjkJfL90u7zWhy3vKUUMJml8=
X-Received: by 2002:a17:907:26c3:b0:94f:2a13:4e01 with SMTP id
 bp3-20020a17090726c300b0094f2a134e01mr7498092ejc.74.1684683490097; Sun, 21
 May 2023 08:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230507182304.2934-1-jszhang@kernel.org> <20230507182304.2934-4-jszhang@kernel.org>
 <20230507-calamari-gentleman-bbe62af06f92@spud> <ZFkiotPacIMUghDP@xhacker> <20230508-unmoved-unvocal-9a6c5fc0c629@spud>
In-Reply-To: <20230508-unmoved-unvocal-9a6c5fc0c629@spud>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 21 May 2023 23:37:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSFm32ozEDy_3zvrf05USJ8FxCsaGK-2FbkJQsPUDQXmA@mail.gmail.com>
Message-ID: <CAJF2gTSFm32ozEDy_3zvrf05USJ8FxCsaGK-2FbkJQsPUDQXmA@mail.gmail.com>
Subject: Re: [PATCH 3/5] riscv: dts: add initial T-HEAD light SoC device tree
To: Conor Dooley <conor@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, heiko@sntech.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_083814_546386_F215F26A 
X-CRM114-Status: GOOD (  22.21  )
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

T24gVHVlLCBNYXkgOSwgMjAyMyBhdCAxMjo0NOKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAwOSwgMjAyMyBhdCAxMjoyNjoxMEFNICsw
ODAwLCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+ID4gT24gU3VuLCBNYXkgMDcsIDIwMjMgYXQgMTA6
MzU6MTJQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiBPbiBNb24sIE1heSAwOCwg
MjAyMyBhdCAwMjoyMzowMkFNICswODAwLCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+ID4gPgo+ID4g
PiA+ICsgICAgICAgICBjOTEwXzA6IGNwdUAwIHsKPiA+ID4gPiArICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gInRoZWFkLGM5MTAiLCAicmlzY3YiOwo+ID4gPiA+ICsgICAgICAgICAgICAg
ICAgIGRldmljZV90eXBlID0gImNwdSI7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgcmlzY3Ys
aXNhID0gInJ2NjRpbWFmZGMiOwo+ID4gPgo+ID4gPiBEb2VzIHRoaXMgc3VwcG9ydCBtb3JlIHRo
YW4gInJ2NjRpbWFmZGMiPwo+ID4gPiBJIGFzc3VtZSB0aGVyZSdzIHNvbWUgX3h0aGVhZGZvbyBl
eHRlbnNpb25zIHRoYXQgaXQgZG9lcyBzdXBwb3J0LAo+ID4gPiBhbHRob3VnaCBJIGFtIG5vdCBz
dXJlIGhvdyB3ZSBhcmUgcHJvY2VlZGluZyB3aXRoIHRob3NlIC0gSGVpa28gbWlnaHQKPiA+ID4g
aGF2ZSBhIG1vcmUgbnVhbmNlZCB0YWtlLgo+ID4gPgo+ID4gPiA+ICsgICAgICAgICByZXNldDog
cmVzZXQtc2FtcGxlIHsKPiA+ID4gPiArICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInRo
ZWFkLHJlc2V0LXNhbXBsZSI7Cj4gPiA+Cj4gPiA+IFdoYXQgaXMgYSAicmVzZXQtc2FtcGxlIj8K
PiA+Cj4gPiBUaGlzIG5vZGUgaXMgb25seSBmb3Igb3BlbnNiaS4gVGhlIGNvbXBhdGlibGUgc3Ry
aW5nIGlzIGFscmVhZHkgaW4KPiA+IG9wZW5zYmkuIERvIHdlIGFsc28gbmVlZCB0byBhZGQgZHQt
YmluZGluZyBmb3IgaXQgaW4gbGludXg/Cj4KPiBJZiBpdCdzIHRvIGJlIGluY2x1ZGVkIGluIHRo
ZSBrZXJuZWwncyBkdHMsIHRoZW4geWVzLCB5b3UgZG8gbmVlZCBhCj4gZHQtYmluZGluZy4gSWYg
eW91IHJlbW92ZSBpdCwgdGhlbiB5b3UgZG9uJ3QgOikKPgo+IFRoYXQgc2FpZCwgInRoZWFkLHJl
c2V0LXNhbXBsZSIgaXMgYSBzdHJhbmdlbHkgbmFtZWQgY29tcGF0aWJsZSwgc28gaWYKPiB5b3Ug
ZG8ga2VlcCBpdCBpdCBtYXkgZW5kIHVwIG5lZWRpbmcgYSByZW5hbWUhCkhvdyBhYm91dCBjb21w
YXRpYmxlID0gInRoZWFkLHJlc2V0LXRoMTUyMCIgPwoKPgo+IENoZWVycywKPiBDb25vci4KPgoK
Ci0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
