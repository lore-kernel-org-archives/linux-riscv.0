Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E387CC28B2F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 05:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o5nav6k/+OHn79eDstg8gj8/0BmSKG6UKucmaddeAmA=; b=QjTPwBGtPDjNYn
	wiBas/kivTvPB4e3WwvTeR/H/kJEIZpGibN8kBpGn2ZVPRUrYF3a5bjAEOC2ApAECgmgMI58IBypP
	74CcZuAlu6FZ0peFThePR30oiC7bSg17mCcWKeKeDyNElkQ+oxANB5I4KCQUQnB7N8Ag6YBu2eYO6
	3FXDNOI8J8k7ObL+KO5g7/v80htr4TvWuWeDhVMq3c4VeZPyg9PZQEcPVJv0zMjqQ6K40A/P5CBtA
	XBTGpXNNHZzs1UI5+MwKSCmiRvDF07xN8Y/VRhek+TSBJaRe4b4iz8Z6Jf/YQLqEAOQ8JRQrTq/mh
	DdMhDI2O8OiY6UNV74dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsxtS-0000000D7vD-2HhO;
	Fri, 14 Mar 2025 05:47:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsxrl-0000000D7XB-2bKc;
	Fri, 14 Mar 2025 05:45:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C78F1A487DE;
	Fri, 14 Mar 2025 05:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40296C4CEE3;
	Fri, 14 Mar 2025 05:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741931152;
	bh=UIHoxzhPf3e+N6sft1joYHuPe2ZldXQM7xaEMHF8UQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g9V5wLKvvzdYnmDpHxzPOfq0AxNt5QiDf5RPSpD1Z9RQFIFrZI9gA6Ga/OC4vbrhF
	 zyDAK/ALK3zLwiZA6+/Q21+00Jl+xwDMvnbK9EKGk9+vsSta0y8nKGItKJlqK8TFK8
	 Zmt6h+ElRvf3Xdm+rk+dFeLAJn4QCe7tdd5Bcs7zqnaInu6fdUEwMmqvuSl7jzpzlk
	 y0LjtBD7LCjdJeUA0wCptEUIDygjsTNjui4I1ClM50r1tz72lQWQx5jEp6mYfhYszs
	 K0h3QOuxoRTchgjOR1QZXwOpfJDwG7nh3cJRlxEKdJeH0c8hGd77+eWDt9B5y6qNkZ
	 XKaU59OZuTVUg==
Date: Thu, 13 Mar 2025 22:45:49 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	guoren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 00/11] perf: Support multiple system call tables in
 the build
Message-ID: <Z9PCjQ8PhOadVGQ8@google.com>
References: <20250308003209.234114-1-irogers@google.com>
 <Z9KFLGpenwOP32q3@google.com>
 <Z9M24AJzui9lFbGo@x1>
 <Z9M9-YhDJg3NgiUy@x1>
 <Z9NEX3j_1RUvaFI0@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z9NEX3j_1RUvaFI0@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_224553_785231_5D4DB955 
X-CRM114-Status: GOOD (  16.11  )
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

T24gVGh1LCBNYXIgMTMsIDIwMjUgYXQgMDU6NDc6MjdQTSAtMDMwMCwgQXJuYWxkbyBDYXJ2YWxo
byBkZSBNZWxvIHdyb3RlOgo+IE9uIFRodSwgTWFyIDEzLCAyMDI1IGF0IDA1OjIwOjA5UE0gLTAz
MDAsIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyB3cm90ZToKPiA+IFN0aWxsIGJ1aWxkaW5nLCBi
dXQgbm90aWNlZCB0aGlzIG9uIHg4Nl82NDoKPiA+IAo+ID4gMTA1OiBwZXJmIHRyYWNlIGVudW0g
YXVnbWVudGF0aW9uIHRlc3RzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBGQUlMRUQh
Cj4gPiAxMDY6IHBlcmYgdHJhY2UgQlRGIGdlbmVyYWwgdGVzdHMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA6IEZBSUxFRCEKPiA+IDEwNzogcGVyZiB0cmFjZSBleGl0IHJhY2Ug
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogT2sKPiA+IDEwODog
cGVyZiB0cmFjZSByZWNvcmQgYW5kIHJlcGxheSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDogRkFJTEVEIQo+ID4gCj4gPiAKPiA+IFRoZSBmaXJzdCBkb2VzbsK0dCBoZWxwIHRo
YXQgbXVjaCB3aXRoIHZlcmJvc2UgbW9kZSwgaGF2ZW4ndCBjaGVja2VkIGlmCj4gPiBiZWZvcmUg
dGhpcyBzZXJpZXMgaXQgd2FzIGZhaWxpbmcgOi1cCj4gPiAKPiA+IHJvb3RAeDE6fiMgcGVyZiB0
ZXN0IC12dnYgMTA1Cj4gPiAxMDU6IHBlcmYgdHJhY2UgZW51bSBhdWdtZW50YXRpb24gdGVzdHM6
Cj4gPiAtLS0gc3RhcnQgLS0tCj4gPiB0ZXN0IGNoaWxkIGZvcmtlZCwgcGlkIDE5NDExCj4gPiBD
aGVja2luZyBpZiB2bWxpbnV4IGV4aXN0cwo+ID4gVHJhY2luZyBzeXNjYWxsIGxhbmRsb2NrX2Fk
ZF9ydWxlCj4gPiAtLS0tIGVuZCgtMSkgLS0tLQo+ID4gMTA1OiBwZXJmIHRyYWNlIGVudW0gYXVn
bWVudGF0aW9uIHRlc3RzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBGQUlMRUQhCj4g
PiByb290QHgxOn4jCj4gCj4gU286Cj4gCj4gcm9vdEB4MTp+IyBwZXJmIHRyYWNlIC1lIGxhbmRs
b2NrX2FkZF9ydWxlIHBlcmYgdGVzdCAtdyBsYW5kbG9jawo+IHJvb3RAeDE6fiMgCj4gCj4gQnV0
Ogo+IAo+IHJvb3RAeDE6fiMgcGVyZiB0cmFjZSBwZXJmIHRlc3QgLXcgbGFuZGxvY2sgfCYgZ3Jl
cCBsYW5kbG9ja19hZGRfcnVsZQo+ICAgICAyNi4xMjAgKCAwLjAwMiBtcyk6IHBlcmYvMTk3OTEg
bGFuZGxvY2tfYWRkX3J1bGUocnVsZXNldF9mZDogMTEsIHJ1bGVfdHlwZTogTEFORExPQ0tfUlVM
RV9QQVRIX0JFTkVBVEgsIHJ1bGVfYXR0cjogMHg3ZmZkZTc1ZTI2ODAsIGZsYWdzOiA0NSkgPSAt
MSBFSU5WQUwgKEludmFsaWQgYXJndW1lbnQpCj4gICAgIDI2LjEyNCAoIDAuMDAxIG1zKTogcGVy
Zi8xOTc5MSBsYW5kbG9ja19hZGRfcnVsZShydWxlc2V0X2ZkOiAxMSwgcnVsZV90eXBlOiBMQU5E
TE9DS19SVUxFX05FVF9QT1JULCBydWxlX2F0dHI6IDB4N2ZmZGU3NWUyNjkwLCBmbGFnczogNDUp
ID0gLTEgRUlOVkFMIChJbnZhbGlkIGFyZ3VtZW50KQo+IHJvb3RAeDE6fiMgCj4gCj4gLWUgaXMg
aGF2aW5nIHNvbWUgdHJvdWJsZSwgd2hlbiBubyBldmVudCBpcyBzcGVjaWZpZWQsIHRoZW4gaXQg
d29ya3MuCj4gCj4gU29tZXRoaW5nIGluIHRoZSBjaGFuZ2VzIG1hZGUgdG86Cj4gCj4gc3RhdGlj
IGludCB0cmFjZV9fcGFyc2VfZXZlbnRzX29wdGlvbihjb25zdCBzdHJ1Y3Qgb3B0aW9uICpvcHQs
IGNvbnN0IGNoYXIgKnN0ciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGludCB1bnNldCBfX21heWJlX3VudXNlZCkKClRoYW5rcyBmb3IgdGhlIHRlc3QsIEkgdGhpbmsg
dGhpcyBzaG91bGQgZml4IGl0OgoKVGhhbmtzLApOYW1oeXVuZwoKCi0tLTg8LS0tCmRpZmYgLS1n
aXQgYS90b29scy9wZXJmL3V0aWwvc3lzY2FsbHRibC5jIGIvdG9vbHMvcGVyZi91dGlsL3N5c2Nh
bGx0YmwuYwppbmRleCBhY2U2NmU2OWMxYmNkZTFlLi42N2E4ZWMxMGU5ZTRiYzhkIDEwMDY0NAot
LS0gYS90b29scy9wZXJmL3V0aWwvc3lzY2FsbHRibC5jCisrKyBiL3Rvb2xzL3BlcmYvdXRpbC9z
eXNjYWxsdGJsLmMKQEAgLTc2LDcgKzc2LDcgQEAgaW50IHN5c2NhbGx0YmxfX2lkKGludCBlX21h
Y2hpbmUsIGNvbnN0IGNoYXIgKm5hbWUpCiB7CiAgICAgICAgY29uc3Qgc3RydWN0IHN5c2NhbGx0
YmwgKnRhYmxlID0gZmluZF90YWJsZShlX21hY2hpbmUpOwogICAgICAgIHN0cnVjdCBzeXNjYWxs
X2NtcF9rZXkga2V5OwotICAgICAgIGNvbnN0IGludCAqaWQ7CisgICAgICAgY29uc3QgdWludDE2
X3QgKmlkOwogCiAgICAgICAgaWYgKCF0YWJsZSkKICAgICAgICAgICAgICAgIHJldHVybiAtMTsK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
