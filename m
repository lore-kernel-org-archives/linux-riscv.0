Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A5ECCD18E
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 09:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k18qUBs11PHUSR8lStzBHFcFBIt7O/iWxlcK7hqKuu0=; b=wBWV9KVG2DbN98mMVCsV6qNN3c
	KYEP7L+OtFN/Aun9sk3sOcmMKpUknRFyo54xtyL24xYb2gd7UPTTykPVCCbIbxm6IIp2BmebSwEKJ
	xTtjcAJT2UkrkAsHAmCkrao0JPqn+vNyJcgPg7QW3sayiBzYOGEuE1qshcJBhw5WtpLYeNp9f8gWI
	CWcxiWRRyZOC0ZD+ljMPtiS5My/ex8EEghJWTH5wnYDlWFzJvGO4vhKTqnoQLUCYX2qZfG0YX9gJU
	mxGprezluU8ab+fdVekwG7dbMwXiZQY+UiGd7+rRV+XdSQcB1Ow6OJOs++W5ly5qpG/okHu5UuOEz
	YS8ude/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8atQ-0000000FhQP-2r8M;
	Tue, 14 Oct 2025 09:00:28 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8atO-0000000FhOy-3QNm
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 09:00:28 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-330b4739538so4805751a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 02:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760432426; x=1761037226; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F1TFiJXfN4H/Xgn0NClhb7Y/ZMUzFLTyPno5YMrNpTY=;
        b=b479W357pPnMMvqHxB0Z0icELWBYd/QVsxfSMOTWzs1noLycOUmG3NuW3PBMkj095w
         dkywllQMhlFsrU4xh052QYD+yp6OgDCfNcZ2hGdt0g470Dv7YhvPtZscqX8HYbNhiFvS
         RLT5gtQfZNgZVx0iBcU9pbVwoKSVLCNblMj4G9zfjMt8Ba9+E76Y8b2SeKmpYiVivays
         kQVAfaKxnQsgQythhZkXzdGM4OhfWoRMNYBrMF23fHWVEKnH6YnXd3GEIvrdl+zJRuDG
         tpZhnHmJrqZRd7l91xLkL0ttQQ5KdT8IabHNq6YKQRHFBgNoTnq+eZMKXY0pqp3/erLH
         Hq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760432426; x=1761037226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F1TFiJXfN4H/Xgn0NClhb7Y/ZMUzFLTyPno5YMrNpTY=;
        b=CdwBpcMEb7IoGzV/KccaRbU4OUDCfu/WtV50iXPg4moqVHZaF3PRSZ14ac/HVrwflC
         cV3PjuzVuVvFWjnnByGQmOIXR2E46qZVi+3soOdLm0rPTF1/nyZn6QGfaA6I/7SULDlC
         0nenXufto9aNel9gPVV4NNjijCp9diXGHWrA12ZupK6zSMk52XZeIEiLIz2kXTlJ0ntE
         6N9Xrl3SktTcdGObn5PN80qoD6RnDMKdcs1DiUYltU6nCgxdIafoG06hdcfDCGIJPGbf
         WRaULt25f49ZnbOUJFsRJvmN9fvxNOdUmHyXk9I6lbdE7eTX6KG2aYd4hxGCIl5k5odp
         rtYw==
X-Forwarded-Encrypted: i=1; AJvYcCVNr2tqWQ9xho8kH33nPd/elcmzRieJzpac5oynSumaymIgKmQ2enDbVRhz2tav2GDvzs6PSPXzraH8eg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyW4kPwAv8hRMWWwdIB50NygJqm3eOI51IAQm9+R+pee0Ur2zPx
	4Txtokmw/+zjm2svXxFuaGfStFpl00+7axHlregiAgqFgWv49Dd//pAv
X-Gm-Gg: ASbGncvwGXenCc0DEELqqKSq8ht6Q5CasMFQtGPoG69SyYStQsd476PMPGuExGR0HbB
	Gam3eix/VovDK8G0wBX0bCwT9OAT3zAWUeWgxB0jR8wthDBCf15djv3Z74s4pKiOk7EzlKO016u
	DiiZakZr2wpv/QotoQxJpbtFWOGCz4fvC6i+WXu0kiiKtExheW9/t59bJ1lqumftzpToDdKmStr
	8ITRBl0kQWoTiV/lMzXahs+NZXP2SF3bTWk/Y7FleM5oTALoB2w9nuNWWlbmqlCCGOHpAC5ehC6
	ZHczfWfpv648LETp0aT2gPkAfLsVUxqvhvWwTBKQocDUqBIedwKjmpE0L9SMGwg39OZ1j/VDDxk
	psC8lsCsmkugx619xipz8F8N6CLrjSraJJ62xap6S1v4=
X-Google-Smtp-Source: AGHT+IE0mIgWQWJZSxQ3gwmU/tn8/Wu8JthlrumZUzn60cmTN+GhgkxNyMqIgZ/XievZAUQnR5iVrw==
X-Received: by 2002:a17:90b:1b43:b0:32e:18f2:7a59 with SMTP id 98e67ed59e1d1-33b5116251cmr36222338a91.11.1760432425506;
        Tue, 14 Oct 2025 02:00:25 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aab6eesm15311175a91.15.2025.10.14.02.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 02:00:24 -0700 (PDT)
Message-ID: <a6e787e3-f332-4445-9f7a-b2ec65daf019@gmail.com>
Date: Tue, 14 Oct 2025 01:59:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] rvtrace: Add functions to start/stop tracing on a
 component path
To: Mayuresh Chitale <mchitale@ventanamicro.com>, Bo Gan <ganboing@gmail.com>
References: <20251002060732.100213-1-apatel@ventanamicro.com>
 <20251002060732.100213-5-apatel@ventanamicro.com>
 <20edc3a9-2efe-4431-b198-f00b3940777c@gmail.com>
 <CAK9=C2U+H5xZaK6g5qcytESyC9H8gkU_jEUDJanEs1qzcGgYCQ@mail.gmail.com>
 <69205060-6a47-4140-8026-6e5a50ad1512@gmail.com>
 <CAN37VV4jFyuEYw0cxU00FucgV=so5SfTon_1hdvbVuqX1QzYCQ@mail.gmail.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <CAN37VV4jFyuEYw0cxU00FucgV=so5SfTon_1hdvbVuqX1QzYCQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_020026_862224_D048D2A6 
X-CRM114-Status: GOOD (  21.38  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Atish Patra <atish.patra@linux.dev>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Liang Kan <kan.liang@linux.intel.com>, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@redhat.com>, Anup Patel <apatel@ventanamicro.com>, Greg KH <gregkh@linuxfoundation.org>, Adrian Hunter <adrian.hunter@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgTWF5dXJlc2gsCgpPbiAxMC8xNC8yNSAwMToxMCwgTWF5dXJlc2ggQ2hpdGFsZSB3cm90ZToK
PiBIaSBCbywKPiAKPiBPbiBNb24sIE9jdCAxMywgMjAyNSBhdCAxMDoyM+KAr0FNIEJvIEdhbiA8
Z2FuYm9pbmdAZ21haWwuY29tPiB3cm90ZToKPj4KPj4gT24gMTAvMTIvMjUgMjA6NDMsIEFudXAg
UGF0ZWwgd3JvdGU6Cj4+PiBPbiBXZWQsIE9jdCA4LCAyMDI1IGF0IDI6NDXigK9QTSBCbyBHYW4g
PGdhbmJvaW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+PiBPbiAxMC8xLzI1IDIzOjA3LCBB
bnVwIFBhdGVsIHdyb3RlOgo+Pj4+PiBGcm9tOiBNYXl1cmVzaCBDaGl0YWxlIDxtY2hpdGFsZUB2
ZW50YW5hbWljcm8uY29tPgo+Pj4+Pgo+Pj4+PiBUaGUgcGVyZiBkcml2ZXIgZnJhbWV3b3JrIG5l
ZWRzIHRvIGJlIGFibGUgdG8gc3RhcnQgLyBzdG9wIGFsbCBjb21wb25lbnRzCj4+Pj4+IGluIGEg
dHJhY2UgY29tcG9uZW50IHBhdGggZHVyaW5nIGl0cyBvcGVyYXRpb24uIEFkZCBydnRyYWNlX3Bh
dGhfc3RhcnQoKQo+Pj4+PiBhbmQgcnZ0cmFjZV9wYXRoX3N0b3AoKSBmdW5jdGlvbnMgZm9yIHRo
aXMgcHVycG9zZS4KPj4+Pj4KPj4+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBBbnVwIFBhdGVsIDxhcGF0
ZWxAdmVudGFuYW1pY3JvLmNvbT4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBh
dGVsQHZlbnRhbmFtaWNyby5jb20+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE1heXVyZXNoIENoaXRh
bGUgPG1jaGl0YWxlQHZlbnRhbmFtaWNyby5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiAgICAgZHJpdmVy
cy9od3RyYWNpbmcvcnZ0cmFjZS9ydnRyYWNlLWNvcmUuYyB8IDQ0ICsrKysrKysrKysrKysrKysr
KysrKysrKwo+Pj4+PiAgICAgaW5jbHVkZS9saW51eC9ydnRyYWNlLmggICAgICAgICAgICAgICAg
ICB8ICA2ICsrKysKPj4+Pj4gICAgIDIgZmlsZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKQo+
Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od3RyYWNpbmcvcnZ0cmFjZS9ydnRyYWNl
LWNvcmUuYyBiL2RyaXZlcnMvaHd0cmFjaW5nL3J2dHJhY2UvcnZ0cmFjZS1jb3JlLmMKPj4+Pj4g
aW5kZXggNzAxM2Q1MGNhNTY5Li4xMDliZTQwZDRiMjQgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2RyaXZl
cnMvaHd0cmFjaW5nL3J2dHJhY2UvcnZ0cmFjZS1jb3JlLmMKPj4+Pj4gKysrIGIvZHJpdmVycy9o
d3RyYWNpbmcvcnZ0cmFjZS9ydnRyYWNlLWNvcmUuYwo+Pj4+PiBAQCAtNjE0LDYgKzYxNCw1MCBA
QCBzdGF0aWMgdm9pZCBydnRyYWNlX3JlbGVhc2VfcGF0aF9ub2RlcyhzdHJ1Y3QgcnZ0cmFjZV9w
YXRoICpwYXRoKQo+Pj4+PiAgICAgICAgIH0KPj4+Pj4gICAgIH0KPj4+Pj4KPj4+Pj4gK2ludCBy
dnRyYWNlX3BhdGhfc3RhcnQoc3RydWN0IHJ2dHJhY2VfcGF0aCAqcGF0aCkKPj4+Pj4gK3sKPj4+
Pj4gKyAgICAgY29uc3Qgc3RydWN0IHJ2dHJhY2VfZHJpdmVyICpydGRydjsKPj4+Pj4gKyAgICAg
c3RydWN0IHJ2dHJhY2VfY29tcG9uZW50ICpjb21wOwo+Pj4+PiArICAgICBzdHJ1Y3QgcnZ0cmFj
ZV9wYXRoX25vZGUgKm5vZGU7Cj4+Pj4+ICsgICAgIGludCByZXQ7Cj4+Pj4+ICsKPj4+Pj4gKyAg
ICAgbGlzdF9mb3JfZWFjaF9lbnRyeShub2RlLCAmcGF0aC0+Y29tcF9saXN0LCBoZWFkKSB7Cj4+
Pj4+ICsgICAgICAgICAgICAgY29tcCA9IG5vZGUtPmNvbXA7Cj4+Pj4+ICsgICAgICAgICAgICAg
cnRkcnYgPSB0b19ydnRyYWNlX2RyaXZlcihjb21wLT5kZXYuZHJpdmVyKTsKPj4+Pj4gKyAgICAg
ICAgICAgICBpZiAoIXJ0ZHJ2LT5zdGFydCkKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGNv
bnRpbnVlOwo+Pj4+PiArCj4+Pj4+ICsgICAgICAgICAgICAgcmV0ID0gcnRkcnYtPnN0YXJ0KGNv
bXApOwo+Pj4+PiArICAgICAgICAgICAgIGlmIChyZXQpCj4+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gcmV0Owo+Pj4+PiArICAgICB9Cj4+Pj4+ICsKPj4+Pj4gKyAgICAgcmV0dXJu
IDA7Cj4+Pj4+ICt9Cj4+Pj4+ICtFWFBPUlRfU1lNQk9MX0dQTChydnRyYWNlX3BhdGhfc3RhcnQp
Owo+Pj4+PiArCj4+Pj4+ICtpbnQgcnZ0cmFjZV9wYXRoX3N0b3Aoc3RydWN0IHJ2dHJhY2VfcGF0
aCAqcGF0aCkKPj4+Pj4gK3sKPj4+Pj4gKyAgICAgY29uc3Qgc3RydWN0IHJ2dHJhY2VfZHJpdmVy
ICpydGRydjsKPj4+Pj4gKyAgICAgc3RydWN0IHJ2dHJhY2VfY29tcG9uZW50ICpjb21wOwo+Pj4+
PiArICAgICBzdHJ1Y3QgcnZ0cmFjZV9wYXRoX25vZGUgKm5vZGU7Cj4+Pj4+ICsgICAgIGludCBy
ZXQ7Cj4+Pj4+ICsKPj4+Pj4gKyAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeShub2RlLCAmcGF0aC0+
Y29tcF9saXN0LCBoZWFkKSB7Cj4+Pj4+ICsgICAgICAgICAgICAgY29tcCA9IG5vZGUtPmNvbXA7
Cj4+Pj4+ICsgICAgICAgICAgICAgcnRkcnYgPSB0b19ydnRyYWNlX2RyaXZlcihjb21wLT5kZXYu
ZHJpdmVyKTsKPj4+Pj4gKyAgICAgICAgICAgICBpZiAoIXJ0ZHJ2LT5zdG9wKQo+Pj4+PiArICAg
ICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4+Pj4+ICsKPj4+Pj4gKyAgICAgICAgICAgICBy
ZXQgPSBydGRydi0+c3RvcChjb21wKTsKPj4+Pj4gKyAgICAgICAgICAgICBpZiAocmV0KQo+Pj4+
PiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4+Pj4gKyAgICAgfQo+Pj4+PiAr
Cj4+Pj4+ICsgICAgIHJldHVybiAwOwo+Pj4+PiArfQo+Pj4+PiArRVhQT1JUX1NZTUJPTF9HUEwo
cnZ0cmFjZV9wYXRoX3N0b3ApOwo+Pj4+PiArCj4+Pj4+ICAgICBzdHJ1Y3QgcnZ0cmFjZV9wYXRo
ICpydnRyYWNlX2NyZWF0ZV9wYXRoKHN0cnVjdCBydnRyYWNlX2NvbXBvbmVudCAqc291cmNlLAo+
Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBydnRy
YWNlX2NvbXBvbmVudCAqc2luaywKPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBlbnVtIHJ2dHJhY2VfY29tcG9uZW50X21vZGUgbW9kZSkKPj4+Pj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvcnZ0cmFjZS5oIGIvaW5jbHVkZS9saW51eC9ydnRyYWNlLmgK
Pj4+Pj4gaW5kZXggZjIxNzRmNDYzYTY5Li5lN2JkMzM1ZDM4OGYgMTAwNjQ0Cj4+Pj4+IC0tLSBh
L2luY2x1ZGUvbGludXgvcnZ0cmFjZS5oCj4+Pj4+ICsrKyBiL2luY2x1ZGUvbGludXgvcnZ0cmFj
ZS5oCj4+Pj4+IEBAIC0yNzMsMTAgKzI3MywxNCBAQCBzdHJ1Y3QgcnZ0cmFjZV9wYXRoICpydnRy
YWNlX2NyZWF0ZV9wYXRoKHN0cnVjdCBydnRyYWNlX2NvbXBvbmVudCAqc291cmNlLAo+Pj4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBydnRyYWNlX2Nv
bXBvbmVudCAqc2luaywKPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBlbnVtIHJ2dHJhY2VfY29tcG9uZW50X21vZGUgbW9kZSk7Cj4+Pj4+ICAgICB2b2lkIHJ2
dHJhY2VfZGVzdHJveV9wYXRoKHN0cnVjdCBydnRyYWNlX3BhdGggKnBhdGgpOwo+Pj4+PiAraW50
IHJ2dHJhY2VfcGF0aF9zdGFydChzdHJ1Y3QgcnZ0cmFjZV9wYXRoICpwYXRoKTsKPj4+Pj4gK2lu
dCBydnRyYWNlX3BhdGhfc3RvcChzdHJ1Y3QgcnZ0cmFjZV9wYXRoICpwYXRoKTsKPj4+Pj4KPj4+
Pj4gICAgIC8qKgo+Pj4+PiAgICAgICogc3RydWN0IHJ2dHJhY2VfZHJpdmVyIC0gUmVwcmVzZW50
YXRpb24gb2YgYSBSSVNDLVYgdHJhY2UgZHJpdmVyCj4+Pj4+ICAgICAgKiBpZF90YWJsZTogVGFi
bGUgdG8gbWF0Y2ggY29tcG9uZW50cyBoYW5kbGVkIGJ5IHRoZSBkcml2ZXIKPj4+Pj4gKyAqIHN0
YXJ0OiAgICAgICAgQ2FsbGJhY2sgdG8gc3RhcnQgdHJhY2luZwo+Pj4+PiArICogc3RvcDogICAg
ICAgICBDYWxsYmFjayB0byBzdG9wIHRyYWNpbmcKPj4+Pj4gICAgICAqIHByb2JlOiAgICAgICAg
RHJpdmVyIHByb2JlKCkgZnVuY3Rpb24KPj4+Pj4gICAgICAqIHJlbW92ZTogICAgICAgRHJpdmVy
IHJlbW92ZSgpIGZ1bmN0aW9uCj4+Pj4+ICAgICAgKiBnZXRfdHJhY2VfaWQ6IEdldC9hbGxvY2F0
ZSBhIHRyYWNlIElECj4+Pj4+IEBAIC0yODUsNiArMjg5LDggQEAgdm9pZCBydnRyYWNlX2Rlc3Ry
b3lfcGF0aChzdHJ1Y3QgcnZ0cmFjZV9wYXRoICpwYXRoKTsKPj4+Pj4gICAgICAqLwo+Pj4+PiAg
ICAgc3RydWN0IHJ2dHJhY2VfZHJpdmVyIHsKPj4+Pj4gICAgICAgICBjb25zdCBzdHJ1Y3QgcnZ0
cmFjZV9jb21wb25lbnRfaWQgKmlkX3RhYmxlOwo+Pj4+PiArICAgICBpbnQgICAgICAgICAgICAg
ICAgICAgICAoKnN0YXJ0KShzdHJ1Y3QgcnZ0cmFjZV9jb21wb25lbnQgKmNvbXApOwo+Pj4+PiAr
ICAgICBpbnQgICAgICAgICAgICAgICAgICAgICAoKnN0b3ApKHN0cnVjdCBydnRyYWNlX2NvbXBv
bmVudCAqY29tcCk7Cj4+Pj4+ICAgICAgICAgaW50ICAgICAgICAgICAgICAgICAgICAgKCpwcm9i
ZSkoc3RydWN0IHJ2dHJhY2VfY29tcG9uZW50ICpjb21wKTsKPj4+Pj4gICAgICAgICB2b2lkICAg
ICAgICAgICAgICAgICAgICAoKnJlbW92ZSkoc3RydWN0IHJ2dHJhY2VfY29tcG9uZW50ICpjb21w
KTsKPj4+Pj4gICAgICAgICBpbnQgICAgICAgICAgICAgICAgICAgICAoKmdldF90cmFjZV9pZCko
c3RydWN0IHJ2dHJhY2VfY29tcG9uZW50ICpjb21wLAo+Pj4+Cj4+Pj4gSSdkIHN1Z2dlc3QgYWRk
IGFub3RoZXIgZnVuY3Rpb24gKCpxdWllc2NlKSBvciBzb21ldGhpbmcgbGlrZSB0aGF0LiBUcmFj
ZQo+Pj4+IGNvbXBvbmVudHMgaGF2ZSBhIHRyPz9FbXB0eSBiaXQgdGhhdCBpbmRpY2F0ZXMgdHJh
Y2UgaGFzIGJlZW4gYWxsIGZsdXNoZWQKPj4+PiBvdXQuIEFsc28gYWxvbmcgdGhlIHBhdGggd2hl
biB5b3UgZG8gcnZ0cmFjZV9wYXRoX3N0b3AsIHlvdSBuZWVkIHRvIGVuc3VyZQo+Pj4+IHRoZSBz
b3VyY2UgaGFzIHN0b3BwZWQgYW5kIHF1aWVzY2VudCBiZWZvcmUgYmVnaW5uaW5nIHRvIHN0b3Ag
dGhlIHNpbmsuCj4+Pj4gT3RoZXJ3aXNlIHlvdSdsbCBnZXQgcGFydGlhbCBvciBjb3JydXB0ZWQg
dHJhY2UuIEluIGVzc2VuY2UsIGZvbGxvdyBDb250cm9sCj4+Pj4gSW50ZXJmYWNlIFNwZWMgMTEu
MyBFbmFibGluZyBhbmQgRGlzYWJsaW5nLiBGWUk6IG15IHVzZXJzcGFjZSBkcml2ZXI6Cj4+Pj4g
aHR0cHM6Ly9naXRodWIuY29tL2dhbmJvaW5nL3Jpc2N2LXRyYWNlLXVtZC9ibG9iL21hc3Rlci9y
dnRyYWNlL2Z1bm5lbC5weSNMMjIzCj4+Pgo+Pj4gSXQncyBiZXR0ZXIgdG8gYWRkIGZ1bmN0aW9u
cyBvbiBhIG5lZWQgYmFzaXMgcmF0aGVyIHRoYW4gYWRkaW5nCj4+PiBpdCBub3cgd2l0aG91dCBh
bnkgcG90ZW50aWFsIHVzZXIuCj4+Pgo+Pj4gUmVnYXJkcywKPj4+IEFudQo+Pgo+PiBIaSBBbnVw
LCBteSBwcmV2aW91cyBjb21tZW50IGFsc28gYXBwbGllcyB0byB5b3VyIGN1cnJlbnQgdXNlIGNh
c2Ugd2hlcmUgeW91Cj4+IGhhdmUgZW5jb2Rlci0+UkFNIHNpbmsgZGlyZWN0bHkgY29ubmVjdGVk
IHRvZ2V0aGVyLiBIYXZpbmcgYSBsb25nZXIgcGF0aCwKPj4gZS5nLiwgZnVubmVscyBpbiBiZXR3
ZWVuIG1ha2VzIGl0IHdvcnNlLiBUaGUgZHJpdmVyIG5lZWRzIHRvIHBvbGwgdGhlIGVtcHR5Cj4+
IGJpdCB0cj8/RW1wdHkgKGJpdCAzKSBvZiB0aGUgY29udHJvbCByZWdpc3RlciB0byBjaGVjayBp
ZiB0cmFjZSBoYXMgYmVlbgo+PiBjb21wbGV0ZWx5IGZsdXNoZWQuIE90aGVyd2lzZSwgeW91IGdl
dCBhIHBhcnRpYWwgdHJhY2UsIHBvc3NpYmx5IHdpdGggbGFzdAo+PiBmZXcgbWVzc2FnZXMgbWlz
c2luZyBvciB0cnVuY2F0ZWQuIFNvLCB5ZXMsIHRoZXJlJ3MgcmVhbGx5IGEgbmVlZCB0byBkbyBz
by4KPiAKPiBJIHRoaW5rIHRoaXMgY2FuIGFsc28gYmUgaW1wbGVtZW50ZWQgaW4gdGhlIGNvbXBv
bmVudCdzICdzdG9wJyBjYWxsYmFjay4KClN1cmUsIHRoYXQgYWxzbyB3b3Jrcy4KCj4+Cj4+IEJv
CgpCbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
