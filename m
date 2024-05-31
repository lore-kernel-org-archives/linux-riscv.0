Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415D6C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 21:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XeSYqEbntA5Qklf2FwtCdFP51iP63XVPCtbPdBm9mc8=; b=bFc+ZODcLBU2bU
	oKI4PNp6TOTFGCazrvbCcTqvXyqVZwRQwwO64mptGyN/E1zS48RB/f40A07TSejFmDjHqqJA2Dy/9
	a7v271i6wIsNzFCm+ZfNPjFEKMOHSDtNM2Tq+DVWLeo8Hs3SYPf3LKYb2CFUNvgr+sHTUqpGB4zXU
	TimmxcdkiB9+yHNGyCFhjb5H/Q7esvTAzs3STNqqiiMtMmNWVwcx1ibz0EtkeHzGqvo1FPdTNvHwg
	7L7/sp9+smIHgCPM4VzBmMJJvzoruaQft1zLGaZa1fB3rFjqEaa/Tdw/yHhq5szBD9cUBdk6sgkDv
	a2JtxDdRnbhNTv6m5JdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD9e5-0000000BTQz-1EXR;
	Fri, 31 May 2024 21:18:44 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD9e0-0000000BTMS-3z2P
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 21:18:39 +0000
X-Envelope-To: yuzhao@google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1717190302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b4Xmi0701V1mOSvq8yprUubnI972AbFWvRE29wJdk78=;
	b=Ls3C5/08/280zRJqgHSiEjY525Nc+6AHW21VTOJinn6gvpWo5wGpHRdfxPSCAblARNzCTk
	Ef8yPQJkMIbUZrU0gLqIxyh5em+aap01i8qUkndBnnlYA3LWYTDaFt+T56XGowNC6n0gMV
	1xZHPusSMv7Np2WADZqnpp/2B0dMfIM=
X-Envelope-To: jthoughton@google.com
X-Envelope-To: akpm@linux-foundation.org
X-Envelope-To: pbonzini@redhat.com
X-Envelope-To: aou@eecs.berkeley.edu
X-Envelope-To: ankita@nvidia.com
X-Envelope-To: anup@brainfault.org
X-Envelope-To: atishp@atishpatra.org
X-Envelope-To: axelrasmussen@google.com
X-Envelope-To: maobibo@loongson.cn
X-Envelope-To: catalin.marinas@arm.com
X-Envelope-To: dmatlack@google.com
X-Envelope-To: rientjes@google.com
X-Envelope-To: chenhuacai@kernel.org
X-Envelope-To: james.morse@arm.com
X-Envelope-To: corbet@lwn.net
X-Envelope-To: maz@kernel.org
X-Envelope-To: mpe@ellerman.id.au
X-Envelope-To: npiggin@gmail.com
X-Envelope-To: palmer@dabbelt.com
X-Envelope-To: paul.walmsley@sifive.com
X-Envelope-To: rananta@google.com
X-Envelope-To: ryan.roberts@arm.com
X-Envelope-To: seanjc@google.com
X-Envelope-To: shahuang@redhat.com
X-Envelope-To: shuah@kernel.org
X-Envelope-To: suzuki.poulose@arm.com
X-Envelope-To: zhaotianrui@loongson.cn
X-Envelope-To: will@kernel.org
X-Envelope-To: yuzenghui@huawei.com
X-Envelope-To: kvm-riscv@lists.infradead.org
X-Envelope-To: kvm@vger.kernel.org
X-Envelope-To: kvmarm@lists.linux.dev
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-doc@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kselftest@vger.kernel.org
X-Envelope-To: linux-mips@vger.kernel.org
X-Envelope-To: linux-mm@kvack.org
X-Envelope-To: linux-riscv@lists.infradead.org
X-Envelope-To: linuxppc-dev@lists.ozlabs.org
X-Envelope-To: loongarch@lists.linux.dev
Date: Fri, 31 May 2024 21:18:12 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Yu Zhao <yuzhao@google.com>
Cc: James Houghton <jthoughton@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ankit Agrawal <ankita@nvidia.com>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Bibo Mao <maobibo@loongson.cn>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Matlack <dmatlack@google.com>,
	David Rientjes <rientjes@google.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	James Morse <james.morse@arm.com>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sean Christopherson <seanjc@google.com>,
	Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs
 participate in aging
Message-ID: <Zlo-lKbrshZmT0mx@linux.dev>
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com>
 <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <Zll7IuGYGG5uI20W@linux.dev>
 <CAOUHufa50Dy8CJ5+D10Khs4NU-3Pv0B8qi-GYkcppctTVUkPcA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOUHufa50Dy8CJ5+D10Khs4NU-3Pv0B8qi-GYkcppctTVUkPcA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_141837_312730_25A01275 
X-CRM114-Status: GOOD (  22.88  )
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

T24gRnJpLCBNYXkgMzEsIDIwMjQgYXQgMDI6MzE6MTdQTSAtMDYwMCwgWXUgWmhhbyB3cm90ZToK
PiBPbiBGcmksIE1heSAzMSwgMjAyNCBhdCAxOjI04oCvQU0gT2xpdmVyIFVwdG9uIDxvbGl2ZXIu
dXB0b25AbGludXguZGV2PiB3cm90ZToKClsuLi5dCgo+ID4gR3JhYmJpbmcgdGhlIE1NVSBsb2Nr
IGZvciB3cml0ZSB0byBzY2FuIHN1Y2tzLCBubyBhcmd1bWVudCB0aGVyZS4gQnV0Cj4gPiBjYW4g
eW91IHBsZWFzZSBiZSBzcGVjaWZpYyBhYm91dCB0aGUgaW1wYWN0IG9mIHJlYWQgbG9jayB2LiBS
Q1UgaW4gdGhlCj4gPiBjYXNlIG9mIGFybTY0PyBJIGhhZCBhc2tlZCBhYm91dCB0aGlzIGJlZm9y
ZSBhbmQgeW91IG5ldmVyIHJlcGxpZWQuCj4gPgo+ID4gTXkgY29uY2VybiByZW1haW5zIHRoYXQg
YWRkaW5nIHN1cHBvcnQgZm9yIHNvZnR3YXJlIHRhYmxlIHdhbGtlcnMKPiA+IG91dHNpZGUgb2Yg
dGhlIE1NVSBsb2NrIGVudGlyZWx5IHJlcXVpcmVzIG1vcmUgd29yayB0aGFuIGp1c3QgZGVmZXJy
aW5nCj4gPiB0aGUgZGVhbGxvY2F0aW9uIHRvIGFuIFJDVSBjYWxsYmFjay4gV2Fsa2VycyB0aGF0
IHByZXZpb3VzbHkgYXNzdW1lZAo+ID4gJ2V4Y2x1c2l2ZScgYWNjZXNzIHdoaWxlIGhvbGRpbmcg
dGhlIE1NVSBsb2NrIGZvciB3cml0ZSBtdXN0IG5vdyBjb3BlCj4gPiB3aXRoIHZvbGF0aWxlIFBU
RXMuCj4gPgo+ID4gWWVzLCB0aGlzIHByb2JsZW0gYWxyZWFkeSBleGlzdHMgd2hlbiBoYXJkd2Fy
ZSBzZXRzIHRoZSBBRiwgYnV0IHRoZQo+ID4gbG9jay1mcmVlIHdhbGtlciBpbXBsZW1lbnRhdGlv
biBuZWVkcyB0byBiZSBnZW5lcmljIHNvIGl0IGNhbiBiZSBhcHBsaWVkCj4gPiBmb3Igb3RoZXIg
UFRFIGJpdHMuCj4gCj4gRGlyZWN0IHJlY2xhaW0gaXMgbXVsdGktdGhyZWFkZWQgYW5kIGVhY2gg
cmVjbGFpbWVyIGNhbiB0YWtlIHRoZSBtbXUKPiBsb2NrIGZvciByZWFkICh0ZXN0aW5nIHRoZSBB
LWJpdCkgb3Igd3JpdGUgKHVubWFwcGluZyBiZWZvcmUgcGFnaW5nCj4gb3V0KSBvbiBhcm02NC4g
VGhlIGZ1bmRhbWVudGFsIHByb2JsZW0gb2YgdXNpbmcgdGhlIHJlYWRlcnMtd3JpdGVyCj4gbG9j
ayBpbiB0aGlzIGNhc2UgaXMgcHJpb3JpdHkgaW52ZXJzaW9uOiB0aGUgcmVhZGVycyBoYXZlIGxv
d2VyCj4gcHJpb3JpdHkgdGhhbiB0aGUgd3JpdGVycywgc28gaWRlYWxseSwgd2UgZG9uJ3Qgd2Fu
dCB0aGUgcmVhZGVycyB0bwo+IGJsb2NrIHRoZSB3cml0ZXJzIGF0IGFsbC4KClNvIHdlIGFscmVh
ZHkgaGF2ZSB0aGlzIHNvcnQgb2YgcHJvYmxlbSBvZiBzdGFnZS0yIGZhdWx0IGhhbmRsaW5nIHYu
CnNlY29uZGFyeSBNTVUgaW52YWxpZGF0aW9ucywgd2hpY2ggaXMgd2h5IEkndmUgYmVlbiBkb3Vi
dGZ1bCBvZiB0aGUKcGVyY2VpdmVkIGlzc3VlLiBJbiBmYWN0LCBJJ2QgYXJndWUgdGhhdCBuZWVk
aW5nIHRvIHdhaXQgZm9yIGZhdWx0cyBpcwp3b3JzZSB0aGFuIGFnaW5nIHBhcnRpY2lwYXRpb24g
c2luY2UgdGhvc2UgY2FuIGJlIHRyaXZpYWxseSBpbmZsdWVuY2VkCmJ5IHVzZXJzcGFjZS9ndWVz
dC4KCkluIGFueSBjYXNlLCB3ZSBzaG91bGRuJ3QgZXZlciBiZSBzdGFydmVkIHNpbmNlIHlvdW5n
ZXIgcmVhZGVycyBjYW5ub3QKZW50ZXIgdGhlIGNyaXRpY2FsIHNlY3Rpb24gd2l0aCBhIHBlbmRp
bmcgd3JpdGVyLgoKPiBBcyBJIHNhaWQgZWFybGllciwgSSBwcmVmZXIgd2UgZHJvcCB0aGUgYXJt
NjQgc3VwcG9ydCBmb3Igbm93LCBidXQgSQo+IHdpbGwgbm90IG9iamVjdCB0byB0YWtpbmcgdGhl
IG1tdSBsb2NrIGZvciByZWFkIHdoZW4gY2xlYXJpbmcgdGhlCj4gQS1iaXQsIGFzIGxvbmcgYXMg
d2UgZnVsbHkgdW5kZXJzdGFuZCB0aGUgcHJvYmxlbSBoZXJlIGFuZCBkb2N1bWVudCBpdAo+IGNs
ZWFybHkuCgpJJ2QgYmUgY29udmluY2VkIG9mIHRoaXMgaWYgdGhlcmUncyBkYXRhIHRoYXQgc2hv
d3MgcmVhZCBsb2NrCmFjcXVpc2l0aW9uIGlzIGluIGZhY3QgY29uc2VxdWVudGlhbC4gT3RoZXJ3
aXNlLCBJJ20gbm90IHN1cmUgdGhlIGFkZGVkCmNvbXBsZXhpdHkgb2YgUkNVIHRhYmxlIHdhbGtl
cnMgKHBlciBteSBzdGF0ZW1lbnQgYWJvdmUpIGlzIHdvcnRoIHRoZQplZmZvcnQgLyBtYWludGVu
YW5jZSBidXJkZW4uCgotLSAKVGhhbmtzLApPbGl2ZXIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
