Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AE5C001DB
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 16:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfjFtlp001kK5+okCsCwmgZdY3nv2olT+n8LOhSwu3s=; b=bkNAcymWTk/m77
	LOp6tumTtga7lxcxmGtZy9RucpNpW4003SM/h86h6Q78JT3KcPx8mylyuW8NkRuifMqX4goRWa/tb
	RfKQSGr/5uLzFog58Dk+Xre7Y4dhXlDoTjpGmCXZ+Ep0Rz5HR3OjV/kGxkmXirEBkJDReMSXtU1FO
	Y6a6E7mSTeeCi0Yun0V/s0Ddvtm8pwH0FnhnP8aEH/miCkY4RtqvLkh0i0L5YaT1HeQqKL5frWiLs
	lUf231VcjQ4JQnX2sK+aF931k5qvTe1avEwiZ2Gverkqsq0NcTo9wj/9JVbMXTXwKs5kOHJVuF5kV
	0QW+KuD+FHsLyhC+yuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVagt-00HZtc-0J;
	Mon, 14 Aug 2023 16:45:15 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVagp-00HZrs-0d
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 16:45:12 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3493d0f785dso965ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 09:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692031510; x=1692636310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUOrFLsIZYMXOqsY5xgWwBV0ImqoZShpWf5IuSUgWgI=;
        b=jI6Gr0FRrjvGeJMEI2J8ZnZVkqk3LIcr8NpGV+Y+d48pChX47ng6l8lIZluFd5qijf
         Vy4Pc+avZR6i4rP9hCWvkX1U0Vn+evBgb/sam6zB/uLlpDMD8+c3BrrKzjB0JRBdI9H9
         7LUSfD27s0IiFR2tak8vcZ1D8yQu4Z7UzYsjGDv3sDMH/nB6iDvgaT81tC4SkjjjKM9q
         uuAHoeR4LGvJ3UXkY+9WMJuQbtdbtNM3VW93Wrwk+G/XZih4HW6Z3xtepuFT9Sxv9vYh
         8QiKW1e+b3Y7vhVL9vVWPkbMEKrzIbCWOjDTSlDW5MGe7DcgscNk/PPPu6yIi9obT4lZ
         SbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692031510; x=1692636310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUOrFLsIZYMXOqsY5xgWwBV0ImqoZShpWf5IuSUgWgI=;
        b=kf4Or54HBPBvqWAQSCRsWSCw8hLfA/2tskzPwPD5aTMvttQm5CSb0pPYNR+LSo0kL0
         wLiklj3ofJ9+/UEyVh+rPg1Tkym0alcAGlXzG8zf9tAkF/PuuqCb98N9uc3KVUA4YKIb
         +bqomKTVWYAk0K8G8IJjmRCv9RFP0UZ8/yxD+OBHDSHZ0r2fHQwXJoe+w0wppayuMKyM
         4B73ppryTCPQ/73lvFSopO9by82U7st1Y22sgzPAQppD4T7PbkZ8WVI+W6tVPqT0JDXT
         ExeAe7YjqRYQL8XzV5wxgYzxkOgS31pCRNlsRivEjHeOpn6s99+8yfZJ17TxHzYwlzJE
         /Fmg==
X-Gm-Message-State: AOJu0YyjYOlU80L2NfmydRi8yWcpKo0Zh5o5pZBpuS6YfWLm9w5nvdUI
	K3WkEMPWhJJumOI0hbpizE8oeet3JhRyTNo4iTzAHw==
X-Google-Smtp-Source: AGHT+IHaVdS2tL6lFC4JIfMaRKMI72Pka+6x9A1yAAwchBWIR4AFgLTDvCZa48IjUvUxK8db50EWHKlDZ5LeoG7M3q8=
X-Received: by 2002:a05:6e02:1d0d:b0:346:676f:3517 with SMTP id
 i13-20020a056e021d0d00b00346676f3517mr579011ila.11.1692031510069; Mon, 14 Aug
 2023 09:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230802080328.1213905-1-alexghiti@rivosinc.com> <20230802080328.1213905-11-alexghiti@rivosinc.com>
In-Reply-To: <20230802080328.1213905-11-alexghiti@rivosinc.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 14 Aug 2023 09:44:58 -0700
Message-ID: <CAP-5=fVcMg7TL6W_jH61PW6dYMobuTs13d4JDuTAx=mxJ+PNtQ@mail.gmail.com>
Subject: Re: [PATCH v6 10/10] perf: tests: Adapt mmap-basic.c for riscv
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_094511_235648_889F4E12 
X-CRM114-Status: GOOD (  15.81  )
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

T24gV2VkLCBBdWcgMiwgMjAyMyBhdCAxOjE04oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IHJpc2N2IG5vdyBzdXBwb3J0cyBtbWFwaW5nIGhh
cmR3YXJlIGNvdW50ZXJzIHRvIHVzZXJzcGFjZSBzbyBhZGFwdCB0aGUgdGVzdAo+IHRvIHJ1biBv
biB0aGlzIGFyY2hpdGVjdHVyZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8
YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9u
ZXNAdmVudGFuYW1pY3JvLmNvbT4KPiBSZXZpZXdlZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEBy
aXZvc2luYy5jb20+CgpSZXZpZXdlZC1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29t
PgoKVGhhbmtzLApJYW4KCj4gLS0tCj4gIHRvb2xzL3BlcmYvdGVzdHMvbW1hcC1iYXNpYy5jIHwg
NiArKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3Rlc3RzL21tYXAtYmFzaWMuYyBiL3Rvb2xz
L3BlcmYvdGVzdHMvbW1hcC1iYXNpYy5jCj4gaW5kZXggZTY4Y2E2MjI5NzU2Li44ODZhMTNhNzdh
MTYgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvcGVyZi90ZXN0cy9tbWFwLWJhc2ljLmMKPiArKysgYi90
b29scy9wZXJmL3Rlc3RzL21tYXAtYmFzaWMuYwo+IEBAIC0yODQsNyArMjg0LDggQEAgc3RhdGlj
IHN0cnVjdCB0ZXN0X2Nhc2UgdGVzdHNfX2Jhc2ljX21tYXBbXSA9IHsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgInBlcm1pc3Npb25zIiksCj4gICAgICAgICBURVNUX0NBU0VfUkVBU09OKCJV
c2VyIHNwYWNlIGNvdW50ZXIgcmVhZGluZyBvZiBpbnN0cnVjdGlvbnMiLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICBtbWFwX3VzZXJfcmVhZF9pbnN0ciwKPiAtI2lmIGRlZmluZWQoX19pMzg2
X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykgfHwgZGVmaW5lZChfX2FhcmNoNjRfXykKPiArI2lm
IGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykgfHwgZGVmaW5lZChfX2Fh
cmNoNjRfXykgfHwgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAoZGVmaW5lZChfX3Jpc2N2
KSAmJiBfX3Jpc2N2X3hsZW4gPT0gNjQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICJwZXJt
aXNzaW9ucyIKPiAgI2Vsc2UKPiAgICAgICAgICAgICAgICAgICAgICAgICAgInVuc3VwcG9ydGVk
Igo+IEBAIC0yOTIsNyArMjkzLDggQEAgc3RhdGljIHN0cnVjdCB0ZXN0X2Nhc2UgdGVzdHNfX2Jh
c2ljX21tYXBbXSA9IHsKPiAgICAgICAgICAgICAgICAgKSwKPiAgICAgICAgIFRFU1RfQ0FTRV9S
RUFTT04oIlVzZXIgc3BhY2UgY291bnRlciByZWFkaW5nIG9mIGN5Y2xlcyIsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgIG1tYXBfdXNlcl9yZWFkX2N5Y2xlcywKPiAtI2lmIGRlZmluZWQoX19p
Mzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykgfHwgZGVmaW5lZChfX2FhcmNoNjRfXykKPiAr
I2lmIGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykgfHwgZGVmaW5lZChf
X2FhcmNoNjRfXykgfHwgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAoZGVmaW5lZChfX3Jp
c2N2KSAmJiBfX3Jpc2N2X3hsZW4gPT0gNjQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICJw
ZXJtaXNzaW9ucyIKPiAgI2Vsc2UKPiAgICAgICAgICAgICAgICAgICAgICAgICAgInVuc3VwcG9y
dGVkIgo+IC0tCj4gMi4zOS4yCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
