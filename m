Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D10CCD18F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 08:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=brCbR1BCL1C9yuHSziOosOocAj9ut61lejLkIy9NMoA=; b=2PvxTRiAqpH3Rz
	NxRn4RyPYt+QVImRk3Tn9CHBm28TpC6otf04Zne1nkXizwZT9k2uPDbA3JYMVFu+S9O2WN3hm4454
	TFF4ghZVifZEcVbmIRExfxylUaL8sGtL7Lsb/7d90EuA5pTprGE8We4r9F7/028MZ04uGD79L5jZT
	ucW8oCn7pWgwq461OjFF7Fr2ENVfbERkgsVXA6VNimQDyG5+nJUfAbgpWym3rdHnAt/AgTVuSzRsY
	2/6s0Nqg8N9xDUOLugtpF1wMzzziYpT6Bn4AKBokSBVghFJW6AD6XcOugvWFWuFiXGdlIe1/29OD/
	aF4OhAWwoueJSArdXKFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8a8C-0000000FZRU-2KAj;
	Tue, 14 Oct 2025 08:11:40 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8a8A-0000000FZQ6-1OWC
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 08:11:39 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b55517e74e3so5559737a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 01:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760429497; x=1761034297; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fjoc325jjBewUa+PMCJv73wF7zKdUoHfwyGW6ASR27s=;
        b=T73UV1+3elUfA+sq9I8wWj83cxXWBjPK9cVViYET9T+NGuyQnCsvujtv1B330ByFPw
         inA6KjTFj+V3UtySTrtLsk3Dfbh+mYsf5l416/VETnRgS7ZK3D+k5UWDdz40J6AO96RA
         mkc5HrO3IT8XUHkF/bqot89deh1EFRw30/WoKFmTzri3FroQqaFOX36JQZ2hgIjtC2au
         5FUKLzs08azXB9qJAXPTC0vRouuAYhcNJnEAeP5G8nxNcRjfMqkmP72YZDk8LId0wLhM
         9Co4n7UErYOoU+rVGfy6pebm4nnX8R7Q9zdLZ463MHlz4Kk2Ddbuw6jHT8wZ9why9J1K
         jxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760429497; x=1761034297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fjoc325jjBewUa+PMCJv73wF7zKdUoHfwyGW6ASR27s=;
        b=J1up9oZHCjCfSLjUsrk+j6of73JWD9wVncIDNBCOyXz1SFlZKY7WDHTgG/cvbiZDPm
         m1+iaIfq2+3kDAZQe486gJUcN9wT/lz+fcnc0xEZ6iTZkvK8qTIXItj7mtvCfLd5/ZDE
         fTXIXpXxshlXTtNIAI5zHUa03HMSqPiSIZuewNeZrPa6BDogVLT+CrXrFkkf7RP6YI9t
         YzbCvlwNDEz29ArCoGQNm3HzYOYAlUrwTgfmND3Sqs5UmsIta8E4nYOMKR9KOI4bQctZ
         0kALPMTGm4aCMdXE8GvCFnIx66zrlyFlgUNChdG4WZAftjP/+WNsd/UsQVJNtEUh8xCD
         B/6w==
X-Forwarded-Encrypted: i=1; AJvYcCUDxoX8JYo37Mc6X2qSPPKTgJm7LIndBUnPVBqiHm5jSiJ83MLWkS99yyPdsVWxJypcijk4rRlqBSicoA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7RKYjrBtvsdBt2MoLaYoq/RdjgIOmr/PCY5SdlOY9O0oQOAlV
	Au7ShKWQb4wMrTe9EBTf4sbanzO23Plc2W8OcU/5Gxhk6GJVSwAzUSiRCigAa/l6zL27PDHle1f
	RGYAB177rles8EWwX4fBNUFu5kyh8sEjh6/h8H/H7Kw==
X-Gm-Gg: ASbGncvGQTxhesTZBwZcY0q7JydIrwPjsXD5+RmuasECvbEUZSsbSoju3PEtUTny6r5
	wrysTBMR8hXFICo3N5Hu7HC9of0HOD88nXt8vEjHnSfo6QHbWNqNafeNRKHNY/wql4CbSxpWjNi
	jJN5Fk8QBMqfurLONCd35Ki+UnO878AeOvx2KE8CBv2iJPTtuEFJbiNA89+Jq6BV1YFz/2HYRXI
	dzhzzWZ+rBKfMiP/nnJ7ui6vvxBrtJLYVYmdUJsD2Ztw3dIrCY5LRw8q7dgHFua+ytnEaFOxm1X
	AdebfiOMOLFUzaiqKw==
X-Google-Smtp-Source: AGHT+IGtEx/vxjLQYcfILlv2zX9NsM7oAL80JOcH+vHwVkTXyNROQzVhxfWjHb2rsJrrKGXRKWkc/te+HJHHsQEbDto=
X-Received: by 2002:a17:903:37c3:b0:269:a4ed:13c9 with SMTP id
 d9443c01a7336-290273ee214mr299435315ad.30.1760429497506; Tue, 14 Oct 2025
 01:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20251002060732.100213-1-apatel@ventanamicro.com>
 <20251002060732.100213-5-apatel@ventanamicro.com> <20edc3a9-2efe-4431-b198-f00b3940777c@gmail.com>
 <CAK9=C2U+H5xZaK6g5qcytESyC9H8gkU_jEUDJanEs1qzcGgYCQ@mail.gmail.com> <69205060-6a47-4140-8026-6e5a50ad1512@gmail.com>
In-Reply-To: <69205060-6a47-4140-8026-6e5a50ad1512@gmail.com>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Tue, 14 Oct 2025 13:40:59 +0530
X-Gm-Features: AS18NWDB2JU-ih8bTEc-UVtcOhI_T3P9jU2EM9UEyVjJe9OcrAhVJmGT69VbA0s
Message-ID: <CAN37VV4jFyuEYw0cxU00FucgV=so5SfTon_1hdvbVuqX1QzYCQ@mail.gmail.com>
Subject: Re: [PATCH 04/11] rvtrace: Add functions to start/stop tracing on a
 component path
To: Bo Gan <ganboing@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_011138_376908_2B8CA249 
X-CRM114-Status: GOOD (  25.63  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQm8sCgpPbiBNb24sIE9jdCAxMywgMjAyNSBhdCAxMDoyM+KAr0FNIEJvIEdhbiA8Z2FuYm9p
bmdAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIDEwLzEyLzI1IDIwOjQzLCBBbnVwIFBhdGVsIHdy
b3RlOgo+ID4gT24gV2VkLCBPY3QgOCwgMjAyNSBhdCAyOjQ14oCvUE0gQm8gR2FuIDxnYW5ib2lu
Z0BnbWFpbC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMTAvMS8yNSAyMzowNywgQW51cCBQYXRl
bCB3cm90ZToKPiA+Pj4gRnJvbTogTWF5dXJlc2ggQ2hpdGFsZSA8bWNoaXRhbGVAdmVudGFuYW1p
Y3JvLmNvbT4KPiA+Pj4KPiA+Pj4gVGhlIHBlcmYgZHJpdmVyIGZyYW1ld29yayBuZWVkcyB0byBi
ZSBhYmxlIHRvIHN0YXJ0IC8gc3RvcCBhbGwgY29tcG9uZW50cwo+ID4+PiBpbiBhIHRyYWNlIGNv
bXBvbmVudCBwYXRoIGR1cmluZyBpdHMgb3BlcmF0aW9uLiBBZGQgcnZ0cmFjZV9wYXRoX3N0YXJ0
KCkKPiA+Pj4gYW5kIHJ2dHJhY2VfcGF0aF9zdG9wKCkgZnVuY3Rpb25zIGZvciB0aGlzIHB1cnBv
c2UuCj4gPj4+Cj4gPj4+IENvLWRldmVsb3BlZC1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBNYXl1cmVzaCBDaGl0YWxlIDxtY2hp
dGFsZUB2ZW50YW5hbWljcm8uY29tPgo+ID4+PiAtLS0KPiA+Pj4gICAgZHJpdmVycy9od3RyYWNp
bmcvcnZ0cmFjZS9ydnRyYWNlLWNvcmUuYyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+
ID4+PiAgICBpbmNsdWRlL2xpbnV4L3J2dHJhY2UuaCAgICAgICAgICAgICAgICAgIHwgIDYgKysr
Kwo+ID4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykKPiA+Pj4KPiA+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHd0cmFjaW5nL3J2dHJhY2UvcnZ0cmFjZS1jb3JlLmMgYi9k
cml2ZXJzL2h3dHJhY2luZy9ydnRyYWNlL3J2dHJhY2UtY29yZS5jCj4gPj4+IGluZGV4IDcwMTNk
NTBjYTU2OS4uMTA5YmU0MGQ0YjI0IDEwMDY0NAo+ID4+PiAtLS0gYS9kcml2ZXJzL2h3dHJhY2lu
Zy9ydnRyYWNlL3J2dHJhY2UtY29yZS5jCj4gPj4+ICsrKyBiL2RyaXZlcnMvaHd0cmFjaW5nL3J2
dHJhY2UvcnZ0cmFjZS1jb3JlLmMKPiA+Pj4gQEAgLTYxNCw2ICs2MTQsNTAgQEAgc3RhdGljIHZv
aWQgcnZ0cmFjZV9yZWxlYXNlX3BhdGhfbm9kZXMoc3RydWN0IHJ2dHJhY2VfcGF0aCAqcGF0aCkK
PiA+Pj4gICAgICAgIH0KPiA+Pj4gICAgfQo+ID4+Pgo+ID4+PiAraW50IHJ2dHJhY2VfcGF0aF9z
dGFydChzdHJ1Y3QgcnZ0cmFjZV9wYXRoICpwYXRoKQo+ID4+PiArewo+ID4+PiArICAgICBjb25z
dCBzdHJ1Y3QgcnZ0cmFjZV9kcml2ZXIgKnJ0ZHJ2Owo+ID4+PiArICAgICBzdHJ1Y3QgcnZ0cmFj
ZV9jb21wb25lbnQgKmNvbXA7Cj4gPj4+ICsgICAgIHN0cnVjdCBydnRyYWNlX3BhdGhfbm9kZSAq
bm9kZTsKPiA+Pj4gKyAgICAgaW50IHJldDsKPiA+Pj4gKwo+ID4+PiArICAgICBsaXN0X2Zvcl9l
YWNoX2VudHJ5KG5vZGUsICZwYXRoLT5jb21wX2xpc3QsIGhlYWQpIHsKPiA+Pj4gKyAgICAgICAg
ICAgICBjb21wID0gbm9kZS0+Y29tcDsKPiA+Pj4gKyAgICAgICAgICAgICBydGRydiA9IHRvX3J2
dHJhY2VfZHJpdmVyKGNvbXAtPmRldi5kcml2ZXIpOwo+ID4+PiArICAgICAgICAgICAgIGlmICgh
cnRkcnYtPnN0YXJ0KQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPj4+
ICsKPiA+Pj4gKyAgICAgICAgICAgICByZXQgPSBydGRydi0+c3RhcnQoY29tcCk7Cj4gPj4+ICsg
ICAgICAgICAgICAgaWYgKHJldCkKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiBy
ZXQ7Cj4gPj4+ICsgICAgIH0KPiA+Pj4gKwo+ID4+PiArICAgICByZXR1cm4gMDsKPiA+Pj4gK30K
PiA+Pj4gK0VYUE9SVF9TWU1CT0xfR1BMKHJ2dHJhY2VfcGF0aF9zdGFydCk7Cj4gPj4+ICsKPiA+
Pj4gK2ludCBydnRyYWNlX3BhdGhfc3RvcChzdHJ1Y3QgcnZ0cmFjZV9wYXRoICpwYXRoKQo+ID4+
PiArewo+ID4+PiArICAgICBjb25zdCBzdHJ1Y3QgcnZ0cmFjZV9kcml2ZXIgKnJ0ZHJ2Owo+ID4+
PiArICAgICBzdHJ1Y3QgcnZ0cmFjZV9jb21wb25lbnQgKmNvbXA7Cj4gPj4+ICsgICAgIHN0cnVj
dCBydnRyYWNlX3BhdGhfbm9kZSAqbm9kZTsKPiA+Pj4gKyAgICAgaW50IHJldDsKPiA+Pj4gKwo+
ID4+PiArICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KG5vZGUsICZwYXRoLT5jb21wX2xpc3QsIGhl
YWQpIHsKPiA+Pj4gKyAgICAgICAgICAgICBjb21wID0gbm9kZS0+Y29tcDsKPiA+Pj4gKyAgICAg
ICAgICAgICBydGRydiA9IHRvX3J2dHJhY2VfZHJpdmVyKGNvbXAtPmRldi5kcml2ZXIpOwo+ID4+
PiArICAgICAgICAgICAgIGlmICghcnRkcnYtPnN0b3ApCj4gPj4+ICsgICAgICAgICAgICAgICAg
ICAgICBjb250aW51ZTsKPiA+Pj4gKwo+ID4+PiArICAgICAgICAgICAgIHJldCA9IHJ0ZHJ2LT5z
dG9wKGNvbXApOwo+ID4+PiArICAgICAgICAgICAgIGlmIChyZXQpCj4gPj4+ICsgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4+PiArICAgICB9Cj4gPj4+ICsKPiA+Pj4gKyAgICAg
cmV0dXJuIDA7Cj4gPj4+ICt9Cj4gPj4+ICtFWFBPUlRfU1lNQk9MX0dQTChydnRyYWNlX3BhdGhf
c3RvcCk7Cj4gPj4+ICsKPiA+Pj4gICAgc3RydWN0IHJ2dHJhY2VfcGF0aCAqcnZ0cmFjZV9jcmVh
dGVfcGF0aChzdHJ1Y3QgcnZ0cmFjZV9jb21wb25lbnQgKnNvdXJjZSwKPiA+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBydnRyYWNlX2NvbXBvbmVudCAq
c2luaywKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0g
cnZ0cmFjZV9jb21wb25lbnRfbW9kZSBtb2RlKQo+ID4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9ydnRyYWNlLmggYi9pbmNsdWRlL2xpbnV4L3J2dHJhY2UuaAo+ID4+PiBpbmRleCBmMjE3
NGY0NjNhNjkuLmU3YmQzMzVkMzg4ZiAxMDA2NDQKPiA+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9y
dnRyYWNlLmgKPiA+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9ydnRyYWNlLmgKPiA+Pj4gQEAgLTI3
MywxMCArMjczLDE0IEBAIHN0cnVjdCBydnRyYWNlX3BhdGggKnJ2dHJhY2VfY3JlYXRlX3BhdGgo
c3RydWN0IHJ2dHJhY2VfY29tcG9uZW50ICpzb3VyY2UsCj4gPj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcnZ0cmFjZV9jb21wb25lbnQgKnNpbmssCj4g
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIHJ2dHJhY2Vf
Y29tcG9uZW50X21vZGUgbW9kZSk7Cj4gPj4+ICAgIHZvaWQgcnZ0cmFjZV9kZXN0cm95X3BhdGgo
c3RydWN0IHJ2dHJhY2VfcGF0aCAqcGF0aCk7Cj4gPj4+ICtpbnQgcnZ0cmFjZV9wYXRoX3N0YXJ0
KHN0cnVjdCBydnRyYWNlX3BhdGggKnBhdGgpOwo+ID4+PiAraW50IHJ2dHJhY2VfcGF0aF9zdG9w
KHN0cnVjdCBydnRyYWNlX3BhdGggKnBhdGgpOwo+ID4+Pgo+ID4+PiAgICAvKioKPiA+Pj4gICAg
ICogc3RydWN0IHJ2dHJhY2VfZHJpdmVyIC0gUmVwcmVzZW50YXRpb24gb2YgYSBSSVNDLVYgdHJh
Y2UgZHJpdmVyCj4gPj4+ICAgICAqIGlkX3RhYmxlOiBUYWJsZSB0byBtYXRjaCBjb21wb25lbnRz
IGhhbmRsZWQgYnkgdGhlIGRyaXZlcgo+ID4+PiArICogc3RhcnQ6ICAgICAgICBDYWxsYmFjayB0
byBzdGFydCB0cmFjaW5nCj4gPj4+ICsgKiBzdG9wOiAgICAgICAgIENhbGxiYWNrIHRvIHN0b3Ag
dHJhY2luZwo+ID4+PiAgICAgKiBwcm9iZTogICAgICAgIERyaXZlciBwcm9iZSgpIGZ1bmN0aW9u
Cj4gPj4+ICAgICAqIHJlbW92ZTogICAgICAgRHJpdmVyIHJlbW92ZSgpIGZ1bmN0aW9uCj4gPj4+
ICAgICAqIGdldF90cmFjZV9pZDogR2V0L2FsbG9jYXRlIGEgdHJhY2UgSUQKPiA+Pj4gQEAgLTI4
NSw2ICsyODksOCBAQCB2b2lkIHJ2dHJhY2VfZGVzdHJveV9wYXRoKHN0cnVjdCBydnRyYWNlX3Bh
dGggKnBhdGgpOwo+ID4+PiAgICAgKi8KPiA+Pj4gICAgc3RydWN0IHJ2dHJhY2VfZHJpdmVyIHsK
PiA+Pj4gICAgICAgIGNvbnN0IHN0cnVjdCBydnRyYWNlX2NvbXBvbmVudF9pZCAqaWRfdGFibGU7
Cj4gPj4+ICsgICAgIGludCAgICAgICAgICAgICAgICAgICAgICgqc3RhcnQpKHN0cnVjdCBydnRy
YWNlX2NvbXBvbmVudCAqY29tcCk7Cj4gPj4+ICsgICAgIGludCAgICAgICAgICAgICAgICAgICAg
ICgqc3RvcCkoc3RydWN0IHJ2dHJhY2VfY29tcG9uZW50ICpjb21wKTsKPiA+Pj4gICAgICAgIGlu
dCAgICAgICAgICAgICAgICAgICAgICgqcHJvYmUpKHN0cnVjdCBydnRyYWNlX2NvbXBvbmVudCAq
Y29tcCk7Cj4gPj4+ICAgICAgICB2b2lkICAgICAgICAgICAgICAgICAgICAoKnJlbW92ZSkoc3Ry
dWN0IHJ2dHJhY2VfY29tcG9uZW50ICpjb21wKTsKPiA+Pj4gICAgICAgIGludCAgICAgICAgICAg
ICAgICAgICAgICgqZ2V0X3RyYWNlX2lkKShzdHJ1Y3QgcnZ0cmFjZV9jb21wb25lbnQgKmNvbXAs
Cj4gPj4KPiA+PiBJJ2Qgc3VnZ2VzdCBhZGQgYW5vdGhlciBmdW5jdGlvbiAoKnF1aWVzY2UpIG9y
IHNvbWV0aGluZyBsaWtlIHRoYXQuIFRyYWNlCj4gPj4gY29tcG9uZW50cyBoYXZlIGEgdHI/P0Vt
cHR5IGJpdCB0aGF0IGluZGljYXRlcyB0cmFjZSBoYXMgYmVlbiBhbGwgZmx1c2hlZAo+ID4+IG91
dC4gQWxzbyBhbG9uZyB0aGUgcGF0aCB3aGVuIHlvdSBkbyBydnRyYWNlX3BhdGhfc3RvcCwgeW91
IG5lZWQgdG8gZW5zdXJlCj4gPj4gdGhlIHNvdXJjZSBoYXMgc3RvcHBlZCBhbmQgcXVpZXNjZW50
IGJlZm9yZSBiZWdpbm5pbmcgdG8gc3RvcCB0aGUgc2luay4KPiA+PiBPdGhlcndpc2UgeW91J2xs
IGdldCBwYXJ0aWFsIG9yIGNvcnJ1cHRlZCB0cmFjZS4gSW4gZXNzZW5jZSwgZm9sbG93IENvbnRy
b2wKPiA+PiBJbnRlcmZhY2UgU3BlYyAxMS4zIEVuYWJsaW5nIGFuZCBEaXNhYmxpbmcuIEZZSTog
bXkgdXNlcnNwYWNlIGRyaXZlcjoKPiA+PiBodHRwczovL2dpdGh1Yi5jb20vZ2FuYm9pbmcvcmlz
Y3YtdHJhY2UtdW1kL2Jsb2IvbWFzdGVyL3J2dHJhY2UvZnVubmVsLnB5I0wyMjMKPiA+Cj4gPiBJ
dCdzIGJldHRlciB0byBhZGQgZnVuY3Rpb25zIG9uIGEgbmVlZCBiYXNpcyByYXRoZXIgdGhhbiBh
ZGRpbmcKPiA+IGl0IG5vdyB3aXRob3V0IGFueSBwb3RlbnRpYWwgdXNlci4KPiA+Cj4gPiBSZWdh
cmRzLAo+ID4gQW51Cj4KPiBIaSBBbnVwLCBteSBwcmV2aW91cyBjb21tZW50IGFsc28gYXBwbGll
cyB0byB5b3VyIGN1cnJlbnQgdXNlIGNhc2Ugd2hlcmUgeW91Cj4gaGF2ZSBlbmNvZGVyLT5SQU0g
c2luayBkaXJlY3RseSBjb25uZWN0ZWQgdG9nZXRoZXIuIEhhdmluZyBhIGxvbmdlciBwYXRoLAo+
IGUuZy4sIGZ1bm5lbHMgaW4gYmV0d2VlbiBtYWtlcyBpdCB3b3JzZS4gVGhlIGRyaXZlciBuZWVk
cyB0byBwb2xsIHRoZSBlbXB0eQo+IGJpdCB0cj8/RW1wdHkgKGJpdCAzKSBvZiB0aGUgY29udHJv
bCByZWdpc3RlciB0byBjaGVjayBpZiB0cmFjZSBoYXMgYmVlbgo+IGNvbXBsZXRlbHkgZmx1c2hl
ZC4gT3RoZXJ3aXNlLCB5b3UgZ2V0IGEgcGFydGlhbCB0cmFjZSwgcG9zc2libHkgd2l0aCBsYXN0
Cj4gZmV3IG1lc3NhZ2VzIG1pc3Npbmcgb3IgdHJ1bmNhdGVkLiBTbywgeWVzLCB0aGVyZSdzIHJl
YWxseSBhIG5lZWQgdG8gZG8gc28uCgpJIHRoaW5rIHRoaXMgY2FuIGFsc28gYmUgaW1wbGVtZW50
ZWQgaW4gdGhlIGNvbXBvbmVudCdzICdzdG9wJyBjYWxsYmFjay4KPgo+IEJvCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
