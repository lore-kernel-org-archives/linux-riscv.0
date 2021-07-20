Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD65C07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 02:05:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 287C061107
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 02:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 287C061107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lr6d7pyAPlkTKip5dR2ANU9liIyeb5xo7txqFZpTqBs=; b=QJYs/uoHc1QIJl
	uR2av903evnIW7KnkiJ5gY9WOvTlWm1NAJ8mIrQrxJdIVC0QQ+ew8yBTu6Je+g2JaEQySNS47sSJU
	MzCE8rVBKYlgao+um5wiKvAvt5UQAmMjxvlrx6idBFF4ibY+Znxqh20InhW5Vpis8eb9Ukh5XVLdz
	5KJpzlMdHy+uv4DBKyZZID2OIvOi/L2FUjNY9Km1snC+YYNG0Hno148GKjG82rBuYoCVIsAcpgrWs
	yqE6rMbky9iJpyB4Sr3WIAPZ0a97Rdh37hRqKx5LCgGWAC5sgyFle+kBvwqEI6TcaTj3OLcUkA0A9
	LLZJbThDDhXDBcdxqpqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5f8A-00BgFk-Rg; Tue, 20 Jul 2021 02:05:10 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5f83-00BgCU-NI
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 02:05:07 +0000
Received: from dggeme751-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GTMQ46xMvz7wQd;
 Tue, 20 Jul 2021 10:01:16 +0800 (CST)
Received: from huawei.com (10.67.174.96) by dggeme751-chm.china.huawei.com
 (10.3.19.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 20
 Jul 2021 10:04:54 +0800
From: Zhang Jianhua <chris.zjh@huawei.com>
To: <corbet@lwn.net>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <chris.zjh@huawei.com>, <rostedt@goodmis.org>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: [PATCH -next] trace doc: Fix the wrong example of tracepoint
Date: Tue, 20 Jul 2021 10:06:07 +0800
Message-ID: <20210720020607.4128715-1-chris.zjh@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-Originating-IP: [10.67.174.96]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeme751-chm.china.huawei.com (10.3.19.97)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_190504_009406_92E5C349 
X-CRM114-Status: UNSURE (   9.46  )
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

VGhlIGV4YW1wbGUgaW4gdHJhY2Vwb2ludHMucnN0IGlzIG91dCBvZiBkYXRlLCB0aGUgYnVpbGQg
ZXJyb3IgYmVsb3cKd2lsbCBvY2N1ciBpZiBjb2RpbmcgYWNjb3JkaW5nIHRvIGV4YW1wbGUgaW4g
dGhlIGRvY3VtZW50LgoKZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmM6MjQ6MjQ6CmVy
cm9yOiBtYWNybyAiREVGSU5FX1RSQUNFIiByZXF1aXJlcyAzIGFyZ3VtZW50cywgYnV0IG9ubHkg
MSBnaXZlbgogICAyNCB8IERFRklORV9UUkFDRSh0ZXN0X2V2ZW50KTsKICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgIF4KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGluY2x1ZGUvdHJhY2UvZXZl
bnRzL3Rlc3QuaDo4LApmcm9tIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jOjIyOgpp
bmNsdWRlL2xpbnV4L3RyYWNlcG9pbnQuaDozNjg6Cm5vdGU6IG1hY3JvICJERUZJTkVfVFJBQ0Ui
IGRlZmluZWQgaGVyZQogIDM2OCB8ICNkZWZpbmUgREVGSU5FX1RSQUNFKG5hbWUsIHByb3RvLCBh
cmdzKQogICAgICB8CmRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jOjI0OjE6Cndhcm5p
bmc6IGRhdGEgZGVmaW5pdGlvbiBoYXMgbm8gdHlwZSBvciBzdG9yYWdlIGNsYXNzCiAgIDI0IHwg
REVGSU5FX1RSQUNFKHRlc3RfZXZlbnQpOwogICAgICB8IF5+fn5+fn5+fn5+fgpkcml2ZXJzL2ly
cWNoaXAvaXJxLXJpc2N2LWludGMuYzoyNDoxOgplcnJvcjogdHlwZSBkZWZhdWx0cyB0byDigJhp
bnTigJkgaW4gZGVjbGFyYXRpb24gb2Yg4oCYREVGSU5FX1RSQUNF4oCZClstV2Vycm9yPWltcGxp
Y2l0LWludF0KClRoZXJlIGFyZSB0d28gcmVhc29ucyBmb3IgdGhpcyBlcnJvci4gT24gdGhlIG9u
ZSBoYW5kLCB0aGUgbWFjcm8gREVGSU5FX1RSQUNFCmhhcyBiZWVuIHJlZmFjdG9yZWQgaW4gY29t
bWl0IGQyNWUzN2Q4OWRkMiAoInRyYWNlcG9pbnQ6IE9wdGltaXplIHVzaW5nCnN0YXRpY19jYWxs
KCkiKSBmcm9tIERFRklORV9UUkFDRShuYW1lKSB0byBERUZJTkVfVFJBQ0UobmFtZSwgcHJvdG8s
IGFyZ3MpLAphbmQgdGhlIGRvYyBpcyBub3QgdXBkYXRlZCBpbiB0aW1lLiBPbiB0aGUgb3RoZXIg
aGFuZCwgdGhlIHRyYWNlcG9pbnQgaGFzIGJlZW4KZGVmaW5lZCBpbiBoZWFkZXIgZmlsZSwgYW5k
IGl0IGRvZXMgbm90IG5lZWQgdG8gZGVmaW5lIHJlcGVhdGVkbHkgaW4gQyBmaWxlLgoKLS0tLS0t
LS0KClNpZ25lZC1vZmYtYnk6IFpoYW5nIEppYW5odWEgPGNocmlzLnpqaEBodWF3ZWkuY29tPgot
LS0KIERvY3VtZW50YXRpb24vdHJhY2UvdHJhY2Vwb2ludHMucnN0IHwgMSAtCiAxIGZpbGUgY2hh
bmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhY2UvdHJh
Y2Vwb2ludHMucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFjZS90cmFjZXBvaW50cy5yc3QKaW5kZXgg
MGNiOGQ5Y2EzZDYwLi5mYmIyY2I0YWJkM2QgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vdHJh
Y2UvdHJhY2Vwb2ludHMucnN0CisrKyBiL0RvY3VtZW50YXRpb24vdHJhY2UvdHJhY2Vwb2ludHMu
cnN0CkBAIC02Niw3ICs2Niw2IEBAIEluIHN1YnN5cy9maWxlLmMgKHdoZXJlIHRoZSB0cmFjaW5n
IHN0YXRlbWVudCBtdXN0IGJlIGFkZGVkKTo6CiAJI2luY2x1ZGUgPHRyYWNlL2V2ZW50cy9zdWJz
eXMuaD4KIAogCSNkZWZpbmUgQ1JFQVRFX1RSQUNFX1BPSU5UUwotCURFRklORV9UUkFDRShzdWJz
eXNfZXZlbnRuYW1lKTsKIAogCXZvaWQgc29tZWZjdCh2b2lkKQogCXsKLS0gCjIuMzEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
