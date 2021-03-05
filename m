Return-Path: <SRS0=jthF=ID=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E3EC4332D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Mar 2021 11:04:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6320765017
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Mar 2021 11:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6320765017
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7TdhpXrycEuU0ZvIizpWfSMZn/Or66sE1fTH7o3OdTU=; b=AgWcgj04QsEI88J7xmZJNKoNi
	342xKZmNUQ1Q2Vbj697eysFsSnYcCZeKsXToj+aJC6YUyhrRVBp93We/JvvRdHeySkldm3xK5NXpg
	gEPl4S6yVud62eGoajwfCo40KYxK/+1lQcHq5lWDVsRhIOt0IVjv5jUMKgh9zKTAucRzZKFe9VcSs
	aLe7v3/vNP8GXVmojME3T5DxLh5wA4UN+gWeBvV9XCWocQTo50JwnvPLeTHsSM+stF71REhLTU/Z8
	I1pa+QP6k30TZCnTKzzxbyneiZH3h9cZ66KGuUtNwKP5xonQaAK7DNZY45P8/ubQmCc9KhStVr4qa
	P3Cuimc2w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI8Fc-00EgBA-HE; Fri, 05 Mar 2021 11:04:09 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI8Ej-00EfpC-Gc
 for linux-riscv@lists.infradead.org; Fri, 05 Mar 2021 11:03:15 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DsPsl07MxzMjRg;
 Fri,  5 Mar 2021 19:00:43 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Fri, 5 Mar 2021
 19:02:45 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
Subject: [PATCH 7/9] riscv: process: Fix no prototype for show_regs
Date: Fri, 5 Mar 2021 19:33:30 +0800
Message-ID: <20210305113332.428048-8-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210305113332.428048-1-sunnanyong@huawei.com>
References: <20210305113332.428048-1-sunnanyong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_110314_417983_1CB0DBAD 
X-CRM114-Status: UNSURE (   5.79  )
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

SW5jbHVkZSBoZWFkZXIgZmlsZSB0byBmaXggdGhlIGZvbGxvd2luZyBXPTEgY29tcGlsYXRpb24g
d2FybmluZzoKYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jOjc4OjY6IHdhcm5pbmc6IG5vIHBy
ZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYc2hvd19yZWdz4oCZIFstV21pc3NpbmctcHJvdG90eXBl
c10KICAgNzggfCB2b2lkIHNob3dfcmVncyhzdHJ1Y3QgcHRfcmVncyAqcmVncykKICAgICAgfCAg
ICAgIF5+fn5+fn5+fgoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29t
PgpTaWduZWQtb2ZmLWJ5OiBOYW55b25nIFN1biA8c3VubmFueW9uZ0BodWF3ZWkuY29tPgotLS0K
IGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCmluZGV4IDZmNzI4ZTczMWJlZC4uZjljZDU3YzljNjdk
IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvcHJvY2Vzcy5jCkBAIC0xMCw2ICsxMCw3IEBACiAjaW5jbHVkZSA8bGludXgvY3B1
Lmg+CiAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+CiAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4K
KyNpbmNsdWRlIDxsaW51eC9zY2hlZC9kZWJ1Zy5oPgogI2luY2x1ZGUgPGxpbnV4L3NjaGVkL3Rh
c2tfc3RhY2suaD4KICNpbmNsdWRlIDxsaW51eC90aWNrLmg+CiAjaW5jbHVkZSA8bGludXgvcHRy
YWNlLmg+Ci0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
