Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60102CA0ED1
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 03:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RAI/HiF4Rc73BtdA0ONBjUwE1ymNxy9Kc87JwKCt+4s=; b=tZcXhi+4s6KHYf
	sh65YWfxJQ0UdZ/6lU88h+EZFbw5R6wVdfKGsVfXM3ySVWUqJ4aTquraDaddGvZLSX+Sdi9ag5XRN
	1TPJDbPpZnejk+g/4zmVX1Z2AeVWKmyq2HfHr3Q3eApW8oX2iiKKT6EwaPeFTZhdQZgVuiCUllEan
	K+Rh5BGZLP2y+GX7wH1nenVMeOArFOfapd49YzX71MUj4eBJ9lxfXJL/OTkjX3OYcjsLAUz0KALfF
	uzUgStQi4upmV9jTCrOlFTBHTo5yNffmC/MURUFvcX+QwsqhKu/lnLx7YXWBSrmkiR4a+VvOL4Yai
	wGj5kzhCM0pmySnPdVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umOnD-0000000FfUs-1NvE;
	Thu, 14 Aug 2025 03:38:19 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umOnA-0000000FfTY-14u4
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 03:38:17 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-74381df8cf1so133053a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 20:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1755142691; x=1755747491; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUu6oSbO6D+uUoB3TSxixh5CZbC6ogSp8+KOXMU+i3c=;
        b=AS9zh8uj4lKsmp6lEIQlKOSp6S6LIb6b0lN6yjbRE2xI8tim/M/96FG+9gb2fmqqSm
         IcfNct6EkaCfI77SP/39xRq1HaRf1D+8yxFsfu87EBo8HdJGrUSZYTTflnWAj2Kgd/ww
         7VV4UG+vyuIZNfZRIZj6jNpQR6idUTAwVWLlnaXzTTi6PZJWPxC1C1dSOiyzbAD1Uu2D
         l9K1Vy1JTAd6Z0Q9BYfUKSD9L3Ska1z2DYDX2oE/7NKQjOlJuFiKdTccgLsp5PxvWx5d
         hpo6+OjJB727ACPtsyWBdplDJ1oMD+gozqHsptLlREUb78r1hbqsIoLLfI7DMaXNLYhW
         kzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755142691; x=1755747491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUu6oSbO6D+uUoB3TSxixh5CZbC6ogSp8+KOXMU+i3c=;
        b=s1/fGvNBb2gGYxVNf1/CNe9ZedVthIS16cFqMWnunsef7H2TyrzbliSfRy3dOpnwue
         +cS/ifUmAnNPe6PbbH8jWA/lDZ7w+BgUOcP+XFsUsodGxHiMl/LSc67N/Pz9eVRR94GX
         4g1PyxrWy/yH1eU5eDwXJfe/knjwLfPyBKye0vjDqLP4ftxCunKo5hPODCkZJ4scxe5F
         a4JiBrvsK/KaJhiBFknmGaVbsn3X/3BZGtYXOl92wb4azkKG6xSIv+E/J5gBDsqHppdK
         iHDZmHrZDlU07A7Vfciy8ot33k/JN3s40Cfv1ulX/WTJ2ZZk/hejAKx0a2F8wV+LZp2x
         5+fA==
X-Forwarded-Encrypted: i=1; AJvYcCUTFRZxMkK+B/9nQVZEWnuRRuQAHR8+pGtXYP1Pk0xWuhPUdt/Ik8kc9Vlpc0JDmFJUgybeDHnsj5Yxlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzD3LnGdpkDsB+dsQlT2eoMeNM1HDDNsv0Oxq/JT7Brn8rMbAw4
	l6GIdfdlvEZIfInB8JV/CYHAOaJdXLnvS6zgIpG/W88UGOb+amTo2p7wRHqJZ4GX9tYN5a5LUxS
	Q2ZbDQGoHcwjxVjnIoeqTdeKa0qKv4vYcqEUSzTLpLQ==
X-Gm-Gg: ASbGncvogYifscb6sqFfwQedPU01kGy88xpnBYx72WRnnFWfLald6kb53Gv2iYvbn+f
	ejfBB9iMxLnQj8gxp01PrGutg0Y4f7uCvkpcAy/ogY2m4qkTgQ4+kGFt964TQhk+Oi5K4uqVc/v
	Ughy/omb/E7+YI/f/I9pShfzwiGPYwRVtjHrP5HMWKRUD4/Xy+T3qwB6p8EazLyW39XgJGd/jT0
	8Y3NLcXk6pZ5K8BxzQU
X-Google-Smtp-Source: AGHT+IFjHWcdv5oE5C1YN1jOSYALZcdBu+X0+1pQuzNgk6FzmgT8QU+Oy6pHz6bk7kpTc2WG6bJwuRY/duk1idFQEI8=
X-Received: by 2002:a05:6808:4f25:b0:415:9306:2e3b with SMTP id
 5614622812f47-435df7c755dmr904332b6e.23.1755142690957; Wed, 13 Aug 2025
 20:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250515094301.40016-1-cuiyunhui@bytedance.com>
 <CAEEQ3w=XqoKmVu1kvc5XUbGbQJsHVkRx=T65tXvYEYo0HCTcnQ@mail.gmail.com>
 <aJs-aPH32OxpzR3G@sunil-laptop> <CAEEQ3wnHFPBPC0U59rDBJaZYxJ24uJzJ7NDQO0gfmVqoiQwNOw@mail.gmail.com>
 <aJtKZhvNX0p3obFw@sunil-laptop> <CAEEQ3wmomscuAzuiRyJu4ha8tiM=s1Y-ytQROPTWr1DScMNL3g@mail.gmail.com>
 <aJwiXKWXik8BmpL8@sunil-laptop> <CAEEQ3wky3LXK=ge1wBkHD0ZWtwUF-aBn44EK0Uxa+_2DB1Giqw@mail.gmail.com>
 <CAK9=C2VOaAJZxCeM-5QPj5B-ie68LivJyQcM8KwKjdL9u00RJg@mail.gmail.com>
In-Reply-To: <CAK9=C2VOaAJZxCeM-5QPj5B-ie68LivJyQcM8KwKjdL9u00RJg@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 14 Aug 2025 11:37:58 +0800
X-Gm-Features: Ac12FXxW1tpavd5e7r8AJU48FLd8aGJQvqCB0NLX9F_9NFjMnhVNy3qquQBWkqQ
Message-ID: <CAEEQ3wmDygvLn-EK_hCumOuCkPjKWfnmwiA+kz4p9N=thG0pXA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] ACPI: RISC-V: CPPC: Add CSR_CYCLE for CPPC FFH
To: Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_203816_585075_7B0D63D6 
X-CRM114-Status: GOOD (  48.25  )
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
Cc: aou@eecs.berkeley.edu, juwenlong@bytedance.com, alex@ghiti.fr, rafael@kernel.org, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, Rahul Pathak <rpathak@ventanamicro.com>, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQW51cCwKCk9uIFdlZCwgQXVnIDEzLCAyMDI1IGF0IDc6MTLigK9QTSBBbnVwIFBhdGVsIDxh
cGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEF1ZyAxMywgMjAyNSBh
dCAxMjoxNOKAr1BNIHl1bmh1aSBjdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToK
PiA+Cj4gPiBIaSBTdW5pbCwKPiA+Cj4gPiBPbiBXZWQsIEF1ZyAxMywgMjAyNSBhdCAxOjI44oCv
UE0gU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4gPgo+ID4g
PiBIaSBZdW5odWksCj4gPiA+Cj4gPiA+IE9uIFdlZCwgQXVnIDEzLCAyMDI1IGF0IDExOjIzOjM5
QU0gKzA4MDAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4gPiA+ID4gSGkgU3VuaWwsCj4gPiA+ID4KPiA+
ID4gPiBPbiBUdWUsIEF1ZyAxMiwgMjAyNSBhdCAxMDowNuKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2
bEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+IFsuLi5dCj4gPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gVGhlIHB1cnBvc2Ugb2YgY3BwY19mZmhfY3NyX3JlYWQo
KSBpcyB0byBjYWxjdWxhdGUgdGhlIGFjdHVhbAo+ID4gPiA+ID4gPiA+ID4gZnJlcXVlbmN5IG9m
IHRoZSBDUFUsIHdoaWNoIGlzIGRlbHRhX0NTUl9DWUNMRS9kZWx0YV9DU1JfWFhYLgo+ID4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IENTUl9YWFggc2hvdWxkIGJlIGEgcmVmZXJlbmNlIGNs
b2NrIGFuZCBkb2VzIG5vdCBjb3VudCBkdXJpbmcgV0ZJCj4gPiA+ID4gPiA+ID4gPiAoV2FpdCBG
b3IgSW50ZXJydXB0KS4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBTaW1pbGFyIHNv
bHV0aW9ucyBpbmNsdWRlOiB4ODYncyBhcGVyZi9tcGVyZiwgYW5kIEFSTTY0J3MgQU1VIHdpdGgK
PiA+ID4gPiA+ID4gPiA+IHJlZ2lzdGVycyBTWVNfQU1FVkNOVFIwX0NPUkVfRUwwL1NZU19BTUVW
Q05UUjBfQ09OU1RfRUwwLgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IEhvd2V2ZXIs
IHdlIGtub3cgdGhhdCBDU1JfVElNRSBpbiB0aGUgY3VycmVudCBjb2RlIGRvZXMgY291bnQgZHVy
aW5nCj4gPiA+ID4gPiA+ID4gPiBXRkkuIFNvLCBpcyB0aGlzIGRlc2lnbiB1bnJlYXNvbmFibGU/
Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gU2hvdWxkIHdlIGNvbnNpZGVyIHByb3Bv
c2luZyBhbiBleHRlbnNpb24gdG8gc3VwcG9ydCBzdWNoIGEgZGVkaWNhdGVkCj4gPiA+ID4gPiA+
ID4gPiBjb3VudGVyIChhIHJlZmVyZW5jZSBjbG9jayB0aGF0IGRvZXMgbm90IGNvdW50IGR1cmlu
ZyBXRkkpPyBUaGlzIHdheSwKPiA+ID4gPiA+ID4gPiA+IHRoZSB2YWx1ZSBjYW4gYmUgb2J0YWlu
ZWQgZGlyZWN0bHkgaW4gUy1tb2RlIHdpdGhvdXQgdHJhcHBpbmcgdG8KPiA+ID4gPiA+ID4gPiA+
IE0tbW9kZSwgZXNwZWNpYWxseSBzaW5jZSByZWFkaW5nIHRoaXMgY291bnRlciBpcyB2ZXJ5IGZy
ZXF1ZW50Lgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBIaSBZdW5odWksCj4gPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiBZZXMsIGJ1dCB3ZSBhbnRpY2lwYXRlZCB0aGF0IHZlbmRvcnMg
bWlnaHQgZGVmaW5lIHRoZWlyIG93biBjdXN0b20gQ1NScy4KPiA+ID4gPiA+ID4gPiBTbywgd2Ug
aW50cm9kdWNlZCBGRkggZW5jb2RpbmcgdG8gYWNjb21tb2RhdGUgc3VjaCBjYXNlcy4KPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+IFRoYW5rcywKPiA+ID4gPiA+ID4gPiBTdW5pbAo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiBBcyBtZW50aW9uZWQgZWFybGllciwgaXQgaXMgYmVzdCB0byBkaXJl
Y3RseSByZWFkIENTUl9YWFggKGEgcmVmZXJlbmNlCj4gPiA+ID4gPiA+IGNsb2NrIHRoYXQgZG9l
cyBub3QgY291bnQgZHVyaW5nIFdGSSkgYW5kIENTUl9DWUNMRSBpbiBTLW1vZGUsIHJhdGhlcgo+
ID4gPiA+ID4gPiB0aGFuIHRyYXBwaW5nIHRvIFNCSS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+IE5v
LiBJIG1lYW50IGRpcmVjdCBDU1IgYWNjZXNzIGl0c2VsZiBub3QgU0JJLiBQbGVhc2UgdGFrZSBh
IGxvb2sgYXQKPiA+ID4gPiA+IFRhYmxlIDYgb2YgUklTQy1WIEZGSCBzcGVjLgo+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gZHJpdmVycy9hY3BpL3Jpc2N2L2NwcGMuYyBpcyBhIGdlbmVyaWMgZHJpdmVy
IHRoYXQgaXMgbm90IHNwZWNpZmljIHRvCj4gPiA+ID4gPiA+IGFueSB2ZW5kb3IuIEN1cnJlbnRs
eSwgdGhlIHVwc3RyZWFtIGNvZGUgYWxyZWFkeSB1c2VzIENTUl9USU1FLCBhbmQKPiA+ID4gPiA+
ID4gdGhlIGxvZ2ljIG9mIENTUl9USU1FIGlzIGluY29ycmVjdC4KPiA+ID4gPiA+ID4KPiA+ID4g
QUNQSSBzcGVjIGZvciAiUmVmZXJlbmNlIFBlcmZvcm1hbmNlIFJlZ2lzdGVyIiBzYXlzLAo+ID4g
Pgo+ID4gPiAiVGhlIFJlZmVyZW5jZSBQZXJmb3JtYW5jZSBDb3VudGVyIFJlZ2lzdGVyIGNvdW50
cyBhdCBhIGZpeGVkIHJhdGUgYW55Cj4gPiA+IHRpbWUgdGhlIHByb2Nlc3NvciBpcyBhY3RpdmUu
IEl0IGlzIG5vdCBhZmZlY3RlZCBieSBjaGFuZ2VzIHRvIERlc2lyZWQKPiA+ID4gUGVyZm9ybWFu
Y2UsIHByb2Nlc3NvciB0aHJvdHRsaW5nLCBldGMuIgo+ID4gPgo+ID4gPiA+ID4gQ1NSX1RJTUUg
aXMganVzdCBhbiBleGFtcGxlLiBJdCBpcyB1cHRvIHRoZSB2ZW5kb3IgaG93IF9DUEMgb2JqZWN0
cyBhcmUKPiA+ID4gPiA+IGVuY29kZWQgdXNpbmcgRkZILiBUaGUgbGludXggY29kZSBkb2Vzbid0
IG1lYW4gb25lIHNob3VsZCB1c2UgQ1NSX1RJTUUKPiA+ID4gPiA+IGFsd2F5cy4KPiA+ID4gPgo+
ID4gPiA+IEZpcnN0LCB0aGUgZXhhbXBsZSBvZiBDU1JfVElNRSBpcyBpbmNvcnJlY3QuIFdoYXQg
aXMgbmVlZGVkIGlzIGEKPiA+ID4gPiBDU1JfWFhYIChhIHJlZmVyZW5jZSBjbG9jayB0aGF0IGRv
ZXMgbm90IGNvdW50IGR1cmluZyBXRkkpLgo+ID4gPiA+Cj4gPiA+ID4gU2Vjb25kLCB5b3UgbWVu
dGlvbmVkIHRoYXQgZWFjaCB2ZW5kb3IgY2FuIGN1c3RvbWl6ZSB0aGVpciBvd24KPiA+ID4gPiBp
bXBsZW1lbnRhdGlvbnMuIEJ1dCBzaG91bGQgYWxsIHZlbmRvcnMnIENTUl9YWFgvWVlZLy4uLiBi
ZSBhZGRlZCB0bwo+ID4gPiA+IGRyaXZlcnMvYWNwaS9yaXNjdi9jcHBjLmM/IFNob3VsZG7igJl0
IGRyaXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMgZmFsbAo+ID4gPiA+IHVuZGVyIHRoZSBzY29wZSBk
ZWZpbmVkIGJ5IHRoZSBSSVNDLVYgYXJjaGl0ZWN0dXJlPwo+ID4gPiA+Cj4gPiA+IE5vLiBPbmUg
Y2FuIGltcGxlbWVudCBzaW1pbGFyIHRvIGNzcl9yZWFkX251bSgpIGluIG9wZW5zYmkuIFdlIGRp
ZG4ndAo+ID4gPiBhZGQgaXQgc2luY2UgdGhlcmUgd2FzIG5vIEhXIGltcGxlbWVudGluZyBzdWNo
IHRoaW5nLiBXaGF0IEkgYW0KPiA+ID4gc2F5aW5nIGlzIHdlIGhhdmUgRkZIIGVuY29kaW5nIHRv
IHN1cHBvcnQgc3VjaCBjYXNlLgo+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSXQgd291bGQg
YmUgYmVzdCB0byBwcm9tb3RlIGEgc3BlY2lmaWNhdGlvbiB0byBzdXBwb3J0IENTUl9YWFgsIGp1
c3QKPiA+ID4gPiA+ID4gbGlrZSB3aGF0IGhhcyBiZWVuIGRvbmUgZm9yIHg4NiBhbmQgYXJtNjQu
IFdoYXQgZG8geW91IHRoaW5rPwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gV291bGRuJ3QgYWJvdmUg
d29yaz8gRm9yIGEgc3RhbmRhcmQgZXh0ZW5zaW9uLCB5b3UgbWF5IGhhdmUgdG8gcHJvdmlkZQo+
ID4gPiA+ID4gbW9yZSBkYXRhIHdpdGggYWN0dWFsIEhXLgo+ID4gPiA+Cj4gPiA+ID4gVGhpcyB3
b27igJl0IHdvcmsuIE1heSBJIGFzayBob3cgdGhlIGN1cnJlbnQgdXBzdHJlYW0gY29kZSBjYW4g
Y2FsY3VsYXRlCj4gPiA+ID4gdGhlIGFjdHVhbCBDUFUgZnJlcXVlbmN5IHVzaW5nIENTUl9USU1F
IHdpdGhvdXQgdHJhcHBpbmcgdG8gU0JJPwo+ID4gPiA+IFRoaXMgaXMgYSB0aGVvcmV0aWNhbCBs
b2dpY2FsIGlzc3VlLiBXaHkgaXMgZGF0YSBuZWVkZWQgaGVyZT8KPiA+ID4gPgo+ID4gPiBBcyBJ
IG1lbnRpb25lZCBhYm92ZSwgb25lIGNhbiBpbXBsZW1lbnQgYSBnZW5lcmljIENTUiByZWFkIHdp
dGhvdXQKPiA+ID4gdHJhcHBpbmcgdG8gU0JJLgo+ID4gPgo+ID4gPiA+IENvdWxkIHlvdSB0YWtl
IGEgbG9vayBhdCB0aGUgIkFNVSBldmVudHMgYW5kIGV2ZW50IG51bWJlcnMiIGNoYXB0ZXIgaW4K
PiA+ID4gPiB0aGUgQVJNNjQgbWFudWFsPwo+ID4gPiA+Cj4gPiA+IEFzLXBlciBBQ1BJIHNwZWMg
cmVmZXJlbmNlIHBlcmZvcm1hbmNlIGNvdW50ZXIgaXMgbm90IGFmZmVjdGVkIGJ5IENQVQo+ID4g
PiBzdGF0ZS4gVGhlIFJJU0MtViBGRkggZW5jb2RpbmcgaXMgc3VmZmljaWVudGx5IGdlbmVyaWMg
dG8gc3VwcG9ydCB0aGlzCj4gPiA+IHJlcXVpcmVtZW50LCBldmVuIGlmIHRoZSBzdGFuZGFyZCBD
U1JfVElNRSBjYW5ub3QgYmUgdXNlZC4gSW4gc3VjaAo+ID4gPiBjYXNlcywgYW4gYWx0ZXJuYXRp
dmUgQ1NSIGNhbiBiZSBlbmNvZGVkZWQsIGFjY2Vzc2VkIHZpYSBhbiBPUy1sZXZlbAo+ID4gPiBh
YnN0cmFjdGlvbiBzdWNoIGFzIGNzcl9yZWFkX251bSgpLgo+ID4KPiA+IFNvIHdoYXQgeW91J3Jl
IHNheWluZyBpcyB0aGF0IHdlIHNob3VsZCBzdWJtaXQgYSBwYXRjaCBsaWtlIHRoaXMsIHJpZ2h0
Pwo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvcmlzY3YvY3BwYy5jIGIvZHJpdmVy
cy9hY3BpL3Jpc2N2L2NwcGMuYwo+ID4gaW5kZXggNDQwY2Y5ZmI5MWFhYi4uOTUzYzI1OWQ0NmM2
OSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMKPiA+ICsrKyBiL2Ry
aXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMKPiA+IEBAIC02NiwxNiArNjYsOCBAQCBzdGF0aWMgdm9p
ZCBjcHBjX2ZmaF9jc3JfcmVhZCh2b2lkICpyZWFkX2RhdGEpCj4gPiAgewo+ID4gICAgICAgICBz
dHJ1Y3Qgc2JpX2NwcGNfZGF0YSAqZGF0YSA9IChzdHJ1Y3Qgc2JpX2NwcGNfZGF0YSAqKXJlYWRf
ZGF0YTsKPiA+Cj4gPiAtICAgICAgIHN3aXRjaCAoZGF0YS0+cmVnKSB7Cj4gPiAtICAgICAgIC8q
IFN1cHBvcnQgb25seSBUSU1FIENTUiBmb3Igbm93ICovCj4gPiAtICAgICAgIGNhc2UgQ1NSX1RJ
TUU6Cj4gPiAtICAgICAgICAgICAgICAgZGF0YS0+cmV0LnZhbHVlID0gY3NyX3JlYWQoQ1NSX1RJ
TUUpOwo+ID4gLSAgICAgICAgICAgICAgIGRhdGEtPnJldC5lcnJvciA9IDA7Cj4gPiAtICAgICAg
ICAgICAgICAgYnJlYWs7Cj4gPiAtICAgICAgIGRlZmF1bHQ6Cj4gPiAtICAgICAgICAgICAgICAg
ZGF0YS0+cmV0LmVycm9yID0gLUVJTlZBTDsKPiA+IC0gICAgICAgICAgICAgICBicmVhazsKPiA+
IC0gICAgICAgfQo+ID4gKyAgICAgICBkYXRhLT5yZXQudmFsdWUgPSBjc3JfcmVhZF9udW0oZGF0
YS0+cmVnKTsKPiA+ICsgICAgICAgZGF0YS0+cmV0LmVycm9yID0gMDsKPiA+ICB9Cj4gPgo+ID4g
SWYgdGhhdCdzIHRoZSBjYXNlLCB0aGUgcm9idXN0bmVzcyBvZiB0aGUgY29kZSBjYW5ub3QgYmUg
Z3VhcmFudGVlZCwKPiA+IGJlY2F1c2UgdGhlIHJhbmdlIG9mIENTUnMgZnJvbSBkaWZmZXJlbnQg
dmVuZG9ycyBpcyB1bmtub3duLgo+Cj4gQUNQSSBGRkggaXMgYWxsb3dzIG1hcHBpbmcgdG8gYW55
IENTUi4KClllcywgRkZIIGNhbiBtYXAgYW55IENTUiwgYW5kIHRoaXMgaXMgbm90IHRoZSBwb2lu
dCBvZiBjb250ZW50aW9uLgoKSWYgdGhhdCdzIHRoZSBjYXNlLCB0aGUgQ1NSX1RJTUUgdXNlZCBp
biB0aGUgY3VycmVudCBrZXJuZWwgY29kZSBpcwppbmFwcHJvcHJpYXRlLiBTb21lIHZlbmRvcnMg
bWF5IGRlc2lnbiBhIGNvdW50ZXIgdGhhdCBkb2VzIG5vdCBjb3VudApkdXJpbmcgV0ZJLCBtYWtp
bmcgQ1NSX1RJTUUgaXJyZWxldmFudC4gRXZlbiBpZiBjb3VudGluZyBjb250aW51ZXMKZHVyaW5n
IFdGSSwgYXJlIHlvdSBwbGFubmluZyB0byBoYXZlIG9uZSBjb3VudGVyIG9wZXJhdGUgaW4gUy1t
b2RlCndoaWxlIHRoZSBvdGhlciB0cmFwcyB0byBNLW1vZGU/CgpJbiB0aGF0IGNhc2UsIHRoZSBj
b2RlIHdvdWxkIG5lZWQgdG8gYmUgbW9kaWZpZWQgYXMgcHJvcG9zZWQgYWJvdmUuIERvCnlvdSBh
Z3JlZT8KCldpdGhvdXQgYSBzcGVjaWZpY2F0aW9uIGRlZmluaW5nIHRoZXNlIHR3byBjb3VudGVy
cywgdGhlIGFib3ZlIGNvZGUKd291bGQgbGFjayByb2J1c3RuZXNzLgoKPgo+ID4KPiA+IFNpbmNl
IGVhY2ggdmVuZG9yIHdpbGwgZGVmaW5lIHRoZWlyIG93biBDU1JzLCB3aHkgbm90IGZvcm1hbGl6
ZSB0aGVtCj4gPiBpbnRvIGEgc3BlY2lmaWNhdGlvbj8KPgo+IFRoZSBfQ1BDIG9iamVjdHMgaW4g
dGhlIEFDUEkgdGFibGUgcG9pbnQgdG8gcGxhdGZvcm0gc3BlY2lmaWMgbWVjaGFuaXNtcwo+IG9m
IGFjY2Vzc2luZyBDUFBDIENTUiBzbyBpdCBjYW4gcG9pbnQgdG8gYSB2ZW5kb3Igc3BlY2lmaWMg
Q1NSLgo+Cj4gUmVnYXJkcywKPiBBbnVwCgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
