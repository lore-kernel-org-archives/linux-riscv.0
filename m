Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8E5C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 10:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:CC:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5KSWEFcKn7wl8q0HFyCmJG6HwAuYKL7/Q7IEkNTcZF0=; b=CvdujUgPn1zK6K
	X9WrUf+ExhlGtkaxLX5LIoHPl7CqZu6YB31wOIpVlRNzPJndbZKK62zrAcvYGigBQRogPGuBGPeEd
	XP8JSl5V1i104Fj4B3ZofPnFTHfJ1QMNPMBqVFdHS7xVRolUKSyBmsKBFOBWx4tbPDfNKbxJRzHKg
	zEI1hRg/LmF9RfV/Xxq0pY1Il4H+8+1REoJnEY9vczlZ8qjPbPXSd5MwJWFIh8ygRnM0a+z1M2yFa
	QBsf5MWX9qANCqaG//k9jOPuknMKTFoi9QGfw3/B3tVtCIwhy8IJvcCNOPciiddAgAWoKnTrr5Ku5
	Y+fjAQ5jt3mQL8hi2bJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPjI-00BYpO-0u;
	Fri, 12 May 2023 10:10:28 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPjE-00BYnc-1z;
	Fri, 12 May 2023 10:10:26 +0000
Received: from dggpemm500016.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4QHktL6xytz18LRW;
	Fri, 12 May 2023 18:06:02 +0800 (CST)
Received: from [10.67.108.26] (10.67.108.26) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 12 May
 2023 18:10:15 +0800
Message-ID: <f7a58629-05ae-18f4-d047-a2592f501b45@huawei.com>
Date: Fri, 12 May 2023 18:10:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: <masahiroy@kernel.org>
CC: <aou@eecs.berkeley.edu>, <ardb@kernel.org>, <arnd@arndb.de>,
	<catalin.marinas@arm.com>, <dennis@ausil.us>, <jszhang@kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <nicolas@fjasle.eu>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <regressions@leemhuis.info>, <will@kernel.org>
References: <20221226184537.744960-1-masahiroy@kernel.org>
Subject: Re: [PATCH v2] arch: fix broken BuildID for arm64 and riscv
Content-Language: en-US
From: "chenjiahao (C)" <chenjiahao16@huawei.com>
In-Reply-To: <20221226184537.744960-1-masahiroy@kernel.org>
X-Originating-IP: [10.67.108.26]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_031024_836659_DA03EFC3 
X-CRM114-Status: UNSURE (   3.20  )
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

SGksCgpJdCBzZWVtcyB0aGlzIHBhdGNoIGludHJvZHVjZXMgYSBjb21waWxlIGVycm9yIG9uIHBv
d2VycGMgODV4eCBwbGF0Zm9ybSB3aXRoCkNPTkZJR19SRUxPQ0FUQUJMRSBlbmFibGVkLgoKVG8g
cmVwcm9kdWNlIHRoZSBwcm9ibGVtLCBJIGNvbXBpbGVkIHRoZSBtYWlubGluZSBsaW51eCBrZXJu
ZWwgd2l0aCBwYXRjaAo5OWNiMGQ5MTdmZmEgKCJhcmNoOiBmaXggYnJva2VuIEJ1aWxkSUQgZm9y
IGFybTY0IGFuZCByaXNjdiIpLCB1c2luZyAKY29uZmlndXJlCmZpbGU6CgphcmNoL3Bvd2VycGMv
Y29uZmlncy84NXh4LTMyYml0LmNvbmZpZwoKYW5kIGVuYWJsZWQgQ09ORklHX1JFTE9DQVRBQkxF
IG1hbnVhbGx5LiBUaGVuIHRoZSBjb21waWxlIGxvZyB3aXRoClNlZ21lbnRhdGlvbiBmYXVsdCBh
cHBlYXJlZCBhcyBiZWxvdzoKCiDCoCAuLi4KIMKgIEFSwqDCoMKgwqDCoCBmcy9wcm9jL2J1aWx0
LWluLmEKIMKgIEFSwqDCoMKgwqDCoCBmcy9idWlsdC1pbi5hCiDCoCBBUsKgwqDCoMKgwqAgYnVp
bHQtaW4uYQogwqAgQVLCoMKgwqDCoMKgIHZtbGludXguYQogwqAgTETCoMKgwqDCoMKgIHZtbGlu
dXgubwogwqAgT0JKQ09QWSBtb2R1bGVzLmJ1aWx0aW4ubW9kaW5mbwogwqAgR0VOwqDCoMKgwqAg
bW9kdWxlcy5idWlsdGluCiDCoCBNT0RQT1NUIHZtbGludXguc3ltdmVycwogwqAgVVBEwqDCoMKg
wqAgaW5jbHVkZS9nZW5lcmF0ZWQvdXRzdmVyc2lvbi5oCiDCoCBDQ8KgwqDCoMKgwqAgaW5pdC92
ZXJzaW9uLXRpbWVzdGFtcC5vCiDCoCBMRMKgwqDCoMKgwqAgLnRtcF92bWxpbnV4LmthbGxzeW1z
MQpTZWdtZW50YXRpb24gZmF1bHQgKGNvcmUgZHVtcGVkKQpzY3JpcHRzL01ha2VmaWxlLnZtbGlu
dXg6MzQ6IHJlY2lwZSBmb3IgdGFyZ2V0ICd2bWxpbnV4JyBmYWlsZWQKbWFrZVsxXTogKioqIFt2
bWxpbnV4XSBFcnJvciAxMzkKTWFrZWZpbGU6MTI1MjogcmVjaXBlIGZvciB0YXJnZXQgJ3ZtbGlu
dXgnIGZhaWxlZAptYWtlOiAqKiogW3ZtbGludXhdIEVycm9yIDIKCkNvdWxkIGFueW9uZSByZXBy
b2R1Y2UgYWJvdmUgZXJyb3IsIG9yIGhhdmUgSSBtaXNzZWQgYW55dGhpbmcgZWxzZT8KClRoYW5r
cywKSmlhaGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
