Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403E9C982FF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 12:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UfkwHYXN81iF+H+jeXOK6ouY99qT+ODQ8FbUjzQ7YME=; b=CQ41VLqOwhBrB2
	p7BtFKkN7F7Tspgt1b9gtIh2WowbUsEnYF0WcZAZWKFDi+jBGOCqQWdG3ZsoNMY2XsV16LdF8nwEy
	2/XMm9526d5dOkMAivqagNZTAFxXC2c1V9AieiUVu5+a+j/TnNnhKZDOIJrAz+sVq7ave4LX056WV
	fbi0oBMf5/EQx/sDxEFHD8ZEmasiAqKGD7+LuimCtHJJK7Yz3HWrM5i0Jvp8dabntEcnNQk+y575H
	zFMXRJIOo0C39Nf1Riw3xA+vrZyJ8ms8vdDsT059bXJb/LFESuBCnXFZ3pFyncbDZgVBBVS+vNeLY
	qaOQnzGndRINqhqwt1Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8znu-00000005Kn8-1cx4;
	Tue, 22 Sep 2026 12:40:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8znt-00000005KmY-2Lr6
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 12:40:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B7A876021C;
	Tue, 22 Sep 2026 12:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6971F00893;
	Tue, 22 Sep 2026 12:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790080856;
	bh=8YTOgbanf2Su5SXwBgA++FQzBjCYeiKy0TeOj7FyDaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hGPYbR1y6Vnm9Il/8qRsZ4gR8RMKDvXhG99ZFXEVZFrZhVXPC8m3oeuShmtjFN5sF
	 d4CotwkD2JrPTVBF7YQ6N6w6OxwB2CiVfHMazE91cDpNDiKl7UWd+f8DCl2FEh2qU6
	 d73b6MeTAGHrWOTuZbxwishN7Y7obl63FwhrRSNLEWX0scN/7uNDDsvg7h5p7FZjMG
	 cWcL+PV/Oz8zls2Nht0NmLb3qZnuq2Qw+jSwauf73OXY72DqCrmGxF8xBOAh0iD1yK
	 sKXnOKPPcoZ/FQ/ZZHIHBz8ZiNVn/cA0brLgqtSo5U+qcjFe+OL7NQMTIkkJgFJbCr
	 yd2dTnutpCnng==
Date: Tue, 22 Sep 2026 14:40:48 +0200
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Chen Pei <cp0613@linux.alibaba.com>, peterz@infradead.org,
	mingo@redhat.com, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	adrian.hunter@intel.com, james.clark@linaro.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	guoren@kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf riscv: Add perf_regs_load and enable the dwarf
 unwind test
Message-ID: <arJ3UM-td4trU4z5@x2>
References: <20260914124145.1257-1-cp0613@linux.alibaba.com>
 <20260914125814.C92251F000FF@smtp.kernel.org>
 <20260915015420.818-1-cp0613@linux.alibaba.com>
 <CAP-5=fWE7gjkpZdnHh_QAiVBKTF=1tsUE+ezDxW8SaCsaS-s5w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fWE7gjkpZdnHh_QAiVBKTF=1tsUE+ezDxW8SaCsaS-s5w@mail.gmail.com>
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

T24gVHVlLCBTZXAgMTUsIDIwMjYgYXQgMTI6MDk6MTNQTSAtMDcwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBNb24sIFNlcCAxNCwgMjAyNiBhdCA2OjU04oCvUE0gQ2hlbiBQZWkgPGNwMDYxM0Bs
aW51eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQm90aCBpdGVtcyBjaGVja2VkLiBOZWl0
aGVyIG5lZWRzIGEgdjIgb2YgdGhpcyBwYXRjaC4KPiA+Cj4gPiA+IERvZXMgdGhpcyBmaWxlIG5l
ZWQgdG8gZXhwbGljaXRseSBpbmNsdWRlIDxzdGRsaWIuaD4/IFNpbmNlIG11c2wgbGliYwo+ID4g
PiBlbmZvcmNlcyBzdHJpY3QgUE9TSVggaGVhZGVyIGluY2x1c2lvbnMsIG1pc3NpbmcgdGhlIGRl
Y2xhcmF0aW9uIGZvcgo+ID4gPiBtYWxsb2MgY291bGQgbGVhZCB0byBhIGJ1aWxkIGZhaWx1cmUg
cmVncmVzc2lvbiBvbiBtdXNsIGxpYmMgc3lzdGVtcy4KPiA+Cj4gPiBJdCBpcyBub3QgbWlzc2lu
Zy4gInBlcmZfcmVncy5oIiB0aHJlZSBsaW5lcyBhYm92ZSByZXNvbHZlcyB0bwo+ID4gYXJjaC9y
aXNjdi9pbmNsdWRlL3BlcmZfcmVncy5oLCB3aGljaCBoYXMgI2luY2x1ZGUgPHN0ZGxpYi5oPiBh
bmQgaXMKPiA+IGFsc28gd2hlcmUgUEVSRl9SRUdTX01BWCBjb21lcyBmcm9tLCBzbyB0aGlzIGZp
bGUgY2Fubm90IGJlIGJ1aWx0Cj4gPiB3aXRob3V0IGl0LiBhcm02NCByZWxpZXMgb24gdGhlIHNh
bWUgdHJhbnNpdGl2ZSBpbmNsdWRlLiBDaGVja2VkIHdpdGgKPiA+IHJpc2N2NjQgZ2NjIDE1LjMs
IHdoZXJlIGFuIGltcGxpY2l0IGRlY2xhcmF0aW9uIGlzIGEgaGFyZCBlcnJvcjoKPiA+IGluY2x1
ZGluZyBvbmx5IHRoYXQgaGVhZGVyIGlzIGVub3VnaCB0byBjYWxsIG1hbGxvYygpIGFuZCBjYWxs
b2MoKS4KPiAKPiBIaSBQZWksCj4gCj4gVGhhbmtzIGZvciB0aGUgcGF0Y2ghIFBsZWFzZSBkb24n
dCByZWx5IG9uIHRyYW5zaXRpdmUgaW5jbHVkZXMgYXMgYQo+IGNoYW5nZSBpbiB0aGUgb3RoZXIg
aGVhZGVyIGZpbGUgd2lsbCBicmVhayBjb2RlIGhlcmUuIFNpbmNlIHRoaXMgY29kZQo+IG9ubHkg
YnVpbGRzIGZvciBSSVNDLVYsIHdlJ3JlIGxpa2VseSB0byBtaXNzIHRoZSBwcm9ibGVtIGlmIHRo
ZSBvdGhlcgo+IGhlYWRlciBjaGFuZ2VzLiBPdGhlciB0aGFuIHRoaXMsCj4gCj4gUmV2aWV3ZWQt
Ynk6IElhbiBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xlLmNvbT4KClRoYW5rcywgYXBwbGllZCB0byBw
ZXJmLXRvb2xzLW5leHQsIGZvciB2Ny40LgoKLSBBcm5hbGRvCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
