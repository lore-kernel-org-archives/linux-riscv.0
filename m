Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E715DC2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 18:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQumXkDr0Yb7aLdZTfdN/Wmrh63hEkzyV4QIRbDIE+g=; b=Gz3B8wPTVvsWQ0
	PaCgEjT5b2U9BhPBchlVcccoMX71BNHYzl4TPMizMTPtxIMcmkbf4/v3xtegu5SPnwQkmQa/Niww1
	Y/Q0FTjX5ExhjzfjZCM2mzfOHIw6TjHJ+GWvhCM+yYf/SuMCRcA58TmjruWNrYygX0/ZKiuAYc0wC
	rsKfwC2NtXOreGDfSZlq2d1wZqk0qF1mI4Zbhru/9Ent4h04GgNussrpC6AYn/GIcxOJQbl2CPkOL
	eQK5W6lJRufWkVZvzP/6SJecaCj1ytIWj926Ut+2ucBO56JsvwOeuiKIpyddJp/Ryoyb8n/4DzOpQ
	W8ZIRBja5pYa9IJKIPag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMAh1-00000004373-1QIX;
	Tue, 25 Jun 2024 18:14:59 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMAgy-0000000435x-0cyo
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 18:14:57 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1fa3086cf25so17405ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 11:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719339294; x=1719944094; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHQujU8w2HsPdHSeJ+eNtyrJA2jnQulGAF+h4XWMpkg=;
        b=K8+hvC9+cbMMNUGQ/IneBS4IuPEwrBvUNwfkXllR/6rpA71+x/fnAjpA6sEwCrsQXg
         3gyr/xNsxaAYoDHdlOF3W64P2fwDBhMOeu62DGjiSa86RO/XlwHH4hHgt6/Z+GKahTU3
         xTB3pxSfHaxmE+xQX9w5JSe3XIUBnIIK7cU+TcZPlb3aGYYCr9HhDrCICywaUIMh7h+A
         bLZuJ+Sw45Ir0RB+CTliQaW2KJuUSKmI260uM1daxpegXJzFChRpL19NkZb2K6TknVYx
         ht9E8jWGhLiLP/gwV0uDMoZib5SoHqsezpM7ekTppkkRHa+JYoF4ZpnN12/E8cl8cThf
         g02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719339294; x=1719944094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHQujU8w2HsPdHSeJ+eNtyrJA2jnQulGAF+h4XWMpkg=;
        b=XV70/sUqsXzMQROFPGfW4yh2eYsmfvrUX2K94qhp/Lj1EYpSw55pAMFD2PMUhzMeFn
         TLPrhnn97Tky9y9OFWyVciwKydwk47VLlGL/nhSFaI0ZmH4HDAmDSIdQ6CJqOyVCVhhJ
         gWguJ4/1t5NF4rOKWJ5EAT4f9cHQUvGP5xNhx3zzZzxnone+wiMZJR9swcSUodxENnGp
         TbjZ06AryWv4jat19Yn5V6ErapCcBdfE5TNWNk9Pq2QRe99vfFWO5/6sWRRTAZqMnAR1
         uQB1/X75rT/UAXzbPavpzMmL3feeTHsiO6xmwe3lvM2jGFoE9u9HkVRrwis3fo7KvOyT
         JA4w==
X-Forwarded-Encrypted: i=1; AJvYcCU5Z/8NNSB20vOOsY+R8jkEWFu9BcfowkVXjs9hYldklpzBLypEW3I5vYTd0Lm8vfAEGRyzXPo5IzAid3eFOF5ItWiU5mZIz+ZV24HqCfAD
X-Gm-Message-State: AOJu0Yz22a76B6sOVaQZYXMTzrfB0iabAVc69Z9FIU1L9H7HC2X3U3nI
	AYTrj2Jxo0YCzimymwzHNchHfoxptewZVukXO4CDECQ6O39v2HDjptRqVKtuhsgT9tHBunFILH7
	2M1W0N6GtHxX/yQt0vFP4HA5NNAJQuR++v3vp
X-Google-Smtp-Source: AGHT+IHUWVP8jMWtzNNtwGhAuozDrDLNiGYVxTa6bvSAKS2s/Xp4TEwNkFy5eyfDDb3O7LxCBZEQyj5jnib9lTc8oa8=
X-Received: by 2002:a17:903:603:b0:1f7:3764:1e19 with SMTP id
 d9443c01a7336-1fa8886e8d6mr213265ad.20.1719339293473; Tue, 25 Jun 2024
 11:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240613233122.3564730-1-irogers@google.com> <20240613233122.3564730-8-irogers@google.com>
 <Znnyi2IPC79jMd9y@google.com> <1fdf637d-3571-4145-8008-f2b5f8fc8bca@arm.com> <CAM9d7cjy8+Ys-Y_35V7O=KGQL0v3+B9z6hhytmAiKKN9pO9yow@mail.gmail.com>
In-Reply-To: <CAM9d7cjy8+Ys-Y_35V7O=KGQL0v3+B9z6hhytmAiKKN9pO9yow@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 25 Jun 2024 11:14:42 -0700
Message-ID: <CAP-5=fXKLxo9VufpsvjNJ-Z+oA+6k7zYOz6qH69xSAiRA2K8zg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] perf python: Switch module to linking libraries
 from building source
To: Namhyung Kim <namhyung@kernel.org>
Cc: James Clark <james.clark@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
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
X-CRM114-CacheID: sfid-20240625_111456_220093_7AC4395E 
X-CRM114-Status: GOOD (  23.96  )
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

T24gVHVlLCBKdW4gMjUsIDIwMjQgYXQgMTA6NDjigK9BTSBOYW1oeXVuZyBLaW0gPG5hbWh5dW5n
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBPbiBUdWUsIEp1biAyNSwgMjAyNCBh
dCA1OjI04oCvQU0gSmFtZXMgQ2xhcmsgPGphbWVzLmNsYXJrQGFybS5jb20+IHdyb3RlOgo+ID4K
PiA+Cj4gPgo+ID4gT24gMjQvMDYvMjAyNCAyMzoyNiwgTmFtaHl1bmcgS2ltIHdyb3RlOgo+ID4g
PiBPbiBUaHUsIEp1biAxMywgMjAyNCBhdCAwNDozMToyMVBNIC0wNzAwLCBJYW4gUm9nZXJzIHdy
b3RlOgo+ID4gPj4gc2V0dXAucHkgd2FzIGJ1aWxkaW5nIG1vc3QgcGVyZiBzb3VyY2VzIGNhdXNp
bmcgc2V0dXAucHkgdG8gbWltaWMgdGhlCj4gPiA+PiBNYWtlZmlsZSBsb2dpYyBhcyB3ZWxsIGFz
IGZsZXgvYmlzb24gY29kZSB0byBiZSBzdHViYmVkIG91dCwgZHVlIHRvCj4gPiA+PiBjb21wbGV4
aXR5IGJ1aWxkaW5nLiBCeSB1c2luZyBsaWJyYXJpZXMgZmV3ZXIgZnVuY3Rpb25zIGFyZSBzdHVi
YmVkCj4gPiA+PiBvdXQsIHRoZSBidWlsZCBpcyBmYXN0ZXIgYW5kIHRoZSBNYWtlZmlsZSBsb2dp
YyBpcyByZXVzZWQgd2hpY2ggc2hvdWxkCj4gPiA+PiBzaW1wbGlmeSB1cGRhdGluZy4gVGhlIGxp
YnJhcmllcyBhcmUgcGFzc2VkIHRocm91Z2ggTERGTEFHUyB0byBhdm9pZAo+ID4gPj4gY29tcGxl
eGl0eSBpbiBweXRob24uCj4gPiA+Pgo+ID4gPj4gRm9yY2UgdGhlIC1mUElDIGZsYWcgZm9yIGxp
YmJwZi5hIHRvIGVuc3VyZSBpdCBpcyBzdWl0YWJsZSBmb3IgbGlua2luZwo+ID4gPj4gaW50byB0
aGUgcGVyZiBweXRob24gbW9kdWxlLgo+ID4gPj4KPiA+ID4+IFNpZ25lZC1vZmYtYnk6IElhbiBS
b2dlcnMgPGlyb2dlcnNAZ29vZ2xlLmNvbT4KPiA+ID4+IFJldmlld2VkLWJ5OiBKYW1lcyBDbGFy
ayA8amFtZXMuY2xhcmtAYXJtLmNvbT4KPiA+ID4+IC0tLQo+ID4gPj4gIHRvb2xzL3BlcmYvTWFr
ZWZpbGUuY29uZmlnIHwgICA1ICsKPiA+ID4+ICB0b29scy9wZXJmL01ha2VmaWxlLnBlcmYgICB8
ICAgNiArLQo+ID4gPj4gIHRvb2xzL3BlcmYvdXRpbC9weXRob24uYyAgIHwgMjcxICsrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4+ICB0b29scy9wZXJmL3V0aWwvc2V0
dXAucHkgICB8ICAzMyArLS0tLQo+ID4gPj4gIDQgZmlsZXMgY2hhbmdlZCwgMTEwIGluc2VydGlv
bnMoKyksIDIwNSBkZWxldGlvbnMoLSkKPiA+ID4+Cj4gPiA+PiBkaWZmIC0tZ2l0IGEvdG9vbHMv
cGVyZi9NYWtlZmlsZS5jb25maWcgYi90b29scy9wZXJmL01ha2VmaWxlLmNvbmZpZwo+ID4gPj4g
aW5kZXggN2YxZTAxNmE5MjUzLi42MzliZTY5NmY1OTcgMTAwNjQ0Cj4gPiA+PiAtLS0gYS90b29s
cy9wZXJmL01ha2VmaWxlLmNvbmZpZwo+ID4gPj4gKysrIGIvdG9vbHMvcGVyZi9NYWtlZmlsZS5j
b25maWcKPiA+ID4+IEBAIC05MTAsNiArOTEwLDExIEBAIGVsc2UKPiA+ID4+ICAgICAgICAgICBl
bmRpZgo+ID4gPj4gICAgICAgICAgIENGTEFHUyArPSAtREhBVkVfTElCUFlUSE9OX1NVUFBPUlQK
PiA+ID4+ICAgICAgICAgICAkKGNhbGwgZGV0ZWN0ZWQsQ09ORklHX0xJQlBZVEhPTikKPiA+ID4+
ICsgICAgIGlmZXEgKCQoZmlsdGVyIC1mUElDLCQoQ0ZMQUdTKSksKQo+ID4gPgo+ID4gPiBOaXRw
aWNrOiBtaXhlZCBUQUIgYW5kIFNQQUNFcy4KCldpbGwgZml4IGl0IGluIHYyLgoKPiA+ID4KPiA+
ID4KPiA+ID4+ICsgICAgICAgICAgICMgQnVpbGRpbmcgYSBzaGFyZWQgbGlicmFyeSByZXF1aXJl
cyBwb3NpdGlvbiBpbmRlcGVuZGVudCBjb2RlLgo+ID4gPj4gKyAgICAgICAgICAgQ0ZMQUdTICs9
IC1mUElDCj4gPiA+PiArICAgICAgICAgICBDWFhGTEFHUyArPSAtZlBJQwo+ID4gPj4gKyAgICAg
ICAgIGVuZGlmCj4gPiA+Cj4gPiA+Cj4gPiA+IEknbSBjdXJpb3VzIGlmIGl0J3Mgb2sgZm9yIHN0
YXRpYyBsaWJyYXJpZXMgdG9vLi4KPiA+ID4KPiA+ID4gVGhhbmtzLAo+ID4gPiBOYW1oeXVuZwo+
ID4gPgo+ID4KPiA+IEkgdGhpbmsgSSB0ZXN0ZWQgdGhlIHdob2xlIHNldCB3aXRoIGEgc3RhdGlj
IGJ1aWxkIHNvIGl0IHNob3VsZCBiZSBvay4KPgo+IE9rLCB0aGFua3MgZm9yIGNoZWNraW5nIHRo
YXQhCgpFdmVuIHdpdGggYSBzdGF0aWMgYnVpbGQgaXQgaXMgb2Z0ZW4gdGhlIGNhc2UgdGhhdCB0
aGUgZXhlY3V0YWJsZSBpcwpwb3NpdGlvbiBpbmRlcGVuZGVudCAoLWZQSUUsIGFuZCByZWxhdGVk
IGNvbXBpbGVyIG9wdGlvbnMpIGFuZCBzbwp3b3VsZCBuZWVkIHRoaXMgdG9vLgoKVGhhbmtzLApJ
YW4KCj4gTmFtaHl1bmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
