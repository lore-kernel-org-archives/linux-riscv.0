Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4779DCD4851
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 20:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SLLSiOYkSLAobLJbpAvbCjytKU9fGFkSlQ+DYDc7s2Q=; b=Myw5vA3nznY3fh
	Y/33qNNmR0K1BCkn7kq0axcPGp54Ihx7+0Nff+MmFXXlxoWRWpLeq8GQ7qBQnjkEB+B5E2IkLMLDZ
	Hc6fVmVRGdKTGk99mOu2mNzb66oVlJGN4SU4oUJwkOqVdvosAWmy23r2Fm6XMS8/pB885Z1hWN0/l
	X5CNn+VOBGQXgY7V6QdmQj8yAYj5AOzBf/mQC8f98IbruD8/Z04ZUINxo68xj56LwoM9CK3Wqk+Ht
	f5aY36sZDDiOFJ5R5+z6erzerdsTtBSL8UW6aq5pQKELBsh71XfjzPitaxsnGvUIq5LozbYDgWiEV
	8Es+0wOFtadA7UcsItEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNzSq-00000009Po4-12YZ;
	Fri, 15 May 2026 20:48:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNzSn-00000009Pn3-0nzk;
	Fri, 15 May 2026 20:48:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CE164195D;
	Fri, 15 May 2026 20:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A77BC2BCB0;
	Fri, 15 May 2026 20:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778878132;
	bh=mnxRonVmc3SIVkJfuxHHi9gFpuH063Z0knM8Jl4+ZUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sY2x9j3tc+tNhoOAjU2yJZ7X/GCf60U9IvfrSx7LcvtPasbU2cxHxAKyv2I/l+x2b
	 WD8hAJuJ/HsTQafeO3rR4o8YjGHqPegt/gXQy0QhgLcRFVGGZG+K8YTa3FeFIfRcVI
	 6H5NSPaKbg2ZN75fKPC4Mjv0Hp0wMcE67ud5+WEmjT87runl0RBGG4ydGYCKA0n4IH
	 nuaPA6ApcBc6YTCMf/RNhArlzvQNxKRxTFCVMCj3PpvAHPA8srRQL/psG7sHJR/1CX
	 P2SXhwyzb655eVLIC9OI14twWN/GvvUPjPIyWADwFRXEa7yHS2xsn/6kwzhIHSYldV
	 IaFHoxPUu7HvA==
Date: Fri, 15 May 2026 17:48:48 -0300
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
Message-ID: <ageGsOVhDDKnvQhQ@x1>
References: <20260413024805.1316480-1-irogers@google.com>
 <20260513233151.572332-1-irogers@google.com>
 <20260513233151.572332-5-irogers@google.com>
 <agdyluuau3wPQOtX@x1>
 <CAP-5=fUeGOSH1LO1oSbWnpmXfv_RzxfFE+YCQ07PC19gLHDEsA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fUeGOSH1LO1oSbWnpmXfv_RzxfFE+YCQ07PC19gLHDEsA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_134853_253628_C910D847 
X-CRM114-Status: GOOD (  13.51  )
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

T24gRnJpLCBNYXkgMTUsIDIwMjYgYXQgMTI6Mzg6NDhQTSAtMDcwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBGcmksIE1heSAxNSwgMjAyNiBhdCAxMjoyM+KAr1BNIEFybmFsZG8gQ2FydmFsaG8g
ZGUgTWVsbyA8YWNtZUBrZXJuZWwub3JnPiB3cm90ZToKCj4gPiArKysgYi90b29scy9wZXJmL3V0
aWwvbGlidW53aW5kLWFyY2gvbGlidW53aW5kLXBwYzMyLmMKPiA+IEBAIC0yMyw2ICsyMyw4IEBA
IGludCBfX2dldF9wZXJmX3JlZ251bV9mb3JfdW53X3JlZ251bV9wcGMzMihpbnQgdW53X3JlZ251
bSBfX21heWJlX3VudXNlZCkKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gUEVSRl9SRUdfUE9X
RVJQQ19DVFI7Cj4gPiAgICAgICAgIGNhc2UgVU5XX1BQQzMyX1hFUjoKPiA+ICAgICAgICAgICAg
ICAgICByZXR1cm4gUEVSRl9SRUdfUE9XRVJQQ19YRVI7Cj4gPiArICAgICAgIGNhc2UgVU5XX1BQ
QzMyX05JUDoKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gUEVSRl9SRUdfUE9XRVJQQ19OSVA7
Cj4gPiAgICAgICAgIGRlZmF1bHQ6Cj4gPiAgICAgICAgICAgICAgICAgcHJfZXJyKCJ1bndpbmQ6
IGludmFsaWQgcmVnIGlkICVkXG4iLCB1bndfcmVnbnVtKTsKPiA+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPiA+IOKsoiBbYWNtZUB0b29sYnggcGVyZi10b29scy1uZXh0XSQKCj4g
PiBPaz8gSXQgd2FzIHRoZSBvbmx5IGlzc3VlIGZvdW5kIGluIHRoaXMgcGF0Y2guCiAKPiBMb29r
cyBnb29kLCB0aGUgTklQIGlzIGluIHRoZSBvcmlnaW5hbCBjb2RlIHRoYXQgSSBjb3BpZWQsIHNv
IEkgZG9uJ3QKPiB1bmRlcnN0YW5kIGhvdyBJIGxvc3QgdGhpcywgYnV0IGdvb2QgY2F0Y2ghCgpX
aGF0IEkgaGF2ZSBpcyBpbiB0bXAucGVyZi10b29scy1uZXh0LCBkb2luZyBhIGNvbnRhaW5lciBi
dWlsZCBub3csCnN0aWxsIG5lZWQgdG8gbG9vayBhdCB0aGUgb3RoZXIgZmluZGluZ3MsIGJ1dCB0
aGV5IHNlZW1zIGVpdGhlciB0cml2aWFsCm9yIGNvbXBsYWludHMgYWJvdXQgbWFraW5nICB0aGUg
YnVpbGQgdGltZSBtb3JlIGlubmVmaWNpZW50IGJ5IG5vdApjYWNoaW5nIHNvbWUgZmVhdHVyZSB0
ZXN0cywgc28gSSB0aGluayBJJ2xsIGZpeCB0aGUgdHJpdmlhbCBsaWtlIEkgZGlkCmluIHRoZSBh
Ym92ZSBjYXNlIChwb3N0aW5nIGRpZmZzIHRvIHRoZSBsaXN0KSBhbmQgbGVhdmUgdGhlIGJ1aWxk
IHRpbWUKZm9yIGxhdGVyIHNvIHRoYXQgd2UgbWFrZSBwcm9ncmVzcy4KCldpbGwgdHJ5IHRvIGRv
IHRoaXMgbGF0ZXIgdG9kYXkgc28gdGhhdCBJIHB1Ymxpc2ggaXQgdG8gcGVyZi10b29scy1uZXh0
CmZvciBpdCB0byBzb2FrIGEgYml0IGluIGxpbnV4LW5leHQuCgotIEFybmFsZG8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
