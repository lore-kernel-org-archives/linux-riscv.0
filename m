Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00128D77899
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 17:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WvslPPwHz2b/IaKd3m/Ms4GR23I63G2SN4TIn4RcKqc=; b=eIvJuU1OZ5u5Yz
	6qwNVs5B/AipUtxuJUy4hqXGWSL79ADt14H323/R7wEudQ59jeRAVlQYI5ee7Z5nOpbmNpe0mYA+V
	8eShgsDn3FIKo4BdGYbos1FOaZnFGXdctSC7HkEc3lv/smja3e5A2d+hWebAlBz/MfcmC943MG5Na
	BvZ6q85ErEy4HqnYuA7yoieUuYeu6k3NF7mjysTrSs0VKxnAYL/AKH+smJjS9yGjwgkDG2kFF1d8P
	qEHd6XN0YtpnmWUlnjCookb/wKZBoZ0tOsOX3dRKhMAGwTLzghcvI50YVo88iSCc8gQ5a7VLfF2Ir
	vuky/jaSKZhlpuXhBTdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjLFb-00000009J42-2yUh;
	Fri, 23 Jan 2026 17:47:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjLFZ-00000009J3n-3euv;
	Fri, 23 Jan 2026 17:47:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EAE8460147;
	Fri, 23 Jan 2026 17:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E4DC4CEF1;
	Fri, 23 Jan 2026 17:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769190432;
	bh=Fvul9cTQTipTMlqs6XhjhLKNYQVXUkoZrLxvwUon1vQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EnJs6i5cTHOlKaNlU87cLSBa8KHPBnahqPMdwuu7AmNbJl+0lAV32DFm2xxVfJ+s1
	 M2VjiYN269iF/Fz1hKsagkuBCbTtBLNmI4o76vHdDNuWy/vP5qfM2NmJrjsyIOGpPz
	 oTtEljWa8LRkKv211KZkl0aIhoPn1LelEFGMrNm/2rbvJtBG7YzZmU8K7BwP43X2yn
	 1wBqL6mh9sWW8eYykQfWb4HzEVFhMmOcgdtcmohtx/ru/FspacPOjG336TlE1GCTPo
	 coPzT9tMq0lspF7y77DhDjko2h+ZmGKtWz/GJJj+42BGTI1U9g+GPumXQVn5Jhy7gw
	 sGkBR+CQRM/Lw==
Date: Fri, 23 Jan 2026 14:47:09 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Zecheng Li <zecheng@google.com>, Tianyou Li <tianyou.li@intel.com>,
	Thomas Falcon <thomas.falcon@intel.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>,
	Athira Rajeev <atrajeev@linux.ibm.com>,
	Aditya Bodkhe <aditya.b1@linux.ibm.com>,
	Howard Chu <howardchu95@gmail.com>,
	Krzysztof =?utf-8?Q?=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Shimin Guo <shimin.guo@skydio.com>,
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 11/12] perf disasm: Refactor arch__find and
 initialization of arch structs
Message-ID: <aXO0Hao8t-McaAU3@x1>
References: <20260122213516.671089-1-irogers@google.com>
 <20260122213516.671089-12-irogers@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122213516.671089-12-irogers@google.com>
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

T24gVGh1LCBKYW4gMjIsIDIwMjYgYXQgMDE6MzU6MTVQTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBTd2l0Y2ggYXJjaF9fZmluZCB0byB1c2luZyBhbiBFTEYgbWFjaGluZSBudW1iZXIgcmF0
aGVyIHRoYW4gYQo+IHN0cmluZy4gUmF0aGVyIHRoYW4gYW4gYXJyYXkgb2YgZml4ZWQgc2l6ZSBh
cmNoIHN0cnVjdHMgdHVybiB0aGUgaW5pdAo+IGZ1bmN0aW9ucyBpbnRvIG5ldyBmdW5jdGlvbnMg
aW5kZXhlZCBieSB0aGUgRUxGIG1hY2hpbmUgdGhleQo+IGNvcnJlc3BvbmQgdG8uIFRoaXMgYWxs
b3dzIGRhdGEgdG8gYmUgc3RvcmVkIHdpdGggYSBzdHJ1Y3QgYXJjaCB3aXRoCj4gdGhlIGNvbnRh
aW5lcl9vZiB0cmljaywgc28gdGhlIHByaXYgdmFyaWFibGUgY2FuIGJlIHJlbW92ZWQuIFN3aXRj
aCB0bwo+IHVzaW5nIHRoZSB0aHJlYWQgdG8gZmluZCB0aGUgYXJjaCByYXRoZXIgdGhhbiB0aGUg
ZXZzZWwgYXMgdGhlIGV2c2VsCj4gb25seSBoYXMgbGltaXRlZCBub3Rpb25zIG9mIHRoZSBydW5u
aW5nIHRocmVhZCB1cG9uIHdoaWNoIGRpc2Fzc2VtYmx5Cj4gaXMgcGVyZm9ybWVkLiBGYWN0b3Ig
b3V0IHRoZSBlX21hY2hpbmUgYW5kIGVfZmxhZ3MgaW50byB0aGVpciBvd24KPiBzdHJ1Y3QgdG8g
bWFrZSB0aGVtIGVhc2llciB0byBwYXNzIGFyb3VuZC4KCkFkZGVkOgoK4qyiIFthY21lQHRvb2xi
eCBwZXJmLXRvb2xzLW5leHRdJCBnaXQgZGlmZgpkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi91dGls
L2Rpc2FzbS5jIGIvdG9vbHMvcGVyZi91dGlsL2Rpc2FzbS5jCmluZGV4IDQ2NzQwZDFlNTg1ODAw
MDQuLjRmNjA3MjYyNDdkNjI3NjQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3BlcmYvdXRpbC9kaXNhc20u
YworKysgYi90b29scy9wZXJmL3V0aWwvZGlzYXNtLmMKQEAgLTEsNSArMSw5IEBACiAvLyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjaW5jbHVkZSA8Y3R5cGUuaD4KKyNp
bmNsdWRlIDxlbGYuaD4KKyNpZm5kZWYgRUZfQ1NLWV9BQklNQVNLCisjZGVmaW5lIEVGX0NTS1lf
QUJJTUFTSyAgICAgICAgMFhGMDAwMDAwMAorI2VuZGlmCiAjaW5jbHVkZSA8ZXJybm8uaD4KICNp
bmNsdWRlIDxmY250bC5oPgogI2luY2x1ZGUgPGludHR5cGVzLmg+CgoKV2l0aDoKCiAgICBbIElu
Y2x1ZGUgZWxmLmggZm9yIEVNX0NTS1kgYW5kIGZyaWVuZHMgYW5kIGFsc28gY29uZGl0aW9uYWxs
eSBkZWZpbmUgRU1fQ1NLWV9BQklNQVNLIGZvciBvbGQgZGlzdHJvcyBdCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
