Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F9FC77B7C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 09:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WLwaGkrWK51N5JsfzfaLP71KMNQ7AKcaoCvnHF9K8Dc=; b=RUNtexx2jkWV3Z
	gauP2a+4yySF+eNzHU2wU2tb8hVBZDbosH8egbW8C4YBWVKgNZvdsGbTrwQvWHnuJCy6duIdaF/8/
	8rifJrHUVOSg1AuuMOqklGAClYf5Isk9cmYXS3PbVg5jFbZqeBiXjYDEGjY4o6W7Pm8sKHJ4LDMMI
	ws4QeNF5BBZdLuagV/sX4jv809XGEerl/ZjYU+dDOZL5FNX5/KasaN9dGJJqGyNSRXLcAgCH90EDU
	VMdntxNQAyVGr8ePrmKcI3b4cPUqBhH6lhCr0aomgtYW+AWmfoZaTHgakFjiGETIfqHTfzKv0dVkP
	cNYZNNs3LWmrIRhcxZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGO9-0000000AqlL-12U1;
	Thu, 03 Jul 2025 09:37:53 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGHl-0000000ApdU-1gy9
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 09:31:18 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-235ef62066eso101021875ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Jul 2025 02:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751535076; x=1752139876; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KYfn57qzkkmG/aFpndf/jcsizGLt8T7mJq7PMwyO3ks=;
        b=lwzaLVBvpFo2zFJ/Ls0XPCTS3kkJ5EYFWTXYDrplVMIjuJAzjb+owta+D0WAZtOx6P
         u+s5qpAw4q68vVaHbrG1pZBW2J4F9yIO6ygydY207obTW2WmgYaWM9bkBk9+u5SvFF+a
         ME5BYX+S20nsGe5ML5unmair8mnT3CJNgE4y93UoDfJkUmHdbD9dxSVYM71Ldc4N/PQr
         c6v8wXhlebPGlvF4GksjSEzTKOw1EfIBvCIpOzV5Rlv9V6aYPDB+TUlwnH+ulA0Z9wSr
         DAoFFNKeZrT2246MmtVT1lxBmAAMxIQK94xYzaS3mGh/usVxfiLOB8jh/Fp/3OcLv1gq
         MlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751535076; x=1752139876;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KYfn57qzkkmG/aFpndf/jcsizGLt8T7mJq7PMwyO3ks=;
        b=uVcJZmJhKpylb0JMqFhT8mESx9B/0qF04iPiGwcTrNMo3tTekANJrXGTvEhf3Nwmur
         e8ZaBnbu9tpj0A40fhZeynSF/AESm/k9xhxG7VD/SxJ1sbqlAaTLEdGLiZHG9wimlvu9
         ms65+Noy5BA1esjYxx35yTV4VxueUq4XX0fqaj2QEJBtU7SKWf5ixc7XtDi5cIIXEWMH
         REWcP63ke9j8DGezyLJzhTDJWkdRgbewxmgmY4M5vmkjGO7V9dwQf0ZQVsn/6lYLLK3y
         aq5JNRLjA0rvzijJWD+boiNRJdePgEb0f1xSwJcfeHF4u5u53xsGFSk7qXmd75L3CHrI
         V2QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaMCf/Oy2Za9UhybnLkLlaXwlWemR/9X/xLfMtsGeG2EDoyIMLneJAetfJcaULwYRw3Ikj5vzDYCoGDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLi+vadErHMiXpgxp7IJXdFg8OSkd4yrE+QV2ikcmXqoMqnsJF
	2SH3Fan5/odOfOOwUXchL7riPR9WbawuQb0TwPMOm9tK61IF+fKxSqBImHOGbDiiJyc=
X-Gm-Gg: ASbGncstBPifeUBln8UHkRZawL729v6MXaYacLy9m9d40ManHvPwljb69TAPVtUkS+3
	xBbgypzvS3UKgflynNu5Z26HS2uwsfGX96BAaMC8Da//HGQqFj1PzOd05D/fIyLPzcMSQ2UfDwI
	aWfvSpxGoUCmtyt2NmqZJ65NIp/W94NrSNmtdTOOJjr6cEUFjxgBEBWTwj06n1qplNxW71tMIut
	a9HW8cVlA7c4FffxIGDDiv7g/55rPyZNldzCgxJC+K+L7Hzal8GZDe0h8OjjVJ145chD3qlef7X
	H8JEK4EmxdcW3fZKJZ35mkg9ieb9fCh741fuXAnQZkbwyuPpIV3ka9ua0xx33D5eLm1oWA==
X-Google-Smtp-Source: AGHT+IHQ535n0QA2COW4KxgJhYDC5l8yNht6HeovLAUQ6LzoicprfT4zy9/VUUX2qQcf/7mXsoAJng==
X-Received: by 2002:a17:903:19e7:b0:234:d292:be7a with SMTP id d9443c01a7336-23c6e4e4c8fmr85926675ad.1.1751535076424;
        Thu, 03 Jul 2025 02:31:16 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f0babsm158604535ad.58.2025.07.03.02.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 02:31:15 -0700 (PDT)
Date: Thu, 3 Jul 2025 15:01:00 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 15/24] ACPI: property: Add support for cells property
Message-ID: <aGZN1HzGk1nBWEHw@sunil-laptop>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-16-apatel@ventanamicro.com>
 <CAJZ5v0iYYuK2GF2Pg3NiO4vLFzoYm6Q3Dnk5O2DkMJm1R3qSfQ@mail.gmail.com>
 <aGUaFX9WgTW1I_ZO@smile.fi.intel.com>
 <CAJZ5v0h=qzS67Xu6NUfN_LmQUmKF9=AtkaRrTx81td0m-mRNNg@mail.gmail.com>
 <aGVK7NxRdDIGRzNR@sunil-laptop>
 <CAJZ5v0hTzrxqfejxSxqh9igiDp=8LkBw+FGSf9CJ7j3RyTJLBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hTzrxqfejxSxqh9igiDp=8LkBw+FGSf9CJ7j3RyTJLBQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_023117_446664_5369705D 
X-CRM114-Status: GOOD (  30.52  )
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

T24gV2VkLCBKdWwgMDIsIDIwMjUgYXQgMDY6NTY6NDhQTSArMDIwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gV2VkLCBKdWwgMiwgMjAyNSBhdCA1OjA24oCvUE0gU3VuaWwgViBMIDxz
dW5pbHZsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgSnVsIDAyLCAy
MDI1IGF0IDAyOjM5OjMwUE0gKzAyMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gPiBP
biBXZWQsIEp1bCAyLCAyMDI1IGF0IDE6MzjigK9QTSBBbmR5IFNoZXZjaGVua28KPiA+ID4gPGFu
ZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBP
biBXZWQsIEp1bCAwMiwgMjAyNSBhdCAxMjoyMDo1NVBNICswMjAwLCBSYWZhZWwgSi4gV3lzb2Nr
aSB3cm90ZToKPiA+ID4gPiA+IE9uIFdlZCwgSnVsIDIsIDIwMjUgYXQgNzoxNuKAr0FNIEFudXAg
UGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IC4u
Lgo+ID4gPiA+Cj4gPiA+ID4gPiA+ICBzdGF0aWMgaW50IGFjcGlfZndub2RlX2dldF9yZWZlcmVu
Y2VfYXJncyhjb25zdCBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLAo+ID4gPiA+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpwcm9w
bmFtZSwgY29uc3QgY2hhciAqbmFyZ3NfcHJvcCwKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGFyZ3NfY291bnQsIHVuc2ln
bmVkIGludCBpbmRleCwKPiA+ID4gPgo+ID4gPiA+ID4gPiAgICAgICAgIGNvbnN0IHN0cnVjdCBh
Y3BpX2RldmljZV9kYXRhICpkYXRhOwo+ID4gPiA+ID4gPiAgICAgICAgIHN0cnVjdCBmd25vZGVf
aGFuZGxlICpyZWZfZndub2RlOwo+ID4gPiA+ID4gPiAgICAgICAgIHN0cnVjdCBhY3BpX2Rldmlj
ZSAqZGV2aWNlOwo+ID4gPiA+ID4gPiArICAgICAgIHVuc2lnbmVkIGludCBuYXJnc19jb3VudDsK
PiA+ID4gPiA+ID4gICAgICAgICBpbnQgcmV0LCBpZHggPSAwOwo+ID4gPiA+Cj4gPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIG5hcmdzX2NvdW50ID0gYWNwaV9md25vZGVfZ2V0X2Fy
Z3NfY291bnQoZGV2aWNlLCBuYXJnc19wcm9wKTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIHRoaW5r
IGl0IHNob3VsZCB3b3JrIHRoZSBzYW1lIHdheSBhcyBpdCB1c2VkIHRvIGZvciB0aGUgY2FsbGVy
cyB0aGF0Cj4gPiA+ID4gPiBwYXNzIGFyZ3NfY291bnQsIHNvIG1heWJlCj4gPiA+ID4gPgo+ID4g
PiA+ID4gaWYgKCFhcmdzX2NvdW50KQo+ID4gPiA+ID4gICAgICAgICBhcmdzX2NvdW50ID0gYWNw
aV9md25vZGVfZ2V0X2FyZ3NfY291bnQoZGV2aWNlLCBuYXJnc19wcm9wKTsKPiA+ID4gPgo+ID4g
PiA+IEJ1dCB0aGlzIGlzIGRpZmZlcmVudCB2YXJpYWJsZS4KPiA+ID4KPiA+ID4gT2YgY291cnNl
IGl0IGlzIGRpZmZlcmVudC4gIEl0IGlzIGFuIGFjcGlfZndub2RlX2dldF9yZWZlcmVuY2VfYXJn
cygpIHBhcmFtZXRlci4KPiA+ID4KPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ZWxlbWVudCsrOwo+ID4gPiA+ID4gPiAtCj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldCA9IGFjcGlfZ2V0X3JlZl9hcmdzKGlkeCA9PSBpbmRleCA/IGFyZ3MgOiBOVUxMLAo+
ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBhY3BpX2Z3bm9kZV9oYW5kbGUoZGV2aWNlKSwKPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmVsZW1lbnQsIGVuZCwgYXJnc19jb3Vu
dCk7Cj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZlbGVtZW50LCBlbmQsCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG5hcmdzX2NvdW50ID8gbmFyZ3NfY291bnQgOiBhcmdz
X2NvdW50KTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiBBbmQgdGhpcyBjaGFuZ2Ugd291bGQgbm90IGJl
IG5lY2Vzc2FyeT8KPiA+ID4gPgo+ID4gPiA+IFRoaXMgaXMgbm90IHRoZSBzYW1lIGNoZWNrIGFz
IHByb3Bvc2VkIGFib3ZlLgo+ID4gPgo+ID4gPiBObywgaXQgaXMgbm90Lgo+ID4gPgo+ID4gPiBJ
dCBqdXN0IG1ha2VzIHRoZSBmdW5jdGlvbiB3b3JrIHRoZSBzYW1lIHdheSBpdCBkaWQgYmVmb3Jl
IHRoZSBjaGFuZ2UKPiA+ID4gZm9yIHRoZSBjYWxsZXJzIHdobyBwYXNzZWQgbm96ZXJvIGFyZ3Nf
Y291bnQgYW5kIHNvIHRoZXkgbWlnaHQgYmUKPiA+ID4gZm9yZ2l2ZW4gZXhwZWN0aW5nIHRoYXQg
aXQgd291bGQgYmUgdGFrZW4gaW50byBhY2NvdW50Lgo+ID4KPiA+IEJ1dCBpZiB3ZSBkbyBsaWtl
IHRoaXMsIHRoZSBleHBlY3RhdGlvbiBvZgo+ID4gZndub2RlX3Byb3BlcnR5X2dldF9yZWZlcmVu
Y2VfYXJncygpIHdpbGwgZGlmZmVyIGZvciBEVCBhbmQgQUNQSSwgcmlnaHQ/Cj4gPiBJIG1lYW4g
bmFyZ3NfcHJvcCBzaG91bGQgdGFrZSBoaWdoZXIgcHJlY2VkZW5jZSB0aGFuIG5hcmdzLgo+IAo+
IFNvIHlvdSBiYXNpY2FsbHkgd2FudCBhY3BpX2Z3bm9kZV9nZXRfcmVmZXJlbmNlX2FyZ3MoKSB0
byB0YWtlCj4gbmFyZ3NfcHJvcCBpbnRvIGFjY291bnQgKHdoaWNoIGNvdWxkIGJlIGV4cGxhaW5l
ZCBtdWNoIGNsZWFuZXIgaW4gdGhlCj4gcGF0Y2ggY2hhbmdlbG9ncykuCj4gClN1cmUuIExldCBt
ZSBpbXByb3ZlIHRoZSBjb21taXQgbWVzc2FnZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLgouCj4gQWxz
bywgeW91ciBjaGFuZ2VzIGRvbid0IG1vZGlmeSB0aGUgYmVoYXZpb3Igb2YKPiBfX2FjcGlfbm9k
ZV9nZXRfcHJvcGVydHlfcmVmZXJlbmNlKCkgQUZBSUNTLCBzbyB0aGlzIGlzIE9LLgo+IApUaGF0
J3MgY29ycmVjdC4KCj4gTmV2ZXIgbWluZCB0aGVuLCBidXQgeW91IGNvdWxkIHBhc3MgbmFyZ3Nf
cHJvcCBhbG9uZyB3aXRoIHRoZQo+IGFkZGl0aW9uYWwgZGV2aWNlIHBhcmFtZXRlciB0byBhY3Bp
X2dldF9yZWZfYXJncygpIGFuZCBtYWtlIHRoYXQKPiBmdW5jdGlvbiBvYnRhaW4gdGhlIG5hcmdz
X3Byb3AgdmFsdWUuICBJbiB0aGUgcGF0Y2gsIHlvdSBuZWVkIHRvIGdldAo+IHRoZSBuYXJnc19w
cm9wIHZhbHVlIGJlZm9yZSBjYWxsaW5nIGl0IGFueXdheSBpbiBib3RoIHBsYWNlcyBpbiB3aGlj
aAo+IGl0IGlzIHVzZWQuClRoYXQncyBiZXR0ZXIuIExldCBtZSB1cGRhdGUgYWNwaV9nZXRfcmVm
X2FyZ3MoKSBpdHNlbGYgaW4gdGhlIG5leHQKdmVyc2lvbi4KClRoYW5rcyEKU3VuaWwKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
