Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E2FC2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 17:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=frmBc9tWNh0HgsBo0hB0ZN3le+ic923IDVrf58u6DYw=; b=S7o0uqdmx1EX0Q
	mxP4HGGo17GFscC+U0xrjsVxNHzzgpo/cJVqPQUvxkhETpM29dSVKxdWUkYWlzJANWszZVBgCgzlE
	H9xGc9tTzFBz5x8yISBgekVKhz57c7Gt9NMIPA9RHYpeavkBUUFoBNCBrsL2SF0psXHB5zMSmIiA0
	FVsClmmDhzt4gR+J5OMexwtjfwmjvzEGYduRmNgOm9Q1C+IgQZE3AaL8uZyNjZJ815TzIE7P01CKb
	txm1w/Q6vFa1NDUm+R4jBoy69uQ5ipKux640mZcuuJ/G8EAKujqwRO1C+PVXp3Th/z1caCziClSG4
	m5dxzgAgIViqvlILQ8hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMAHW-00000003ydY-3LMg;
	Tue, 25 Jun 2024 17:48:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMAHR-00000003ybL-0bj6;
	Tue, 25 Jun 2024 17:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9xtHXiqQf1XxUxrjysf1LF5IvMCFepz3wpLAFkq/vI8=; b=NIKlmEdxV/cPh6tG47mgJRDqUe
	nO+91EyWyKO3XplZsFyG3nO1N4POLOrg6SKSCvGR0XyhZuc3HfXRHxAiDDk+NzT3U+fCT8m8hpJi8
	lGtMOptRX0fVy9vNLChIMg2yHfuVKnYpiSx1EoOlL1Tydbtq8jPs37Cc5FBQPp1O6/gI6LRdt9Qcn
	VEFGvlzcQHovYDqgw6jKTY/5JFM50OXODkkR66IpKfwnIsadIalw5up77cz5NJehbni6loce9CUqd
	nV7YpVZ1kIfpi2NZ4T/YrP2UrlVDenr02fpoxUb8do/b8TjO2X4LuU5SlSjSxJ65uIsqtfv0D1T2E
	ogIZ2shA==;
Received: from mail-pj1-f52.google.com ([209.85.216.52])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMAHL-00000008Rtl-3PXK;
	Tue, 25 Jun 2024 17:48:30 +0000
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2c7a6da20f2so4525083a91.0;
        Tue, 25 Jun 2024 10:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719337698; x=1719942498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xtHXiqQf1XxUxrjysf1LF5IvMCFepz3wpLAFkq/vI8=;
        b=CkADyFRf0iD+ZD46Bvh47bxZyo3g1RlMHrr/FfahRMTPz/pdaMR87lXAIVLcIksgOq
         EfdizcDGKaanAMFxHrhMVvr0sHXgSnE9jhTyE+TlVM6yVZPd2Xxj3IdV9HHnbGS51cjP
         eOpFDsS9uiqdnQ1I0hQ3mfamxVlBBAy8hjmPKEEPGphK1/8g+PQX/Rs3b1XqAf6yyovs
         j1T3Ei7zkmifOxVmK+iCraZdqrl16cfkce9VmECJd2mbmlaM02k3obMg81TuxGdMr8UG
         Buze+T/evIzFKZcW0xgllG9DO/1JNoTCMwa5qCc9h4dpItKgcZR3gbn8MISUoi0HjTsY
         +UHg==
X-Forwarded-Encrypted: i=1; AJvYcCXiuHEA41KqiWWqLncbKR5OIxf5qMVhiBzAzoarV8+wvGK80ljlfWkwDZ/rqSkzrcYYm8q7aCGQ6AFEMBu3xx8H+7upDVCqnwtlZTIMZxlm8bZRWpzBbJIAO/YK/t2VUVgzTXjkainOMEZOTnMD9ryhmY8zCn0=
X-Gm-Message-State: AOJu0YycKK4YM0/R62ytbyJsiCLyQU9zz3emfahSDpoBuazxBdDmfnRo
	cOd8/miw1vRif3yG9vWbC2dgAsbAoDKICpiAKU5JpSHHuXgu6sJjtOmvEb6qi17UAwOy0UXb5Yh
	v7VhRPuXvzECWUZYeBSkYkChp1+Q=
X-Google-Smtp-Source: AGHT+IGYzAZ+Bn0UI2LyfXB+0Uof3O9NdbXsei8hjTG9FhXGaHhlgu5/ywEXYZKH6auDRwKGOVRfEO1r10gy0evqwL8=
X-Received: by 2002:a17:90a:668a:b0:2c2:faf7:67a0 with SMTP id
 98e67ed59e1d1-2c8504f656bmr7440529a91.16.1719337698260; Tue, 25 Jun 2024
 10:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240613233122.3564730-1-irogers@google.com> <20240613233122.3564730-8-irogers@google.com>
 <Znnyi2IPC79jMd9y@google.com> <1fdf637d-3571-4145-8008-f2b5f8fc8bca@arm.com>
In-Reply-To: <1fdf637d-3571-4145-8008-f2b5f8fc8bca@arm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Tue, 25 Jun 2024 10:48:06 -0700
Message-ID: <CAM9d7cjy8+Ys-Y_35V7O=KGQL0v3+B9z6hhytmAiKKN9pO9yow@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] perf python: Switch module to linking libraries
 from building source
To: James Clark <james.clark@arm.com>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nick Terrell <terrelln@fb.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Kees Cook <keescook@chromium.org>, 
	Andrei Vagin <avagin@google.com>, Athira Jajeev <atrajeev@linux.vnet.ibm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Ze Gao <zegao2021@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org, coresight@lists.linaro.org, 
	rust-for-linux@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_184828_639537_20C21421 
X-CRM114-Status: GOOD (  21.54  )
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

SGVsbG8sCgpPbiBUdWUsIEp1biAyNSwgMjAyNCBhdCA1OjI04oCvQU0gSmFtZXMgQ2xhcmsgPGph
bWVzLmNsYXJrQGFybS5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDI0LzA2LzIwMjQgMjM6MjYsIE5h
bWh5dW5nIEtpbSB3cm90ZToKPiA+IE9uIFRodSwgSnVuIDEzLCAyMDI0IGF0IDA0OjMxOjIxUE0g
LTA3MDAsIElhbiBSb2dlcnMgd3JvdGU6Cj4gPj4gc2V0dXAucHkgd2FzIGJ1aWxkaW5nIG1vc3Qg
cGVyZiBzb3VyY2VzIGNhdXNpbmcgc2V0dXAucHkgdG8gbWltaWMgdGhlCj4gPj4gTWFrZWZpbGUg
bG9naWMgYXMgd2VsbCBhcyBmbGV4L2Jpc29uIGNvZGUgdG8gYmUgc3R1YmJlZCBvdXQsIGR1ZSB0
bwo+ID4+IGNvbXBsZXhpdHkgYnVpbGRpbmcuIEJ5IHVzaW5nIGxpYnJhcmllcyBmZXdlciBmdW5j
dGlvbnMgYXJlIHN0dWJiZWQKPiA+PiBvdXQsIHRoZSBidWlsZCBpcyBmYXN0ZXIgYW5kIHRoZSBN
YWtlZmlsZSBsb2dpYyBpcyByZXVzZWQgd2hpY2ggc2hvdWxkCj4gPj4gc2ltcGxpZnkgdXBkYXRp
bmcuIFRoZSBsaWJyYXJpZXMgYXJlIHBhc3NlZCB0aHJvdWdoIExERkxBR1MgdG8gYXZvaWQKPiA+
PiBjb21wbGV4aXR5IGluIHB5dGhvbi4KPiA+Pgo+ID4+IEZvcmNlIHRoZSAtZlBJQyBmbGFnIGZv
ciBsaWJicGYuYSB0byBlbnN1cmUgaXQgaXMgc3VpdGFibGUgZm9yIGxpbmtpbmcKPiA+PiBpbnRv
IHRoZSBwZXJmIHB5dGhvbiBtb2R1bGUuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBJYW4gUm9n
ZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+Cj4gPj4gUmV2aWV3ZWQtYnk6IEphbWVzIENsYXJrIDxq
YW1lcy5jbGFya0Bhcm0uY29tPgo+ID4+IC0tLQo+ID4+ICB0b29scy9wZXJmL01ha2VmaWxlLmNv
bmZpZyB8ICAgNSArCj4gPj4gIHRvb2xzL3BlcmYvTWFrZWZpbGUucGVyZiAgIHwgICA2ICstCj4g
Pj4gIHRvb2xzL3BlcmYvdXRpbC9weXRob24uYyAgIHwgMjcxICsrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPiA+PiAgdG9vbHMvcGVyZi91dGlsL3NldHVwLnB5ICAgfCAgMzMg
Ky0tLS0KPiA+PiAgNCBmaWxlcyBjaGFuZ2VkLCAxMTAgaW5zZXJ0aW9ucygrKSwgMjA1IGRlbGV0
aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvTWFrZWZpbGUuY29uZmln
IGIvdG9vbHMvcGVyZi9NYWtlZmlsZS5jb25maWcKPiA+PiBpbmRleCA3ZjFlMDE2YTkyNTMuLjYz
OWJlNjk2ZjU5NyAxMDA2NDQKPiA+PiAtLS0gYS90b29scy9wZXJmL01ha2VmaWxlLmNvbmZpZwo+
ID4+ICsrKyBiL3Rvb2xzL3BlcmYvTWFrZWZpbGUuY29uZmlnCj4gPj4gQEAgLTkxMCw2ICs5MTAs
MTEgQEAgZWxzZQo+ID4+ICAgICAgICAgICBlbmRpZgo+ID4+ICAgICAgICAgICBDRkxBR1MgKz0g
LURIQVZFX0xJQlBZVEhPTl9TVVBQT1JUCj4gPj4gICAgICAgICAgICQoY2FsbCBkZXRlY3RlZCxD
T05GSUdfTElCUFlUSE9OKQo+ID4+ICsgICAgIGlmZXEgKCQoZmlsdGVyIC1mUElDLCQoQ0ZMQUdT
KSksKQo+ID4KPiA+IE5pdHBpY2s6IG1peGVkIFRBQiBhbmQgU1BBQ0VzLgo+ID4KPiA+Cj4gPj4g
KyAgICAgICAgICAgIyBCdWlsZGluZyBhIHNoYXJlZCBsaWJyYXJ5IHJlcXVpcmVzIHBvc2l0aW9u
IGluZGVwZW5kZW50IGNvZGUuCj4gPj4gKyAgICAgICAgICAgQ0ZMQUdTICs9IC1mUElDCj4gPj4g
KyAgICAgICAgICAgQ1hYRkxBR1MgKz0gLWZQSUMKPiA+PiArICAgICAgICAgZW5kaWYKPiA+Cj4g
Pgo+ID4gSSdtIGN1cmlvdXMgaWYgaXQncyBvayBmb3Igc3RhdGljIGxpYnJhcmllcyB0b28uLgo+
ID4KPiA+IFRoYW5rcywKPiA+IE5hbWh5dW5nCj4gPgo+Cj4gSSB0aGluayBJIHRlc3RlZCB0aGUg
d2hvbGUgc2V0IHdpdGggYSBzdGF0aWMgYnVpbGQgc28gaXQgc2hvdWxkIGJlIG9rLgoKT2ssIHRo
YW5rcyBmb3IgY2hlY2tpbmcgdGhhdCEKCk5hbWh5dW5nCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
