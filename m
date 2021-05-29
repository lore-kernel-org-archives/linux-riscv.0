Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FB9C47082
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 04:43:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8005613DD
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 04:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8005613DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gA5ofH0MSSZAA8SMsD+6EjzM/ZhegUbADfbU0uWK28g=; b=r8yegwY2pP/yglRhKJWxk9ifWD
	O+90+VSM3W5GzCKhjCsQH0mEq+64NQMWSm5ePmWcdJRrqLYrE4jV1xZ7ve30tAGyegk0xipf+zfvS
	9qS6C3O6UOLkeD59xUVVEQhcAl7L7AtPQWPdecCJgsNIQNRPF2vY7Z1/AMEqFqB/9QRErzgDGmqGn
	UA1Emvacrfg5vpEy2/QrnR1LBrErufqhIVXH0SU1PGOq4hnU6SWXx6tm506jbrHpz3uJwlJ9yPEIT
	QgTbnbnNEUflkr2jc6mQ/JC5Ehv4cXzSMFRZPPwf4qHvM9XXp8yvSyKl3kimb168myeJNKkAOL+Cz
	LjhpkjlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmqom-0038Fk-ET; Sat, 29 May 2021 04:43:24 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmqoj-0038Cb-2n
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 04:43:23 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FsTPh73bWzYqqY;
 Sat, 29 May 2021 12:40:24 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 12:43:06 +0800
Received: from [10.174.177.231] (10.174.177.231) by
 dggpemm000001.china.huawei.com (7.185.36.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 12:43:05 +0800
Subject: Re: [PATCH -next] module: fix build error when CONFIG_SMP is disabled
To: Bixuan Cui <cuibixuan@huawei.com>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <vincent.chen@sifive.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20210529020328.36863-1-cuibixuan@huawei.com>
From: "Sunnanyong (Nanyong Sun, Intelligent Computing Solution Development
 Dep)" <sunnanyong@huawei.com>
Message-ID: <4798a93f-f0a5-60f6-5b02-7d507fe60d4f@huawei.com>
Date: Sat, 29 May 2021 12:43:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210529020328.36863-1-cuibixuan@huawei.com>
X-Originating-IP: [10.174.177.231]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm000001.china.huawei.com (7.185.36.245)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_214321_501540_1DB4635E 
X-CRM114-Status: UNSURE (   9.51  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjAyMS81LzI5IDEwOjAzLCBCaXh1YW4gQ3VpIHdyb3RlOgoKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90
bGJmbHVzaC5oCj4gaW5kZXggYzg0MjE4YWQ3YWZjLi45ZDU4MDFmNmUyYzMgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gQEAgLTQ0LDYgKzQ0LDEyIEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBmbHVzaF90bGJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gICAJbG9j
YWxfZmx1c2hfdGxiX2FsbCgpOwo+ICAgfQo+ICAgCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBmbHVz
aF9wbWRfdGxiX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAo+ICsJCXVuc2lnbmVk
IGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKQo+ICt7Cj4gKwlsb2NhbF9mbHVzaF90bGJf
YWxsKCk7Cj4gK30KPiArCj4gICAjZGVmaW5lIGZsdXNoX3RsYl9tbShtbSkgZmx1c2hfdGxiX2Fs
bCgpCj4gICAjZW5kaWYgLyogIUNPTkZJR19TTVAgfHwgIUNPTkZJR19NTVUgKi8KCk1vdmUgdGhl
IHByb3RvdHlwZSBvZiBmbHVzaF9wbWRfdGxiX3JhbmdlIGZyb20gcGd0YWJsZS5oIHRvIHRsYmZs
dXNoLmgKCmNhbiBhbHNvIGZpeCB0aGlzIHByb2JsZW0sIGFuZCBpdCBzZWVtcyB0aGF0IGRlY2xh
cmUgZmx1c2hfcG1kX3RsYl9yYW5nZSAKaW4gdGxiZmx1c2guaAoKaXMgYmV0dGVyLgoKV2UgY291
bGQKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCAKYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAppbmRleCAyOWUyYzgzNjg0OGQuLmVkYTMxMDAy
YzRiMSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKQEAgLTYyMiwxMSArNjIyLDYgQEAgc3Rh
dGljIGlubGluZSBwbWRfdCBwbWRwX2VzdGFibGlzaChzdHJ1Y3QgCnZtX2FyZWFfc3RydWN0ICp2
bWEsCiDCoHsKIMKgwqDCoMKgwqDCoMKgIHJldHVybiBfX3BtZChhdG9taWNfbG9uZ194Y2hnKChh
dG9taWNfbG9uZ190ICopcG1kcCwgCnBtZF92YWwocG1kKSkpOwogwqB9Ci0KLSNkZWZpbmUgX19I
QVZFX0FSQ0hfRkxVU0hfUE1EX1RMQl9SQU5HRQotdm9pZCBmbHVzaF9wbWRfdGxiX3JhbmdlKHN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAotwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBlbmQpOwot
CiDCoCNlbmRpZiAvKiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UgKi8KCiDCoC8qCmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggCmIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS90bGJmbHVzaC5oCmluZGV4IGM4NDIxOGFkN2FmYy4uYjliOWM2NGFjOTc0IDEw
MDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgKKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCkBAIC0zMyw2ICszMywxMSBAQCB2b2lkIGZsdXNo
X3RsYl9tbShzdHJ1Y3QgbW1fc3RydWN0ICptbSk7CiDCoHZvaWQgZmx1c2hfdGxiX3BhZ2Uoc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkcik7CiDCoHZvaWQgZmx1
c2hfdGxiX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIHN0
YXJ0LAogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBs
b25nIGVuZCk7CisjaWZkZWYgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFCisjZGVmaW5lIF9f
SEFWRV9BUkNIX0ZMVVNIX1BNRF9UTEJfUkFOR0UKK3ZvaWQgZmx1c2hfcG1kX3RsYl9yYW5nZShz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBzdGFydCwKK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgZW5kKTsK
KyNlbmRpZiAvKiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UgKi8KIMKgI2Vsc2UgLyogQ09O
RklHX1NNUCAmJiBDT05GSUdfTU1VICovCgogwqAjZGVmaW5lIGZsdXNoX3RsYl9hbGwoKSBsb2Nh
bF9mbHVzaF90bGJfYWxsKCkKCkluIHRoaXMgd2F5ICwgZmx1c2hfcChtL3UpZF90bGJfcmFuZ2Ug
d2lsbCBiZSBkZWZpbmVkIGluIAppbmNsdWRlL2xpbnV4L3BndGFibGUuaCBpZgoKQ09ORklHX1NN
UCBpcyBub3Qgc2V0LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
