Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6EDCCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 04:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlXPuodiUehTzxuqX/5ShtSEUsBX11spgR8BNRzQZP0=; b=xk06lFA/OLFYp2xQQhOnIn+4Fh
	R46eGlX063Bh4+Y0CV219OWpg0rkBU94b5isrqew9hBBaAQAMWFYMEm4J98uGSB+E/S+uJLPpXuIm
	Z19v++puAb4iipx2t1dmH5PlW1cP242HFzIc9CKiO+jlCfP5M15UaeF+hdlKGLXSb5S0Akla1bEQr
	mOmYZNG9Cbwva5niF0/l361lu0FJq03WGlIGPbA8MUVhK3Yx/gQ2PvwMEvS+6Kjgt9w4irgXCKB+o
	B3zojZ0PhN6ussraA6gf9X7h7Do6yNuIg9MTRqsBwZpvQy3p73sVbvkpj0WEsFKMOsSFDHjXYF2Dx
	paeu15fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8AYf-0000000CDbu-2K0Q;
	Mon, 13 Oct 2025 04:53:17 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8AYc-0000000CDbJ-3Jsu
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 04:53:16 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-782bfd0a977so3230565b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 12 Oct 2025 21:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760331193; x=1760935993; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iig8zULaBGKefHgRiefx6wvNXp12HvxlE0VsdKCFlN8=;
        b=dnSojWdcPi1ZfGqgVm9aJJ6bKWwSEnbnF9nQ2fe7Iu74VmslWhmfrklDFxma/IbH1N
         D+Qng0J8Xrcv3fYyirkT8xwYcJUdy4GW3CaFf7EbrpJVDkPj2ca1mhXGHneJxExc6TZr
         kQ69+g2tnrtkTgdCNqE+yRTdIqPDSdphPmBxhJWJ1Oy3X3m9jC4BDqFDMhd3Gm6FKCPL
         U/zouBABTuLv+zur7uuc754dffQKk681B95zKn0a+rfsN3T3jBJgH1KHaz9Rm5qQ61Re
         sFgchNCg//DATO0MWWgsk7HPw8J9Jw0MeaAX7YZ73vGPh1V9pXny2wJd1PtulsK+wwWr
         lq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760331193; x=1760935993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iig8zULaBGKefHgRiefx6wvNXp12HvxlE0VsdKCFlN8=;
        b=bF0qyzRu6cPd4z4++04VmAsZUFqTxMoZbr76cpptCZDZ/wmNCirZO8Ht6YLx03vSVw
         Iputbs4vopDCKLqJ48UO5t31chA06vfsVwjqujLTDQExX0DAqKAheMhA8ht5kGHW/bS9
         8eX1K7AAgsDhixu2pxzJQTBM+G1fxR+K60MwInWAt4Ym3HFl8OlTxJlZn2IsRR0Pd9RX
         4GJCxZz0DgOkzHiNrmHEIGJhzc7IGi45EvSHY5n+ixMHYVq20q1dWhV4fT45xu2pL73R
         TohfsxwaPbyIVX0xQH7OMcpFs1dAs+vmJ19dfFuokCVFyUKD9x5ZtwoCdpjChm+ZSFwC
         c1hA==
X-Forwarded-Encrypted: i=1; AJvYcCW20pgWAiPtN/bmIC2M9SEjWN2RVmEz/TkyucLhND6/m0vk19NapD5IvLkt8efPbR+atnqm8gp4+gP80Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkSowIYsRdqJqdkai5WJLs5/2Xvdbdg8xza+QWL+8Z4f5tFE/C
	YIGDeIFPB7o2SJYuEVQBztHfPYu5Nu/sFkYEcsBJL5mZ4CjbNsiZCW7n
X-Gm-Gg: ASbGncthrJ1lNfE4+xXDC+Bh5MKSu9ZDbDC6tN3ppE9dyJ8C9Qx0tS7fABJn7P1EUS/
	koZSry94he70ITyETY8JBTbaBMBzhk74ZBdenD7/5Ch4/v+kEHMoNuLrkaXZTLodIpiWDJ+DzgR
	/GiJ7RUU0KHYbAynFbZ1liKpEonTt2sOUzfgO02L6u7I7B0oJM9cGUQAI9BtOEiH1W1FBwG29Ot
	cIy/o6HyGbeNliOgCPLtr2sJitkCxjbtpNukersRFIbLUDjeyt4BHP71Qh8SKXW8qHF42yVhsWs
	q1fc2aLwcK6mi4hQwsVZEXspOK49Vp6BSrg0fZRLKVeTbJC5LLdG/UW7MwD6JMKvb/nlsPS0s1W
	z3It6m2DIMKJrfDt0yw+asAOAsb+5T33uBTHwURxOOQXPNPChyMSBTw==
X-Google-Smtp-Source: AGHT+IGZGhr12bO6wfTXu09l388BDAP4wiQF6RXjurZEfsavHD+7xXZuNclsan1m8EDtpJl6OhwQpw==
X-Received: by 2002:a05:6a20:3d94:b0:2e8:6bf6:7d6c with SMTP id adf61e73a8af0-32da80bb8eamr24789027637.2.1760331193278;
        Sun, 12 Oct 2025 21:53:13 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b7411fcf0sm4651902a91.4.2025.10.12.21.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Oct 2025 21:53:12 -0700 (PDT)
Message-ID: <69205060-6a47-4140-8026-6e5a50ad1512@gmail.com>
Date: Sun, 12 Oct 2025 21:52:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] rvtrace: Add functions to start/stop tracing on a
 component path
To: Anup Patel <apatel@ventanamicro.com>, Bo Gan <ganboing@gmail.com>
References: <20251002060732.100213-1-apatel@ventanamicro.com>
 <20251002060732.100213-5-apatel@ventanamicro.com>
 <20edc3a9-2efe-4431-b198-f00b3940777c@gmail.com>
 <CAK9=C2U+H5xZaK6g5qcytESyC9H8gkU_jEUDJanEs1qzcGgYCQ@mail.gmail.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <CAK9=C2U+H5xZaK6g5qcytESyC9H8gkU_jEUDJanEs1qzcGgYCQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_215314_837871_ADBAAFC4 
X-CRM114-Status: GOOD (  19.29  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Atish Patra <atish.patra@linux.dev>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-kernel@vger.kernel.org, Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, Liang Kan <kan.liang@linux.intel.com>, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@redhat.com>, Greg KH <gregkh@linuxfoundation.org>, Adrian Hunter <adrian.hunter@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTAvMTIvMjUgMjA6NDMsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gT24gV2VkLCBPY3QgOCwgMjAy
NSBhdCAyOjQ14oCvUE0gQm8gR2FuIDxnYW5ib2luZ0BnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBP
biAxMC8xLzI1IDIzOjA3LCBBbnVwIFBhdGVsIHdyb3RlOgo+Pj4gRnJvbTogTWF5dXJlc2ggQ2hp
dGFsZSA8bWNoaXRhbGVAdmVudGFuYW1pY3JvLmNvbT4KPj4+Cj4+PiBUaGUgcGVyZiBkcml2ZXIg
ZnJhbWV3b3JrIG5lZWRzIHRvIGJlIGFibGUgdG8gc3RhcnQgLyBzdG9wIGFsbCBjb21wb25lbnRz
Cj4+PiBpbiBhIHRyYWNlIGNvbXBvbmVudCBwYXRoIGR1cmluZyBpdHMgb3BlcmF0aW9uLiBBZGQg
cnZ0cmFjZV9wYXRoX3N0YXJ0KCkKPj4+IGFuZCBydnRyYWNlX3BhdGhfc3RvcCgpIGZ1bmN0aW9u
cyBmb3IgdGhpcyBwdXJwb3NlLgo+Pj4KPj4+IENvLWRldmVsb3BlZC1ieTogQW51cCBQYXRlbCA8
YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxh
cGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IE1heXVyZXNoIENoaXRh
bGUgPG1jaGl0YWxlQHZlbnRhbmFtaWNyby5jb20+Cj4+PiAtLS0KPj4+ICAgIGRyaXZlcnMvaHd0
cmFjaW5nL3J2dHJhY2UvcnZ0cmFjZS1jb3JlLmMgfCA0NCArKysrKysrKysrKysrKysrKysrKysr
KysKPj4+ICAgIGluY2x1ZGUvbGludXgvcnZ0cmFjZS5oICAgICAgICAgICAgICAgICAgfCAgNiAr
KysrCj4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9od3RyYWNpbmcvcnZ0cmFjZS9ydnRyYWNlLWNvcmUuYyBiL2RyaXZl
cnMvaHd0cmFjaW5nL3J2dHJhY2UvcnZ0cmFjZS1jb3JlLmMKPj4+IGluZGV4IDcwMTNkNTBjYTU2
OS4uMTA5YmU0MGQ0YjI0IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9od3RyYWNpbmcvcnZ0cmFj
ZS9ydnRyYWNlLWNvcmUuYwo+Pj4gKysrIGIvZHJpdmVycy9od3RyYWNpbmcvcnZ0cmFjZS9ydnRy
YWNlLWNvcmUuYwo+Pj4gQEAgLTYxNCw2ICs2MTQsNTAgQEAgc3RhdGljIHZvaWQgcnZ0cmFjZV9y
ZWxlYXNlX3BhdGhfbm9kZXMoc3RydWN0IHJ2dHJhY2VfcGF0aCAqcGF0aCkKPj4+ICAgICAgICB9
Cj4+PiAgICB9Cj4+Pgo+Pj4gK2ludCBydnRyYWNlX3BhdGhfc3RhcnQoc3RydWN0IHJ2dHJhY2Vf
cGF0aCAqcGF0aCkKPj4+ICt7Cj4+PiArICAgICBjb25zdCBzdHJ1Y3QgcnZ0cmFjZV9kcml2ZXIg
KnJ0ZHJ2Owo+Pj4gKyAgICAgc3RydWN0IHJ2dHJhY2VfY29tcG9uZW50ICpjb21wOwo+Pj4gKyAg
ICAgc3RydWN0IHJ2dHJhY2VfcGF0aF9ub2RlICpub2RlOwo+Pj4gKyAgICAgaW50IHJldDsKPj4+
ICsKPj4+ICsgICAgIGxpc3RfZm9yX2VhY2hfZW50cnkobm9kZSwgJnBhdGgtPmNvbXBfbGlzdCwg
aGVhZCkgewo+Pj4gKyAgICAgICAgICAgICBjb21wID0gbm9kZS0+Y29tcDsKPj4+ICsgICAgICAg
ICAgICAgcnRkcnYgPSB0b19ydnRyYWNlX2RyaXZlcihjb21wLT5kZXYuZHJpdmVyKTsKPj4+ICsg
ICAgICAgICAgICAgaWYgKCFydGRydi0+c3RhcnQpCj4+PiArICAgICAgICAgICAgICAgICAgICAg
Y29udGludWU7Cj4+PiArCj4+PiArICAgICAgICAgICAgIHJldCA9IHJ0ZHJ2LT5zdGFydChjb21w
KTsKPj4+ICsgICAgICAgICAgICAgaWYgKHJldCkKPj4+ICsgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gcmV0Owo+Pj4gKyAgICAgfQo+Pj4gKwo+Pj4gKyAgICAgcmV0dXJuIDA7Cj4+PiArfQo+
Pj4gK0VYUE9SVF9TWU1CT0xfR1BMKHJ2dHJhY2VfcGF0aF9zdGFydCk7Cj4+PiArCj4+PiAraW50
IHJ2dHJhY2VfcGF0aF9zdG9wKHN0cnVjdCBydnRyYWNlX3BhdGggKnBhdGgpCj4+PiArewo+Pj4g
KyAgICAgY29uc3Qgc3RydWN0IHJ2dHJhY2VfZHJpdmVyICpydGRydjsKPj4+ICsgICAgIHN0cnVj
dCBydnRyYWNlX2NvbXBvbmVudCAqY29tcDsKPj4+ICsgICAgIHN0cnVjdCBydnRyYWNlX3BhdGhf
bm9kZSAqbm9kZTsKPj4+ICsgICAgIGludCByZXQ7Cj4+PiArCj4+PiArICAgICBsaXN0X2Zvcl9l
YWNoX2VudHJ5KG5vZGUsICZwYXRoLT5jb21wX2xpc3QsIGhlYWQpIHsKPj4+ICsgICAgICAgICAg
ICAgY29tcCA9IG5vZGUtPmNvbXA7Cj4+PiArICAgICAgICAgICAgIHJ0ZHJ2ID0gdG9fcnZ0cmFj
ZV9kcml2ZXIoY29tcC0+ZGV2LmRyaXZlcik7Cj4+PiArICAgICAgICAgICAgIGlmICghcnRkcnYt
PnN0b3ApCj4+PiArICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4+PiArCj4+PiArICAg
ICAgICAgICAgIHJldCA9IHJ0ZHJ2LT5zdG9wKGNvbXApOwo+Pj4gKyAgICAgICAgICAgICBpZiAo
cmV0KQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4+PiArICAgICB9Cj4+
PiArCj4+PiArICAgICByZXR1cm4gMDsKPj4+ICt9Cj4+PiArRVhQT1JUX1NZTUJPTF9HUEwocnZ0
cmFjZV9wYXRoX3N0b3ApOwo+Pj4gKwo+Pj4gICAgc3RydWN0IHJ2dHJhY2VfcGF0aCAqcnZ0cmFj
ZV9jcmVhdGVfcGF0aChzdHJ1Y3QgcnZ0cmFjZV9jb21wb25lbnQgKnNvdXJjZSwKPj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcnZ0cmFjZV9jb21wb25l
bnQgKnNpbmssCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51
bSBydnRyYWNlX2NvbXBvbmVudF9tb2RlIG1vZGUpCj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9ydnRyYWNlLmggYi9pbmNsdWRlL2xpbnV4L3J2dHJhY2UuaAo+Pj4gaW5kZXggZjIxNzRm
NDYzYTY5Li5lN2JkMzM1ZDM4OGYgMTAwNjQ0Cj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3J2dHJh
Y2UuaAo+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9ydnRyYWNlLmgKPj4+IEBAIC0yNzMsMTAgKzI3
MywxNCBAQCBzdHJ1Y3QgcnZ0cmFjZV9wYXRoICpydnRyYWNlX2NyZWF0ZV9wYXRoKHN0cnVjdCBy
dnRyYWNlX2NvbXBvbmVudCAqc291cmNlLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBydnRyYWNlX2NvbXBvbmVudCAqc2luaywKPj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIHJ2dHJhY2VfY29tcG9uZW50X21v
ZGUgbW9kZSk7Cj4+PiAgICB2b2lkIHJ2dHJhY2VfZGVzdHJveV9wYXRoKHN0cnVjdCBydnRyYWNl
X3BhdGggKnBhdGgpOwo+Pj4gK2ludCBydnRyYWNlX3BhdGhfc3RhcnQoc3RydWN0IHJ2dHJhY2Vf
cGF0aCAqcGF0aCk7Cj4+PiAraW50IHJ2dHJhY2VfcGF0aF9zdG9wKHN0cnVjdCBydnRyYWNlX3Bh
dGggKnBhdGgpOwo+Pj4KPj4+ICAgIC8qKgo+Pj4gICAgICogc3RydWN0IHJ2dHJhY2VfZHJpdmVy
IC0gUmVwcmVzZW50YXRpb24gb2YgYSBSSVNDLVYgdHJhY2UgZHJpdmVyCj4+PiAgICAgKiBpZF90
YWJsZTogVGFibGUgdG8gbWF0Y2ggY29tcG9uZW50cyBoYW5kbGVkIGJ5IHRoZSBkcml2ZXIKPj4+
ICsgKiBzdGFydDogICAgICAgIENhbGxiYWNrIHRvIHN0YXJ0IHRyYWNpbmcKPj4+ICsgKiBzdG9w
OiAgICAgICAgIENhbGxiYWNrIHRvIHN0b3AgdHJhY2luZwo+Pj4gICAgICogcHJvYmU6ICAgICAg
ICBEcml2ZXIgcHJvYmUoKSBmdW5jdGlvbgo+Pj4gICAgICogcmVtb3ZlOiAgICAgICBEcml2ZXIg
cmVtb3ZlKCkgZnVuY3Rpb24KPj4+ICAgICAqIGdldF90cmFjZV9pZDogR2V0L2FsbG9jYXRlIGEg
dHJhY2UgSUQKPj4+IEBAIC0yODUsNiArMjg5LDggQEAgdm9pZCBydnRyYWNlX2Rlc3Ryb3lfcGF0
aChzdHJ1Y3QgcnZ0cmFjZV9wYXRoICpwYXRoKTsKPj4+ICAgICAqLwo+Pj4gICAgc3RydWN0IHJ2
dHJhY2VfZHJpdmVyIHsKPj4+ICAgICAgICBjb25zdCBzdHJ1Y3QgcnZ0cmFjZV9jb21wb25lbnRf
aWQgKmlkX3RhYmxlOwo+Pj4gKyAgICAgaW50ICAgICAgICAgICAgICAgICAgICAgKCpzdGFydCko
c3RydWN0IHJ2dHJhY2VfY29tcG9uZW50ICpjb21wKTsKPj4+ICsgICAgIGludCAgICAgICAgICAg
ICAgICAgICAgICgqc3RvcCkoc3RydWN0IHJ2dHJhY2VfY29tcG9uZW50ICpjb21wKTsKPj4+ICAg
ICAgICBpbnQgICAgICAgICAgICAgICAgICAgICAoKnByb2JlKShzdHJ1Y3QgcnZ0cmFjZV9jb21w
b25lbnQgKmNvbXApOwo+Pj4gICAgICAgIHZvaWQgICAgICAgICAgICAgICAgICAgICgqcmVtb3Zl
KShzdHJ1Y3QgcnZ0cmFjZV9jb21wb25lbnQgKmNvbXApOwo+Pj4gICAgICAgIGludCAgICAgICAg
ICAgICAgICAgICAgICgqZ2V0X3RyYWNlX2lkKShzdHJ1Y3QgcnZ0cmFjZV9jb21wb25lbnQgKmNv
bXAsCj4+Cj4+IEknZCBzdWdnZXN0IGFkZCBhbm90aGVyIGZ1bmN0aW9uICgqcXVpZXNjZSkgb3Ig
c29tZXRoaW5nIGxpa2UgdGhhdC4gVHJhY2UKPj4gY29tcG9uZW50cyBoYXZlIGEgdHI/P0VtcHR5
IGJpdCB0aGF0IGluZGljYXRlcyB0cmFjZSBoYXMgYmVlbiBhbGwgZmx1c2hlZAo+PiBvdXQuIEFs
c28gYWxvbmcgdGhlIHBhdGggd2hlbiB5b3UgZG8gcnZ0cmFjZV9wYXRoX3N0b3AsIHlvdSBuZWVk
IHRvIGVuc3VyZQo+PiB0aGUgc291cmNlIGhhcyBzdG9wcGVkIGFuZCBxdWllc2NlbnQgYmVmb3Jl
IGJlZ2lubmluZyB0byBzdG9wIHRoZSBzaW5rLgo+PiBPdGhlcndpc2UgeW91J2xsIGdldCBwYXJ0
aWFsIG9yIGNvcnJ1cHRlZCB0cmFjZS4gSW4gZXNzZW5jZSwgZm9sbG93IENvbnRyb2wKPj4gSW50
ZXJmYWNlIFNwZWMgMTEuMyBFbmFibGluZyBhbmQgRGlzYWJsaW5nLiBGWUk6IG15IHVzZXJzcGFj
ZSBkcml2ZXI6Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9nYW5ib2luZy9yaXNjdi10cmFjZS11bWQv
YmxvYi9tYXN0ZXIvcnZ0cmFjZS9mdW5uZWwucHkjTDIyMwo+IAo+IEl0J3MgYmV0dGVyIHRvIGFk
ZCBmdW5jdGlvbnMgb24gYSBuZWVkIGJhc2lzIHJhdGhlciB0aGFuIGFkZGluZwo+IGl0IG5vdyB3
aXRob3V0IGFueSBwb3RlbnRpYWwgdXNlci4KPiAKPiBSZWdhcmRzLAo+IEFudQoKSGkgQW51cCwg
bXkgcHJldmlvdXMgY29tbWVudCBhbHNvIGFwcGxpZXMgdG8geW91ciBjdXJyZW50IHVzZSBjYXNl
IHdoZXJlIHlvdQpoYXZlIGVuY29kZXItPlJBTSBzaW5rIGRpcmVjdGx5IGNvbm5lY3RlZCB0b2dl
dGhlci4gSGF2aW5nIGEgbG9uZ2VyIHBhdGgsCmUuZy4sIGZ1bm5lbHMgaW4gYmV0d2VlbiBtYWtl
cyBpdCB3b3JzZS4gVGhlIGRyaXZlciBuZWVkcyB0byBwb2xsIHRoZSBlbXB0eQpiaXQgdHI/P0Vt
cHR5IChiaXQgMykgb2YgdGhlIGNvbnRyb2wgcmVnaXN0ZXIgdG8gY2hlY2sgaWYgdHJhY2UgaGFz
IGJlZW4KY29tcGxldGVseSBmbHVzaGVkLiBPdGhlcndpc2UsIHlvdSBnZXQgYSBwYXJ0aWFsIHRy
YWNlLCBwb3NzaWJseSB3aXRoIGxhc3QKZmV3IG1lc3NhZ2VzIG1pc3Npbmcgb3IgdHJ1bmNhdGVk
LiBTbywgeWVzLCB0aGVyZSdzIHJlYWxseSBhIG5lZWQgdG8gZG8gc28uCgpCbwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
