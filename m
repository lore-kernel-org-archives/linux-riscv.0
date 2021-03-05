Return-Path: <SRS0=jthF=ID=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A1EC433E6
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Mar 2021 11:03:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACEDE64FD6
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Mar 2021 11:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACEDE64FD6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w1/dDnWG2FgV88+ZIryS87uB3ErA+i2J4fHPjDK8TGI=; b=aLBJS1f/xCe70W2rd8xKU1Yl3
	w2SgfMdsVRepb+Ej33hzVjJWsquoW0jgdhIYZDilMo66JL+pdS2mJjJh4F34R28LbTo8MfQgj7Ab5
	7h+q2+WfuhwZtmXA0mwV8wT32g4DMhzMeIiFi2ApDZLMMbbOrxi/PGmBvhQzij/Fxx6qudbhxZwO2
	7IbUiNhmo04Iq/JvWoys3XCkQc+3gZwTAl0AvbPLAtDk/neQVrp+LVBu7A88ZIidsMQj3jAWiABBU
	Byh/NbgmcOmGWSSGtkA7QHPQgDNA8YvJsiUYX3MFav0LK7LPnt43eE5udkWP7bv2gmmS9PswVCWP3
	DUzlx2lyw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI8Ej-00EfuI-9K; Fri, 05 Mar 2021 11:03:13 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI8EY-00EfoI-PG
 for linux-riscv@lists.infradead.org; Fri, 05 Mar 2021 11:03:06 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DsPtX3YVwzjVjV;
 Fri,  5 Mar 2021 19:01:24 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Fri, 5 Mar 2021
 19:02:42 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
Subject: [PATCH 2/9] riscv: irq: Fix no prototype warning
Date: Fri, 5 Mar 2021 19:33:25 +0800
Message-ID: <20210305113332.428048-3-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210305113332.428048-1-sunnanyong@huawei.com>
References: <20210305113332.428048-1-sunnanyong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_110303_694241_4BA47681 
X-CRM114-Status: UNSURE (   6.18  )
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

Rml4IHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBjb21waWxhdGlvbiB3YXJuaW5nOgphcmNoL3Jp
c2N2L2tlcm5lbC9pcnEuYzoxOToxMzogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZv
ciDigJhpbml0X0lSUeKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiAgIDE5IHwgdm9pZCBfX2lu
aXQgaW5pdF9JUlEodm9pZCkKICAgICAgfCAgICAgICAgICAgICBefn5+fn5+fgoKUmVwb3J0ZWQt
Ynk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBOYW55b25n
IFN1biA8c3VubmFueW9uZ0BodWF3ZWkuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
aXJxLmggfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pcnEuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
aXJxLmgKaW5kZXggOTgwN2FkMTY0MDE1Li5lNGM0MzU1MDk5ODMgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vaXJxLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pcnEu
aApAQCAtMTIsNCArMTIsNiBAQAogCiAjaW5jbHVkZSA8YXNtLWdlbmVyaWMvaXJxLmg+CiAKK2V4
dGVybiB2b2lkIF9faW5pdCBpbml0X0lSUSh2b2lkKTsKKwogI2VuZGlmIC8qIF9BU01fUklTQ1Zf
SVJRX0ggKi8KLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
