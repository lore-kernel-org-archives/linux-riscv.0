Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6647CE7717F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Dec 2024 04:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wLO0kJxCgFVZhJp+ytIsRuFJ9d8RmpRVMkEDPllqDho=; b=SvHPyX9ddTRMT4
	eBsmFVXXuMhQvau2jLf/S0B83UpQgGZVZ0hySq4f2WQ8BT4nHldNsftfQiMyrUBvw2SxZJpKhLiXY
	V8cfivul4PBFRnWDMNBhe7ZFqtHbemf1gdcU+9U5Kh9vpb2c2Jr83WzVQ9e0zUwR2gB6YOea6Is5w
	Xzi5gVieec6NUAw0wM0HWo+1Pl86kPhjJM42Fh7jmp6J/v864ikeSSnkLpmGvXPSGpmj4NyNn7dMS
	F1rz66b2CNqSNpnvE4iYLV1Jr6INWmWqMIOa7xHVA6m7BkcYpLjR1yTEfHZVy2pHTb21/cfCLYhJo
	dwG6SsbSiwhHR/QrN5KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLaSw-0000000Gr7j-42Aq;
	Thu, 12 Dec 2024 04:06:18 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLaSt-0000000Gr76-2SoQ
	for linux-riscv@lists.infradead.org;
	Thu, 12 Dec 2024 04:06:17 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e3988fdb580so87034276.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Dec 2024 20:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1733976373; x=1734581173; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HNThN3xxJpDkX7zz4qNy+1XATIU8RpacmkG/vbjSArU=;
        b=NDmjpS2JqcTt4ub896NPJ9PYrl/taxV0Oskq5M1OQboaCxvB4LubBzHSt2zYWTHsSA
         4UOZTgFRQ1WMoUD8HQv61pOiRYhIzYMbE4+Tg6MMaomYOnoDJmAnbYPoi8HtqsXb9WyQ
         Y7F9xsJebsndZdB1Stza27lv5fTVUeyuaY54vNDWn+bBybCxMyOtXIZsNDCTdKIlV7G3
         TIeqh/VHXR3ajcuMFpu7RTLGXghyZZ5aViqKHQxzbr7d/RdMD1u+XIVglCH10GJHmh/O
         QpYjraiU9fgKKWIim8kTfpSqIJEqXdFpM+CFSPMQwl3AJsFsbzNhruon5pekeH1q8sUa
         tw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733976373; x=1734581173;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HNThN3xxJpDkX7zz4qNy+1XATIU8RpacmkG/vbjSArU=;
        b=UEzCf79Xq1A/OLJdfw9i1Oxll3LEhke1QKT/9DbG5XchM7CBX3Qz47uJU0IgqprtEI
         lAko26Kdl93FtZ0LEPUu49vbod6SaSspOimlMx/MXpTewwG23qjzAXFtkH5703P38fRV
         Jn4ERJbjKpklxIbtIS+JYKM20HFnknz5ZmOFX71DBSlI8FnX5l36J02aGqI44y46Cvvx
         +IGm0U2JPgN90r9kLE+TspYp+wtLILJumHUnu9tm+AL5wMYLPc5np1CuK+9+Eqo2U8tS
         0qxaSad1tChGGaineeiM2h7hmtzZUeiuKQQbmU6Ni4dN+fghNpJSbbtYHp7OonOsIv+Y
         +F6g==
X-Forwarded-Encrypted: i=1; AJvYcCW06fttPt45IROtw3gLOljQxnaXYdvLN9L3FjzyNSwVUX/rEqRG4lVvT8mBKqEwO0+JGEFWacYeCTXmNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOGSivl30zeBlA3i431Fg2OYUmubCyxnCMFNyXL5j5L3azkDV5
	d7C4vGKXqcz1ynq+x8l6wQ8Z/aQDUfrUlxaxsgIH009O1KHrQ0r7aoZ/z6vTd/k=
X-Gm-Gg: ASbGncuXpB586qA2jJNPQGsBZHmPm92yQvUQGZinxlxIERqvxKBor9AAIbtujMs6azl
	Tmzj3Ix3v5ynMMWkxAlqJpoHypEbYF3BNzgmeY2IxMzN6htqaCjtInBU/Ph+smbsMcGBT10ASps
	aSPWrMMkoTdzNtYzH5jBMTTReRHLqNoGf7faWPDmNkAvvWXcABcCer49Ek4YOCyq1KNST5AGob/
	49LjO1iPfKEORHWyDK9z5j3m4cDKuRPUWPVhQfi0OLGDCiBwZA0N4zTR/OQg1sieUuEt04LE3gz
X-Google-Smtp-Source: AGHT+IHcPuv7xP8p/G8hD+xO+jVNR9WpDxUxclJRB6GkxOcrKYUZNX7Zo+qKGKdD3FrAFu7J5lUVJQ==
X-Received: by 2002:a05:6902:2842:b0:e3a:386e:35b7 with SMTP id 3f1490d57ef6-e3da0c5ef71mr1594871276.28.1733976373656;
        Wed, 11 Dec 2024 20:06:13 -0800 (PST)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e3c94a035c2sm600720276.26.2024.12.11.20.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 20:06:13 -0800 (PST)
Message-ID: <c094ae0b-ddf0-42fc-ad47-00fad84fb70d@sifive.com>
Date: Wed, 11 Dec 2024 22:06:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drivers/perf: riscv: Do not allow invalid raw event
 config
To: Atish Kumar Patra <atishp@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, atishp@atishpatra.org,
 anup@brainfault.org, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, mchitale@ventanamicro.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241209-pmu_event_fixes-v1-2-d9525e90072c@rivosinc.com>
 <mhng-1c6ec679-02bc-4aa3-9b23-bb4c5f5f9b81@palmer-ri-x1c9a>
 <CAHBxVyF445KnZfT9rPhTwKA76_GT0eT3+p=ot1oLQzUb7j7d7w@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <CAHBxVyF445KnZfT9rPhTwKA76_GT0eT3+p=ot1oLQzUb7j7d7w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_200616_485732_DE0CE515 
X-CRM114-Status: GOOD (  25.80  )
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

SGkgQXRpc2gsCgpPbiAyMDI0LTEyLTExIDM6MTAgUE0sIEF0aXNoIEt1bWFyIFBhdHJhIHdyb3Rl
Ogo+IE9uIFdlZCwgRGVjIDExLCAyMDI0IGF0IDExOjQ24oCvQU0gUGFsbWVyIERhYmJlbHQgPHBh
bG1lckBkYWJiZWx0LmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIE1vbiwgMDkgRGVjIDIwMjQgMTY6MDQ6
NDYgUFNUICgtMDgwMCksIEF0aXNoIFBhdHJhIHdyb3RlOgo+Pj4gVGhlIFNCSSBzcGVjaWZpY2F0
aW9uIGFsbG93cyBvbmx5IGxvd2VyIDQ4Yml0cyBvZiBocG1ldmVudFggdG8gYmUKPj4+IGNvbmZp
Z3VyZWQgdmlhIFNCSSBQTVUuIEN1cnJlbnRseSwgdGhlIGRyaXZlciBtYXNrcyBvZiB0aGUgaGln
aGVyCj4+PiBiaXRzIGJ1dCBkb2Vzbid0IHJldHVybiBhbiBlcnJvci4gVGhpcyB3aWxsIGxlYWQg
dG8gYW4gYWRkaXRpb25hbAo+Pj4gU0JJIGNhbGwgZm9yIGNvbmZpZyBtYXRjaGluZyB3aGljaCBz
aG91bGQgcmV0dXJuIGZvciBhbiBpbnZhbGlkCj4+PiBldmVudCBlcnJvciBpbiBtb3N0IG9mIHRo
ZSBjYXNlcy4KPj4+Cj4+PiBIb3dldmVyLCBpZiBhIHBsYXRmb3JtKGkuZSBSb2NrZXQgYW5kIHNp
Zml2ZSBjb3JlcykgaW1wbGVtZW50cyBhCj4+PiBiaXRtYXAgb2YgYWxsIGJpdHMgaW4gdGhlIGV2
ZW50IGVuY29kaW5nIHRoaXMgd2lsbCBsZWFkIHRvIGFuCj4+PiBpbmNvcnJlY3QgZXZlbnQgYmVp
bmcgcHJvZ3JhbW1lZCBsZWFkaW5nIHRvIHVzZXIgY29uZnVzaW9uLgo+Pj4KPj4+IFJlcG9ydCB0
aGUgZXJyb3IgdG8gdGhlIHVzZXIgaWYgaGlnaGVyIGJpdHMgYXJlIHNldCBkdXJpbmcgdGhlCj4+
PiBldmVudCBtYXBwaW5nIGl0c2VsZiB0byBhdm9pZCB0aGUgY29uZnVzaW9uIGFuZCBzYXZlIGFu
IGFkZGl0aW9uYWwKPj4+IFNCSSBjYWxsLgo+Pj4KPj4+IFN1Z2dlc3RlZC1ieTogU2FtdWVsIEhv
bGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBdGlz
aCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPj4+IC0tLQo+Pj4gIGRyaXZlcnMvcGVyZi9y
aXNjdl9wbXVfc2JpLmMgfCAxMCArKysrKystLS0tCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
ZXJmL3Jpc2N2X3BtdV9zYmkuYyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPj4+IGlu
ZGV4IDM0NzNiYTAyYWJmMy4uZmI2ZWRhOTBmNzcxIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9w
ZXJmL3Jpc2N2X3BtdV9zYmkuYwo+Pj4gKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmku
Ywo+Pj4gQEAgLTUwNyw3ICs1MDcsNyBAQCBzdGF0aWMgaW50IHBtdV9zYmlfZXZlbnRfbWFwKHN0
cnVjdCBwZXJmX2V2ZW50ICpldmVudCwgdTY0ICplY29uZmlnKQo+Pj4gIHsKPj4+ICAgICAgIHUz
MiB0eXBlID0gZXZlbnQtPmF0dHIudHlwZTsKPj4+ICAgICAgIHU2NCBjb25maWcgPSBldmVudC0+
YXR0ci5jb25maWc7Cj4+PiAtICAgICBpbnQgcmV0Owo+Pj4gKyAgICAgaW50IHJldCA9IC1FTk9F
TlQ7Cj4+Pgo+Pj4gICAgICAgLyoKPj4+ICAgICAgICAqIEVuc3VyZSB3ZSBhcmUgZmluaXNoZWQg
Y2hlY2tpbmcgc3RhbmRhcmQgaGFyZHdhcmUgZXZlbnRzIGZvcgo+Pj4gQEAgLTUzNiw4ICs1MzYs
MTEgQEAgc3RhdGljIGludCBwbXVfc2JpX2V2ZW50X21hcChzdHJ1Y3QgcGVyZl9ldmVudCAqZXZl
bnQsIHU2NCAqZWNvbmZpZykKPj4+Cj4+PiAgICAgICAgICAgICAgIHN3aXRjaCAoY29uZmlnID4+
IDYyKSB7Cj4+PiAgICAgICAgICAgICAgIGNhc2UgMDoKPj4+IC0gICAgICAgICAgICAgICAgICAg
ICByZXQgPSBSSVNDVl9QTVVfUkFXX0VWRU5UX0lEWDsKPj4+IC0gICAgICAgICAgICAgICAgICAg
ICAqZWNvbmZpZyA9IGNvbmZpZyAmIFJJU0NWX1BNVV9SQVdfRVZFTlRfTUFTSzsKPj4+ICsgICAg
ICAgICAgICAgICAgICAgICAvKiBSZXR1cm4gZXJyb3IgYW55IGJpdHMgWzQ4LTYzXSBpcyBzZXQg
IGFzIGl0IGlzIG5vdCBhbGxvd2VkIGJ5IHRoZSBzcGVjICovCj4+PiArICAgICAgICAgICAgICAg
ICAgICAgaWYgKCEoY29uZmlnICYgflJJU0NWX1BNVV9SQVdfRVZFTlRfTUFTSykpIHsKPj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICplY29uZmlnID0gY29uZmlnICYgUklTQ1ZfUE1V
X1JBV19FVkVOVF9NQVNLOwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0g
UklTQ1ZfUE1VX1JBV19FVkVOVF9JRFg7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgfQo+Pj4g
ICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+Pj4gICAgICAgICAgICAgICBjYXNlIDI6Cj4+
PiAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gKGNvbmZpZyAmIDB4RkZGRikgfCAoU0JJX1BN
VV9FVkVOVF9UWVBFX0ZXIDw8IDE2KTsKPj4+IEBAIC01NTQsNyArNTU3LDYgQEAgc3RhdGljIGlu
dCBwbXVfc2JpX2V2ZW50X21hcChzdHJ1Y3QgcGVyZl9ldmVudCAqZXZlbnQsIHU2NCAqZWNvbmZp
ZykKPj4+ICAgICAgICAgICAgICAgfQo+Pj4gICAgICAgICAgICAgICBicmVhazsKPj4+ICAgICAg
IGRlZmF1bHQ6Cj4+PiAtICAgICAgICAgICAgIHJldCA9IC1FTk9FTlQ7Cj4+PiAgICAgICAgICAg
ICAgIGJyZWFrOwo+Pj4gICAgICAgfQo+Pgo+PiBUaGlzIGRvZXNuJ3QgaGF2ZSBhIEZpeGVzLCBp
cyBpdAo+Pgo+PiAgICAgRml4ZXM6IGYwYzkzNjNkYjJkZCAoInBlcmYvcmlzY3Ytc2JpOiBBZGQg
cGxhdGZvcm0gc3BlY2lmaWMgZmlybXdhcmUgZXZlbnQgaGFuZGxpbmciKQo+Pgo+IAo+IEkgd2Fz
IG5vdCBzdXJlIGlmIGEgRml4ZXMgdGFnIHdhcyB3b3J0aCBpdCBhcyB0aGUgY3VycmVudAo+IGJl
aGF2aW9yKG1hc2tpbmcgb2ZmIHRoZSBoaWdoZXIgYml0cykgaXMgdGhlcmUgZnJvbSB0aGUgYmVn
aW5uaW5nIG9mCj4gdGhlIGRyaXZlci4KPiBwZXJmIHRvb2wgdGhyb3dzIGEgd2FybmluZyBhcyB3
ZWxsIGlmIGEgdXNlciB0cmllcyB0byBzZXQgYW55IG9mIHRoZQo+IHVwcGVyIDE2IGJpdHMgYXMg
ZXZlbnQgYXR0cmlidXRlcyBpcyBzZXQgdG8gMC00Ny4KPiAKPiBJZiBpdCBzaG91bGQgYmUgYmFj
a3BvcnRlZCwgdGhpcyBpcyB0aGUgY29ycmVjdCBmaXhlcyB0YWcuCj4gRml4ZXM6IGU5OTkxNDM0
NTk2ZiAoIlJJU0MtVjogQWRkIHBlcmYgcGxhdGZvcm0gZHJpdmVyIGJhc2VkIG9uIFNCSQo+IFBN
VSBleHRlbnNpb24iKQoKSSB3b3VsZCBhZ3JlZSB0aGUgbWFza2luZyBpc24ndCBhIHJlYWwgaXNz
dWUgYmVmb3JlIGNoYW5naW5nIHRoZSBldmVudCBhdHRyaWJ1dGUKZnJvbSA0OCB0byA1NiBiaXRz
IHdpZGUuIEhvd2V2ZXIsIHRoaXMgcGF0Y2ggYWxzbyBkb2VzIGEgZHJpdmUtYnkgZml4IG9mIGEK
ZGlmZmVyZW50IGJ1ZyBpbnRyb2R1Y2VkIGJ5IGYwYzkzNjNkYjJkZDogdGhlcmUgaXMgbm8gImNh
c2UgMSIgb3IgZGVmYXVsdCBjYXNlLApzbyB0aGUgZnVuY3Rpb24gd291bGQgcmV0dXJuIGFuIHVu
aW5pdGlhbGl6ZWQgdmFsdWUgaWYgdGhlIGhpZ2ggYml0cyBhcmUgMDEuCk1heWJlIHRoYXQgc2hv
dWxkIGJlIGEgc2VwYXJhdGUgcGF0Y2gsIHdpdGggYSBGaXhlcyB0YWc/CgpSZWdhcmRzLApTYW11
ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
