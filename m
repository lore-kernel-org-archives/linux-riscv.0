Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42009EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 08:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+CjJX573XsBMgROSNh2syK57G6toZcSkL5Lmtw9pO3w=; b=WLBFWvKl6e6z70
	GCgLn7Xa4vr59lRH5iC4MQZsEAitDATUsJKMlRa1jjg4Sf279/3B61Tk5wx2wkJwhC++dmAUd7005
	NQnrE0/GLdF62xTxfdL1w2r7k2uZZ2JfKl9Qh9t4hoKAZml1KypLV6EfcpU8xNQbqKTL9ME5nu73Z
	4PMacZlPPQL6J2aKgNputBblJ9gRyGTTzzupg5rbuVGIhh6po2W+m5rIzUP+b8GIC7CWfDxaqQAad
	DS8scPP4eZE+uI4C/2cSBjb/L+KnBzXTFHuP3uwmEO4i3mLUJV+79c6/0bifinHE3ndP9fW5V8Ink
	3IJBQ9UAgBSEcV2DkWkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKDjv-005QjF-19;
	Fri, 14 Jul 2023 08:01:23 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKDjq-005QfL-1t
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 08:01:21 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b6fdaf6eefso24371191fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 01:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1689321673; x=1691913673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EP8QirGSf2eyBcIi4yRsMFtzBd2RQ70krFjONUiThU=;
        b=qrgkw6OLa/u09k4e8aJM4RCLYCSGJL2Ws3SFmAj0tiB0tCpyZoQo61oYAsI8sU9BB8
         H+gQWv8vCeKgKgyoeSKS4C4Sc0C4IPiwmVfTHUNpOFsAZRTsMpO+0/j6Wnd+QMliJQf8
         i4x/3jU9uKTH2hS4SI8A4xrNpqD/H+x2vIEBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689321673; x=1691913673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1EP8QirGSf2eyBcIi4yRsMFtzBd2RQ70krFjONUiThU=;
        b=HRTMTlbfwTEkKGrFlyxzqaeWqD+1la2ftluE2fwPaA9KlaxNsIwbk8nxbem5Md46al
         H0arak7XBhOQ9JYXCcXJ4BzS9bdyMqToyC/kTc5JWGz+rC6FxvU+3nOanBWuVWXCEGeJ
         eGDAu7Xoy6QmDgFr0wqNLJvHyq7IUwPDGw9U2fsrxViStaEuDZmgfzFq5wJIs8TC2Sxx
         7pw0HeD92qRSpgHn5iXW5u/hw82biX9cfoqYnECdtzEgTOzcFEfJP43nYTIqO4ohyvBJ
         54b2atgjLx6x41aWnkXwHYRi9ieJSXjK+BwcCTeH/3vR5wArt/A5Xa4ss0eQYjBS4fhV
         Rafg==
X-Gm-Message-State: ABy/qLbt4BNDNa4o9ocDeYwOvO13GPtPUnVF9pHnsXU7NtkKAY+B8DIr
	jmamow1vcxm68Uy68KkVChQZqgu5w1a3733LMhYk
X-Google-Smtp-Source: APBJJlH9NXJwG/irkEBqLyvhCaQIJQoJOMcC3K+qxYOhEFI0i6ghNvHJrlfaGxOM3WfsQn8boxIxuA7ht9mmOsLse2o=
X-Received: by 2002:a2e:8611:0:b0:2b6:ee1c:216a with SMTP id
 a17-20020a2e8611000000b002b6ee1c216amr3346497lji.34.1689321672902; Fri, 14
 Jul 2023 01:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230703124647.215952-1-alexghiti@rivosinc.com> <20230703124647.215952-4-alexghiti@rivosinc.com>
In-Reply-To: <20230703124647.215952-4-alexghiti@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 14 Jul 2023 01:01:01 -0700
Message-ID: <CAOnJCULeM0TXR8mp-FihtMZ2KfOTkPzmzjX74Mj6_c62UrhAEA@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] riscv: Make legacy counter enum match the HW numbering
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
X-CRM114-CacheID: sfid-20230714_010118_627659_2614CC88 
X-CRM114-Status: GOOD (  16.33  )
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

T24gTW9uLCBKdWwgMywgMjAyMyBhdCA1OjQ54oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IFJJU0NWX1BNVV9MRUdBQ1lfSU5TVFJFVCB1c2Vk
IHRvIGJlIHNldCB0byAxIHdoZXJlYXMgdGhlIG9mZnNldCBvZiB0aGlzCj4gaGFyZHdhcmUgY291
bnRlciBmcm9tIENTUl9DWUNMRSBpcyBhY3R1YWxseSAyOiBtYWtlIHRoaXMgb2Zmc2V0IG1hdGNo
IHRoZQo+IHJlYWwgaHcgb2Zmc2V0IHNvIHRoYXQgd2UgY2FuIGRpcmVjdGx5IGV4cG9zZSB0aG9z
ZSB2YWx1ZXMgdG8gdXNlcnNwYWNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRp
IDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFq
b25lc0B2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X2xl
Z2FjeS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X2xlZ2FjeS5jIGIv
ZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9sZWdhY3kuYwo+IGluZGV4IGNhOWUyMGJmYzdhYy4uNmEw
MDBhYmMyOGJiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfbGVnYWN5LmMK
PiArKysgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X2xlZ2FjeS5jCj4gQEAgLTEzLDcgKzEzLDcg
QEAKPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+Cj4gICNkZWZpbmUgUklT
Q1ZfUE1VX0xFR0FDWV9DWUNMRSAgICAgICAgIDAKPiAtI2RlZmluZSBSSVNDVl9QTVVfTEVHQUNZ
X0lOU1RSRVQgICAgICAgMQo+ICsjZGVmaW5lIFJJU0NWX1BNVV9MRUdBQ1lfSU5TVFJFVCAgICAg
ICAyCj4KPiAgc3RhdGljIGJvb2wgcG11X2luaXRfZG9uZTsKPgo+IC0tCj4gMi4zOS4yCj4KClJl
dmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KCi0tIApSZWdhcmRz
LApBdGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
