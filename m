Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D3DCD4F39
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 00:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RurAIwTPqc5iu5B/Ff2gQaijbUSSg7gO0xQ91477jl4=; b=4LJMDFiJRBtI/3
	qS040Ns+fPHgPGzyCEbQaIfoEwSed6xDpO2jDtDQqBvMHf9kHz/4/epVPt1oL6E2zb420vG3wU4c6
	Vh/O7ChgnjYQOKWs7I4rY0Yt3yEhBi/h4KGXXIMz4KE6WUIMnHzPHdOF+ka3mnk4c3ogoi3CFeEh9
	yv3ED8YrQ+ZCCwmuUXQovxfrKHxqpvFUqs+p+PKFJLbYj/9l6sbdC9/emQ6Lndr9PK+c1duWJQQ04
	DFWy2bPAIQPf87tm5DYE8aZOvMrHtDaL34Z52EZedZ3Pbn9HoC+n9iVP/29v0dOBVWboLe4L/ydG4
	uIb6XYRpyuvEZvca6A6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNfzW-00000006s3B-1rYH;
	Fri, 15 May 2026 00:01:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNfzU-00000006s2k-0J4O;
	Fri, 15 May 2026 00:01:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C6B6860008;
	Fri, 15 May 2026 00:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D03C2BCB3;
	Fri, 15 May 2026 00:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778803278;
	bh=qcyh1k6oDWxzqMUIRNWfJA2lNDX2xIYpO4RsFgvB/Pc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ORTs2e47LDfXtxpftrsgmc0BBJfhsGWPf3S7imib3v4dWSmqlGKYQTWNchK/6tqqv
	 28zSEFcawoJf5V5dMaouJ/OjkKLtq1W+p1dESsernOwMwK7viKW4dlettM9fHGZJ/g
	 GUI/V3HUvr+ResYK5Wo+/EnZVSefKesf7+hwdq5+G5er6JKBevdLzivjuiELJUBEww
	 BBRyyBE1t8374ptrmuPzDNmNofdZC8dRo2ivwgc/FhQ4blzhzcWxfDchMnGEL3jS2K
	 vMhmTj6OBA4dBHPhOVFmkR66JiCZSaodo3uE/UB6rBNz3FPqlkz2ZY0XPM4GiMfpiH
	 Rwch+YpztSmpw==
Date: Thu, 14 May 2026 21:01:15 -0300
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
Subject: Re: [PATCH v5 0/7] perf libunwind multiple remote support
Message-ID: <agZiS2-fY49MjsY6@x1>
References: <20260413024805.1316480-1-irogers@google.com>
 <20260513233151.572332-1-irogers@google.com>
 <CAP-5=fW6S1XzZvq=kWj6ma=O1UCDrVV3ZNbzK0fMS_ho6e1qVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fW6S1XzZvq=kWj6ma=O1UCDrVV3ZNbzK0fMS_ho6e1qVg@mail.gmail.com>
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

T24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgMDk6NTE6MDlBTSAtMDcwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBXZWQsIE1heSAxMywgMjAyNiBhdCA0OjMy4oCvUE0gSWFuIFJvZ2VycyA8aXJvZ2Vy
c0Bnb29nbGUuY29tPiB3cm90ZToKPiA+IEZpeCB0aGUgbGlidW53aW5kIGJ1aWxkIGZvciB3aGVu
IGxpYmR3IGFuZCBsaWJ1bndpbmQgYXJlIGZlYXR1cmUKPiA+IGRldGVjdGVkLCBjdXJyZW50bHkg
ZmFpbGluZyB3aXRoIGEgZHVwbGljYXRlIHN5bWJvbC4KPiA+Cj4gPiBSZWZhY3RvciB0aGUgbGli
dW53aW5kIHN1cHBvcnQgc28gdGhhdCB3aGVuZXZlciBhIHJlbW90ZSB0YXJnZXQgaXMKPiA+IGF2
YWlsYWJsZSwgcGVyZiBmdW5jdGlvbnMgdXNpbmcgdGhlIEVMRiBtYWNoaW5lIGNhbiB1c2UgdGhh
dCByZW1vdGUKPiA+IHRhcmdldCByZWdhcmRsZXNzIG9mIHdoYXQgdGhlIGhvc3QvbG9jYWwgbWFj
aGluZSBpcy4gTWlncmF0ZSBleGlzdGluZwo+ID4gbGlidW53aW5kIHN1cHBvcnRlZCBhcmNoaXRl
Y3R1cmVzIGxpa2UgcG93ZXJwYywgYXJtNjQgYW5kIGxvb25nYXJjaCBzbwo+ID4gdGhhdCB0aGV5
IGNhbiB3b3JrIGluIGEgY3Jvc3MtYXJjaGl0ZWN0dXJlIHdheS4gQWRkIHN1cHBvcnQgZm9yCj4g
PiBSSVNDLVYuIE1ha2UgdGhlIGNvZGUgbW9yZSByZWd1bGFyIGluIGZ1bmN0aW9uIG5hbWVzLCBl
dGMuIGFuZCBhdm9pZAo+ID4gaW5jbHVkaW5nIGEgQy1maWxlLiBUaGlzIGluY3JlYXNlcyB0aGUg
bGluZXMgb2YgY29kZS4gSXQgaXMgc2ltaWxhciBpbgo+ID4gc3R5bGUgdG8gdGhlIHVud2luZC1s
aWJkdyBpbXBsZW1lbnRhdGlvbi4gSXQgaXMgaG9wZWQgdGhhdCB0aGUgbW9yZQo+ID4gdW5pZm9y
bSBuYXR1cmUgb2YgdGhlIGNvZGUgd2lsbCBoZWxwIHdpdGggcmVmYWN0b3JpbmcgdGhlIHBlcmYK
PiA+IHJlZ2lzdGVycyBmb3IgU0lNRC9BUFggc3VwcG9ydC4KPiA+Cj4gPiBBc2lkZSBmcm9tIGxv
Y2FsIGhvc3QgdGVzdGluZyB0aGVzZSBwYXRjaGVzIGFyZSB1bmRlciB0ZXN0ZWQsIGluIHBhcnQK
PiA+IGFzIEknbSBmYWlsaW5nIHRvIHNlZSBob3cgdG8gYnVpbGQgbGlidW53aW5kIHdpdGggc3Vw
cG9ydCBmb3IgbXVsdGlwbGUKPiA+IHJlbW90ZSB0YXJnZXRzLiBQbGVhc2UgY291bGQgSSBnZXQg
aGVscCBpbiB0ZXN0aW5nLgo+IAo+IFNvIHRoZSBwYXRjaGVzIGZhaWxlZCB0byBhcHBseSBpbiBT
YXNoaWtvOgo+IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDUxMzIzMzE1MS41
NzIzMzItMS1pcm9nZXJzJTQwZ29vZ2xlLmNvbQo+IFRoZSBiYXNlbGluZSBsb2dzIHNob3cgcGVy
Zi10b29scy1uZXh0IHdhcyBhdCBjb21taXQgOGM4ZjIwOTM2MTQzCj4gKCJwZXJmIGJ1aWxkOiBS
ZW1vdmUgTk9fR1RLMiBidWlsZCB0ZXN0Iikgd2hpY2ggaXMgNiBwYXRjaGVzCj4gb3V0LW9mLWRh
dGUgY29tcGFyZWQgdG8gdGhlIGN1cnJlbnQgdGlwIHRoZXNlIHBhdGNoZXMgYXJlIGFnYWluc3Qu
IEkKPiByYW4gU2FzaGlrbyBsb2NhbGx5LCBzbyBJIGRvbid0IGV4cGVjdCBhIGh1Z2UgYW1vdW50
IGZyb20gdGhlIHJldmlld3MuCj4gQ3VycmVudGx5IFNhc2hpa28gaXMgY2F0Y2hpbmcgdXAgd2l0
aCBhIGJhY2tsb2cgYmVjYXVzZSBpdHMgdG9rZW5zCj4gaGF2ZSBhIGxvd2VyIHByaW9yaXR5IGFu
ZCB0aGVyZSB3YXMgaGlnaCBsb2FkIGVhcmxpZXIgaW4gdGhlIHdlZWsuCj4gQW55d2F5LCBJIGNv
dWxkIHJlcG9zdCB0aGUgcGF0Y2hlcyBmb3IgU2FzaGlrbyByZXZpZXcgYnV0IGdpdmVuIHRoZQo+
IGJhY2tsb2cgSSB0aGluayB0aGF0IHdvdWxkIGp1c3QgY3JlYXRlIG5vaXNlIGF0IHRoZSBtb21l
bnQuIEhvcGVmdWxseQo+IEkgY2FuIGdldCBodW1hbiByZXZpZXcgc28gd2UgY2FuIG1vdmUgZm9y
d2FyZCB3aXRoIG1lcmdpbmcgdGhlc2UKPiBpbXByb3ZlbWVudHMuCgpUcnlpbmcgdG8gYXBwbHkg
aXQgbm93LCB3aWxsIGFsc28gcnVuIHNhc2hpa28gbG9jYWxseS4KCi0gQXJuYWxkbwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
