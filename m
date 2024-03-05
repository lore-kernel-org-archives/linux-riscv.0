Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8D5C5478C
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 07:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwNxTGUsA7T6+eWFTd8rEdfOh/MZz6fSjYFoK0vA5Io=; b=do3MfZCNqyBxVU
	+UI6uQVgow2FzqvQv+BL+fzOwsUbmkNsva2RnYuao+yuAXYNfvfO2pCcpNBeLuwvUdHW1AdK5SBpk
	D1rg9L/EhUJS5FIn0XFnI3Y6bC8ZbsTjQ5rsNNRN/AU0UDX9H3c7wSSxxkpUSrvKdCm59v1g1wXB1
	UYrspI1MsDw1haS/ysAMtaFtkTbtGdpNhtL1vlaW8quugGBswZQ+3/yCYkgiqVL0x9GbyZ8/zXLuY
	UI9L2lbPoDjMI9BbwgIkYMjyV9IAa9YpyTBoftMavGe7XcNosJkbVsBBPmXqDwFiQNLkdGecIBGST
	8kN6IavDRNfaA8Bma32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhPRs-0000000CPwT-09IF;
	Tue, 05 Mar 2024 07:42:52 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhPRo-0000000CPvm-1r7x
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 07:42:49 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2d109e82bd0so64042361fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2024 23:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709624565; x=1710229365; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yacK9hpiPuhyJxzTeAxFGss0ekxT9wkeTcOYVFT5O0=;
        b=SkTyFd9snY2Xs4g2UqjpcvtRo6RTHrAivj0q76y/GOKyYGY2+yVmGX0sq2BKOL1nmB
         mxfNzNrnWk6xzehJFDZvH6CqBQyX6/Reg4QmsK+yy83mG5mSFf1K3VeYu03Re+X9V8AQ
         0I/FfFb8CuGqNOK3YaE/6yIj8qLU5fKFJsCkiZZQ1FJmYOHqZ3o1vvSRwmGZnKruAHpe
         leu8vFXLQJUcM6sC53cxSuhf1mZtZvwme9dD4ypqy9Lw5ncYpwAnLSsSbuSO2zxyduiR
         Vq91wUyEP1Ovqgp9texNZ8f/bmAIoHUtqXr2AEsHAUXuuviSBZHiix/n912ckULhcKCB
         q3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709624565; x=1710229365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yacK9hpiPuhyJxzTeAxFGss0ekxT9wkeTcOYVFT5O0=;
        b=B/v+nUvFlR/BbpOM6drgd44FFx6aR7hIAmk08GHpMriceXVlEK1mHCeYEFZyN9RS6y
         BWcJLie2ld3seJ7Brl7W9MJFH2lpoIGs6frXpoobEtM8eadYl2HfG9eOFO87VzqlPFi/
         gAMo7uYQstZ9XlKKAxZW9qbmpQiOmGG9bjUuIP48dwyn9fsXIMN7YHelUE7ahwnTFZf2
         lJJi2/gb9gyUqgsi5kEp3yXbhqLb53z8octgefHMfUMrEjn0EtGOrHxqg3kuZIASAxVQ
         x7OEqbWaHUYmoQzj1WwDT8N0yDOHc01HToZzNS9Lk+eJHhV6aXBhrYFreySN9lYBy7Xy
         jiBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjZpJPGN/K++jyC4ENFsSEoq0RubJwCbPMw33KlwgxIv49CW7hMjyOeAF5dntFhIsjXTK9gf+RtGBLB8yFy6QmAPWc8ZY9ypijWCCxcVT7
X-Gm-Message-State: AOJu0YzaJw2eStW7IFwOHT31Nyn7UerAI9csmvO2i1fvGXzjYTh4Pnhb
	JISPMIayOwORIlw8i0r/pt9ZoZR/ll0AO6Cmwp1N9iSfrswkqJoDENMSeZasO+S1QzWbdammDlj
	vr2NakziK7O9ACj9WMOTtkF8WEfY=
X-Google-Smtp-Source: AGHT+IH3ogEE3gS9kmBu6JCdtMvf/PW5rL/fmSyuLCQWSV1sV1Mmkgo71z6sH2+EquAbsW+oxtRPML/1nmNxh73v3b8=
X-Received: by 2002:a05:651c:1683:b0:2d2:ef14:593e with SMTP id
 bd3-20020a05651c168300b002d2ef14593emr506670ljb.48.1709624564715; Mon, 04 Mar
 2024 23:42:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1706603678.git.haibo1.xu@intel.com> <ZeajHkn6dTQ3krsL@sunil-laptop>
In-Reply-To: <ZeajHkn6dTQ3krsL@sunil-laptop>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Tue, 5 Mar 2024 15:42:32 +0800
Message-ID: <CAJve8on1B7psLYX+Qei0Uxc=GbrGYq52OqV+ZFND9PkPMnyj=g@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add ACPI NUMA support for RISC-V
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Guo Ren <guoren@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Anup Patel <apatel@ventanamicro.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Jisheng Zhang <jszhang@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Baoquan He <bhe@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, James Morse <james.morse@arm.com>, Evan Green <evan@rivosinc.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Yang Li <yang.lee@linux.alibaba.com>, 
	Tony Luck <tony.luck@intel.com>, Ard Biesheuvel <ardb@kernel.org>, Yuntao Wang <ytcoode@gmail.com>, 
	Dan Williams <dan.j.williams@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_234248_506409_47007C8A 
X-CRM114-Status: GOOD (  14.37  )
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

T24gVHVlLCBNYXIgNSwgMjAyNCBhdCAxMjo0NOKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEhpIEhhaWJvLAo+IE9uIFdlZCwgSmFuIDMxLCAyMDI0
IGF0IDEwOjMxOjU3QU0gKzA4MDAsIEhhaWJvIFh1IHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBzZXJp
ZXMgZW5hYmxlIFJJU0MtViBBQ1BJIE5VTUEgc3VwcG9ydCB3aGljaCB3YXMgYmFzZWQgb24KPiA+
IHRoZSByZWNlbnRseSBhcHByb3ZlZCBBQ1BJIEVDUlsxXS4KPiA+Cj4gPiBQYXRjaCAxLzQgaXMg
Z2VuZXJhdGVkIGZyb20gdGhlIGFjcGljYSBQUlsyXSBhbmQgc2hvdWxkIGJlIG1lcmdlZCB0aHJv
dWdoCj4gPiB0aGUgYWNwaWNhIHByb2plY3QuIER1ZSB0byB0aGlzIGRlcGVuZGVuY3ksIG90aGVy
IDMgcGF0Y2hlcyBjYW4gb25seSBiZQo+ID4gbWVyZ2VkIGFmdGVyIHRoZSBjb3JyZXNwb25kaW5n
IEFDUElDQSBwYXRjaCB3YXMgcHVsbGVkIGludG8gbGludXguCj4gPgo+ID4gUGF0Y2ggMi80IGFk
ZCB0aGUgY29tbW9uIFNSQVQgUklOVEMgYWZmaW5pdHkgc3RydWN0dXJlIGhhbmRsZXIuCj4gPiBQ
YXRjaCAzLzQgYWRkIFJJU0MtViBzcGVjaWZpYyBhY3BpX251bWEuYyBmaWxlIHRvIHBhcnNlIE5V
TUEgaW5mb3JtYXRpb24KPiA+IGZyb20gU1JBVCBhbmQgU0xJVCBBQ1BJIHRhYmxlcy4KPiA+IFBh
dGNoIDQvNCBhZGQgY29ycmVzcG9uZGluZyBBQ1BJX05VTUEgY29uZmlnIGZvciBSSVNDLVYgS2Nv
bmZpZy4KPiA+Cj4gPiBCYXNlZC1vbjogaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXJpc2N2L2xp
bnV4LXJpc2N2L3RyZWUvZm9yLW5leHQKPiA+Cj4gPiBbMV0gaHR0cHM6Ly9tYW50aXMudWVmaS5v
cmcvbWFudGlzL3ZpZXcucGhwP2lkPTI0MzMKPgo+IFBsZWFzZSBhdm9pZCBwcm92aWRpbmcgbWFu
dGlzIGxpbmsuIEl0IGlzIG5vdCB1c2VmdWwgZm9yIHBlb3BsZSB3aG8gYXJlCj4gbm90IFVFRkkg
bWVtYmVycy4gQmV0dGVyIHRvIHByb3ZpZGUgdGhlIGxpbmsgdG8gdGhlIFBERiB2ZXJzaW9uIG9m
IHRoZQo+IEVDUiBhcHByb3ZlZC4KPgoKU3VyZS4gV2lsbCB1cGRhdGUgd2l0aCBhIFBERiBsaW5r
IGluIHYyLgoKVGhhbmtzLApIYWlibwoKPiBUaGFua3MsCj4gU3VuaWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
