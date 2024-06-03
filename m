Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7670EC25B75
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 12:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Acq797vOraDmZk1P9NN7jeXPvBuAiy6qwlG/EJbbchg=; b=Dle9P5uuGwjDjV
	PAkIAb6rj8gyYTdDJ4J1L7h9wlzfU+n8CvldqOYHD1YZF9slWewbrAY8lL+tjmV8nMFSBcHmBvKI2
	j29+G11OqHCbJqF5xGOVFUhgoC+zMgpKaarixFV9hlsW4CVMF2B5RcFJXCRYLRcsVA6MjfJnNTN28
	acYqK1hHV8CRW+v+8Eb2WizfE4t6JrusnsGy3pw998TcKgk7nGrBeRlAuLeUrFJor0WwBMNt8Yp4N
	38kvxsFDXH6Jah0scLmFDxR6AaeDBUptiIcSi1XBjFD98bjeHk2bBQ1Yle8yEGxSGVucxNwXvdD4u
	W+GMdFTFmL6iKn3Rs2Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7Gy-0000000GmbY-19DZ;
	Mon, 03 Jun 2024 12:58:48 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7Gs-0000000GmWb-20QL
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 12:58:45 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VtDJm4PFyzclDk;
	Mon,  3 Jun 2024 20:57:12 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
	by mail.maildlp.com (Postfix) with ESMTPS id CD54E18007C;
	Mon,  3 Jun 2024 20:58:35 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 3 Jun
 2024 20:58:35 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <anup@brainfault.org>, <tglx@linutronix.de>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2] irqchip/riscv-aplic: Simplify the to_of_node() code
Date: Mon, 3 Jun 2024 12:56:52 +0000
Message-ID: <20240603125652.791601-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_055842_822555_FB162FAE 
X-CRM114-Status: GOOD (  13.01  )
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

VGhlIHRvX29mX25vZGUoKSBoYXMgaXNfb2Zfbm9kZSgpIGNoZWNrLCBzbyB0aGVyZSBpcyBubyBu
ZWVkIHRvIHJlcGVhdCB0aGUKaXNfb2Zfbm9kZSgpIGFuZCB0b19vZl9ub2RlKCkuIEFuZCBpZiBp
c19vZl9ub2RlKCkgcmV0dXJucyBmYWxzZSwgdGhlCnRvX29mX25vZGUoKSB3aWxsIHJldHVybiBO
VUxMLCB0aGUgb2ZfcHJvcGVydHlfcHJlc2VudCgpIHdpbGwgcmV0dXJuIGZhbHNlLApzbyByZW1v
dmUgdGhlIHJlZHVuZGFudCBjaGVjay4KClNpZ25lZC1vZmYtYnk6IEppbmppZSBSdWFuIDxydWFu
amluamllQGh1YXdlaS5jb20+Ci0tLQp2MjoKLSBVcGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlLCB1
c2UgdGhlIGZvcm1hdCDigJhmdW5jdGlvbl9uYW1lKCkuCi0tLQogZHJpdmVycy9pcnFjaGlwL2ly
cS1yaXNjdi1hcGxpYy1tYWluLmMgfCAxMyArKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJx
Y2hpcC9pcnEtcmlzY3YtYXBsaWMtbWFpbi5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1h
cGxpYy1tYWluLmMKaW5kZXggNzc0YTBjOTdmZGFiLi4yOGRkMTc1YjU3NjQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbWFpbi5jCisrKyBiL2RyaXZlcnMvaXJx
Y2hpcC9pcnEtcmlzY3YtYXBsaWMtbWFpbi5jCkBAIC0xMjcsNiArMTI3LDcgQEAgc3RhdGljIHZv
aWQgYXBsaWNfaW5pdF9od19pcnFzKHN0cnVjdCBhcGxpY19wcml2ICpwcml2KQogCiBpbnQgYXBs
aWNfc2V0dXBfcHJpdihzdHJ1Y3QgYXBsaWNfcHJpdiAqcHJpdiwgc3RydWN0IGRldmljZSAqZGV2
LCB2b2lkIF9faW9tZW0gKnJlZ3MpCiB7CisJc3RydWN0IGRldmljZV9ub2RlICpucCA9IHRvX29m
X25vZGUoZGV2LT5md25vZGUpOwogCXN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgcGFyZW50OwogCWlu
dCByYzsKIApAQCAtMTM0LDcgKzEzNSw3IEBAIGludCBhcGxpY19zZXR1cF9wcml2KHN0cnVjdCBh
cGxpY19wcml2ICpwcml2LCBzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgX19pb21lbSAqCiAJICog
Q3VycmVudGx5LCBvbmx5IE9GIGZ3bm9kZSBpcyBzdXBwb3J0ZWQgc28gZXh0ZW5kIHRoaXMKIAkg
KiBmdW5jdGlvbiBmb3IgQUNQSSBzdXBwb3J0LgogCSAqLwotCWlmICghaXNfb2Zfbm9kZShkZXYt
PmZ3bm9kZSkpCisJaWYgKCFucCkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKIAkvKiBTYXZlIGRldmlj
ZSBwb2ludGVyIGFuZCByZWdpc3RlciBiYXNlICovCkBAIC0xNDIsOCArMTQzLDcgQEAgaW50IGFw
bGljX3NldHVwX3ByaXYoc3RydWN0IGFwbGljX3ByaXYgKnByaXYsIHN0cnVjdCBkZXZpY2UgKmRl
diwgdm9pZCBfX2lvbWVtICoKIAlwcml2LT5yZWdzID0gcmVnczsKIAogCS8qIEZpbmQgb3V0IG51
bWJlciBvZiBpbnRlcnJ1cHQgc291cmNlcyAqLwotCXJjID0gb2ZfcHJvcGVydHlfcmVhZF91MzIo
dG9fb2Zfbm9kZShkZXYtPmZ3bm9kZSksICJyaXNjdixudW0tc291cmNlcyIsCi0JCQkJICAmcHJp
di0+bnJfaXJxcyk7CisJcmMgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgInJpc2N2LG51bS1z
b3VyY2VzIiwgJnByaXYtPm5yX2lycXMpOwogCWlmIChyYykgewogCQlkZXZfZXJyKGRldiwgImZh
aWxlZCB0byBnZXQgbnVtYmVyIG9mIGludGVycnVwdCBzb3VyY2VzXG4iKTsKIAkJcmV0dXJuIHJj
OwpAQCAtMTU1LDggKzE1NSw4IEBAIGludCBhcGxpY19zZXR1cF9wcml2KHN0cnVjdCBhcGxpY19w
cml2ICpwcml2LCBzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgX19pb21lbSAqCiAJICogSWYgIm1z
aS1wYXJlbnQiIHByb3BlcnR5IGlzIHByZXNlbnQgdGhlbiB3ZSBpZ25vcmUgdGhlCiAJICogQVBM
SUMgSURDcyB3aGljaCBmb3JjZXMgdGhlIEFQTElDIGRyaXZlciB0byB1c2UgTVNJIG1vZGUuCiAJ
ICovCi0JaWYgKCFvZl9wcm9wZXJ0eV9wcmVzZW50KHRvX29mX25vZGUoZGV2LT5md25vZGUpLCAi
bXNpLXBhcmVudCIpKSB7Ci0JCXdoaWxlICghb2ZfaXJxX3BhcnNlX29uZSh0b19vZl9ub2RlKGRl
di0+Zndub2RlKSwgcHJpdi0+bnJfaWRjcywgJnBhcmVudCkpCisJaWYgKCFvZl9wcm9wZXJ0eV9w
cmVzZW50KG5wLCAibXNpLXBhcmVudCIpKSB7CisJCXdoaWxlICghb2ZfaXJxX3BhcnNlX29uZShu
cCwgcHJpdi0+bnJfaWRjcywgJnBhcmVudCkpCiAJCQlwcml2LT5ucl9pZGNzKys7CiAJfQogCkBA
IC0xODQsOCArMTg0LDcgQEAgc3RhdGljIGludCBhcGxpY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogCSAqIElmIG1zaS1wYXJlbnQgcHJvcGVydHkgaXMgcHJlc2VudCB0aGVu
IHNldHVwIEFQTElDIE1TSQogCSAqIG1vZGUgb3RoZXJ3aXNlIHNldHVwIEFQTElDIGRpcmVjdCBt
b2RlLgogCSAqLwotCWlmIChpc19vZl9ub2RlKGRldi0+Zndub2RlKSkKLQkJbXNpX21vZGUgPSBv
Zl9wcm9wZXJ0eV9wcmVzZW50KHRvX29mX25vZGUoZGV2LT5md25vZGUpLCAibXNpLXBhcmVudCIp
OworCW1zaV9tb2RlID0gb2ZfcHJvcGVydHlfcHJlc2VudCh0b19vZl9ub2RlKGRldi0+Zndub2Rl
KSwgIm1zaS1wYXJlbnQiKTsKIAlpZiAobXNpX21vZGUpCiAJCXJjID0gYXBsaWNfbXNpX3NldHVw
KGRldiwgcmVncyk7CiAJZWxzZQotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
