Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0B3C49EA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 04:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rK2fG1HjLMLLDrCvulGwcywVCECyaLQQvVScYe0IijI=; b=Boh+GwMxdfxYVi
	WUxLBjwc1AaB/cG2wXTWa+cVUK3RzRWbXBLV/ktzEAf4jcTnAIK/VINCgHHrIFuuXGT7VFNWQuNW1
	ryjjZ+bDmZ0f+XexheQIrL6RYzaUNZuutCbfPDRRrVBLA9/mux1/nTtsdhnZbbDeiq+Y+rVJEW2+F
	rE2VB28eIW4kqqKNnpyJ6FpRM8H1oU53cyYHMTJKlI9GcSJ9eEXOtEyVSA+TMIwpk7CMVADN9FcEy
	vfVUIAsT8+nHZfT98MUyy5dibe1mC7kDqyrKnE4goFGoMK7+BTIylezJ2ct1+bq+XztrUTS7jNTAU
	ivVCG12/EOqaL0R2gktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbBSe-00000000RUy-3T9v;
	Tue, 06 Aug 2024 04:06:12 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbBS7-00000000RPs-167X
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 04:05:41 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1fd7509397bso144605ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 21:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722917138; x=1723521938; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksgVEwS2g27EUf8mDdFHEkzlF4wPGczulQ17tbgdkZ0=;
        b=yuAbj0C3bKI9xReHKop5hoAa+0ePsYg0fwmUIHmg8aUWLY5pzLUHY3eLgYTzPvBJrn
         1kiMAS/M6Dk/z6r9hzfi4qFOo80/G0Kyl5REu3hS1v6bxTpXvT3H6+BHxjwJ+Zth+/lK
         uU6yBw5gRgBjUmEf80KJr6P++B8rLv9XXFMyQlluUlzMsG+oBcmYDzNJpKyL5Km/2mYE
         HhrDzKrYNrKY55UrdvipuIQ/qU8sKwWoS2sPrwh4nWcOb/oSS0lSGjgjmog16oOxcgmD
         +q4fHrbUw1Pqy/sermn5lIS/ZbF6AlCks0s7/6fKPXz+4Y5RYqHqNUPRQE3KgQNuY3b8
         7m1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722917138; x=1723521938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksgVEwS2g27EUf8mDdFHEkzlF4wPGczulQ17tbgdkZ0=;
        b=LwMqaU632nDkRD4OIoUAT9kvHQ9zL7L/C7DBgBBz1kHy3pesX36rkxuRLRbnuiIvEk
         W/ni6gavdx3hkkZ1VG9LOYnjijYXkY/cD1WfyjB1ky7Elrksx4sdtyHRlRQkVqz7luzg
         ng3hv1Hvx/lPKcZXdezRyyXDilqc6PnVjXwQC6tMdCrhvlFbF5cyzWU/9jqcMSiQBjT7
         Oa26wJ22txza+kTsJSqfBhH3xSDA4U7EeCjrV9YQCeBxjXVZC0MdgfluaAiaJ3nzlrSa
         I79B2siDApDPFqRh0KVgcHjXEYHHjcRfn47VgMqRBbP+neGSdYic5VcMU/D71cmX6RVa
         Zcdg==
X-Forwarded-Encrypted: i=1; AJvYcCU9TT8c/M5hIUj9AbDikJe7R0o04gK3jbu3BgWpnilb3PI53N79YZQmNFQZ5jwBYHytso7VGmu6jlhp9C6n+OY0KXkmedcPkyPjaQl/GiGl
X-Gm-Message-State: AOJu0YyQeQ3vvrF2Tr+YrvEEzzRIBJ4MkJqcczWck/3lVcBy69KZ0oeg
	0bZztMHgDxpJrhS1JutFPBouIUeiB9apqpkEzHEe9w7B9Ve+nQlhSqyofbAqpuw5/bZNbCx9mPY
	3srgH047xvCGfPHPj4WJWDypmECmhlxpH8lNx
X-Google-Smtp-Source: AGHT+IEDrxvK9R3CWrSgJD6d2CzZl94gIXQbXiLVxjCNAOq9smV8d5JjmmD4IsrOF+xZ+lcRwE0maLH4oISqj8kMB0o=
X-Received: by 2002:a17:902:fc47:b0:1fb:19fb:a1f0 with SMTP id
 d9443c01a7336-2007666c84cmr1815415ad.4.1722917138011; Mon, 05 Aug 2024
 21:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240805194424.597244-1-irogers@google.com> <20240805194424.597244-4-irogers@google.com>
 <CAPqJEFpiy307B4OBHK4WJGjgbVm_woUrdZ+Vy_LSdQ=ECqZX-Q@mail.gmail.com>
In-Reply-To: <CAPqJEFpiy307B4OBHK4WJGjgbVm_woUrdZ+Vy_LSdQ=ECqZX-Q@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 5 Aug 2024 21:05:26 -0700
Message-ID: <CAP-5=fWDmdAkJSoncedZTaSgFwG+p3--jywDj9krnXSfkhh6dQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] perf pmu-events: Remove duplicated riscv firmware event
To: Eric Lin <eric.lin@sifive.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, Charles Ci-Jyun Wu <dminus@andestech.com>, 
	Locus Wei-Han Chen <locus84@andestech.com>, Atish Patra <atishp@rivosinc.com>, 
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Jing Zhang <renyu.zj@linux.alibaba.com>, Xu Yang <xu.yang_2@nxp.com>, 
	Sandipan Das <sandipan.das@amd.com>, Guilherme Amadio <amadio@gentoo.org>, 
	Changbin Du <changbin.du@huawei.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, vincent.chen@sifive.com, 
	greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_210539_599184_698FE83D 
X-CRM114-Status: GOOD (  10.88  )
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

T24gTW9uLCBBdWcgNSwgMjAyNCBhdCA4OjU04oCvUE0gRXJpYyBMaW4gPGVyaWMubGluQHNpZml2
ZS5jb20+IHdyb3RlOgo+Cj4gSGkgSWFuLAo+Cj4gSSd2ZSBzZW50IGEgcGF0Y2ggdG8gZml4IGl0
IGFuZCB0aGUgcGF0Y2ggYWxyZWFkeSBtZXJnZWQuIFRoYW5rcy4KPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyNDA3MTkxMTUwMTguMjczNTYtMS1lcmljLmxpbkBzaWZpdmUuY29tLwoK
SGkgRXJpYy9Bcm5hbGRvLAoKUmlnaHQsIEkgYWxyZWFkeSBjb21tZW50ZWQgdGhpcyBzaG91bGQg
aGF2ZSBnb25lIHRocm91Z2ggdGhlCnBlcmYtdG9vbHMtbmV4dCB0cmVlOgpodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvQ0FQLTU9ZlYzTlhrS3NDUDFXSDBfcUxSTnBMK1d1UDhTM2gxPWNIYVVN
SDVNRmtWSFFnQG1haWwuZ21haWwuY29tLwpBcm5hbGRvLCBwbGVhc2UgdGFrZSBFcmljJ3MgcGF0
Y2ggaW4gcHJlZmVyZW5jZSB0byB0aGlzIG9uZS4KClRoYW5rcywKSWFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
