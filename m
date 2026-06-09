Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3ABCD8CAE
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 06:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+h/p6wcET8Xkjff323dZJ8KjYymHVYU9gbfApPWX9I4=; b=y9W7uRjLLwNUxf
	uTsjdi62Q0D8nEflHYbY+zGde03avdLVXwdDaHA2F3yzp6KYL+qK6q0j6Mjwg44yHpob4BjVo+YPW
	oJ7OMXBdGpltHnSTrNJJ44lcVw/DeuV5lhiinBHAXK1t+g4YT1r5b/wKSNHsNkNvsqn0S7WppFAxx
	ZqMT5EUySxVZmBzTWUjG8LWm/Fi7qapL9RFuynylKj35j3uvHTZZPXK5V/kiCH5Sr49VI3Uvt8vGt
	hqPpqjzTQQJuwt0MKL9RTBGlQ1BhvoFM67ezGTfnmaSOxkaXYP9qwtmoSPJKN/eT3j+CgXWZFAOxV
	1TJ0SgeLlVP1h1MXTe9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpXY-00000004mzB-0Ius;
	Tue, 09 Jun 2026 06:02:20 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpXV-00000004mu1-0zGA
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 06:02:18 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780984934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQXL+H2+WehLdwmI2owi3GLpWwMtdQ4h0ysYeLBCJ7Q=;
	b=dFw0aLQcYAf00tYQgPc0vZjfN3tICce2mjvDxDboqJyEtkKsieeJKyGSYVrpm/Q64lA6k+
	CuZJsmufEUpmQZsRL0zVHHtIxUzwJqK+6m0nMHkq5rCCYGZvJWqQquSO05AMIn9W/R2BxQ
	oBESg9DTLX4BwguGVy90rz0n5J6BLPE=
From: Atish Patra <atish.patra@linux.dev>
Date: Mon, 08 Jun 2026 23:01:21 -0700
Subject: [PATCH v6 07/21] RISC-V: Add Sscfg extension CSR definition
MIME-Version: 1.0
Message-Id: <20260608-counter_delegation-v6-7-285b72ed65a9@meta.com>
References: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
In-Reply-To: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
To: James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ian Rogers <irogers@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_230217_430105_6D3F3105 
X-CRM114-Status: UNSURE (   7.44  )
X-CRM114-Notice: Please train this message.
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

RnJvbTogS2Fpd2VuIFh1ZSA8a2Fpd2VueEByaXZvc2luYy5jb20+CgpUaGlzIGFkZHMgdGhlIHNj
b3VudGluaGliaXQgQ1NSIGRlZmluaXRpb24gYW5kIFMtbW9kZSBhY2Nlc3NpYmxlIGhwbWV2ZW50
CmJpdHMgZGVmaW5lZCBieSBzbWNkZWxlZy9zc2NjZmcuIHNjb3VudGluaGliaXQgYWxsb3dzIFMt
bW9kZSB0byBzdGFydC9zdG9wCmNvdW50ZXJzIGRpcmVjdGx5IGZyb20gUy1tb2RlIHdpdGhvdXQg
aW52b2tpbmcgU0JJIGNhbGxzIHRvIE0tbW9kZS4gSXQgaXMKYWxzbyB1c2VkIHRvIGZpZ3VyZSBv
dXQgdGhlIGNvdW50ZXJzIGRlbGVnYXRlZCB0byBTLW1vZGUgYnkgdGhlIE0tbW9kZSBhcwp3ZWxs
LgoKU2lnbmVkLW9mZi1ieTogS2Fpd2VuIFh1ZSA8a2Fpd2VueEByaXZvc2luYy5jb20+ClJldmll
d2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9jc3IuaCB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vY3NyLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCmluZGV4IGI0
NTUxYTZjZjdjYi4uMjZjYjc4ZGVlMmZkIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2Nzci5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKQEAgLTI0MSw2ICsy
NDEsMzEgQEAKICNkZWZpbmUgU01TVEFURUVOMF9IU0VOVkNGRwkJKF9VTEwoMSkgPDwgU01TVEFU
RUVOMF9IU0VOVkNGR19TSElGVCkKICNkZWZpbmUgU01TVEFURUVOMF9TU1RBVEVFTjBfU0hJRlQJ
NjMKICNkZWZpbmUgU01TVEFURUVOMF9TU1RBVEVFTjAJCShfVUxMKDEpIDw8IFNNU1RBVEVFTjBf
U1NUQVRFRU4wX1NISUZUKQorLyogSFBNRVZFTlQgYml0cy4gVGhlc2UgYXJlIGFjY2Vzc2libGUg
aW4gUy1tb2RlIHZpYSBTbWNkZWxlZy9Tc2NjZmcgKi8KKyNpZmRlZiBDT05GSUdfNjRCSVQKKyNk
ZWZpbmUgSFBNRVZFTlRfT0YJCQkoQklUX1VMTCg2MykpCisjZGVmaW5lIEhQTUVWRU5UX01JTkgJ
CQkoQklUX1VMTCg2MikpCisjZGVmaW5lIEhQTUVWRU5UX1NJTkgJCQkoQklUX1VMTCg2MSkpCisj
ZGVmaW5lIEhQTUVWRU5UX1VJTkgJCQkoQklUX1VMTCg2MCkpCisjZGVmaW5lIEhQTUVWRU5UX1ZT
SU5ICQkJKEJJVF9VTEwoNTkpKQorI2RlZmluZSBIUE1FVkVOVF9WVUlOSAkJCShCSVRfVUxMKDU4
KSkKKyNlbHNlCisjZGVmaW5lIEhQTUVWRU5USF9PRgkJCShCSVRfVUxMKDMxKSkKKyNkZWZpbmUg
SFBNRVZFTlRIX01JTkgJCQkoQklUX1VMTCgzMCkpCisjZGVmaW5lIEhQTUVWRU5USF9TSU5ICQkJ
KEJJVF9VTEwoMjkpKQorI2RlZmluZSBIUE1FVkVOVEhfVUlOSAkJCShCSVRfVUxMKDI4KSkKKyNk
ZWZpbmUgSFBNRVZFTlRIX1ZTSU5ICQkJKEJJVF9VTEwoMjcpKQorI2RlZmluZSBIUE1FVkVOVEhf
VlVJTkgJCQkoQklUX1VMTCgyNikpCisKKyNkZWZpbmUgSFBNRVZFTlRfT0YJCQkoSFBNRVZFTlRI
X09GIDw8IDMyKQorI2RlZmluZSBIUE1FVkVOVF9NSU5ICQkJKEhQTUVWRU5USF9NSU5IIDw8IDMy
KQorI2RlZmluZSBIUE1FVkVOVF9TSU5ICQkJKEhQTUVWRU5USF9TSU5IIDw8IDMyKQorI2RlZmlu
ZSBIUE1FVkVOVF9VSU5ICQkJKEhQTUVWRU5USF9VSU5IIDw8IDMyKQorI2RlZmluZSBIUE1FVkVO
VF9WU0lOSAkJCShIUE1FVkVOVEhfVlNJTkggPDwgMzIpCisjZGVmaW5lIEhQTUVWRU5UX1ZVSU5I
CQkJKEhQTUVWRU5USF9WVUlOSCA8PCAzMikKKyNlbmRpZgorCisjZGVmaW5lIFNJU0VMRUNUX1NT
Q0NGR19CQVNFCQkweDQwCiAKIC8qIG1zZWNjZmcgYml0cyAqLwogI2RlZmluZSBNU0VDQ0ZHX1BN
TQkJCUVOVkNGR19QTU0KQEAgLTMyMiw2ICszNDcsNyBAQAogI2RlZmluZSBDU1JfU0NPVU5URVJF
TgkJMHgxMDYKICNkZWZpbmUgQ1NSX1NFTlZDRkcJCTB4MTBhCiAjZGVmaW5lIENTUl9TU1RBVEVF
TjAJCTB4MTBjCisjZGVmaW5lIENTUl9TQ09VTlRJTkhJQklUCTB4MTIwCiAjZGVmaW5lIENTUl9T
U0NSQVRDSAkJMHgxNDAKICNkZWZpbmUgQ1NSX1NFUEMJCTB4MTQxCiAjZGVmaW5lIENTUl9TQ0FV
U0UJCTB4MTQyCgotLSAKMi41My4wLU1ldGEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
