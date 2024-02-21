Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE7FC48BF6
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 12:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXbFJk8xgPGpXFyzbhaaTqtKGGoeBn1EQv+8uG9A94g=; b=DRQEpGdw+Z3T6Z
	VBjw2OJSjS+bmN3Bx7dm+5ICHH3C16d0S2s+FUK7Q6ZXat018ZJEkexQrqTUz94+23P/LIJ2Yuxdm
	RDd5GZYc8Pks8xDR/4dteb52w2dB7HNNB/bZSgloCVaInTeL4kDKiZJnMyJbkZd8qm3oybeluvCH2
	AQ4jfsy/6EGbQ7hddORWx9LQ+RgWZuVkogI+7UF+/pc/qmZYCAPn4jI3yDh7+RjNG5Kcpx1jVNuI5
	kUOUUStQDgHXnlchBWve8LzGOGTlUtnJa8M5WH9z8MG//Ho6pbvkQ88RM9DbtDtuaSDvq3JYVTAfM
	9ki8w/F02EkXDBsJtgvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcle7-00000000pWj-3nld;
	Wed, 21 Feb 2024 12:24:19 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcle3-00000000pVs-30q1
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 12:24:17 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2d208d0b282so87630621fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 04:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708518253; x=1709123053; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUIme5qeYaRlhQNYTF01QINk6od2pxuGi3LOwUcjfkA=;
        b=TJR5jERw+P+u58W7aMm86dqXDLTDTydVngG2VZvGyaSum0yPL472xE6EBqoQy12Y3q
         1GOqW1g0JwjO7RF2zxahJSue85Zf9UGVSfOr8B4dnllZ5ZnoakiAd06r5SI5qVvcMuWi
         Ry4CPufHX1zITBAS4luBNgn1p/DmUPjehYLrXpI6u6HZM4UgnkqhsQGOJivJnd0CVAm0
         2a2F+f1MlnNDUzTzA0QLxe5+/RHmjYETclHkpB5Q7c/Y427Z8zY+H39K8UeyltYvwP4V
         /LyZqgMY7aaDrH/5uHeJTEJW6OJDMKpwTYF5Jw1aQRgN6m+0I89TTdPobVGi0n+6mzPt
         t/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708518253; x=1709123053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUIme5qeYaRlhQNYTF01QINk6od2pxuGi3LOwUcjfkA=;
        b=a+8ls3gEHGwnalIZKQbJfWK31FYP6EJzS6SMnU7AxRoHi6TkPYPI4dLPevfF/FqVSg
         7mhQxrpgoYsp5fNd0YU4cNt67YyIY1MOvzU8LzPHHr5neW48K8D/bNOqIW5vp1vtFByb
         kXPyqb2uuudP3CpLMV7JSmf+PHE5GbCpVq47gzQUdcpOzh41AckH+Pk8RUgANWzadxEA
         nwFLM8QrL4yit1A5nyv6frD2ZxOuTBrJ7RyTDwFlUkA+354o4/XLhTccmuskOmudoVKf
         6wtAQo/zQ2FytkOreIRievTHkxPYdob8qofsxYjOfuDwPJQWaptp1vog8oukMDXAQkCo
         1vgA==
X-Forwarded-Encrypted: i=1; AJvYcCWpLGOUO61i4bqpJxIYqCFjqBVViXXC8ynDttCHDMF5tf1Q7tPtbHaYw5smUTsUQ0u1KSpeNaBtKyDvGp+q4lEe+aVPqCRhzL4RZAKGuYyU
X-Gm-Message-State: AOJu0YycCCYs2vExEt+foQZL86pnYlY5jz8fxBHhOBilKwSL0o50cfMO
	o9AyyPYTwhtfBq8dnzPHQ7q5aKgHP9fPKnfLFhA3gBuK2cqWeB+qUEluAy3BaIyjDX+NPKnZ5vb
	t2DCbHXuz/wm/Xvnbi/EAWLSbg15l0DiaNyH/jA==
X-Google-Smtp-Source: AGHT+IFIxepuQGxN+D9Kb9NUEDtcnq9gYao5N75v/vr0R/M/KZgmlpI69G1EL4fA7jCM0aZSkXlefLh6DeZwv/4hvLg=
X-Received: by 2002:a2e:9c84:0:b0:2d2:3ac4:d6e0 with SMTP id
 x4-20020a2e9c84000000b002d23ac4d6e0mr5799393lji.31.1708518253341; Wed, 21 Feb
 2024 04:24:13 -0800 (PST)
MIME-Version: 1.0
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-7-apatel@ventanamicro.com> <87frxnfj3p.fsf@all.your.base.are.belong.to.us>
 <CAK9=C2Xnzg3KAVETXN+ZGLWhVtaJuU4uXs3WH2ZondkBJMHFcA@mail.gmail.com> <874je2yqn9.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <874je2yqn9.fsf@all.your.base.are.belong.to.us>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 21 Feb 2024 17:53:59 +0530
Message-ID: <CAK9=C2WXR49KZg3rstChqAHda+hUhPm3AEo6o2jh0NM3kvoSUA@mail.gmail.com>
Subject: Re: [PATCH v13 06/13] irqchip: Add RISC-V incoming MSI controller
 early driver
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_042415_791581_9E6B1DC1 
X-CRM114-Status: GOOD (  32.49  )
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

T24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgNToyOeKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+
IHdyaXRlczoKPgo+ID4+ID4gK3ZvaWQgaW1zaWNfdmVjdG9yX21hc2soc3RydWN0IGltc2ljX3Zl
Y3RvciAqdmVjKQo+ID4+ID4gK3sKPiA+PiA+ICsgICAgIHN0cnVjdCBpbXNpY19sb2NhbF9wcml2
ICpscHJpdjsKPiA+PiA+ICsKPiA+PiA+ICsgICAgIGxwcml2ID0gcGVyX2NwdV9wdHIoaW1zaWMt
Pmxwcml2LCB2ZWMtPmNwdSk7Cj4gPj4gPiArICAgICBpZiAoV0FSTl9PTigmbHByaXYtPnZlY3Rv
cnNbdmVjLT5sb2NhbF9pZF0gIT0gdmVjKSkKPiA+PiA+ICsgICAgICAgICAgICAgcmV0dXJuOwo+
ID4+ID4gKwo+ID4+ID4gKyAgICAgLyoKPiA+PiA+ICsgICAgICAqIFRoaXMgZnVuY3Rpb24gaXMg
Y2FsbGVkIHRocm91Z2ggTGludXggaXJxIHN1YnN5c3RlbSB3aXRoCj4gPj4gPiArICAgICAgKiBp
cnFzIGRpc2FibGVkIHNvIG5vIG5lZWQgdG8gc2F2ZS9yZXN0b3JlIGlycSBmbGFncy4KPiA+PiA+
ICsgICAgICAqLwo+ID4+ID4gKwo+ID4+ID4gKyAgICAgcmF3X3NwaW5fbG9jaygmbHByaXYtPmxv
Y2spOwo+ID4+ID4gKwo+ID4+ID4gKyAgICAgdmVjLT5lbmFibGUgPSBmYWxzZTsKPiA+PiA+ICsg
ICAgIGJpdG1hcF9zZXQobHByaXYtPmRpcnR5X2JpdG1hcCwgdmVjLT5sb2NhbF9pZCwgMSk7Cj4g
Pj4gPiArICAgICBfX2ltc2ljX3JlbW90ZV9zeW5jKGxwcml2LCB2ZWMtPmNwdSk7Cj4gPj4gPiAr
Cj4gPj4gPiArICAgICByYXdfc3Bpbl91bmxvY2soJmxwcml2LT5sb2NrKTsKPiA+PiA+ICt9Cj4g
Pj4KPiA+PiBSZWFsbHkgbmljZSB0aGF0IHlvdSdyZSB1c2luZyBhIHRpbWVyIGZvciB0aGUgdmVj
dG9yIGFmZmluaXR5IGNoYW5nZSwKPiA+PiBhbmQgZ290IHJpZCBvZiB0aGUgc3BlY2lhbC93ZWly
ZCBJTVNJQy9zeW5jIElQSS4gQ2FuIHlvdSByZWFsbHkgdXNlIGEKPiA+PiB0aW1lciBmb3IgbWFz
ay91bm1hc2s/IFRoYXQgbWFrZXMgdGhlIG1hc2svdW5tYXNrIG9wZXJhdGlvbgo+ID4+IGFzeW5j
aHJvbm91cyEKPiA+Pgo+ID4+IFRoYXQgd2FzIHdoYXQgSSB3YXMgdHJ5aW5nIHRvIGdldCB0aG91
Z2ggd2l0aCB0aGlzIGNvbW1lbnQ6Cj4gPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmlzY3YvODdzZjI0bW8xZy5mc2ZAYWxsLnlvdXIuYmFzZS5hcmUuYmVsb25nLnRvLnVzLwo+ID4+
Cj4gPj4gQWxzbywgdXNpbmcgdGhlIHNtcF8qIElQSSBmdW5jdGlvbnMsIHlvdSBjYW4gcGFzcyBh
cmd1bWVudHMsIHNvIHlvdQo+ID4+IGRvbid0IG5lZWQgdGhlIGRpcnR5X2JpdG1hcCB0cmFja2lu
ZyB0aGUgY2hhbmdlcy4KPiA+Cj4gPiBUaGUgbWFzay91bm1hc2sgb3BlcmF0aW9ucyBhcmUgY2Fs
bGVkIHdpdGggaXJxcyBkaXNhYmxlZCBzbyBpZgo+ID4gQ1BVIFggZG9lcyBzeW5jaHJvbm91cyBJ
UEkgdG8gYW5vdGhlciBDUFUgWSBmcm9tIG1hc2svdW5tYXNrCj4gPiBvcGVyYXRpb24gdGhlbiB3
aGlsZSBDUFUgWCBpcyB3YWl0aW5nIGZvciBJUEkgdG8gY29tcGxldGUgaXQgY2Fubm90Cj4gPiBy
ZWNlaXZlIElQSSBmcm9tIG90aGVyIENQVXMgd2hpY2ggY2FuIGxlYWQgdG8gY3Jhc2hlcyBhbmQg
c3RhbGxzLgo+ID4KPiA+IEluIGdlbmVyYWwsIHdlIHNob3VsZCBub3QgZG8gYW55IGJsb2NrL2J1
c3ktd2FpdCB3b3JrIGluCj4gPiBtYXNrL3VubWFzayBvcGVyYXRpb24gb2YgYW4gaXJxY2hpcCBk
cml2ZXIuCj4KPiBIbW0sIE9LLiBTdGlsbCwgYSBiaXQgb2RkIHRoYXQgd2hlbiB0aGUgLmlycV9t
YXNrIGNhbGxiYWNrIHJldHVybiwgdGhlCj4gbWFza2luZyBpcyBub3QgYWN0dWFsbHkgY29tcGxl
dGVkLgo+Cj4gMS4gQ1BVIDAgdHJpZXMgdG8gbWFzayBhbiBpbnRlcnJ1cHQgdHJpZWQgdG8gQ1BV
IDEuCj4gMi4gVGhlIHRpbWVyIGlzIHF1ZXVlZCBvbiBDUFUgMS4KPiAzLiBUaGUgY2FsbCBpcnFf
bWFzayByZXR1cm5zIG9uIENQVSAwCj4gNC4gLi4udGhlIGlycSBpcyBtYXNrZWQgYXQgc29tZSBm
dXR1cmUgcG9pbnQsIGRldGVybWluZWQgYnkgdGhlIGNhbGxiYWNrCj4gICAgYXQgQ1BVIDEKPgo+
IElzIHRoYXQgdGhlIGV4cGVjdGVkIG91dGNvbWU/CgpZZXMsIHRoYXQncyByaWdodC4KCj4KPiBU
aGVyZSBhcmUgLmlycV9tYXNrIGltcGxlbWVudGF0aW9uIHRoYXQgZG9lcyBzZWVtIHRvIGdvIGF0
IGxlbmd0aAo+IChibG9ja2luZykgdG8gcGVyZm9ybSB0aGUgbWFzaywgZS5nLjogZ2ljX21hc2tf
aXJxKCkgd2hpY2ggY2FsbHMKPiBnaWNfe3JlLH1kaXN0X3dhaXRfZm9yX3J3cCB0aGF0IGhhdmUg
c2xlZXAvcmV0cnkgbG9vcHMuIFRoZSBHSUMzIElUUwo+IGNvZGUgaGFzIHNpbWlsYXIgdGhpbmdz
IGdvaW5nIG9uLgoKVGhlIGdpY197cmUsfWRpc3Rfd2FpdF9mb3JfcndwKCkgcG9sbHMgb24gYSBI
VyByZWdpc3RlciBmb3IgY29tcGxldGlvbgp3aGljaCB3aWxsIGNlcnRhaW5seSBjb21wbGV0ZSBp
biBhIHByZWRpY3RhYmxlIHRpbWUgd2hlcmVhcyB3YWl0aW5nCmZvciBJUEkgdG8gYmUgZXhlY3V0
ZWQgYnkgYW5vdGhlciBDUFUgaXMgbm90IHByZWRpY3RhYmxlIGFuZCBmcmFnaWxlLgoKPgo+IEkn
bSBub3Qgc2F5aW5nIHlvdSdyZSB3cm9uZywgSSdtIGp1c3QgdHJ5aW5nIHRvIHdyYXAgbXkgaGVh
ZCBhcm91bmQgdGhlCj4gbWFza2luZyBzZW1hbnRpY3MuCj4KPiA+IFRoZSBBSUEgSU1TSUMgc3Bl
YyBhbGxvd3Mgc2V0dGluZyBJRCBwZW5kaW5nIGJpdCB1c2luZyBNU0kgd3JpdGUKPiA+IGlycmVz
cGVjdGl2ZSB3aGV0aGVyIElEIGlzIGVuYWJsZWQgb3Igbm90IGJ1dCB0aGUgaW50ZXJydXB0IHdp
bGwgYmUKPiA+IHRha2VuIG9ubHkgYWZ0ZXIgSUQgaXMgZW5hYmxlZC4gSW4gb3RoZXIgd29yZHMs
IHRoZXJlIHdpbGwgYmUgbm8KPiA+IGxvc3Mgb2YgaW50ZXJydXB0IHdpdGggZGVsYXllZCBtYXNr
L3VubWFzayB1c2luZyBhc3luYyBJUEkgb3IKPiA+IGxhenkgdGltZXIuCj4KPiBObyBsb3NzLCBi
dXQgd2UgbWlnaHQgKmdldCogYW4gaW50ZXJydXB0IHdoZW4gd2UgZXhwbGljaXRseSBhc2tlZCBu
b3QgdG8KPiBnZXQgYW55LiBNYXliZSB0aGF0J3Mgb2s/Cj4KClRoZSBkZWxheWVkIHNwdXJpb3Vz
IGludGVycnVwdCBhZnRlciBtYXNraW5nIGlzIGF2b2lkZWQgYnkgYWRkaXRpb25hbAptYXNraW5n
IGF0IHRoZSBzb3VyY2Ugb2YgaW50ZXJydXB0LiBGb3Igd2lyZWQtdG8tTVNJIGludGVycnVwdHMs
IHdlIGhhdmUKYWRkaXRpb25hbCBtYXNraW5nIG9uIHRoZSBBUExJQyBNU0ktbW9kZS4gRm9yIFBD
SSBNU0kgaW50ZXJydXB0cywgd2UKaGF2ZSBhZGRpdGlvbmFsIG1hc2tpbmcgYXQgUENJIGRldmlj
ZSBsZXZlbCB1c2luZyBwY2lfbXNpX21hc2tfaXJxKCkuCgpSZWdhcmRzLApBbnVwCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
