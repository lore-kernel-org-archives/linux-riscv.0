Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B7DC001DD
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 09:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p727B4oQ69Le3TR5AShl4P94lR5PuU8IqsIuKHWmTBo=; b=iOCz3zXWWqYB7i
	8sLz9vDsUA2auJE9y6Xhcts7eaaZpf/XPkD92ZfTD9CW1Sd2AQyXKJ3nlz9KRN6hbVavmEhdvvOfs
	1fDexTqC/Env85u10oGy8Em9OHaNE5QTiUnmOLzFRBPp5AwWG7fLU/2ZCrbzghfTTF6m5ZNEHEiTw
	oiGjA8mNKXt0j8Qrj7pFVfYeJEK6yUjySoQ6euoaAf0HQtOV8tKtXwVIBRzWD+ZJQxbGhaJyZF0VH
	SK3Mi/Jd1ms3oobKtUZQOrP1h9jQ3rQ/8xDNCn4NnrNlDOgErKSCRp6hWnq1xZNEzDIlTZdl79Cmr
	yrFp/Bvt1ZKHtbOGv6vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKF7v-005g9d-1B;
	Fri, 14 Jul 2023 09:30:15 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKF7s-005g70-1h
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 09:30:13 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b700e85950so24816291fa.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 02:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1689327008; x=1691919008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dosegy5s6S3Py/sYCBb7fr6YwHTMUrv8EM9f77WeMOc=;
        b=Xqcw23ipPcPee2KGDUUmScxC6YI+Lt+tpZLhyiWzpqBFRO340fdakn0xdVV1NlwZYo
         8LZbDjW6NUOsDs0GB/lm0oM1oxUlYm5/QtzGj1+yTps3jl6EW1l2EbnJeFvc6s69+PMu
         3etpZNsNrgUTw2j28xUGW6FsyP7PGWyvOkhIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689327008; x=1691919008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dosegy5s6S3Py/sYCBb7fr6YwHTMUrv8EM9f77WeMOc=;
        b=QSBD7hty0CJM+tfDmffH+AOY9/IVUf9mMuGWn/HDCH+QnWexenKLnOVwoS/Ez2Igzj
         Zr9tt6HJ36/6jErqwM4nd5x69VLxMUpY20PqFZU0nyefxJ0rWFQP+L7iLj1V3xusutfX
         UrASvx/O6iFyfIfR7RGv6jO8NJ38WU3S2i5JyEk2nLlFtPd3Qiv+qwRa0hgTYV7feksB
         GbK4+SxvzJBJnMu0cvRAvPGcx/RTZ5nwwkxgWGq+bcAQtdI/QltgNY81OKMs7O/85K9a
         TsRLeOqvUB9ZOsjQ9KIeCEYxI+0vuLm3uNze9Ekfq7M9y4YrqYxz05y2M/cAnU8PWhBu
         L4DQ==
X-Gm-Message-State: ABy/qLbOXBn6uoqdR6Rdh4i6zGM99X+j/6tYAYTmQ7UnDSoPcprpI/HN
	AlbSl9xQgXgm7UeODAVihLTkxFOEE7WdiutYykiS
X-Google-Smtp-Source: APBJJlEPgo1IICV+iHBqiUW+Vh3Nr2Vbvx10CePV36LNEMGHrNoz3v5ECTBa/vGZDHxkGoGYB97wfvhB3JFhCknlnkc=
X-Received: by 2002:a2e:a16f:0:b0:2b6:d57f:d81 with SMTP id
 u15-20020a2ea16f000000b002b6d57f0d81mr3198367ljl.53.1689327007925; Fri, 14
 Jul 2023 02:30:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230703124647.215952-1-alexghiti@rivosinc.com> <20230703124647.215952-11-alexghiti@rivosinc.com>
In-Reply-To: <20230703124647.215952-11-alexghiti@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 14 Jul 2023 02:29:56 -0700
Message-ID: <CAOnJCUJcYAX3=h=O6nCjN+hAL9cT8Cmw5sgXa1MZpKEPCuyM-A@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] perf: tests: Adapt mmap-basic.c for riscv
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_023012_590579_1D7A7070 
X-CRM114-Status: GOOD (  14.80  )
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

T24gTW9uLCBKdWwgMywgMjAyMyBhdCA1OjU34oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IHJpc2N2IG5vdyBzdXBwb3J0cyBtbWFwaW5nIGhh
cmR3YXJlIGNvdW50ZXJzIHRvIHVzZXJzcGFjZSBzbyBhZGFwdCB0aGUgdGVzdAo+IHRvIHJ1biBv
biB0aGlzIGFyY2hpdGVjdHVyZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8
YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9u
ZXNAdmVudGFuYW1pY3JvLmNvbT4KPiAtLS0KPiAgdG9vbHMvcGVyZi90ZXN0cy9tbWFwLWJhc2lj
LmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3Rlc3RzL21tYXAtYmFzaWMuYyBiL3Rv
b2xzL3BlcmYvdGVzdHMvbW1hcC1iYXNpYy5jCj4gaW5kZXggZTY4Y2E2MjI5NzU2Li5mNTA3NWNh
Nzc0ZjggMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvcGVyZi90ZXN0cy9tbWFwLWJhc2ljLmMKPiArKysg
Yi90b29scy9wZXJmL3Rlc3RzL21tYXAtYmFzaWMuYwo+IEBAIC0yODQsNyArMjg0LDcgQEAgc3Rh
dGljIHN0cnVjdCB0ZXN0X2Nhc2UgdGVzdHNfX2Jhc2ljX21tYXBbXSA9IHsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgInBlcm1pc3Npb25zIiksCj4gICAgICAgICBURVNUX0NBU0VfUkVBU09O
KCJVc2VyIHNwYWNlIGNvdW50ZXIgcmVhZGluZyBvZiBpbnN0cnVjdGlvbnMiLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICBtbWFwX3VzZXJfcmVhZF9pbnN0ciwKPiAtI2lmIGRlZmluZWQoX19p
Mzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykgfHwgZGVmaW5lZChfX2FhcmNoNjRfXykKPiAr
I2lmIGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykgfHwgZGVmaW5lZChf
X2FhcmNoNjRfXykgfHwgX19yaXNjdl94bGVuID09IDY0Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICJwZXJtaXNzaW9ucyIKPiAgI2Vsc2UKPiAgICAgICAgICAgICAgICAgICAgICAgICAgInVu
c3VwcG9ydGVkIgo+IEBAIC0yOTIsNyArMjkyLDcgQEAgc3RhdGljIHN0cnVjdCB0ZXN0X2Nhc2Ug
dGVzdHNfX2Jhc2ljX21tYXBbXSA9IHsKPiAgICAgICAgICAgICAgICAgKSwKPiAgICAgICAgIFRF
U1RfQ0FTRV9SRUFTT04oIlVzZXIgc3BhY2UgY291bnRlciByZWFkaW5nIG9mIGN5Y2xlcyIsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgIG1tYXBfdXNlcl9yZWFkX2N5Y2xlcywKPiAtI2lmIGRl
ZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykgfHwgZGVmaW5lZChfX2FhcmNo
NjRfXykKPiArI2lmIGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykgfHwg
ZGVmaW5lZChfX2FhcmNoNjRfXykgfHwgX19yaXNjdl94bGVuID09IDY0Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICJwZXJtaXNzaW9ucyIKPiAgI2Vsc2UKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgInVuc3VwcG9ydGVkIgo+IC0tCj4gMi4zOS4yCj4KCgpSZXZpZXdlZC1ieTogQXRpc2gg
UGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Ci0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
