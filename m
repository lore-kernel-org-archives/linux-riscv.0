Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6097C8303C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 11:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rKxZ8cZkyWQ3rIvGuF4wsQKVfdnd3NV9EIhNU3T9Cv0=; b=ss1dU/TtC2jyYN
	Blvay7m3qoBbvcJND6QSyI2i+T9iLtGwkFXE0/iZn8iJmtDQ3PYvPvHYDVjEnqaCftjC1TY422TL/
	LEiLRR8mnsJezY9+6LGkfmEUguQG1CGLX4mjNibsRX5uUjrX8wtzrPYfQ4lvKCYv9kE+qvCnFJuxn
	bKsRN0Is1LJ3UdflhagmtyUaujnXfmYTiiWuGqHlcV1A04xnYfYnrSJ0arX/v/ZXyyiNtu3K03k2V
	RIN8CSxSUt5doe6QlNHoialmSM+oUj1OHv7KPquncL1fwAIkx5wlI6XDRU1kUNmCn2ceerOxnsSIQ
	MBBVLbSG1yvRJECCUpyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvEK-000000083eR-3hq0;
	Wed, 02 Jul 2025 11:02:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWubG-00000007w9G-2HG6
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 10:21:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48C5945E4E
	for <linux-riscv@lists.infradead.org>; Wed,  2 Jul 2025 10:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D19C4CEFA
	for <linux-riscv@lists.infradead.org>; Wed,  2 Jul 2025 10:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751451718;
	bh=dev3dwMQN1yzY1rh7c/NWkAu3zaem3ULhrEy2Os6A3k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gKb9H5tjCKMpWdrmwlrz4o511Ue55dDLqhHuWDZQwxHTV2jvlbA4Bxo/YrK8TzDQ2
	 GeyXY3dZHvu27WNWPlSyx4VUXfBtWXq0kfulrZewtKrJYEge60w+7ZwYJ2U0iX9Ukm
	 u0rLb6x15YkOmZxjW1GTjqtI/nrdKvSkY04sImgXHd+t5xcT4Mc4Aq79bV5ljFe1vQ
	 j7aC5qkma6xcP7DN8IYGBTKehW8g5unXI7947p0EIo/457fBaZ1cFXoEhbiGvtFLB1
	 UcoBNTD5y0fUfHeLz+gBXnsLRXaV1CEJvZ2e35dzE9JJMd6SA4oQLnVEOVJtE464gW
	 7/i1Z5O/GD9gg==
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-40a7322f081so1014041b6e.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 03:21:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXczYkhYyqE4XZQHxb3QfKdHRwHdh1dHwjhuX9Fr67tGmbgykNNTMr5BISoHkTbAtqHxoZG8PiYP+6z4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzImuGfOZ4bgCV7u1S9ME8qtmGhw/L+cIrstpJ0YFqgj1St5I/
	mu7udgS0ApXjZ9zj1y5pUaOhpgfV/yWBc8yZ/5EbgAV6yd787Zz8Y6GyxBGzWYPSrpkii1Bi8EX
	N2on5wfuB2Zqy1KJAdPXv43DdVqOcEGc=
X-Google-Smtp-Source: AGHT+IE2Kkk8T0ZbVBmpiOQbam/pLa6wG5+XN/RreLIx2X9wnWq0x8o9JpWoqRvdPgQY0h9YV/+fKkFjda3J6bwfL00=
X-Received: by 2002:a05:6808:1b99:b0:3f9:aeb6:6eac with SMTP id
 5614622812f47-40b889192f1mr1729652b6e.30.1751451717345; Wed, 02 Jul 2025
 03:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250702051345.1460497-1-apatel@ventanamicro.com> <20250702051345.1460497-17-apatel@ventanamicro.com>
In-Reply-To: <20250702051345.1460497-17-apatel@ventanamicro.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 2 Jul 2025 12:21:45 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gkCtxMWvgjS+CXOgC2QzCFFQ1bX6XA_D2HCOuGwT67kg@mail.gmail.com>
X-Gm-Features: Ac12FXwD-4N8bNKSBtHuf_106cJhbwii5ybB7cDrqtVYJiIXKxNBIQd1GfJzRU8
Message-ID: <CAJZ5v0gkCtxMWvgjS+CXOgC2QzCFFQ1bX6XA_D2HCOuGwT67kg@mail.gmail.com>
Subject: Re: [PATCH v7 16/24] ACPI: scan: Update honor list for RPMI System MSI
To: Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_032158_622784_FC3F18F7 
X-CRM114-Status: GOOD (  16.61  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Atish Patra <atishp@rivosinc.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdWwgMiwgMjAyNSBhdCA3OjE24oCvQU0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gRnJvbTogU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFt
aWNyby5jb20+Cj4KPiBUaGUgUlBNSSBTeXN0ZW0gTVNJIGludGVycnVwdCBjb250cm9sbGVyIChq
dXN0IGxpa2UgUExJQyBhbmQgQVBMSUMpCj4gbmVlZHMgdG8gcHJvYmVkIHByaW9yIHRvIGRldmlj
ZXMgbGlrZSBHRUQgd2hpY2ggdXNlIGludGVycnVwdHMgcHJvdmlkZWQKPiBieSBpdC4gQWxzbywg
aXQgaGFzIGRlcGVuZGVuY3kgb24gdGhlIFNCSSBNUFhZIG1haWxib3ggZGV2aWNlLgo+Cj4gQWRk
IEhJRHMgb2YgUlBNSSBTeXN0ZW0gTVNJIGFuZCBTQkkgTVBYWSBtYWlsYm94IGRldmljZXMgdG8g
dGhlIGhvbm9yCj4gbGlzdCBzbyB0aGF0IHRob3NlIGRlcGVuZGVuY2llcyBhcmUgaGFuZGxlZC4K
Pgo+IFJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KClRoaXMgaXMgZmlu
ZSBieSBtZSwgc28KCkFja2VkLWJ5OiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsLmoud3lzb2Nr
aUBpbnRlbC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2FjcGkvc2Nhbi5jIHwgMiArKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3Bp
L3NjYW4uYyBiL2RyaXZlcnMvYWNwaS9zY2FuLmMKPiBpbmRleCBmYjFmZTlmM2IxYTMuLjU0MTgx
YjAzYjM0NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2FjcGkvc2Nhbi5jCj4gKysrIGIvZHJpdmVy
cy9hY3BpL3NjYW4uYwo+IEBAIC04NTgsNiArODU4LDggQEAgc3RhdGljIGNvbnN0IGNoYXIgKiBj
b25zdCBhY3BpX2hvbm9yX2RlcF9pZHNbXSA9IHsKPiAgICAgICAgICJJTlRDMTBDRiIsIC8qIElW
U0MgKE1UTCkgZHJpdmVyIG11c3QgYmUgbG9hZGVkIHRvIGFsbG93IGkyYyBhY2Nlc3MgdG8gY2Ft
ZXJhIHNlbnNvcnMgKi8KPiAgICAgICAgICJSU0NWMDAwMSIsIC8qIFJJU0MtViBQTElDICovCj4g
ICAgICAgICAiUlNDVjAwMDIiLCAvKiBSSVNDLVYgQVBMSUMgKi8KPiArICAgICAgICJSU0NWMDAw
NSIsIC8qIFJJU0MtViBTQkkgTVBYWSBNQk9YICovCj4gKyAgICAgICAiUlNDVjAwMDYiLCAvKiBS
SVNDLVYgUlBNSSBTWVNNU0kgKi8KPiAgICAgICAgICJQTlAwQzBGIiwgIC8qIFBDSSBMaW5rIERl
dmljZSAqLwo+ICAgICAgICAgTlVMTAo+ICB9Owo+IC0tCj4gMi40My4wCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
