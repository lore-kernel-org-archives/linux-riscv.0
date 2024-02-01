Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA88AC4828E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 18:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DEAZTjhMt5x/3hTZUK6wwoAHgZDhj/s9G8y6kX3vTzk=; b=i3xf89zvUsfdNX
	C9jNZi1sQyekfyVr1LeFPQ3V7gAJkkISA8GxX8EZ4GtqxUOv+DOqy5W66gtCLhbgE66lyx8gJrjqL
	S665/MZTgXuD252C1WsXa5cOGYzjQo3qqCvuSfEVlxePP3O8mTFDvZFnoyKkDpdQjVpt8T1A1wzwt
	8+SwHuHE06pfZa0DmuBf8gRsNuqTzZyKE0rJy8VIMa6S3n0eSa8UbRL8o3Iu2CeB9V9PWJY0gRHg0
	/H+WFbI5gE4S/35OCGWIdIdDs9HeGyTE4wQXQrU6tNKEnd9+Da6Dg1/dLvLzQBC31+DZ5/lDoYLH4
	ls5RGqCkJjlRh0T7oTaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbN9-00000008tJi-3NbD;
	Thu, 01 Feb 2024 18:01:11 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbN5-00000008tHU-2n1g;
	Thu, 01 Feb 2024 18:01:08 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-59a24bf7cadso297050eaf.0;
        Thu, 01 Feb 2024 10:01:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706810462; x=1707415262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+5pS4TaGyELI1G1YPB5J1wpziVptg2Mkm99YXYdlhw=;
        b=sTFM/b/XKPr3Z69F78vOPecDryT46kevReCLDKxS2L+7/H8gOXg5BiqVOFVCQdOv/K
         jsQJA7S8Kog/baCh/t5eXanSo7lTEB65zPwVf/QqJsrx2waJEjBEOQjFoJ9M8HbLQXCu
         R7Iuu4WUiOAEimglAHcdMN1/2L7TE0FMYsyBq8GbaiLuJteriE2hlFhqomE8r3Fb/HWm
         rkB1ZCJ4V+y634XtfOZtMvI+rPL0aOVmu7sgNmo+YRrBmRsUv9pMG8aQJ1tHw6tnOWKj
         3Aove7/FRvIYi0YWNTx3n0F4QJOopfDRjmBmIOWCNgPQqpW8LBI+d2/NKd1NEaJdDnZH
         ncIw==
X-Forwarded-Encrypted: i=0; AJvYcCVCZLG46nr2N42Y7xlDYS7lLHz+aIYpZhBH1qZX3QjEeWf9xkDLi+zFTHgHBIGTIfe15fs3Xi6vntTA1Z+P8IPL7utFKQDrFVv5HowItaxi
X-Gm-Message-State: AOJu0YyAxtSVK61ARUCRuNA/c3BvLo7AtbcIG5IiqM0cBPuyJgO2QysA
	7mKWC02VlxWW2ASpeZwe5Pcg9We+7hAUjef9DmP4vCumE+oqJvD9IMmi7KhTUZadZtUVRLADuvs
	PTqZwUkXn/SWXtayo9WUNPa1oQfk=
X-Google-Smtp-Source: AGHT+IFiN/evHJKKXCQlo4OwGibcFnmCUxqxoDhfEwf75cnMo0APq25APzPgqNRHLAa8lK0nOq0aeEdwkZhWN6YDwSI=
X-Received: by 2002:a05:6820:1c96:b0:59a:bf5:a0da with SMTP id
 ct22-20020a0568201c9600b0059a0bf5a0damr3994479oob.0.1706810462504; Thu, 01
 Feb 2024 10:01:02 -0800 (PST)
MIME-Version: 1.0
References: <20231025202344.581132-1-sunilvl@ventanamicro.com> <20231025202344.581132-6-sunilvl@ventanamicro.com>
In-Reply-To: <20231025202344.581132-6-sunilvl@ventanamicro.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 1 Feb 2024 19:00:51 +0100
Message-ID: <CAJZ5v0hHYa4c2U-tegdBtoTak=MirXwyBXbN9yrWPx_x-+yMzg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 05/21] pnp.h: Return -EPROBE_DEFER for disabled IRQ
 resource in pnp_irq()
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-serial@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Anup Patel <anup@brainfault.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
	Haibo Xu <haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_100107_769521_7B5582B6 
X-CRM114-Status: GOOD (  17.93  )
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

T24gV2VkLCBPY3QgMjUsIDIwMjMgYXQgMTA6MjTigK9QTSBTdW5pbCBWIEwgPHN1bmlsdmxAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBUbyBzdXBwb3J0IGRlZmVycmVkIFBOUCBkcml2ZXIg
cHJvYmUsIHBucF9pcnEoKSBtdXN0IHJldHVybiAtRVBST0JFX0RFRkVSCj4gc28gdGhhdCB0aGUg
ZGV2aWNlIGRyaXZlciBjYW4gZG8gZGVmZXJyZWQgcHJvYmUgaWYgdGhlIGludGVycnVwdCBjb250
cm9sbGVyCj4gaXMgbm90IHByb2JlZCBlYXJseS4KPgo+IFNpZ25lZC1vZmYtYnk6IFN1bmlsIFYg
TCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L3BucC5o
IHwgMTAgKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcG5wLmggYi9pbmNsdWRl
L2xpbnV4L3BucC5oCj4gaW5kZXggYzJhN2NmYmNhNzEzLi4yMWNmODMzNzg5ZmIgMTAwNjQ0Cj4g
LS0tIGEvaW5jbHVkZS9saW51eC9wbnAuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvcG5wLmgKPiBA
QCAtMTQ3LDEyICsxNDcsMTggQEAgc3RhdGljIGlubGluZSByZXNvdXJjZV9zaXplX3QgcG5wX21l
bV9sZW4oc3RydWN0IHBucF9kZXYgKmRldiwKPiAgfQo+Cj4KPiAtc3RhdGljIGlubGluZSByZXNv
dXJjZV9zaXplX3QgcG5wX2lycShzdHJ1Y3QgcG5wX2RldiAqZGV2LCB1bnNpZ25lZCBpbnQgYmFy
KQo+ICtzdGF0aWMgaW5saW5lIGludCBwbnBfaXJxKHN0cnVjdCBwbnBfZGV2ICpkZXYsIHVuc2ln
bmVkIGludCBiYXIpCj4gIHsKPiAgICAgICAgIHN0cnVjdCByZXNvdXJjZSAqcmVzID0gcG5wX2dl
dF9yZXNvdXJjZShkZXYsIElPUkVTT1VSQ0VfSVJRLCBiYXIpOwo+Cj4gLSAgICAgICBpZiAocG5w
X3Jlc291cmNlX3ZhbGlkKHJlcykpCj4gKyAgICAgICBpZiAocG5wX3Jlc291cmNlX3ZhbGlkKHJl
cykpIHsKPiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0FSQ0hfQUNQSV9ERUZFUlJFRF9HU0kpCj4g
KyAgICAgICAgICAgICAgIGlmICghcG5wX3Jlc291cmNlX2VuYWJsZWQocmVzKSkKPiArICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gLUVQUk9CRV9ERUZFUjsKPiArI2VuZGlmCgpXaGF0IHdv
dWxkIGJlIHdyb25nIHdpdGgKCmlmIChJU19FTkFCTEVEKENPTkZJR19BUkNIX0FDUElfREVGRVJS
RURfR1NJKSAmJiAhcG5wX3Jlc291cmNlX2VuYWJsZWQocmVzKSkKICAgICAgICByZXR1cm4gLUVQ
Uk9CRV9ERUZFUjsKCj8KCj4gKwo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmVzLT5zdGFydDsK
PiArICAgICAgIH0KPiAgICAgICAgIHJldHVybiAtMTsKPiAgfQo+Cj4gLS0KPiAyLjM5LjIKPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
