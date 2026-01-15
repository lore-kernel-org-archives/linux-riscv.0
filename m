Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9220D3CCB3
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 06:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+Mq5p0V77Im0tF5mL6foz4qHznvheEz5t6uG8CRQY8=; b=XJOoVOt7+E6ODi
	LchGtcPj6AsBK8f1CEa+OUlscdb/qKbbeQKVvzQLaZtmD/UjZy203yq70VL3cvbkaFyeUEKznXaxA
	Yg3CeyBEqs0kK8ScjfUwWTj2ojmI5OnQgRrYL9ifo/GQgLWKBaNUXdhCGaI0uQ2tOaLPd8YHJmUWm
	9GbtQbxF6b/7LvH/RL6Jzq4LndFUdCQ14B9nGTMX8DeiKBJ5pjwQ/JhdFceq5CBn4ffZ3VxabIKyh
	QO4f8Ek1bs9V9/8glR2wh2UrHHm0KprKPgCEKhPhOtUAcF/shUcUufa/bCjhLj8d5mBenKBeBWXgb
	4+JYaPSBPwCuBVVYxIzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHGz-0000000BtpW-2JBc;
	Thu, 15 Jan 2026 06:56:01 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHGw-0000000Btp0-3l1V
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 06:56:00 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-64b791b5584so910361a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 22:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768460156; x=1769064956; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYnt5uZdVRjX/TH2DmOHbsi489uV8nGgAATMESeXy9M=;
        b=Usb46/sfEYexFZbnxfsbjf0CgaEFLqzzx/1K6mhvazZoS7H4m2Yev8OuUYNw2rg5aQ
         btwrj32zLK8El4Fi9K3plLnTN5wfyxu5n3VE40D0wVtH/Bkqg3IkQaFHzFho3fPBTdHy
         ESDFU0U4tzy8jHeup2xrLM5Q95Wf7pG8YC/Bjy3OIBusbjYjUeLvQM113u3e8AJUsYK+
         NuFQ94XxBrqeFHKxpxDSvhUoiMH0tvL7CmMDKn1R0N+EkKsi/wi5K+s1PI3ipyB1D3p8
         /9n3+BYgYJNX78RBFThvPDbMXFBIC6hesbeNOCrnAs01esyuK9XXzVv3QxgC5t+pAREt
         4K1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768460156; x=1769064956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yYnt5uZdVRjX/TH2DmOHbsi489uV8nGgAATMESeXy9M=;
        b=TD27ul47IEkcK0zUXbOowTDLwJY+FUIJe6ooDlDY8YeAS6nwqB8PazKLR21L7IFFzm
         654ly/jyh0Wl3K3Q3Zm2OLETv0U0zkS/J4QJc8Ulq5tGWY03wWe7pZwh6f/3eYcgxG4Y
         8a1vzXAzUUAjvUGb3IGdSlMbdIvXkgExzD6c1EoHwpAS0O9ICJltWYjg0ummPHXreMec
         UhofUs5AfYjyeL1kOZIGUVwsJaPAjSwYnFxBn07lTpSzpoCkumKS7HND8OvYHL9MxPRs
         21kjSLBujLqbALjnh5vaghgf3S59tTRLa5ZfCkRFYqwISuKzNdJaJ2m0yaShOUnEn+er
         ZAOw==
X-Forwarded-Encrypted: i=1; AJvYcCVSr8jLAiI2ANb9siBXclzhGkQxC93sL/pDJ+jApKEke87THdLSyB9mQzuKubkztfUUqCcvu7prb878oQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyN393EiKqMHkUXGyjWR9lvHuPX1cFhmbhIf8IgaPspEdaSlYr7
	tPXJxudnJrbYnwqQ3HoTbQ7qGuRPQpWRrtVHUul4cZyXNNi/euu9M+tH4uhlHgKFfInYSqkdFmX
	VCjLXg87Wu49Hu3PO+HOO7807Or2iUUA=
X-Gm-Gg: AY/fxX4AUzeEuaElgREYSe0AIPzlX6/Kc+8mvpE8/bj4kqolb3j4JEH5/Ce9YV4Lkkx
	RTT86+Enh4K2k90YWr55t9EgDzhQ0vT0xa8Se4pwZodI8aMfolI9M/bcky+2pM0rWk6KEaluyPd
	I9HCzSZ5PcsoVyl0wAS/2MPHpDmUW0kY2YUzb2b2t4X/fJG//MJXEQgma3yWRoTt6RMBeVDOprW
	7mtM36VgHy3sA6jiCOR8nZ9U9UOWdQG8jHptZ7smo9KrWpk4I1YvuraqCAOVrmjyHFU2oQe7sCA
	2pscgXiKg2j3jUqdKbkPRPjr78mlU1rGYQqBNrh274eyD64aE8n+CJ0qJ/ZclCoFfNteUu6Bn8I
	tQ7bmrbs=
X-Received: by 2002:a17:907:3f98:b0:b87:2630:e67b with SMTP id
 a640c23a62f3a-b8761286700mr421274866b.50.1768460156172; Wed, 14 Jan 2026
 22:55:56 -0800 (PST)
MIME-Version: 1.0
References: <20260113082748.250916-1-jiangfeng@kylinos.cn> <20260113082748.250916-2-jiangfeng@kylinos.cn>
 <20260114000151.GB2178@quark> <20260114101034.7961852a@pumpkin> <19a5a6bd-2645-4be6-9e21-c78e820886c5@kylinos.cn>
In-Reply-To: <19a5a6bd-2645-4be6-9e21-c78e820886c5@kylinos.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 15 Jan 2026 08:55:19 +0200
X-Gm-Features: AZwV_QgcQg2yFl3kenFIgEZA_bCo4ozJi3yvM8wLZL_115P5Z6TtaUVc7xL-Q90
Message-ID: <CAHp75VenLXeWBjvjd6A2q6gepQdqkgGFzTMHZ-UY1s+4UHP14w@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] lib/string: extract generic strlen() into __generic_strlen()
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: David Laight <david.laight.linux@gmail.com>, Eric Biggers <ebiggers@kernel.org>, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, kees@kernel.org, 
	andy@kernel.org, akpm@linux-foundation.org, martin.petersen@oracle.com, 
	ardb@kernel.org, ajones@ventanamicro.com, conor.dooley@microchip.com, 
	samuel.holland@sifive.com, linus.walleij@linaro.org, nathan@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_225558_950411_03DE27B2 
X-CRM114-Status: GOOD (  23.87  )
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

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgODo1MeKAr0FNIEZlbmcgSmlhbmcgPGppYW5nZmVuZ0Br
eWxpbm9zLmNuPiB3cm90ZToKPiBPbiAyMDI2LzEvMTQgMTg6MTAsIERhdmlkIExhaWdodCB3cm90
ZToKPiA+IE9uIFR1ZSwgMTMgSmFuIDIwMjYgMTY6MDE6NTEgLTA4MDAKPiA+IEVyaWMgQmlnZ2Vy
cyA8ZWJpZ2dlcnNAa2VybmVsLm9yZz4gd3JvdGU6CgouLi4KCj4gPj4gQSBzaW1pbGFyIHByb2Js
ZW0gZXhpc3RzIHdpdGggdGhlIGFyY2hpdGVjdHVyZS1vcHRpbWl6ZWQgQ1JDIGFuZCBjcnlwdG8K
PiA+PiBmdW5jdGlvbnMuICBIaXN0b3JpY2FsbHksIHRoZXNlIHN1YnN5c3RlbXMgZXhwb3J0ZWQg
Ym90aCBnZW5lcmljIGFuZAo+ID4+IGFyY2hpdGVjdHVyZS1vcHRpbWl6ZWQgZnVuY3Rpb25zLgo+
ID4+Cj4gPj4gV2UndmUgYWN0dWFsbHkgYmVlbiBtb3ZpbmcgYXdheSBmcm9tIHRoYXQgZGVzaWdu
IHRvIHNpbXBsaWZ5IHRoaW5ncy4KPiA+PiBGb3IgZXhhbXBsZSwgZm9yIENSQy0zMkMgdGhlcmUn
cyBub3cganVzdCB0aGUgY3JjMzJjKCkgZnVuY3Rpb24gd2hpY2gKPiA+PiBkZWxlZ2F0ZXMgdG8g
dGhlICJiZXN0IiBDUkMtMzJDIGltcGxlbWVudGF0aW9uLCB3aXRoIG5vIGRpcmVjdCBhY2Nlc3Mg
dG8KPiA+PiB0aGUgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbiBvZiBDUkMtMzJDLgo+ID4+Cj4gPj4g
Y3JjX2t1bml0IHRoZW4ganVzdCB0ZXN0cyBhbmQgYmVuY2htYXJrcyBjcmMzMmMoKS4gIFRvIGNo
ZWNrIGhvdyB0aGUKPiA+PiBwZXJmb3JtYW5jZSBvZiBjcmMzMmMoKSBjaGFuZ2VzIHdoZW4gaXRz
IGltcGxlbWVudGF0aW9uIGNoYW5nZXMgKHdoZXRoZXIKPiA+PiB0aGUgY2hhbmdlIGlzIHRoZSBh
ZGRpdGlvbiBvZiBhbiBhcmNoLW9wdGltaXplZCBpbXBsZW1lbnRhdGlvbiBvciBhCj4gPj4gY2hh
bmdlIGluIGFuIGV4aXN0aW5nIGFyY2gtb3B0aW1pemVkIGltcGxlbWVudGF0aW9uKSwgdGhlIGRl
dmVsb3BlciBqdXN0Cj4gPj4gbmVlZHMgdG8gcnVuIGNyY19rdW5pdCB3aXRoIHR3byBrZXJuZWxz
LCBiZWZvcmUgYW5kIGFmdGVyLgo+ID4KPiA+IEZvciB0aGUgbXVsX2RpdiB0ZXN0cyBJIGFycmFu
Z2VkIHRoYXQgdGhlIHRlc3QgY29kZSBjb3VsZCAjaW5jbHVkZSB0aGUKPiA+IHNvdXJjZSBmb3Ig
dGhlIGdlbmVyaWMgaW1wbGVtZW50YXRpb24gc28gaXQgY291bGQgcnVuIHRoYXQgYXMgd2VsbCBh
cwo+ID4gdGhlIHZlcnNpb24gY29tcGlsZWQgaW50byB0aGUgbWFpbiBrZXJuZWwuCj4gPgo+ID4g
VGhpcyBpbnZvbHZlZCB3cmFwcGluZyB0aGUgZnVuY3Rpb24gaW46Cj4gPiAjaWYgIWRlZmluZWQo
ZnVuY3Rpb24pIHx8IGRlZmluZWQodGVzdF9mdW5jdGlvbikKPiA+IHR5cGUgZnVuY3Rpb24oYXJn
cykKPiA+IC4uLgo+ID4gfQo+ID4gI2lmICFkZWZpbmVkKGZ1bmN0aW9uKQo+ID4gRVhQT1JUX1NZ
TUJPTChmdW5jdGlvbikKPiA+ICNlbmRpZgo+ID4gI2VuZGlmCj4gPgo+ID4gU28gdGhlIHRlc3Qg
Y29kZSBjYW4gdXNlOgo+ID4gI2RlZmluZSBmdW5jdGlvbiBnZW5lcmljX2Z1bmN0aW9uCj4gPiAj
ZGVmaW5lIHRlc3RfZnVuY3Rpb24KPiA+ICNpbmNsdWRlICJmdW5jdGlvbi5jIgo+ID4KPiA+IHRv
IGdldCBhIHByaXZhdGUgY29weSBvZiB0aGUgZ2VuZXJpYyBjb2RlLgo+Cj4gVGhhbmsgeW91IGZv
ciB0aGUgc3VnZ2VzdGlvbiEgVGhhdCB0ZWNobmlxdWUgaXMgdmVyeSBjbGV2ZXIgYW5kIGludGVy
ZXN0aW5n4oCUCj4gSSd2ZSBkZWZpbml0ZWx5IGxlYXJuZWQgc29tZXRoaW5nIG5ldyBhbmQgd2ls
bCBrZWVwIGl0IGluIG1pbmQgZm9yIHRoZSBmdXR1cmUuCj4KPiBIb3dldmVyLCBzaW5jZSBsaWIv
c3RyaW5nLmMgaXMgc3VjaCBhIGZvdW5kYXRpb25hbCBhbmQgbG93LWxldmVsIGxpYnJhcnksIEkn
bQo+IGhlc2l0YW50IHRvIGFkZCBtYWNybyB3cmFwcGVycyBvciBjb25kaXRpb25hbCBibG9ja3Mg
Zm9yIEtVbml0LiBHaXZlbiBpdHMKPiBpbXBvcnRhbmNlLCBJIGZlZWwgdGhhdCBpbmNyZWFzaW5n
IGl0cyBjb21wbGV4aXR5IGZvciBzaWRlLWJ5LXNpZGUgdGVzdGluZwo+IGlzbid0IHF1aXRlIHdv
cnRoIGl0LiBJJ2QgcHJlZmVyIHRvIGtlZXAgdGhlIGNvcmUgY29kZSBjbGVhbiBhbmQgZm9sbG93
IEVyaWMncwo+IG1pbmltYWxpc3QgYXBwcm9hY2ggb2YgYmVuY2htYXJraW5nIGFjcm9zcyBkaWZm
ZXJlbnQga2VybmVsIGNvbmZpZ3VyYXRpb25zLgo+Cj4gSSByZWFsbHkgYXBwcmVjaWF0ZSB0aGUg
Z3VpZGFuY2UhCgpJIHNlY29uZCB5b3UsIHdlIGN1cnJlbnRseSBtYXkgc3RpY2sgd2l0aCB3aGF0
IEVyaWMgcHJvcG9zZWQgYW5kCmNvbnNpZGVyIG90aGVyIGFwcHJvYWNoZXMgaW4gdGhlIGZ1dHVy
ZSB3aGVyZSBhcHByb3ByaWF0ZS4KCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hl
bmtvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
