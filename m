Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D75C3DA41
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 03:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/cJDZRtlzlQScvFLCvCn/LrPGIn+1Uaqls46wGDS1j8=; b=S+CHVuyVioQxz5
	eNf9r+MMq2/ZZEpQc1AMrT6khOY+ISawJANOOUXuu2bQwjeYICh+joB0EvyrL3KAlFFP7nUE1cbmW
	S9PyHKWwr/C4tPKLbTptejJeH+fjDW8aD09NKgpjcXF0LDhb/Tn5MgjVElTMDatqLa7Ntqj2sRPOd
	xgYlGk1nllIg4tPCO9zMBLNGKM+uNIp+nwOVi6PPrzgTD/z2HNsfmxlMdVSuHWxHaErZ8dhS/GyN2
	hVw6JswKbXs1Moo9HezK7qznoJmK2s7No7kQ0TiVTtoWw6qZXHO4H2cWIBFleu/L3Ns262nDDZe5U
	XLVZaSoM1opvqSFL9bqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQezy-00000002fI5-236M;
	Mon, 08 Jul 2024 03:25:06 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQezu-00000002fGD-4Bf2
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 03:25:05 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WHTs85hb7zxVB2;
	Mon,  8 Jul 2024 11:20:28 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 6ECFF1800C7;
	Mon,  8 Jul 2024 11:24:46 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi100008.china.huawei.com
 (7.221.188.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 8 Jul
 2024 11:24:45 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <bjorn@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <peterz@infradead.org>, <mingo@redhat.com>,
	<acme@kernel.org>, <namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <kan.liang@linux.intel.com>,
	<dev.mbstr@gmail.com>, <samuel.holland@sifive.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3 1/2] riscv: Fix fp alignment bug in perf_callchain_user()
Date: Mon, 8 Jul 2024 11:28:46 +0800
Message-ID: <20240708032847.2998158-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240708032847.2998158-1-ruanjinjie@huawei.com>
References: <20240708032847.2998158-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi100008.china.huawei.com (7.221.188.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_202503_232215_F80FB143 
X-CRM114-Status: UNSURE (   8.99  )
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

VGhlIHN0YW5kYXJkIFJJU0MtViBjYWxsaW5nIGNvbnZlbnRpb24gc2FpZDoKCSJUaGUgc3RhY2sg
Z3Jvd3MgZG93bndhcmQgYW5kIHRoZSBzdGFjayBwb2ludGVyIGlzIGFsd2F5cwoJa2VwdCAxNi1i
eXRlIGFsaWduZWQiLgoKU28gcGVyZl9jYWxsY2hhaW5fdXNlcigpIHNob3VsZCBjaGVjayB3aGV0
aGVyIDE2LWJ5dGUgYWxpZ25lZCBmb3IgZnAuCgpMaW5rOiBodHRwczovL3Jpc2N2Lm9yZy93cC1j
b250ZW50L3VwbG9hZHMvMjAxNS8wMS9yaXNjdi1jYWxsaW5nLnBkZgoKRml4ZXM6IGRiZWI5MGIw
YzFlYiAoInJpc2N2OiBBZGQgcGVyZiBjYWxsY2hhaW4gc3VwcG9ydCIpClNpZ25lZC1vZmYtYnk6
IEppbmppZSBSdWFuIDxydWFuamluamllQGh1YXdlaS5jb20+CkNjOiBCasO2cm4gVMO2cGVsIDxi
am9ybkBrZXJuZWwub3JnPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3BlcmZfY2FsbGNoYWluLmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wZXJmX2NhbGxjaGFpbi5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvcGVyZl9jYWxsY2hhaW4uYwppbmRleCAzMzQ4YTYxZGU3ZDkuLjI5MzI3OTFlOTM4
OCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcGVyZl9jYWxsY2hhaW4uYworKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9wZXJmX2NhbGxjaGFpbi5jCkBAIC02Miw3ICs2Miw3IEBAIHZvaWQg
cGVyZl9jYWxsY2hhaW5fdXNlcihzdHJ1Y3QgcGVyZl9jYWxsY2hhaW5fZW50cnlfY3R4ICplbnRy
eSwKIAlwZXJmX2NhbGxjaGFpbl9zdG9yZShlbnRyeSwgcmVncy0+ZXBjKTsKIAogCWZwID0gdXNl
cl9iYWNrdHJhY2UoZW50cnksIGZwLCByZWdzLT5yYSk7Ci0Jd2hpbGUgKGZwICYmICEoZnAgJiAw
eDMpICYmIGVudHJ5LT5uciA8IGVudHJ5LT5tYXhfc3RhY2spCisJd2hpbGUgKGZwICYmICEoZnAg
JiAweDcpICYmIGVudHJ5LT5uciA8IGVudHJ5LT5tYXhfc3RhY2spCiAJCWZwID0gdXNlcl9iYWNr
dHJhY2UoZW50cnksIGZwLCAwKTsKIH0KIAotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
