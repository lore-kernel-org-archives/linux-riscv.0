Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8745DC28B30
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 20:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0MgESOMBLjqTu4QBb/fQ8x0pVjHdrWW1Pq7QZ5lgfWs=; b=A9j42wfMAmi1uO
	AzYDPRyI8AhS9Sq8gfhEqB8S9yvigLC+N2BxRysvHnoImGD96aX2Pt1Rfn9VMPCb1xHxBmWvjb3QR
	aESm0ZmbMIqYnuUVRLa5nOi/+gLJSQYXEYclbP8Ck1XoP22//i0Nupdy1nXDQpL7OQaHXEO9tk8pR
	CPPuX2gmhykC9+076FHMlVUQBJbxAqOysS7obB5sOKKIsoWE7CcXW4VY5Oa5yL7ELVKgyp9GrJXiL
	hQghxnpeM6SZ3iwexVaFG69x+YKLROSWqqJ6RVUU+GPQjPAewtMtDQIzM9McpjmfCYhM1B3xbyn8h
	cGLtqFTHugMHfWIcl5hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttByj-0000000FG9s-2uFT;
	Fri, 14 Mar 2025 20:50:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttBx2-0000000FG2B-0dY2;
	Fri, 14 Mar 2025 20:48:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7268CA452F9;
	Fri, 14 Mar 2025 20:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6662EC4CEE3;
	Fri, 14 Mar 2025 20:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741985294;
	bh=QZITLRQh5Pilrk+i/O0RCZEME5s/otaVmwmlBiRuMuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L3Ixpg0HJRCUFTfxE27Wt1rf8UBwz/oBrqEwQ9TeF9/iO30PlBJ8WNVSSD5qv5EqV
	 0QZowG9NQuNgXghNkjEX/Tx//JTcWhTB+KMh7ybKLX5Td2nN+NXi3lYZEhzxwVPsXr
	 CBZvSaTK2r4/M/SSF53bjnEDUhx9cygiadLNhksopMJag21XS1RvvDrHOOiyQvC4q3
	 KzpDNpGOq86V8Bs8t/v0iom/0v/rp39B2r7cXw8M5qtlRboDqOAiyuruu8z1dCjK62
	 g33yb3zw2Yj9QIlS8v0fOot5OPXhLXXBjoIA7/RltVeW6qxvels5qW8AGtYIxV/Lww
	 tropxqqdJRitQ==
Date: Fri, 14 Mar 2025 17:48:12 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
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
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 00/11] perf: Support multiple system call tables in
 the build
Message-ID: <Z9SWDGsdgagMr8PV@x1>
References: <20250308003209.234114-1-irogers@google.com>
 <Z9KFLGpenwOP32q3@google.com>
 <Z9M24AJzui9lFbGo@x1>
 <Z9M9-YhDJg3NgiUy@x1>
 <Z9NEX3j_1RUvaFI0@x1>
 <Z9PCjQ8PhOadVGQ8@google.com>
 <Z9RjHpEJGWtj8PAM@x1>
 <Z9Rm0W6YLpxKIcI1@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z9Rm0W6YLpxKIcI1@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_134816_325985_76B42110 
X-CRM114-Status: GOOD (  12.39  )
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

T24gRnJpLCBNYXIgMTQsIDIwMjUgYXQgMDI6MjY6NDFQTSAtMDMwMCwgQXJuYWxkbyBDYXJ2YWxo
byBkZSBNZWxvIHdyb3RlOgo+IGl0IGZpbmRzIHRoZSBwYWlyLCBidXQgdGhlbiBpdHMgc2MtPmFy
Z3MgaGFzIGEgYm9ndXMgcG9pbnRlci4uLiBJJ2xsIHNlZQo+IHdoZXJlIHRoaXMgaXNuJ3QgYmVp
bmcgaW5pdGlhbGl6ZWQuLi4KCkJyZWFrcG9pbnQgNCwgdHJhY2VfX2ZpbmRfdXNhYmxlX2JwZl9w
cm9nX2VudHJ5ICh0cmFjZT0weDdmZmZmZmZmYTUxMCwgc2M9MHgxMDQ2ZjEwKSBhdCBidWlsdGlu
LXRyYWNlLmM6Mzg3NAozODc0CQkJYm9vbCBpc19jYW5kaWRhdGUgPSBmYWxzZTsKKGdkYikgbgoz
ODc2CQkJaWYgKHBhaXIgPT0gTlVMTCB8fCBwYWlyID09IHNjIHx8CihnZGIpIHAgcGFpcgokNyA9
IChzdHJ1Y3Qgc3lzY2FsbCAqKSAweDEwODNjNTAKKGdkYikgcCBwYWlyLT5uYW1lCiQ4ID0gMHg4
MTQ3OGUgImFjY2VwdDQiCihnZGIpIG4KMzg3NwkJCSAgICBwYWlyLT5icGZfcHJvZy5zeXNfZW50
ZXIgPT0gdHJhY2UtPnNrZWwtPnByb2dzLnN5c2NhbGxfdW5hdWdtZW50ZWQpCihnZGIpIHAgaQok
OSA9IDEKKGdkYikgbgozODc2CQkJaWYgKHBhaXIgPT0gTlVMTCB8fCBwYWlyID09IHNjIHx8Cihn
ZGIpIG4KMzg4MAkJCXByaW50Zigic2M9JXBcbiIsIHNjKTsgZmZsdXNoKHN0ZG91dCk7CihnZGIp
IG4Kc2M9MHgxMDQ2ZjEwCjM4ODEJCQlwcmludGYoInNjLT5uYW1lPSVwXG4iLCBzYy0+bmFtZSk7
IGZmbHVzaChzdGRvdXQpOwooZ2RiKSBuCnNjLT5uYW1lPTB4NmM2NjIwMmM3ODZjMzgzMAozODgy
CQkJcHJpbnRmKCJzYy0+bnJfYXJncz0lZCwgc2MtPmFyZ3M9JXBcbiIsIHNjLT5ucl9hcmdzLCBz
Yy0+YXJncyk7IGZmbHVzaChzdGRvdXQpOwooZ2RiKSBwIHNjLT5ucl9hcmdzCiQxMCA9IDE5MzU2
MzUwNDUKKGdkYikgcCBzYy0+YXJncwokMTEgPSAoc3RydWN0IHRlcF9mb3JtYXRfZmllbGQgKikg
MHgyNTc4MzAyMDNhNmU2NTZjCihnZGIpIHAgKnNjCiQxMiA9IHtlX21hY2hpbmUgPSA1NDA2OTc3
MDIsIGlkID0gODA3NzYxOTY4LCB0cF9mb3JtYXQgPSAweDY1NzA3NTIwMmM3ODZjMzgsIG5yX2Fy
Z3MgPSAxOTM1NjM1MDQ1LCBhcmdzX3NpemUgPSAxNjM0NDI3NzU5LCBicGZfcHJvZyA9IHtzeXNf
ZW50ZXIgPSAweDI1NzgzMDIwM2E3MjY0NjQsIAogICAgc3lzX2V4aXQgPSAweDcwNzUyMDJjNzg2
YzM4MzB9LCBpc19leGl0ID0gMTAxLCBpc19vcGVuID0gMTAxLCBub25leGlzdGVudCA9IDExNCwg
dXNlX2J0ZiA9IDk1LCBhcmdzID0gMHgyNTc4MzAyMDNhNmU2NTZjLCAKICBuYW1lID0gMHg2YzY2
MjAyYzc4NmMzODMwIDxlcnJvcjogQ2Fubm90IGFjY2VzcyBtZW1vcnkgYXQgYWRkcmVzcyAweDZj
NjYyMDJjNzg2YzM4MzA+LCBmbXQgPSAweDI1NzgzMDIwM2E3MzY3NjEsIGFyZ19mbXQgPSAweDc4
NmMzODMwfQooZ2RiKSAKCk9rLCByYW4gb3V0IG9mIHRpbWUsIGJ1dCBpZiBJIHNpbXBsZSBhdm9p
ZCB0aGUgc2Vjb25kIGxvb3AgaW46CgpzdGF0aWMgaW50IHRyYWNlX19pbml0X3N5c2NhbGxzX2Jw
Zl9wcm9nX2FycmF5X21hcHMoc3RydWN0IHRyYWNlICp0cmFjZSwgaW50IGVfbWFjaGluZSkKCgpJ
LmUuIHRoZSBvbmUgdGhhdCBzdGFydHMgd2l0aDoKCiAgICAgICAgLyoKICAgICAgICAgKiBOb3cg
bGV0cyBkbyBhIHNlY29uZCBwYXNzIGxvb2tpbmcgZm9yIGVuYWJsZWQgc3lzY2FsbHMgd2l0aG91
dAogICAgICAgICAqIGFuIGF1Z21lbnRlciB0aGF0IGhhdmUgYSBzaWduYXR1cmUgdGhhdCBpcyBh
IHN1cGVyc2V0IG9mIGFub3RoZXIKICAgICAgICAgKiBzeXNjYWxsIHdpdGggYW4gYXVnbWVudGVy
IHNvIHRoYXQgd2UgY2FuIGF1dG8tcmV1c2UgaXQuCgpUaGlzOgoKZGlmZiAtLWdpdCBhL3Rvb2xz
L3BlcmYvYnVpbHRpbi10cmFjZS5jIGIvdG9vbHMvcGVyZi9idWlsdGluLXRyYWNlLmMKaW5kZXgg
ZTA0MzRmN2RjNjdjYjk4OC4uMzY2NGJiNTEyYzcwY2FiZiAxMDA2NDQKLS0tIGEvdG9vbHMvcGVy
Zi9idWlsdGluLXRyYWNlLmMKKysrIGIvdG9vbHMvcGVyZi9idWlsdGluLXRyYWNlLmMKQEAgLTM5
ODksNiArMzk4OSw4IEBAIHN0YXRpYyBpbnQgdHJhY2VfX2luaXRfc3lzY2FsbHNfYnBmX3Byb2df
YXJyYXlfbWFwcyhzdHJ1Y3QgdHJhY2UgKnRyYWNlLCBpbnQgZV9tCiAgICAgICAgICAgICAgICAg
ICAgICAgIGdvdG8gb3V0OwogICAgICAgIH0KIAorICAgICAgIHJldHVybiAwOworCiAgICAgICAg
LyoKICAgICAgICAgKiBOb3cgbGV0cyBkbyBhIHNlY29uZCBwYXNzIGxvb2tpbmcgZm9yIGVuYWJs
ZWQgc3lzY2FsbHMgd2l0aG91dAogICAgICAgICAqIGFuIGF1Z21lbnRlciB0aGF0IGhhdmUgYSBz
aWduYXR1cmUgdGhhdCBpcyBhIHN1cGVyc2V0IG9mIGFub3RoZXIK4qyiIFthY21lQHRvb2xib3gg
cGVyZi10b29scy1uZXh0XSQgCgoKVGhlbiBhbGwgd29ya3MsIHdlIGRvbid0IHJldXNlIGFueSBC
UEYgcHJvZ3JhbSwgYnV0IHRoZW4gdGhhdCBpcyBhbgpoZXVyaXN0aWMgYW55d2F5LCB0aGF0IGlz
IHRyaWVkIGJlY3Vhc2UgbGFuZGxvY2tfYWRkX3J1bGUgaGFzIGEgcG9pbnRlcgphcmd1bWVudDoK
CnJvb3RAbnVtYmVyOn4jIHBlcmYgdHJhY2UgLWUgbGFuZGxvY2tfYWRkX3J1bGUgcGVyZiB0ZXN0
IC13IGxhbmRsb2NrCiAgICAgMC4wMDAgKCAwLjAwMyBtcyk6IHBlcmYvNzEwMzQgbGFuZGxvY2tf
YWRkX3J1bGUocnVsZXNldF9mZDogMTEsIHJ1bGVfdHlwZTogTEFORExPQ0tfUlVMRV9QQVRIX0JF
TkVBVEgsIHJ1bGVfYXR0cjogMHg3ZmZmNmYyYmI1NTAsIGZsYWdzOiA0NSkgPSAtMSBFSU5WQUwg
KEludmFsaWQgYXJndW1lbnQpCiAgICAgMC4wMDQgKCAwLjAwMSBtcyk6IHBlcmYvNzEwMzQgbGFu
ZGxvY2tfYWRkX3J1bGUocnVsZXNldF9mZDogMTEsIHJ1bGVfdHlwZTogTEFORExPQ0tfUlVMRV9O
RVRfUE9SVCwgcnVsZV9hdHRyOiAweDdmZmY2ZjJiYjU0MCwgZmxhZ3M6IDQ1KSA9IC0xIEVJTlZB
TCAoSW52YWxpZCBhcmd1bWVudCkKcm9vdEBudW1iZXI6fiMgcGVyZiB0ZXN0IGVudW0KMTA1OiBw
ZXJmIHRyYWNlIGVudW0gYXVnbWVudGF0aW9uIHRlc3RzICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgOiBPawpyb290QG51bWJlcjp+IwoKU28gaXRzIHNvbWUgc29ydCBvZiBzeW5jcm9uaXph
dGlvbiBvbiB0aGUgdmFyaW91cyBuZXcgdGFibGVzLCBzb3J0ZWQgYnkKbmFtZSwgZXRjIHRoYXQg
dGhlbiB3aGVuIGl0ZXJhdGluZyBvdmVyIHRoZSBzeXNjYWxscyBlbmRzIHVwIHVzaW5nIGEgc2MK
dGhhdCBpcyBub3QgaW5pdGlhbGl6ZWQuCgotIEFybmFsZG8KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
