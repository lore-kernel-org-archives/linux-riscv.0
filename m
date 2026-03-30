Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0635E1061B1A
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 18:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3X6ZUMhvVU29W6o9fSzcAvv00ErCDwuL0/7DjncXNGQ=; b=2qgs1qNvXuIoEb
	BCDwEtX1GLq6sUA+lOjfHDhJJstijldn1/650Y+GIO44H34AG8IGM+8QN8kr6+MMdVu6WEduBZ+iO
	DGXHSFWH6/jzenJglrJslyhauARIZTNw22JVSpKkmvz1U3z+nBtbp/dmTjTS7f9xL6a5fLI2gLGez
	PIrgw4M4VZLi/3wAoQpf/QyZUscpHhMCCQXwem1Hl3jVdMJcC4+4j7mq+1vZG/YcqSiXj1UJVgt+w
	MSxC6YoB9RO5kQdc3ovYj9ggCIobnOolF1KXpXCwHEQ4cNUaoPsxsWxSt6o15HuHA4vuAl4wsLeOO
	Et9T0a4i3nQyXizU0xfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Hfo-0000000BkM3-1ANQ;
	Mon, 30 Mar 2026 18:49:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Hfm-0000000BkLa-0bfl;
	Mon, 30 Mar 2026 18:49:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED25760120;
	Mon, 30 Mar 2026 18:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C60C4CEF7;
	Mon, 30 Mar 2026 18:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774896552;
	bh=8Nm/1L5pkcNmWQAXmMT+fbxFBk8UnQjXHBqgXHaaHgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tyWJNud7VTB0Kze7DFHOX6R1mGabF5cICm9Wqxrz7xdeh6RWsSepDjX70jfbiprIW
	 FirODeC5ftC0ly5hvgFC5ddpc1Ikv+m+gHd0g/u376HR7zVDiSZ3e3E/ob61YCSTfE
	 B4Y04uuiAS9kdYUKHydxzvjuJ4hMaVAG8M9YHOI0IhxY3vR0Z03vkAPD//3+NtX+9Y
	 irudrODOVYvyy1PZmVFR9dJPzr8/gLmhdYkmhV2wyKKNJbK/bn//f0W9waEK5sMbRl
	 AFDnXYTItUorwOwaHG9MFib1ROV3arzXFmYUlraOcscwlNdLOMpvJJrw5Dpa51dHiD
	 hTyw3hJ1zid/g==
Date: Mon, 30 Mar 2026 15:49:09 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Namhyung Kim <namhyung@kernel.org>, 9erthalion6@gmail.com,
	adrian.hunter@intel.com, alex@ghiti.fr,
	alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu, atrajeev@linux.ibm.com,
	blakejones@google.com, ctshao@google.com,
	dapeng1.mi@linux.intel.com, howardchu95@gmail.com,
	james.clark@linaro.org, john.g.garry@oracle.com, jolsa@kernel.org,
	leo.yan@linux.dev, libunwind-devel@nongnu.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	mingo@redhat.com, palmer@dabbelt.com, peterz@infradead.org,
	pjw@kernel.org, shimin.guo@skydio.com, tglozar@redhat.com,
	tmricht@linux.ibm.com, will@kernel.org, amadio@gentoo.org,
	yuzhuo@google.com
Subject: Re: [PATCH v1 0/2] perf build: Remove libunwind support
Message-ID: <acrFpcLxvHNOcQ8N@x1>
References: <abxs-2rozL1tBEO1@google.com>
 <20260321234220.848859-1-irogers@google.com>
 <acW4Z2KJbyPZM1SG@google.com>
 <acbjjwc-WCk1CwtF@x1>
 <CAP-5=fXmBpqP86FT85sA_BZYRnzwbZ5joYLogCqON6fjXCkRHQ@mail.gmail.com>
 <acbxyzN4XKczgpLg@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acbxyzN4XKczgpLg@x1>
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

T24gRnJpLCBNYXIgMjcsIDIwMjYgYXQgMDY6MDg6MjdQTSAtMDMwMCwgQXJuYWxkbyBDYXJ2YWxo
byBkZSBNZWxvIHdyb3RlOgo+IE9uIEZyaSwgTWFyIDI3LCAyMDI2IGF0IDAxOjM3OjIwUE0gLTA3
MDAsIElhbiBSb2dlcnMgd3JvdGU6Cj4gPiBPbiBGcmksIE1hciAyNywgMjAyNiBhdCAxOjA34oCv
UE0gQXJuYWxkbyBDYXJ2YWxobyBkZSBNZWxvIDxhY21lQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4g
PiBUaGlzIGlzIGFuIGFyZWEgdGhhdCBpcyB0cmlja3kgYW5kIHNpbmNlIHdlIF9hbHJlYWR5XyBo
YXZlIHR3bwo+ID4gPiBpbXBsZW1lbnRhdGlvbnMsIHRoZSBnb29kIHRoaW5nIGZvciByZWdyZXNz
aW9uIHRlc3Rpbmcgd291bGQgYmUgdGhlCj4gPiA+IGNvbXBhcmUgdGhlaXIgcmVzdWx0cyB1bnRp
bCBsaWJ1bndpbmQgYmVjb21lcyBjb21wbGV0ZWx5IHJvdHRlbiBhbmQKPiA+ID4gdW51c2FibGU/
Cj4gPiAKPiA+IE15IHNlcmllczoKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAy
NjAzMDUyMjE5MjcuMzIzNzE0NS0xLWlyb2dlcnNAZ29vZ2xlLmNvbS8KPiA+IG1ha2VzIGxpYmR3
IGFuZCBsaWJ1bndpbmQgc3VwcG9ydGVkIHRvZ2V0aGVyOgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGttbC8yMDI2MDMwNTIyMTkyNy4zMjM3MTQ1LTItaXJvZ2Vyc0Bnb29nbGUuY29tLwo+
ID4gIiIiCj4gPiBUaGlzIGNvbW1pdCByZWZhY3RvcnMgdGhlIERXQVJGIHVud2luZCBwb3N0LXBy
b2Nlc3NpbmcgdG8gYmUKPiA+IGNvbmZpZ3VyYWJsZSBhdCBydW50aW1lIHZpYSB0aGUgLnBlcmZj
b25maWcgZmlsZSBvcHRpb24KPiA+ICd1bndpbmQuc3R5bGUnLCBvciB1c2luZyB0aGUgYXJndW1l
bnQgJy0tdW53aW5kLXN0eWxlJyBpbiB0aGUgY29tbWFuZHMKPiA+ICdwZXJmIHJlcG9ydCcsICdw
ZXJmIHNjcmlwdCcgYW5kICdwZXJmIGluamVjdCcsIGluIGEgc2ltaWxhciBtYW5uZXIgdG8KPiA+
IHRoZSBhZGRyMmxpbmUgb3IgdGhlIGRpc2Fzc2VtYmxlciBzdHlsZS4KPiA+ICIiIgo+ID4gVGhh
dCBzZXJpZXMgY2xlYW5zIHVwIHNldmVyYWwgb3RoZXIgaXNzdWVzLCB3aGljaCBpcyB3aHkgSSB0
aGluayBpdCBpcwo+ID4gd29ydGggbGFuZGluZyB3aGlsZSB3ZSB3YWl0IGZvciBsaWJkdyB0byBi
ZWNvbWUgc3RhYmxlLgo+IAo+IENvb2wsIEknbGwgdHJ5IGFuZCByZXZpZXcvdGVzdCBpdCB0aGlz
IHdlZWtlbmQuCj4gCj4gVGhhbmtzIGZvciBwb2ludGludCBpdCBvdXQhCgpQb2ludGluZywgbG9v
a2luZyBhdCBpdCBub3csIG9uZSBjb21tZW50IHNvIGZhciwgcmVtb3ZlIHRoYXQgbmV3IGJsYW5r
CmxpbmUsIHRlc3RpbmcuLi4KCuKsoiBbYWNtZUB0b29sYnggcGVyZi10b29scy1uZXh0XSQgICAg
ICAgIGdpdCBhbSAuL3YyXzIwMjYwMzA1X2lyb2dlcnNfcGVyZl9saWJ1bndpbmRfbXVsdGlwbGVf
cmVtb3RlX3N1cHBvcnQubWJ4CkFwcGx5aW5nOiBwZXJmIHVud2luZDogUmVmYWN0b3IgZ2V0X2Vu
dHJpZXMgdG8gYWxsb3cgZHluYW1pYyBsaWJkdy9saWJ1bndpbmQgc2VsZWN0aW9uCi5naXQvcmVi
YXNlLWFwcGx5L3BhdGNoOjEyODogbmV3IGJsYW5rIGxpbmUgYXQgRU9GLgorCndhcm5pbmc6IDEg
bGluZSBhZGRzIHdoaXRlc3BhY2UgZXJyb3JzLgpBcHBseWluZzogcGVyZiBidWlsZCBsb29uZ2Fy
Y2g6IFJlbW92ZSByZWZlcmVuY2UgdG8gbWlzc2luZyBmaWxlCkFwcGx5aW5nOiB0b29scyBidWls
ZDogRGVkdXBsaWNhdGUgdGVzdC1saWJ1bndpbmQgZm9yIGRpZmZlcmVudCBhcmNoaXRlY3R1cmVz
CkFwcGx5aW5nOiBwZXJmIGJ1aWxkOiBCZSBtb3JlIHByb2dyYW1tYXRpYyB3aGVuIHNldHRpbmcg
dXAgbGlidW53aW5kIHZhcmlhYmxlcwpBcHBseWluZzogcGVyZiB1bndpbmQtbGlidW53aW5kOiBN
YWtlIGxpYnVud2luZCByZWdpc3RlciByZWFkaW5nIGNyb3NzIHBsYXRmb3JtCkFwcGx5aW5nOiBw
ZXJmIHVud2luZC1saWJ1bndpbmQ6IE1vdmUgZmx1c2gvZmluaXNoIGFjY2VzcyBvdXQgb2YgbG9j
YWwKQXBwbHlpbmc6IHBlcmYgdW53aW5kLWxpYnVud2luZDogUmVtb3ZlIGxpYnVud2luZC1sb2Nh
bApBcHBseWluZzogcGVyZiB1bndpbmQtbGlidW53aW5kOiBBZGQgUklTQy1WIGxpYnVud2luZCBz
dXBwb3J0CuKsoiBbYWNtZUB0b29sYnggcGVyZi10b29scy1uZXh0XSQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
