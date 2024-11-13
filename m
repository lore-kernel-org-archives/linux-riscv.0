Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2611DD41C2C
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 10:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7BYkHcm/LUvzTa0V+GsEjDNcfb3/jrrUU84eq2CZ54Q=; b=VcO8AoYKS0XoqW
	AlOOZGyLNPIf2p8ZV6WFtpTRs8aoxUE3TWqdZ2Ne6nTkGmG5eMMO+RVfWyJlG7dUmhrlIzcIWtbMo
	tA9vGnSQhgOYPAJExF7Tq5+7hjHMyuWTnv+cj6NMInkBQ8ZvTN4B8FacAjdflqHiRSYRF9rucrSq8
	EZx4a356tBiifzYnkNrfituvcdEtrFDot+kd6/HwVQyUPNEVoUMNHLKXAN2eHc89HezdVZsoQFolm
	X/RBhPmF3bWvmBtAYUycZ8vTf6bYRA9qvxWq9rOFLTlSbnB9fUEE0W3MLctELuVAMRIF5xAQzs8nz
	JTHEUIUeCK4p2ulx5s3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBABD-00000006MTg-2nUz;
	Wed, 13 Nov 2024 10:00:55 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAAz-00000006MQq-1Hys
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 10:00:53 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a9ec86a67feso1157992766b.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 02:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731492039; x=1732096839; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MW7KPVnVNr5FD5G+DQH0BUzbgVMNYEdIujB7YLFl0RE=;
        b=vPBGqDhRHndelIxohDrmQUKI0eBLna/kRqJNmQYHw6SDzIXcyfr72EuMkeYTxwCCHW
         6fHN3HtuYHvuFwzbddmBhRB18kzmkbwIw3hk+4laizgqnUzO3JRCYZ72g02rAcQT86au
         15HKJtXZH3WIX3yGHG7pfxFRShpIhAgvVUHEoUrt0BcO3XcYV+qBRhdvfRBhaIEGU7O+
         zvaDSRmuzMH/EJOmk7K1Z24blQqwXJLDP8XukmMjZakRRIf9UKwB2qDGH4HvwlhzbxWb
         D1WzGHUQefEDJwQVMmfmKk4Knxn4Ra/bgyCr3QJMa7EbAMVZybqfC1JfzPDCP/DeiU8O
         2GcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731492039; x=1732096839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MW7KPVnVNr5FD5G+DQH0BUzbgVMNYEdIujB7YLFl0RE=;
        b=dtsBYlr31IziwEs0zCI1ZWr7/LPOq468PwL2sG+ExQnuI5kFZQMmRW6gWSojEJ9pXf
         vtMnXTvsB1TbsQsiLHERFROg49xmnlEx4scsZRn+6jPdHniEE4znYXu9lX5stM2w/s8+
         R9VSU6XhhienG5FB7xqr1ssC/qVctL2L+0IXox54da34at0e+XDJKgx+Y3sZHyfIuTJM
         W3wfIIdQf4t+3gHwzwkfOk0imIHL8Uf/6hGt6kUQ5Sva6bK1kg9rIPNkEkhbLpUB0VyV
         gRhumZPPqBFZuviOt6I/ZkE1zZE/5mQJAAYZoA7EiU/w0JYErjApeMrxJvqdMJ6UCKln
         B6VA==
X-Forwarded-Encrypted: i=1; AJvYcCWZFWTF7U75dx+6vKqHPFx7F7a+jezUGbGE1XPUA69UWLMXWF9KMtFX5mdNjTHe5KAS3QnVp418W9wttQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsRq7AcS/+qfEb1eVQ4y131wkxeNP2SwK7FBpSBo25/4OZlaHS
	uv6EQaxzrgp6qU0lDwSFDTlOo70xxt9Gz7lsEx38FXSpFAmhMSLjFr4Bzq5C4yY=
X-Google-Smtp-Source: AGHT+IHv9nZHtlDz14UBGAVIklvxBfY2kCgIEnK88nypjRiMHPCpE4YZloV915vQIZ4YH2V9q3fBNw==
X-Received: by 2002:a17:906:c007:b0:aa1:f73b:be43 with SMTP id a640c23a62f3a-aa1f73bbf94mr176807366b.32.1731492039416;
        Wed, 13 Nov 2024 02:00:39 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0e2e41bsm842658666b.191.2024.11.13.02.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 02:00:38 -0800 (PST)
Message-ID: <f762f404-626a-430f-b307-33c9da756ac3@linaro.org>
Date: Wed, 13 Nov 2024 10:00:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] perf record: Skip don't fail for events that don't
 open
To: Ian Rogers <irogers@google.com>, Leo Yan <leo.yan@arm.com>
Cc: Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org,
 beeman@rivosinc.com, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kan Liang <kan.liang@linux.intel.com>, Ze Gao <zegao2021@gmail.com>,
 Weilin Wang <weilin.wang@intel.com>, Ben Gainey <ben.gainey@arm.com>,
 Dominique Martinet <asmadeus@codewreck.org>, Junhao He
 <hejunhao3@huawei.com>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241026121758.143259-1-irogers@google.com>
 <20241026121758.143259-4-irogers@google.com>
 <20241112195343.GA404636@e132581.arm.com>
 <CAP-5=fXuyZbn3Jiq=RQaLTqybgji50Ko8jrpsinFqo+OOPBeRw@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fXuyZbn3Jiq=RQaLTqybgji50Ko8jrpsinFqo+OOPBeRw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_020041_441968_C6DC0FCC 
X-CRM114-Status: GOOD (  16.22  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAxMi8xMS8yMDI0IDEwOjI0IHBtLCBJYW4gUm9nZXJzIHdyb3RlOgo+IE9uIFR1ZSwgTm92
IDEyLCAyMDI0IGF0IDExOjUz4oCvQU0gTGVvIFlhbiA8bGVvLnlhbkBhcm0uY29tPiB3cm90ZToK
Pj4KPj4gT24gU2F0LCBPY3QgMjYsIDIwMjQgYXQgMDU6MTc6NTdBTSAtMDcwMCwgSWFuIFJvZ2Vy
cyB3cm90ZToKPj4+Cj4+PiBXaGlsc3QgZm9yIG1hbnkgdG9vbHMgaXQgaXMgYW4gZXhwZWN0ZWQg
YmVoYXZpb3IgdGhhdCBmYWlsdXJlIHRvIG9wZW4KPj4+IGEgcGVyZiBldmVudCBpcyBhIGZhaWx1
cmUsIEFSTSBkZWNpZGVkIHRvIG5hbWUgUE1VIGV2ZW50cyB0aGUgc2FtZSBhcwo+Pj4gbGVnYWN5
IGV2ZW50cyBhbmQgdGhlbiBmYWlsZWQgdG8gcmVuYW1lIHN1Y2ggZXZlbnRzIG9uIGEgc2VydmVy
IHVuY29yZQo+Pj4gU0xDIFBNVS4gQXMgcGVyZidzIGRlZmF1bHQgYmVoYXZpb3Igd2hlbiBubyBQ
TVUgaXMgc3BlY2lmaWVkIGlzIHRvCj4+PiBvcGVuIHRoZSBldmVudCBvbiBhbGwgUE1VcyB0aGF0
IGFkdmVydGlzZS8iaGF2ZSIgdGhlIGV2ZW50LCB0aGlzCj4+PiB5aWVsZGVkIGZhaWx1cmVzIHdo
ZW4gdHJ5aW5nIHRvIG1ha2UgdGhlIHByaW9yaXR5IG9mIGxlZ2FjeSBhbmQKPj4+IHN5c2ZzL2pz
b24gZXZlbnRzIHVuaWZvcm0gLSBzb21ldGhpbmcgcmVxdWVzdGVkIGJ5IFJJU0MtViBhbmQgQVJN
LiBBCj4+PiBsZWdhY3kgZXZlbnQgdXNlciBvbiBBUk0gaGFyZHdhcmUgbWF5IGZpbmQgdGhlaXIg
ZXZlbnQgb3BlbmVkIG9uIGFuCj4+PiB1bmNvcmUgUE1VIHdoaWNoIGZvciBwZXJmIHJlY29yZCB3
aWxsIGZhaWwuIEFybmFsZG8gc3VnZ2VzdGVkIHNraXBwaW5nCj4+PiBzdWNoIGV2ZW50cyB3aGlj
aCB0aGlzIHBhdGNoIGltcGxlbWVudHMuIFJhdGhlciB0aGFuIGhhdmUgdGhlIHNraXBwaW5nCj4+
PiBjb25kaXRpb25hbCBvbiBydW5uaW5nIG9uIEFSTSwgdGhlIHNraXBwaW5nIGlzIGRvbmUgb24g
YWxsCj4+PiBhcmNoaXRlY3R1cmVzIGFzIHN1Y2ggYSBmdW5kYW1lbnRhbCBiZWhhdmlvcmFsIGRp
ZmZlcmVuY2UgY291bGQgbGVhZAo+Pj4gdG8gcHJvYmxlbXMgd2l0aCB0b29scyBidWlsdC9kZXBl
bmRpbmcgb24gcGVyZi4KPj4+Cj4+PiBBbiBleGFtcGxlIG9mIHBlcmYgcmVjb3JkIGZhaWxpbmcg
dG8gb3BlbiBldmVudHMgb24geDg2IGlzOgo+Pj4gYGBgCj4+PiAkIHBlcmYgcmVjb3JkIC1lIGRh
dGFfcmVhZCxjeWNsZXMsTExDLXByZWZldGNoLXJlYWQgLWEgc2xlZXAgMC4xCj4+PiBFcnJvcjoK
Pj4+IEZhaWx1cmUgdG8gb3BlbiBldmVudCAnZGF0YV9yZWFkJyBvbiBQTVUgJ3VuY29yZV9pbWNf
ZnJlZV9ydW5uaW5nXzAnIHdoaWNoIHdpbGwgYmUgcmVtb3ZlZC4KPj4+IFRoZSBzeXNfcGVyZl9l
dmVudF9vcGVuKCkgc3lzY2FsbCByZXR1cm5lZCB3aXRoIDIyIChJbnZhbGlkIGFyZ3VtZW50KSBm
b3IgZXZlbnQgKGRhdGFfcmVhZCkuCj4+PiAiZG1lc2cgfCBncmVwIC1pIHBlcmYiIG1heSBwcm92
aWRlIGFkZGl0aW9uYWwgaW5mb3JtYXRpb24uCj4+Pgo+Pj4gRXJyb3I6Cj4+PiBGYWlsdXJlIHRv
IG9wZW4gZXZlbnQgJ2RhdGFfcmVhZCcgb24gUE1VICd1bmNvcmVfaW1jX2ZyZWVfcnVubmluZ18x
JyB3aGljaCB3aWxsIGJlIHJlbW92ZWQuCj4+PiBUaGUgc3lzX3BlcmZfZXZlbnRfb3BlbigpIHN5
c2NhbGwgcmV0dXJuZWQgd2l0aCAyMiAoSW52YWxpZCBhcmd1bWVudCkgZm9yIGV2ZW50IChkYXRh
X3JlYWQpLgo+Pj4gImRtZXNnIHwgZ3JlcCAtaSBwZXJmIiBtYXkgcHJvdmlkZSBhZGRpdGlvbmFs
IGluZm9ybWF0aW9uLgo+Pj4KPj4+IEVycm9yOgo+Pj4gRmFpbHVyZSB0byBvcGVuIGV2ZW50ICdM
TEMtcHJlZmV0Y2gtcmVhZCcgb24gUE1VICdjcHUnIHdoaWNoIHdpbGwgYmUgcmVtb3ZlZC4KPj4+
IFRoZSBMTEMtcHJlZmV0Y2gtcmVhZCBldmVudCBpcyBub3Qgc3VwcG9ydGVkLgo+Pj4gWyBwZXJm
IHJlY29yZDogV29rZW4gdXAgMSB0aW1lcyB0byB3cml0ZSBkYXRhIF0KPj4+IFsgcGVyZiByZWNv
cmQ6IENhcHR1cmVkIGFuZCB3cm90ZSAyLjE4OCBNQiBwZXJmLmRhdGEgKDg3IHNhbXBsZXMpIF0K
Pj4+Cj4+PiAkIHBlcmYgcmVwb3J0IC0tc3RhdHMKPj4+IEFnZ3JlZ2F0ZWQgc3RhdHM6Cj4+PiAg
ICAgICAgICAgICAgICAgVE9UQUwgZXZlbnRzOiAgICAgIDE3MjU1Cj4+PiAgICAgICAgICAgICAg
ICAgIE1NQVAgZXZlbnRzOiAgICAgICAgMjg0ICAoIDEuNiUpCj4+PiAgICAgICAgICAgICAgICAg
IENPTU0gZXZlbnRzOiAgICAgICAxOTYxICAoMTEuNCUpCj4+PiAgICAgICAgICAgICAgICAgIEVY
SVQgZXZlbnRzOiAgICAgICAgICAxICAoIDAuMCUpCj4+PiAgICAgICAgICAgICAgICAgIEZPUksg
ZXZlbnRzOiAgICAgICAxOTYwICAoMTEuNCUpCj4+PiAgICAgICAgICAgICAgICBTQU1QTEUgZXZl
bnRzOiAgICAgICAgIDg3ICAoIDAuNSUpCj4+PiAgICAgICAgICAgICAgICAgTU1BUDIgZXZlbnRz
OiAgICAgIDEyODM2ICAoNzQuNCUpCj4+PiAgICAgICAgICAgICAgIEtTWU1CT0wgZXZlbnRzOiAg
ICAgICAgIDgzICAoIDAuNSUpCj4+PiAgICAgICAgICAgICBCUEZfRVZFTlQgZXZlbnRzOiAgICAg
ICAgIDM2ICAoIDAuMiUpCj4+PiAgICAgICAgRklOSVNIRURfUk9VTkQgZXZlbnRzOiAgICAgICAg
ICAyICAoIDAuMCUpCj4+PiAgICAgICAgICAgICAgSURfSU5ERVggZXZlbnRzOiAgICAgICAgICAx
ICAoIDAuMCUpCj4+PiAgICAgICAgICAgIFRIUkVBRF9NQVAgZXZlbnRzOiAgICAgICAgICAxICAo
IDAuMCUpCj4+PiAgICAgICAgICAgICAgIENQVV9NQVAgZXZlbnRzOiAgICAgICAgICAxICAoIDAu
MCUpCj4+PiAgICAgICAgICAgICBUSU1FX0NPTlYgZXZlbnRzOiAgICAgICAgICAxICAoIDAuMCUp
Cj4+PiAgICAgICAgIEZJTklTSEVEX0lOSVQgZXZlbnRzOiAgICAgICAgICAxICAoIDAuMCUpCj4+
PiBjeWNsZXMgc3RhdHM6Cj4+PiAgICAgICAgICAgICAgICBTQU1QTEUgZXZlbnRzOiAgICAgICAg
IDg3Cj4+PiBgYGAKPj4KPj4gVGhhbmtzIGZvciBKYW1lcyByZW1pbmRpbmcgbWUuICBUZXN0ZWQg
b24gQVZBIHBsYXRmb3JtOgo+Pgo+PiAjIHRyZWUgL3N5cy9idXMvZXZlbnRfc291cmNlL2Rldmlj
ZXMvYXJtX2RzdV8qL2V2ZW50cwo+PiAgICAuLi4KPj4gICAgL3N5cy9idXMvZXZlbnRfc291cmNl
L2RldmljZXMvYXJtX2RzdV85L2V2ZW50cwo+PiAgICDilJzilIDilIAgYnVzX2FjY2Vzcwo+PiAg
ICDilJzilIDilIAgYnVzX2N5Y2xlcwo+PiAgICDilJzilIDilIAgY3ljbGVzCj4+ICAgIOKUnOKU
gOKUgCBsM2RfY2FjaGUKPj4gICAg4pSc4pSA4pSAIGwzZF9jYWNoZV9hbGxvY2F0ZQo+PiAgICDi
lJzilIDilIAgbDNkX2NhY2hlX3JlZmlsbAo+PiAgICDilJzilIDilIAgbDNkX2NhY2hlX3diCj4+
ICAgIOKUlOKUgOKUgCBtZW1vcnlfZXJyb3IKPj4KPj4gIyAuL3BlcmYgcmVjb3JkIC0tIHNsZWVw
IDAuMQo+PiAgIEVycm9yOgo+PiAgIEZhaWx1cmUgdG8gb3BlbiBldmVudCAnY3ljbGVzOlBIJyBv
biBQTVUgJ2FybV9kc3VfMCcgd2hpY2ggd2lsbCBiZQo+PiAgIHJlbW92ZWQuCj4+ICAgY3ljbGVz
OlBIOiBQTVUgSGFyZHdhcmUgZG9lc24ndCBzdXBwb3J0IHNhbXBsaW5nL292ZXJmbG93LWludGVy
cnVwdHMuCj4+ICAgVHJ5ICdwZXJmIHN0YXQnCj4+ICAgRXJyb3I6Cj4+ICAgRmFpbHVyZSB0byBv
cGVuIGV2ZW50ICdjeWNsZXM6UEgnIG9uIFBNVSAnYXJtX2RzdV8xJyB3aGljaCB3aWxsIGJlCj4+
ICAgcmVtb3ZlZC4KPj4gICBjeWNsZXM6UEg6IFBNVSBIYXJkd2FyZSBkb2Vzbid0IHN1cHBvcnQg
c2FtcGxpbmcvb3ZlcmZsb3ctaW50ZXJydXB0cy4KPj4gICBUcnkgJ3BlcmYgc3RhdCcKPj4gICAu
Li4KPj4gICBFcnJvcjoKPj4gICBGYWlsdXJlIHRvIG9wZW4gZXZlbnQgJ2N5Y2xlczpQSCcgb24g
UE1VICdhcm1fZHN1XzE1JyB3aGljaCB3aWxsIGJlCj4+ICAgcmVtb3ZlZC4KPj4gICBjeWNsZXM6
UEg6IFBNVSBIYXJkd2FyZSBkb2Vzbid0IHN1cHBvcnQgc2FtcGxpbmcvb3ZlcmZsb3ctaW50ZXJy
dXB0cy4KPj4gICBUcnkgJ3BlcmYgc3RhdCcKPj4gICBbIHBlcmYgcmVjb3JkOiBXb2tlbiB1cCAx
IHRpbWVzIHRvIHdyaXRlIGRhdGEgXQo+PiAgIFsgcGVyZiByZWNvcmQ6IENhcHR1cmVkIGFuZCB3
cm90ZSAwLjAwOCBNQiBwZXJmLmRhdGEgKDggc2FtcGxlcykgXQo+Pgo+PiAjIC4vcGVyZiByZXBv
cnQgLS1zdGF0cwo+Pgo+PiAgIEFnZ3JlZ2F0ZWQgc3RhdHM6Cj4+ICAgICAgICAgICAgICAgICAg
VE9UQUwgZXZlbnRzOiAgICAgICAgIDY3Cj4+ICAgICAgICAgICAgICAgICAgIE1NQVAgZXZlbnRz
OiAgICAgICAgIDQwICAoNTkuNyUpCj4+ICAgICAgICAgICAgICAgICAgIENPTU0gZXZlbnRzOiAg
ICAgICAgICAxICAoIDEuNSUpCj4+ICAgICAgICAgICAgICAgICBTQU1QTEUgZXZlbnRzOiAgICAg
ICAgICA4ICAoMTEuOSUpCj4+ICAgICAgICAgICAgICAgIEtTWU1CT0wgZXZlbnRzOiAgICAgICAg
ICA2ICAoIDkuMCUpCj4+ICAgICAgICAgICAgICBCUEZfRVZFTlQgZXZlbnRzOiAgICAgICAgICA2
ICAoIDkuMCUpCj4+ICAgICAgICAgRklOSVNIRURfUk9VTkQgZXZlbnRzOiAgICAgICAgICAxICAo
IDEuNSUpCj4+ICAgICAgICAgICAgICAgSURfSU5ERVggZXZlbnRzOiAgICAgICAgICAxICAoIDEu
NSUpCj4+ICAgICAgICAgICAgIFRIUkVBRF9NQVAgZXZlbnRzOiAgICAgICAgICAxICAoIDEuNSUp
Cj4+ICAgICAgICAgICAgICAgIENQVV9NQVAgZXZlbnRzOiAgICAgICAgICAxICAoIDEuNSUpCj4+
ICAgICAgICAgICAgICBUSU1FX0NPTlYgZXZlbnRzOiAgICAgICAgICAxICAoIDEuNSUpCj4+ICAg
ICAgICAgIEZJTklTSEVEX0lOSVQgZXZlbnRzOiAgICAgICAgICAxICAoIDEuNSUpCj4+ICAgY3lj
bGVzOlAgc3RhdHM6Cj4+ICAgICAgICAgICAgICAgICBTQU1QTEUgZXZlbnRzOiAgICAgICAgICA4
Cj4+Cj4+ICMgLi9wZXJmIHN0YXQgLS0gc2xlZXAgMC4xCj4+Cj4+ICAgUGVyZm9ybWFuY2UgY291
bnRlciBzdGF0cyBmb3IgJ3NsZWVwIDAuMSc6Cj4+Cj4+ICAgICAgICAgICAgICAgIDAuODcgbXNl
YyB0YXNrLWNsb2NrICAgICAgICAgICAgICAgICAgICAgICAjICAgIDAuMDA5IENQVXMgdXRpbGl6
ZWQKPj4gICAgICAgICAgICAgICAgICAgMSAgICAgIGNvbnRleHQtc3dpdGNoZXMgICAgICAgICAg
ICAgICAgICMgICAgMS4xNDggSy9zZWMKPj4gICAgICAgICAgICAgICAgICAgMCAgICAgIGNwdS1t
aWdyYXRpb25zICAgICAgICAgICAgICAgICAgICMgICAgMC4wMDAgL3NlYwo+PiAgICAgICAgICAg
ICAgICAgIDUyICAgICAgcGFnZS1mYXVsdHMgICAgICAgICAgICAgICAgICAgICAgIyAgIDU5LjY4
NSBLL3NlYwo+PiAgICAgICAgICAgICA4NzcsODM1ICAgICAgaW5zdHJ1Y3Rpb25zICAgICAgICAg
ICAgICAgICAgICAgIyAgICAxLjE0ICBpbnNuIHBlciBjeWNsZQo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjICAgIDAuMjUgIHN0YWxsZWQgY3lj
bGVzIHBlciBpbnNuCj4+ICAgICAgICAgICAgIDc3MiwxMDIgICAgICBjeWNsZXMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAjICA4ODYuMjEwIE0vc2VjCj4+ICAgICAgICAgICAgIDE5MSw5MTQg
ICAgICBzdGFsbGVkLWN5Y2xlcy1mcm9udGVuZCAgICAgICAgICAjICAgMjQuODYlIGZyb250ZW5k
IGN5Y2xlcyBpZGxlCj4+ICAgICAgICAgICAgIDIxOSwxODMgICAgICBzdGFsbGVkLWN5Y2xlcy1i
YWNrZW5kICAgICAgICAgICAjICAgMjguMzklIGJhY2tlbmQgY3ljbGVzIGlkbGUKPj4gICAgICAg
ICAgICAgMTg0LDA5OSAgICAgIGJyYW5jaGVzICAgICAgICAgICAgICAgICAgICAgICAgICMgIDIx
MS4zMDcgTS9zZWMKPj4gICAgICAgICAgICAgICA4LDU0OCAgICAgIGJyYW5jaC1taXNzZXMgICAg
ICAgICAgICAgICAgICAgICMgICAgNC42NCUgb2YgYWxsIGJyYW5jaGVzCj4+Cj4+ICAgICAgICAg
MC4xMDE2MjM1Mjkgc2Vjb25kcyB0aW1lIGVsYXBzZWQKPj4KPj4gICAgICAgICAwLjAwMTY0NTAw
MCBzZWNvbmRzIHVzZXIKPj4gICAgICAgICAwLjAwMDAwMDAwMCBzZWNvbmRzIHN5cwo+Pgo+PiBU
ZXN0ZWQtYnk6IExlbyBZYW4gPGxlby55YW5AYXJtLmNvbT4KPiAKPiBUaGFua3MgTGVvISBBcyB0
aGUgVGVzdGVkLWJ5IG1ha2VzIHNlbnNlIG9ubHkgaWYgeW91J3ZlIGFwcGxpZWQgYWxsIDQKPiBw
YXRjaGVzLCB3aGljaCB5b3VyIHRlc3RpbmcgYW5kIEphbWVzJyB0ZXN0aW5nIHNob3dzIHlvdSd2
ZSBib3RoIGRvbmUsCj4gSSdsbCBhZGQgdGhlIHRhZ3MgdG8gYWxsIDQgcGF0Y2hlcy4gSSdsbCBk
byBsaWtld2lzZSB3aXRoIEF0aXNoLAo+IHJlYmFzZSBhbmQgcmVzZW5kIHRoZSBwYXRjaGVzLgo+
IAo+IFRoYW5rcywKPiBJYW4KClllcCBtYWtlcyBzZW5zZQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
