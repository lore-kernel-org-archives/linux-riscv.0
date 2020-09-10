Return-Path: <SRS0=oUx1=CT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F9BC433E2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 03:50:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A422F2145D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 03:50:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aiYMCRBV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A422F2145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gHl5PiBK7G33U3Ns8QHjmf4jM+YA7r4xJvbeYkRyUcc=; b=aiYMCRBV3TlHbj5TFTUcvgWBC6
	PjFPbCz55nBFrbujYIJ5gsGq7jJwoWnkTylNDjR9EIjt+9yeJK9VkAxmtgifGWwyWi7C1Wqeb4KME
	yhDopB4zNQb+OLDb6V9LpYrKAug3xEu5mQKPDJf+96cgSS3/fqhwnFMww16a0R2pWNIklqIxuS+nV
	vu7Q3fQRgXXzDzL2oi0xcV/qTWxWxbxymGGEjsW+ZlSbDcvpg/092Go+hrm1wyre44/K30di3tZBB
	ZuS78wZCjCy0gv9CMSvpWf3ugSmnrjlj9Z+7pFoFtd+0mzOHegHxRT3xw8nrZ2c1LNsmcdNA8UvHJ
	gtxAI5MA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGDav-00088K-Pc; Thu, 10 Sep 2020 03:49:57 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGDas-00085N-M2
 for linux-riscv@lists.infradead.org; Thu, 10 Sep 2020 03:49:55 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id AF23A2F5424ABCF30D4C;
 Thu, 10 Sep 2020 11:49:47 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Thu, 10 Sep 2020
 11:49:40 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
 <penberg@kernel.org>
Subject: [PATCH -next] riscv/mm/fault: Fix old style declaration warning
Date: Thu, 10 Sep 2020 11:49:03 +0800
Message-ID: <20200910034903.10912-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_234954_977982_1EA55D09 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Rml4IGdjYyBidWlsZCB3YXJuaW5nOgoKYXJjaC9yaXNjdi9tbS9mYXVsdC5jOjgxOjE6IHdhcm5p
bmc6IOKAmGlubGluZeKAmSBpcyBub3QgYXQgYmVnaW5uaW5nIG9mIGRlY2xhcmF0aW9uIFstV29s
ZC1zdHlsZS1kZWNsYXJhdGlvbl0KIHN0YXRpYyB2b2lkIGlubGluZSB2bWFsbG9jX2ZhdWx0KHN0
cnVjdCBwdF9yZWdzICpyZWdzLCBpbnQgY29kZSwgdW5zaWduZWQgbG9uZyBhZGRyKQogXn5+fn5+
CgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYt
Ynk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L21t
L2ZhdWx0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMgYi9hcmNoL3Jpc2N2L21t
L2ZhdWx0LmMKaW5kZXggYTIzZWFmNWNlOTVjLi5hMTczNDMyY2NmODIgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3YvbW0vZmF1bHQuYworKysgYi9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKQEAgLTc4LDcg
Kzc4LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGJhZF9hcmVhKHN0cnVjdCBwdF9yZWdzICpyZWdz
LCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwgaW50IGNvZGUKIAlub19jb250ZXh0KHJlZ3MsIGFkZHIp
OwogfQogCi1zdGF0aWMgdm9pZCBpbmxpbmUgdm1hbGxvY19mYXVsdChzdHJ1Y3QgcHRfcmVncyAq
cmVncywgaW50IGNvZGUsIHVuc2lnbmVkIGxvbmcgYWRkcikKK3N0YXRpYyBpbmxpbmUgdm9pZCB2
bWFsbG9jX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzLCBpbnQgY29kZSwgdW5zaWduZWQgbG9u
ZyBhZGRyKQogewogCXBnZF90ICpwZ2QsICpwZ2RfazsKIAlwdWRfdCAqcHVkLCAqcHVkX2s7Ci0t
IAoyLjE3LjEKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
