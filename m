Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F67C83F09
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 04:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wtu6OIpClEoh/8byA2qWIO/0IOm3qPS64V/22HHGImc=; b=Ro/9HaeVsjKVof
	MdIEWdvh8Ufm0ND3hQEZYUUM721hByXsApxsVqTSyPOHSy6pnp2VY/5DROo3Bt6phtn2INGfK3ofM
	5t17BHymiF6AHPdNhm1U7JbklPDHLwJyjjN3oYPxo90Ts5Sc7Ua8UEXtpO8Vwvk/LjdxmPRiAE6bv
	alPCE3mlV7QiyKAEsmeR8/vpDZqYitKKdl5rE+NRJ/dJxCH2NxBDkQFrXGmpoXbzLsarwotKqaKv9
	2o7dPSD3tQ4fjYP2BpIJLM1KavWagH5TIlYhQg+LhxctN5Jg7iWoDNkwApiWyAHDLBO8eDJGPWsaF
	auty7/mOtfqsUlGJZJRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZjMN-0000000Ah0T-0F0X;
	Thu, 10 Jul 2025 04:58:15 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZjMK-0000000Ah09-0MA2
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 04:58:13 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e7dc89108bfso441623276.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Jul 2025 21:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1752123490; x=1752728290; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEpA0IRuEna9Mxwq9qK3aS6tQm5TZpbjQfz5HQP3aX4=;
        b=chjeVJiuxAabXGLt4T2R7lQWD9RbZhS8kavt5N2BWxP3Nn4XUFJF1zWAmbwKN50H43
         o1vQmeVGqWM8k5FyeZKSW+Lrgltj5PsiNvYlwyF6tkxwRGtYaQEozl+3RLK0vhg9fX3b
         ++EefeDZ2vATIUPjqu+vHtMwq2BIgcBYDGYmR8PIbBKw7xpQFsfJtfJhh4wqQNlP/GlD
         X/wGfK6qnVHHuCUDnKRlvRownmgiZumRtGBDBDzvvigAzVze2wScZONWzN15Ua1sVIGZ
         WJP8WLRREVzdgek7Dm/Znhsb/kMDJg5B4DgV7FkxYFDIaXPyWcI5LkvMHmALXHVyQiwp
         AuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752123490; x=1752728290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEpA0IRuEna9Mxwq9qK3aS6tQm5TZpbjQfz5HQP3aX4=;
        b=Q24ss5KYmcgq/E+YHbfr0lU9Srr0CfLvxzuRFy9O/vh8EtX1vKSeNnkd212ERNkCcG
         X2zntG/2F8f7I7GtfwB1CjpUP2rhkQshkXpHGhx4Kqd5YMzT1jbFdkDeuNtR+uUybrGJ
         c7WdchyuvUgnIs5WiX2Ve4Uz7bz8peW0wcdliIFpA3KcE4GYo4hgKqCG6M8nno8/nIcO
         piEoeSAe75dklr8NUg1HS1djxIDjj47JkwdpInuj48I6OiuAc4ePajo0Xf4qmCf4W6mq
         qS1wgTxuYUc20WzTclhOqREHuo6RsjY6FlSiTqpMchEFiHrqrqKrMYY3F/xMsIwULvFa
         wG3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCxcM7YtiGa+/HqSoLieeTy+59ZjZOtCF+1o9o/inyy8akU4VmnLg92FSyTrokw7UBWaSbuy3O9tUM4A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy6KVsuYIrFv1R80TVzrDbLZYylFBluZb2LKzFd7WjvEVWN88U
	wn2khu5Bdhst+zZrYv4X4UvljL8AaFZHTnVoOK0Y37SCLhQmciQCHdfW/iH9/LU10rxvdbK05rJ
	0kUY+Q+pUOgjaXuyIibNaq6Rz9DZ1Al1krbctp1PoIQ==
X-Gm-Gg: ASbGncuEji+WdVQg26Q+rVEvWdO1uuqlnbr9M+85PEHSUbiz5oHABY8A0gwYuqkOUvJ
	Y3/4VI9mr5x75dvv+Fh8nWriw6B/kDLqvY1O3wkAkbP+njLosowHk9kYXA8c3qHu2yj0fx81CgU
	XLN8whwqf/EFPnXWEmkb80Cwuj5NqJ1Nrr17MzyCxdXnxmSg==
X-Google-Smtp-Source: AGHT+IFBYcBC73q2IeV+mY8fvhVWFYle/lCmmpRL/KWBCNFpGZtXkk2v1VGFKH7y6dlMRGRRkw9pg5tbSYlMjv4lsDk=
X-Received: by 2002:a05:6902:2843:b0:e85:fba9:30d0 with SMTP id
 3f1490d57ef6-e8b6e1078d5mr6486297276.2.1752123490524; Wed, 09 Jul 2025
 21:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250708065242.26371-1-nick.hu@sifive.com> <20250709-startup-coasting-aa58a99c5585@spud>
In-Reply-To: <20250709-startup-coasting-aa58a99c5585@spud>
From: Nick Hu <nick.hu@sifive.com>
Date: Thu, 10 Jul 2025 12:57:59 +0800
X-Gm-Features: Ac12FXx9o-b6Tc_SNFG1ki4fAOGr8tZ3fgq0-I4XfIsnvROH-808KefUmWQHcuM
Message-ID: <CAKddAkDM_-w-y9bcHj+5-afDBhd1rbV-x2JZorE8S9k0u3JSxw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: riscv: Add SiFive vendor extensions description
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_215812_148645_3EF5EDEA 
X-CRM114-Status: GOOD (  16.85  )
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

T24gVGh1LCBKdWwgMTAsIDIwMjUgYXQgMTI6MDDigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdWwgMDgsIDIwMjUgYXQgMDI6NTI6NDJQTSAr
MDgwMCwgTmljayBIdSB3cm90ZToKPiA+IEFkZCBkZXNjcmlwdGlvbiBmb3IgU2lGaXZlIHZlbmRv
ciBleHRlbnNpb25zICJ4c2ZjZmx1c2hkbG9uZSIsCj4gPiAieHNmcGdmbHVzaGRsb25lIiBhbmQg
InhzZmNlYXNlIi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2
ZS5jb20+Cj4KPiBZb3UgaGF2ZSB0aGlzLCBidXQgbm8gdXNlciBvciBhbnl0aGluZyBhbG9uZyB3
aXRoIGl0LiBXaGF0J3MgYWN0dWFsbHkKPiBtYWtpbmcgdXNlIG9mIHRoaXM/IElmIGl0J3MganVz
dCBmb3IgdGhlIFNCSSBpbXBsIG9yIHcvZSB0aGVuIHNheSB0aGF0Lgo+Ckl0J3MgZm9yIHRoZSBT
QkkgaW1wbGVtZW50YXRpb24uIEknbGwgdXBkYXRlIGl0IGluIHRoZSBjb21taXQgbWVzc2FnZS4K
VGhhbmtzIQoKQmVzdCBSZWdhcmQsCk5pY2sKCj4gPiAtLS0KPiA+ICAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgIHwgMTggKysrKysrKysrKysrKysrKysrCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwK
PiA+IGluZGV4IDcyYzFiMDYzZmRmZS4uMTBjMzdjNjEyNDNkIDEwMDY0NAo+ID4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMu
eWFtbAo+ID4gQEAgLTYyNiw2ICs2MjYsMjQgQEAgcHJvcGVydGllczoKPiA+ICAgICAgICAgICAg
ICBodHRwczovL3d3dy5hbmRlc3RlY2guY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy9BWDQ1TVAtMUMt
UmV2Li01LjAuMC1EYXRhc2hlZXQucGRmCj4gPgo+ID4gICAgICAgICAgIyBTaUZpdmUKPiA+ICsg
ICAgICAgIC0gY29uc3Q6IHhzZmNlYXNlCj4gPiArICAgICAgICAgIGRlc2NyaXB0aW9uOgo+ID4g
KyAgICAgICAgICAgIFNpRml2ZSBDRUFTRSBJbnN0cnVjdGlvbiBFeHRlbnNpb25zIFNwZWNpZmlj
YXRpb24uCj4gPiArICAgICAgICAgICAgU2VlIG1vcmUgZGV0YWlscyBpbgo+ID4gKyAgICAgICAg
ICAgIGh0dHBzOi8vd3d3LnNpZml2ZS5jb20vZG9jdW1lbnQtZmlsZS9mcmVlZG9tLXU3NDAtYzAw
MC1tYW51YWwKPiA+ICsKPiA+ICsgICAgICAgIC0gY29uc3Q6IHhzZmNmbHVzaGRsb25lCj4gPiAr
ICAgICAgICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgICAgICAgIFNpRml2ZSBMMUQgQ2FjaGUg
Rmx1c2ggSW5zdHJ1Y3Rpb24gRXh0ZW5zaW9ucyBTcGVjaWZpY2F0aW9uLgo+ID4gKyAgICAgICAg
ICAgIFNlZSBtb3JlIGRldGFpbHMgaW4KPiA+ICsgICAgICAgICAgICBodHRwczovL3d3dy5zaWZp
dmUuY29tL2RvY3VtZW50LWZpbGUvZnJlZWRvbS11NzQwLWMwMDAtbWFudWFsCj4gPiArCj4gPiAr
ICAgICAgICAtIGNvbnN0OiB4c2ZwZ2ZsdXNoZGxvbmUKPiA+ICsgICAgICAgICAgZGVzY3JpcHRp
b246Cj4gPiArICAgICAgICAgICAgU2lGaXZlIFBHRkxVU0ggSW5zdHJ1Y3Rpb24gRXh0ZW5zaW9u
cyBmb3IgdGhlIHBvd2VyIG1hbmFnZW1lbnQuIFRoZQo+ID4gKyAgICAgICAgICAgIENQVSB3aWxs
IGZsdXNoIHRoZSBMMUQgYW5kIGVudGVyIHRoZSBjZWFzZSBzdGF0ZSBhZnRlciBleGVjdXRpbmcK
PiA+ICsgICAgICAgICAgICB0aGUgaW5zdHJ1Y3Rpb24uCj4gPiArCj4gPiAgICAgICAgICAtIGNv
bnN0OiB4c2ZxbWFjY2RvZAo+ID4gICAgICAgICAgICBkZXNjcmlwdGlvbjoKPiA+ICAgICAgICAg
ICAgICBTaUZpdmUgSW50OCBNYXRyaXggTXVsdGlwbGljYXRpb24gRXh0ZW5zaW9ucyBTcGVjaWZp
Y2F0aW9uLgo+ID4gLS0KPiA+IDIuMTcuMQo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
