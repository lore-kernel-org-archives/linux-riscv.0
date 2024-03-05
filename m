Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0710CC54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 08:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E+3jZ5ZsVLW/6xjIEJICbIq08y6xvKV1lqPszuhvc3I=; b=SaG/nhsmr1QQyu
	jh8lVQdxXLW0umy1Fnd/8fazaaH0n851e3HnvzAd/ocgR4uyBFU+lDA05BvmVHoasUF/E25PdJtAJ
	nb9dL4F8izdRdIURvdQnVoHg1hi2Fnx8SiJ7rkzaun8JrGVuSFH/9iPcRdi7rinLo4YaOBj7StXzD
	Goy5ksS5dIQjkyzFitFE2vKNvB8dwjOlnw3vmC/0JczstpTAybz0kR65ubhWvs3qa/pAR3bvUXCth
	SDx5rH6OM65P86+LnsJLIyeaF96WH9LKlRPkthZHOs9iLw54RhKL7Q1hJPAazueBOkaq/4y4+BZhu
	Bfi9OO6N1AelPJZLTkkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhQDu-0000000CclG-259V;
	Tue, 05 Mar 2024 08:32:30 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhQDr-0000000Ccje-0UQq
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 08:32:28 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2d2509c66daso68778581fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Mar 2024 00:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709627545; x=1710232345; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ethXSKdD3YM8zYFiv0Mh/2ibhnJt7eqBZOvLVeN7M8o=;
        b=EWdimCMcUgJrGe2/fTi2actlIEkoYbN2WRmdIuSgXH4BIKEW0VhlKQwa3Xfsdgd3e5
         R1NCSrgf8uTNyHmH7bc1F6d9t47Y8QsHN0YKRPa59Y0Nc+s0hzFlHoLahfe66KxLinZU
         ubtmhs0YD9GW0FJRXFYq9dNsYJ9DBpFJUSbsB/hsHXc/37MPiRmOWp1v1nNwm/uWT93D
         nvNqIkwasx9gO7Y2gnvFSiC9PhL/rXH/QnYjWOoim8a0HN7e8+5wFmBEKUbIjzd2Yz6n
         Oip+ad6nBVYer7+Q2aU3hJ8LvUk9NYsirnlLYJPbjROJzUbEnaLdSYY/0uxFkvMkSOsD
         0RIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709627545; x=1710232345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ethXSKdD3YM8zYFiv0Mh/2ibhnJt7eqBZOvLVeN7M8o=;
        b=nKZslVbZ6wwp1c/WQ0LWTedGe2Or2/8Vxos4PHkmvX6Z8UJFdJCq8HU53c9qGmvu7/
         TFC7Y+ny5/J8TMzIHzYGeKxFb+oEmIQOmUwMxyfAqBncY6au5GbAJAQGLq5S4jE35QTI
         5kDZbo5QzVwZJEvar8IcF7VS4unWUFfMhuPX49F1EOGXLVMQLnQBxbzjNjP9Qahclxmv
         WQBlF83rEuVQ7kCvjKWA9i/LHWVEog8r+0iYGTRnKM5l203xo/YChj7Q6uxk/piZdxU+
         CVLiW4O3N13lXZFJq043pQOxXMor6c+Q2m0cArx4gRO10ylDAqw/AnO4U6tbjoFl/PKp
         ghUg==
X-Forwarded-Encrypted: i=1; AJvYcCVjaPUHIlWDiPKD7dPw+W+T4hWTIohzOxdjQoSUkFjljX5L122/57TUw409GHaDok8+q/MiRjwbmt4p5ZsOt+L1K5+NI9MqwhHKbu4XZcpr
X-Gm-Message-State: AOJu0Yy0krly7cL+gn7gVX4OZniJ+CLV3hkFMXdqWxeCcFFm+x1MUTGx
	DZMBhaQCj5fpQT0hFrdgCsQQrwOYfFJttIVPo1y1hXIkb1SBcbRj0QyiP5oFNLtuRJjrcw7Wrbr
	vJ/r8lggfSGNwvRO39cfMnvcoqog=
X-Google-Smtp-Source: AGHT+IHOYeWGaFKAzUJPrDZmmHE+LVTyfiv0q3uVMfUxGU07PXgnFSmnCFMHXZtTfZpJfuf1uxbMfPp+8OPCiwRzXhU=
X-Received: by 2002:a2e:a23b:0:b0:2d2:b915:e073 with SMTP id
 i27-20020a2ea23b000000b002d2b915e073mr631884ljm.27.1709627544665; Tue, 05 Mar
 2024 00:32:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1706603678.git.haibo1.xu@intel.com> <0be49d4d7d7e43933534aad6f72b35d3380519fd.1706603678.git.haibo1.xu@intel.com>
 <ZeatCIUZ/eJa1WHs@sunil-laptop>
In-Reply-To: <ZeatCIUZ/eJa1WHs@sunil-laptop>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Tue, 5 Mar 2024 16:32:13 +0800
Message-ID: <CAJve8onPknQLfZNwUMUm3SSy8rPOJoLvcbzNAFB64EuznEn2jA@mail.gmail.com>
Subject: Re: [PATCH 4/4] ACPI: RISCV: Enable ACPI based NUMA
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Guo Ren <guoren@kernel.org>, Anup Patel <apatel@ventanamicro.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Jisheng Zhang <jszhang@kernel.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Baoquan He <bhe@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Chen Jiahao <chenjiahao16@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
	James Morse <james.morse@arm.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Evan Green <evan@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Tony Luck <tony.luck@intel.com>, Yuntao Wang <ytcoode@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_003227_174969_4A83FB52 
X-CRM114-Status: GOOD (  18.06  )
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

T24gVHVlLCBNYXIgNSwgMjAyNCBhdCAxOjI24oCvUE0gU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKYW4gMzEsIDIwMjQgYXQgMTA6MzI6MDFB
TSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBFbmFibGUgQUNQSSBiYXNlZCBOVU1BIGZvciBS
SVNDViBpbiBLY29uZmlnLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIFh1IDxoYWlibzEu
eHVAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICB8IDEg
Kwo+ID4gIGRyaXZlcnMvYWNwaS9udW1hL0tjb25maWcgfCAyICstCj4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBpbmRleCBiZmZiZDg2
OWEwNjguLmU1ODZhYjk1OWYzNCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+
ID4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBAQCAtNDM4LDYgKzQzOCw3IEBAIGNvbmZp
ZyBOVU1BCj4gPiAgICAgICBzZWxlY3QgSEFWRV9TRVRVUF9QRVJfQ1BVX0FSRUEKPiA+ICAgICAg
IHNlbGVjdCBORUVEX1BFUl9DUFVfRU1CRURfRklSU1RfQ0hVTksKPiA+ICAgICAgIHNlbGVjdCBO
RUVEX1BFUl9DUFVfUEFHRV9GSVJTVF9DSFVOSwo+ID4gKyAgICAgc2VsZWN0IEFDUElfTlVNQSBp
ZiBBQ1BJCj4gPiAgICAgICBzZWxlY3QgT0ZfTlVNQQo+ID4gICAgICAgc2VsZWN0IFVTRV9QRVJD
UFVfTlVNQV9OT0RFX0lECj4gPiAgICAgICBoZWxwCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9h
Y3BpL251bWEvS2NvbmZpZyBiL2RyaXZlcnMvYWNwaS9udW1hL0tjb25maWcKPiA+IGluZGV4IDg0
OWMyYmQ4MjBiOS4uNTI1Mjk3YzQ0MjUwIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9hY3BpL251
bWEvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9hY3BpL251bWEvS2NvbmZpZwo+ID4gQEAgLTIs
NyArMiw3IEBACj4gPiAgY29uZmlnIEFDUElfTlVNQQo+ID4gICAgICAgYm9vbCAiTlVNQSBzdXBw
b3J0Igo+ID4gICAgICAgZGVwZW5kcyBvbiBOVU1BCj4gPiAtICAgICBkZXBlbmRzIG9uIChYODYg
fHwgQVJNNjQgfHwgTE9PTkdBUkNIKQo+ID4gKyAgICAgZGVwZW5kcyBvbiAoWDg2IHx8IEFSTTY0
IHx8IExPT05HQVJDSCB8fCBSSVNDVikKPiBJcyBpdCBwb3NzaWJsZSB0byByZW1vdmUgdGhpcyBp
ZiBJQTY0IGlzIHJlbW92ZWQgbm93Pwo+CgpZZXMuIEFybmQgYWxzbyBzdWdnZXN0IHJlbW92aW5n
IHRoaXMgdG90YWxseS4KV2lsbCB1cGRhdGUgaXQgaW4gdjIuCgo+IFRoYW5rcywKPiBTdW5pbAo+
ID4gICAgICAgZGVmYXVsdCB5IGlmIEFSTTY0Cj4gPgo+ID4gIGNvbmZpZyBBQ1BJX0hNQVQKPiA+
IC0tCj4gPiAyLjM0LjEKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
