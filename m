Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2089AC8303C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 11:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JMcWjTZ0T84DLcycON6bhde+TZ+A7t8Fzf05E8YjAio=; b=NVXMS3FaXzTp/D
	ao7Jw85ruAy5gt0+hMw8OZWaCgrJ+ct0kHEnx6ou1GoklxEmeXBPit9PVyupPVhltybaWjSNtlzdD
	ABb98ariz/REcwk5Ixz3PI5oAOUqGDHZMFB+PBYajfF6C27PXMd4MRdF4eysMcltVTzjnQfMlpDOG
	YKEvhBFx/mwtkEbjnRZEltEF/N0wj0nZnXqNWe85aow0OECBSsGD9cH/uxAT3SZU+R2M51a7J2Tfx
	m2IWeGNdEBEyPgkefNVdHAMOzwTfi/WNvADD5lEyOjV5CXulP56rtubRgQDDREnp1EFV4H6PpFTfi
	OSC76MtBKfoxRFfzgCBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvEK-000000083eK-1Cqr;
	Wed, 02 Jul 2025 11:02:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWuaS-00000007vvc-1f5x
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 10:21:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CEBC046178
	for <linux-riscv@lists.infradead.org>; Wed,  2 Jul 2025 10:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB681C4CEF3
	for <linux-riscv@lists.infradead.org>; Wed,  2 Jul 2025 10:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751451667;
	bh=yR4QX8AXCTa9zd/85SYFl0Yy3vsYSL9PyHxARwsxIfA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gymx7RVvDN4idY4KXMg5H3w1GiKCaihmgnle1aF81JViV02n8GLqRg2sSKraLP27p
	 3TLJLz77nLpAb14TgF7sJ6hBEJp9kh8FyJF4sHJI83ByJuw62cX+AnFfpvgL1qMYLh
	 BDG8eVupTnFW/dCx7sL17+CJcLSIz91pCA/Z20IumIE7EXuswNHQyNDVr6cRcJuE1t
	 WQEfZGvqqPhsk/fJUnQp+7AtghIwkZpizM7RODr5uUGbMVSfysuxcx6/+Io9qygfmn
	 g8Aggvlt92ZW9UMEAwtUXJxjQFikPyw9FcpFwdQou8db7nfP00sUrOr0REbAjoLCCK
	 WFdc/JSm1DaZQ==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-610d87553b6so2655229eaf.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 03:21:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMK0nwUz6FmIZ5O+eq57G3igVe3MeUEgNMexpwXT7qvIwKWZRK9tDO91ea3AJOSXb1iT8zB+qgz2/cXw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo7zJsXxraO5chsaovD0RAPgBsjOk3lKa7QJQrE+Y3Xfb4QD6z
	uUIY14FGKstFBLvzUrVwYEv08ud5dzzxyK+VbI1nysaECEV+d7+zwgr9NxhVoR+T1cTLxZ3FGNM
	YJgVb0QZGf9GBlMgRaJS1nmq9lHhKL2I=
X-Google-Smtp-Source: AGHT+IEIAYeGapqbvzgRtPBZhUUR/7BOdbNNDra2py939LpzhZKiwziH27/5pwK7uUznA1K8dVixQvtQR4qL3igFyhY=
X-Received: by 2002:a05:6820:2713:b0:611:bbad:7b62 with SMTP id
 006d021491bc7-6120112a218mr1475999eaf.3.1751451666947; Wed, 02 Jul 2025
 03:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250702051345.1460497-1-apatel@ventanamicro.com> <20250702051345.1460497-16-apatel@ventanamicro.com>
In-Reply-To: <20250702051345.1460497-16-apatel@ventanamicro.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 2 Jul 2025 12:20:55 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iYYuK2GF2Pg3NiO4vLFzoYm6Q3Dnk5O2DkMJm1R3qSfQ@mail.gmail.com>
X-Gm-Features: Ac12FXzQ49ZuTSEHsHpxG_hICq-H4KxJ6ZjrT4VtlTSQu1Nb2pu-7KR4sK-HNfM
Message-ID: <CAJZ5v0iYYuK2GF2Pg3NiO4vLFzoYm6Q3Dnk5O2DkMJm1R3qSfQ@mail.gmail.com>
Subject: Re: [PATCH v7 15/24] ACPI: property: Add support for cells property
To: Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_032108_477357_F86105E4 
X-CRM114-Status: GOOD (  26.72  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdWwgMiwgMjAyNSBhdCA3OjE24oCvQU0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gRnJvbTogU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFt
aWNyby5jb20+Cj4KPiBDdXJyZW50bHksIEFDUEkgZG9lc24ndCBzdXBwb3J0IGNlbGxzIHByb3Bl
cnR5IHdoZW4KPiBmd25vZGVfcHJvcGVydHlfZ2V0X3JlZmVyZW5jZV9hcmdzKCkgaXMgY2FsbGVk
LgoKV2hhdCBleGFjdGx5IGRvIHlvdSBtZWFuIGJ5ICJjZWxscyBwcm9wZXJ0eSIgaGVyZSBhbmQg
YmVsb3c/Cgo+IEFDUEkgYWx3YXlzIGV4cGVjdHMKPiB0aGUgbnVtYmVyIG9mIGFyZ3VtZW50cyB0
byBiZSBwYXNzZWQuIEhvd2V2ZXIsIHRoZSBhYm92ZSBtZW50aW9uZWQKPiBjYWxsIGJlaW5nIGEg
Y29tbW9uIGludGVyZmFjZSBmb3IgT0YgYW5kIEFDUEksIGl0IGlzIGJldHRlciB0byBoYXZlCj4g
c2luZ2xlIGNhbGxpbmcgY29udmVudGlvbiB3aGljaCB3b3JrcyBmb3IgYm90aC4gSGVuY2UsIGFk
ZCBzdXBwb3J0Cj4gZm9yIGNlbGxzIHByb3BlcnR5IG9uIHRoZSByZWZlcmVuY2UgZGV2aWNlIHRv
IGdldCB0aGUgbnVtYmVyIG9mCj4gYXJndW1lbnRzIGR5bmFtaWNhbGx5Lgo+Cj4gU2lnbmVkLW9m
Zi1ieTogU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
YWNwaS9wcm9wZXJ0eS5jIHwgMjIgKysrKysrKysrKysrKysrKysrLS0tLQo+ICBkcml2ZXJzL2Jh
c2UvcHJvcGVydHkuYyB8ICAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvcHJvcGVydHku
YyBiL2RyaXZlcnMvYWNwaS9wcm9wZXJ0eS5jCj4gaW5kZXggZDQ4NjM3NDZmYjExLi5kMDhiMGVh
NWM5MTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9hY3BpL3Byb3BlcnR5LmMKPiArKysgYi9kcml2
ZXJzL2FjcGkvcHJvcGVydHkuYwo+IEBAIC04ODIsNiArODgyLDE3IEBAIHN0YXRpYyBzdHJ1Y3Qg
Zndub2RlX2hhbmRsZSAqYWNwaV9wYXJzZV9zdHJpbmdfcmVmKGNvbnN0IHN0cnVjdCBmd25vZGVf
aGFuZGxlICpmCj4gICAgICAgICByZXR1cm4gJmRuLT5md25vZGU7Cj4gIH0KPgo+ICtzdGF0aWMg
dW5zaWduZWQgaW50IGFjcGlfZndub2RlX2dldF9hcmdzX2NvdW50KGNvbnN0IHN0cnVjdCBhY3Bp
X2RldmljZSAqZGV2aWNlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29uc3QgY2hhciAqbmFyZ3NfcHJvcCkKPiArewo+ICsgICAgICAgY29uc3QgdW5p
b24gYWNwaV9vYmplY3QgKm9iajsKPiArCj4gKyAgICAgICBpZiAoYWNwaV9kZXZfZ2V0X3Byb3Bl
cnR5KGRldmljZSwgbmFyZ3NfcHJvcCwgQUNQSV9UWVBFX0lOVEVHRVIsICZvYmopKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAgICAgICByZXR1cm4gb2JqLT5pbnRlZ2VyLnZh
bHVlOwo+ICt9Cj4gKwo+ICBzdGF0aWMgaW50IGFjcGlfZndub2RlX2dldF9yZWZlcmVuY2VfYXJn
cyhjb25zdCBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKnByb3BuYW1lLCBjb25zdCBjaGFy
ICpuYXJnc19wcm9wLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGludCBhcmdzX2NvdW50LCB1bnNpZ25lZCBpbnQgaW5kZXgsCj4gQEAgLTg5Miw2
ICs5MDMsNyBAQCBzdGF0aWMgaW50IGFjcGlfZndub2RlX2dldF9yZWZlcmVuY2VfYXJncyhjb25z
dCBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLAo+ICAgICAgICAgY29uc3Qgc3RydWN0IGFj
cGlfZGV2aWNlX2RhdGEgKmRhdGE7Cj4gICAgICAgICBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqcmVm
X2Z3bm9kZTsKPiAgICAgICAgIHN0cnVjdCBhY3BpX2RldmljZSAqZGV2aWNlOwo+ICsgICAgICAg
dW5zaWduZWQgaW50IG5hcmdzX2NvdW50Owo+ICAgICAgICAgaW50IHJldCwgaWR4ID0gMDsKPgo+
ICAgICAgICAgZGF0YSA9IGFjcGlfZGV2aWNlX2RhdGFfb2Zfbm9kZShmd25vZGUpOwo+IEBAIC05
NjAsMTEgKzk3MiwxMiBAQCBzdGF0aWMgaW50IGFjcGlfZndub2RlX2dldF9yZWZlcmVuY2VfYXJn
cyhjb25zdCBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGlmICghZGV2aWNlKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4KPiArICAgICAgICAgICAgICAgICAgICAgICBuYXJnc19jb3VudCA9IGFj
cGlfZndub2RlX2dldF9hcmdzX2NvdW50KGRldmljZSwgbmFyZ3NfcHJvcCk7CgpJIHRoaW5rIGl0
IHNob3VsZCB3b3JrIHRoZSBzYW1lIHdheSBhcyBpdCB1c2VkIHRvIGZvciB0aGUgY2FsbGVycyB0
aGF0CnBhc3MgYXJnc19jb3VudCwgc28gbWF5YmUKCmlmICghYXJnc19jb3VudCkKICAgICAgICBh
cmdzX2NvdW50ID0gYWNwaV9md25vZGVfZ2V0X2FyZ3NfY291bnQoZGV2aWNlLCBuYXJnc19wcm9w
KTsKCj4gICAgICAgICAgICAgICAgICAgICAgICAgZWxlbWVudCsrOwo+IC0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICByZXQgPSBhY3BpX2dldF9yZWZfYXJncyhpZHggPT0gaW5kZXggPyBhcmdz
IDogTlVMTCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBhY3BpX2Z3bm9kZV9oYW5kbGUoZGV2aWNlKSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmZWxlbWVudCwgZW5kLCBhcmdzX2NvdW50KTsKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZWxlbWVudCwgZW5k
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5hcmdz
X2NvdW50ID8gbmFyZ3NfY291bnQgOiBhcmdzX2NvdW50KTsKCkFuZCB0aGlzIGNoYW5nZSB3b3Vs
ZCBub3QgYmUgbmVjZXNzYXJ5PwoKQW5kIGFuYWxvZ291c2x5IGJlbG93LgoKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBpZiAocmV0IDwgMCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiByZXQ7Cj4KPiBAQCAtOTc4LDExICs5OTEsMTIgQEAgc3RhdGljIGludCBhY3Bp
X2Z3bm9kZV9nZXRfcmVmZXJlbmNlX2FyZ3MoY29uc3Qgc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3
bm9kZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXJlZl9md25vZGUpCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPgo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGRldmljZSA9IHRvX2FjcGlfZGV2aWNlX25vZGUocmVmX2Z3bm9kZSk7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgbmFyZ3NfY291bnQgPSBhY3BpX2Z3bm9kZV9nZXRfYXJn
c19jb3VudChkZXZpY2UsIG5hcmdzX3Byb3ApOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGVs
ZW1lbnQrKzsKPiAtCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gYWNwaV9nZXRfcmVm
X2FyZ3MoaWR4ID09IGluZGV4ID8gYXJncyA6IE5VTEwsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVmX2Z3bm9kZSwgJmVsZW1lbnQsIGVuZCwKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhcmdzX2NvdW50
KTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBuYXJn
c19jb3VudCA/IG5hcmdzX2NvdW50IDogYXJnc19jb3VudCk7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKHJldCA8IDApCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gcmV0Owo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmFzZS9wcm9wZXJ0eS5jIGIvZHJpdmVy
cy9iYXNlL3Byb3BlcnR5LmMKPiBpbmRleCBmNjI2ZDViYmU4MDYuLjZhNjM4NjA1NzlkZCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2Jhc2UvcHJvcGVydHkuYwo+ICsrKyBiL2RyaXZlcnMvYmFzZS9w
cm9wZXJ0eS5jCj4gQEAgLTU3OCw3ICs1NzgsNyBAQCBFWFBPUlRfU1lNQk9MX0dQTChmd25vZGVf
cHJvcGVydHlfbWF0Y2hfcHJvcGVydHlfc3RyaW5nKTsKPiAgICogQHByb3A6ICAgICAgVGhlIG5h
bWUgb2YgdGhlIHByb3BlcnR5Cj4gICAqIEBuYXJnc19wcm9wOiAgICAgICAgVGhlIG5hbWUgb2Yg
dGhlIHByb3BlcnR5IHRlbGxpbmcgdGhlIG51bWJlciBvZgo+ICAgKiAgICAgICAgICAgICBhcmd1
bWVudHMgaW4gdGhlIHJlZmVycmVkIG5vZGUuIE5VTEwgaWYgQG5hcmdzIGlzIGtub3duLAo+IC0g
KiAgICAgICAgICAgICBvdGhlcndpc2UgQG5hcmdzIGlzIGlnbm9yZWQuIE9ubHkgcmVsZXZhbnQg
b24gT0YuCj4gKyAqICAgICAgICAgICAgIG90aGVyd2lzZSBAbmFyZ3MgaXMgaWdub3JlZC4KPiAg
ICogQG5hcmdzOiAgICAgTnVtYmVyIG9mIGFyZ3VtZW50cy4gSWdub3JlZCBpZiBAbmFyZ3NfcHJv
cCBpcyBub24tTlVMTC4KPiAgICogQGluZGV4OiAgICAgSW5kZXggb2YgdGhlIHJlZmVyZW5jZSwg
ZnJvbSB6ZXJvIG9ud2FyZHMuCj4gICAqIEBhcmdzOiAgICAgIFJlc3VsdCBzdHJ1Y3R1cmUgd2l0
aCByZWZlcmVuY2UgYW5kIGludGVnZXIgYXJndW1lbnRzLgo+IC0tCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
