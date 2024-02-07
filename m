Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DDCC4828F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 13:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/X/Jn7uqzDrxIPRW8p+mcdbX8JTbXFBboxnft/oiZr8=; b=wpglGEL4Y705Db
	21Wh8gfdSfqDFvPWVqRAFIx17AOnTcTUgniogXL8JAHlYk46EJjZHGCvyYXr1xq0nR2ewwkP+Zd4s
	1z9u71nXDJZp9Vim72/F3KsP5heEOUKJ+SmZCA/dYtcpNdv9LbKM59SkbpBg/sNqSX2KdzNmplu10
	e12Brrx9Iknj7+AIzgcN7S1OupkDuzBLBTDVToMbC3dySJHIPi5p1FrI9A9W1Lbh2lYa0f0qanQhf
	bi2hTRTf6HGWAZQ53gQwRR73clN5Uek7eqfJGusOymGsB9wIab/rdYFv6V7KsT3pEC+mqG4a804nb
	7gIDT46s5fev9AZ43/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXhhc-0000000AiYz-1pHv;
	Wed, 07 Feb 2024 13:11:00 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXhha-0000000AiUo-1Ex0
	for linux-riscv@lists.infradead.org;
	Wed, 07 Feb 2024 13:10:59 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-51142b5b76dso1000165e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Feb 2024 05:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707311452; x=1707916252; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeiQKTjUpaXlC5rTpAh57LecWBMIQwcK9WBuhzqF9Gc=;
        b=iJ6+Q47v1AwyRKWctOft1w1n+M4axhQ2he9b5Bp+Zy8G2/h2uAHIydii4SAJn6aNTk
         DSL2dWBZ0D3+9+yaNbnM5j6FsEq6DolPGZIvCj2yxmbnVYafaj8qwPr/U5w74VVxFLl2
         bJ9fBbctXcbjNO092EWic052iyC9/jMWBqhxf4xXz2z+BEk9fvQmCPFH+iUbZtCyMu4q
         oi4QqKdJdLLWhpjFnbtDsj001+DGrmzQdBD7cPWkR81BuKwibGf3CvMpe7S1hxNNxL4o
         fWopmix8hk0GaHUXtY9pHW3B5jQb2mM5efD3M2nRKELOvPA/AqER9qOZVqn4/+zQY3rT
         VnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707311452; x=1707916252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeiQKTjUpaXlC5rTpAh57LecWBMIQwcK9WBuhzqF9Gc=;
        b=YoqU0wyQGz93sJMJ5h2u3v45HbQVbfDROZi8Eu0DDIKRG8NcbfKBPHKT1DUztVXBGR
         kZUy1NJ6Z94ER/ATwUoWWINDM+HYb7e00vDv7cy+9e+fZJuLWGjt1HuL+R276abhhGdG
         ISj2KvyQor/O217cR9w4CGAwrLh6+3unk19bQJ5+mNlGXoipMOX3fdwrR5VeYnDlRORL
         Qwn2TMBkkEiKrJu2ZjNA0HI4nZvORMzvFq+TXTq0VTvHU3DA4Ah8t2hZjh8gcQonLCdo
         OGpAQGeZcjLRDIL2sSf8lU9RdGyk1UTGmJg9MZYPg9Jl4sno+gkVw0ra94wH6Kq92wZB
         ZCRg==
X-Gm-Message-State: AOJu0Yy2grkLKGnvaMVU7D8JaQsBYLJQH3dtOE0rY+CBvU7W5fJU0LtM
	mQrTF/uH8zQE9vnRFNo272WXiqwN1inIzR7C/8Zt54iKrW+JTWBJoNF0wrodDGuV1Cj/2IdjTz6
	5BCsaih+55OxbgYlJKVaRzmmPME6vczEeHHoAQg==
X-Google-Smtp-Source: AGHT+IEDiiJkE3kwGwtW/YKJfbR7qahBZMUX/dBC8fmDAROEYy79l0gPVz7ALeJMY4eBJ5z3ImHy8UPIS5Uk8HzPGLA=
X-Received: by 2002:ac2:4ac4:0:b0:511:551a:c330 with SMTP id
 m4-20020ac24ac4000000b00511551ac330mr4406484lfp.16.1707311452159; Wed, 07 Feb
 2024 05:10:52 -0800 (PST)
MIME-Version: 1.0
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <87h6ily53k.fsf@all.your.base.are.belong.to.us> <CAAhSdy2PPjS6++Edh8NkgiBmcovTUjS5oXE2eR5ZwPfAfVA0ng@mail.gmail.com>
 <874jekag3w.fsf@all.your.base.are.belong.to.us> <CAK9=C2XJYTfY4nXWtjK9OP1iXLDXBVF-=mN1SmJDmJ_dO5CohA@mail.gmail.com>
 <87plx8y5s3.fsf@all.your.base.are.belong.to.us> <87sf24mo1g.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87sf24mo1g.fsf@all.your.base.are.belong.to.us>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 7 Feb 2024 18:40:40 +0530
Message-ID: <CAK9=C2VLf96D8cm86D26=hJMsqehUM5x_=Cjyy+7kVcAZ5KrUQ@mail.gmail.com>
Subject: Re: [PATCH v12 00/25] Linux RISC-V AIA Support
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_051058_373549_806F1CCE 
X-CRM114-Status: GOOD (  16.49  )
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

T24gV2VkLCBGZWIgNywgMjAyNCBhdCA2OjI14oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cml0
ZXM6Cj4KPiA+Pj4gSG1tLCBzZWVtcyBsaWtlIHdlJ3JlIHRhbGtpbmcgcGFzdCBlYWNoIG90aGVy
LCBvciBhdCBsZWFzdCBJIGdldCB0aGUKPiA+Pj4gZmVlbGluZyBJIGNhbid0IGdldCBteSBvcGlu
aW9ucyBvdXQgcmlnaHQuIEknbGwgdHJ5IHRvIGRvIGEgcXVpY2sgUG9DLAo+ID4+PiB0byBzaG93
IHlvdSB3aGF0IEkgbWVhbi4gVGhhdCdzIHByb2JhYmx5IGVhc2llciB0aGFuIGp1c3QgdGFsa2lu
ZyBhYm91dAo+ID4+PiBpdC4gLi4uYW5kIG1heWJlIEknbGwgY29tZSByZWFsaXppbmcgSSdtIGFs
bCB3cm9uZyEKPiA+Pgo+ID4+IEkgc3VnZ2VzdCB0byB3YWl0IGZvciBteSB2MTMgYW5kIHRyeSBz
b21ldGhpbmcgb24gdG9wIG9mIHRoYXQKPiA+PiBvdGhlcndpc2Ugd2UgbWlnaHQgZHVwbGljYXRl
IGVmZm9ydHMuCj4gPgo+ID4gT0shCj4KPiBJIGRpZCBzb21lIHJlYWxseSByb3VnaCBjb2RlIHNr
ZXRjaGluZywgYW5kIEknbSBjb25maWRlbnQgdGhhdCB5b3UgY2FuCj4gZ2V0IHJpZCBvZiBhbGwg
aWRzX2VuYWJsZWRfYml0bWFwLCBod2lycXNfdXNlZF9iaXRtYXAsIGFuZCB0aGUKPiBjb3JyZXNw
b25kaW5nIGZ1bmN0aW9ucy9sb2Nrcy4gSSdkIHNheSBvbmUgbG9jayBpcyBlbm91Z2gsIGFuZCB0
aGUga2V5Cj4gaXMgaGF2aW5nIHRoZSBwZXItY3B1IGltc2ljX2xvY2FsX3ByaXYudmVjdG9ycyBj
aGFuZ2UgZnJvbSBzdHJ1Y3QKPiBpbXNpY192ZWN0b3IgKiB0byBzdHJ1Y3QgaW1zaWNfdmVjdG9y
ICoqLgo+Cj4gVXNpbmcgc21wX2NhbGxfZnVuY3Rpb25fc2luZ2xlKCkgdG8gSVBJIGVuYWJsZSAo
YW5kIGRpc2FibGUgaWYgeW91IGRvbid0Cj4gd2FudCB0byB1c2UgdGhlIGxhenkgdGltZXIgZGlz
YWJsZSBtZWNoYW5pc20pIHNlZW1zIGZlYXNpYmxlIGFzIHdlbGwhCj4KPiAoTGV0IG1lIGtub3cg
aWYgeW91IGRvbid0IGhhdmUgdGhlIHNwYXJlIGN5Y2xlcywgYW5kIEkgY2FuIGhlbHAgb3V0LikK
CklmIHlvdSBjYW4gaGVscCB1cHN0cmVhbSBJT01NVSBkcml2ZXIgdGhlbiB0aGF0IHdvdWxkIGJl
IGF3ZXNvbWUuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
