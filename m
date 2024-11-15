Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C656D68BC8
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Nov 2024 15:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2WeZztSOFPAZ6HP+oKBrfta6Nt85m5r4hDurkl3fd8=; b=ixhWaRB8utJmG+
	4OMhngMhBPQ6MmZY+IRiuQAIhIine5RwQzpqrQLyh3PM+L6oN4dJwhU/d/M2YN5D83UpTaMbX0e+y
	mdoPqJCXWT45JeCvcf+DXa/L0MvYLmoVmmJhlYVek8X9LiIaLBhK6KgWoZFrXRlf2mbegV7F7c2ei
	NYXMsTM+H9vq8Y3vf6aPLWJG12Nve2F97vivnhVPcwrBOrxLYcVhOLeNUUYae02oHQSmO/cnhdMye
	wU1JFUKesSgCtr3tJ6DFKuH11KbadD/SbqQeUNtw4NFqOwqP92kPFXvJYN2b0tgrp22BxrAlwilHz
	oL3dQIPzjlltaS5hH/Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tByh0-00000003G8G-1KIe;
	Fri, 15 Nov 2024 15:57:06 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBygx-00000003G7j-3HzF
	for linux-riscv@lists.infradead.org;
	Fri, 15 Nov 2024 15:57:05 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3a6bf539cabso2813785ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Nov 2024 07:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1731686222; x=1732291022; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b+rnx6UgiqXrH5bDxfguf6xfUwDWk1F65iK1HKNBelU=;
        b=ExhaTFhbBHxJcTs0FYx9WUVaFMFuPOIlePkXyiKK/C07yzv82F8dKt9I8+NLzH8q24
         3pSaT3Kl/G3HzjnUo5rK77DBVLx/yFBGmUK0t5q/gccyz4cymrF5I+S2MLVdAeQsf74T
         8zosb6FDAo9uug42zjWy5Dn+CvZQcZ/kzLI4Nx5jhQUA6DYUgfx4XnrhdFvX2qwWbFE0
         fCq+Xb+p2lKmYAxs58RqQJv6igP8qXipCXHIYuMswvXuY364eQaYdvwLJldt3pTRWh+N
         XzW2XaaQeHLOIWOWTrBoqQdILfWo56kCwHvdF0tL7/aiCknf3GGai3fKuWzEbpbF76h8
         rwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731686222; x=1732291022;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b+rnx6UgiqXrH5bDxfguf6xfUwDWk1F65iK1HKNBelU=;
        b=lggHHNVCflAzP58u/4SQLqk12ulxfQp6ZGGcqmPXaZlEp/M6k9GRsbSzL3rb6NUvgs
         Ug8f2JZN84wMHzGikckk4Hq9NDOhiXtT0tsZOAT9Bq4y1KawN24zmmU3UJ2wvTkHYn42
         rD4YZxrq5BNdlOlB34Xw2zCZ65tC7/1NzWEiVIQhUkbqulJe8YyioefWKPafE/drwkyO
         2bZiHma35hfsW6mEstpCrwWcu4bDPbWvdTKbMlOFN2dMB7VfbrSPQXyQT091XOscgkQq
         FCSuEkAD8TXz+iMLzWYqyrJrbjSuUbkDM7AEdJRVc0OaM8eTGT9yMPIkdcizz0OOdcdI
         ptew==
X-Forwarded-Encrypted: i=1; AJvYcCVwpgCtxxp6g30jteRdRH8ynp8Usp2GDaqiscryghIXIWaBd2TIJbTkbxWn8MOan8R8LIQ+3mxgusUPUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNmD3x+FK8avvxI6eycd3H01ItElRb/NTqkYT4o+GSc0SzUmus
	Pz0KLq79MSlBS0i07ORFpFS9zh5MJf+IWDWbg/zUa51xxcb+NhiKgeYzpVLc/xs=
X-Google-Smtp-Source: AGHT+IHLYI16z6tZcHvVg1d1AfaTsr5FXWrQvyx1DzsBfAgKeYMUzeWqaPDyNNu463w5bz1k3LpgcA==
X-Received: by 2002:a05:6e02:1fe3:b0:3a6:c122:508c with SMTP id e9e14a558f8ab-3a748079e25mr33546605ab.19.1731686222210;
        Fri, 15 Nov 2024 07:57:02 -0800 (PST)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a749393582sm3189915ab.10.2024.11.15.07.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 07:57:01 -0800 (PST)
Message-ID: <1bce34c6-c2d0-4b2b-a8f9-7bc8737702b1@sifive.com>
Date: Fri, 15 Nov 2024 09:57:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/riscv-aplic: Fix crash when MSI domain is missing
To: Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>,
 Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20241114200133.3069460-1-samuel.holland@sifive.com>
 <CAK9=C2UyfmHqtYYK-WeSRk3=6bjs5nzDmw9ntudbCnPOYxLtXg@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <CAK9=C2UyfmHqtYYK-WeSRk3=6bjs5nzDmw9ntudbCnPOYxLtXg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_075703_834328_2B761F17 
X-CRM114-Status: GOOD (  23.17  )
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

SGkgQW51cCwKCk9uIDIwMjQtMTEtMTUgOTo0MiBBTSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBG
cmksIE5vdiAxNSwgMjAyNCBhdCAxOjMx4oCvQU0gU2FtdWVsIEhvbGxhbmQKPiA8c2FtdWVsLmhv
bGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4+Cj4+IElmIHRoZSBBUExJQyBkcml2ZXIgaXMgcHJv
YmVkIGJlZm9yZSB0aGUgSU1TSUMgZHJpdmVyLCB0aGUgcGFyZW50IE1TSQo+PiBkb21haW4gd2ls
bCBiZSBtaXNzaW5nLCB3aGljaCBjYXVzZXMgYSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4K
Pj4gbXNpX2NyZWF0ZV9kZXZpY2VfaXJxX2RvbWFpbigpLiBBdm9pZCB0aGlzIGJ5IGRlZmVycmlu
ZyBwcm9iZSB1bnRpbCB0aGUKPj4gcGFyZW50IE1TSSBkb21haW4gaXMgYXZhaWxhYmxlLiBVc2Ug
ZGV2X2Vycl9wcm9iZSgpIHRvIGF2b2lkIHByaW50aW5nIGFuCj4+IGVycm9yIG1lc3NhZ2Ugd2hl
biByZXR1cm5pbmcgLUVQUk9CRV9ERUZFUi4KPiAKPiBUaGUgLUVQUk9CRV9ERUZFUiBpcyBub3Qg
bmVlZGVkIGJlY2F1c2Ugd2UgZXhwZWN0IHRoYXQgcGxhdGZvcm1zIHRvCj4gdXNlICJtc2ktcGFy
ZW50IiBEVCBwcm9wZXJ0eSBpbiBBUExJQyBEVCBub2RlIHdoaWNoIGluLXR1cm4gYWxsb3dzIExp
bnV4Cj4gREQgZnJhbWV3b3JrIHRvIHJlLW9yZGVyIHByb2JpbmcgYmFzZWQgb24gZndfZGV2bGlu
ayBkZXBlbmRlbmNpZXMuIFRoZQo+IEFQTElDIERUIGJpbmRpbmdzIG1hbmRhdGVzIHRoYXQgYW55
IG9mICJpbnRlcnJ1cHQtZXh0ZW5kZWQiIG9yICJtc2ktcGFyZW50Igo+IERUIHByb3BlcnRpZXMg
TVVTVCBiZSBwcmVzZW50Lgo+IAo+IENhbiB5b3UgZWxhYm9yYXRlIGEgYml0IG1vcmUgb24gaG93
IHlvdSBhcmUgaGl0dGluZyB0aGlzIGlzc3VlID8KCkkgYWdyZWUgdGhhdCBmd19kZXZsaW5rIHNo
b3VsZCBoZWxwIGF2b2lkIHRoZSBzaXR1YXRpb24gd2hlcmUgd2UgbmVlZCB0byByZXR1cm4KLUVQ
Uk9CRV9ERUZFUiwgYnV0IHRoZSBrZXJuZWwgbXVzdCBzdGlsbCBub3QgY3Jhc2ggZXZlbiBpZiBm
d19kZXZsaW5rIGlzCmRpc2FibGVkICh3aGljaCBpcyBhIHBlcmZlY3RseSB2YWxpZCB0aGluZyB0
byBkbzogImZ3X2Rldmxpbms9b2ZmIiBvbiB0aGUga2VybmVsCmNvbW1hbmQgbGluZSkgb3IgaWYg
ZndfZGV2bGluayBmYWlscyB0byBjb21lIHVwIHdpdGggdGhlIGlkZWFsIHByb2JlIG9yZGVyLgpm
d19kZXZsaW5rIGlzIGFuIG9wdGltaXphdGlvbi4gSXQgc2hvdWxkIG5vdCBiZSByZWxpZWQgb24g
Zm9yIGNvcnJlY3RuZXNzLiBJbiBteQpzcGVjaWZpYyBjYXNlLCBmd19kZXZsaW5rIGdvdCB0aGUg
b3JkZXIgd3JvbmcgZHVlIHRvIHNvbWUgZmFsc2UgZGVwZW5kZW5jeQpjeWNsZXMsIHdoaWNoIEkg
c2VudCBhIHBhdGNoIGZvciBzZXBhcmF0ZWx5WzFdLgoKUmVnYXJkcywKU2FtdWVsCgpbMV06Cmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDExMTQxOTU2NTIuMzA2ODcyNS0xLXNhbXVl
bC5ob2xsYW5kQHNpZml2ZS5jb20vCgo+PiBGaXhlczogY2E4ZGY5N2ZlNjc5ICgiaXJxY2hpcC9y
aXNjdi1hcGxpYzogQWRkIHN1cHBvcnQgZm9yIE1TSS1tb2RlIikKPj4gU2lnbmVkLW9mZi1ieTog
U2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4+IC0tLQo+Pgo+PiAg
ZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tYWluLmMgfCAzICsrLQo+PiAgZHJpdmVy
cy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tc2kuYyAgfCAzICsrKwo+PiAgMiBmaWxlcyBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbWFpbi5jIGIvZHJpdmVycy9pcnFjaGlwL2ly
cS1yaXNjdi1hcGxpYy1tYWluLmMKPj4gaW5kZXggOTAwZTcyNTQxZGI5Li45M2U3YzUxZjk0NGEg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbWFpbi5jCj4+
ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbWFpbi5jCj4+IEBAIC0yMDcs
NyArMjA3LDggQEAgc3RhdGljIGludCBhcGxpY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQo+PiAgICAgICAgIGVsc2UKPj4gICAgICAgICAgICAgICAgIHJjID0gYXBsaWNfZGly
ZWN0X3NldHVwKGRldiwgcmVncyk7Cj4+ICAgICAgICAgaWYgKHJjKQo+PiAtICAgICAgICAgICAg
ICAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gc2V0dXAgQVBMSUMgaW4gJXMgbW9kZVxuIiwgbXNp
X21vZGUgPyAiTVNJIiA6ICJkaXJlY3QiKTsKPj4gKyAgICAgICAgICAgICAgIGRldl9lcnJfcHJv
YmUoZGV2LCByYywgImZhaWxlZCB0byBzZXR1cCBBUExJQyBpbiAlcyBtb2RlXG4iLAo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBtc2lfbW9kZSA/ICJNU0kiIDogImRpcmVjdCIpOwo+
Pgo+PiAgI2lmZGVmIENPTkZJR19BQ1BJCj4+ICAgICAgICAgaWYgKCFhY3BpX2Rpc2FibGVkKQo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tc2kuYyBiL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbXNpLmMKPj4gaW5kZXggOTQ1YmZmMjgyNjVj
Li5mYjhkMTgzODYwOWYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3Yt
YXBsaWMtbXNpLmMKPj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tc2ku
Ywo+PiBAQCAtMjY2LDYgKzI2Niw5IEBAIGludCBhcGxpY19tc2lfc2V0dXAoc3RydWN0IGRldmlj
ZSAqZGV2LCB2b2lkIF9faW9tZW0gKnJlZ3MpCj4+ICAgICAgICAgICAgICAgICAgICAgICAgIGlm
IChtc2lfZG9tYWluKQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldl9zZXRf
bXNpX2RvbWFpbihkZXYsIG1zaV9kb21haW4pOwo+PiAgICAgICAgICAgICAgICAgfQo+PiArCj4+
ICsgICAgICAgICAgICAgICBpZiAoIWRldl9nZXRfbXNpX2RvbWFpbihkZXYpKQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gLUVQUk9CRV9ERUZFUjsKPj4gICAgICAgICB9Cj4+Cj4+
ICAgICAgICAgaWYgKCFtc2lfY3JlYXRlX2RldmljZV9pcnFfZG9tYWluKGRldiwgTVNJX0RFRkFV
TFRfRE9NQUlOLCAmYXBsaWNfbXNpX3RlbXBsYXRlLAo+PiAtLQo+PiAyLjQ1LjEKPj4KPj4KPj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
