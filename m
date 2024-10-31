Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60487E68956
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 06:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jKBnRWKWazgjuT2sSudGf82QGeqiikn2yWTL05+VTPA=; b=bWvOSMYyI/6MGv
	VP2LpvksU6ZZTTDUBSET8FnV7XPzBCc2zlpzmbs2cZhQJhtGy0CcDdvYFTtKM9wRs6K0+XgR+VJN3
	ScK4c3EHYqi7Nlyj4eWHXTaKdwp56EljyJ/NTEUIgyRYOefHurzoBQLQR/N7hAo7GAQvjyqMCBze0
	UPU6bF5ACRsEa/zEG4c4TYHkJMis8TtVZ/MWF2jK97fgdR/znMdOtXWfflHU2zpEFUusMYPbFylSy
	DXjR526ITgcQmaxnUG5IHRpeu8lY22ejb6VDCzEdPahiSNTOrlDko7901yX0ACiEXf6Vc/i255+zz
	lj0JGmRGiHm0DEJYJeWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Opy-00000002hh4-0NIo;
	Thu, 31 Oct 2024 06:39:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Opv-00000002hgB-0OtH
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 06:39:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47983A434B0;
	Thu, 31 Oct 2024 06:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD7DC4CEC3;
	Thu, 31 Oct 2024 06:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730356753;
	bh=wmZlcSfbiMvha+zyF3fElD72hUqYGvHQwam70xsM8Nw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pWHZIGM9ygudLPKNds16EL4U5Y5A7GuA0hyOetdXS/Ccxy30pVVnqN8iPNuCh2Vm/
	 MWV3nI9qyFOsg8WO2aTpZZJIcf0irYLZh/bdLYJ7HJrQkACWos5oX+L0CV+Q9PYiuv
	 0+Kc/W4tMP7koUAN2KrpOfyDzUn6FFxmrcHnHHkhBOx7cI19scqVjv38b14apXMpll
	 bhKW6BKPt+YcoR3sVbwMcmHYSdOnk7DzqBp2vuJPd6epl0qmGO0C1krQvM13h5aeJw
	 jMuYQHLl7uln38ISnEcRJd0tlsnjYsCP9OknBELTNv/DCNWM0ZR5MyuIDOLR3kewHJ
	 +EhJ0biRI+Ewg==
Date: Wed, 30 Oct 2024 23:39:11 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH] perf, riscv: Wire up perf trace support for RISC-V
Message-ID: <ZyMmD1SdqpIg8Wox@google.com>
References: <20241024190353.46737-1-bjorn@kernel.org>
 <ZyF_whZ4Ez-jwd-W@google.com>
 <faa08151-3090-4c36-b4af-32f5378ac5a6@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <faa08151-3090-4c36-b4af-32f5378ac5a6@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_233915_215874_4F22214E 
X-CRM114-Status: GOOD (  14.60  )
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

SGVsbG8sCgpPbiBXZWQsIE9jdCAzMCwgMjAyNCBhdCAwODozMTozNUFNICswMTAwLCBBbGV4YW5k
cmUgR2hpdGkgd3JvdGU6Cj4gSGkgQmpvcm4sIE5hbWh5dW5nLAo+IAo+IE9uIDMwLzEwLzIwMjQg
MDE6MzcsIE5hbWh5dW5nIEtpbSB3cm90ZToKPiA+IEhlbGxvLAo+ID4gCj4gPiBPbiBUaHUsIE9j
dCAyNCwgMjAyNCBhdCAxMjowMzo1MVBNIC0wNzAwLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+ID4g
PiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gPiA+IAo+ID4gPiBS
SVNDLVYgZG9lcyBub3QgY3VycmVudGx5IHN1cHBvcnQgcGVyZiB0cmFjZSwgc2luY2UgdGhlIHN5
c3RlbSBjYWxsCj4gPiA+IHRhYmxlIGlzIG5vdCBnZW5lcmF0ZWQuCj4gPiA+IAo+ID4gPiBQZXJm
b3JtIHRoZSBjb3B5L3Bhc3RlIGV4ZXJjaXNlLCB3aXJpbmcgdXAgUklTQy1WIHN5c3RlbSBjYWxs
IHRhYmxlCj4gPiA+IGdlbmVyYXRpb24uCj4gPiBDYW4gYW55Ym9keSB3aXRoIFJJU0MtViBwbGVh
c2UgdGVzdCB0aGlzPwo+IAo+IAo+IFNvIGJlZm9yZSB0aGlzIHBhdGNoLCBJIGdldDoKPiAKPiBF
cnJvcjo6NUZpbGUgL3N5cy9rZXJuZWwvdHJhY2luZy8vZXZlbnRzL3Jhd19zeXNjYWxscy9zeXNf
KGVudGVyfGV4aXQpIG5vdAo+IGZvdW5kLgo+IEhpbnQ6wqDCoMKgIFBlcmhhcHMgdGhpcyBrZXJu
ZWwgbWlzc2VzIHNvbWUgQ09ORklHXyBzZXR0aW5nIHRvIGVuYWJsZSB0aGlzCj4gZmVhdHVyZT8u
Cj4gCj4gQWZ0ZXIgYXBwbHlpbmcgdGhpcyBwYXRjaCwgSSBnZXQgYSBwcm9wZXIgdHJhY2U6Cj4g
Li4uLgo+IAo+IMKgwqDCoMKgIDcuNDM1ICggMC4zMzIgbXMpOiBscy8xMzA3IG9wZW5hdChkZmQ6
IENXRCwgZmlsZW5hbWU6IDB4YjM2ZWY2NjgsCj4gZmxhZ3M6IFJET05MWXxDTE9FWEVDKcKgwqDC
oMKgwqDCoMKgwqAgPSAzCj4gwqDCoMKgwqAgOC4wMjMgKCAwLjQ1NCBtcyk6IGxzLzEzMDcgbW1h
cChsZW46IDIzMTcxLCBwcm90OiBSRUFELCBmbGFnczogUFJJVkFURSwKPiBmZDogMynCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAweDdmZmZiMzZjZDAwMAo+IMKgwqDCoMKg
IDguNTU4ICggMC4wNjUgbXMpOiBscy8xMzA3IGNsb3NlKGZkOgo+IDMpwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgID0gMAo+IMKgwqDCoMKg
IDguODUwICggMC4yOTQgbXMpOiBscy8xMzA3IG9wZW5hdChkZmQ6IENXRCwgZmlsZW5hbWU6IDB4
YjM2ZjlmODAsCj4gZmxhZ3M6IFJET05MWXxDTE9FWEVDKcKgwqDCoMKgwqDCoMKgwqAgPSAzCj4g
wqDCoMKgwqAgOS4yMjMgKCAwLjE1MiBtcyk6IGxzLzEzMDcgcmVhZChmZDogMywgYnVmOiAweDdm
ZmZlMjdiM2MyMCwgY291bnQ6IDgzMikKPiAKPiAuLi4KPiAKPiBTbyB5b3UgY2FuIGFkZDoKPiAK
PiBUZXN0ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KClRo
YW5rcyBmb3IgeW91ciB0ZXN0IQpOYW1oeXVuZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
