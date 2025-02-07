Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0C7C0219B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 09:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2uBwoVY0eB3HaqEWbP8NCuhEzTglre1cR4LEea7HuU=; b=HEc5tKMkLMKjIx
	a6Sko4DkYtdUDSAfGdORj1Sv9s1KRsbpPxdNTgduu3310a4xlBZl874IsDT2mChDCD4VVIE/T+DpC
	brI3W+CsoWmYl/ARA01McWvJg70AkvR0D80y5VLVPRSvXueCh/x9Eoba3vWbQr7by7t5efITljJis
	OhSr8Sb/awP9XsdXCwovr5ehfQOFLLbr5LWtDuoUkA//tosRGFOjJlT1AgpJfuudHMYVVtLQ8hoB3
	F0nAz7vgdE2LqEex2VXqXZYQplRb8pCFwZxHW2rXZETHmSIDJcSDHRqrsE231REEKeVuaQaNjkdEk
	RneIxPHvqOOj7gIW7EBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKar-000000090YM-1oxB;
	Fri, 07 Feb 2025 09:24:13 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKY7-00000009016-2erE
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 09:21:25 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43690d4605dso12345795e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 01:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738920082; x=1739524882; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9tiH9b+H/9t/xpf0NWHkN82z4SsEthrDvr6Ide4MKv0=;
        b=O1txkBHNSd1QK67hQfE3AgzdRZIQw2VwGdDYknbqzz6fQ/6GblfNDH/3aemfBR4SFb
         GbLjp0MmnUKmL1ZGp/ItBFXQyyXaepBUHBTRTJS78Rg14shtvjnPR4MAvyj6c9zW4cJT
         8J6o/4UVDJa/49+wqZEghmyy6N571JVU9Wa5uXwbw3aPlO33c4MT82IA7aSNWU2rsQCi
         z+zuc+0st2ymujGtF06+m48XNuL4p1qE+ZvVrykaebVEspP94jFCq8qkoH0I9UVRjFqZ
         TLaXI450tEaz0zEKbp7tPP5fF/SO1I04A4jCgZsgVB810TXmQHuQK4l+06U2hYaBBcC2
         h/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738920082; x=1739524882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9tiH9b+H/9t/xpf0NWHkN82z4SsEthrDvr6Ide4MKv0=;
        b=dPI6YpHrVLn6zT/nWrxhJOai52DaWHCFwtlFNh+oSd2orJD6b1nYFrG6U7HOhUyVsZ
         5Sk9M0N1Lktz2vftBvFYCx7o4YqY58nmFlSM0ZXTLVGuamX1LpZ504CMhFXTFdzhJPC3
         yDABY9rWZZYfdkeZpAGMw8IQcU4UwFh8bWgLHe2AqNWN/tD2kTwNzGydqH3cTs6S6aMI
         vr/L9F3ECaucfh0HLCsZlLv0AAgxGNGetuA7prt7Q+QYjMPPRlkmSSY1tHXAGQBlpD4N
         xUm6C9UY2oWAGF6DMMyCHkeUgpi02Ulg7qKkktrycWemK6MBg7URImLCV9ZEAPYdB7U5
         IfTA==
X-Gm-Message-State: AOJu0YwJTgOrCjCg5pOaw6ic7F6qNUIGMNsxqXpgTr1s/yrxOfIWt+AD
	USW0KmgVkikJKe6RbaYMNzzDypwa4FzXwjC6V+FMjLjHeHkeug6gPY893et//Vo=
X-Gm-Gg: ASbGncsH639llNcQB+De0JrrS7miF/VCdIhW/AqGiNNi3lL6PeVkN7+M+fuhoRubNPJ
	RnMH4XwlbOGbV1oe1Arsay6ppM29YeBHW2nNO7S0G5TL3u6vinpDQQljx72l2pyqB1xIlNdP4sO
	1eY6KgZJahkFbGm4/FKs1i6YLjHq+mdZBm5hJkbl5G5en0E1HkztyY71r+4csboX/2QD/oJQ065
	sSbLGb+hjVd0bt9Zbsbw4+8lZQDu5v95wTe8FYucqFSq9TAqYwLVlvUQK4/6i3XMWpfmQOkv9SW
	dRQ6X8oIu7PWpW7/G9lPxr/5D+92AOcbuYxZ24tFo55r+myHbQhaetXtkjoL
X-Google-Smtp-Source: AGHT+IECWFH7U0mArd280iuB70Vnw8HZQHKBAtWHAu5Pk2zNKD95w0WIBx5nMCf9e60ecld/9uOCGw==
X-Received: by 2002:a05:600c:3c9b:b0:436:5fc9:30ba with SMTP id 5b1f17b1804b1-439249c385cmr21219595e9.29.1738920082212;
        Fri, 07 Feb 2025 01:21:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439069290c7sm87180725e9.0.2025.02.07.01.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 01:21:21 -0800 (PST)
Message-ID: <7aace8a9-0e62-4156-9c50-f7b399c4eba2@rivosinc.com>
Date: Fri, 7 Feb 2025 10:21:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/21] RISC-V: Add Smcntrpmf extension parsing
To: Atish Patra <atishp@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
 <20250205-counter_delegation-v4-6-835cfa88e3b1@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-6-835cfa88e3b1@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_012123_876367_BE99C949 
X-CRM114-Status: GOOD (  14.70  )
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

CgpPbiAwNi8wMi8yMDI1IDA4OjIzLCBBdGlzaCBQYXRyYSB3cm90ZToKPiBTbWNudHJwbWYgZXh0
ZW5zaW9uIGFsbG93cyBNLW1vZGUgdG8gZW5hYmxlIHByaXZpbGVnZSBtb2RlIGZpbHRlcmluZwo+
IGZvciBjeWNsZS9pbnN0cmV0IGNvdW50ZXJzLiBIb3dldmVyLCB0aGUgY3ljbGVjZmcvaW5zdHJl
dGNmZyBDU1JzIGFyZQo+IG9ubHkgYXZhaWxhYmxlIG9ubHkgaW4gU3NjY2ZnIG9ubHkgU21jbnRy
cG1mIGlzIHByZXNlbnQuCj4gCj4gVGhhdCdzIHdoeSwga2VybmVsIG5lZWRzIHRvIGRldGVjdCBw
cmVzZW5jZSBvZiBTbWNudHJwbWYgZXh0ZW5zaW9uIGFuZAo+IGVuYWJsZSBwcml2aWxlZ2UgbW9k
ZSBmaWx0ZXJpbmcgZm9yIGN5Y2xlL2luc3RyZXQgY291bnRlcnMuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaHdjYXAuaCB8IDEgKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMgfCAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9od2NhcC5oCj4gaW5kZXggM2Q2ZTcwNmZjNWIyLi5iNGVkZGNiNTc4NDIgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9od2NhcC5oCj4gQEAgLTEwMiw2ICsxMDIsNyBAQAo+ICAjZGVmaW5lIFJJU0NW
X0lTQV9FWFRfU1ZBRFUJCTkzCj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TU0NTUklORAkJOTQK
PiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NNQ1NSSU5ECQk5NQo+ICsjZGVmaW5lIFJJU0NWX0lT
QV9FWFRfU01DTlRSUE1GICAgICAgICAgOTYKPiAgCj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9Y
TElOVVhFTlZDRkcJMTI3Cj4gIAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVm
ZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBpbmRleCBjNmRhODFh
YTQ4YWEuLjhmMjI1YzljMzA1NSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVm
ZWF0dXJlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBAQCAtMzkw
LDYgKzM5MCw3IEBAIGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4
dFtdID0gewo+ICAJX19SSVNDVl9JU0FfRVhUX0JVTkRMRSh6dmtzZywgcmlzY3ZfenZrc2dfYnVu
ZGxlZF9leHRzKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a3QsIFJJU0NWX0lTQV9FWFRf
WlZLVCksCj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzbWFpYSwgUklTQ1ZfSVNBX0VYVF9TTUFJ
QSksCj4gKwlfX1JJU0NWX0lTQV9FWFRfREFUQShzbWNudHJwbWYsIFJJU0NWX0lTQV9FWFRfU01D
TlRSUE1GKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtY3NyaW5kLCBSSVNDVl9JU0FfRVhU
X1NNQ1NSSU5EKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtbXBtLCBSSVNDVl9JU0FfRVhU
X1NNTVBNKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVChzbW5wbSwgUklTQ1ZfSVNBX0VY
VF9TTU5QTSwgcmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHMpLAo+IAoKTG9va3MgZ29vZCB0byBtZS4K
ClJldmlld2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+CgpUaGFu
a3MsCgpDbMOpbWVudAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
