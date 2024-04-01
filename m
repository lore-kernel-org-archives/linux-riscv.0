Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7B4CD128A
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2024 08:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TndVODfs76bp9ScDNdMMDBZvXyKSEk0o8rdz32HVBQ=; b=uY6YblKH9CygNW
	o3Z9rp3MT7FG+xUsMlzcmQvhod2CsejHGY3faEUR3EWiyyuKtItumka88voux/4E74qVsuSIiXarZ
	d/DThFw2+JMD6mvnkluL9g93wR3WmghBDv62Hm2pfmWWgcnL9zEEoqktDgm13E+eUtsHVMvvAOupX
	aGA6dqH0ZDHipRfW5oG3x9YDWOQWH7crlm7/YJYxU6THT4eT/tTlmhkXnlrjAi0c4d8fXWjTsUP6F
	LkXmdtIxRw416GwzPXaX/GHjw7uAObNwWykE1TLaSXO9368ysJu1bZfKAYaGa0zcP+0m5g73Nz/LC
	4FlnakDFYYsL2tPPUAAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrCee-00000007Bcn-38B1;
	Mon, 01 Apr 2024 08:04:32 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrCea-00000007Bbd-1tcJ
	for linux-riscv@lists.infradead.org;
	Mon, 01 Apr 2024 08:04:30 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2d717603aa5so33834161fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Apr 2024 01:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711958665; x=1712563465; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIPBLDUKvVlC/efDjwEAjrOmS6XB1w+iWO2tkQJfZSI=;
        b=KSHFeaB0A47ExuRcCHCXGhw3gAy9AfeQJKLHJrvillAvoOs4bT3seiY2PXZ8OYFDRv
         FoYMwTLO6+JbdaMaxnR55MAQ2ksxtl+/h6QqJzHOKnqu0KiEgzKGUKZeDoAj4AVG5MI8
         iZyxse3zBgAYbIm5lMNrGZ0sFrzt9xQJBGgd+k40OhZL7W+i8kfSUoYX1+XLavfNmsss
         vdn+RLnxAmLZa+aiMdqGahhKEZsIPqq05y0jcPBKRbYuuc5syghg/O1mwTOiUftqRLOp
         UTKSNbMYlBxHXtqL6hjNmAvVJr8m9WtxVOs1yZas7ym8ReSodOaxqCJwsnjCfTTGcy75
         03pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711958665; x=1712563465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIPBLDUKvVlC/efDjwEAjrOmS6XB1w+iWO2tkQJfZSI=;
        b=YUsYWh7zgH5xnyx1/Qs4WLqZaAZ2RvzGV1DQqrjgR/wIzX8BoEKYWBmHTogFjqu1Wq
         Ic5Pqe7hRXguDm/kamwj7ZIsGvLESu7oofYCuRWR27hqk8ukkLoFIId4lCF6awflNqEs
         d2HX4wd9mZJ81/9W5AyOUI1blYwK8CufrCVq9QRSEcAlk8EMPCAdAmcbEzqFvo4NwL/r
         FGxPuu/xMPxyEgY8g1N4gyoVgsn0rb3RB43gndON39FgeZQsmbiZN43/v4DjWvW7aPbW
         6RqHP5gCKFceXz0fi3JaQfc0jU1diYq7f4WKlk1VuNi+R9RRyFVBJs5jYgJ3XIoBOfSW
         +Baw==
X-Forwarded-Encrypted: i=1; AJvYcCX9Du711eHkvBhEWuUG/BbJxTqznDrEgnLG2IUslADxKWyLWWdmIy3BuP0Ex2+DuAYf+P0SBaMOJnY8SBNmutI6ZKkCieDpzK0P6QdGCO5g
X-Gm-Message-State: AOJu0YzHQBtqzOJ58nT0OQ09xfgGIgm0eWxBsQ71iYMkSlsLEtUOlzoX
	u6abeUjhybWE1HksSIuZC55pGyUVe54Vrj8/ZEinzn6Y9kS3XlOA2FBhpqxg3g2Kn12wFqjzSL6
	SGTFdThlBHMUW3W2hTp4W72EgwzY=
X-Google-Smtp-Source: AGHT+IF6MZSEh0qpjHWy2tctMPsCT4wg3Q6kZZ6mM8KnuUoKqHKr0TeNgyq+KgbADsJN1HMt9yrxPapQuQRzM4rXDtQ=
X-Received: by 2002:a2e:9141:0:b0:2d6:f085:1f64 with SMTP id
 q1-20020a2e9141000000b002d6f0851f64mr5832377ljg.48.1711958665425; Mon, 01 Apr
 2024 01:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1709780590.git.haibo1.xu@intel.com> <01cb5780041565784d459cd94a5c4f55eaa87739.1709780590.git.haibo1.xu@intel.com>
 <Zgpf0rqUSEZcSiAV@sunil-laptop>
In-Reply-To: <Zgpf0rqUSEZcSiAV@sunil-laptop>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Mon, 1 Apr 2024 16:04:13 +0800
Message-ID: <CAJve8om9-cTtYKLmB0R=6Wwh5KQ9z+16AFR-tuUkJhJjbn0UEA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ACPI: RISCV: Enable ACPI based NUMA
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Guo Ren <guoren@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Zong Li <zong.li@sifive.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Baoquan He <bhe@redhat.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen Jiahao <chenjiahao16@huawei.com>, 
	Arnd Bergmann <arnd@arndb.de>, James Morse <james.morse@arm.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Evan Green <evan@rivosinc.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Marc Zyngier <maz@kernel.org>, 
	Anup Patel <apatel@ventanamicro.com>, Tony Luck <tony.luck@intel.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Yuntao Wang <ytcoode@gmail.com>, 
	Alison Schofield <alison.schofield@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_010428_521182_6C0DC55B 
X-CRM114-Status: GOOD (  18.50  )
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

T24gTW9uLCBBcHIgMSwgMjAyNCBhdCAzOjE44oCvUE0gU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gSGkgSGFpYm8sCj4KPiBPbiBUaHUsIE1hciAwNywgMjAy
NCBhdCAwNDo0Nzo1OFBNICswODAwLCBIYWlibyBYdSB3cm90ZToKPiA+IEVuYWJsZSBBQ1BJIGJh
c2VkIE5VTUEgZm9yIFJJU0NWIGluIEtjb25maWcuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSGFp
Ym8gWHUgPGhhaWJvMS54dUBpbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L0tjb25m
aWcgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBpbmRl
eCAwYmZjZmVjNjdlZDUuLjBmYjU1ZjE2NjcwMSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yv
S2NvbmZpZwo+ID4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBAQCAtNDQ3LDYgKzQ0Nyw3
IEBAIGNvbmZpZyBOVU1BCj4gPiAgICAgICBzZWxlY3QgSEFWRV9TRVRVUF9QRVJfQ1BVX0FSRUEK
PiA+ICAgICAgIHNlbGVjdCBORUVEX1BFUl9DUFVfRU1CRURfRklSU1RfQ0hVTksKPiA+ICAgICAg
IHNlbGVjdCBORUVEX1BFUl9DUFVfUEFHRV9GSVJTVF9DSFVOSwo+ID4gKyAgICAgc2VsZWN0IEFD
UElfTlVNQSBpZiBBQ1BJCj4KPiBJZiB0aGUgZmlybXdhcmUgZGlkbid0IHByb3ZpZGUgdGhlIFNS
QVQvU0xJVCBvbiBBQ1BJIGJhc2VkIHN5c3RlbXMsIHRoZW4KPiB0aGVyZSB3aWxsIGJlIGEgbWVz
c2FnZSAiRmFpbGVkIHRvIGluaXRpYWxpc2UgZnJvbSBmaXJtd2FyZSIgZnJvbQo+IGFyY2hfYWNw
aV9udW1hX2luaXQoKS4gVGhpcyBpcyBub3Qgc3BlY2lmaWMgdG8gUklTQy1WLiBCdXQgSSBhbQo+
IHdvbmRlcmluZyB3aHkgc2hvdWxkIGl0IGJlIHByX2luZm8gaW5zdGVhZCBvZiBwcl9kZWJ1Zy4K
PgoKTXkgdW5kZXJzdGFuZGluZyBpcyBtYXliZSBpdCBqdXN0IHdhbnRzIHRvIGV4cG9zZSBleHBs
aWNpdCBsb2dzIHRvCmF2b2lkIGFueSBwb3RlbnRpYWwKYnVncyBmcm9tIEZXIG9yIEtlcm5lbC4K
Cj4gVGhhbmtzLAo+IFN1bmlsCj4gPiAgICAgICBzZWxlY3QgT0ZfTlVNQQo+ID4gICAgICAgc2Vs
ZWN0IFVTRV9QRVJDUFVfTlVNQV9OT0RFX0lECj4gPiAgICAgICBoZWxwCj4gPiAtLQo+ID4gMi4z
NC4xCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
