Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE68C0219B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 08:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQGJ3qh4Us8PIwE1mMWqCVDGPgghWStHh9DhZK3Or7U=; b=0MIYcsKUQ8y1YY
	Stc0rLAXzIVr/lXxKesSr7miyvtNu6Xtgig9nt8e8Zl8Z4HFZxQDuYraTdTmSa1y+7iTDVJB2qbcp
	Y1tnpGZDVZ+yCKGoULcJQ46g5Beu1DcUPN9Jaid7dPzvVF+42qSHiqG8jPcmg6trWK3KYXYwGMCjC
	jbWXMZzaIXKTBG4T5FUevMA7WEHYrEoGr8+74Fb1rrd4cHMcej4lvV6a1jDcszTNqGe41c/5bGQ+N
	H8P3paSRhYht7lPlqeMG3a5x39uJ2tZPlo94cVbDnhG748Odb1dHEWy4lqO/sj9sOtRtLcjlaH2tH
	G69XHv5IOm26c/syJYDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJUv-00000008mAD-1bMJ;
	Fri, 07 Feb 2025 08:14:01 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJUu-00000008m8w-032Q
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 08:14:01 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so11448205e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 00:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738916038; x=1739520838; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ffr0OMCgv5rw2MLpHSX7E1qg3OY60t4awxWCHQtHUac=;
        b=guaslo/auxQyaNOWSGQtg9fVtVAy6kFjVvZdk/XyEjCmy2FK6RUnKZKiMOHU5H1y49
         I4GWmlMTLKeNkHJd0iqPXa5QF247jH8AmtJmXEQPZ9aLIVMWZUDuijF1UwXr2mv0ggtO
         SFYEapCHSsBxMywHvPVg2EMchVz6xcpre0B0WDFYoQ4dIM2Br7VkLlNmVDT1V2Dw+vYc
         23UjPPvzet404WwZC277/HH8xV0R72tZm4JnUnQbuVCbnlw5RS+nPu5488NQ8qEDi8Jb
         cLl/6BQCZ9DyxgshpD12UUeOQBRzYkknd4mASbI3Bqnt4Ypxsj02DpMTAS51dJG4GpHD
         iTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738916038; x=1739520838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ffr0OMCgv5rw2MLpHSX7E1qg3OY60t4awxWCHQtHUac=;
        b=kCYR4/0HkClf0PRG9cUGTnCy1gJRTznaxHNQtOtjBNPA5tpub7MKuBlSwj4/nM3MCL
         31eb8I5xuqmDDWkSVTasjWNxCY7R2RSofUWtBrAixQ82ZLXW3/Q6fCx+XjtEbhceYry4
         wj/BTZ0LWbVKjo6Bgi/huWoO/f0tF1YZOa0nCYEPho91Z1Ml4xu4sVJPh4zKZtpsQI0h
         S+DTc1t197dHGh8cnCup97vtfyCb6LU4WJSe2dHPm7qJaAUkUvNzAkbFfHDsKLZjzBZz
         SMIDV3gxG+Dq8mQSDIXgSpAHD5DOJQaz0gezkuymyBjLtK/AUZ3JNYoORKlUtLaO+4xL
         qCEA==
X-Gm-Message-State: AOJu0YzmkNvJPSsS4jaMeXU4XuD4FgG6nXCxW5hh6c3CcgHsaJO5ACPI
	P5lTpNaF09FBzp5qQpfT2faV14KIzzhB6vkjOkuTXjfLtwbJ582TNgvF+AdQGTw=
X-Gm-Gg: ASbGncvXjXQurQSt4CxbBmMEU4TjJ5UOJeLySlOK34NOiL+GZHbUUIRawhDp2N+pkNj
	t9oez7TiKzSxa15ZR80rLnAp2BuqXdc0g7PRYrgpjDf7ccAKg38EaOG74M9hXNUQzWK1X5DMP0Q
	XtxllzrI7atiXG6Glqruw02ZfAXR54dTbBD/G8damMjazTN9qQUBdedBWn5v6WDXFTen0Cn6lPN
	dHNGnYPR0g6CoR5slj1NRvtCKjKI46MJ8zEs2V43mqVvy567mLGHh4f+mHlxuIgG3gm29GP4tbs
	2zhaTvXhehajMhIYXH8RlWZWAuV3UVRyDnbN/xfiEcpeOqUCqEPPDyk5Fvzu
X-Google-Smtp-Source: AGHT+IEGr/YRTYNXaAzVLspq4nx30yqY6bs6EtU6OBmGn64/zPMRjPnpKtSGL4mxDnpbYdH0c6ehyw==
X-Received: by 2002:a05:600c:35c5:b0:438:e231:d35e with SMTP id 5b1f17b1804b1-439248b6ebamr20948965e9.0.1738916038069;
        Fri, 07 Feb 2025 00:13:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm3167994f8f.6.2025.02.07.00.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 00:13:57 -0800 (PST)
Message-ID: <d03581a9-495d-47df-99f2-96065b06ee8f@rivosinc.com>
Date: Fri, 7 Feb 2025 09:13:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/21] RISC-V: Add Ssccfg ISA extension definition and
 parsing
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
 <20250205-counter_delegation-v4-9-835cfa88e3b1@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-9-835cfa88e3b1@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_001400_046377_AAB84E24 
X-CRM114-Status: GOOD (  14.88  )
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

CgpPbiAwNi8wMi8yMDI1IDA4OjIzLCBBdGlzaCBQYXRyYSB3cm90ZToKPiBTc2NjZmcgKOKAmFNz
4oCZIGZvciBQcml2aWxlZ2VkIGFyY2hpdGVjdHVyZSBhbmQgU3VwZXJ2aXNvci1sZXZlbAo+IGV4
dGVuc2lvbiwg4oCYY2NmZ+KAmSBmb3IgQ291bnRlciBDb25maWd1cmF0aW9uKSBwcm92aWRlcyBh
Y2Nlc3MgdG8KPiBkZWxlZ2F0ZWQgY291bnRlcnMgYW5kIG5ldyBzdXBlcnZpc29yLWxldmVsIHN0
YXRlLgo+IAo+IFRoaXMgcGF0Y2gganVzdCBlbmFibGVzIHRoZSBkZWZpbml0aW9ucyBhbmQgZW5h
YmxlIHBhcnNpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZv
c2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8IDIgKysK
PiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMiArKwo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiBpbmRleCBiNGVk
ZGNiNTc4NDIuLmZhNWUwMWJjYjk5MCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2h3Y2FwLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiBAQCAt
MTAzLDYgKzEwMyw4IEBACj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TU0NTUklORAkJOTQKPiAg
I2RlZmluZSBSSVNDVl9JU0FfRVhUX1NNQ1NSSU5ECQk5NQo+ICAjZGVmaW5lIFJJU0NWX0lTQV9F
WFRfU01DTlRSUE1GICAgICAgICAgOTYKPiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NTQ0NGRyAg
ICAgICAgICAgIDk3Cj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TTUNERUxFRyAgICAgICAgICA5
OAo+ICAKPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1hMSU5VWEVOVkNGRwkxMjcKPiAgCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL2NwdWZlYXR1cmUuYwo+IGluZGV4IDhmMjI1YzljMzA1NS4uM2NiMjA4ZDQ5MTNlIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ICsrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+IEBAIC0zOTAsMTIgKzM5MCwxNCBAQCBjb25zdCBzdHJ1
Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKPiAgCV9fUklTQ1ZfSVNB
X0VYVF9CVU5ETEUoenZrc2csIHJpc2N2X3p2a3NnX2J1bmRsZWRfZXh0cyksCj4gIAlfX1JJU0NW
X0lTQV9FWFRfREFUQSh6dmt0LCBSSVNDVl9JU0FfRVhUX1pWS1QpLAo+ICAJX19SSVNDVl9JU0Ff
RVhUX0RBVEEoc21haWEsIFJJU0NWX0lTQV9FWFRfU01BSUEpLAo+ICsJX19SSVNDVl9JU0FfRVhU
X0RBVEEoc21jZGVsZWcsIFJJU0NWX0lTQV9FWFRfU01DREVMRUcpLAoKSGkgQXRpc2gsCgpiYXNl
ZCBvbiB5b3VyIGR0LWJpbmRpbmcgY29tbWl0LCBpZiBzbWNkZWxlZyBkZXBlbmRzIG9uIFNzY3Ny
aW5kLCBaaWhwbSwKWmljbnRyLCB0aGVuIHlvdSBjb3VsZCBhZGQgYSB2YWxpZGF0aW9uIGNhbGxi
YWNrIGhlcmU6CgpzdGF0aWMgaW50IHJpc2N2X3NtY2RlbGVnX3ZhbGlkYXRlKGNvbnN0IHN0cnVj
dCByaXNjdl9pc2FfZXh0X2RhdGEKKmRhdGEsIGNvbnN0IHVuc2lnbmVkIGxvbmcgKmlzYV9iaXRt
YXApCnsKCWlmIChfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYV9iaXRtYXAsIFJJ
U0NWX0lTQV9FWFRfU1NDU1JJTkQpICYmCgkgICAgX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWls
YWJsZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX1pJSFBNKSAmJgoJICAgIF9fcmlzY3ZfaXNh
X2V4dGVuc2lvbl9hdmFpbGFibGUoaXNhX2JpdG1hcCwgUklTQ1ZfSVNBX0VYVF9aSUNOVFIpKQoJ
CXJldHVybiAwOwoKCXJldHVybiAtRVBST0JFX0RFRkVSOwp9CgpfX1JJU0NWX0lTQV9FWFRfREFU
QV9WQUxJREFURShzbWNkZWxlZywgUklTQ1ZfSVNBX0VYVF9TTUNERUxFRywKcmlzY3Zfc21jZGVs
ZWdfdmFsaWRhdGUpLAoKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtY250cnBtZiwgUklTQ1Zf
SVNBX0VYVF9TTUNOVFJQTUYpLAo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc21jc3JpbmQsIFJJ
U0NWX0lTQV9FWFRfU01DU1JJTkQpLAo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc21tcG0sIFJJ
U0NWX0lTQV9FWFRfU01NUE0pLAo+ICAJX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKHNtbnBtLCBS
SVNDVl9JU0FfRVhUX1NNTlBNLCByaXNjdl94bGludXhlbnZjZmdfZXh0cyksCj4gIAlfX1JJU0NW
X0lTQV9FWFRfREFUQShzbXN0YXRlZW4sIFJJU0NWX0lTQV9FWFRfU01TVEFURUVOKSwKPiAgCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHNzYWlhLCBSSVNDVl9JU0FfRVhUX1NTQUlBKSwKPiArCV9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHNzY2NmZywgUklTQ1ZfSVNBX0VYVF9TU0NDRkcpLAoKRGl0dG8gZm9y
IHRoaXMgb25lIHdpdGggU21jZGVsZWcsIFNzY3NyaW5kLCBaaWhwbSwgWmljbnRyLCBTc2NvZnBt
ZiwKU21jbnRycG1mLgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gIAlfX1JJU0NWX0lTQV9FWFRfREFU
QShzc2NvZnBtZiwgUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRiksCj4gIAlfX1JJU0NWX0lTQV9FWFRf
REFUQShzc2NzcmluZCwgUklTQ1ZfSVNBX0VYVF9TU0NTUklORCksCj4gIAlfX1JJU0NWX0lTQV9F
WFRfU1VQRVJTRVQoc3NucG0sIFJJU0NWX0lTQV9FWFRfU1NOUE0sIHJpc2N2X3hsaW51eGVudmNm
Z19leHRzKSwKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
