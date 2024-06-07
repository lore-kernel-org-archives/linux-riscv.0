Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7FAC27C53
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 08:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tVLd0z4lMgk3Qh5I3Dv1Rrm1XiLH549CY4sw7xQUmZ8=; b=XiHMiX0smabRJjbllSmKEBH+io
	2QkEnyk7GPHuuGkiachHgfattZ+ITPAuL4FS1DZGXZBaL/hLiiNXIIqEqt0VDZO2Ky3Ly5+n3//5b
	WExJA/UEtjdPMmMJ2dPc5rSOfkaWp2InMlaBZ5peUni+FquAhfeFMZjPnoTWcJT/ESTvj4f2mdWiI
	PkAsYfJ07Bn6LSwt7lXzRXO21W/Y9WsTaEsFNc4ZL4Eca7xDOjVq/VRB2682outIwZweAJrrLQY3d
	vA3hG9Sj0oC4DT20p3mr2BePBKygO4e7jq8/tfsTufczYZIxWYaURBupv592ulPYHLA2XpQ7Gl5LX
	FSGMnLgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFVDW-0000000DBBs-3MzU;
	Fri, 07 Jun 2024 08:44:58 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFVDT-0000000DBAF-14hL
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 08:44:57 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5b2e93fddafso813825eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jun 2024 01:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1717749888; x=1718354688; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBhYSibF+a35hxu2YgVd+MGY4jpXCfFZWPQQChFfVoE=;
        b=QUw/DCACqR+mvnBAKBpDpZjvJl/LpdHbrIFgpKRv8MCDiVLzJKAZMEkJM4tjID0clE
         TKylmGPxGBGGzMBANARuv0HzvkxwKmIHsZm5maq+FKV19ziB+UQ7wAUOVFAwTCrprWgh
         m01mAqM1+IPrmKd0JPd10EYM+doWfRon8ZbjKYXQL8UXMxFyOPa6lI1DzK721YWp1WsR
         KQdqS1mRJpk3wjZfPCMraIM6L01EcJtYmklzdLg55MMpNDCsUQ48y94r0OFAqW5i0mRu
         zyjMY+M1n4noBh9QjTZfLGlexpyKoT87TQQ3TwkuuAvOg7dysH3Ms/Vn7gtppfSkuMwU
         xqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717749888; x=1718354688;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBhYSibF+a35hxu2YgVd+MGY4jpXCfFZWPQQChFfVoE=;
        b=cbnx9zKCDtlXVcw9VDnzimag1r3ushK0mmQuceMKYoTD4v8Rd0hGDalO6iEweN2nC9
         xUaKn1jGH6XtbBnl38HJQVVR10yznG5wc6LTtUr7nsUGLx+cAnGbTdzid0sjj+COn84i
         y3cpF+OIBqmQi7B8i0/R4Xu53avhmS6fxYIhJxFJtRYJa8ew2xN0yTqKxBw1QROo5h09
         1wuaUMurfrBZmflYq++sHCuqZx/OX/X6hGzbAQm8uufaJMY/Mrpp8+kEMlQnvGmWPDbl
         xaXzZY6mH70qZBEqi21iIlO9ZyceaxFVeKK40MYErT7XpeFIHIIIKISPbfWcoSg9mQWJ
         LnZA==
X-Forwarded-Encrypted: i=1; AJvYcCXnZHoXhaBlHD4flzWN9UKLXjS71Sudp4jJJYj/8oHw6v9Xei1sQsdnpt3v7HDQ9iOGERFlO/DWRQovq66GB0XIFAjIod6yuzZYIF5tSzCU
X-Gm-Message-State: AOJu0YxfR53cKZYd3csP3U1/WULRfyUw4lzy1JMPZ2EsqmgkwThnjn1P
	NNdC5BB03QqroUaqSjcWXA4RbuEJcHv5RL7lyFFhYYkjHr/k+rRNpe5Lr7VurXnTdZ2Nl639Bqs
	dLtU+cQwSae1YrlXo1yqdLvessa0XfQp1GxYcmw==
X-Google-Smtp-Source: AGHT+IH4QZY+ZKLUXRGchLj2W3aOWavVA61yDoBIwSD9qlh7Awpft0cnk5o+nzwjFobUUAl+CGuWVVoAbw5HqZ8ZVjs=
X-Received: by 2002:a05:6870:1690:b0:24f:c2c8:4d3e with SMTP id
 586e51a60fabf-254402bc340mr2461247fac.3.1717749887788; Fri, 07 Jun 2024
 01:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240523111322.19243-1-cuiyunhui@bytedance.com>
 <20240523111322.19243-3-cuiyunhui@bytedance.com> <CAEEQ3wnE+8FXXf76zapqNnC5vruoR9C-y0qjjFw47cHYP57MmQ@mail.gmail.com>
In-Reply-To: <CAEEQ3wnE+8FXXf76zapqNnC5vruoR9C-y0qjjFw47cHYP57MmQ@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 7 Jun 2024 16:44:36 +0800
Message-ID: <CAEEQ3w==wueTSDvEtJe+t7jamH2ERxta4uPLUFVwX2ueRLJ3Bw@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 3/3] RISC-V: Select ACPI PPTT drivers
To: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	sunilvl@ventanamicro.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, bhelgaas@google.com, james.morse@arm.com, 
	jeremy.linton@arm.com, Jonathan.Cameron@huawei.com, pierre.gondois@arm.com, 
	sudeep.holla@arm.com, tiantao6@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_014455_496138_CE2239AB 
X-CRM114-Status: GOOD (  14.55  )
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

SGkgU3VuaWx2bCwKCgpPbiBNb24sIE1heSAyNywgMjAyNCBhdCA4OjUx4oCvUE0geXVuaHVpIGN1
aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gSGkgUGFsbWVyLAo+Cj4gR2Vu
dGxlIHBpbmcgLi4uCj4KPiBPbiBUaHUsIE1heSAyMywgMjAyNCBhdCA3OjEz4oCvUE0gWXVuaHVp
IEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4KPiA+IEFmdGVyIGFkZGlu
ZyBBQ1BJIHN1cHBvcnQgdG8gcG9wdWxhdGVfY2FjaGVfbGVhdmVzKCksIFJJU0MtViBjYW4gYnVp
bGQKPiA+IGNhY2hlaW5mbyB0aHJvdWdoIHRoZSBBQ1BJIFBQVFQgdGFibGUsIHRodXMgZW5hYmxp
bmcgdGhlIEFDUElfUFBUVAo+ID4gY29uZmlndXJhdGlvbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBK
ZXJlbXkgTGludG9uIDxqZXJlbXkubGludG9uQGFybS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogU3Vk
ZWVwIEhvbGxhIDxzdWRlZXAuaG9sbGFAYXJtLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yv
S2NvbmZpZyB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+
IGluZGV4IGY5NjE0NDljYTA3Ny4uYTllYmVjZDcyMDUyIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9y
aXNjdi9LY29uZmlnCj4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+IEBAIC0xNCw2ICsx
NCw3IEBAIGNvbmZpZyBSSVNDVgo+ID4gICAgICAgICBkZWZfYm9vbCB5Cj4gPiAgICAgICAgIHNl
bGVjdCBBQ1BJX0dFTkVSSUNfR1NJIGlmIEFDUEkKPiA+ICAgICAgICAgc2VsZWN0IEFDUElfUkVE
VUNFRF9IQVJEV0FSRV9PTkxZIGlmIEFDUEkKPiA+ICsgICAgICAgc2VsZWN0IEFDUElfUFBUVCBp
ZiBBQ1BJCj4gPiAgICAgICAgIHNlbGVjdCBBUkNIX0RNQV9ERUZBVUxUX0NPSEVSRU5UCj4gPiAg
ICAgICAgIHNlbGVjdCBBUkNIX0VOQUJMRV9IVUdFUEFHRV9NSUdSQVRJT04gaWYgSFVHRVRMQl9Q
QUdFICYmIE1JR1JBVElPTgo+ID4gICAgICAgICBzZWxlY3QgQVJDSF9FTkFCTEVfU1BMSVRfUE1E
X1BUTE9DSyBpZiBQR1RBQkxFX0xFVkVMUyA+IDIKPiA+IC0tCj4gPiAyLjIwLjEKPiA+Cj4KPiBU
aGFua3MsCj4gWXVuaHVpCgpDb3VsZCB5b3UgcGxlYXNlIHJldmlldyBvciBhY2sgdGhpcyBwYXRj
aHNldCBhZ2Fpbj8gUGFsbWVyIGRpZCBub3QgcmVzcG9uZC4KCkxpbms6Cmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwNTIzMTExMzIyLjE5MjQzLTMtY3VpeXVuaHVpQGJ5
dGVkYW5jZS5jb20vVC8KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
