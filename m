Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02033C54EE9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 09:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=raTwV3Kty0NtKwGqd8+MRJoTRdw63PlCTDd+l4Sb/CU=; b=QAgNH2XolSYWY5
	s3bEiHMqS/3+BFa5x/4RYnioyxOvSCtw2wq97dpFpWXmd7D4spYSw7mjh/0BXZnGBtxgH1MG5c0i2
	FvlEfNa/lMct50wtzh4caE8DH47qnj3cvVucQcEmH55jMRxYAUuqiTE7fnSBNAwrGsIEKfFg8AAmw
	83fLq+MflLNJFdem2g4KVxbamZ1JxbKCNltFH4Ih47nutrbRuX4Yz6/RQZeb9m+gvCpl4BOZ3AFpz
	8Mq2Yex/5EeZUAywUT0Cn/WU88KccW5udrbQ46Zav61L+mG0YbZHw5Kwn9kYkhiTh/aSwXcCfLwqk
	7lQMsQ3dhM1+3BTGpS4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaDDm-00Aqca-2U; Mon, 19 Sep 2022 09:37:46 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaDDU-00AqOZ-B4
	for linux-riscv@lists.infradead.org; Mon, 19 Sep 2022 09:37:36 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MWKHG3ppPzmV5h;
	Mon, 19 Sep 2022 17:33:30 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500022.china.huawei.com
 (7.185.36.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 19 Sep
 2022 17:37:22 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<sfr@canb.auug.org.au>
CC: <linux-riscv@lists.infradead.org>, <liwei391@huawei.com>
Subject: [PATCH -next] =?UTF-8?q?riscv:=20errata:=20fix=20=E2=80=98riscv?= =?UTF-8?q?=5Fcbom=5Fblock=5Fsize=E2=80=99=20variable=20undeclared?=
Date: Mon, 19 Sep 2022 17:44:25 +0800
Message-ID: <20220919094426.860040-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_023729_347368_729B5A59 
X-CRM114-Status: UNSURE (   8.99  )
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

YXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmM6IEluIGZ1bmN0aW9uIOKAmGVycmF0YV9w
cm9iZV9jbW/igJk6CmFyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jOjQwOjI6IGVycm9y
OiDigJhyaXNjdl9jYm9tX2Jsb2NrX3NpemXigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRo
aXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYcmlzY3ZfaW5pdF9jYm9tX2Jsb2Nrc2l6ZeKA
mT8KICAgNDAgfCAgcmlzY3ZfY2JvbV9ibG9ja19zaXplID0gTDFfQ0FDSEVfQllURVM7CiAgICAg
IHwgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fgogICAgICB8ICByaXNjdl9pbml0X2Nib21fYmxvY2tz
aXplCgoncmlzY3ZfY2JvbV9ibG9ja19zaXplJyB2YXJpYWJsZSBzaG91bGQgYmUgZGVjbGFyZWQK
d2l0aG91dCB0aGUgbGltaXRhdGlvbiB3aGV0aGVyIENPTkZJR19SSVNDVl9JU0FfWklDQk9NCmlz
IGVuYWJsZWQgb3Igbm90LgoKU2lnbmVkLW9mZi1ieTogWmVuZyBIZW5nIDx6ZW5naGVuZzRAaHVh
d2VpLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaCB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9jYWNoZWZsdXNoLmgKaW5kZXggYTg5YzAwNWI0YmJmLi43ZWM2MDBhNzE2MzQgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCisrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCkBAIC00Miw4ICs0Miw4IEBAIHZvaWQgZmx1
c2hfaWNhY2hlX21tKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBib29sIGxvY2FsKTsKIAogI2VuZGlm
IC8qIENPTkZJR19TTVAgKi8KIAotI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfWklDQk9NCiBleHRl
cm4gdW5zaWduZWQgaW50IHJpc2N2X2Nib21fYmxvY2tfc2l6ZTsKKyNpZmRlZiBDT05GSUdfUklT
Q1ZfSVNBX1pJQ0JPTQogdm9pZCByaXNjdl9pbml0X2Nib21fYmxvY2tzaXplKHZvaWQpOwogI2Vs
c2UKIHN0YXRpYyBpbmxpbmUgdm9pZCByaXNjdl9pbml0X2Nib21fYmxvY2tzaXplKHZvaWQpIHsg
fQotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
