Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBCEC02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 18:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=16jgVLPOcLGG9vu5MQ1S/CDmiJ8g8iaV4nRQX+e4HZw=; b=tkCCg+AoFdNqhDZ1E0gFxwYOoT
	ptJh3c+V9XQ+8nB6HHmhoWQ3C98js85EypmuLOlnxCnIKl5v5kMDSDM6LsOMDzMaB1R1DX3sn1i0P
	zzWFnFN/JdfdX4XHQ5i+uSLnTiT91ROi0R4jjAPrGzy8hXgfxiy7i+SdRzvuyFUSSsYjE/FDOWNle
	mJA9wDh1AceVny8REd5oB5q0MaPofA0aG2ALuAUUremnzNhUBhckiB7XpHrfmaoE42zxkqv6pa61r
	39Q8GBpBhwLUtsVxfzUGO6shlPz411Sf0psCQv/rxYuNiBkb6sAPl9WLudniBBuhaS3kj2MHNEOy9
	lCevf27g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1D8-0000000GGHy-2n9y;
	Mon, 03 Feb 2025 18:30:18 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1Bm-0000000GFyr-2ndR
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 18:28:56 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3a814c54742so2335ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 10:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738607333; x=1739212133; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwX9yigjczno1Znsa9bRz1z0dQyr4IiRfFLwwoCxyg0=;
        b=oqfBxx9Beae5y9MZzP3WaYRczespCoin5DkP0ZJrZjt9gdZ06FC1McNp5Fn/bT7Dy0
         BOPuf6LD35ScU4ItkvaWnos02w4YurkxkwcSu05XjZHt5myW1djVcvzGN9Td8ns/Fb0N
         v3syR1mRCnwyjOWbifSj2x3gFOiTZU3Dsr2Avyd5vRHh73VUegBBbWQE0g3FH52c2bq/
         tWe0+dPgS1gNR4d0BqSekD5+v76NPAPFZ4RDt8mte+gu1WVpWaGlmHlfPlVpkUwQ+h3m
         KxBFLqXYrRZfZUrsa8CSVdER02GnK87yZ/klpv7Ys3VeuPAehYFOhbYzu3DOxxmKm3gW
         VCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738607333; x=1739212133;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwX9yigjczno1Znsa9bRz1z0dQyr4IiRfFLwwoCxyg0=;
        b=IzHACKXs8idZCSKtcy38JEZPM6im6JyKwfmNrL6ruEFrtoWE+uy75/TyUeQlVa1avu
         jXTJtC7TxF2gSyMaC+R+/WPmPfdEQ8PgRlwf0teZ0fLqJ7n4sgakjNrjoZvonCOT2DkM
         ybP+zgNfJPZbliek02KJLjUonetkVfDNHil1EUEP0AyUwLjOjGnpTVGNDOTXhFvlEaSI
         5ZDf2mtBbof2Vhe6j87XE5l6HaHxXV7yspNMlBts6HTxZ7eVpsONP5qJlH58l8urUtRc
         BEKxr+9knUqN6Yy8pWEn5fMj5VGW3eHVj6T0ij78GYq608UZ3gKwSP1ME1mf+J27k2zv
         Fekg==
X-Forwarded-Encrypted: i=1; AJvYcCVV9GbpWehmrqg3/pevualngV3zUu30QVIsbysjRnbnCRdHu4CvBPqs+D74AEx0Dks1CPmrBfXbmkiVOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsO8x75tejlYTAA+HK33EFx/w4ivy8HvC1B8c6pxkbU81RUjES
	9ZnABW3LCvr+YljmEIMd0FkH7gwrV3Bs6NYPIbYePZmDnchuMWec62qKnsX8LUrdXoEMtNolSBt
	L/mK59SmAHfbwgc4SowT0wuexvnFpDCQ4G/ZW
X-Gm-Gg: ASbGnctx/RqY94GtRFPUc9bTAiDqoOv0xjTKVLj9Q2p/3yG9aweuYt99UHIsK7K8Ej9
	WYVLfGVLg7Hgka0ts7s/xnzWrrG/+DaDfUjoxZdL4+IM6VlXd2eG/OOKkKQDwghDvC96HrnpNu7
	ZpDRZWbpftXIOXpDPFzfbB5xQ=
X-Google-Smtp-Source: AGHT+IH+A9TihiG72yU0Vq5EiYylzTrE/IWJEUJYg00EcqiTZKQbwizmjhExw2bHiq41772gYqefQvOo1dSun9QKKsQ=
X-Received: by 2002:a05:6e02:152b:b0:3a7:e3b3:2e3 with SMTP id
 e9e14a558f8ab-3d03eef69e2mr568275ab.17.1738607331812; Mon, 03 Feb 2025
 10:28:51 -0800 (PST)
MIME-Version: 1.0
References: <20250201071455.718247-1-irogers@google.com> <CAP-5=fVJPAEhvyV_dPHSHKJVeskCf_paFSP6V4EWmEyqACeA-w@mail.gmail.com>
In-Reply-To: <CAP-5=fVJPAEhvyV_dPHSHKJVeskCf_paFSP6V4EWmEyqACeA-w@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 3 Feb 2025 10:28:40 -0800
X-Gm-Features: AWEUYZk2d0_RD-bETg-4iKC_pajIBGhSvw_oeuucHt_WAGp1zkLzZrIkQ1Y7lrI
Message-ID: <CAP-5=fX2BtFzhGLCSqO1QszqfX=HT8RrTdG_5Ttp5Gw4seSstA@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] perf: Support multiple system call tables in the build
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_102854_708005_27348822 
X-CRM114-Status: GOOD (  26.29  )
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

T24gU2F0LCBGZWIgMSwgMjAyNSBhdCAxMjo1MeKAr0FNIElhbiBSb2dlcnMgPGlyb2dlcnNAZ29v
Z2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEphbiAzMSwgMjAyNSBhdCAxMToxNeKAr1BNIElh
biBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhpcyB3b3JrIGJ1
aWxkcyBvbiB0aGUgY2xlYW4gdXAgb2Ygc3lzdGVtIGNhbGwgdGFibGVzIGFuZCByZW1vdmFsIG9m
Cj4gPiBsaWJhdWRpdCBieSBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPi4K
PiA+Cj4gPiBUaGUgc3lzdGVtIGNhbGwgdGFibGUgaW4gcGVyZiB0cmFjZSBpcyB1c2VkIHRvIG1h
cCBzeXN0ZW0gY2FsbCBudW1iZXJzCj4gPiB0byBuYW1lcyBhbmQgdmljZSB2ZXJzYS4gUHJpb3Ig
dG8gdGhlc2UgY2hhbmdlcywgYSBzaW5nbGUgdGFibGUKPiA+IG1hdGNoaW5nIHRoZSBwZXJmIGJp
bmFyeSdzIGJ1aWxkIHdhcyBwcmVzZW50LiBUaGUgdGFibGUgd291bGQgYmUKPiA+IGluY29ycmVj
dCBpZiB0cmFjaW5nIHNheSBhIDMyLWJpdCBiaW5hcnkgZnJvbSBhIDY0LWJpdCB2ZXJzaW9uIG9m
Cj4gPiBwZXJmLCB0aGUgbmFtZXMgYW5kIG51bWJlcnMgd291bGRuJ3QgbWF0Y2guCj4gPgo+ID4g
Q2hhbmdlIHRoZSBidWlsZCBzbyB0aGF0IGEgc2luZ2xlIHN5c3RlbSBjYWxsIGZpbGUgaXMgYnVp
bHQgYW5kIHRoZQo+ID4gcG90ZW50aWFsbHkgbXVsdGlwbGUgdGFibGVzIGFyZSBpZGVudGlmaWFi
bGUgZnJvbSB0aGUgRUxGIG1hY2hpbmUgdHlwZQo+ID4gb2YgdGhlIHByb2Nlc3MgYmVpbmcgZXhh
bWluZWQuIFRvIGRldGVybWluZSB0aGUgRUxGIG1hY2hpbmUgdHlwZSwgdGhlCj4gPiBleGVjdXRh
YmxlJ3MgaGVhZGVyIGlzIHJlYWQgZnJvbSAvcHJvYy9waWQvZXhlIHdpdGggZmFsbGJhY2tzIHRv
IHVzaW5nCj4gPiB0aGUgcGVyZidzIGJpbmFyeSB0eXBlIHdoZW4gdW5rbm93bi4KPiA+Cj4gPiBS
ZW1vdmUgc29tZSBydW50aW1lIHR5cGVzIHVzZWQgYnkgdGhlIHN5c3RlbSBjYWxsIHRhYmxlcyBh
bmQgbWFrZQo+ID4gZXF1aXZhbGVudHMgZ2VuZXJhdGVkIGF0IGJ1aWxkIHRpbWUuCj4gPgo+ID4g
SWFuIFJvZ2VycyAoNyk6Cj4gPiAgIHBlcmYgc3lzY2FsbHRibGU6IFJlbW92ZSBzeXNjYWxsX3Rh
YmxlLmgKPiA+ICAgcGVyZiB0cmFjZTogUmVvcmdhbml6ZSBzeXNjYWxscwo+ID4gICBwZXJmIHN5
c2NhbGx0Ymw6IFJlbW92ZSBzdHJ1Y3Qgc3lzY2FsbHRibAo+ID4gICBwZXJmIHRocmVhZDogQWRk
IHN1cHBvcnQgZm9yIHJlYWRpbmcgdGhlIGVfbWFjaGluZSB0eXBlIGZvciBhIHRocmVhZAo+ID4g
ICBwZXJmIHRyYWNlIGJlYXV0eTogQWRkIHN5c2NhbGx0Ymwuc2ggZ2VuZXJhdGluZyBhbGwgc3lz
dGVtIGNhbGwgdGFibGVzCj4gPiAgIHBlcmYgc3lzY2FsbHRibDogVXNlIGxvb2t1cCB0YWJsZSBj
b250YWluaW5nIG11bHRpcGxlIGFyY2hpdGVjdHVyZXMKPiA+ICAgcGVyZiBidWlsZDogUmVtb3Zl
IE1ha2VmaWxlLnN5c2NhbGxzCj4KPiBJZiB5b3UgYXJlIGxvb2tpbmcgZm9yIHRoZSBpbXByb3Zl
bWVudCB0aGlzIHNlcmllcyBhY2hpZXZlcywgcGF0Y2ggNgo+IGhhcyBzYW1wbGUgYmVmb3JlIGFu
ZCBhZnRlciBvdXRwdXQ6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI1MDIwMTA3
MTQ1NS43MTgyNDctNy1pcm9nZXJzQGdvb2dsZS5jb20vCgpJIHRoaW5rIHRoZXJlIGlzIGEgZm9s
bG93IHVwIHRvIHRoZXNlIHBhdGNoZXMgdG8gY2xlYW4gdXAgdGhlIG5vdGlvbgpvZiAiYXJjaCIg
YW5kIGl0cyAibmFtZSIgbWVtYmVyOgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9wZXJmL3BlcmYtdG9vbHMtbmV4dC5naXQvdHJlZS90b29scy9wZXJmL3V0
aWwvZGlzYXNtLmg/aD1wZXJmLXRvb2xzLW5leHQjbjIwClRoZSBuYW1lIG9uIHg4Ni02NCBoYXMg
dGhlIHZhbHVlICJ4ODYiIGFuZCBpc24ndCBrbm93biB0byBiZSBpMzg2IG9yCng4Ni02NCwgY2F1
c2luZyBhbWJpZ3VpdHkgdG8gd29yayBhcm91bmQ6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3BlcmYvcGVyZi10b29scy1uZXh0LmdpdC90cmVlL3Rvb2xz
L3BlcmYvdXRpbC9kaXNhc20uYz9oPXBlcmYtdG9vbHMtbmV4dCNuMTg5OApJdCBmZWVscyBsaWtl
bHkgdGhhdCByYXRoZXIgdGhhbiByZWNvcmRpbmcgKGluIGVudikgYSBzdHJpbmcgYmFzZWQgb24K
dW5hbWUgYW5kIGJhc2hpbmcgaXQgYXJvdW5kOgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9wZXJmL3BlcmYtdG9vbHMtbmV4dC5naXQvdHJlZS90b29scy9w
ZXJmL3V0aWwvZW52LmM/aD1wZXJmLXRvb2xzLW5leHQjbjQ0MApJdCB3b3VsZCBiZSBiZXR0ZXIg
dG8gcmVjb3JkIHRoZSBlX21hY2hpbmUgdmFsdWVzIGZvciB0aGUgc2V0IG9mCnRocmVhZHMgaW4g
dGhlIHJlY29yZCwgb3IganVzdCBhIHNldCBvZiBwb3RlbnRpYWwgZV9tYWNoaW5lIHZhbHVlcy4g
V2UKY2FuIGdldCByaWQgb2YgbmFtZSBpbiBhcmNoLCB1c2UgZV9tYWNoaW5lIGZyb20gc29tZSBk
c28gaGVscGVyLCBhbmQKdGhlbiBkZWFsIHdpdGggdGhpcyBhcyBhcHByb3ByaWF0ZSB3aXRob3V0
IG5lZWRpbmcgdG8gY2FycnkgYXJvdW5kCmlzXzY0Yml0IHRvIGRlYWwgd2l0aCBhbWJpZ3VpdHku
CgpBIGNoYW5nZSBsaWtlIHRoaXMgd291bGQgbmVlZCBpdHMgb3duIGZlYXR1cmUgZmxhZywgYW5k
IGhlbHBlcnMKYmV0d2VlbiB0aGUgb2xkIG5hbWUgYW5kIGVfbWFjaGluZSBzbyBhbGwgbm90aW9u
cyBvZiB0aGUgb2xkIHN0eWxlCm5hbWUgY291bGQgYmUgcmVtb3ZlZCwgZXRjLiBJdCBtYXkgYmUg
Y29udmVuaWVudCB0byBkdXBsaWNhdGUgYXJjaAp0YWJsZXMgZm9yIGkzODYveDg2LTY0IHJhdGhl
ciB0aGFuIGhhdmUgZGlzYXNtJ3MgYXJjaCBkZWFsIHdpdGggYSBzZXQKb2YgZV9tYWNoaW5lcy4K
ClRoYW5rcywKSWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
