Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D639CCCA470
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 18:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0lh0Fd2OdWUaJeq++B343TiX75HzA9JDEdnYBz7YBVM=; b=wR+LeQN3lHUt7T
	beJ44YOfud+jzXYiTRNDWrsVApkipnq0+PZPUoaa1GgBnuygO3OX8My0+HP/UhYax6fVFQfaUp31m
	sUwABjZ3Be026ko6WShbcjMhejeNlrAcVwAs7fs0VetBgA9mIMJ74MZ/hR+wY5+3Yc3Kh8Q8Bltk+
	FohZ1pnpT3wsouz09mO94AylAcVInJYqqUqQgWZ7IXcRkiHkEzj27ZF8/hNC7gpuDXxoA/kARSIkQ
	NV2oC2jjhD/xvq0oKIkgYJwklvtCyOxzcT8fZepmkIvIglycRHvopKzi8dZATNQDBLBjFWZd7TaJa
	0psIK7ILauvtZmPfDn+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3es9-00000005xJk-2L0M;
	Tue, 30 Sep 2025 18:14:45 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3es7-00000005xJH-0Inh
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 18:14:44 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-27d67abd215so28655ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Sep 2025 11:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759256082; x=1759860882; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JhHQw6uDnIpZGqNLt8rg/euuDEf1NIeByJWbMKA7f0=;
        b=JtZpfOKhquXwSc5UzizeXXU0dOJSNnXwVMN1qLV4MQ4q3A1VW8MFmz0Tr6qh7Ab9YX
         HIFjzZ66T7bROs4P4fNaeOH1I/B6xv+5S5PyyTgaU5Ek+hqAhohlzt7gvrfxFrjRm5Xl
         V2SXD6aS9YJZqFvAR27bvNaH9f7Z+Hjo7Ar6cpN4ROtT8R7Ah4bWDo+VDxuE/BhIWTjz
         dtdmIh9Cow2x0M99foiBScjjjK08MKV28FeHwG/jS7TXB6adGTmw0F+ju8xi8ghLRDZ7
         Yn3roRo4Ry3DZe6tGfn+Auv48rcJ9c31I9YKkwUbXL0cB4wlbec6lW4WSuJNcHX55Vf8
         7HyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759256082; x=1759860882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JhHQw6uDnIpZGqNLt8rg/euuDEf1NIeByJWbMKA7f0=;
        b=k1mZYNuNd97LpWio0wVSst3q67UE5N6yDN6msv81QApFFZSOSSTZCV8SP8nDJI19Y3
         NZh2lzrGLwNcQa29v7s4Ws1Y7HIvL5uene+vyD622fnvj5OHcjh7BCV23oqDIzhs106O
         bVg1PyR5XNNfZkTKb4FPAPJnkcwyey2SH85ExkaQe4Cs+rn9SmyFkFySm0Io/gSKIlN5
         OfYP5WP2CyfrXTPfzDghJ1NjLS2wVM84lhGNPV/qYzr/SgqGGPI6FQRAciPRqbXQg96M
         vzT4RPPnhks4JXmo+yYg3sxkC3T/nhXfmcfXVNSQ0b3Gv4uiQWennxRJhECtDDMAKKDI
         J6Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWuEWHdnsub/ZOX90Z+3aBvZhgVKo/yZAwOyRl4YmXxN+1FP22NKe2I5roH3AZzUihK/kWWXRedb5slvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjhIhnHFpU+DQbGQtE2A3Jl+ymZZ/RIHURiKJEf16UvyFdZ2Ti
	81qiV8zKfGG5VA0dE88w7S7E5HXxKWtWi2bdIZDYqfYjBzxloaNPjRJIfBrqx61vEj3of5+6NNR
	haOgMrdhzD4EDO3xqGVc58waRqVvzZhzwZS5BU8tj
X-Gm-Gg: ASbGncuEneznJVUExE/MnHwGEga0ePURFa4KADVlYwkWYGAwSIPsDtXDEO3WWJVxxch
	XSqUpCBRxG6r5D4DQZszNqE+nw182ppnD7NGk0t3zlW45xFyLqf27xznGdqYX3kJ9W72Oa3j/Om
	JwSFKgmCirAkVL9t3D1Prr8MrWabF2JWyRK/DSBufaJZsoKIv78OvmDreT719H8Mchbe/oSfd+W
	v5gZXItEpSQP1q7P5Hc3+dbm5x27Vh02+DolVN4FzCRraZxwLs2ot9Y4HMxhx4aameBi5WjtqGC
	+kw=
X-Google-Smtp-Source: AGHT+IEhDpKOzk1V76VOHcN+llC8N2LBlKYGHUrdZNNKDJH5D89iF4L3nfYy1fwm1qWHrVShZ3D5tqaGnLS187GjSew=
X-Received: by 2002:a17:902:ce07:b0:266:b8a2:f5d8 with SMTP id
 d9443c01a7336-28e80054fc2mr385095ad.14.1759256081883; Tue, 30 Sep 2025
 11:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250930-perf_build_android_ndk-v2-0-2ea440b7ef01@arm.com>
In-Reply-To: <20250930-perf_build_android_ndk-v2-0-2ea440b7ef01@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 30 Sep 2025 11:14:30 -0700
X-Gm-Features: AS18NWBjMfrHGB5lKU8Vu2vvk7TM7-6lS4GVzlRhAcGcul5zXgxYKOUicYvXdBY
Message-ID: <CAP-5=fUdk-EEDz2p__UJAcmkO=bA143dOUpGRcnW7_5FhZT71Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] perf build: Support building with Clang
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_111443_116254_88F284B2 
X-CRM114-Status: GOOD (  18.59  )
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

T24gVHVlLCBTZXAgMzAsIDIwMjUgYXQgOTo1NeKAr0FNIExlbyBZYW4gPGxlby55YW5AYXJtLmNv
bT4gd3JvdGU6Cj4KPiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIGJ1aWxkaW5nIHBlcmYg
d2l0aCBDbGFuZywgZm9sbG93aW5nIHRoZQo+IGRpc2N1c3Npb24gaW4gWzFdLiBCZWNhdXNlIHRo
ZSBBbmRyb2lkIE5ESyB1c2VzIENsYW5nIGJ5IGRlZmF1bHQsCj4gZW5hYmxpbmcgQ2xhbmcgYnVp
bGRzIG5hdHVyYWxseSBjb3ZlcnMgQW5kcm9pZCBhcyB3ZWxsLgo+Cj4gVGhlIHNlcmllcyBpcyBv
cmdhbml6ZWQgYXMgZm9sbG93czoKPgo+ICAgLSBQYXRjaGVzIDHigJMyOiBGaXggdHdvIGJ1Z3Mg
Zm91bmQgd2l0aCBDbGFuZy4KPiAgIC0gUGF0Y2hlcyAz4oCTNjogQ29ycmVjdCBDUk9TU19BUkNI
IGFuZCBkaXNtaXNzIENsYW5nIGJ1aWxkIHdhcm5pbmdzLgo+ICAgLSBQYXRjaGVzIDfigJM4OiBF
bmFibGUgQ2xhbmcgaW4gdGhlIE1ha2VmaWxlIGFuZCB1cGRhdGUgdGhlCj4gICAgIGRvY3VtZW50
YXRpb24uCj4KPiBUZXN0aW5nOgo+Cj4gICAtIENsYW5nIDE1LjAuNyBvbiBVYnVudHUgMjIuMDQu
NTogbmF0aXZlIGFuZCBjcm9zcy1jb21waWxpbmcgKGFhcmNoNjQpCj4gICAtIENsYW5nIDE4LjEu
MyBvbiBVYnVudHUgMjQuMDQuMjogbmF0aXZlIGFuZCBjcm9zcy1jb21waWxpbmcgKGFhcmNoNjQp
Cj4gICAtIEFuZHJvaWQgTkRLIHIyN2QgKGxhdGVzdCBMVFMpOiBjcm9zcy1jb21waWxpbmcgKGFh
cmNoNjQpCj4KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcGVyZi11c2Vycy8y
MDI0MDcxNTE0MzM0Mi41MjIzNi0xLWxlby55YW5AYXJtLmNvbS8KPgo+IC0tLQo+IENoYW5nZXMg
aW4gdjI6Cj4gLSBEcm9wcGVkIHRoZSBwYXRjaCBmb3IgZGlzbWlzc2luZyB3YXJuaW5nIGluIGJw
ZnRvb2wuCj4gLSBSZWZpbmVkIHRoZSBkb2N1bWVudC4gKElhbikKPiAtIExpbmsgdG8gdjE6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA5MjUtcGVyZl9idWlsZF9hbmRyb2lkX25kay12
MS0wLThiMzVhYWRkZTNkY0Bhcm0uY29tCgpSZXZpZXdlZC1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vy
c0Bnb29nbGUuY29tPgoKVGhhbmtzLApJYW4KCj4gLS0tCj4gTGVvIFlhbiAoOCk6Cj4gICAgICAg
dG9vbHMgYnVpbGQ6IEFsaWduIHdhcm5pbmcgb3B0aW9ucyB3aXRoIHBlcmYKPiAgICAgICBwZXJm
IHB5dGhvbjogc3BsaXQgQ2xhbmcgb3B0aW9ucyB3aGVuIGludm9raW5nIFBvcGVuCj4gICAgICAg
cGVyZjogYnVpbGQ6IENvcnJlY3QgQ1JPU1NfQVJDSCBmb3IgY2xhbmcKPiAgICAgICBwZXJmIHRl
c3QgY29yZXNpZ2h0OiBEaXNtaXNzIGNsYW5nIHdhcm5pbmcgZm9yIG1lbWNweSB0aHJlYWQKPiAg
ICAgICBwZXJmIHRlc3QgY29yZXNpZ2h0OiBEaXNtaXNzIGNsYW5nIHdhcm5pbmcgZm9yIHRocmVh
ZCBsb29wCj4gICAgICAgcGVyZiB0ZXN0IGNvcmVzaWdodDogRGlzbWlzcyBjbGFuZyB3YXJuaW5n
IGZvciB1bnJvbGwgbG9vcCB0aHJlYWQKPiAgICAgICBwZXJmIGJ1aWxkOiBTdXBwb3J0IGJ1aWxk
IHdpdGggY2xhbmcKPiAgICAgICBwZXJmIGRvY3M6IERvY3VtZW50IGJ1aWxkaW5nIHdpdGggQ2xh
bmcKPgo+ICB0b29scy9idWlsZC9mZWF0dXJlL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAg
ICB8ICA2ICstCj4gIHRvb2xzL3BlcmYvRG9jdW1lbnRhdGlvbi9CdWlsZC50eHQgICAgICAgICAg
ICAgICAgIHwgMTUgKysrKwo+ICB0b29scy9wZXJmL0RvY3VtZW50YXRpb24vYW5kcm9pZC50eHQg
ICAgICAgICAgICAgICB8IDgwICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgdG9vbHMvcGVyZi9N
YWtlZmlsZS5jb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgfCAzMiArKysrKysrKy0KPiAg
dG9vbHMvcGVyZi9NYWtlZmlsZS5wZXJmICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiAr
LQo+ICAuLi4vc2hlbGwvY29yZXNpZ2h0L21lbWNweV90aHJlYWQvbWVtY3B5X3RocmVhZC5jICB8
ICAyICsKPiAgLi4uL3NoZWxsL2NvcmVzaWdodC90aHJlYWRfbG9vcC90aHJlYWRfbG9vcC5jICAg
ICAgfCAgNCArLQo+ICAuLi4vdW5yb2xsX2xvb3BfdGhyZWFkL3Vucm9sbF9sb29wX3RocmVhZC5j
ICAgICAgICB8ICA0ICstCj4gIHRvb2xzL3BlcmYvdXRpbC9zZXR1cC5weSAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDUgKy0KPiAgOSBmaWxlcyBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCsp
LCA4MyBkZWxldGlvbnMoLSkKPiAtLS0KPiBiYXNlLWNvbW1pdDogYzE3ZGRhODAxMzQ5NWQ4MTMy
Yzk3NmNiZjM0OWJlOTk0OWQwZmJkMQo+IGNoYW5nZS1pZDogMjAyNTA5MTUtcGVyZl9idWlsZF9h
bmRyb2lkX25kay01MDBiNTNiZWE4OTUKPgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IExlbyBZYW4g
PGxlby55YW5AYXJtLmNvbT4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
