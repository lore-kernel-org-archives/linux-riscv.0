Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E64EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 08:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6I3iY8GNsD9IZZoFAj7HH1GkE8bqBRkx/xK179h6iVg=; b=v8mJJwlsiSC2H9
	650NegA5zWfINmnT1Ln1YceD+ySLAhWthQwZxJLINsBIsuwOgs4Ef5pEpbBtj41Dqpyt9njl6dZ95
	CvNdGX1bSiKqHxqBc/cS6I9gwsmdOQ1XrGCrhNiLzZOKuUwMu8KvmTn5BGa1k0mDNhDtv8nKFAnbk
	G+6QL1gIcwDzpAfAeFAlDszpUDHQw9qDW6lBZMZUbVN7bBq974vXtlspms+7hDIRB5ayoIWzeiHlB
	W8xuKFW6d3BbSZzB4TvYpOUhgMheBRCgQ2gUhj1NXACcgnJaBNuPdeoo5iDlye8QDiVldIsWaAw3E
	GJjvbCyawgm9oj+JX+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKDmE-005RW3-1n;
	Fri, 14 Jul 2023 08:03:46 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKDmB-005RU2-2U
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 08:03:45 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b701dee4bfso25033551fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 01:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1689321821; x=1691913821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjGLAxee+6Ys9A4CymyGT7r3XR+DwzfZMVxRgHoxE5Q=;
        b=CjrJSFwQHNriZicyQY+/qEHwW+RTQYr4SNIG047YQMIYg0SDkOYGzcHkruU4HmdQx9
         jbtscSpbmpGVYMjHVaxk3IB3OeT8otxO2C8i0F3xLjBHUcMg1WuQW7ENtOZsfYVzNRFI
         3BUW0it+1aYPguLEVgD5Sjj70w/JS4oI0XbZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689321821; x=1691913821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjGLAxee+6Ys9A4CymyGT7r3XR+DwzfZMVxRgHoxE5Q=;
        b=BE1Z8Y5vCoJ4mDy3AxbOpmsWifpkGf2ITycZT9PFm965voL8boE999QlAFDkU16YFJ
         7tWjqiy1p0zN9nLpNYrCEkWU0ZuCGT6wMN/IPxHQ1nck4BgrEEuqkxK8D7sIqbdIl38N
         edkCFoFu0i75vrRcralkTkH+phq7ptb0kJ/5kbAf6ssxqIskwTJmPZluCpSgcX6jIK1T
         lNfEGe5iLm/6J8B32coX35PZaAd6sF5qIB3vZHQirAmwLQGIj87c+xPh0XdnQUjRKf7p
         haqLYfo6vdpA4fRvvnY+lzdnRwIYJ+LmFs14p4k0P1W5sBBluozrczZZ2Rp5JfZsOQ/p
         xsIA==
X-Gm-Message-State: ABy/qLaNWm/3VlO0ROVkIisZ9kzieTZ82cnVQDwRrvW/AFUjcLluxIpn
	yb3DMCOrMTb8Hotq2SanxAzWFJeu5uZalsDzoEt0
X-Google-Smtp-Source: APBJJlFMUlhWa9Bc5+g9g+JYTmYYF2lCTHnWmApqUVwFo+Nv3dexs2cSKLqHSfAq2guIwBhHZgSIhFGHf3AueKs0GvA=
X-Received: by 2002:a05:651c:104e:b0:2b6:c790:150a with SMTP id
 x14-20020a05651c104e00b002b6c790150amr3565106ljm.22.1689321821152; Fri, 14
 Jul 2023 01:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230703124647.215952-1-alexghiti@rivosinc.com> <20230703124647.215952-7-alexghiti@rivosinc.com>
In-Reply-To: <20230703124647.215952-7-alexghiti@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 14 Jul 2023 01:03:29 -0700
Message-ID: <CAOnJCULYD_Z32dupvTZZm7E6GnXaOy+R3yf7wqSy3ZMdd6eOFw@mail.gmail.com>
Subject: Re: [PATCH v4 06/10] drivers: perf: Implement perf event mmap support
 in the legacy backend
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
X-CRM114-CacheID: sfid-20230714_010343_806754_440815FB 
X-CRM114-Status: GOOD (  17.95  )
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

T24gTW9uLCBKdWwgMywgMjAyMyBhdCA1OjUy4oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IEltcGxlbWVudCB0aGUgbmVlZGVkIGNhbGxiYWNr
cyBpbiB0aGUgbGVnYWN5IGRyaXZlciBzbyB0aGF0IHdlIGNhbgo+IGRpcmVjdGx5IGFjY2VzcyB0
aGUgY291bnRlcnMgdGhyb3VnaCBwZXJmIGluIHVzZXJzcGFjZS4KPgo+IFNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiBSZXZpZXdlZC1ieTog
QW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9w
ZXJmL3Jpc2N2X3BtdV9sZWdhY3kuYyB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9wZXJmL3Jpc2N2X3BtdV9sZWdhY3kuYyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfbGVnYWN5
LmMKPiBpbmRleCA2YTAwMGFiYzI4YmIuLjc5ZmRkNjY3OTIyZSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL3BlcmYvcmlzY3ZfcG11X2xlZ2FjeS5jCj4gKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3Bt
dV9sZWdhY3kuYwo+IEBAIC03MSw2ICs3MSwyOSBAQCBzdGF0aWMgdm9pZCBwbXVfbGVnYWN5X2N0
cl9zdGFydChzdHJ1Y3QgcGVyZl9ldmVudCAqZXZlbnQsIHU2NCBpdmFsKQo+ICAgICAgICAgbG9j
YWw2NF9zZXQoJmh3Yy0+cHJldl9jb3VudCwgaW5pdGlhbF92YWwpOwo+ICB9Cj4KPiArc3RhdGlj
IHVpbnQ4X3QgcG11X2xlZ2FjeV9jc3JfaW5kZXgoc3RydWN0IHBlcmZfZXZlbnQgKmV2ZW50KQo+
ICt7Cj4gKyAgICAgICByZXR1cm4gZXZlbnQtPmh3LmlkeDsKPiArfQo+ICsKPiArc3RhdGljIHZv
aWQgcG11X2xlZ2FjeV9ldmVudF9tYXBwZWQoc3RydWN0IHBlcmZfZXZlbnQgKmV2ZW50LCBzdHJ1
Y3QgbW1fc3RydWN0ICptbSkKPiArewo+ICsgICAgICAgaWYgKGV2ZW50LT5hdHRyLmNvbmZpZyAh
PSBQRVJGX0NPVU5UX0hXX0NQVV9DWUNMRVMgJiYKPiArICAgICAgICAgICBldmVudC0+YXR0ci5j
b25maWcgIT0gUEVSRl9DT1VOVF9IV19JTlNUUlVDVElPTlMpCj4gKyAgICAgICAgICAgICAgIHJl
dHVybjsKPiArCj4gKyAgICAgICBldmVudC0+aHcuZmxhZ3MgfD0gUEVSRl9FVkVOVF9GTEFHX1VT
RVJfUkVBRF9DTlQ7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIHBtdV9sZWdhY3lfZXZlbnRfdW5t
YXBwZWQoc3RydWN0IHBlcmZfZXZlbnQgKmV2ZW50LCBzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiAr
ewo+ICsgICAgICAgaWYgKGV2ZW50LT5hdHRyLmNvbmZpZyAhPSBQRVJGX0NPVU5UX0hXX0NQVV9D
WUNMRVMgJiYKPiArICAgICAgICAgICBldmVudC0+YXR0ci5jb25maWcgIT0gUEVSRl9DT1VOVF9I
V19JTlNUUlVDVElPTlMpCj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiArCj4gKyAgICAgICBl
dmVudC0+aHcuZmxhZ3MgJj0gflBFUkZfRVZFTlRfRkxBR19VU0VSX1JFQURfQ05UOwo+ICt9Cj4g
Kwo+ICAvKgo+ICAgKiBUaGlzIGlzIGp1c3QgYSBzaW1wbGUgaW1wbGVtZW50YXRpb24gdG8gYWxs
b3cgbGVnYWN5IGltcGxlbWVudGF0aW9ucwo+ICAgKiBjb21wYXRpYmxlIHdpdGggbmV3IFJJU0Mt
ViBQTVUgZHJpdmVyIGZyYW1ld29yay4KPiBAQCAtOTEsNiArMTE0LDkgQEAgc3RhdGljIHZvaWQg
cG11X2xlZ2FjeV9pbml0KHN0cnVjdCByaXNjdl9wbXUgKnBtdSkKPiAgICAgICAgIHBtdS0+Y3Ry
X2dldF93aWR0aCA9IE5VTEw7Cj4gICAgICAgICBwbXUtPmN0cl9jbGVhcl9pZHggPSBOVUxMOwo+
ICAgICAgICAgcG11LT5jdHJfcmVhZCA9IHBtdV9sZWdhY3lfcmVhZF9jdHI7Cj4gKyAgICAgICBw
bXUtPmV2ZW50X21hcHBlZCA9IHBtdV9sZWdhY3lfZXZlbnRfbWFwcGVkOwo+ICsgICAgICAgcG11
LT5ldmVudF91bm1hcHBlZCA9IHBtdV9sZWdhY3lfZXZlbnRfdW5tYXBwZWQ7Cj4gKyAgICAgICBw
bXUtPmNzcl9pbmRleCA9IHBtdV9sZWdhY3lfY3NyX2luZGV4Owo+Cj4gICAgICAgICBwZXJmX3Bt
dV9yZWdpc3RlcigmcG11LT5wbXUsICJjcHUiLCBQRVJGX1RZUEVfUkFXKTsKPiAgfQo+IC0tCj4g
Mi4zOS4yCj4KCgpSZXZpZXdlZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+
Ci0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
