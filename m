Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A3ECD8CA8
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 06:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKCfyPRHCAP113hJkGk15z0oLKEqdobr1pK0RcVLM+0=; b=TRq0epEth2oBEz
	cNjIozvueeXfGGmHZwnjI+VwJUmMWLbVHLTjuz1dVh9sxZawEQPbzfG7rrtKjWyuefyAIcYsa5u03
	iuKbTCxZ/q+kM7jgR3i1ULDW+Y5FbiMVrvwGpfzteN86ARSVHYKxd8HZ8JXM0QmSIGhgCWknMWC5J
	NJtQlxBqL+CK22KF07d1oosG/zAYCkFq70MPqOQduDh6CXNYxzZ/nLLGt23ZPU0Spl1zKGSUfGSA/
	Qo8nQnGIbuZ3C/BLRQ+gOtW126LHPAdjVEWGWhcQh8ootH0+pajAePI2+dzF9fsiolQm/4VuOWQ+5
	PPfDIXpkOhBiemgqDEjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpWq-00000004mJF-3CD3;
	Tue, 09 Jun 2026 06:01:36 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpWn-00000004mHX-1hGf
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 06:01:34 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780984890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gg1b4NvG9irnTlONKFumTIckFqfflTt6uFIpf+8fltI=;
	b=NsosH7lbdAl7llskJQxfh1OWH6ncadC5/IE7tZbtlVGfpjv934jV9d3zmZMBdc6S5g2Fk8
	0N5/gFzI9ACuZ3tKwejhs4QeDUNnDi42zgShxf5Gt4C7AN+EswLRMspCWU1C5UTHVdbEmM
	VjERLNCyvxoLOCfb3RPeFRIUsStL4RA=
From: Atish Patra <atish.patra@linux.dev>
Date: Mon, 08 Jun 2026 23:01:15 -0700
Subject: [PATCH v6 01/21] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
MIME-Version: 1.0
Message-Id: <20260608-counter_delegation-v6-1-285b72ed65a9@meta.com>
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
X-CRM114-CacheID: sfid-20260608_230133_628971_4DFC3B1B 
X-CRM114-Status: UNSURE (   7.43  )
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

RnJvbTogS2Fpd2VuIFh1ZSA8a2Fpd2VueEByaXZvc2luYy5jb20+CgpUaGlzIGFkZHMgZGVmaW5p
dGlvbnMgb2YgbmV3IENTUnMgYW5kIGJpdHMgZGVmaW5lZCBpbiBTeGNzcmluZCBJU0EKZXh0ZW5z
aW9uLiBUaGVzZSBDU1IgZW5hYmxlcyBpbmRpcmVjdCBhY2Nlc3NlcyBtZWNoYW5pc20gdG8gYWNj
ZXNzCmFueSBDU1JzIGluIE0tLCBTLSwgYW5kIFZTLW1vZGUuIFRoZSByYW5nZSBvZiB0aGUgc2Vs
ZWN0IHZhbHVlcwphbmQgaXJlZyB3aWxsIGJlIGRlZmluZSBieSB0aGUgSVNBIGV4dGVuc2lvbiB1
c2luZyBTeGNzcmluZCBleHRlbnNpb24uCgpTaWduZWQtb2ZmLWJ5OiBLYWl3ZW4gWHVlIDxrYWl3
ZW54QHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5j
b20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCB8IDMwICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9jc3IuaAppbmRleCAzMWI4OTg4ZjQ0ODguLmI0NTUxYTZjZjdjYiAxMDA2NDQKLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2Nzci5oCkBAIC0zNDcsNiArMzQ3LDEyIEBACiAvKiBTdXBlcnZpc29yLUxldmVsIFdpbmRvdyB0
byBJbmRpcmVjdGx5IEFjY2Vzc2VkIFJlZ2lzdGVycyAoQUlBKSAqLwogI2RlZmluZSBDU1JfU0lT
RUxFQ1QJCTB4MTUwCiAjZGVmaW5lIENTUl9TSVJFRwkJMHgxNTEKKy8qIFN1cGVydmlzb3ItTGV2
ZWwgV2luZG93IHRvIEluZGlyZWN0bHkgQWNjZXNzZWQgUmVnaXN0ZXJzIChTeGNzcmluZCkgKi8K
KyNkZWZpbmUgQ1NSX1NJUkVHMgkJMHgxNTIKKyNkZWZpbmUgQ1NSX1NJUkVHMwkJMHgxNTMKKyNk
ZWZpbmUgQ1NSX1NJUkVHNAkJMHgxNTUKKyNkZWZpbmUgQ1NSX1NJUkVHNQkJMHgxNTYKKyNkZWZp
bmUgQ1NSX1NJUkVHNgkJMHgxNTcKIAogLyogU3VwZXJ2aXNvci1MZXZlbCBJbnRlcnJ1cHRzIChB
SUEpICovCiAjZGVmaW5lIENTUl9TVE9QRUkJCTB4MTVjCkBAIC0zOTQsNiArNDAwLDE0IEBACiAv
KiBWUy1MZXZlbCBXaW5kb3cgdG8gSW5kaXJlY3RseSBBY2Nlc3NlZCBSZWdpc3RlcnMgKEgtZXh0
ZW5zaW9uIHdpdGggQUlBKSAqLwogI2RlZmluZSBDU1JfVlNJU0VMRUNUCQkweDI1MAogI2RlZmlu
ZSBDU1JfVlNJUkVHCQkweDI1MQorLyoKKyAqIFZTLUxldmVsIFdpbmRvdyB0byBJbmRpcmVjdGx5
IEFjY2Vzc2VkIFJlZ2lzdGVycyAoSC1leHRlbnNpb24gd2l0aCBTeGNzcmluZCkKKyAqLworI2Rl
ZmluZSBDU1JfVlNJUkVHMgkJMHgyNTIKKyNkZWZpbmUgQ1NSX1ZTSVJFRzMJCTB4MjUzCisjZGVm
aW5lIENTUl9WU0lSRUc0CQkweDI1NQorI2RlZmluZSBDU1JfVlNJUkVHNQkJMHgyNTYKKyNkZWZp
bmUgQ1NSX1ZTSVJFRzYJCTB4MjU3CiAKIC8qIFZTLUxldmVsIEludGVycnVwdHMgKEgtZXh0ZW5z
aW9uIHdpdGggQUlBKSAqLwogI2RlZmluZSBDU1JfVlNUT1BFSQkJMHgyNWMKQEAgLTQzNiw2ICs0
NTAsMTIgQEAKIC8qIE1hY2hpbmUtTGV2ZWwgV2luZG93IHRvIEluZGlyZWN0bHkgQWNjZXNzZWQg
UmVnaXN0ZXJzIChBSUEpICovCiAjZGVmaW5lIENTUl9NSVNFTEVDVAkJMHgzNTAKICNkZWZpbmUg
Q1NSX01JUkVHCQkweDM1MQorLyogTWFjaGluZS1MZXZlbCBXaW5kb3cgdG8gSW5kaXJlY3RseSBB
Y2Nlc3NlZCBSZWdpc3RlcnMgKFN4Y3NyaW5kKSAqLworI2RlZmluZSBDU1JfTUlSRUcyCQkweDM1
MgorI2RlZmluZSBDU1JfTUlSRUczCQkweDM1MworI2RlZmluZSBDU1JfTUlSRUc0CQkweDM1NQor
I2RlZmluZSBDU1JfTUlSRUc1CQkweDM1NgorI2RlZmluZSBDU1JfTUlSRUc2CQkweDM1NwogCiAv
KiBNYWNoaW5lLUxldmVsIEludGVycnVwdHMgKEFJQSkgKi8KICNkZWZpbmUgQ1NSX01UT1BFSQkJ
MHgzNWMKQEAgLTQ5OCw2ICs1MTgsMTEgQEAKICMgZGVmaW5lIENTUl9JRUgJCUNTUl9NSUVICiAj
IGRlZmluZSBDU1JfSVNFTEVDVAlDU1JfTUlTRUxFQ1QKICMgZGVmaW5lIENTUl9JUkVHCUNTUl9N
SVJFRworIyBkZWZpbmUgQ1NSX0lSRUcyCUNTUl9NSVJFRzIKKyMgZGVmaW5lIENTUl9JUkVHMwlD
U1JfTUlSRUczCisjIGRlZmluZSBDU1JfSVJFRzQJQ1NSX01JUkVHNAorIyBkZWZpbmUgQ1NSX0lS
RUc1CUNTUl9NSVJFRzUKKyMgZGVmaW5lIENTUl9JUkVHNglDU1JfTUlSRUc2CiAjIGRlZmluZSBD
U1JfSVBICQlDU1JfTUlQSAogIyBkZWZpbmUgQ1NSX1RPUEVJCUNTUl9NVE9QRUkKICMgZGVmaW5l
IENTUl9UT1BJCUNTUl9NVE9QSQpAQCAtNTIzLDYgKzU0OCwxMSBAQAogIyBkZWZpbmUgQ1NSX0lF
SAkJQ1NSX1NJRUgKICMgZGVmaW5lIENTUl9JU0VMRUNUCUNTUl9TSVNFTEVDVAogIyBkZWZpbmUg
Q1NSX0lSRUcJQ1NSX1NJUkVHCisjIGRlZmluZSBDU1JfSVJFRzIJQ1NSX1NJUkVHMgorIyBkZWZp
bmUgQ1NSX0lSRUczCUNTUl9TSVJFRzMKKyMgZGVmaW5lIENTUl9JUkVHNAlDU1JfU0lSRUc0Cisj
IGRlZmluZSBDU1JfSVJFRzUJQ1NSX1NJUkVHNQorIyBkZWZpbmUgQ1NSX0lSRUc2CUNTUl9TSVJF
RzYKICMgZGVmaW5lIENTUl9JUEgJCUNTUl9TSVBICiAjIGRlZmluZSBDU1JfVE9QRUkJQ1NSX1NU
T1BFSQogIyBkZWZpbmUgQ1NSX1RPUEkJQ1NSX1NUT1BJCgotLSAKMi41My4wLU1ldGEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
