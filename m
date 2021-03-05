Return-Path: <SRS0=jthF=ID=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B05C4332B
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Mar 2021 11:03:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5734A64FF0
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Mar 2021 11:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5734A64FF0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G3NdgQ8QD6NPhScwVq+akWAFzL/bLSwyaeByN+xa9iI=; b=YHA4JKd4LfRL09kMHHAHCVGTx
	OsSR+c4Gq6SaJoNcjS3QprjBRUeeV87nfmgMaQWw3G4EDEcScaJSV5Cbq7VkgDjHo3Pg7Ip+uSX0y
	fUSI6/A35xHPSfxQiYF/p/ugSPSPTCFH9EyF/rGIfQgr281Mg30EB8s42OREXkrQqrA94cqOtjaq0
	udNEDuo/aJlmRp6uyqTESLGLgxEJvMquTB2MC/V/ciPnkAIqydjhxsH8VIVol/95KImCs//ALNVTV
	daJkyzHBI6akngJFbGc52dO2SPuT30YowsxzkhOwFnWr+6iVqb+SGsvroRUdXttMeBxJifeSWt4PY
	JPqxJk8sQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI8F0-00Efze-Gv; Fri, 05 Mar 2021 11:03:30 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI8EZ-00Efod-PX
 for linux-riscv@lists.infradead.org; Fri, 05 Mar 2021 11:03:09 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DsPsk6yHdzMjS3;
 Fri,  5 Mar 2021 19:00:42 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Fri, 5 Mar 2021
 19:02:44 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
Subject: [PATCH 5/9] riscv: time: Fix no prototype for time_init
Date: Fri, 5 Mar 2021 19:33:28 +0800
Message-ID: <20210305113332.428048-6-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210305113332.428048-1-sunnanyong@huawei.com>
References: <20210305113332.428048-1-sunnanyong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_110307_500651_94F510F4 
X-CRM114-Status: UNSURE (   6.93  )
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
bmVsL3RpbWUuYzoxNjoxMzogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJh0
aW1lX2luaXTigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogICAxNiB8IHZvaWQgX19pbml0IHRp
bWVfaW5pdCh2b2lkKQogICAgICB8ICAgICAgICAgICAgIF5+fn5+fn5+fgoKUmVwb3J0ZWQtYnk6
IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBOYW55b25nIFN1
biA8c3VubmFueW9uZ0BodWF3ZWkuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGlt
ZXguaCB8IDIgKysKIGFyY2gvcmlzY3Yva2VybmVsL3RpbWUuYyAgICAgICB8IDEgKwogMiBmaWxl
cyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3RpbWV4LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RpbWV4LmgKaW5kZXggODFk
ZTUxZTZhYTMyLi41MDdjYWUyNzNiYzYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vdGltZXguaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RpbWV4LmgKQEAgLTg4LDQg
Kzg4LDYgQEAgc3RhdGljIGlubGluZSBpbnQgcmVhZF9jdXJyZW50X3RpbWVyKHVuc2lnbmVkIGxv
bmcgKnRpbWVyX3ZhbCkKIAlyZXR1cm4gMDsKIH0KIAorZXh0ZXJuIHZvaWQgdGltZV9pbml0KHZv
aWQpOworCiAjZW5kaWYgLyogX0FTTV9SSVNDVl9USU1FWF9IICovCmRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC90aW1lLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90aW1lLmMKaW5kZXggOGE1
Y2Y5OWMwNzc2Li4xYjQzMjI2NGY3ZWYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Rp
bWUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90aW1lLmMKQEAgLTksNiArOSw3IEBACiAjaW5j
bHVkZSA8bGludXgvZGVsYXkuaD4KICNpbmNsdWRlIDxhc20vc2JpLmg+CiAjaW5jbHVkZSA8YXNt
L3Byb2Nlc3Nvci5oPgorI2luY2x1ZGUgPGFzbS90aW1leC5oPgogCiB1bnNpZ25lZCBsb25nIHJp
c2N2X3RpbWViYXNlOwogRVhQT1JUX1NZTUJPTF9HUEwocmlzY3ZfdGltZWJhc2UpOwotLSAKMi4y
NS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
