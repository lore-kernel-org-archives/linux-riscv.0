Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FC1C8303D
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 04:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AFbpHROzrJvuwNddfyt/9OQx/D06HPfhGv0pvhpvCUw=; b=afkr7fJrMcbPAN
	vYaVpQgfEa71DC3FeSKBGw8hf+0Rh3spjJ+YrTJ96cqS+l27qULgP1rfAAKrnilL/J/D5P0JF8+Hl
	VDhFPBBd2GE19ljmDhNAPBxFjs5aJWnbyC9c48h5SXaxP6fn6GNRUtAJR/Ly/XDaYsESjSHDUzIVw
	HIhEX7a5VM+KAM3zf+3CMxiQB7ol9cezOqGPP4xtct/bif3jLslKD/tF8j8fG1wKkECg4ja/aau+q
	SUzhn0BN+EPEd/ir5fFHY2udlo0iw7MVFb5iiMMSupXMMNRsm2ORXJL9BO5HkafkNeMDsmY2UJf9T
	hXjJMNUzb07J1pwEtf/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXXqI-0000000DDBp-1TDp;
	Fri, 04 Jul 2025 04:16:06 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXXqF-0000000DDBS-426H
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 04:16:05 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-32addf54a01so6300311fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Jul 2025 21:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751602562; x=1752207362; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNpklbxS/261KY95nbuoqcElZCVt0F33NNxENOsgANs=;
        b=PlBzGeEP1AFGP5NY+OPfgxyc/X8aJElyNeLArKU/VadAoHaM0dh9wLJB+q+OPpYmWI
         Rvf2eu68DzCU4oXMDUKsf8OkyIS6aV/fJrGSpSsjg53JCyBxwpLMA1hgBx4tc46NKP6D
         SVTPiQK07gG33v2Ky7UcunJV07lz+ylXfMOF+g/73ADBP+ZEieN+DE08BT/WCoinehb4
         IyKvtsyQeZdDhBQzGFsoZDwlN7legWITK1lMFIpCr1TLVVsl5VFJDhWHXXhJsEsInKyC
         EsLC6ym4u1YXilqtcSs1mn3p8M5s8LcU8AtLLKGxZ2SL5NkvKS/OujuWDWdY6h3GS+Of
         2jmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751602562; x=1752207362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNpklbxS/261KY95nbuoqcElZCVt0F33NNxENOsgANs=;
        b=IG71N+u2ThhHUgEX5/S/0Qn8dff/MIdiyFAWOH08Oc2MEUYzCBLuoXCDpKb4WD56SR
         ekXkzMAj31Te9INoX/r379ZKvvwgN6FE1MkiKL6ngCiwhT7ux/5GKWkqbA3AwKN18I4P
         OHazts2+jGDbsApl3Y/bR8TVw6kr8ii6yuK5re5ZJBQwf7ZwV31roCTjDyUTI7oZq+RQ
         udSfNs/vYOfTHIWzKXetctoO7L/TtGl+YwYH5eeqk0Fl3NALPSjnYM9wha6n/6b7llef
         3p42OhttOwUGWRXHm1TdLW18X3b0qcRsokoXe1A6vtnL7EoTdEhNkYLEHYepI4IdWgNJ
         HUJg==
X-Forwarded-Encrypted: i=1; AJvYcCUesSpg4ZzHMEPXJ8U39kr2L7TKrMkf5Ni5Q5We4DKYKIY7XsCbPV+CU1oim/Bss5nVclQKCn+o6e50hQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYmAO+lKssaZAjGz0sCB+LNfPT1EywheNjM23xhXAzVPN51eZY
	sZPOicyxuOjRoeTHxMEdqLu/cQiI8c9J1HXo6+x1AIL2orTfwFUV9jxotTUxrrXH2xTSHqHWkN3
	7aa9e2dD5qVH5BkRr8lvmr3ppX84fJjzy16PqDHRJxQ==
X-Gm-Gg: ASbGnctB8Gw4SHCMkZclNk6+mjiNKxyjaHQTMbU4STj0qUbHyrGTVNNfmbrr5V8J0/s
	7LR/WmyPhqMfzuQwq6Rskz5zgV8yw9rpaT/YPNkMxwpISM6+fqgwaXmI17amWPzHAtQE6KXKex9
	cFypEqvzfEJHm04wlL/6usbIx46smUblV2MKQqbhHXfEU1
X-Google-Smtp-Source: AGHT+IGcdpbloJSunZwHs/XaLhcDN9ntbioBpiLJkF8NXPKWTLMAoMKlItDbIAXXbqigvjFpNNf1X8SwQxnpI9ERS9s=
X-Received: by 2002:a05:651c:33c:b0:32b:2f36:4d92 with SMTP id
 38308e7fff4ca-32e5f5856d1mr2157481fa.12.1751602561921; Thu, 03 Jul 2025
 21:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-11-apatel@ventanamicro.com> <aGUvOLXXwF8c_czJ@smile.fi.intel.com>
In-Reply-To: <aGUvOLXXwF8c_czJ@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 4 Jul 2025 09:45:49 +0530
X-Gm-Features: Ac12FXyJ7NyM9IIDInA5TJDnv2m4UJrY1w22dfaDXM4YfjlbpVcnLOkOViGqoxk
Message-ID: <CAK9=C2VfvsbFTjecQm0OSsssXbff7wC4fqWf3CTmnpWSiaLcBw@mail.gmail.com>
Subject: Re: [PATCH v7 10/24] clk: Add clock driver for the RISC-V RPMI clock
 service group
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_211604_001905_80BECCB4 
X-CRM114-Status: GOOD (  14.86  )
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

T24gV2VkLCBKdWwgMiwgMjAyNSBhdCA2OjM44oCvUE0gQW5keSBTaGV2Y2hlbmtvCjxhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMDIsIDIw
MjUgYXQgMTA6NDM6MzFBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+Cj4gPiBUaGUgUlBN
SSBzcGVjaWZpY2F0aW9uIGRlZmluZXMgYSBjbG9jayBzZXJ2aWNlIGdyb3VwIHdoaWNoIGNhbiBi
ZQo+ID4gYWNjZXNzZWQgdmlhIFNCSSBNUFhZIGV4dGVuc2lvbiBvciBkZWRpY2F0ZWQgUy1tb2Rl
IFJQTUkgdHJhbnNwb3J0Lgo+ID4KPiA+IEFkZCBtYWlsYm94IGNsaWVudCBiYXNlZCBjbG9jayBk
cml2ZXIgZm9yIHRoZSBSSVNDLVYgUlBNSSBjbG9jawo+ID4gc2VydmljZSBncm91cC4KPgo+IE5v
dyBpdCBsb29rcyBtdWNoIGJldHRlciEKPgo+IFJldmlld2VkLWJ5OiBBbmR5IFNoZXZjaGVua28g
PGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KPiBPbmUgbml0LXBpY2sgYmVsb3cu
Cj4KPiAuLi4KPgo+ID4gKy8qCj4gPiArICogcnBtaV9jbGtfcmF0ZXMgcmVwcmVzZW50cyB0aGUg
cmF0ZXMgZm9ybWF0Cj4gPiArICogYXMgc3BlY2lmaWVkIGJ5IHRoZSBSUE1JIHNwZWNpZmljYXRp
b24uCj4gPiArICogTm8gb3RoZXIgZm9ybWF0IGNvbnZlcnNpb24oZWcuIGxpbmVhcl9yYW5nZSkg
aXMKPiA+ICsgKiByZXF1aXJlZCB0byBhdm9pZCB0byBhbmQgZnJvIGNvbnZlcnNpb24uCj4KPiBj
b252ZXJzaW9uIGFwcGVhcnMgdHdpY2UuIEkgd291bGQgc3VnZ2VzdCB1c2UgdGhpczoKPgo+ICAq
IE5vIG90aGVyIGRhdGEgZm9ybWF0IChlLmcuLCBzdHJ1Y3QgbGluZWFyX3JhbmdlKSBpcwo+ICAq
IHJlcXVpcmVkIHRvIGF2b2lkIHRvIGFuZCBmcm9tIGNvbnZlcnNpb24uCj4KCkkgd2lsbCB1cGRh
dGUgaXQgaW4gdGhlIG5leHQgcmV2aXNpb24uCgpUaGFua3MsCkFudXAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
