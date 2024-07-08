Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5B4C3271E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 03:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DQoeS35zdvoGc9ul3nIK6SeWswcba823wcKaCE3WNDA=; b=vwi8quheNuMRYd
	m18rvUchTHXs/uDW0fHm7k7AgeWqE/pbjhK8xbO0DSGU5oO/O9nwzTn4voGtOLE9iem9aa+yaB8eS
	OFHpJUB/r5d1MZLq3CjxSVVbQiqCpCrwSJFCzsXqlcbFlg/w1WrRYAiocxH5HeSiUx2dKEGHMGHso
	RQ0dOV4e7Vo9xYr1C4UbrDceOfLr7c52w1jOYsFgzVcRGMVr/B8VZ0KMDw0J5nObTsWg2Vsre+gXJ
	K3dyZyfpEjYJZPv0a3Zy1mFsjPgzo5nuY7/LTR7Aw3+wECKMj0He2oMUslKYB9lMPdx8VSPtZ3le0
	QBVCzsk2ZvU0He86rrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQezs-00000002fF5-1fJU;
	Mon, 08 Jul 2024 03:25:00 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQezo-00000002fDZ-1aPt
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 03:24:58 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WHTrr1MVJzxQ7S;
	Mon,  8 Jul 2024 11:20:12 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id CCFB114037E;
	Mon,  8 Jul 2024 11:24:44 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi100008.china.huawei.com
 (7.221.188.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 8 Jul
 2024 11:24:44 +0800
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
Subject: [PATCH v3 0/2] riscv: stacktrace: Add USER_STACKTRACE support
Date: Mon, 8 Jul 2024 11:28:45 +0800
Message-ID: <20240708032847.2998158-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi100008.china.huawei.com (7.221.188.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_202456_626116_AEF3CDA2 
X-CRM114-Status: UNSURE (   6.55  )
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

QWRkIFJJU0MtViBVU0VSX1NUQUNLVFJBQ0Ugc3VwcG9ydCwgYW5kIGZpeCB0aGUgZnAgYWxpZ25t
ZW50IGJ1ZwppbiBwZXJmX2NhbGxjaGFpbl91c2VyKCkgYnkgdGhlIHdheSBhcyBCasO2cm4gcG9p
bnRlZCBvdXQuCgpDaGFuZ2VzIGluIHYzOgotIEZpeCB0aGUgZnAgYWxpZ25tZW50IGJ1ZyBpbiBw
ZXJmX2NhbGxjaGFpbl91c2VyKCkuCi0gUmVtb3ZlIHRoZSBMVFAgbWVzc2FnZSBhcyBCasO2cm4g
c3VnZ2VzdGVkLgotIEFkZCB0aGUgdXNlcnN0YWNrIHRyYWNlIHRlc3QgaW5mby4KCkppbmppZSBS
dWFuICgyKToKICByaXNjdjogRml4IGZwIGFsaWdubWVudCBidWcgaW4gcGVyZl9jYWxsY2hhaW5f
dXNlcigpCiAgcmlzY3Y6IHN0YWNrdHJhY2U6IEFkZCBVU0VSX1NUQUNLVFJBQ0Ugc3VwcG9ydAoK
IGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgfCAgMSArCiBhcmNoL3Jpc2N2L2tl
cm5lbC9wZXJmX2NhbGxjaGFpbi5jIHwgNDYgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiBhcmNoL3Jpc2N2L2tlcm5lbC9zdGFja3RyYWNlLmMgICAgIHwgNDMgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCA0MyBkZWxl
dGlvbnMoLSkKCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
