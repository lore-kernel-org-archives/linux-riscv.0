Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB55FCA0EC4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 07:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:Mime-Version:From:In-Reply-To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=O6Q9EeJzJtFUQ1q09e+Y/ftLikMfwnJN9aKfKqOFpNM=; b=lo0EDPWE/eOItvIS6iINn2Ckbh
	aCV7E9vmhB2CRsinKUjNH3Tde+jsITaQ2rikVEsKTOVN33fcD6UQQ/2b3fc/e7BMnqhcm39AkboXv
	/B1UMt6REnGnn2o2/WfiSJucKfWTMO2/rwbRNpHqoY92VFXwdjNbSz2+UAjhuuKA0Mxztk7eFe6pJ
	91VjWK/Mu5GeVGx9Itc9cu+igODMz4nQOovICVBTV9zHcZNhYqKNL+baWY5l3cD2NFe4uHqSegNr7
	/dtX9Qs8dVZ1SVJLfp5bokwgK3K8JuNHUyl9s7M9KU0IHW9EQbKWRiID81D7QWJyn6WGf1ROeoMEo
	JrF/jQzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um69b-0000000CyAZ-2kAu;
	Wed, 13 Aug 2025 07:44:11 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um5Yu-0000000CsLm-2Ka9
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 07:06:17 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-71a3f7f0addso61317437b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 00:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1755068772; x=1755673572; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:from:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtdSp5iWVtuUEXNcYV6uE6O/YEoT4qmJW+fDKi6l7jM=;
        b=gbnxSxCGT/DcyCPFUag//awj0PEDVWZcR+WGUSuATzcaDh9ozBqd8il7qRJfrUWmFb
         uzc2o28x95DadRrE0x/QB97Rk4W87/lh0RXnhuEcBj9RUw5jweeK52TVs5gPI3TkKPtL
         yXLAoGcDUU1MPyRmvdLy4mPvEnBNOuC3U8TZwLwN5Q8D4KFgK2MMemBmQ8CBSpAtDyAI
         d2o+RDNnc5HGH7M/xmjxyG0CVVIUG4PAC8D3FIlYOrFTpZKmtNYiQQFx/8YPOSX9V/QC
         C0KOczPg/CvXObiXIKFfz6XUH52FIaFryBnPu2I5ZfM6N6ZpmAMCjafpY64K3rBj0b9p
         10rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755068772; x=1755673572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:from:in-reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PtdSp5iWVtuUEXNcYV6uE6O/YEoT4qmJW+fDKi6l7jM=;
        b=Bz0ldspG9jbhAyo6p99bI8wHlFwpFcvjxB0ZSRXGyY8jnTOf6EbktIKB11Cp/M1qQR
         oQA2BpOCKh2oFJsLOk27oTLnfzmEAHlULDaF0bgE+udbbTVXb05M8cOR0YcPX7uo5Sbl
         TlTj2+I54tfgKekLCeXZw1Ix/D6wtgPyDeF0sm1DLZcTlfAJ7zxqR929NcetgM6TBJh8
         OjmcLbm+wWP239lhiEdzUjl1Lhg2kMbtExBiqy5HREHKtCkpGiAVDuja9wjTgVrm1evL
         0phVkf4jQ3lfWhTFJlMOizJo1RQxDP83zx7at85waT3Nms4VDIPnOIJ+mm44fgDvsH2O
         JKLA==
X-Forwarded-Encrypted: i=1; AJvYcCVYEp7L19L21gXVEpuQbcbUx7jbkvMbATtPvnUD23BOZxhq8Zl5SCmc0kyvX74ax1hmV0G5LTMiueRXaA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/kMsB7H/8wTFHukz+SO077UhR0vCYVEgs490SL9EfVw0XA8+f
	gOJPvdTrI1voE2a7nbC7KCtQYE/0vqRTiAorbbcj9ytL0QQjvgjNn5c8Nn53u9pK/5kjBzMNDjK
	ITw+nG63FOCior2SYT+POZ161+/gvdgZHHeguLtfGag==
X-Gm-Gg: ASbGnctlh8OVbefo9yvUSuYnsrGYQ7cTRI9wA5Qmusvlii5g8P0TCLxaVEk7MhGy8Jp
	f6ZCsS+TmehZmH0S1kD60IHka7q/mKqJhz2sqJqkaE9NIWlCAStiVWt5Ajn+gatwt2jf1rpfgNT
	ClOZ44HpwxwxrtAx+cK5GTimKRX6N0YVKJrGubfvii+6vfVVl+I2z2omlQpt6m6DHWdfCgR1kTQ
	y0TI44+KA==
X-Google-Smtp-Source: AGHT+IFkYZGQ5UFq1DJG7B9DaXbAuz5u07Muc6GRQPoHlZABQ/34BaErIiBBF7gbzS0pwX3itRbzkH2ORAtbA9O+iQA=
X-Received: by 2002:a05:690c:6a82:b0:71a:2299:f0d8 with SMTP id
 00721157ae682-71d4e4459d7mr24656527b3.16.1755068772357; Wed, 13 Aug 2025
 00:06:12 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 13 Aug 2025 00:06:11 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 13 Aug 2025 00:06:11 -0700
In-Reply-To: <aJwiXKWXik8BmpL8@sunil-laptop>
From: =?UTF-8?B?6Z6g5paH6b6Z?= <juwenlong@bytedance.com>
Mime-Version: 1.0
References: <20250515094301.40016-1-cuiyunhui@bytedance.com>
 <CAEEQ3w=XqoKmVu1kvc5XUbGbQJsHVkRx=T65tXvYEYo0HCTcnQ@mail.gmail.com>
 <aJs-aPH32OxpzR3G@sunil-laptop> <CAEEQ3wnHFPBPC0U59rDBJaZYxJ24uJzJ7NDQO0gfmVqoiQwNOw@mail.gmail.com>
 <aJtKZhvNX0p3obFw@sunil-laptop> <CAEEQ3wmomscuAzuiRyJu4ha8tiM=s1Y-ytQROPTWr1DScMNL3g@mail.gmail.com>
 <aJwiXKWXik8BmpL8@sunil-laptop>
Date: Wed, 13 Aug 2025 00:06:11 -0700
X-Gm-Features: Ac12FXwQ0nQlJfTEa1i-AjJVhuSoyHeH0mTWy48-Ivil9TUTsXgw1E4zWGClHkE
Message-ID: <CAHEos+Msmta3o-HvXoigmJGbD48333Kh8tU3j2D=w_G8gL+OQw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] ACPI: RISC-V: CPPC: Add CSR_CYCLE for CPPC FFH
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: yunhui cui <cuiyunhui@bytedance.com>, rafael@kernel.org, lenb@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_000616_598925_B5486567 
X-CRM114-Status: GOOD (  33.55  )
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

SGkgU3VuaWzvvIwKCj4gRnJvbTogIlN1bmlsIFYgTCI8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29t
Pgo+IERhdGU6wqAgV2VkLCBBdWcgMTMsIDIwMjUsIDEzOjI4Cj4gU3ViamVjdDrCoCBSZTogW0V4
dGVybmFsXSBSZTogW1BBVENIXSBBQ1BJOiBSSVNDLVY6IENQUEM6IEFkZCBDU1JfQ1lDTEUgZm9y
IENQUEMgRkZICj4gVG86ICJ5dW5odWkgY3VpIjxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiBD
YzogPHJhZmFlbEBrZXJuZWwub3JnPiwgPGxlbmJAa2VybmVsLm9yZz4sIDxwYXVsLndhbG1zbGV5
QHNpZml2ZS5jb20+LCA8cGFsbWVyQGRhYmJlbHQuY29tPiwgPGFvdUBlZWNzLmJlcmtlbGV5LmVk
dT4sIDxhbGV4QGdoaXRpLmZyPiwgPGxpbnV4LWFjcGlAdmdlci5rZXJuZWwub3JnPiwgPGxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc+LCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
Zz4sICJBbnVwIFBhdGVsIjxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4sICJSYWh1bCBQYXRoYWsi
PHJwYXRoYWtAdmVudGFuYW1pY3JvLmNvbT4sIDxqdXdlbmxvbmdAYnl0ZWRhbmNlLmNvbT4KPiBI
aSBZdW5odWksCj4KPgo+IE9uIFdlZCwgQXVnIDEzLCAyMDI1IGF0IDExOjIzOjM5QU0gKzA4MDAs
IHl1bmh1aSBjdWkgd3JvdGU6Cj4gPiBIaSBTdW5pbCwKPiA+Cj4gPiBPbiBUdWUsIEF1ZyAxMiwg
MjAyNSBhdCAxMDowNuKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPiB3
cm90ZToKPiA+ID4KPiBbLi4uXQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGUgcHVycG9zZSBv
ZiBjcHBjX2ZmaF9jc3JfcmVhZCgpIGlzIHRvIGNhbGN1bGF0ZSB0aGUgYWN0dWFsCj4gPiA+ID4g
PiA+IGZyZXF1ZW5jeSBvZiB0aGUgQ1BVLCB3aGljaCBpcyBkZWx0YV9DU1JfQ1lDTEUvZGVsdGFf
Q1NSX1hYWC4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gQ1NSX1hYWCBzaG91bGQgYmUgYSByZWZl
cmVuY2UgY2xvY2sgYW5kIGRvZXMgbm90IGNvdW50IGR1cmluZyBXRkkKPiA+ID4gPiA+ID4gKFdh
aXQgRm9yIEludGVycnVwdCkuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFNpbWlsYXIgc29sdXRp
b25zIGluY2x1ZGU6IHg4NidzIGFwZXJmL21wZXJmLCBhbmQgQVJNNjQncyBBTVUgd2l0aAo+ID4g
PiA+ID4gPiByZWdpc3RlcnMgU1lTX0FNRVZDTlRSMF9DT1JFX0VMMC9TWVNfQU1FVkNOVFIwX0NP
TlNUX0VMMC4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSG93ZXZlciwgd2Uga25vdyB0aGF0IENT
Ul9USU1FIGluIHRoZSBjdXJyZW50IGNvZGUgZG9lcyBjb3VudCBkdXJpbmcKPiA+ID4gPiA+ID4g
V0ZJLiBTbywgaXMgdGhpcyBkZXNpZ24gdW5yZWFzb25hYmxlPwo+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiBTaG91bGQgd2UgY29uc2lkZXIgcHJvcG9zaW5nIGFuIGV4dGVuc2lvbiB0byBzdXBwb3J0
IHN1Y2ggYSBkZWRpY2F0ZWQKPiA+ID4gPiA+ID4gY291bnRlciAoYSByZWZlcmVuY2UgY2xvY2sg
dGhhdCBkb2VzIG5vdCBjb3VudCBkdXJpbmcgV0ZJKT8gVGhpcyB3YXksCj4gPiA+ID4gPiA+IHRo
ZSB2YWx1ZSBjYW4gYmUgb2J0YWluZWQgZGlyZWN0bHkgaW4gUy1tb2RlIHdpdGhvdXQgdHJhcHBp
bmcgdG8KPiA+ID4gPiA+ID4gTS1tb2RlLCBlc3BlY2lhbGx5IHNpbmNlIHJlYWRpbmcgdGhpcyBj
b3VudGVyIGlzIHZlcnkgZnJlcXVlbnQuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiBIaSBZdW5odWks
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gWWVzLCBidXQgd2UgYW50aWNpcGF0ZWQgdGhhdCB2ZW5kb3Jz
IG1pZ2h0IGRlZmluZSB0aGVpciBvd24gY3VzdG9tIENTUnMuCj4gPiA+ID4gPiBTbywgd2UgaW50
cm9kdWNlZCBGRkggZW5jb2RpbmcgdG8gYWNjb21tb2RhdGUgc3VjaCBjYXNlcy4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiBUaGFua3MsCj4gPiA+ID4gPiBTdW5pbAo+ID4gPiA+Cj4gPiA+ID4gQXMgbWVu
dGlvbmVkIGVhcmxpZXIsIGl0IGlzIGJlc3QgdG8gZGlyZWN0bHkgcmVhZCBDU1JfWFhYIChhIHJl
ZmVyZW5jZQo+ID4gPiA+IGNsb2NrIHRoYXQgZG9lcyBub3QgY291bnQgZHVyaW5nIFdGSSkgYW5k
IENTUl9DWUNMRSBpbiBTLW1vZGUsIHJhdGhlcgo+ID4gPiA+IHRoYW4gdHJhcHBpbmcgdG8gU0JJ
Lgo+ID4gPiA+Cj4gPiA+IE5vLiBJIG1lYW50IGRpcmVjdCBDU1IgYWNjZXNzIGl0c2VsZiBub3Qg
U0JJLiBQbGVhc2UgdGFrZSBhIGxvb2sgYXQKPiA+ID4gVGFibGUgNiBvZiBSSVNDLVYgRkZIIHNw
ZWMuCj4gPiA+Cj4gPiA+ID4gZHJpdmVycy9hY3BpL3Jpc2N2L2NwcGMuYyBpcyBhIGdlbmVyaWMg
ZHJpdmVyIHRoYXQgaXMgbm90IHNwZWNpZmljIHRvCj4gPiA+ID4gYW55IHZlbmRvci4gQ3VycmVu
dGx5LCB0aGUgdXBzdHJlYW0gY29kZSBhbHJlYWR5IHVzZXMgQ1NSX1RJTUUsIGFuZAo+ID4gPiA+
IHRoZSBsb2dpYyBvZiBDU1JfVElNRSBpcyBpbmNvcnJlY3QuCj4gPiA+ID4KPiBBQ1BJIHNwZWMg
Zm9yICJSZWZlcmVuY2UgUGVyZm9ybWFuY2UgUmVnaXN0ZXIiIHNheXMsCj4KPgo+ICJUaGUgUmVm
ZXJlbmNlIFBlcmZvcm1hbmNlIENvdW50ZXIgUmVnaXN0ZXIgY291bnRzIGF0IGEgZml4ZWQgcmF0
ZSBhbnkKPiB0aW1lIHRoZSBwcm9jZXNzb3IgaXMgYWN0aXZlLiBJdCBpcyBub3QgYWZmZWN0ZWQg
YnkgY2hhbmdlcyB0byBEZXNpcmVkCj4gUGVyZm9ybWFuY2UsIHByb2Nlc3NvciB0aHJvdHRsaW5n
LCBldGMuIgo+Cj4KPiA+ID4gQ1NSX1RJTUUgaXMganVzdCBhbiBleGFtcGxlLiBJdCBpcyB1cHRv
IHRoZSB2ZW5kb3IgaG93IF9DUEMgb2JqZWN0cyBhcmUKPiA+ID4gZW5jb2RlZCB1c2luZyBGRkgu
IFRoZSBsaW51eCBjb2RlIGRvZXNuJ3QgbWVhbiBvbmUgc2hvdWxkIHVzZSBDU1JfVElNRQo+ID4g
PiBhbHdheXMuCj4gPgo+ID4gRmlyc3QsIHRoZSBleGFtcGxlIG9mIENTUl9USU1FIGlzIGluY29y
cmVjdC4gV2hhdCBpcyBuZWVkZWQgaXMgYQo+ID4gQ1NSX1hYWCAoYSByZWZlcmVuY2UgY2xvY2sg
dGhhdCBkb2VzIG5vdCBjb3VudCBkdXJpbmcgV0ZJKS4KPiA+Cj4gPiBTZWNvbmQsIHlvdSBtZW50
aW9uZWQgdGhhdCBlYWNoIHZlbmRvciBjYW4gY3VzdG9taXplIHRoZWlyIG93bgo+ID4gaW1wbGVt
ZW50YXRpb25zLiBCdXQgc2hvdWxkIGFsbCB2ZW5kb3JzJyBDU1JfWFhYL1lZWS8uLi4gYmUgYWRk
ZWQgdG8KPiA+IGRyaXZlcnMvYWNwaS9yaXNjdi9jcHBjLmM/IFNob3VsZG7igJl0IGRyaXZlcnMv
YWNwaS9yaXNjdi9jcHBjLmMgZmFsbAo+ID4gdW5kZXIgdGhlIHNjb3BlIGRlZmluZWQgYnkgdGhl
IFJJU0MtViBhcmNoaXRlY3R1cmU/Cj4gPgo+IE5vLiBPbmUgY2FuIGltcGxlbWVudCBzaW1pbGFy
IHRvIGNzcl9yZWFkX251bSgpIGluIG9wZW5zYmkuIFdlIGRpZG4ndAo+IGFkZCBpdCBzaW5jZSB0
aGVyZSB3YXMgbm8gSFcgaW1wbGVtZW50aW5nIHN1Y2ggdGhpbmcuIFdoYXQgSSBhbQo+IHNheWlu
ZyBpcyB3ZSBoYXZlIEZGSCBlbmNvZGluZyB0byBzdXBwb3J0IHN1Y2ggY2FzZS4KPgo+Cj4gPiA+
Cj4gPiA+ID4gSXQgd291bGQgYmUgYmVzdCB0byBwcm9tb3RlIGEgc3BlY2lmaWNhdGlvbiB0byBz
dXBwb3J0IENTUl9YWFgsIGp1c3QKPiA+ID4gPiBsaWtlIHdoYXQgaGFzIGJlZW4gZG9uZSBmb3Ig
eDg2IGFuZCBhcm02NC4gV2hhdCBkbyB5b3UgdGhpbms/Cj4gPiA+ID4KPiA+ID4gV291bGRuJ3Qg
YWJvdmUgd29yaz8gRm9yIGEgc3RhbmRhcmQgZXh0ZW5zaW9uLCB5b3UgbWF5IGhhdmUgdG8gcHJv
dmlkZQo+ID4gPiBtb3JlIGRhdGEgd2l0aCBhY3R1YWwgSFcuCj4gPgo+ID4gVGhpcyB3b27igJl0
IHdvcmsuIE1heSBJIGFzayBob3cgdGhlIGN1cnJlbnQgdXBzdHJlYW0gY29kZSBjYW4gY2FsY3Vs
YXRlCj4gPiB0aGUgYWN0dWFsIENQVSBmcmVxdWVuY3kgdXNpbmcgQ1NSX1RJTUUgd2l0aG91dCB0
cmFwcGluZyB0byBTQkk/Cj4gPiBUaGlzIGlzIGEgdGhlb3JldGljYWwgbG9naWNhbCBpc3N1ZS4g
V2h5IGlzIGRhdGEgbmVlZGVkIGhlcmU/Cj4gPgo+IEFzIEkgbWVudGlvbmVkIGFib3ZlLCBvbmUg
Y2FuIGltcGxlbWVudCBhIGdlbmVyaWMgQ1NSIHJlYWQgd2l0aG91dAo+IHRyYXBwaW5nIHRvIFNC
SS4KPgo+Cj4gPiBDb3VsZCB5b3UgdGFrZSBhIGxvb2sgYXQgdGhlICJBTVUgZXZlbnRzIGFuZCBl
dmVudCBudW1iZXJzIiBjaGFwdGVyIGluCj4gPiB0aGUgQVJNNjQgbWFudWFsPwo+ID4KPiBBcy1w
ZXIgQUNQSSBzcGVjIHJlZmVyZW5jZSBwZXJmb3JtYW5jZSBjb3VudGVyIGlzIG5vdCBhZmZlY3Rl
ZCBieSBDUFUKPiBzdGF0ZS4gVGhlIFJJU0MtViBGRkggZW5jb2RpbmcgaXMgc3VmZmljaWVudGx5
IGdlbmVyaWMgdG8gc3VwcG9ydCB0aGlzCj4gcmVxdWlyZW1lbnQsIGV2ZW4gaWYgdGhlIHN0YW5k
YXJkIENTUl9USU1FIGNhbm5vdCBiZSB1c2VkLiBJbiBzdWNoCj4gY2FzZXMsIGFuIGFsdGVybmF0
aXZlIENTUiBjYW4gYmUgZW5jb2RlZGVkLCBhY2Nlc3NlZCB2aWEgYW4gT1MtbGV2ZWwKPiBhYnN0
cmFjdGlvbiBzdWNoIGFzIGNzcl9yZWFkX251bSgpLgrCoMKgIMKgIMKgIEFzLXBlciBBQ1BJIFNw
ZWPvvIxCb3RoIFJlZmVyZW5jZSBwZXJmb3JtYW5jZSBjb3VudGVyIHJlZ2lzdGVyCmFuZCBEZWxp
dmVyZWQgUGVyZm9ybWFuY2UgQ291bnRlciBhcmUgYWZmZWN0ZWQgYnkgQ1BVCnN0YXRl44CCRnJv
bSBBQ1BJIFNwZWPvvIzigJxUaGUgUmVmZXJlbmNlIFBlcmZvcm1hbmNlIENvdW50ZXIgUmVnaXN0
ZXIKY291bnRzIGF0IGEgZml4ZWQgcmF0ZSBhbnkgdGltZSB0aGUgcHJvY2Vzc29yIGlzIGFjdGl2
ZS7igJ0K4oCcVGhlIERlbGl2ZXJlZCBQZXJmb3JtYW5jZSBDb3VudGVyIFJlZ2lzdGVyIGluY3Jl
bWVudHMgYW55IHRpbWUgdGhlCnByb2Nlc3NvciBpcyBhY3RpdmUsIGF0IGEgcmF0ZSBwcm9wb3J0
aW9uYWwgdG8gdGhlIGN1cnJlbnQgcGVyZm9ybWFuY2UKbGV2ZWwsIHRha2luZyBpbnRvIGFjY291
bnQgY2hhbmdlcyB0byBEZXNpcmVkIFBlcmZvcm1hbmNl4oCdCuKAnCBQcm9jZXNzb3IgcG93ZXIg
c3RhdGVzIGluY2x1ZGUgYXJlIGRlc2lnbmF0ZWQgQzAsIEMxLCBDMiwgQzMsIC4gLiAuCkNuLiBU
aGUgQzAgcG93ZXIgc3RhdGUgaXMgYW4gYWN0aXZlIHBvd2VyIHN0YXRlIHdoZXJlIHRoZSBDUFUg
ZXhlY3V0ZXMKaW5zdHJ1Y3Rpb25zLiBUaGUgQzEgdGhyb3VnaCBDbiBwb3dlciBzdGF0ZXMgYXJl
IHByb2Nlc3NvciBzbGVlcGluZwpzdGF0ZXMgd2hlcmUgdGhlIHByb2Nlc3NvciBjb25zdW1lcyBs
ZXNzIHBvd2VyIGFuZCBkaXNzaXBhdGVzIGxlc3MKaGVhdCB0aGFuIGxlYXZpbmcgdGhlIHByb2Nl
c3NvciBpbiB0aGUgQzAgc3RhdGXigJ0uIFNvIHRoZSB0aW1lIGNzciBjYW4Kbm90IG1lZXQgdGhp
cyByZXF1aXJlbWVudHMud2UgbmVlZCBhbm90aGVyIGNzciwgYnV0IG5vdCBhdmFpbGlhYmxlIGZv
cgpub3cuRWl0aGVyIGltcGxlbWVudCBpdCBhcyB2ZW5kb3Itc3BlY2lmaWMgb3IgY3JlYXRlIGEg
Y29tbXVuaXR5CmV4dGVuc2lvbiBmb3IgYWxs77yfCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
