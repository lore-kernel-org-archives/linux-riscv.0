Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC89BC0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 18:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=igWO1+CvRGrD2bZttookLDMwA7TWREIyM4ekMhiurc0=; b=R1RLiSPYNHABfW
	klipYaE958fC+mLLxKgtL8UPnlCoTFr5vyAHksJfSRDcU41AqeFtK5ct+/kT3euiVcQ98xjWgmaAL
	AjlyxcA5rUIJFrF7upNhFzHK1LASmJVUx0FtYQ76FbOQve+TpWF8m+7pFgydSstEgdcHHXRXPT1Oh
	LBJzv76rz6N7fsHXhyyVn8QKRW/2pG4saaNj5Oq7sCmwtkMebIBdRB0KY8YgspTbl+PlCTHT0N7oT
	p7uPoEBNtz3N9xBj9Sn/2ib7afU8Q43nvH1CpIsFf4t7hN9kFDDFvMai8vlpHuMsoM8+OBz9452iy
	+kwhb4pPWLsMJPsKSIJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVyiC-0029Tu-1m;
	Tue, 15 Aug 2023 18:24:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVyiA-0029TM-2L;
	Tue, 15 Aug 2023 18:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HLbqcPFXia5E5QG94M7kSeB1TiYCMsw8FqLqd5/tUKA=; b=k5+nDl6qR93SqQbm9a+EbouWIN
	dYZoqLpYqEtOEyLyq8Ru9jhBo60mx2peNfBdWxxp9+13FdTrSwiGB+2E1qvRQX4WXAuiUpPNaRmBG
	yZoB4GXJMGc7c3Dl6Fy2coE5yVHDj4LX9kc7U62ZLzsyFACz7tCtvF7qsStIF0GTiOeH1h4shcAwj
	nlj/UJk54E6WwhE9ZOoEag3ELZ8jVIurG8m6NZCy/sUWrsYeMryzkDFzqQgVvEQSas41aS6A+xfYL
	GSw66Vd8ML8jVs3Szw4XOKQ1Bz7gkAgkQX6tDg9f7RusXUHmkTWDkaJl2BCJcT/Jzf4ZBOqcUvswB
	xBmJPSBA==;
Received: from [187.19.173.165] (helo=quaco.ghostprotocols.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qVyi9-009jPN-2E; Tue, 15 Aug 2023 18:24:09 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id E1388404DF; Tue, 15 Aug 2023 15:24:04 -0300 (-03)
Date: Tue, 15 Aug 2023 15:24:04 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Leo Yan <leo.yan@linaro.org>, John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>, James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ming Wang <wangming01@loongson.cn>, Eric Lin <eric.lin@sifive.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Ivan Babrou <ivan@cloudflare.com>,
	Fangrui Song <maskray@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/6] perf parse-regs: Refactor architecture functions
Message-ID: <ZNvCxM/ULdUfzHtR@kernel.org>
References: <20230606014559.21783-1-leo.yan@linaro.org>
 <CAP-5=fV1m440mKc0R=m5C4N2NtoiixchtnpX2eR3PA_5hXbqEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fV1m440mKc0R=m5C4N2NtoiixchtnpX2eR3PA_5hXbqEQ@mail.gmail.com>
X-Url: http://acmel.wordpress.com
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

RW0gV2VkLCBKdWwgMTIsIDIwMjMgYXQgMDM6Mzc6MzZQTSAtMDcwMCwgSWFuIFJvZ2VycyBlc2Ny
ZXZldToKPiBPbiBNb24sIEp1biA1LCAyMDIzIGF0IDY6NDbigK9QTSBMZW8gWWFuIDxsZW8ueWFu
QGxpbmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGlzIHRvIHJlZmFj
dG9yIGFyY2ggcmVsYXRlZCBmdW5jdGlvbnMgZm9yIHJlZ2lzdGVyCj4gPiBwYXJzaW5nLCB3aGlj
aCBmb2xsb3dzIHVwIHRoZSBkaXNjdXNzaW9uIGZvciB2MToKPiA+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvMjAyMzA1MjAwMjU1MzcuMTgxMTk4Ni0xLWxlby55YW5AbGluYXJvLm9yZy8K
PiA+Cj4gPiBDb21wYXJlZCB0byBwYXRjaCBzZXJpZXMgdjEsIHRoaXMgcGF0Y2ggc2VyaWVzIGlu
dHJvZHVjZXMgbmV3IGZ1bmN0aW9ucwo+ID4gcGVyZl9hcmNoX3JlZ197aXB8c3B9KCksIHNvIHRo
aXMgY2FuIGFsbG93IHRoZSB0b29sIHRvIHN1cHBvcnQgY3Jvc3MKPiA+IGFuYWx5c2lzLgo+ID4K
PiA+IFRvIHZlcmlmeSB0aGUgY3Jvc3MgYW5hbHlzaXMsIEkgdXNlZCBiZWxvdyBzdGVwczoKPiA+
Cj4gPiAtIEZpcnN0bHksIEkgY2FwdHVyZWQgcGVyZiBkYXRhIG9uIEFybTY0IG1hY2hpbmU6Cj4g
Pgo+ID4gICAkIHBlcmYgcmVjb3JkIC0tY2FsbC1ncmFwaCBmcCAtLSAuL3Rlc3RfcHJvZ3JhbQo+
ID4KPiA+ICAgT3IgLi4uCj4gPgo+ID4gICAkIHBlcmYgcmVjb3JkIC0tY2FsbC1ncmFwaCBkd2Fy
ZiAtLSAuL3Rlc3RfcHJvZ3JhbQo+ID4KPiA+ICAgVGhlbiwgSSBhbHNvIGFyY2hpdmVkIGFzc29j
aWF0ZWQgZGVidWcgZGF0YToKPiA+Cj4gPiAgICQgcGVyZiBhcmNoaXZlCj4gPgo+ID4gLSBTZWNv
bmRseSwgSSBjb3BpZWQgdGhlIHBlcmYgZGF0YSBmaWxlIGFuZCBkZWJ1ZyB0YXIgZmlsZSBvbiBt
eSB4ODYKPiA+ICAgbWFjaGluZToKPiA+Cj4gPiAgICQgc2NwIHBlcmYuZGF0YSBwZXJmLmRhdGEu
dGFyLmJ6MiBsZW95QElQX0FERFJFU1M6L3RhcmdldC9wYXRoLwo+ID4KPiA+IC0gT24geDg2IG1h
Y2hpbmUsIEkgbmVlZCB0byBidWlsZCBwZXJmIGZvciBzdXBwb3J0IG11bHRpLWFyY2ggdW53aW5k
aW5nOgo+ID4KPiA+ICAgJCBnaXQgY2xvbmUgaHR0cDovL2dpdC5zYXZhbm5haC5nbnUub3JnL3Iv
bGlidW53aW5kLmdpdAo+ID4gICAkIGNkIGxpYnVud2luZAo+ID4gICAkIGF1dG9yZWNvbmYgLWkK
PiA+Cj4gPiAgICMgQnVpbGQgYW5kIGluc3RhbGwgbGlidW53aW5kIGFhcmNoNjQ6Cj4gPiAgICQg
Li9jb25maWd1cmUgcHJlZml4PS9ob21lL2xlb3kvV29yay90b29scy9saWJ1bndpbmQvaW5zdGFs
bC8gXAo+ID4gICAgICAgICAtLXRhcmdldD1hYXJjaDY0LWxpbnV4LWdudSBDQz14ODZfNjQtbGlu
dXgtZ251LWdjYwo+ID4gICAkIG1ha2UgJiYgbWFrZSBpbnN0YWxsCj4gPgo+ID4gICAjIEJ1aWxk
IGFuZCBpbnN0YWxsIGxpYnVud2luZCB4ODY6Cj4gPiAgICQgLi9jb25maWd1cmUgcHJlZml4PS9o
b21lL2xlb3kvV29yay90b29scy9saWJ1bndpbmQvaW5zdGFsbC8gXAo+ID4gICAgICAgICAtLXRh
cmdldD14ODZfNjQtbGludXgtZ251IENDPXg4Nl82NC1saW51eC1nbnUtZ2NjCj4gPiAgICQgbWFr
ZSAmJiBtYWtlIGluc3RhbGwKPiA+Cj4gPiAtIEJ1aWxkIHBlcmYgdG9vbCBmb3Igc3VwcG9ydCBt
dWx0aS1hcmNoczoKPiA+Cj4gPiAgICQgY2QgJExJTlVYL3Rvb2xzL3BlcmYKPiA+ICAgJCBtYWtl
IFZGPTEgREVCVUc9MSBMSUJVTldJTkRfRElSPS9ob21lL2xlb3kvV29yay90b29scy9saWJ1bndp
bmQvaW5zdGFsbAo+ID4KPiA+IEF0IHRoZSBlbmQsIEkgdmVyaWZpZWQgdGhlIHg4NiBwZXJmIHRv
b2wgY2FuIGRvIGNyb3NzIGFuYWx5c2lzIGZvciBhYXJjaDY0J3MKPiA+IHBlcmYgZGF0YSBmaWxl
Lgo+ID4KPiA+IE5vdGUsIEkgc3RpbGwgc2VlIHg4NiBwZXJmIHRvb2wgY2Fubm90IGRpc3BsYXkg
dGhlIGNvbXBsZXRlIGNhbGxncmFwaAo+ID4gZm9yIGFhcmNoNjQsIGJ1dCBpdCBzaG91bGQgbm90
IHRoZSBpc3N1ZSBjYXVzZWQgYnkgdGhpcyBzZXJpZXMsIHdoaWNoCj4gPiB3aWxsIGJlIGFkZHJl
c3NlZCBieSBzZXBhcmF0ZSBwYXRjaGVzLgo+ID4KPiA+IEkgYWxzbyBidWlsdCB0aGlzIHBhdGNo
IHNlcmllcyBvbiBteSBBcm02NCBhbmQgeDg2IG1hY2hpbmVzLCBib3RoIGNhbgo+ID4gY29tcGls
ZSBwZXJmIHRvb2wgc3VjY2Vzc2Z1bGx5OyBidXQgSSBoYXZlIG5vIGNoYW5jZSB0byBidWlsZCBv
dGhlcgo+ID4gYXJjaHMgbmF0aXZlbHkuCj4gPgo+ID4gQ2hhbmdlcyBmcm9tIHYxOgo+ID4gLSBG
b3Igc3VwcG9ydCBjcm9zcyBhbmFseXNpcyBmb3IgSVAvU1AgcmVnaXN0ZXJzLCBpbnRyb2R1Y2Vk
IHBhdGNoIDAwMDIKPiA+ICAgKEphbWVzIENsYXJrLCBJYW4gUm9nZXJzKS4KPiA+Cj4gPgo+ID4g
TGVvIFlhbiAoNik6Cj4gPiAgIHBlcmYgcGFyc2UtcmVnczogUmVmYWN0b3IgYXJjaCByZWdpc3Rl
ciBwYXJzaW5nIGZ1bmN0aW9ucwo+ID4gICBwZXJmIHBhcnNlLXJlZ3M6IEludHJvZHVjZSBmdW5j
dGlvbnMgcGVyZl9hcmNoX3JlZ197aXB8c3B9KCkKPiA+ICAgcGVyZiB1bndpbmQ6IFVzZSBwZXJm
X2FyY2hfcmVnX3tpcHxzcH0oKSB0byBzdWJzdGl0dXRlIG1hY3Jvcwo+ID4gICBwZXJmIHBhcnNl
LXJlZ3M6IFJlbW92ZSB1bnVzZWQgbWFjcm9zIFBFUkZfUkVHX3tJUHxTUH0KPiA+ICAgcGVyZiBw
YXJzZS1yZWdzOiBSZW1vdmUgUEVSRl9SRUdTX3tNQVh8TUFTS30gZnJvbSBjb21tb24gY29kZQo+
ID4gICBwZXJmIHBhcnNlLXJlZ3M6IE1vdmUgb3V0IGFyY2ggc3BlY2lmaWMgaGVhZGVyIGZyb20g
dXRpbC9wZXJmX3JlZ3MuaAo+IAo+IFNvcnJ5IGZvciB0aGUgc2xvdyByZXZpZXcuIEZvciB0aGUg
c2VyaWVzOgo+IEFja2VkLWJ5OiBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+Cj4gCj4g
U29tZSB0aG91Z2h0czoKPiB1aW50NjRfdCBfX3BlcmZfcmVnX2lwX2FybSh2b2lkKQo+IHVpbnQ2
NF90IHNlZW1zIGxpa2Ugd2UncmUgZ2l2aW5nIGEgbG90IG9mIHNwYWNlIGZvciBmdXR1cmUgcmVn
aXN0ZXIKPiBlbmNvZGluZ3MuIEkgdGhpbmsgc29tZSBvZiB0aGUgb3RoZXIgZnVuY3Rpb25zIHVz
ZSB0aGlzIHNpemUgb2YgdmFsdWUKPiBkdWUgdG8gcmV0dXJuaW5nIGEgYml0bWFwL21hc2ssIGJ1
dCBoZXJlIGl0IGlzbid0IGNsZWFyIGFuZCBqdXN0IGZlZWxzCj4gZXhjZXNzaXZlLgo+IAo+IERv
IHdlIG5lZWQgdGhlICJfXyIgcHJlZml4IG9uIGFsbCB0aGUgZnVuY3Rpb25zPwo+IAo+IEluIE1h
a2VmaWxlLmNvbmZpZyB0aGVyZSBhcmUgTk9fUEVSRl9SRUdTIGFuZCBDT05GSUdfUEVSRl9SRUdT
IHRoZW4KPiB0aGUgZGVmaW5lIEhBVkVfUEVSRl9SRUdTX1NVUFBPUlQuIElzIHRoaXMgc3RpbGwg
cmVsZXZhbnQ/IElmIHdlIGhhZAo+IGFuIGFyY2hpdGVjdHVyZSB3aXRoIG5vIHN1cHBvcnQsIGNv
dWxkbid0IGl0IHN0aWxsIHJlYWQgYSBwZXJmLmRhdGEKPiBmaWxlIGZyb20gYSBzdXBwb3J0ZWQg
YXJjaGl0ZWN0dXJlPyBJdCB3b3VsZCBiZSBuaWNlIHRvIHJlbW92ZSBhdAo+IGxlYXN0IE5PX1BF
UkZfUkVHUyBhbmQgSEFWRV9QRVJGX1JFR1NfU1VQUE9SVC4KPiAKPiBUaGlzIGNoYW5nZSBpcyB2
ZXJ5IHdvcnRod2hpbGUgZml4IGFuZCBjbGVhbnVwLCBpdCBkaWRuJ3QgaW50cm9kdWNlCj4gd2hh
dCBpcyBwb25kZXJlZCBhYm92ZSwgaGVuY2UgdGhlIGFja2VkLWJ5LgoKQWdyZWVkLCBhcHBsaWVk
IHRvIHBlcmYtdG9vbHMtbmV4dCwgc29ycnkgZm9yIHRoZSBkZWxheS4KCi0gQXJuYWxkbwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
