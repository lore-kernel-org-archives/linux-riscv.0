Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19E7C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 02:41:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D534923602
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 02:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D534923602
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v0NQ3Qrk+I4nUAObghagsJ+KIRD4NifanAI9aahi09I=; b=kGGe31NT6SK0nJpT2WyKdvDJsI
	SdaKabFf/xlCqReSBPMrNdHaaslch/P6TORlXM3fYdfs3Pni+dmcKLQyviNJbRMiY2fPjPOogotN/
	wnl7fhJ9WO4RjxdAn8deCqrh6OyISx8Hg6e4NPKc9pY3AEIFK0CO+zBbCb1NXX3N0jsYwKKk1juUr
	dpzofHctPapUApxIr/wzXwAesJY5zwS07SfNXtuhs3Bpt3w07JWaZ2Rt03Zwz3Risb1NnZRd9EKpF
	m7WCyk50RdnBy4V9UOPkAHoHQEbFWHsxKW67gpEx8IVLVSM8BLQIaGWdqzCF3dbKln5uD4tT9/kT0
	vKuGkkog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzsZy-00080T-6O; Thu, 14 Jan 2021 02:41:42 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzsZv-0007zN-KR
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 02:41:40 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DGT7J4GFszMK9Z;
 Thu, 14 Jan 2021 10:40:12 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Thu, 14 Jan 2021 10:41:22 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <linux-riscv@lists.infradead.org>, <palmerdabbelt@google.com>
Subject: [PATCH] riscv: stacktrace: Move register keyword to beginning of
 declaration
Date: Thu, 14 Jan 2021 10:46:57 +0800
Message-ID: <20210114024657.194363-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_214139_962422_1519740E 
X-CRM114-Status: UNSURE (   8.74  )
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
Cc: Atish Patra <atish.patra@wdc.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VXNpbmcgZ2xvYmFsIHNwX2luX2dsb2JhbCBkaXJlY3RseSB0byBmaXggdGhlIGZvbGxvd2luZyB3
YXJuaW5nLAoKYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jOjMxOjM6IHdhcm5pbmc6IOKA
mHJlZ2lzdGVy4oCZIGlzIG5vdCBhdCBiZWdpbm5pbmcgb2YgZGVjbGFyYXRpb24gWy1Xb2xkLXN0
eWxlLWRlY2xhcmF0aW9uXQozMSB8ICAgY29uc3QgcmVnaXN0ZXIgdW5zaWduZWQgbG9uZyBjdXJy
ZW50X3NwID0gc3BfaW5fZ2xvYmFsOwogICB8ICAgXn5+fn4KClNpZ25lZC1vZmYtYnk6IEtlZmVu
ZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5l
bC9zdGFja3RyYWNlLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJh
Y2UuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYwppbmRleCA0OGI4NzBhNjg1YjMu
LmRmNWQyZGE3YzQwYiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5j
CisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYwpAQCAtMTQsNyArMTQsNyBAQAog
CiAjaW5jbHVkZSA8YXNtL3N0YWNrdHJhY2UuaD4KIAotcmVnaXN0ZXIgdW5zaWduZWQgbG9uZyBz
cF9pbl9nbG9iYWwgX19hc21fXygic3AiKTsKK3JlZ2lzdGVyIGNvbnN0IHVuc2lnbmVkIGxvbmcg
c3BfaW5fZ2xvYmFsIF9fYXNtX18oInNwIik7CiAKICNpZmRlZiBDT05GSUdfRlJBTUVfUE9JTlRF
UgogCkBAIC0yOCw5ICsyOCw4IEBAIHZvaWQgbm90cmFjZSB3YWxrX3N0YWNrZnJhbWUoc3RydWN0
IHRhc2tfc3RydWN0ICp0YXNrLCBzdHJ1Y3QgcHRfcmVncyAqcmVncywKIAkJc3AgPSB1c2VyX3N0
YWNrX3BvaW50ZXIocmVncyk7CiAJCXBjID0gaW5zdHJ1Y3Rpb25fcG9pbnRlcihyZWdzKTsKIAl9
IGVsc2UgaWYgKHRhc2sgPT0gTlVMTCB8fCB0YXNrID09IGN1cnJlbnQpIHsKLQkJY29uc3QgcmVn
aXN0ZXIgdW5zaWduZWQgbG9uZyBjdXJyZW50X3NwID0gc3BfaW5fZ2xvYmFsOwogCQlmcCA9ICh1
bnNpZ25lZCBsb25nKV9fYnVpbHRpbl9mcmFtZV9hZGRyZXNzKDApOwotCQlzcCA9IGN1cnJlbnRf
c3A7CisJCXNwID0gc3BfaW5fZ2xvYmFsOwogCQlwYyA9ICh1bnNpZ25lZCBsb25nKXdhbGtfc3Rh
Y2tmcmFtZTsKIAl9IGVsc2UgewogCQkvKiB0YXNrIGJsb2NrZWQgaW4gX19zd2l0Y2hfdG8gKi8K
LS0gCjIuMjYuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
