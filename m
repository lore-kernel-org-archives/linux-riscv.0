Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A321CDB475
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 08:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+h/p6wcET8Xkjff323dZJ8KjYymHVYU9gbfApPWX9I4=; b=OrjNsabvUwPOsg
	xUqw5BNrmc+7LmnLX7COGp11cHtToLpV4nktchuadP5R1+rK35dXrB6lsSZCn5t58GxNk6ZtQw35z
	coxXZetCQRRGZpiogJoznWvdiKucJVAlro3vcvHvJfv0nZ7vaplMnttB62H1OI1lt5gubMuEl5HXy
	Hok/M2STp7Wd6XQtLyTRb4wdF1Vn9jsbwfudwlaZKCLnl093W1KeahAyUUIzS5VozhRGNrMDvdQix
	Yo8T4qs3JOgEBZAtwLGwQQR6owvDRP9dFH8tE8rereU+ZXGhUZZcwLLV7veRtTOQAHNiUliKUdtB4
	Hu8LfQ/6Nim1F5U8etTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZf4-00000004brh-43C7;
	Mon, 22 Jun 2026 08:05:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZf3-00000004bqJ-2qQf
	for linux-riscv@bombadil.infradead.org;
	Mon, 22 Jun 2026 08:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=VQXL+H2+WehLdwmI2owi3GLpWwMtdQ4h0ysYeLBCJ7Q=; b=Hhjd27ub235j5nNisECX/pjsE+
	vyHlZGoRCnjCzkv5qUPIDwuwDcwl+QG5a0yTFXJ5Ih25Q3l8nuapyFZytJpdRXqC7dKevfwqCc8lY
	k4YXvAOUWGRPnGnl5vqtYdOc/MFRh6IANbxHcivW0O5aOsUz59NFdCpgdLAeOguSyMlzYL/WyshN0
	5F2B2heT7c3ODL5LfJSGfrKtg/uCr8PxslIVcBS223AxmZAuCKW/6sOQk0FnHh986+evG94tePvE8
	MbTaF5mNGsKvn7CQC6nK6oZuGzcTVbqORkwf+fnF5e6mBxEJiJbalLQQsZp38dsUDWjlsjH4yLBQY
	HNdYSABw==;
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZez-00000003rKG-3PgV
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 08:05:40 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782115533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQXL+H2+WehLdwmI2owi3GLpWwMtdQ4h0ysYeLBCJ7Q=;
	b=Dn+Loc3DTv57R6tdh3zjIz9KHtrTL3P40Lnn8HoOtNhC5m9V2WqxsIsHeRIW55xF6g7oJb
	rzNhflLkumzGwkt+cUVo84lQG5SkWNMb1wHqxUOI2A28dnSMyKohAgNmcyXXeU2rji62vh
	TOZY1HJs/fHPDc8zFYOJKZqY92CkYd8=
From: Atish Patra <atish.patra@linux.dev>
Date: Mon, 22 Jun 2026 01:04:20 -0700
Subject: [PATCH v7 08/22] RISC-V: Add Sscfg extension CSR definition
MIME-Version: 1.0
Message-Id: <20260622-counter_delegation-v7-8-0ba2fd34614e@meta.com>
References: <20260622-counter_delegation-v7-0-0ba2fd34614e@meta.com>
In-Reply-To: <20260622-counter_delegation-v7-0-0ba2fd34614e@meta.com>
To: Jiri Olsa <jolsa@kernel.org>, James Clark <james.clark@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Rob Herring <robh@kernel.org>, 
 Ian Rogers <irogers@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, Namhyung Kim <namhyung@kernel.org>
Cc: devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_090538_327197_808FE960 
X-CRM114-Status: UNSURE (   6.60  )
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
