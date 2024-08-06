Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DDCC3DA64
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 03:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DNw4pqqCynGgykxwUCva2n/wwA33cxseq6kAQRrGGJo=; b=aaV2fFDxHQw3DQ
	IdhQaYn4VR2N9JIg/gVSdzfTlnFkXKJqE+sa5KBptY6wAbxymXZ07G1fRvoa+hcSkYKO2Gs1pOP2N
	TjH+KdzjEM8NqO1wH/nBEjtLuTqEioXDUzg0poSSXBTMwy0tYHEqUhhJgS99+KiC6XgFom1eTrbj8
	+SwhxMiRWfjCuWtQP+29vyhzcTzaEp4YEBfrsCJjfv0d9RzJYe6jnJ/n2XUYCgOlFASyDrxFTPN03
	wO9AMTBwu5BhXpSpeH0cHD2scEEPyD3xY1wsmuVKfPUhVSTLsiVitfWUk7hAdpzckZ24o0CHrR753
	Y40/hRGsbi1LJN5plS+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbBHk-00000000QDz-1kXL;
	Tue, 06 Aug 2024 03:54:56 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbBHC-00000000Q9d-1br6
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 03:54:25 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2f035ae0fd1so2010391fa.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 20:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1722916460; x=1723521260; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvzMXnNtbinIR6sxB9Vjeo1DnbXtPT7sraVJvvh8AKs=;
        b=JVqOHWRktgntcWzpd7FTbymqlqWyZg6DCXQsbZb9EPTdNhi7gNFHGyXvALSd6Sr0pv
         3OKxu3rIooGH1s7CMuW1yQMSnJMkCCaxx1XAHDCCcxzGsKRyYBW7GWnxWmlFoZtVo3O/
         WSA/02r0RJUiHsZ40FP74nDtodJ/C2W26gsCZYd4BBpwKY7TIigt+o3agYBgveSYqnIN
         4wpz4nZ0re9XE4mSG/xk8D0cAZ8h8sdTwMZsqe5rJNw5rZjTcQWj7Ww4r8LcM82vU3eo
         /tbIYoA3RP3kKilJVbGj0ZMRJ5Csf45ggxrynmgdWDBr0U5kLvO/ARZ398p5i4KCywff
         80KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722916460; x=1723521260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvzMXnNtbinIR6sxB9Vjeo1DnbXtPT7sraVJvvh8AKs=;
        b=UeClzDCBVucMzdNimzkVNwphzPc1uJLvc9RLpQEdj7jybODts8QeSNV3alHSQ6xTmU
         rE9yy8v7Bc8puFnQk6Ju+Il/4In4hF3Cq7wqzA0S2LoVsusjMh3DN1Qj7hBNZlvr0tjy
         fI3MEqbJd7FPkkLGDy4e00PHZm3WH3eywYZQ2lexfNmm0z0/RhXRpZUoHWw4d9XX96og
         vEcfGvH/J/ylkC199kbtr/10O1OdWEf4XLKXKF/y6Y99ilw91TGEjjw4JXw3kEYjNK2C
         IaGgXFnSyIUcRFnFsBD9CP1BfIUATmX4a80ihH+sxkYWGKyOfFm/abfyPawKGx8Xojrl
         tyew==
X-Forwarded-Encrypted: i=1; AJvYcCXHzthsCzCMjIcXfIY2luJpyxEY55pUj9+3eMvLSRv3+QYsKG+gNb1JdTGtlj8mgNfAnNJM+wC6zzIqk0Gv3H7/ss5t6rSlWrzeddn4DLsc
X-Gm-Message-State: AOJu0YyJbpGsiOmtCetF/HW4j34A10F8s3R4lpjGXNqn3+Cg/ndozfqX
	6XS8bBpP606m/h4UYZ3yncRKiwOCRfVTLiiwJWmGpwX8lAf2vc1bM49OVHmzgD2stsIadS1I7GJ
	vh90K1/gl3flBGqvvCysTHgQDNJPK4o1U2Yg/Tw==
X-Google-Smtp-Source: AGHT+IED+QfpVh2ns4r5CsCF2Hf7HG0ncsxihC0vDxBSVd4rH9+6r9D1hKisabpmLxEL8TLvLP+nRbgTy3vQUF0nLB0=
X-Received: by 2002:a2e:999a:0:b0:2ef:2f19:a8b3 with SMTP id
 38308e7fff4ca-2f15ab049f2mr93096061fa.41.1722916460054; Mon, 05 Aug 2024
 20:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240805194424.597244-1-irogers@google.com> <20240805194424.597244-4-irogers@google.com>
In-Reply-To: <20240805194424.597244-4-irogers@google.com>
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 6 Aug 2024 11:54:08 +0800
Message-ID: <CAPqJEFpiy307B4OBHK4WJGjgbVm_woUrdZ+Vy_LSdQ=ECqZX-Q@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] perf pmu-events: Remove duplicated riscv firmware event
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
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
X-CRM114-CacheID: sfid-20240805_205422_612495_10E13E7E 
X-CRM114-Status: GOOD (  15.31  )
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

SGkgSWFuLAoKSSd2ZSBzZW50IGEgcGF0Y2ggdG8gZml4IGl0IGFuZCB0aGUgcGF0Y2ggYWxyZWFk
eSBtZXJnZWQuIFRoYW5rcy4KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNzE5MTE1
MDE4LjI3MzU2LTEtZXJpYy5saW5Ac2lmaXZlLmNvbS8KCkJlc3QgcmVnYXJkcywKRXJpYyBMaW4K
CgpPbiBUdWUsIEF1ZyA2LCAyMDI0IGF0IDM6NDTigK9BTSBJYW4gUm9nZXJzIDxpcm9nZXJzQGdv
b2dsZS5jb20+IHdyb3RlOgo+Cj4gRldfU0ZFTkNFX1ZNQV9SRUNFSVZFRCBpcyByZXBlYXRlZCB0
d2ljZSBpbiB0aGUgZmlsZSB3aGljaCB3aWxsIGJyZWFrCj4gaW52YXJpYW50cyBpbiBwZXJmIGxp
c3QgYXMgZGlzY3Vzc2VkIGluIHRoaXMgdGhyZWFkOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXBlcmYtdXNlcnMvMjAyNDA3MTkwODE2NTEuMjQ4NTMtMS1lcmljLmxpbkBzaWZpdmUu
Y29tLwo+Cj4gU2lnbmVkLW9mZi1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPgo+
IC0tLQo+ICB0b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9hbmRlcy9heDQ1L2Zpcm13
YXJlLmpzb24gICAgICB8IDMgLS0tCj4gIHRvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2
L3NpZml2ZS91NzQvZmlybXdhcmUuanNvbiAgICAgIHwgMyAtLS0KPiAgLi4uL3BlcmYvcG11LWV2
ZW50cy9hcmNoL3Jpc2N2L3N0YXJmaXZlL2R1YmhlLTgwL2Zpcm13YXJlLmpzb24gfCAzIC0tLQo+
ICAuLi4vcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvdGhlYWQvYzkwMC1sZWdhY3kvZmlybXdh
cmUuanNvbiB8IDMgLS0tCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTIgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvYW5kZXMvYXg0NS9m
aXJtd2FyZS5qc29uIGIvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvYW5kZXMvYXg0
NS9maXJtd2FyZS5qc29uCj4gaW5kZXggOWI0YTAzMjE4NmE3Li41YTk5NmZhNGI4MzcgMTAwNjQ0
Cj4gLS0tIGEvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvYW5kZXMvYXg0NS9maXJt
d2FyZS5qc29uCj4gKysrIGIvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvYW5kZXMv
YXg0NS9maXJtd2FyZS5qc29uCj4gQEAgLTM1LDkgKzM1LDYgQEAKPiAgICB7Cj4gICAgICAiQXJj
aFN0ZEV2ZW50IjogIkZXX1NGRU5DRV9WTUFfUkVDRUlWRUQiCj4gICAgfSwKPiAtICB7Cj4gLSAg
ICAiQXJjaFN0ZEV2ZW50IjogIkZXX1NGRU5DRV9WTUFfUkVDRUlWRUQiCj4gLSAgfSwKPiAgICB7
Cj4gICAgICAiQXJjaFN0ZEV2ZW50IjogIkZXX1NGRU5DRV9WTUFfQVNJRF9SRUNFSVZFRCIKPiAg
ICB9LAo+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9zaWZp
dmUvdTc0L2Zpcm13YXJlLmpzb24gYi90b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9z
aWZpdmUvdTc0L2Zpcm13YXJlLmpzb24KPiBpbmRleCA5YjRhMDMyMTg2YTcuLjVhOTk2ZmE0Yjgz
NyAxMDA2NDQKPiAtLS0gYS90b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9zaWZpdmUv
dTc0L2Zpcm13YXJlLmpzb24KPiArKysgYi90b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNj
di9zaWZpdmUvdTc0L2Zpcm13YXJlLmpzb24KPiBAQCAtMzUsOSArMzUsNiBAQAo+ICAgIHsKPiAg
ICAgICJBcmNoU3RkRXZlbnQiOiAiRldfU0ZFTkNFX1ZNQV9SRUNFSVZFRCIKPiAgICB9LAo+IC0g
IHsKPiAtICAgICJBcmNoU3RkRXZlbnQiOiAiRldfU0ZFTkNFX1ZNQV9SRUNFSVZFRCIKPiAtICB9
LAo+ICAgIHsKPiAgICAgICJBcmNoU3RkRXZlbnQiOiAiRldfU0ZFTkNFX1ZNQV9BU0lEX1JFQ0VJ
VkVEIgo+ICAgIH0sCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jp
c2N2L3N0YXJmaXZlL2R1YmhlLTgwL2Zpcm13YXJlLmpzb24gYi90b29scy9wZXJmL3BtdS1ldmVu
dHMvYXJjaC9yaXNjdi9zdGFyZml2ZS9kdWJoZS04MC9maXJtd2FyZS5qc29uCj4gaW5kZXggOWI0
YTAzMjE4NmE3Li41YTk5NmZhNGI4MzcgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvcGVyZi9wbXUtZXZl
bnRzL2FyY2gvcmlzY3Yvc3RhcmZpdmUvZHViaGUtODAvZmlybXdhcmUuanNvbgo+ICsrKyBiL3Rv
b2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L3N0YXJmaXZlL2R1YmhlLTgwL2Zpcm13YXJl
Lmpzb24KPiBAQCAtMzUsOSArMzUsNiBAQAo+ICAgIHsKPiAgICAgICJBcmNoU3RkRXZlbnQiOiAi
RldfU0ZFTkNFX1ZNQV9SRUNFSVZFRCIKPiAgICB9LAo+IC0gIHsKPiAtICAgICJBcmNoU3RkRXZl
bnQiOiAiRldfU0ZFTkNFX1ZNQV9SRUNFSVZFRCIKPiAtICB9LAo+ICAgIHsKPiAgICAgICJBcmNo
U3RkRXZlbnQiOiAiRldfU0ZFTkNFX1ZNQV9BU0lEX1JFQ0VJVkVEIgo+ICAgIH0sCj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L3RoZWFkL2M5MDAtbGVnYWN5
L2Zpcm13YXJlLmpzb24gYi90b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi90aGVhZC9j
OTAwLWxlZ2FjeS9maXJtd2FyZS5qc29uCj4gaW5kZXggOWI0YTAzMjE4NmE3Li41YTk5NmZhNGI4
MzcgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvdGhlYWQv
YzkwMC1sZWdhY3kvZmlybXdhcmUuanNvbgo+ICsrKyBiL3Rvb2xzL3BlcmYvcG11LWV2ZW50cy9h
cmNoL3Jpc2N2L3RoZWFkL2M5MDAtbGVnYWN5L2Zpcm13YXJlLmpzb24KPiBAQCAtMzUsOSArMzUs
NiBAQAo+ICAgIHsKPiAgICAgICJBcmNoU3RkRXZlbnQiOiAiRldfU0ZFTkNFX1ZNQV9SRUNFSVZF
RCIKPiAgICB9LAo+IC0gIHsKPiAtICAgICJBcmNoU3RkRXZlbnQiOiAiRldfU0ZFTkNFX1ZNQV9S
RUNFSVZFRCIKPiAtICB9LAo+ICAgIHsKPiAgICAgICJBcmNoU3RkRXZlbnQiOiAiRldfU0ZFTkNF
X1ZNQV9BU0lEX1JFQ0VJVkVEIgo+ICAgIH0sCj4gLS0KPiAyLjQ2LjAucmMyLjI2NC5nNTA5ZWQ3
NmRjOC1nb29nCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
