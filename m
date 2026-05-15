Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5284CD4F3C
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 19:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R4bM+RUyMBmPWb6Lgr17OtsRNc4JcHBRDvwrKGjom9E=; b=GQ77/DG123/h0W
	yAGxuYwZ4xV/6L/jWcPFLhQjfjySB04/Jbv8MRWKCEl/osXl7qMkHv29BR/4dAge1pruji/aTH3Ej
	xOk2tR+BygjBFWHB7qq6WgR46THzyoEmVVxEbpRiq2KUIytYkqXIfl2ZsKzRWikDSreWQJu6SjBmZ
	mgMMcGoS90QS762rmG3v68ZZrQ7Pu8COb8PDE9druzQB0GhbLuFfXx5XeZCGco7ax9hG0uOaqZ0Po
	7UoRsSCQB7eBi0zcxEvjJtq6gCaLsZO08oWiMQR0r+5b+E6pBqhYBKUS7bnbqGNYEo8Dafxv9UgwK
	3FnEto7zA7WmexhPoVFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNy7p-00000009CeW-0BQ8;
	Fri, 15 May 2026 19:23:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNy7m-00000009Cdt-21U8;
	Fri, 15 May 2026 19:23:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5C9D40479;
	Fri, 15 May 2026 19:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 307ADC2BCB0;
	Fri, 15 May 2026 19:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778872985;
	bh=rXrB5o+6rkXZT2JMvoo5wjhRNclAQqhZfhQ8nzbLo+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G/WA/N4r5rSx+OuM+K9jt7MzFmS/gWxdrwn7IeTlyv3ItM4HJchKbCCMDnJsClmiC
	 O6chCr5oLBFovafc3glQjjdi8s537VNJWH+1GXK2TIMC2AwXxi8kyvY6C2zDwGGMKx
	 oc3/OCOKwpy3dQUumtfwfor7x1XCQKMvCMYHs/3zc2Tprp4C95oym5YMDRX7OV2qq6
	 P0gy8tPydRF5Acnp1NJ3+dxVry0WQIphXmqZCWJDkxZZkFp4wIrkzec9Pjm3u/p+m9
	 ZPh0qZfvJCttFifgZTWakzsrl4eflaUXR6XOZ62hJ813bVrHj0NlQlwEIgHSJ4/+nJ
	 uHVi19JmuoaiA==
Date: Fri, 15 May 2026 16:23:02 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com,
	james.clark@linaro.org, namhyung@kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Li Guan <guanli.oerv@isrc.iscas.ac.cn>, 9erthalion6@gmail.com,
	alex@ghiti.fr, alexander.shishkin@linux.intel.com,
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu,
	atrajeev@linux.ibm.com, howardchu95@gmail.com,
	john.g.garry@oracle.com, jolsa@kernel.org, leo.yan@linux.dev,
	libunwind-devel@nongnu.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org, mingo@redhat.com,
	palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org,
	shimin.guo@skydio.com, tglozar@redhat.com, tmricht@linux.ibm.com,
	will@kernel.org
Subject: Re: [PATCH v5 4/7] perf unwind-libunwind: Make libunwind register
 reading cross platform
Message-ID: <agdyluuau3wPQOtX@x1>
References: <20260413024805.1316480-1-irogers@google.com>
 <20260513233151.572332-1-irogers@google.com>
 <20260513233151.572332-5-irogers@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260513233151.572332-5-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_122306_566847_C0B78E6D 
X-CRM114-Status: GOOD (  11.55  )
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMDQ6MzE6NDhQTSAtMDcwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvdG9vbHMvcGVyZi91dGlsL2xpYnVud2luZC1hcmNo
L2xpYnVud2luZC1wcGMzMi5jCj4gQEAgLTAsMCArMSwzMSBAQAo+ICsvLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgo+ICsjaW5jbHVkZSAibGlidW53aW5kLWFyY2gu
aCIKPiArI2luY2x1ZGUgIi4uL2RlYnVnLmgiCj4gKyNpbmNsdWRlICIuLi8uLi8uLi9hcmNoL3Bv
d2VycGMvaW5jbHVkZS91YXBpL2FzbS9wZXJmX3JlZ3MuaCIKPiArI2luY2x1ZGUgPGxpbnV4L2Nv
bXBpbGVyLmg+Cj4gKyNpbmNsdWRlIDxlcnJuby5oPgo+ICsKPiArI2lmZGVmIEhBVkVfTElCVU5X
SU5EX1BQQzMyX1NVUFBPUlQKPiArI2luY2x1ZGUgPGxpYnVud2luZC1wcGMzMi5oPgo+ICsjZW5k
aWYKPiArCj4gK2ludCBfX2dldF9wZXJmX3JlZ251bV9mb3JfdW53X3JlZ251bV9wcGMzMihpbnQg
dW53X3JlZ251bSBfX21heWJlX3VudXNlZCkKPiArewo+ICsjaWZuZGVmIEhBVkVfTElCVU5XSU5E
X1BQQzMyX1NVUFBPUlQKPiArCXJldHVybiAtRUlOVkFMOwo+ICsjZWxzZQo+ICsJc3dpdGNoICh1
bndfcmVnbnVtKSB7Cj4gKwljYXNlIFVOV19QUEMzMl9SMCAuLi4gVU5XX1BQQzMyX1IzMToKPiAr
CQlyZXR1cm4gdW53X3JlZ251bSAtIFVOV19QUEMzMl9SMCArIFBFUkZfUkVHX1BPV0VSUENfUjA7
Cj4gKwljYXNlIFVOV19QUEMzMl9MUjoKPiArCQlyZXR1cm4gUEVSRl9SRUdfUE9XRVJQQ19MSU5L
Owo+ICsJY2FzZSBVTldfUFBDMzJfQ1RSOgo+ICsJCXJldHVybiBQRVJGX1JFR19QT1dFUlBDX0NU
UjsKPiArCWNhc2UgVU5XX1BQQzMyX1hFUjoKPiArCQlyZXR1cm4gUEVSRl9SRUdfUE9XRVJQQ19Y
RVI7Cj4gKwlkZWZhdWx0Ogo+ICsJCXByX2VycigidW53aW5kOiBpbnZhbGlkIHJlZyBpZCAlZFxu
IiwgdW53X3JlZ251bSk7Cj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwl9Cj4gKyNlbmRpZiAvLyBI
QVZFX0xJQlVOV0lORF9QUEMzMl9TVVBQT1JUCgpUbyBhZGRyZXNzIHRoaXMgbG9jYWwgc2FzaGlr
byBjb21tZW50OgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCklzIHRoZSBpbnN0cnVjdGlvbiBwb2ludGVyIChOSVApIGludGVudGlv
bmFsbHkgb21pdHRlZCBmcm9tIHRoaXMgc3dpdGNoCnN0YXRlbWVudD8KCldoZW4gbGlidW53aW5k
IGF0dGVtcHRzIHRvIHJlYWQgdGhlIGluc3RydWN0aW9uIHBvaW50ZXIsIHdpbGwgYWNjZXNzX3Jl
ZygpCmhpdCB0aGUgZGVmYXVsdCBjYXNlIGhlcmUgYW5kIHJldHVybiAtRUlOVkFMLCBjYXVzaW5n
IHN0YWNrIHVud2luZGluZwp0byBmYWlsIG9uIDMyLWJpdCBQb3dlclBDIGFyY2hpdGVjdHVyZXM/
CkZvciBjb21wYXJpc29uLCB0aGUgNjQtYml0IGltcGxlbWVudGF0aW9uIGluIGxpYnVud2luZC1w
cGM2NC5jIGNvcnJlY3RseQptYXBzIFVOV19QUEM2NF9OSVAgdG8gUEVSRl9SRUdfUE9XRVJQQ19O
SVAuCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQoKSSBhbW1lbmRlZCB0aGlzIHBhdGNoIHdpdGg6CgrirKIgW2FjbWVAdG9vbGJ4IHBl
cmYtdG9vbHMtbmV4dF0kIHZpbSB0b29scy9wZXJmL3V0aWwvbGlidW53aW5kLWFyY2gvbGlidW53
aW5kLXBwYzMyLmMK4qyiIFthY21lQHRvb2xieCBwZXJmLXRvb2xzLW5leHRdJCBnaXQgZGlmZgpk
aWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi91dGlsL2xpYnVud2luZC1hcmNoL2xpYnVud2luZC1wcGMz
Mi5jIGIvdG9vbHMvcGVyZi91dGlsL2xpYnVud2luZC1hcmNoL2xpYnVud2luZC1wcGMzMi5jCmlu
ZGV4IGJjZGVlZDM0ZDBhODFiOGQuLjk3NmExNjAzMDQwNzM1ODIgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L3BlcmYvdXRpbC9saWJ1bndpbmQtYXJjaC9saWJ1bndpbmQtcHBjMzIuYworKysgYi90b29scy9w
ZXJmL3V0aWwvbGlidW53aW5kLWFyY2gvbGlidW53aW5kLXBwYzMyLmMKQEAgLTIzLDYgKzIzLDgg
QEAgaW50IF9fZ2V0X3BlcmZfcmVnbnVtX2Zvcl91bndfcmVnbnVtX3BwYzMyKGludCB1bndfcmVn
bnVtIF9fbWF5YmVfdW51c2VkKQogICAgICAgICAgICAgICAgcmV0dXJuIFBFUkZfUkVHX1BPV0VS
UENfQ1RSOwogICAgICAgIGNhc2UgVU5XX1BQQzMyX1hFUjoKICAgICAgICAgICAgICAgIHJldHVy
biBQRVJGX1JFR19QT1dFUlBDX1hFUjsKKyAgICAgICBjYXNlIFVOV19QUEMzMl9OSVA6CisgICAg
ICAgICAgICAgICByZXR1cm4gUEVSRl9SRUdfUE9XRVJQQ19OSVA7CiAgICAgICAgZGVmYXVsdDoK
ICAgICAgICAgICAgICAgIHByX2VycigidW53aW5kOiBpbnZhbGlkIHJlZyBpZCAlZFxuIiwgdW53
X3JlZ251bSk7CiAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsK4qyiIFthY21lQHRvb2xi
eCBwZXJmLXRvb2xzLW5leHRdJAoKT2s/IEl0IHdhcyB0aGUgb25seSBpc3N1ZSBmb3VuZCBpbiB0
aGlzIHBhdGNoLgoKLSBBcm5hbGRvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
