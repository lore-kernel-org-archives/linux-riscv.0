Return-Path: <SRS0=jthF=ID=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E499C433E0
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Mar 2021 11:04:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB0FA65017
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Mar 2021 11:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB0FA65017
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6nzVTEuqp780kE896WZE0Xh8sD0DyByqHNVejJ4nYpg=; b=ng9jK2zFffgP9rB8xakHhVTbz
	CL/pETpTLZDoZ9LtWO9QJFfwV704upFuz7fV/kCocHY77xrFEE/3UxjvAjNAlUBzhufd8kyWz9EkH
	g7ECTAVJdOZnh7hmOqcPAY/fV6RipOYf9WjhURmIQ6nxUeH5aAoIwMua9qYkoCb3cNqFMQQZO02Po
	SxQRlrNrBUDTrWonqyxWMq0ocmugjBrwsKobVh2ImD9Qht++ZP9yR8O+grQRbqMWgRw0RdyU8HlKN
	FbNcVkNYAW9xKjKxfIW1VdyinSNbSYUhStB3O7wDwLl4OUcUTWKir562/rIQqt7Nrbp2SUvU2lJyy
	VqaC+fwvA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI8FX-00Eg8e-4D; Fri, 05 Mar 2021 11:04:03 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI8Ec-00Efof-KO
 for linux-riscv@lists.infradead.org; Fri, 05 Mar 2021 11:03:12 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DsPtd6ST6zjVjt;
 Fri,  5 Mar 2021 19:01:29 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Fri, 5 Mar 2021
 19:02:43 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
Subject: [PATCH 4/9] riscv: ptrace: Fix no prototype warnings
Date: Fri, 5 Mar 2021 19:33:27 +0800
Message-ID: <20210305113332.428048-5-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210305113332.428048-1-sunnanyong@huawei.com>
References: <20210305113332.428048-1-sunnanyong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_110307_500414_3A9EEFA3 
X-CRM114-Status: UNSURE (   6.10  )
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

Rml4IHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBjb21waWxhdGlvbiB3YXJuaW5nczoKYXJjaC9y
aXNjdi9rZXJuZWwvZnRyYWNlLmM6MTg2OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlw
ZSBmb3Ig4oCYcHJlcGFyZV9mdHJhY2VfcmV0dXJu4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10K
ICAxODYgfCB2b2lkIHByZXBhcmVfZnRyYWNlX3JldHVybih1bnNpZ25lZCBsb25nICpwYXJlbnQs
IHVuc2lnbmVkIGxvbmcgc2VsZl9hZGRyLAogICAgICB8ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
fn5+CmFyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jOjIzOToxNTogd2FybmluZzogbm8gcHJldmlv
dXMgcHJvdG90eXBlIGZvciDigJhkb19zeXNjYWxsX3RyYWNlX2VudGVy4oCZIFstV21pc3Npbmct
cHJvdG90eXBlc10KICAyMzkgfCBfX3Zpc2libGUgaW50IGRvX3N5c2NhbGxfdHJhY2VfZW50ZXIo
c3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAgICAgIHwgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+
fn5+fn5+fn5+CmFyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jOjI2MjoxNjogd2FybmluZzogbm8g
cHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhkb19zeXNjYWxsX3RyYWNlX2V4aXTigJkgWy1XbWlz
c2luZy1wcm90b3R5cGVzXQogIDI2MiB8IF9fdmlzaWJsZSB2b2lkIGRvX3N5c2NhbGxfdHJhY2Vf
ZXhpdChzdHJ1Y3QgcHRfcmVncyAqcmVncykKICAgICAgfCAgICAgICAgICAgICAgICBefn5+fn5+
fn5+fn5+fn5+fn5+fn4KClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNv
bT4KU2lnbmVkLW9mZi1ieTogTmFueW9uZyBTdW4gPHN1bm5hbnlvbmdAaHVhd2VpLmNvbT4KLS0t
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3B0cmFjZS5oIHwgNSArKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cHRyYWNlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3B0cmFjZS5oCmluZGV4IGNiNGFiYjYz
OWU4ZC4uMDlhZDRlOTIzNTEwIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3B0
cmFjZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHRyYWNlLmgKQEAgLTExOSw2ICsx
MTksMTEgQEAgZXh0ZXJuIGludCByZWdzX3F1ZXJ5X3JlZ2lzdGVyX29mZnNldChjb25zdCBjaGFy
ICpuYW1lKTsKIGV4dGVybiB1bnNpZ25lZCBsb25nIHJlZ3NfZ2V0X2tlcm5lbF9zdGFja19udGgo
c3RydWN0IHB0X3JlZ3MgKnJlZ3MsCiAJCQkJCSAgICAgICB1bnNpZ25lZCBpbnQgbik7CiAKK3Zv
aWQgcHJlcGFyZV9mdHJhY2VfcmV0dXJuKHVuc2lnbmVkIGxvbmcgKnBhcmVudCwgdW5zaWduZWQg
bG9uZyBzZWxmX2FkZHIsCisJCQkgICB1bnNpZ25lZCBsb25nIGZyYW1lX3BvaW50ZXIpOworaW50
IGRvX3N5c2NhbGxfdHJhY2VfZW50ZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpOwordm9pZCBkb19z
eXNjYWxsX3RyYWNlX2V4aXQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpOworCiAvKioKICAqIHJlZ3Nf
Z2V0X3JlZ2lzdGVyKCkgLSBnZXQgcmVnaXN0ZXIgdmFsdWUgZnJvbSBpdHMgb2Zmc2V0CiAgKiBA
cmVnczoJcHRfcmVncyBmcm9tIHdoaWNoIHJlZ2lzdGVyIHZhbHVlIGlzIGdvdHRlbgotLSAKMi4y
NS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
