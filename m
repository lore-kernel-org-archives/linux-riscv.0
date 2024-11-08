Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D337D64074
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 18:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuMAxL3esmLhgcbhtB0dvclW3exrYtagwj3cjSWl/+k=; b=kzWvYc0L/gpWAN
	XE05op335hlopgJIs3gjM8LNzv3CZpQg9WGvYBqGoIsJsq0BhBn4EZ0Ua7M+cFcW+pQ05Xw59NmjU
	Y6cvQxsWdBpySWNUqs7QF4zNT+b1aXODeXK8rDQilvZuyBQpVIZZ/8AbcVf6YV0IbJibJmFUSEBuq
	ORbOqSgMqCv8knC4pa0uJJ8SOqAw0mmZYNAR9J7RiO1kvRpi7RPXWQ+H+ETjIp1cw+otU88ag/ork
	xCq9cshz81wu19pFwIrf4a2bdc2/Jc+QKoqrVHQU0Yt0PVOd2aLjTrJ/iLnwzT4AB9QrHDY+ChnqT
	GQVxlxFpmnIFp8GCCHsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Tab-0000000Ba94-33S9;
	Fri, 08 Nov 2024 18:20:09 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9TaY-0000000Ba84-19kT
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 18:20:07 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20c8ac50b79so6325ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 10:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731090004; x=1731694804; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nf7MfvQHFHsMilMOcrRu8oE+bBUT3BnfeKEv0/Bnz2U=;
        b=MgCQW3qokMXXz6s7H3sTwe5yDUA+vCutFyTQhrZWvFRdCNH3NPLRRSYTCioxNeL/31
         xlZ7T4UHq0Jw2aJYqaLjnRSJ9tde0sBWFZeldt/8rI5BUhDmozHqyjBhyuvtSlo6Wx69
         /6Ig7oGhimf1+5wqRx0vK5f1r3ErJZUVldyrVIWkeY0B3xHWq5QPPqt8aFZfTw3NqUe9
         RRtLce+HjH/LMVQ9CND+PWAFiKh15+ECU52kXIisq9GDtiVSaK4+T9fFQUp/lWI/RqsG
         36GsfxYuAKROVM9L19vduxqZr1xn/V+fKVxY2ZZN8uPunSA0MDj6vKY3/jCxhj9dMsGD
         Kv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731090004; x=1731694804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nf7MfvQHFHsMilMOcrRu8oE+bBUT3BnfeKEv0/Bnz2U=;
        b=LoDNUfuWfn1Iqtps04sVz8HjBCv7HUzCI9ENXmxrOUWmg5yJiRJoRjZX9M23HeNzx7
         7eQsX8mfvNGqQrKUCfR+eMiaUF0ZFlP5TlkM4f87IH8H1m7ZbabBjwXbqg++qwRXu4O7
         HT98Q0O+W7VIafA3ut10IZd6XGB5oP9OCHRR9Ci2DOIXDXq60jszo/g73EKiPw+0+V/G
         UPYrUYcHMXvIv806NDlSmHotfVvhYEDDkEDj2SFSJk/visYaAQ37VSDDbX/C6eAr2xm1
         2i0mHmhwAieNRRbzaUdRrnv3lp0YpTZqZcTYYIhQbpRJmeTVJ9KwBrgHIi275pg7EFel
         +mcw==
X-Forwarded-Encrypted: i=1; AJvYcCVy7ro3GBixEB++m2Nb5OsjnkCuzvoiMGJB2QQc1+VrXai93oi0bRo+JGhgg1JY8fyloMzt/ZuAGFbtWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWxZIz8Fni+X6rumjZ+nwmhcvmUJBHusWbWtDiKZCDJ147ae6X
	GAmIkPLWbLJkRXjwaemZYNtVU4g8tpRF6oeWMYYWxOjfZ01NcQscFe4sJg3Cb4l7JGZJwy/dxli
	HKO2ze1kwaE4BqUsgcswnAv8NkLpW3MM8/E8n
X-Gm-Gg: ASbGncu3aFOIOvzYhHem7lR5IToDcFT0i6+Q6gq840xdgG1qRWaOPGJrY5d3DbKHih6
	UGWpSZenSgG5goytLGrSoHLGIxZEf66NQ
X-Google-Smtp-Source: AGHT+IGAGxygO8zIMuBBzlLrISaHhzYu5CrxNemIriyDIaZe+XR//zXcE6s13MhITP3HJRDsgVoeguyaiFUqTkwRFOs=
X-Received: by 2002:a17:902:d4c7:b0:205:968b:31e9 with SMTP id
 d9443c01a7336-211748f482dmr6592465ad.1.1731090004012; Fri, 08 Nov 2024
 10:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20241017002520.59124-1-irogers@google.com> <20241017002520.59124-5-irogers@google.com>
 <Zy5Le-xn4gzQ2WLo@google.com>
In-Reply-To: <Zy5Le-xn4gzQ2WLo@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 8 Nov 2024 10:19:52 -0800
Message-ID: <CAP-5=fXe-gJ6pXwdTgGqScCR+mKS2FBfVDsbih7vL-1kPKAvaA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241108_102006_352547_3F7926DB 
X-CRM114-Status: GOOD (  29.60  )
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

T24gRnJpLCBOb3YgOCwgMjAyNCBhdCA5OjMz4oCvQU0gTmFtaHl1bmcgS2ltIDxuYW1oeXVuZ0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDE2LCAyMDI0IGF0IDA1OjI1OjA0UE0g
LTA3MDAsIElhbiBSb2dlcnMgd3JvdGU6Cj4gPiBDdXJyZW50bHkgZnVuY3Rpb25zIGxpa2UgZ2V0
X2R3YXJmX3JlZ251bSBvbmx5IHdvcmsgd2l0aCB0aGUgaG9zdAo+ID4gYXJjaGl0ZWN0dXJlLiBD
YXJyeSB0aGUgZWxmIG1hY2hpbmUgYW5kIGZsYWdzIGluIHN0cnVjdCBhcmNoIHNvIHRoYXQKPiA+
IGluIGRpc2Fzc2VtYmx5IHRoZXNlIGNhbiBiZSB1c2VkIHRvIGFsbG93IGNyb3NzIHBsYXRmb3Jt
IGRpc2Fzc2VtYmx5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IElhbiBSb2dlcnMgPGlyb2dlcnNA
Z29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gIHRvb2xzL3BlcmYvYXJjaC9hcmMvYW5ub3RhdGUvaW5z
dHJ1Y3Rpb25zLmMgICAgICAgfCAyICsrCj4gPiAgdG9vbHMvcGVyZi9hcmNoL2FybS9hbm5vdGF0
ZS9pbnN0cnVjdGlvbnMuYyAgICAgICB8IDIgKysKPiA+ICB0b29scy9wZXJmL2FyY2gvYXJtNjQv
YW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMgICAgIHwgMiArKwo+ID4gIHRvb2xzL3BlcmYvYXJjaC9j
c2t5L2Fubm90YXRlL2luc3RydWN0aW9ucy5jICAgICAgfCA3ICsrKysrKy0KPiA+ICB0b29scy9w
ZXJmL2FyY2gvbG9vbmdhcmNoL2Fubm90YXRlL2luc3RydWN0aW9ucy5jIHwgMiArKwo+ID4gIHRv
b2xzL3BlcmYvYXJjaC9taXBzL2Fubm90YXRlL2luc3RydWN0aW9ucy5jICAgICAgfCAyICsrCj4g
PiAgdG9vbHMvcGVyZi9hcmNoL3Bvd2VycGMvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMgICB8IDIg
KysKPiA+ICB0b29scy9wZXJmL2FyY2gvcmlzY3Y2NC9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYyAg
IHwgMiArKwo+ID4gIHRvb2xzL3BlcmYvYXJjaC9zMzkwL2Fubm90YXRlL2luc3RydWN0aW9ucy5j
ICAgICAgfCAyICsrCj4gPiAgdG9vbHMvcGVyZi9hcmNoL3NwYXJjL2Fubm90YXRlL2luc3RydWN0
aW9ucy5jICAgICB8IDIgKysKPiA+ICB0b29scy9wZXJmL2FyY2gveDg2L2Fubm90YXRlL2luc3Ry
dWN0aW9ucy5jICAgICAgIHwgMyArKy0KPiA+ICB0b29scy9wZXJmL3V0aWwvZGlzYXNtLmggICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgNCArKysrCj4gPiAgMTIgZmlsZXMgY2hhbmdlZCwgMzAg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
cGVyZi9hcmNoL2FyYy9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYyBiL3Rvb2xzL3BlcmYvYXJjaC9h
cmMvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMKPiA+IGluZGV4IDJmMDBlOTk1YzdlMy4uZTU2MTk3
NzBhMWFmIDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvcGVyZi9hcmNoL2FyYy9hbm5vdGF0ZS9pbnN0
cnVjdGlvbnMuYwo+ID4gKysrIGIvdG9vbHMvcGVyZi9hcmNoL2FyYy9hbm5vdGF0ZS9pbnN0cnVj
dGlvbnMuYwo+ID4gQEAgLTUsNSArNSw3IEBAIHN0YXRpYyBpbnQgYXJjX19hbm5vdGF0ZV9pbml0
KHN0cnVjdCBhcmNoICphcmNoLCBjaGFyICpjcHVpZCBfX21heWJlX3VudXNlZCkKPiA+ICB7Cj4g
PiAgICAgICBhcmNoLT5pbml0aWFsaXplZCA9IHRydWU7Cj4gPiAgICAgICBhcmNoLT5vYmpkdW1w
LmNvbW1lbnRfY2hhciA9ICc7JzsKPiA+ICsgICAgIGFyY2gtPmVfbWFjaGluZSA9IEVNX0FSQzsK
PiA+ICsgICAgIGFyY2gtPmVfZmxhZ3MgPSAwOwo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+
ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvYXJjaC9hcm0vYW5ub3RhdGUvaW5zdHJ1Y3Rpb25z
LmMgYi90b29scy9wZXJmL2FyY2gvYXJtL2Fubm90YXRlL2luc3RydWN0aW9ucy5jCj4gPiBpbmRl
eCAyZmY2Y2VkZWI5YzUuLmNmOTFhNDMzNjJiMCAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3BlcmYv
YXJjaC9hcm0vYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMKPiA+ICsrKyBiL3Rvb2xzL3BlcmYvYXJj
aC9hcm0vYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMKPiA+IEBAIC01Myw2ICs1Myw4IEBAIHN0YXRp
YyBpbnQgYXJtX19hbm5vdGF0ZV9pbml0KHN0cnVjdCBhcmNoICphcmNoLCBjaGFyICpjcHVpZCBf
X21heWJlX3VudXNlZCkKPiA+ICAgICAgIGFyY2gtPmFzc29jaWF0ZV9pbnN0cnVjdGlvbl9vcHMg
ICA9IGFybV9fYXNzb2NpYXRlX2luc3RydWN0aW9uX29wczsKPiA+ICAgICAgIGFyY2gtPm9iamR1
bXAuY29tbWVudF9jaGFyICAgICAgICA9ICc7JzsKPiA+ICAgICAgIGFyY2gtPm9iamR1bXAuc2tp
cF9mdW5jdGlvbnNfY2hhciA9ICcrJzsKPiA+ICsgICAgIGFyY2gtPmVfbWFjaGluZSA9IEVNX0FS
TTsKPiA+ICsgICAgIGFyY2gtPmVfZmxhZ3MgPSAwOwo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPgo+
ID4gIG91dF9mcmVlX2NhbGw6Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi9hcmNoL2FybTY0
L2Fubm90YXRlL2luc3RydWN0aW9ucy5jIGIvdG9vbHMvcGVyZi9hcmNoL2FybTY0L2Fubm90YXRl
L2luc3RydWN0aW9ucy5jCj4gPiBpbmRleCBmODZkOWY0Nzk4YmQuLmQ0NjVkMDkzZTdlYiAxMDA2
NDQKPiA+IC0tLSBhL3Rvb2xzL3BlcmYvYXJjaC9hcm02NC9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMu
Ywo+ID4gKysrIGIvdG9vbHMvcGVyZi9hcmNoL2FybTY0L2Fubm90YXRlL2luc3RydWN0aW9ucy5j
Cj4gPiBAQCAtMTEzLDYgKzExMyw4IEBAIHN0YXRpYyBpbnQgYXJtNjRfX2Fubm90YXRlX2luaXQo
c3RydWN0IGFyY2ggKmFyY2gsIGNoYXIgKmNwdWlkIF9fbWF5YmVfdW51c2VkKQo+ID4gICAgICAg
YXJjaC0+YXNzb2NpYXRlX2luc3RydWN0aW9uX29wcyAgID0gYXJtNjRfX2Fzc29jaWF0ZV9pbnN0
cnVjdGlvbl9vcHM7Cj4gPiAgICAgICBhcmNoLT5vYmpkdW1wLmNvbW1lbnRfY2hhciAgICAgICAg
PSAnLyc7Cj4gPiAgICAgICBhcmNoLT5vYmpkdW1wLnNraXBfZnVuY3Rpb25zX2NoYXIgPSAnKyc7
Cj4gPiArICAgICBhcmNoLT5lX21hY2hpbmUgPSBFTV9BQVJDSDY0Owo+ID4gKyAgICAgYXJjaC0+
ZV9mbGFncyA9IDA7Cj4gPiAgICAgICByZXR1cm4gMDsKPiA+Cj4gPiAgb3V0X2ZyZWVfY2FsbDoK
PiA+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL2FyY2gvY3NreS9hbm5vdGF0ZS9pbnN0cnVjdGlv
bnMuYyBiL3Rvb2xzL3BlcmYvYXJjaC9jc2t5L2Fubm90YXRlL2luc3RydWN0aW9ucy5jCj4gPiBp
bmRleCA1MzM3YmZiN2Q1ZmMuLjE0MjcwMzExZDIxNSAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3Bl
cmYvYXJjaC9jc2t5L2Fubm90YXRlL2luc3RydWN0aW9ucy5jCj4gPiArKysgYi90b29scy9wZXJm
L2FyY2gvY3NreS9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYwo+ID4gQEAgLTQzLDYgKzQzLDExIEBA
IHN0YXRpYyBpbnQgY3NreV9fYW5ub3RhdGVfaW5pdChzdHJ1Y3QgYXJjaCAqYXJjaCwgY2hhciAq
Y3B1aWQgX19tYXliZV91bnVzZWQpCj4gPiAgICAgICBhcmNoLT5pbml0aWFsaXplZCA9IHRydWU7
Cj4gPiAgICAgICBhcmNoLT5vYmpkdW1wLmNvbW1lbnRfY2hhciA9ICcvJzsKPiA+ICAgICAgIGFy
Y2gtPmFzc29jaWF0ZV9pbnN0cnVjdGlvbl9vcHMgPSBjc2t5X19hc3NvY2lhdGVfaW5zX29wczsK
PiA+IC0KPiA+ICsgICAgIGFyY2gtPmVfbWFjaGluZSA9IEVNX0NTS1k7Cj4gPiArI2lmIGRlZmlu
ZWQoX19DU0tZQUJJVjJfXykKPiA+ICsgICAgIGFyY2gtPmVfZmxhZ3MgPSBFRl9DU0tZX0FCSVYy
Owo+ID4gKyNlbHNlCj4gPiArICAgICBhcmNoLT5lX2ZsYWdzID0gRUZfQ1NLWV9BQklWMTsKPiA+
ICsjZW5kaWYKPgo+IEJ5IG1vdmluZyB0aGlzIGludG8gdGhlIGdlbmVyYWwgY29kZSwgaXQgc2hv
dWxkIHRha2UgY2FyZSBvZiBvbGQgc3lzdGVtcwo+IHRoYXQgZG9lc24ndCBoYXZlIHRoZSBtYWNy
by4KPgo+ICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHV0aWwvZGlzYXNtLmM6MTA5Ogo+ICAgL2xp
bnV4L3Rvb2xzL3BlcmYvYXJjaC9jc2t5L2Fubm90YXRlL2luc3RydWN0aW9ucy5jOiBJbiBmdW5j
dGlvbiAnY3NreV9fYW5ub3RhdGVfaW5pdCc6Cj4gICAvbGludXgvdG9vbHMvcGVyZi9hcmNoL2Nz
a3kvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmM6NTA6MjU6IGVycm9yOiAnRUZfQ1NLWV9BQklWMScg
dW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCj4gICAgICA1MCB8ICAgICAg
ICAgYXJjaC0+ZV9mbGFncyA9IEVGX0NTS1lfQUJJVjE7Cj4gICAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn4KPiAgIC9saW51eC90b29scy9wZXJmL2FyY2gvY3Nr
eS9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYzo1MDoyNTogbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlk
ZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVh
cnMgaW4KCkVGX0NTS1lfQUJJVjEgaXMgZGVmaW5lZCBpbiBlbGYuaCBhbmQgaGFzIGJlZW4gdGhl
cmUgYXQgbGVhc3QgNSB5ZWFycyBpbiBsaWJlbGY6Cmh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0
Lz9wPWVsZnV0aWxzLmdpdDthPWNvbW1pdDtmPWxpYmVsZi9lbGYuaDtoPTljODI5NDJhZTczNTVh
MzIyNmM1M2E5MmMyYzczYjMzMTkzYzVlMzMKSSBzdXNwZWN0ZWQgdGhlIGlzc3VlIGhlcmUgaXMg
bWlzc2luZyBlbGYuaCBpbmNsdWRlLCBidXQgdGhlIC5jIGZpbGUKaXMgaW5jbHVkZWQgaW4gdG9v
bHMvcGVyZi91dGlsL2Rpc2FzbS5jIGFuZCB0aGF0IG11c3QgaGF2ZSBhCnRyYW5zaXRpdmUgZGVw
ZW5kZW5jeSBnaXZlbiBvdGhlciB0aGluZ3MgYXJlIGJ1aWxkaW5nLiBEbyB5b3Ugd2FudCBtZQp0
byBzZW5kIGEgcGF0Y2ggbWFraW5nIHRoaXMgY29uZGl0aW9uYWwgd2l0aCBleHRyYSAjaWZkZWZz
IG9yIHJlLXNlbmQKdGhlIHNlcmllcz8KCj4gQWxzbywgSSB0aGluayBfX0NTS1lBQklWMl9fIGlz
IGRlZmluZWQgb25seSB3aGVuIHRoZSBob3N0IGlzIGNza3kuICBTbwo+IGl0J2xsIHVzZSBBQkkg
djEgb24gY3Jvc3MgZW52LiAgSSdtIG5vdCBzdXJlIGlmIGl0J3MgYSBwcm9ibGVtLiAgV2UgbWF5
Cj4gbmVlZCB0byBzYXZlIHRoZSBBQkkgc29tZXdoZXJlIGluIHRoZSBtZXRhZGF0YSBsYXRlci4K
CkFncmVlZC4gSW4gZ2VuZXJhbCB3ZSBzaG91bGQgcmVhZCBlX21hY2hpbmUgYW5kIGVfZmxhZ3Mg
ZnJvbSB0aGUgRUxGCmZpbGUsIHNvIEknbSBub3Qgc3VyZSBuZXcgbWV0YWRhdGEgaXMgbmVlZGVk
LiBUaGlzIHBhdGNoIGlzIHRyeWluZyB0bwpsYXkgZ3JvdW5kd29yayBmb3IgdGhhdC4KClRoYW5r
cywKSWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
