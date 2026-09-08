Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D25C79F99
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 20:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3m8qCUu5686+GRzLB+qKcis2zTQhrpkCwe3FuGezWc8=; b=XoxGZh+Nk9luod
	JffTpgAnBQGqX1kbni1yDPzfqQX1N/B2829lWQTPuxsEBD55DzDZVFhptBrJc3KJtG7iv7Wty05R8
	uSSfb0tObXqwR0fQ0j7oqLREDRRfJsNMzFHitFsb5MUXsBCTg7/vbDhbmpri5Q/LGNPML7OsAJSnE
	Ta7eEugcioZxycGQK5UyWDyf7HJ6or6Gqi5COO2OwAdEkIuqYM2NocypdACu0j6mhfO+FEcpGOxyD
	TQNVh5+PGtDPM1kQWwoI/o4LCHkCNOsRjjlDbTqcCpBikImv6UFpuS1zOJzEz0bNWtnE4H5s11HmY
	R48X67DHzgEEr2wH/5Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42mZ-0000000AE5K-3Hz5;
	Tue, 08 Sep 2026 20:51:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42mW-0000000AE4x-0a67
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 20:51:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9597D601F9;
	Tue,  8 Sep 2026 20:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6BB1F00A3A;
	Tue,  8 Sep 2026 20:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788900663;
	bh=pqVJjziaaRCdCUM3lbSKWGOymFy2UYOe/cTKOLbEHgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YKdbHp6VWtaa7SNBVtdcqbPfB0XtNA2LU0YQits6YwMZPKEUzYXzz9OPdcH7v3DWn
	 EW53PAVxsQR15v19Bs73+3qK6Nzo8eySofYrTZb8DSeCW+QYQjMVF/NcO1FQC2iSSe
	 8cMdStGec76Ah3mULD9AAbkbNhtEYwQ/ZyNatcGWM2U09DrUyi6xjsJb0r//1Uun0y
	 +PSVY8rWXCeS3dt+mnao1vN6x3avIGHv9CcNOR76+mvLHJ151jI5s2a5vIUhZfxWxO
	 44j/PVskJuAElKp1Nz5Kt/4TwHCr43hfO+uUSMPqAZWrTQKPqo2xLPh+JKJcoxbMuq
	 uxhTdFHYKLBag==
Date: Tue, 8 Sep 2026 17:51:00 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Nylon Chen <nylon.chen@sifive.com>, Namhyung Kim <namhyung@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf bench futex: Define SYS_futex on 32-bit arches with
 64-bit time_t
Message-ID: <aqB1NGbcNdAGJnST@x2>
References: <20260902093210.3571958-1-nylon.chen@sifive.com>
 <CAP-5=fUzqFPfN+xH8uqERugK9xsauUoxZTVr+YLGGXVRi6UC9w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fUzqFPfN+xH8uqERugK9xsauUoxZTVr+YLGGXVRi6UC9w@mail.gmail.com>
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

T24gV2VkLCBTZXAgMDIsIDIwMjYgYXQgMTA6MDQ6MTRQTSAtMDcwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBXZWQsIFNlcCAyLCAyMDI2IGF0IDI6MzLigK9BTSBOeWxvbiBDaGVuIDxueWxvbi5j
aGVuQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4KPiA+IFRoZSBrZXJuZWwgZG9lcyBub3QgcHJvdmlk
ZSBzeXNfZnV0ZXgoKSBvbiAzMi1iaXQgYXJjaGl0ZWN0dXJlcyB0aGF0IGxhY2sKPiA+IGEgMzIt
Yml0IHRpbWUgcmVwcmVzZW50YXRpb24sIHN1Y2ggYXMgcmlzY3YzMi4gQ29uc2VxdWVudGx5IGds
aWJjIGRvZXMgbm90Cj4gPiBkZWZpbmUgU1lTX2Z1dGV4IHRoZXJlLCBvbmx5IFNZU19mdXRleF90
aW1lNjQsIGFuZCBwZXJmIGJlbmNoJ3MgZnV0ZXgKPiA+IGJlbmNobWFya3MgZmFpbCB0byBidWls
ZDoKPiA+Cj4gPiAgIGJlbmNoL2Z1dGV4Lmg6IEluIGZ1bmN0aW9uICdmdXRleF9zeXNjYWxsJzoK
PiA+ICAgYmVuY2gvZnV0ZXguaDo3NzoxODogZXJyb3I6ICdTWVNfZnV0ZXgnIHVuZGVjbGFyZWQg
KGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+ID4KPiA+IERlZmluZSBTWVNfZnV0ZXggYXMg
U1lTX2Z1dGV4X3RpbWU2NCB3aGVuIG9ubHkgdGhlIGxhdHRlciBpcyBhdmFpbGFibGUuCj4gPiBU
aGUgZ3VhcmQgYW5kIGl0cyBjb21tZW50IGFyZSB0YWtlbiB2ZXJiYXRpbSBmcm9tCj4gPiB0b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9mdXRleC9pbmNsdWRlL2Z1dGV4dGVzdC5oLCB3aGVyZSB0aGV5
IHdlcmUgYWRkZWQgYnkKPiA+IGNvbW1pdCAwNDg1MDgxOWM2NWMgKCJzZWxmdGVzdHMvZnV0ZXg6
IERlZmluZSBTWVNfZnV0ZXggb24gMzItYml0Cj4gPiBhcmNoaXRlY3R1cmVzIHdpdGggNjQtYml0
IHRpbWVfdCIpLCBrZWVwaW5nIHRoZSB0d28gZnV0ZXggdXNlcnNwYWNlIGhlYWRlcnMKPiA+IGlu
IHN5bmMuCj4gPgo+ID4gTm8gdGltZXNwZWMgY29udmVyc2lvbiBoZWxwZXIgaXMgbmVlZGVkIG9u
IHRvcCBvZiB0aGlzLiBnbGliYyBsYXlzIG91dAo+ID4gc3RydWN0IHRpbWVzcGVjIG9uIDMyLWJp
dCBhcmNoaXRlY3R1cmVzIHdpdGggNjQtYml0IHRpbWVfdCBhcwo+ID4geyBpbnQ2NCB0dl9zZWM7
IGludDMyIHR2X25zZWM7IDMyLWJpdCBwYWQgfSwgd2hpY2ggaXMgY29tcGF0aWJsZSB3aXRoCj4g
PiBzdHJ1Y3QgX19rZXJuZWxfdGltZXNwZWMsIGFuZCBldmVyeSBmdXRleF93YWl0KCkvZnV0ZXhf
bG9ja19waSgpLwo+ID4gZnV0ZXhfd2FpdF9yZXF1ZXVlX3BpKCkgY2FsbCBzaXRlIGluIHBlcmYg
YmVuY2ggcGFzc2VzIGEgTlVMTCB0aW1lb3V0Cj4gPiBhbnl3YXksIHNvIG5vIHRpbWVzcGVjIGV2
ZXIgY3Jvc3NlcyB0aGUgc3lzY2FsbCBib3VuZGFyeSBoZXJlLgo+ID4KPiA+IE5vdGUgdGhhdCBh
biBlYXJsaWVyIGFuZCBtb3JlIGFtYml0aW91cyBhdHRlbXB0IGF0IHRoaXMgd2FzCj4gPiBjb21t
aXQgYzFmZjEyZGFjNDY1ICgicGVyZiBiZW5jaCBmdXRleDogQWRkIHN1cHBvcnQgZm9yIDMyLWJp
dCBzeXN0ZW1zCj4gPiB3aXRoIDY0LWJpdCB0aW1lX3QiKSwgcmV2ZXJ0ZWQgYnkKPiA+IGNvbW1p
dCBiYTQwMjZiMDlkODMgKCJSZXZlcnQgInBlcmYgYmVuY2ggZnV0ZXg6IEFkZCBzdXBwb3J0IGZv
ciAzMi1iaXQKPiA+IHN5c3RlbXMgd2l0aCA2NC1iaXQgdGltZV90IiIpIGJlY2F1c2UgaXQgaW5j
bHVkZWQgbGludXgvdGltZV90eXBlcy5oLAo+ID4gd2hpY2ggaXMgdW5hdmFpbGFibGUgb24gb2xk
ZXIgZGlzdHJpYnV0aW9ucy4gVGhpcyBjaGFuZ2UgZGVsaWJlcmF0ZWx5Cj4gPiBhdm9pZHMgdGhh
dCBkZXBlbmRlbmN5IGFuZCBhZGRzIG9ubHkgdGhlIG9uZSBndWFyZCBuZWVkZWQgdG8gZml4Cj4g
PiBjb21waWxhdGlvbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOeWxvbiBDaGVuIDxueWxvbi5j
aGVuQHNpZml2ZS5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IElhbiBSb2dlcnMgPGlyb2dlcnNAZ29v
Z2xlLmNvbT4KClRoYW5rcywgYXBwbGllZCB0byBwZXJmLXRvb2xzLW5leHQsIGZvciB2Ny40LgoK
LSBBcm5hbGRvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
