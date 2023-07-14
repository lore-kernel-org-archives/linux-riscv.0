Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88943EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 08:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g3bZPQ+rY1tua6RfbuA8iQjPojJ3pqJ2snWLdIKR4i8=; b=0mCFPUiy3wCDII
	JHI/jf8YsuR6ok+Re1XCmZxS8yOZvuq10zLmPy+6Am44ialLQ449IGVif+nXLeWu6T8njoWqL65B0
	rPiiLG5yQEmXn9bi+cR9fe5nte9im5L68lA6PlhtWD29u/aEjvSu4zNccU7h+Nn4pe6+cFeDpUGKv
	sjYmmZ0++5161VGtSM125thpDtHtJpe9W717e8jLhQFA5kMWZFJ36C932Z4TG/DAw7vb96IHrbfDr
	Hhxrx2x0IN1ysLgqMX3X/1giy1V8tNIIt+JGZbwsmJicRi4jzcFEBFKI8KPrPn2mhaVnXo/5+ZvmG
	uqDHRMYKq9fEijTs2D0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKDkJ-005Qsj-2J;
	Fri, 14 Jul 2023 08:01:47 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKDkG-005QpU-13
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 08:01:45 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b702319893so24442661fa.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 01:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1689321700; x=1691913700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShjQafFlxwj0ZbXGvO6wNGgWYgf4xaRFZkYq02YP6kc=;
        b=NxLgPV4I19f8IiP60ZnGFSeHPxtkexY32ZSMloC+h1rGlZvabpR6A/95fQRFz3JYYl
         mA3aygOemm5vn9YIIfhjVvgiQfzkmba/RYXwnACWZ9QvSY934p3EaqHuKQndThA/Ncol
         PPB/1ojsJfRmvkFBS7VpyIdsWANx5SGYvfneQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689321700; x=1691913700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShjQafFlxwj0ZbXGvO6wNGgWYgf4xaRFZkYq02YP6kc=;
        b=FcgAiukQXDQAdoFWnhqb3droii8T+5BP33xso9cnUzzuY2o+fDs0eF7zj0fFi0G2Q9
         meKsuzf8QVF7v71PgIInGzAQxoFJenmBUKDnVH8gneJLcf0nfmpIkDeIELW9Wi0HI7E5
         MHzamnXitJ+IXp8cLNIPBUMGtBnzvEJfXoapI8ablo9yzSPUP3J6OCHIek0T8tZFoT5Q
         yYyCXXv0w8f3gs/6Sp0IVscFccQc4nFqYoHFIrBgpzaSVrq3ybPsMosMqR7fZ5vEVS46
         VTGn4huCm+am7CMFgtw3ep2Z45u0Q2n6MCmRta/l7DwbFUx2y9RwZ/WgRTVwqxKoW8hS
         qPCg==
X-Gm-Message-State: ABy/qLYzr7bbXqN1EyvYrsiDdpfRqS7qhSnINIiCHbEE4V6ZZ197r5Sp
	KMFmzMt1Ku/PLPh5jK9K7+t/uFLQL8oMcKoHMMLl
X-Google-Smtp-Source: APBJJlG8yJgz5jfm4hlpuw8sREsVvtiALqK/rKnopveB5SJ1Aggbn1Z9er70e9nUIoAw3y4SZLdpoCvsmxLPKA6jdac=
X-Received: by 2002:a2e:8082:0:b0:2b6:d8d5:15b1 with SMTP id
 i2-20020a2e8082000000b002b6d8d515b1mr2761616ljg.50.1689321700031; Fri, 14 Jul
 2023 01:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230703124647.215952-1-alexghiti@rivosinc.com> <20230703124647.215952-5-alexghiti@rivosinc.com>
In-Reply-To: <20230703124647.215952-5-alexghiti@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 14 Jul 2023 01:01:28 -0700
Message-ID: <CAOnJCULCcPaHL5WeF=1L=Ge22M6CgGHLPVh7z1dOyhT7S0V5+Q@mail.gmail.com>
Subject: Re: [PATCH v4 04/10] drivers: perf: Rename riscv pmu sbi driver
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
X-CRM114-CacheID: sfid-20230714_010144_387260_203384AD 
X-CRM114-Status: GOOD (  18.39  )
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

T24gTW9uLCBKdWwgMywgMjAyMyBhdCA1OjUw4oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoYXQncyBqdXN0IGNvc21ldGljLCBubyBmdW5j
dGlvbmFsIGNoYW5nZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhn
aGl0aUByaXZvc2luYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgICB8
IDQgKystLQo+ICBpbmNsdWRlL2xpbnV4L3BlcmYvcmlzY3ZfcG11LmggfCAyICstCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11
X3NiaS5jCj4gaW5kZXggNGYzYWMyOTZiM2UyLi44M2MzZjFjNGQyZjEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ICsrKyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9w
bXVfc2JpLmMKPiBAQCAtOTE0LDcgKzkxNCw3IEBAIHN0YXRpYyBpbnQgcG11X3NiaV9kZXZpY2Vf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgc3RhdGljIHN0cnVjdCBwbGF0
Zm9ybV9kcml2ZXIgcG11X3NiaV9kcml2ZXIgPSB7Cj4gICAgICAgICAucHJvYmUgICAgICAgICAg
PSBwbXVfc2JpX2RldmljZV9wcm9iZSwKPiAgICAgICAgIC5kcml2ZXIgICAgICAgICA9IHsKPiAt
ICAgICAgICAgICAgICAgLm5hbWUgICA9IFJJU0NWX1BNVV9QREVWX05BTUUsCj4gKyAgICAgICAg
ICAgICAgIC5uYW1lICAgPSBSSVNDVl9QTVVfU0JJX1BERVZfTkFNRSwKPiAgICAgICAgIH0sCj4g
IH07Cj4KPiBAQCAtOTQxLDcgKzk0MSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHBtdV9zYmlfZGV2
aW5pdCh2b2lkKQo+ICAgICAgICAgaWYgKHJldCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJl
dDsKPgo+IC0gICAgICAgcGRldiA9IHBsYXRmb3JtX2RldmljZV9yZWdpc3Rlcl9zaW1wbGUoUklT
Q1ZfUE1VX1BERVZfTkFNRSwgLTEsIE5VTEwsIDApOwo+ICsgICAgICAgcGRldiA9IHBsYXRmb3Jt
X2RldmljZV9yZWdpc3Rlcl9zaW1wbGUoUklTQ1ZfUE1VX1NCSV9QREVWX05BTUUsIC0xLCBOVUxM
LCAwKTsKPiAgICAgICAgIGlmIChJU19FUlIocGRldikpIHsKPiAgICAgICAgICAgICAgICAgcGxh
dGZvcm1fZHJpdmVyX3VucmVnaXN0ZXIoJnBtdV9zYmlfZHJpdmVyKTsKPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIFBUUl9FUlIocGRldik7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGVy
Zi9yaXNjdl9wbXUuaCBiL2luY2x1ZGUvbGludXgvcGVyZi9yaXNjdl9wbXUuaAo+IGluZGV4IDlm
NzBkOTQ5NDJlMC4uNWRlZWVhMGJlN2NiIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvcGVy
Zi9yaXNjdl9wbXUuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvcGVyZi9yaXNjdl9wbXUuaAo+IEBA
IC0yMSw3ICsyMSw3IEBACj4KPiAgI2RlZmluZSBSSVNDVl9NQVhfQ09VTlRFUlMgICAgIDY0Cj4g
ICNkZWZpbmUgUklTQ1ZfT1BfVU5TVVBQICAgICAgICAgICAgICAgICgtRU9QTk9UU1VQUCkKPiAt
I2RlZmluZSBSSVNDVl9QTVVfUERFVl9OQU1FICAgICJyaXNjdi1wbXUiCj4gKyNkZWZpbmUgUklT
Q1ZfUE1VX1NCSV9QREVWX05BTUUgICAgICAgICJyaXNjdi1wbXUtc2JpIgo+ICAjZGVmaW5lIFJJ
U0NWX1BNVV9MRUdBQ1lfUERFVl9OQU1FICAgICAicmlzY3YtcG11LWxlZ2FjeSIKPgo+ICAjZGVm
aW5lIFJJU0NWX1BNVV9TVE9QX0ZMQUdfUkVTRVQgMQo+IC0tCj4gMi4zOS4yCj4KCgpSZXZpZXdl
ZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Ci0tIApSZWdhcmRzLApBdGlz
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
