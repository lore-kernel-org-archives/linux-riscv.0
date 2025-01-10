Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF12E77188
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 14:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnEFNaYTh9JRE/667rmtoFH58a607JKyFtreVxzFFIE=; b=0V3cqK8vD1WN2B
	Bz2/nF1QHwYrhGCCj+d85pgzKsGw3zl0wxy/v4/ilG1z6vIr7A6+tslNJhWDM0s+/alEkTCrcH7YA
	ZbmrEHBfnumOuPdoKjmALa6xs8I9osTp9SwbKv9PHpKPtGhZthPvg9/jfbNM73X3skDauS2tB19dC
	MAafMnQcb6SUQYCyy+NkJyTOxOmq1fm70GsKbG8AdteH/tec3q/rXjCaNuj1fkksCRxc9vIM/mQQJ
	97RRVItbCOs9CojQ7KnTOcU7MeZj57xXDZIDvv1voLSSq4BLaelWwkxM0MkIFr0txhLMHvRoN5ttU
	/JDfhYwMzsb1dcIKfwlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGFj-0000000FfzS-23c5;
	Fri, 10 Jan 2025 14:44:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGEV-0000000Ffov-1YPA;
	Fri, 10 Jan 2025 14:43:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 654475C1109;
	Fri, 10 Jan 2025 14:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8930CC4CED6;
	Fri, 10 Jan 2025 14:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736520210;
	bh=NPB5NFD4Tgx2JiOc65v+cROQTjUVAMnTM2bpuZWaG2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=unDx1OISNdVw+hc8QQjFywLA6bLYlIkgLF4Bu7z2BJxXHdNArtLsIO3LnoVN3Xc2J
	 ElKUQ7HQgy+0EQlk+p7C1h+CRo6UJZUbFs17FeQzBTgPSgLzAzSzR8RRMQK+BpTkPo
	 YZpCmpVc+iA1oMKoCoYqhPH06j/lx/o0iEfNXD86f8TKZLgUgzKSOGsAR7Tl2e6liZ
	 NI2WnSXGbNbj7oXPq5MTSo9NgPX6laQhclxAcalJAfwG2s3ua+UaUQpZsC4Z8KlrCa
	 xxoQP9cZwSV/uwlUDIPDgO8MJm9pe1vcTuBIx4fqx1Ph4XJD8l/RBPAd9eDKkeYXUU
	 m1C1mzZLZYlfQ==
Date: Fri, 10 Jan 2025 11:43:27 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>,
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 00/16] perf tools: Use generic syscall scripts for all
 archs
Message-ID: <Z4EyD_RgjjeD6G4K@x1>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
 <Z3_ybwWW3QZvJ4V6@x1>
 <Z4AoFA974kauIJ9T@ghost>
 <Z4A2Y269Ffo0ERkS@x1>
 <Z4A8NU02WVBDGrYZ@ghost>
 <8639C367-2669-4924-83D8-15EAFAC42699@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8639C367-2669-4924-83D8-15EAFAC42699@linux.vnet.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_064331_484617_49D59961 
X-CRM114-Status: GOOD (  17.94  )
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

T24gRnJpLCBKYW4gMTAsIDIwMjUgYXQgMTI6MzQ6NDZQTSArMDUzMCwgQXRoaXJhIFJhamVldiB3
cm90ZToKPiAKPiAKPiA+IE9uIDEwIEphbiAyMDI1LCBhdCAyOjQ04oCvQU0sIENoYXJsaWUgSmVu
a2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gCj4gPiBPbiBUaHUsIEphbiAw
OSwgMjAyNSBhdCAwNTo0OTozOVBNIC0wMzAwLCBBcm5hbGRvIENhcnZhbGhvIGRlIE1lbG8gd3Jv
dGU6Cj4gPj4gT24gVGh1LCBKYW4gMDksIDIwMjUgYXQgMTE6NDg6MzZBTSAtMDgwMCwgQ2hhcmxp
ZSBKZW5raW5zIHdyb3RlOgo+ID4+PiBPbiBUaHUsIEphbiAwOSwgMjAyNSBhdCAxMjo1OTo0M1BN
IC0wMzAwLCBBcm5hbGRvIENhcnZhbGhvIGRlIE1lbG8gd3JvdGU6Cj4gPj4+PiDirKIgW2FjbWVA
dG9vbGJveCBwZXJmLXRvb2xzLW5leHRdJCBnaXQgbG9nIC0tb25lbGluZSAtMSA7IHRpbWUgbWFr
ZSAtQyB0b29scy9wZXJmIGJ1aWxkLXRlc3QKPiA+Pj4+IGQwNjgyNjE2MGE5ODI0OTQgKEhFQUQg
LT4gcGVyZi10b29scy1uZXh0KSBwZXJmIHRvb2xzOiBSZW1vdmUgZGVwZW5kZW5jeSBvbiBsaWJh
dWRpdAo+ID4+Pj4gbWFrZTogRW50ZXJpbmcgZGlyZWN0b3J5ICcvaG9tZS9hY21lL2dpdC9wZXJm
LXRvb2xzLW5leHQvdG9vbHMvcGVyZicKPiA+Pj4+IC0gdGFycGtnOiAuL3Rlc3RzL3BlcmYtdGFy
Z3otc3JjLXBrZyAuCj4gPj4+PiAgICAgICAgICAgICAgICAgbWFrZV9zdGF0aWM6IGNkIC4gJiYg
bWFrZSBMREZMQUdTPS1zdGF0aWMgTk9fUEVSRl9SRUFEX1ZEU08zMj0xIE5PX1BFUkZfUkVBRF9W
RFNPWDMyPTEgTk9fSlZNVEk9MSBOT19MSUJUUkFDRUVWRU5UPTEgTk9fTElCRUxGPTEgLWoyOCAg
REVTVERJUj0vdG1wL3RtcC5KSlQzdHZON2JWCj4gPj4+PiAgICAgICAgICAgICAgbWFrZV93aXRo
X2d0azI6IGNkIC4gJiYgbWFrZSBHVEsyPTEgLWoyOCAgREVTVERJUj0vdG1wL3RtcC5CRjUzVjJx
cGwzCj4gPj4+PiAtIC9ob21lL2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4dC90b29scy9wZXJmL0JV
SUxEX1RFU1RfRkVBVFVSRV9EVU1QOiBjZCAuICYmIG1ha2UgRkVBVFVSRV9EVU1QX0NPUFk9L2hv
bWUvYWNtZS9naXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL3BlcmYvQlVJTERfVEVTVF9GRUFUVVJF
X0RVTVAgIGZlYXR1cmUtZHVtcAo+ID4+Pj4gY2QgLiAmJiBtYWtlIEZFQVRVUkVfRFVNUF9DT1BZ
PS9ob21lL2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4dC90b29scy9wZXJmL0JVSUxEX1RFU1RfRkVB
VFVSRV9EVU1QIGZlYXR1cmUtZHVtcAo+ID4+Pj4gICAgICAgICBtYWtlX25vX2xpYmJpb25pY19P
OiBjZCAuICYmIG1ha2UgTk9fTElCQklPTklDPTEgRkVBVFVSRVNfRFVNUD0vaG9tZS9hY21lL2dp
dC9wZXJmLXRvb2xzLW5leHQvdG9vbHMvcGVyZi9CVUlMRF9URVNUX0ZFQVRVUkVfRFVNUCAtajI4
IE89L3RtcC90bXAuS1p1UTBxMlZzNiBERVNURElSPS90bXAvdG1wLjBzeE15SDkxZ1MKPiA+Pj4+
ICAgICAgICAgICBtYWtlX3V0aWxfbWFwX29fTzogY2QgLiAmJiBtYWtlIHV0aWwvbWFwLm8gRkVB
VFVSRVNfRFVNUD0vaG9tZS9hY21lL2dpdC9wZXJmLXRvb2xzLW5leHQvdG9vbHMvcGVyZi9CVUlM
RF9URVNUX0ZFQVRVUkVfRFVNUCAtajI4IE89L3RtcC90bXAuWTBNeDNLTFJFSSBERVNURElSPS90
bXAvdG1wLndnOUhDVlZMSEUKPiA+Pj4+ICAgICAgICAgICAgICBtYWtlX2luc3RhbGxfTzogY2Qg
LiAmJiBtYWtlIGluc3RhbGwgRkVBVFVSRVNfRFVNUD0vaG9tZS9hY21lL2dpdC9wZXJmLXRvb2xz
LW5leHQvdG9vbHMvcGVyZi9CVUlMRF9URVNUX0ZFQVRVUkVfRFVNUCAtajI4IE89L3RtcC90bXAu
UDBMRUJBa1cxWCBERVNURElSPS90bXAvdG1wLmFnVGF2Wm5kRk4KPiA+Pj4+ICBmYWlsZWQgdG8g
ZmluZDogZXRjL2Jhc2hfY29tcGxldGlvbi5kL3BlcmYKPiA+Pj4gCj4gPj4+IElzIHRoaXMgc29t
ZXRoaW5nIGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaD8KPiA+PiAKPiA+PiBJIGRvbid0IHRoaW5r
IHNvLgo+ID4+IAo+ID4+IEJUVyB0aGlzIHNlcmllcyBpcyBhbHJlYWR5IHB1c2hlZCBvdXQgdG8g
cGVyZi10b29scy1uZXh0Ogo+ID4+IAo+ID4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3BlcmYvcGVyZi10b29scy1uZXh0LmdpdC9sb2cvP2g9cGVyZi10
b29scy1uZXh0Cj4gPj4gCj4gPj4gVGhhbmtzIQo+ID4+IAo+ID4+IC0gQXJuYWxkbwo+ID4gCj4g
PiBUaGFuayB5b3UhCj4gPiAKPiA+IC0gQ2hhcmxpZQo+IAo+IEhpIENoYXJsaWUsIEFybmFsZG8K
PiAKPiBXaGlsZSB0ZXN0aW5nIHRoZSBzZXJpZXMsIEkgaGl0IGNvbXBpbGF0aW9uIGlzc3VlIGlu
IHBvd2VycGMKPiAKPiBTbmlwcGV0IG9mIGxvZ3M6CgpZZWFoLCBTdGVwaGVuIFJvdGh3ZWxsIG5v
dGljZWQgaXQgaW4gbGludXggbmV4dCBhbmQgQ2hhcmxpZSBwcm92aWRlZCBhCmZpeCwgc28gSSBz
cXVhc2hlZCBpdCBhbGwgdG9nZXRoZXIgYW5kIHdpbGwgcHVzaCBpdCBzb29uOgoKICAgIExpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTAxMDgtcGVyZl9zeXNjYWxsdGJsLXY2LTE0
LTc1NDNiNTI5MzA5OEByaXZvc2luYy5jb20KICAgIExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xrbWwvMjAyNTAxMTAxMDA1MDUuNzhkODE0NTBAY2FuYi5hdXVnLm9yZy5hdQogICAgWyBT
dGVwaGVuIFJvdGh3ZWxsIG5vdGljZWQgb24gbGludXgtbmV4dCB0aGF0IHRoZSBwb3dlcnBjIGJ1
aWxkIGZvciBwZXJmIHdhcyBicm9rZW4gYW5kIC4uLl0KICAgIExpbms6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvMjAyNTAxMDktcGVyZl9wb3dlcnBjX3NwdS12MS0xLWMwOTdmYzQzNzM3
ZUByaXZvc2luYy5jb20KICAgIFsgLi4uIENoYXJsaWUgZml4ZWQgaXQgdXAgYW5kIGFza2VkIGZv
ciBpdCB0byBiZSBzcXVhc2hlZCB0byBhdm9pZCBicmVha2luZyBiaXNlY3Rpb24uIG8KClRoYW5r
cyBmb3IgdGhlIHJlcG9ydCEKCi0gQXJuYWxkbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
