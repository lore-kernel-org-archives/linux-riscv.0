Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C02EE937FD
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Apr 2026 19:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AV18gVWESct0MzBfWSJZvkOhnsHQfpFIBjUqO1U2QqY=; b=UW0RgpHn+8kmxm
	bx1iklsaoRiAJqD6TQL9Ulu6RISDOUHEQ+tJTiwyUfEXETAzPVfcbc7xKuFQwfqUhij4txyhRNF9h
	MspnGWFlsly8VpfkSkdd0dNmyvFbK1Rtb0TwcDk6yyilCtsVH5wh9zDTNdtO6owb8J6EFyrXaKmss
	5wntmA7N/dAPiT5BEHUpz5tW365usIo4MdQhHTfqpDTbzPTT2lI5e3X/ETpguCN6gJn5shtiiaC97
	B+knudmyGfW7yZ/2RNPYlOghpaoC9aNqiXryEyWYU0sCsCoyxjdiWMh7wetL3heC8KFUgE2R1w/bx
	9D2s64Jb84uB1W6213cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC0Jx-0000000Ecsz-3Wyf;
	Sun, 12 Apr 2026 19:18:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC0Ju-0000000EcsW-2YNe;
	Sun, 12 Apr 2026 19:18:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 680E643943;
	Sun, 12 Apr 2026 19:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99BB4C19424;
	Sun, 12 Apr 2026 19:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776021486;
	bh=yellk67V+k6/B4H2k9kR6wZJu3FcR3ehf63oE9bnhSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hZnKt7RbgwivElS/f3AFQ56bX4R/NE0FSJSAiy1su0vgf84BAYRn7YeERL6/R3dkw
	 Nx0Ruk0NQGL60D0vPPcY/yehUmNJNccUQaW0qSHxUEtg60/8C7MgsrmZQVbJi7buEp
	 G6ElYaE4dX5IUKeIe/lKM1FmBiwZtep346fnVvUgIZLR42A46qK83qbqTimjn8gxvh
	 aYhr5/6NgmgXFkNSZaIUf2xvDL08xA+YcnB1FGXWv+rcZo2Vn3BUfhGvrHQ5EFNPXj
	 9JYA2gEocew3xeVdvbdEpqsJMlctpAWIcKGZnLtQyIdm+Mx2mPmo8GTm1atR46s0RB
	 42af47d8qo1VQ==
Date: Sun, 12 Apr 2026 16:18:02 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: 9erthalion6@gmail.com, adrian.hunter@intel.com, alex@ghiti.fr,
	alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu, atrajeev@linux.ibm.com,
	blakejones@google.com, ctshao@google.com,
	dapeng1.mi@linux.intel.com, howardchu95@gmail.com,
	james.clark@linaro.org, john.g.garry@oracle.com, jolsa@kernel.org,
	leo.yan@linux.dev, libunwind-devel@nongnu.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com,
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com,
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org,
	yuzhuo@google.com
Subject: Re: [PATCH v3 0/8] perf libunwind multiple remote support
Message-ID: <advv6twWCEVBo_Hc@x1>
References: <20260305221927.3237145-1-irogers@google.com>
 <20260404054032.1538095-1-irogers@google.com>
 <CAP-5=fUz60Guq_gVV6wb_FfwhPs-fUN+PAbB3rQn3pycXbF3DA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fUz60Guq_gVV6wb_FfwhPs-fUN+PAbB3rQn3pycXbF3DA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_121810_699336_E0CBD184 
X-CRM114-Status: GOOD (  21.29  )
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

T24gRnJpLCBBcHIgMTAsIDIwMjYgYXQgMDY6MDQ6NTdQTSAtMDcwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBGcmksIEFwciAzLCAyMDI2IGF0IDEwOjQw4oCvUE0gSWFuIFJvZ2VycyA8aXJvZ2Vy
c0Bnb29nbGUuY29tPiB3cm90ZToKPiA+Cj4gPiBGaXggdGhlIGxpYnVud2luZCBidWlsZCBmb3Ig
d2hlbiBsaWJkdyBhbmQgbGlidW53aW5kIGFyZSBmZWF0dXJlCj4gPiBkZXRlY3RlZCwgY3VycmVu
dGx5IGZhaWxpbmcgd2l0aCBhIGR1cGxpY2F0ZSBzeW1ib2wuCj4gPgo+ID4gUmVmYWN0b3IgdGhl
IGxpYnVud2luZCBzdXBwb3J0IHNvIHRoYXQgd2hlbmV2ZXIgYSByZW1vdGUgdGFyZ2V0IGlzCj4g
PiBhdmFpbGFibGUsIHBlcmYgZnVuY3Rpb25zIHVzaW5nIHRoZSBFTEYgbWFjaGluZSBjYW4gdXNl
IHRoYXQgcmVtb3RlCj4gPiB0YXJnZXQgcmVnYXJkbGVzcyBvZiB3aGF0IHRoZSBob3N0L2xvY2Fs
IG1hY2hpbmUgaXMuIE1pZ3JhdGUgZXhpc3RpbmcKPiA+IGxpYnVud2luZCBzdXBwb3J0ZWQgYXJj
aGl0ZWN0dXJlcyBsaWtlIHBvd2VycGMsIGFybTY0IGFuZCBsb29uZ2FyY2ggc28KPiA+IHRoYXQg
dGhleSBjYW4gd29yayBpbiBhIGNyb3NzLWFyY2hpdGVjdHVyZSB3YXkuIEFkZCBzdXBwb3J0IGZv
cgo+ID4gUklTQy1WLiBNYWtlIHRoZSBjb2RlIG1vcmUgcmVndWxhciBpbiBmdW5jdGlvbiBuYW1l
cywgZXRjLiBhbmQgYXZvaWQKPiA+IGluY2x1ZGluZyBhIEMtZmlsZS4gVGhpcyBpbmNyZWFzZXMg
dGhlIGxpbmVzIG9mIGNvZGUuIEl0IGlzIHNpbWlsYXIgaW4KPiA+IHN0eWxlIHRvIHRoZSB1bndp
bmQtbGliZHcgaW1wbGVtZW50YXRpb24uIEl0IGlzIGhvcGVkIHRoYXQgdGhlIG1vcmUKPiA+IHVu
aWZvcm0gbmF0dXJlIG9mIHRoZSBjb2RlIHdpdGggaGVscCB3aXRoIHJlZmFjdG9yaW5nIHRoZSBw
ZXJmCj4gPiByZWdpc3RlcnMgZm9yIFNJTUQvQVBYIHN1cHBvcnQuCj4gPgo+ID4gQXNpZGUgZnJv
bSBsb2NhbCBob3N0IHRlc3RpbmcgdGhlc2UgcGF0Y2hlcyBhcmUgdW5kZXIgdGVzdGVkLCBpbiBw
YXJ0Cj4gPiBhcyBJJ20gZmFpbGluZyB0byBzZWUgaG93IHRvIGJ1aWxkIGxpYnVud2luZCB3aXRo
IHN1cHBvcnQgZm9yIG11bHRpcGxlCj4gPiByZW1vdGUgdGFyZ2V0cy4gUGxlYXNlIGNvdWxkIEkg
Z2V0IGhlbHAgaW4gdGVzdGluZy4KPiA+Cj4gPiB2MzogTWlub3Igd2hpdGVzcGFjZSBjbGVhbiB1
cCBhbmQgd2FybiB3aGVuIGEgZHluYW1pYyBjaG9pY2Ugb2YgbGliZHcKPiA+ICAgICBvciBsaWJ1
bndpbmQgaXMgc2VsZWN0ZWQgZm9yIHVud2luZGluZyBhbmQgc3VwcG9ydCBpcyBtaXNzaW5nIChB
cm5hbGRvKS4KPiAKPiBIaSBBcm5hbGRvLAo+IAo+IGFueXRoaW5nIGVsc2Ugb3V0c3RhbmRpbmcg
ZnJvbSB0aGlzIHNlcmllcz8KCkl0IGlzIG5vdCBhcHBseWluZywgSSBkaWQgYW4gYXR0ZW1wdCB0
byByZWZyZXNoIGl0IGJ1dCBzdG9tcGVkIGF0IDcvOAoK4qyiIFthY21lQHRvb2xieCBwZXJmLXRv
b2xzLW5leHRdJCBwYXRjaCAtcDEgPCAuL3YzXzIwMjYwNDAzX2lyb2dlcnNfcGVyZl9saWJ1bndp
bmRfbXVsdGlwbGVfcmVtb3RlX3N1cHBvcnQubWJ4CnBhdGNoaW5nIGZpbGUgdG9vbHMvcGVyZi91
dGlsL0J1aWxkCnBhdGNoaW5nIGZpbGUgdG9vbHMvcGVyZi91dGlsL2xpYnVud2luZC1hcmNoL2xp
YnVud2luZC1hcmNoLmMKcGF0Y2hpbmcgZmlsZSB0b29scy9wZXJmL3V0aWwvbGlidW53aW5kLWFy
Y2gvbGlidW53aW5kLWFyY2guaApwYXRjaGluZyBmaWxlIHRvb2xzL3BlcmYvdXRpbC9saWJ1bndp
bmQtYXJjaC9saWJ1bndpbmQtYXJtLmMKcGF0Y2hpbmcgZmlsZSB0b29scy9wZXJmL3V0aWwvbGli
dW53aW5kLWFyY2gvbGlidW53aW5kLWFybTY0LmMKcGF0Y2hpbmcgZmlsZSB0b29scy9wZXJmL3V0
aWwvbGlidW53aW5kLWFyY2gvbGlidW53aW5kLWkzODYuYwpwYXRjaGluZyBmaWxlIHRvb2xzL3Bl
cmYvdXRpbC9saWJ1bndpbmQtYXJjaC9saWJ1bndpbmQtbG9vbmdhcmNoLmMKcGF0Y2hpbmcgZmls
ZSB0b29scy9wZXJmL3V0aWwvbGlidW53aW5kLWFyY2gvbGlidW53aW5kLW1pcHMuYwpwYXRjaGlu
ZyBmaWxlIHRvb2xzL3BlcmYvdXRpbC9saWJ1bndpbmQtYXJjaC9saWJ1bndpbmQtcHBjMzIuYwpw
YXRjaGluZyBmaWxlIHRvb2xzL3BlcmYvdXRpbC9saWJ1bndpbmQtYXJjaC9saWJ1bndpbmQtcHBj
NjQuYwpwYXRjaGluZyBmaWxlIHRvb2xzL3BlcmYvdXRpbC9saWJ1bndpbmQtYXJjaC9saWJ1bndp
bmQtczM5MC5jCnBhdGNoaW5nIGZpbGUgdG9vbHMvcGVyZi91dGlsL2xpYnVud2luZC1hcmNoL2xp
YnVud2luZC14ODZfNjQuYwpwYXRjaGluZyBmaWxlIHRvb2xzL3BlcmYvdXRpbC9saWJ1bndpbmQv
YXJtNjQuYwpwYXRjaGluZyBmaWxlIHRvb2xzL3BlcmYvdXRpbC9saWJ1bndpbmQveDg2XzMyLmMK
cGF0Y2hpbmcgZmlsZSB0b29scy9wZXJmL3V0aWwvbWFwcy5jCnBhdGNoaW5nIGZpbGUgdG9vbHMv
cGVyZi91dGlsL21hcHMuaApwYXRjaGluZyBmaWxlIHRvb2xzL3BlcmYvdXRpbC91bndpbmQtbGli
dW53aW5kLWxvY2FsLmMKUmV2ZXJzZWQgKG9yIHByZXZpb3VzbHkgYXBwbGllZCkgcGF0Y2ggZGV0
ZWN0ZWQhICBBc3N1bWUgLVI/IFtuXSBeQwrirKIgW2FjbWVAdG9vbGJ4IHBlcmYtdG9vbHMtbmV4
dF0kCgpDYW4geW91IHBsZWFzZSB0YWtlIGEgbG9vayBhbmQgbWF5YmUgcmVzdWJtaXQgaXQgc28g
dGhhdCBTYXNoaWtvIGNhbgpoYXZlIGEgbG9vayBhdCBpdD8KClR3byBvdGhlciBwYXRjaGVzIGhh
ZCB0byBiZSByZWZyZXNoZWQgYmVmb3JlIDcvOC4KCi0gQXJuYWxkbwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
