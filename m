Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B19C41513
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jul 2023 07:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aeg96w7cNcAt53/TIWYBMo+5eTm8EAtH9hXbBbwbXMg=; b=iXa4Ar9RcvVpli
	IqjH923rv2PPnbA3m3b8634Vl0JaxAH3qLRss08ELZ9+kabjPftNJ2SJ435KqCsnLdqGQvPgsfbs9
	EK/xjcvY6V8rjy1aCvLD8l+erf8WpbZb0XZ0dGDa8YAlFY51UlWWQkHg5s8RNgRzt3DuIqhSuEQio
	kTvHZ5ck86LQqnKUz5jpkeA9b2DUTj8D6j656iNGIbf8TmcuHSfPnuY6i5Y7Yfqt2yHEaLiannVtq
	eiLdD+NeZgvM2XJtovnviRtoawDYXZYeyml4tOpkVcza1RtCffZ/wWC1DzQpZRb71RWwOUXeDbiSr
	aT5IJaTA6k3uwSF4atRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPeWy-006dyq-10;
	Sat, 29 Jul 2023 07:38:28 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPeWv-006dxy-0Q
	for linux-riscv@lists.infradead.org;
	Sat, 29 Jul 2023 07:38:26 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-991da766865so404160366b.0
        for <linux-riscv@lists.infradead.org>; Sat, 29 Jul 2023 00:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690616301; x=1691221101;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IYmWtjCeCkbkXYXMidyXsHWo/uzc6Q0z95DnXsdb6Jk=;
        b=Ut1CWQVuoMLWFKzhCEeRWNrfILigN3hwnJXELqS2Tsfgnn3fFk2TtGyJAzjAj5wGEA
         sNipHCgNMxUMrgl7nescH6w++92Hb6aQiDANbCUKSWm8nzmINfUaAvlXNQcLqjtL2I3+
         enz93UK0DlVK8+cta6KaXLupiTePyrO5Hriwxh8lFtelzsB2raxvmYI1/RkfKtyzsB6x
         xWlmXhc0SpGkcPfWHr9tectW+YjxDC3M3yxfNMFziU7BBL7nHRpDeLc1luZT8v2fPWgQ
         yrYMEYjOMuO3tiMBJmnqpRaJ4UxvaR5S6If5xytfRSueIvZvYxd/kgMfYtBaZ429//Dn
         LkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690616301; x=1691221101;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IYmWtjCeCkbkXYXMidyXsHWo/uzc6Q0z95DnXsdb6Jk=;
        b=VqSh+fiVjGn2iz3iWGBB/Zcmd3jYKutqDwUF6yjF9hjDfG3ienz0tMd4hwe5/8s40i
         0KzLp4gLImZekpbbSaFhEjYLNxJuy/INKbCxTtOnXCjTjBjBJrzazxBi1tkyDz8HSVaI
         C21bSos6VYN2glZM5JpA2wln7PusNNtev1j0le2aFI3+YOrwx1fXi/TFFElO08H83tJ6
         7gbIBmQ/T+ff6n3rywAQKVngZcc1GzrmdvKXj+4nTDEm+I5nrRTphlgTK/9BPfR2iLw/
         NwE6ozBePwH2A1PSw4JgjKLARCM/BVYpTmgp5jPEkW480IFwNQOv0WvgbPpGXoHOQgX7
         e45g==
X-Gm-Message-State: ABy/qLY6KNximiwYadEQ2N9ktkFx/VaDWRPpdHCeRhegOwk6xFC/+sZe
	zhRiBNU5hSg6GfNWWm6q9SWZmg==
X-Google-Smtp-Source: APBJJlE05iU3+hYWOPGNmt1tk5T+oJvM8YCFPE9dtxhtPAlwF0v+PGLvzacP+3sj+ZuHwVpYnCzI/w==
X-Received: by 2002:a17:906:74d6:b0:99b:e03b:3968 with SMTP id z22-20020a17090674d600b0099be03b3968mr1356267ejl.64.1690616301218;
        Sat, 29 Jul 2023 00:38:21 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id kk9-20020a170907766900b00982cfe1fe5dsm3000715ejc.65.2023.07.29.00.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 00:38:20 -0700 (PDT)
Date: Sat, 29 Jul 2023 09:38:19 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ian Rogers <irogers@google.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	=?utf-8?B?UsOpbWk=?= Denis-Courmont <remi@remlab.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 10/10] perf: tests: Adapt mmap-basic.c for riscv
Message-ID: <20230729-b5ec43a48d67caf13025fafe@orel>
References: <20230727141428.962286-1-alexghiti@rivosinc.com>
 <20230727141428.962286-11-alexghiti@rivosinc.com>
 <CAP-5=fXvqJk9hA51pDSXodEWSP4DzN+RJ1scpyzJOrxk2w5kjg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fXvqJk9hA51pDSXodEWSP4DzN+RJ1scpyzJOrxk2w5kjg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230729_003825_177936_D4317EB2 
X-CRM114-Status: GOOD (  19.66  )
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

T24gRnJpLCBKdWwgMjgsIDIwMjMgYXQgMTA6NTQ6MDJBTSAtMDcwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBUaHUsIEp1bCAyNywgMjAyMyBhdCA3OjMw4oCvQU0gQWxleGFuZHJlIEdoaXRpIDxh
bGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPiByaXNjdiBub3cgc3VwcG9ydHMg
bW1hcGluZyBoYXJkd2FyZSBjb3VudGVycyB0byB1c2Vyc3BhY2Ugc28gYWRhcHQgdGhlIHRlc3QK
PiA+IHRvIHJ1biBvbiB0aGlzIGFyY2hpdGVjdHVyZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gPiBSZXZpZXdlZC1ieTog
QW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBB
dGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4gIHRvb2xzL3BlcmYv
dGVzdHMvbW1hcC1iYXNpYy5jIHwgNCArKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi90
ZXN0cy9tbWFwLWJhc2ljLmMgYi90b29scy9wZXJmL3Rlc3RzL21tYXAtYmFzaWMuYwo+ID4gaW5k
ZXggZTY4Y2E2MjI5NzU2Li5mNTA3NWNhNzc0ZjggMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9wZXJm
L3Rlc3RzL21tYXAtYmFzaWMuYwo+ID4gKysrIGIvdG9vbHMvcGVyZi90ZXN0cy9tbWFwLWJhc2lj
LmMKPiA+IEBAIC0yODQsNyArMjg0LDcgQEAgc3RhdGljIHN0cnVjdCB0ZXN0X2Nhc2UgdGVzdHNf
X2Jhc2ljX21tYXBbXSA9IHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAicGVybWlzc2lv
bnMiKSwKPiA+ICAgICAgICAgVEVTVF9DQVNFX1JFQVNPTigiVXNlciBzcGFjZSBjb3VudGVyIHJl
YWRpbmcgb2YgaW5zdHJ1Y3Rpb25zIiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBtbWFw
X3VzZXJfcmVhZF9pbnN0ciwKPiA+IC0jaWYgZGVmaW5lZChfX2kzODZfXykgfHwgZGVmaW5lZChf
X3g4Nl82NF9fKSB8fCBkZWZpbmVkKF9fYWFyY2g2NF9fKQo+ID4gKyNpZiBkZWZpbmVkKF9faTM4
Nl9fKSB8fCBkZWZpbmVkKF9feDg2XzY0X18pIHx8IGRlZmluZWQoX19hYXJjaDY0X18pIHx8IF9f
cmlzY3ZfeGxlbiA9PSA2NAo+IAo+IFNhbWUgY29tbWVudCByZWxhdGluZyB0byB0aGUgZ3VhcmQs
IHdoeSBub3QgZGVmaW5lZChfX3Jpc2N2KSA/CgpfX3Jpc2N2X3hsZW4gd2lsbCBhbHdheXMgYmUg
ZGVmaW5lZCBmb3IgYWxsIHJpc2N2IHRhcmdldHMsIHNvIGFsc28KY2hlY2tpbmcgX19yaXNjdiBp
c24ndCBuZWNlc3Nhcnkgd2hlbiBhIHNwZWNpZmljIGJpdCB3aWR0aCBhbHNvIG5lZWRzCnRvIGJl
IGNoZWNrZWQuIF9fcmlzY3YgaXMgdXNlZnVsIGZvciBjaGVja3MgdGhhdCBkb24ndCBuZWVkIHRv
IGJlCmNvbmNlcm5lZCB3aXRoIHRoZSBiaXQgd2lkdGguIEdyZXBwaW5nLCBJIHNlZSBpbnN0YW5j
ZXMgb2YgYm90aAoiZGVmaW5lZChfX3Jpc2N2KSAmJiBfX3Jpc2N2X3hsZW4gPT0iIGFuZCBqdXN0
ICJfX3Jpc2N2X3hsZW4gPT0iLgpJTUhPLCB0aGUgZm9ybWVyIHNob3VsZCBiZSByZWR1Y2VkIHRv
IHRoZSBsYXR0ZXIsIHJhdGhlciB0aGFuIGNyZWF0aW5nCm1vcmUgaW5zdGFuY2VzIG9mIHRoZW0u
CgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
