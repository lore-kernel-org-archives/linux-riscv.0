Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8C7C83F03
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 17:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9g4wakQ8oDDJeuZWjixNphKaWn2fSy2SVB+WZPTyS0M=; b=JCz2NbUNLlbgp0
	hPMoLrkSiQ5ltyS9GgTqvPBneJzLE/fUF89FKeFJy7WGInBkbaH6M7Wx+1/Pmv4hurLT6n90L8ub3
	kqDwjQIXhC2Znr1R6UO8st2JPVlk30/zRbXCeVd58Z6VxD6OhLKE1g3XA48yck2uTxbq7OAaEFJUU
	+GisLPs2cwNust33U+ewTsnqaDFqzaIK3uJqXi0Xz1unRIZ9sPvBGrgPPk8WJkmXdRbOfCUs7H7bi
	RF8JTNwDwWuaDz6dzmdWdGdFBfhhl92xkH/kLapNu2GqTUPHBtP1douS8EYzfmSH9UzLF5L7ETbKN
	TeusHSb+EEH98eDdgfnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNK4-0000000C4GZ-3kv5;
	Thu, 03 Jul 2025 17:02:08 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKu3-0000000Bf9r-29wB
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 14:27:09 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-553dceb342fso7510304e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Jul 2025 07:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751552825; x=1752157625; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uf8vdHeGId+ZnF/9F3GWDgFkWjF4VDV823qH2TyLfGg=;
        b=c5rfWoB9PtZPEBvnGz15mz8KxoqdUtA0rtp4I2uJyQCxGffYtVzV2VJZzWTbP8d9Fn
         +p4t4/6P60z3kdOthAJS2B0HQTP6aw6Er3zqbmIUEXoownW3FS/I1+x2ufRBf0gFm8VM
         5b8mmkQEbCeWR6JzGYgj4m9/EVrHCdx9CtqVgpbWOClGhpmlfsODxtN3sEHS+Ygt2CVF
         D2ohuKt+BO6xJWp29BHlFgG/VbbYjhDRsA+FTvuz3/OTuwIuGJ+aj9FF+tn+BLYVQBzi
         VlLAy7r38mkFv8SGNvg/eon8ZsNucIsFNlPXwDkPjqVKVAOYgrK052UOyVxl09n6B3T+
         w1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751552825; x=1752157625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uf8vdHeGId+ZnF/9F3GWDgFkWjF4VDV823qH2TyLfGg=;
        b=M6gew7ZmGt0E2pbdhJOdxoVec93FOa7Fb2cFA0k95YO0sXaoCbygsmy5mIu/BIkOcb
         4kk1EZ5xuUUwv926l/cMtGItyQmJQMQcHCHreZkAXVrMix2vAH9BcIa3MIYsszoAv4o+
         htc+9TjVcnHlhnUjcMkHq/EQY7gk6Xr4+y3n21HlWS1TYmjB4kfljZUkXYk1jlLhqkg7
         XnL4+P8xHsTbN1PEoR1isOp0BRfCLU7ids+c2i9IS4Uhuhh7IMJ+uUpVP+6rYPDtltDK
         4pjacQBxemwytF3QL3lskQnffYWSam1ELfaEflWjTA2OkxcUHNM18WGrHpa0ybmcxhwq
         XIWg==
X-Forwarded-Encrypted: i=1; AJvYcCV44x8e8EAgkevELmtcrRPX+yTe1YKcqODQQzM6qzk+beMyp8VtNhGKW3oQQC1yATyk5S8d6D0OrG3+aA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIMELzLs9rF/1w2XsKxc7PLQenXm70k2/r5tV+x18y5ZPA4mrc
	7YKt717paI2gp8UNOMADfJ2kVjSOZo5R0PILqXPqLQRIGqWo59EkACebgFQrfz2h+d/UIcu+BXZ
	eAKJRKAT+cizFxp360xuNnlvNlri1gYyFK9AAbmdyaA==
X-Gm-Gg: ASbGnctDp6qjMEuZSQnnX3a5z+bU8W4k8GXqUy7LNTfIFp2l2mas+51UyAx9CaYmWqV
	fFdMTuPOAcT75mNknuualI6WqW3m4DpCeJX4SqB0f5FSomZ+QB21ikOOg9aY4ih+W2lbNuU7pfE
	inDwB9dwArHjW4PAWDJ5UtaSSUkyRsG2PDRg+g5mPInf63
X-Google-Smtp-Source: AGHT+IERNnk/2/Xto87XCFkohZ55sqVf4D9r7VKfYTzDKK+EnAO7K8P2L0DHhu9Is2cxcFQo4XLBsT3o8hs5IshBmu4=
X-Received: by 2002:a05:6512:3b06:b0:554:f7ec:3b23 with SMTP id
 2adb3069b0e04-556282d4f26mr2545624e87.15.1751552825118; Thu, 03 Jul 2025
 07:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-22-apatel@ventanamicro.com> <aGUl_S9irfhlHmy2@smile.fi.intel.com>
 <aGZhWlxxQG0Z8awP@sunil-laptop> <aGaLiK0eW8Mc1YC3@smile.fi.intel.com>
In-Reply-To: <aGaLiK0eW8Mc1YC3@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 3 Jul 2025 19:56:52 +0530
X-Gm-Features: Ac12FXxVxoArxYNQOBIoss4C9gX0gtiDewbDa5jJ0LeiFJ8s2mrh5jukau-DksA
Message-ID: <CAK9=C2VjrOvcu=hEfxqw8R6Bwc1W5n9m_ksQ8vx02Lo8232wqQ@mail.gmail.com>
Subject: Re: [PATCH v7 21/24] mailbox/riscv-sbi-mpxy: Add ACPI support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_072707_556368_F0F081A7 
X-CRM114-Status: GOOD (  27.08  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgMywgMjAyNSBhdCA3OjI04oCvUE0gQW5keSBTaGV2Y2hlbmtvCjxhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdWwgMDMsIDIw
MjUgYXQgMDQ6MjQ6MThQTSArMDUzMCwgU3VuaWwgViBMIHdyb3RlOgo+ID4gT24gV2VkLCBKdWwg
MDIsIDIwMjUgYXQgMDM6Mjg6NDVQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+ID4g
PiBPbiBXZWQsIEp1bCAwMiwgMjAyNSBhdCAxMDo0Mzo0MkFNICswNTMwLCBBbnVwIFBhdGVsIHdy
b3RlOgo+Cj4gLi4uCj4KPiA+ID4gPiAtICAgICAgICAgaWYgKGRldl9vZl9ub2RlKGRldikpCj4g
PiA+ID4gKyAgICAgICAgIGlmIChpc19vZl9ub2RlKGZ3bm9kZSkpIHsKPiA+ID4gPiAgICAgICAg
ICAgICAgICAgICBvZl9tc2lfY29uZmlndXJlKGRldiwgZGV2X29mX25vZGUoZGV2KSk7Cj4gPiA+
ID4gKyAgICAgICAgIH0gZWxzZSBpZiAoaXNfYWNwaV9kZXZpY2Vfbm9kZShmd25vZGUpKSB7Cj4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgbXNpX2RvbWFpbiA9IGlycV9maW5kX21hdGNoaW5nX2Z3
bm9kZShpbXNpY19hY3BpX2dldF9md25vZGUoZGV2KSwKPiA+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERPTUFJTl9CVVNfUExBVEZP
Uk1fTVNJKTsKPiA+ID4gPiArICAgICAgICAgICAgICAgICBkZXZfc2V0X21zaV9kb21haW4oZGV2
LCBtc2lfZG9tYWluKTsKPiA+ID4gPiArICAgICAgICAgfQo+ID4gPgo+ID4gPiBBY3R1YWxseSB5
b3UgZG9uJ3QgbmVlZCB0byBoYXZlIHRoZSBpZi1lbHNlLWlmIGlmIEkgYW0gbm90IG1pc3Rha2Vu
Lgo+ID4gPiBUaGUgT0YgZG9lcyBhbG1vc3QgdGhlIHNhbWUgYXMgaXQncyBkb25lIGluIHRoZSBz
ZWNvbmQgYnJhbmNoIGZvciBBQ1BJIGNhc2UuCj4gPiA+IEhvdyBtYW55IE1TSSBwYXJlbnRzIHRo
aXMgbWF5IGhhdmU/Cj4gPiA+Cj4gPiBPRiBhbHJlYWR5IGhhcyBhIHdlbGwgZGVmaW5lZCBpbnRl
cmZhY2UgdG8gY29uZmlndXJlIHRoZSBNU0kgZG9tYWluLiBUaGUKPiA+IG1lY2hhbmlzbXMgZXhp
c3RpbmcgdG9kYXkgYXJlIGRpZmZlcmVudCBmb3IgRFQgdnMgQUNQSSB0byBmaW5kIG91dCB0aGUK
PiA+IGZ3bm9kZSBvZiB0aGUgTVNJIGNvbnRyb2xsZXIuIFNvLCBpdCBpcyBkb25lIGRpZmZlcmVu
dGx5Lgo+Cj4gSSBkb24ndCBzZWUgaG93LiBUaGUgb25seSBkaWZmZXJlbmNlIEkgc2VlIGlzIHRo
YXQgT0YgaXRlcmF0ZXMgb3ZlciBhbGwgbGlzdGVkCj4gcGFyZW50cywgaWYgYW55LCBBQ1BJIHRy
aWVzIG9ubHkgb25lLgo+Cj4gU28sIHBlcmhhcHMgaXQncyBhIHRpbWUgdG8gaGF2ZSBhIGNvbW1v
biBBUEkgc29tZXdoZXJlIGZvciB0aGlzIHRvIGJlIGFnbm9zdGljPwo+IFNvbWV0aGluZyBsaWtl
IGZ3bm9kZV9tc2lfY29uZmlndXJlKCkgaW4gc29tZXdoZXJlIG9mIElSUSBNU0kgY29yZT8KPgoK
VGhlcmUgaXMgYW4gaXNzdWUvZ2FwIGluIHRoZSBERCBmcmFtZXdvcmsgd2hpY2ggaXMgYmVpbmcg
d29yay1hcm91bmQKaGVyZS4gVGhpcyBpc3N1ZSBtYW5pZmVzdCBtb3N0bHkgaW4gUklTQy1WIGxh
bmQgYmVjYXVzZSBpbiBSSVNDLVYgYm90aApNU0kgY29udHJvbGxlciBkcml2ZXIgYW5kIGRyaXZl
cnMgdXNpbmcgTVNJIGFyZSByZWd1bGFyIHBsYXRmb3JtIGRyaXZlcnMKd2hpbGUgdGhlIHByb2Jl
IG9yZGVyaW5nIGlzIGVuc3VyZWQgYnkgZGV2X2xpbmsgc3VwcG9ydCBvZiBERCBmcmFtZXdvcmsK
b3IgdGhlIGZyYW1ld29ya3MgKGxpa2UgQUNQSSkgY3JlYXRpbmcgdGhlIGRldmljZS4KCkFzLXBl
ciB0aGlzIGlzc3VlLCB3aGVuIHBsYXRmb3JtIGRldmljZXMgKERUIG9yIEFDUEkpIGFyZSBjcmVh
dGVkIHRoZQpNU0kgZG9tYWluIGluc3RhbmNlIGlzIG5vdCBhdmFpbGFibGUgYW5kIGhlbmNlIHNl
dCB0byBOVUxMLiBUaGUgTVNJCmRvbWFpbiBpbnN0YW5jZSBpcyBvbmx5IGF2YWlsYWJsZSBhZnRl
ciBNU0kgY29udHJvbGxlciBkcml2ZXIgaXMgcHJvYmVkCnNvIGN1cnJlbnRseSB3ZSBleHBsaWNp
dGx5IGRvIG9mX21zaV9jb25maWd1cmUoKSBvciBkZXZfc2V0X21zaV9kb21haW4oKQppbiB0aGUg
ZHJpdmVyIHVzaW5nIE1TSSBhcyBhIHdvcmstYXJvdW5kLiBBZGRpbmcgYSBjb21tb24KZndub2Rl
X21zaV9jb25maWd1cmUoKSBpcyBvbmx5IGdvaW5nIHRvIGJlIGFuIGltcHJvdmVtZW50IHRvIHRo
ZQpleGlzdGluZyB3b3JrLWFyb3VuZCB3aGljaCB3ZSBzaG91bGQgbm90IGhhdmUgaW4gdGhlIGZp
cnN0IHBsYWNlCmhlbmNlIG5vdCB0aGUgcmlnaHQgYXBwcm9hY2ggSU1PLgoKSW4gdGhlIGxvbmcg
cnVuLCB3ZSBuZWVkIGEgY2xlYW4gZml4IGZvciB0aGUgYWJvdmUgaXNzdWUgaW4gdGhlIERECmZy
YW1ld29yayBzdWNoIHRoYXQgcGxhdGZvcm0gZHJpdmVycyB1c2luZyBNU0kgZG9uJ3QgaGF2ZSB0
byBleHBsaWNpdGx5CmRvIG9mX21zaV9jb25maWd1cmUoKSBvciBkZXZfc2V0X21zaV9kb21haW4o
KS4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
