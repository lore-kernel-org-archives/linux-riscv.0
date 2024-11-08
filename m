Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46657D64072
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 18:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jVH+cC26+O8mfzLyfh8RXwqDquo5b9jakGdHxSDsr7s=; b=WO/RFm7YZVMgO4
	tROqHgZ9MNZGEbU+QYmDuXsGVakTrM+GtJP0GD4aD/oFDwbADyi0CIteAfIpIDcJUt+aBU1G0g2fY
	5WjL3J6FIkInDp6uSKUWlRpgDpyqCgAgYBvnNzOwEyafaIL0ePwSF7NUubRJb5NWexqMyyN5nSU/s
	E++0T/1VKqMBBbSxemhxrZtRdx9NrNPcte0kgFxuom9FYoZAq4tlksXedqQAP9HS2QtImtbwunp0C
	eVqyn3vKEvHYNeunRGtzsYXVhIi/0BbRa0+Qzwed8SdU79LNF3sSw0DsMr1zymaHKAhHl3SPHaEqC
	xtPCDx2Q0hYmF1xm+0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9U1X-0000000BdoX-1NVm;
	Fri, 08 Nov 2024 18:47:59 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Tzj-0000000BdUB-2tMP
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 18:46:10 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3a4e54d3cefso7345ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 10:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731091566; x=1731696366; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oq7W5H+t/LruxWYJFi93XWxZ+SC0sXDXHOurVmQo/Bw=;
        b=eqnByBSRZ94AQYRWOfoZUZL+IYsPkP2D0jQ1zNoljvTfCZJ5ZV5EMADisHuoNrqtmE
         IOCdaJ1KtcAv9zxC0y91Pwi1JqMr90kiSg+Cy/kFaYvabHQlitL0DlE2EjnTcTmEnm5h
         5erauz2RxbmJZXziRzoYzq5K+SWapFw8poY5/Ni5wC6KhmoWtjfEP9rYoGcgW7KPlh51
         Hpj7Tk2X0lrbwz2Pkt4/hEvfZzRx3U2Ay21LtFStmaMVyEBKPkMEKrgMvsDVCA95gkNB
         vPdX5dJvKdqoma3qoFgC0ozcRbwD2DmNW82eMXvFT+0T31K9FJtOEIm1H0anzf5Nw8bk
         dfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731091566; x=1731696366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oq7W5H+t/LruxWYJFi93XWxZ+SC0sXDXHOurVmQo/Bw=;
        b=p865HuuDhB9XO+hncvlJC1gglxYiLeRWuyb3+2eVzTfWSPKnhAMbyhezmFf//orSBg
         AooAozmOZNLYp/lS8cLSx2uZ5zDhm2cbpil3QLR7MjXwWj6bgGbjPMij8KC9ZR+1kveX
         DpuctzSJfByk2gPbYBZaX8tTPBMm5kJfudZR/Vwt8BbrPOYY3UrbnSB50L1bWUl3MI1e
         bG3AEse+6IOoPWiASvzKWsUj7v5FzHmwwPYsbq5o/19+3RVNbH1YVjBaHyntJmbdCGkQ
         aLpVUDeFiaYQ8Y295a1jPrZ3w4+AyhJbQkn4d+I60Wvmdiy2Tr1svmILPmI8eTyWh8FA
         hxCg==
X-Forwarded-Encrypted: i=1; AJvYcCUFwmPw8f3aNZh1R3qbhnUYhn1b/FYgtZE6kFxyxdRo+c3OhTRT2rVZvTPUpWWpdqWTgfTom/L1hogv3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJw+e2cvN+/wbu/wXtVvvO5hnVqZlpNdf+183Yw2TkdnuUyMfu
	Gg6ruIxdVqxlIBex3UwBvoobV3yM65l2ckI20U/W1LOlQfK3nukJu4ylzvOnxqlzUQ9FcfZUfbH
	TX6pAqpE1e3GADYEZX1tW4u4UvKlR9JmNzamk
X-Gm-Gg: ASbGncuNe7wj+QKTXxwqUEjJDde6L/iewz7tM6lDFUUWNWWsYY/1cjm6ANXlD3urL++
	6aqwbAI2yvKe21gbdf+p+nufC39Lk2A4r
X-Google-Smtp-Source: AGHT+IHdLRWHy0a2E8ArZqPLt9njQZotEfT+CpO+S5UTw1lpU681rHBzVlJvCzLHGs/O89svRJOnyjbXFrmZAfHjHVI=
X-Received: by 2002:a05:6e02:1c81:b0:3a6:f43d:a24e with SMTP id
 e9e14a558f8ab-3a6f8a06128mr98245ab.10.1731091565707; Fri, 08 Nov 2024
 10:46:05 -0800 (PST)
MIME-Version: 1.0
References: <20241017002520.59124-1-irogers@google.com> <20241017002520.59124-5-irogers@google.com>
 <Zy5Le-xn4gzQ2WLo@google.com> <CAP-5=fXe-gJ6pXwdTgGqScCR+mKS2FBfVDsbih7vL-1kPKAvaA@mail.gmail.com>
 <Zy5aoMnY2nupb7SX@google.com>
In-Reply-To: <Zy5aoMnY2nupb7SX@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 8 Nov 2024 10:45:54 -0800
Message-ID: <CAP-5=fW7m0AVVn42XK9s=RFmAs63mh4Mk5QehpLKLFMAGje+9A@mail.gmail.com>
Subject: Re: [PATCH v3 04/20] perf disasm: Add e_machine/e_flags to struct arch
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Changbin Du <changbin.du@huawei.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Yang Jihong <yangjihong@bytedance.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Atish Patra <atishp@rivosinc.com>, Shenlin Liang <liangshenlin@eswincomputing.com>, 
	Anup Patel <anup@brainfault.org>, Oliver Upton <oliver.upton@linux.dev>, 
	"Steinar H. Gunderson" <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_104607_765342_AEB3E0A6 
X-CRM114-Status: GOOD (  39.91  )
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

T24gRnJpLCBOb3YgOCwgMjAyNCBhdCAxMDozOOKAr0FNIE5hbWh5dW5nIEtpbSA8bmFtaHl1bmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIE5vdiAwOCwgMjAyNCBhdCAxMDoxOTo1MkFN
IC0wODAwLCBJYW4gUm9nZXJzIHdyb3RlOgo+ID4gT24gRnJpLCBOb3YgOCwgMjAyNCBhdCA5OjMz
4oCvQU0gTmFtaHl1bmcgS2ltIDxuYW1oeXVuZ0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+
ID4gT24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMDU6MjU6MDRQTSAtMDcwMCwgSWFuIFJvZ2VycyB3
cm90ZToKPiA+ID4gPiBDdXJyZW50bHkgZnVuY3Rpb25zIGxpa2UgZ2V0X2R3YXJmX3JlZ251bSBv
bmx5IHdvcmsgd2l0aCB0aGUgaG9zdAo+ID4gPiA+IGFyY2hpdGVjdHVyZS4gQ2FycnkgdGhlIGVs
ZiBtYWNoaW5lIGFuZCBmbGFncyBpbiBzdHJ1Y3QgYXJjaCBzbyB0aGF0Cj4gPiA+ID4gaW4gZGlz
YXNzZW1ibHkgdGhlc2UgY2FuIGJlIHVzZWQgdG8gYWxsb3cgY3Jvc3MgcGxhdGZvcm0gZGlzYXNz
ZW1ibHkuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJYW4gUm9nZXJzIDxpcm9nZXJz
QGdvb2dsZS5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIHRvb2xzL3BlcmYvYXJjaC9hcmMvYW5u
b3RhdGUvaW5zdHJ1Y3Rpb25zLmMgICAgICAgfCAyICsrCj4gPiA+ID4gIHRvb2xzL3BlcmYvYXJj
aC9hcm0vYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMgICAgICAgfCAyICsrCj4gPiA+ID4gIHRvb2xz
L3BlcmYvYXJjaC9hcm02NC9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYyAgICAgfCAyICsrCj4gPiA+
ID4gIHRvb2xzL3BlcmYvYXJjaC9jc2t5L2Fubm90YXRlL2luc3RydWN0aW9ucy5jICAgICAgfCA3
ICsrKysrKy0KPiA+ID4gPiAgdG9vbHMvcGVyZi9hcmNoL2xvb25nYXJjaC9hbm5vdGF0ZS9pbnN0
cnVjdGlvbnMuYyB8IDIgKysKPiA+ID4gPiAgdG9vbHMvcGVyZi9hcmNoL21pcHMvYW5ub3RhdGUv
aW5zdHJ1Y3Rpb25zLmMgICAgICB8IDIgKysKPiA+ID4gPiAgdG9vbHMvcGVyZi9hcmNoL3Bvd2Vy
cGMvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMgICB8IDIgKysKPiA+ID4gPiAgdG9vbHMvcGVyZi9h
cmNoL3Jpc2N2NjQvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMgICB8IDIgKysKPiA+ID4gPiAgdG9v
bHMvcGVyZi9hcmNoL3MzOTAvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMgICAgICB8IDIgKysKPiA+
ID4gPiAgdG9vbHMvcGVyZi9hcmNoL3NwYXJjL2Fubm90YXRlL2luc3RydWN0aW9ucy5jICAgICB8
IDIgKysKPiA+ID4gPiAgdG9vbHMvcGVyZi9hcmNoL3g4Ni9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMu
YyAgICAgICB8IDMgKystCj4gPiA+ID4gIHRvb2xzL3BlcmYvdXRpbC9kaXNhc20uaCAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCA0ICsrKysKPiA+ID4gPiAgMTIgZmlsZXMgY2hhbmdlZCwgMzAg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQg
YS90b29scy9wZXJmL2FyY2gvYXJjL2Fubm90YXRlL2luc3RydWN0aW9ucy5jIGIvdG9vbHMvcGVy
Zi9hcmNoL2FyYy9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYwo+ID4gPiA+IGluZGV4IDJmMDBlOTk1
YzdlMy4uZTU2MTk3NzBhMWFmIDEwMDY0NAo+ID4gPiA+IC0tLSBhL3Rvb2xzL3BlcmYvYXJjaC9h
cmMvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMKPiA+ID4gPiArKysgYi90b29scy9wZXJmL2FyY2gv
YXJjL2Fubm90YXRlL2luc3RydWN0aW9ucy5jCj4gPiA+ID4gQEAgLTUsNSArNSw3IEBAIHN0YXRp
YyBpbnQgYXJjX19hbm5vdGF0ZV9pbml0KHN0cnVjdCBhcmNoICphcmNoLCBjaGFyICpjcHVpZCBf
X21heWJlX3VudXNlZCkKPiA+ID4gPiAgewo+ID4gPiA+ICAgICAgIGFyY2gtPmluaXRpYWxpemVk
ID0gdHJ1ZTsKPiA+ID4gPiAgICAgICBhcmNoLT5vYmpkdW1wLmNvbW1lbnRfY2hhciA9ICc7JzsK
PiA+ID4gPiArICAgICBhcmNoLT5lX21hY2hpbmUgPSBFTV9BUkM7Cj4gPiA+ID4gKyAgICAgYXJj
aC0+ZV9mbGFncyA9IDA7Cj4gPiA+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiA+ID4gIH0KPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi9hcmNoL2FybS9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMu
YyBiL3Rvb2xzL3BlcmYvYXJjaC9hcm0vYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMKPiA+ID4gPiBp
bmRleCAyZmY2Y2VkZWI5YzUuLmNmOTFhNDMzNjJiMCAxMDA2NDQKPiA+ID4gPiAtLS0gYS90b29s
cy9wZXJmL2FyY2gvYXJtL2Fubm90YXRlL2luc3RydWN0aW9ucy5jCj4gPiA+ID4gKysrIGIvdG9v
bHMvcGVyZi9hcmNoL2FybS9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYwo+ID4gPiA+IEBAIC01Myw2
ICs1Myw4IEBAIHN0YXRpYyBpbnQgYXJtX19hbm5vdGF0ZV9pbml0KHN0cnVjdCBhcmNoICphcmNo
LCBjaGFyICpjcHVpZCBfX21heWJlX3VudXNlZCkKPiA+ID4gPiAgICAgICBhcmNoLT5hc3NvY2lh
dGVfaW5zdHJ1Y3Rpb25fb3BzICAgPSBhcm1fX2Fzc29jaWF0ZV9pbnN0cnVjdGlvbl9vcHM7Cj4g
PiA+ID4gICAgICAgYXJjaC0+b2JqZHVtcC5jb21tZW50X2NoYXIgICAgICAgID0gJzsnOwo+ID4g
PiA+ICAgICAgIGFyY2gtPm9iamR1bXAuc2tpcF9mdW5jdGlvbnNfY2hhciA9ICcrJzsKPiA+ID4g
PiArICAgICBhcmNoLT5lX21hY2hpbmUgPSBFTV9BUk07Cj4gPiA+ID4gKyAgICAgYXJjaC0+ZV9m
bGFncyA9IDA7Cj4gPiA+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiA+ID4KPiA+ID4gPiAgb3V0X2Zy
ZWVfY2FsbDoKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi9hcmNoL2FybTY0L2Fubm90
YXRlL2luc3RydWN0aW9ucy5jIGIvdG9vbHMvcGVyZi9hcmNoL2FybTY0L2Fubm90YXRlL2luc3Ry
dWN0aW9ucy5jCj4gPiA+ID4gaW5kZXggZjg2ZDlmNDc5OGJkLi5kNDY1ZDA5M2U3ZWIgMTAwNjQ0
Cj4gPiA+ID4gLS0tIGEvdG9vbHMvcGVyZi9hcmNoL2FybTY0L2Fubm90YXRlL2luc3RydWN0aW9u
cy5jCj4gPiA+ID4gKysrIGIvdG9vbHMvcGVyZi9hcmNoL2FybTY0L2Fubm90YXRlL2luc3RydWN0
aW9ucy5jCj4gPiA+ID4gQEAgLTExMyw2ICsxMTMsOCBAQCBzdGF0aWMgaW50IGFybTY0X19hbm5v
dGF0ZV9pbml0KHN0cnVjdCBhcmNoICphcmNoLCBjaGFyICpjcHVpZCBfX21heWJlX3VudXNlZCkK
PiA+ID4gPiAgICAgICBhcmNoLT5hc3NvY2lhdGVfaW5zdHJ1Y3Rpb25fb3BzICAgPSBhcm02NF9f
YXNzb2NpYXRlX2luc3RydWN0aW9uX29wczsKPiA+ID4gPiAgICAgICBhcmNoLT5vYmpkdW1wLmNv
bW1lbnRfY2hhciAgICAgICAgPSAnLyc7Cj4gPiA+ID4gICAgICAgYXJjaC0+b2JqZHVtcC5za2lw
X2Z1bmN0aW9uc19jaGFyID0gJysnOwo+ID4gPiA+ICsgICAgIGFyY2gtPmVfbWFjaGluZSA9IEVN
X0FBUkNINjQ7Cj4gPiA+ID4gKyAgICAgYXJjaC0+ZV9mbGFncyA9IDA7Cj4gPiA+ID4gICAgICAg
cmV0dXJuIDA7Cj4gPiA+ID4KPiA+ID4gPiAgb3V0X2ZyZWVfY2FsbDoKPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvcGVyZi9hcmNoL2Nza3kvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMgYi90b29s
cy9wZXJmL2FyY2gvY3NreS9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYwo+ID4gPiA+IGluZGV4IDUz
MzdiZmI3ZDVmYy4uMTQyNzAzMTFkMjE1IDEwMDY0NAo+ID4gPiA+IC0tLSBhL3Rvb2xzL3BlcmYv
YXJjaC9jc2t5L2Fubm90YXRlL2luc3RydWN0aW9ucy5jCj4gPiA+ID4gKysrIGIvdG9vbHMvcGVy
Zi9hcmNoL2Nza3kvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMKPiA+ID4gPiBAQCAtNDMsNiArNDMs
MTEgQEAgc3RhdGljIGludCBjc2t5X19hbm5vdGF0ZV9pbml0KHN0cnVjdCBhcmNoICphcmNoLCBj
aGFyICpjcHVpZCBfX21heWJlX3VudXNlZCkKPiA+ID4gPiAgICAgICBhcmNoLT5pbml0aWFsaXpl
ZCA9IHRydWU7Cj4gPiA+ID4gICAgICAgYXJjaC0+b2JqZHVtcC5jb21tZW50X2NoYXIgPSAnLyc7
Cj4gPiA+ID4gICAgICAgYXJjaC0+YXNzb2NpYXRlX2luc3RydWN0aW9uX29wcyA9IGNza3lfX2Fz
c29jaWF0ZV9pbnNfb3BzOwo+ID4gPiA+IC0KPiA+ID4gPiArICAgICBhcmNoLT5lX21hY2hpbmUg
PSBFTV9DU0tZOwo+ID4gPiA+ICsjaWYgZGVmaW5lZChfX0NTS1lBQklWMl9fKQo+ID4gPiA+ICsg
ICAgIGFyY2gtPmVfZmxhZ3MgPSBFRl9DU0tZX0FCSVYyOwo+ID4gPiA+ICsjZWxzZQo+ID4gPiA+
ICsgICAgIGFyY2gtPmVfZmxhZ3MgPSBFRl9DU0tZX0FCSVYxOwo+ID4gPiA+ICsjZW5kaWYKPiA+
ID4KPiA+ID4gQnkgbW92aW5nIHRoaXMgaW50byB0aGUgZ2VuZXJhbCBjb2RlLCBpdCBzaG91bGQg
dGFrZSBjYXJlIG9mIG9sZCBzeXN0ZW1zCj4gPiA+IHRoYXQgZG9lc24ndCBoYXZlIHRoZSBtYWNy
by4KPiA+ID4KPiA+ID4gICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gdXRpbC9kaXNhc20uYzoxMDk6
Cj4gPiA+ICAgL2xpbnV4L3Rvb2xzL3BlcmYvYXJjaC9jc2t5L2Fubm90YXRlL2luc3RydWN0aW9u
cy5jOiBJbiBmdW5jdGlvbiAnY3NreV9fYW5ub3RhdGVfaW5pdCc6Cj4gPiA+ICAgL2xpbnV4L3Rv
b2xzL3BlcmYvYXJjaC9jc2t5L2Fubm90YXRlL2luc3RydWN0aW9ucy5jOjUwOjI1OiBlcnJvcjog
J0VGX0NTS1lfQUJJVjEnIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+
ID4gPiAgICAgIDUwIHwgICAgICAgICBhcmNoLT5lX2ZsYWdzID0gRUZfQ1NLWV9BQklWMTsKPiA+
ID4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn4KPiA+ID4g
ICAvbGludXgvdG9vbHMvcGVyZi9hcmNoL2Nza3kvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmM6NTA6
MjU6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25j
ZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCj4gPgo+ID4gRUZfQ1NLWV9BQklWMSBp
cyBkZWZpbmVkIGluIGVsZi5oIGFuZCBoYXMgYmVlbiB0aGVyZSBhdCBsZWFzdCA1IHllYXJzIGlu
IGxpYmVsZjoKPiA+IGh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWVsZnV0aWxzLmdpdDth
PWNvbW1pdDtmPWxpYmVsZi9lbGYuaDtoPTljODI5NDJhZTczNTVhMzIyNmM1M2E5MmMyYzczYjMz
MTkzYzVlMzMKPiA+IEkgc3VzcGVjdGVkIHRoZSBpc3N1ZSBoZXJlIGlzIG1pc3NpbmcgZWxmLmgg
aW5jbHVkZSwgYnV0IHRoZSAuYyBmaWxlCj4gPiBpcyBpbmNsdWRlZCBpbiB0b29scy9wZXJmL3V0
aWwvZGlzYXNtLmMgYW5kIHRoYXQgbXVzdCBoYXZlIGEKPiA+IHRyYW5zaXRpdmUgZGVwZW5kZW5j
eSBnaXZlbiBvdGhlciB0aGluZ3MgYXJlIGJ1aWxkaW5nLiBEbyB5b3Ugd2FudCBtZQo+ID4gdG8g
c2VuZCBhIHBhdGNoIG1ha2luZyB0aGlzIGNvbmRpdGlvbmFsIHdpdGggZXh0cmEgI2lmZGVmcyBv
ciByZS1zZW5kCj4gPiB0aGUgc2VyaWVzPwo+Cj4gWWVhaCwgaXQncyB1bmZvcnR1bmF0ZSBidXQg
SSB0aGluayB3ZSBjYW4gaGF2ZSBhIHNtYWxsIGluY3JlbWVudGFsIGRpZmYKPiBoZXJlIHRvIGRl
ZmluZSB0aGVtIGlmIGl0J3Mgbm90IHRoZXJlLiAgVGhlbiBJJ2xsIHNxdWFzaCBpdCB0byB0aGUK
PiBwYXRjaC4KClRoYW5rcywgc2d0bS4gQ291bGQgeW91IGFsc28gZXhwbGljaXRseSBpbmNsdWRl
IGVsZi5oIGludG8gZGlzYXNtLmMKcmF0aGVyIHRoYW4gZGVwZW5kaW5nIG9uIHRoZSB0cmFuc2l0
aXZlICNpbmNsdWRlPyBUaGVyZSdzIG9idmlvdXNseQp0ZWNoIGRlYnQgdG8gbm90IGhhdmUgLmMg
ZmlsZXMgaW5jbHVkaW5nIGVhY2ggb3RoZXIgdG8gd29yayBhcm91bmQgdGhlCmJ1aWxkIHN5c3Rl
bS4KCklhbgoKPiA+Cj4gPiA+IEFsc28sIEkgdGhpbmsgX19DU0tZQUJJVjJfXyBpcyBkZWZpbmVk
IG9ubHkgd2hlbiB0aGUgaG9zdCBpcyBjc2t5LiAgU28KPiA+ID4gaXQnbGwgdXNlIEFCSSB2MSBv
biBjcm9zcyBlbnYuICBJJ20gbm90IHN1cmUgaWYgaXQncyBhIHByb2JsZW0uICBXZSBtYXkKPiA+
ID4gbmVlZCB0byBzYXZlIHRoZSBBQkkgc29tZXdoZXJlIGluIHRoZSBtZXRhZGF0YSBsYXRlci4K
PiA+Cj4gPiBBZ3JlZWQuIEluIGdlbmVyYWwgd2Ugc2hvdWxkIHJlYWQgZV9tYWNoaW5lIGFuZCBl
X2ZsYWdzIGZyb20gdGhlIEVMRgo+ID4gZmlsZSwgc28gSSdtIG5vdCBzdXJlIG5ldyBtZXRhZGF0
YSBpcyBuZWVkZWQuIFRoaXMgcGF0Y2ggaXMgdHJ5aW5nIHRvCj4gPiBsYXkgZ3JvdW5kd29yayBm
b3IgdGhhdC4KPgo+IEkgdW5kZXJzdGFuZCB0aGF0LiAgWWVhaCBpdCBzaG91bGQgY29tZSBmcm9t
IHRoZSBiaW5hcnkuCj4KPiBUaGFua3MsCj4gTmFtaHl1bmcKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
