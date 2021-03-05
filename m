Return-Path: <SRS0=jthF=ID=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A78C433E0
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Mar 2021 11:03:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C048464FDF
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Mar 2021 11:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C048464FDF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6fo3lJxS+uCk4kCFhOIFaPRv8IeUKSIsLseRU1RAQL0=; b=rBgJWCZFf6yA0kqHm4PKtFHAY
	2OuHTAQjFrruZOwARbSa5OltnnEaZ1LZQybL3iCGRfvieErD5XMLA/fIMB2AkWEwbPf0IeHyA4a/X
	VMyK/7Io8/mKHnXuxqUfiAjNfCZQ03E5fx5EKhAyT2RnfcGWgCcqxZlB/Kh0C6lJHQr8GkFUhZ4yu
	LNXR+kDHY1qwQftteL8mTNnfUFDL4iWeZLRXtrrZ7s57Rmfw/T659z18TLCz/vQLkXrm4JRCtOtSX
	eSrFAmoagygBdh+hKorVds7UnfbLNJtKXX11xGRY9tShORyPOVGMOTDJ0LxYWw2hxre2G/ee8EM8B
	oczuaZ1eQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI8En-00Efvq-4P; Fri, 05 Mar 2021 11:03:17 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI8EZ-00EfoT-1i
 for linux-riscv@lists.infradead.org; Fri, 05 Mar 2021 11:03:07 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DsPsk65FWzMjQq;
 Fri,  5 Mar 2021 19:00:42 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Fri, 5 Mar 2021
 19:02:47 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
Subject: [PATCH 9/9] riscv: process: Fix no prototype for arch_dup_task_struct
Date: Fri, 5 Mar 2021 19:33:32 +0800
Message-ID: <20210305113332.428048-10-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210305113332.428048-1-sunnanyong@huawei.com>
References: <20210305113332.428048-1-sunnanyong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_110304_423774_A0F4A2CB 
X-CRM114-Status: UNSURE (   5.81  )
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

Rml4IHRoZSBmb2xsb3dpbmcgVz0xIGNvbXBpbGF0aW9uIHdhcm5pbmc6CmFyY2gvcmlzY3Yva2Vy
bmVsL3Byb2Nlc3MuYzoxMTQ6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDi
gJhhcmNoX2R1cF90YXNrX3N0cnVjdOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiAgMTE0IHwg
aW50IGFyY2hfZHVwX3Rhc2tfc3RydWN0KHN0cnVjdCB0YXNrX3N0cnVjdCAqZHN0LCBzdHJ1Y3Qg
dGFza19zdHJ1Y3QgKnNyYykKICAgICAgfCAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn4KClJlcG9y
dGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogTmFu
eW9uZyBTdW4gPHN1bm5hbnlvbmdAaHVhd2VpLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3Byb2Nlc3Nvci5oIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAppbmRleCAzYTI0MDAzN2JkZTIuLjAyMWVkNjRlZTYw
OCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAorKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCkBAIC03MSw2ICs3MSw3IEBAIGludCBy
aXNjdl9vZl9wcm9jZXNzb3JfaGFydGlkKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSk7CiBpbnQg
cmlzY3Zfb2ZfcGFyZW50X2hhcnRpZChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpOwogCiBleHRl
cm4gdm9pZCByaXNjdl9maWxsX2h3Y2FwKHZvaWQpOworZXh0ZXJuIGludCBhcmNoX2R1cF90YXNr
X3N0cnVjdChzdHJ1Y3QgdGFza19zdHJ1Y3QgKmRzdCwgc3RydWN0IHRhc2tfc3RydWN0ICpzcmMp
OwogCiAjZW5kaWYgLyogX19BU1NFTUJMWV9fICovCiAKLS0gCjIuMjUuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
