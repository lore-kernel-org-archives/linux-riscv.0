Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35E2C7EE22
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 00:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZcxM5uYIKOdmecKF5Aogng2q44JpWVes9e2UZTT+OD8=; b=MVkuO5hoiE6teE
	p9IwcvEBfFMPC5EV71ca7+Vci7fub18WkrphT3sKdIEQOA3T9Dx7RYpSXmvReEEspd4YXkCl8wytK
	/iGbEny5KCrzGySed+ezq1YxIwMs81IX8VIA2c5AaNlIS8e5v2/+RufXzXMT5xSJeKeVqPoUJEB0h
	9sYjdpbN8Vz1wRmnEH3m8a0ru/kR7wxRRunwewhxTQBWL6iC8a0hS4AXFVAI+EHPOO/UwNTZl/2JV
	58JU60yrOm4E8uGq9tRBR+SNnSmX8xZhkGi8or5i+05MOeCtxDq7j39vURo9F1AFxH+5mKwnmeBB4
	Iln3v23hgSV2tw1kYGbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwtoJ-007Isa-15;
	Thu, 11 May 2023 00:05:31 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwtoF-007IrA-2D
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 00:05:29 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-3f38a9918d1so598241cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 May 2023 17:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683763523; x=1686355523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+8v3lTv3eF3gAbNNLwTPhgtj58/fhMScKy6E6vydYY=;
        b=aMcDZUw0oCpo9YRfCyBmegSHoivLcGDyBQ95VKOwStftMp00spJ/rpKinhF0FqlPlu
         ilR9IK1aCi9UjAsQ+Q2eWToQA6JL22VGPrw+asP9JeTMcPayE+NLAlFzMfCv6pKorG+R
         OjaTgy3sRggnDiVxBFZ02IoPMbiQwH7gcM3wZXsMTveKTwV0H9R7Dwm86v6AgLpcg37/
         TyIne6pn5O5VHSHbg1LMvWbgBwiPYICaiPT2N66uvCPsUyxCO7gBDGNBvk9U/FK8ADcA
         gvkuYutnq3h3nl9G97QpvnTGJ/hRlwZWSNV+ZtvMjsIwVtioszi0AjuJAxmUn3SsrmRe
         VXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683763523; x=1686355523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+8v3lTv3eF3gAbNNLwTPhgtj58/fhMScKy6E6vydYY=;
        b=QfjYDoUWn7H00oyzeLByuG8sG4FQyHyHcWPm/TD0Nh1JkwTlmMfVDN8bSZpK2du2bt
         ymz/bg2tyU8HYmZ0OSHY5QsMvliMxPpRPq30l8PkZ7j1hSGP9eMZGV1RHVrnckJE161H
         lxRdhPAPGT/VnkwOyitpwAkRhYXLao9+ztPalX8yt4Mn7WCX5x6wSY2Jo4Nk6D5Y0zSC
         vTuJXLKxvkJdYt93weC5DopLAgH/cZ3kd8zRAdXFpmRKSh6SE36sHjgV1/gXMtPWxOK2
         Ruup9IUnKBiD/PZQ7GQyRojs36eU95n7ImQU2fAZvrdT6c0G5SZpR3NIkV8shSUcZBdZ
         jnRw==
X-Gm-Message-State: AC+VfDxQfDkrv/dRF0ivNUeZba/dKgRVxFmVNLxw2408AUdIHvKtUjnC
	nCEUNziZd9oPQmsF4Js1/d8AUcFfXEOtUB+80sOvSw==
X-Google-Smtp-Source: ACHHUZ6NYpikewAqy/KBFgbWhK3AZyUBaYd3J3XrlZ2EqmW2eDx5O3EzAwGdaB9COrOAA1Z9CgDhjPjVb+0CFzGaNDo=
X-Received: by 2002:ac8:5a10:0:b0:3de:1aaa:42f5 with SMTP id
 n16-20020ac85a10000000b003de1aaa42f5mr69541qta.15.1683763523237; Wed, 10 May
 2023 17:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230506021450.3499232-1-irogers@google.com> <ZFvVvp0tYqxHWFsB@kernel.org>
In-Reply-To: <ZFvVvp0tYqxHWFsB@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 10 May 2023 17:05:09 -0700
Message-ID: <CAP-5=fVmFRxD1=3pX5yG_T=a=_pnU-OtXbNLnwMmTxjHv2itgw@mail.gmail.com>
Subject: Re: [PATCH v1] perf build: Add system include paths to BPF builds
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Song Liu <songliubraving@meta.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Andrii Nakryiko <andrii.nakryiko@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_170527_728804_73A6B9A8 
X-CRM114-Status: GOOD (  26.17  )
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

T24gV2VkLCBNYXkgMTAsIDIwMjMgYXQgMTA6MzXigK9BTSBBcm5hbGRvIENhcnZhbGhvIGRlIE1l
bG8KPGFjbWVAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBFbSBGcmksIE1heSAwNSwgMjAyMyBhdCAw
NzoxNDo1MFBNIC0wNzAwLCBJYW4gUm9nZXJzIGVzY3JldmV1Ogo+ID4gVGhlcmUgYXJlIGluc3Vm
ZmljaWVudCBoZWFkZXJzIGluIHRvb2xzL2luY2x1ZGUgdG8gc2F0aXNmeSBidWlsZGluZwo+ID4g
QlBGIHByb2dyYW1zIGFuZCB0aGVpciBoZWFkZXIgZGVwZW5kZW5jaWVzLiBBZGQgdGhlIHN5c3Rl
bSBpbmNsdWRlCj4gPiBwYXRocyBmcm9tIHRoZSBub24tQlBGIGNsYW5nIGNvbXBpbGUgc28gdGhh
dCB0aGVzZSBoZWFkZXJzIGNhbiBiZQo+ID4gZm91bmQuCj4gPgo+ID4gVGhpcyBjb2RlIHdhcyB0
YWtlbiBmcm9tOgo+ID4gdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPgo+ID4gLS0t
Cj4gPiAgdG9vbHMvcGVyZi9NYWtlZmlsZS5wZXJmIHwgMjAgKysrKysrKysrKysrKysrKysrKy0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL01ha2VmaWxlLnBlcmYgYi90b29scy9wZXJmL01h
a2VmaWxlLnBlcmYKPiA+IGluZGV4IDYxYzMzZDEwMGIyYi4uMzdiZWZkZmE4YWM4IDEwMDY0NAo+
ID4gLS0tIGEvdG9vbHMvcGVyZi9NYWtlZmlsZS5wZXJmCj4gPiArKysgYi90b29scy9wZXJmL01h
a2VmaWxlLnBlcmYKPiA+IEBAIC0xMDU3LDcgKzEwNTcsMjUgQEAgJChTS0VMX1RNUF9PVVQpICQo
TElCQVBJX09VVFBVVCkgJChMSUJCUEZfT1VUUFVUKSAkKExJQlBFUkZfT1VUUFVUKSAkKExJQlNV
QkNNRF8KPiA+Cj4gPiAgaWZuZGVmIE5PX0JQRl9TS0VMCj4KPiBTbyB0aGlzIHBhdGNoIHdhcyBk
b25lIGJlZm9yZSB0aGUgcmV2ZXJ0cywgSSBhZGp1c3RlZCBpdCB0byB3aGF0IGlzCj4gdXBzdHJl
YW0gYW5kIHRvIGFub3RoZXIgcGF0Y2ggdGhhdCBtYWtlcyB0aGUgYnVpbGQgdXNlIHRoZSBoZWFk
ZXJzIGZyb20KPiB0aGUgcGVyZiBzb3VyY2VzIGluc3RlYWQgb2YgdGhlIHN5c3RlbSdzIChsaW51
eC9icGYuaCBhbmQKPiBsaW51eC9wZXJmX2V2ZW50LmgsIGZyb20gdm1saW51eC5oKSwgcGxlYXNl
IHRha2UgYSBsb29rIGF0IHRoZSBwYXRjaAo+IGJlbG93LCBJJ20gYWxzbyB0cnlpbmcgdG8gZmln
dXJlIG91dCB0aGF0IG90aGVyIHByb2JsZW0geW91IHBvaW50ZWQgd2l0aAo+IGxpbnV4L3R5cGVz
LnMgOi1cCj4KPiBXaGF0IEkgaGF2ZSBub3cgaW4gdG1wLnBlcmYtdG9vbHM6Cj4KPiDirKJbYWNt
ZUB0b29sYm94IHBlcmYtdG9vbHNdJCBnaXQgbG9nIC0tb25lbGluZSB0b3J2YWxkcy9tYXN0ZXIu
Lgo+IGEyYWYwZjZiOGVmN2VhNDAgKEhFQUQgLT4gcGVyZi10b29scykgcGVyZiBidWlsZDogQWRk
IHN5c3RlbSBpbmNsdWRlIHBhdGhzIHRvIEJQRiBidWlsZHMKPiA1YmU2Y2VjZGEwODAyZjIzIHBl
cmYgYnBmIHNrZWxzOiBNYWtlIHZtbGludXguaCB1c2UgYnBmLmggYW5kIHBlcmZfZXZlbnQuaCBp
biBzb3VyY2UgZGlyZWN0b3J5Cj4gN2QxNjExNjVkOTA3MmRjYiBwZXJmIHBhcnNlLWV2ZW50czog
RG8gbm90IGJyZWFrIHVwIEFVWCBldmVudCBncm91cAo+IGE0NjgwODUwMTFlYThiYmEgcGVyZiB0
ZXN0IHRlc3RfaW50ZWxfcHQuc2g6IFRlc3Qgc2FtcGxlIG1vZGUgd2l0aCBldmVudCB3aXRoIFBN
VSBuYW1lCj4gMTIzMzYxNjU5ZmE0MDVkZSBwZXJmIGV2c2VsOiBNb2RpZnkgZ3JvdXAgcG11IG5h
bWUgZm9yIHNvZnR3YXJlIGV2ZW50cwo+IDM0ZTgyODkxZDk5NWFiODkgdG9vbHMgYXJjaCB4ODY6
IFN5bmMgdGhlIG1zci1pbmRleC5oIGNvcHkgd2l0aCB0aGUga2VybmVsIHNvdXJjZXMKPiA3MDUw
NDljYTRmNWI3YjAwIHRvb2xzIGhlYWRlcnMga3ZtOiBTeW5jIHVhcGkve2FzbS9saW51eH0ga3Zt
LmggaGVhZGVycyB3aXRoIHRoZSBrZXJuZWwgc291cmNlcwo+IDhkNmE0MWM4MDY1ZTExMjAgdG9v
bHMgaW5jbHVkZSBVQVBJOiBTeW5jIHRoZSBzb3VuZC9hc291bmQuaCBjb3B5IHdpdGggdGhlIGtl
cm5lbCBzb3VyY2VzCj4gOTJiOGU2MWU4ODM1MTA5MSB0b29scyBoZWFkZXJzIFVBUEk6IFN5bmMg
dGhlIGxpbnV4L2NvbnN0Lmggd2l0aCB0aGUga2VybmVsIGhlYWRlcnMKPiBlN2VjM2EyNDljMzhh
OWM5IHRvb2xzIGhlYWRlcnMgVUFQSTogU3luYyB0aGUgaTkxNV9kcm0uaCB3aXRoIHRoZSBrZXJu
ZWwgc291cmNlcwo+IGU2MjMyMTgwZTUyNGUxMTIgdG9vbHMgaGVhZGVycyBVQVBJOiBTeW5jIHRo
ZSBkcm0vZHJtLmggd2l0aCB0aGUga2VybmVsIHNvdXJjZXMKPiA1ZDFhYzU5ZmY3NDQ1ZTUxIHRv
b2xzIGhlYWRlcnMgVUFQSTogU3luYyB0aGUgbGludXgvaW4uaCB3aXRoIHRoZSBrZXJuZWwgc291
cmNlcwo+IGIwNjE4ZjM4ZTJhYjhjZTMgcGVyZiBidWlsZDogR3JhY2VmdWxseSBmYWlsIHRoZSBi
dWlsZCBpZiBCVUlMRF9CUEZfU0tFTD0xIGlzIHNwZWNpZmllZCBhbmQgY2xhbmcgaXNuJ3QgYXZh
aWxhYmxlCj4gNWYwYjg5ZTYzMmVkODFiNiBwZXJmIHRlc3QgamF2YSBzeW1ib2w6IFJlbW92ZSBu
ZWVkbGVzcyBkZWJ1Z2luZm9kIHF1ZXJpZXMKPiAzMjdkYWYzNDU1NGQyMGE2IHBlcmYgcGFyc2Ut
ZXZlbnRzOiBEb24ndCByZW9yZGVyIHVuZ3JvdXBlZCBldmVudHMgYnkgUE1VCj4gY2NjNjZjNjA5
MjgwMmQ2OCBwZXJmIG1ldHJpYzogSlNPTiBmbGFnIHRvIG5vdCBncm91cCBldmVudHMgaWYgZ2F0
aGVyaW5nIGEgbWV0cmljIGdyb3VwCj4gMWIxMTQ4MjQxMDZjYTQ2OCBwZXJmIHN0YXQ6IEludHJv
ZHVjZSBza2lwcGFibGUgZXZzZWxzCj4gMmE5MzljODY5NTAzNWIxMSBwZXJmIG1ldHJpYzogQ2hh
bmdlIGRpdmlkZSBieSB6ZXJvIGFuZCAhc3VwcG9ydCBldmVudHMgYmVoYXZpb3IKPiDirKJbYWNt
ZUB0b29sYm94IHBlcmYtdG9vbHNdJAo+Cj4gUGxlYXNlIGhlbHAgbWUgdGVzdCB0aGlzLAoKYnVp
bGQtdGVzdCBhbmQgY29tcGlsaW5nIHdpdGgvd2l0aG91dCBCUEYgc2tlbGV0b25zIGxvb2tlZCBv
a2F5IGluCnBlcmYgdGVzdCBvbiBteSBEZWJpYW4gZGVyaXZlZCBkaXN0cm8uCgpUaGFua3MsCklh
bgoKPiBSZWdhcmRzLAo+Cj4gLSBBcm5hbGRvCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
