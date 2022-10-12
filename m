Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B76C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 11:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPF3LMtMqEuZ4gb+PbVyd4nm9QWp+JLpGnh9XjP3HfQ=; b=HmZr188s1Mq5kX
	g+1HE8XZ2TzeSd/gLC8CSJ8bfPBhHgPXVqmxegjSRE/h9GCTKJMNfh/IfbCsR+vFU1Oy7iHL7wb9C
	3Ksqoem0nFJzhDPn5hScPzlflbxYpPgnjw31hZ0dpCHaixODWjrPVkbtn3hEK0smmI22xqaRNopym
	ZRY7h+bGo3yFelHMX4o1/SVthX4RW3c0nZYPlTF/uroO13fr5ckBCxc7e0sheOz2y2XDOZyzot8ps
	k8r0b/EgzM3wicKrM2q4c9vecnXRpozUwr9f8XfKRFPO36l/5kBgvj90DVI4NIjaSssu5GRY3CD9R
	oV6vGEyLMk6t24C1aHPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiZeM-007nc7-FI; Wed, 12 Oct 2022 11:11:46 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiZeG-007nYQ-Vm
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 11:11:42 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MnVGY6nKyz1P73k;
	Wed, 12 Oct 2022 19:07:01 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 12 Oct 2022 19:11:36 +0800
Received: from huawei.com (10.175.113.32) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 12 Oct
 2022 19:11:35 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Conor Dooley <conor@kernel.org>, Kefeng Wang <wangkefeng.wang@huawei.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH v3 2/2] riscv: Enable HAVE_ARCH_HUGE_VMALLOC for 64BIT
Date: Wed, 12 Oct 2022 20:00:38 +0800
Message-ID: <20221012120038.1034354-3-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221012120038.1034354-1-liushixin2@huawei.com>
References: <20221012120038.1034354-1-liushixin2@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_041141_218637_7C82F0DE 
X-CRM114-Status: UNSURE (   6.54  )
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

QWZ0ZXIgd2Ugc3VwcG9ydCBIQVZFX0FSQ0hfSFVHRV9WTUFQLCB3ZSBjYW4gbm93IGVuYWJsZSBI
QVZFX0FSQ0hfSFVHRV9WTUFMTE9DCnRvby4gVGhpcyBmZWF0dXJlIGhhcyBiZWVuIHVzZWQgaW4g
a3ZtYWxsb2MgYW5kIGFsbG9jX2xhcmdlX3N5c3RlbV9oYXNoCmZvciBub3cuIFRoaXMgZmVhdHVy
ZSBjYW4gYmUgZGlzYWJsZWQgYnkga2VybmVsIHBhcmFtZXRlcnMgIm5vaHVnZXZtYWxsb2MiLgoK
U2lnbmVkLW9mZi1ieTogTGl1IFNoaXhpbiA8bGl1c2hpeGluMkBodWF3ZWkuY29tPgpSZXZpZXdl
ZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KVGVzdGVkLWJ5OiBCasO2cm4g
VMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgotLS0KIGFyY2gvcmlzY3YvS2NvbmZpZyB8IDEgKwog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9L
Y29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCmluZGV4IGE0ZDU5NzIwM2JkOS4uZmRlZDE4MWM5
ZTUwIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKKysrIGIvYXJjaC9yaXNjdi9LY29u
ZmlnCkBAIC03MCw2ICs3MCw3IEBAIGNvbmZpZyBSSVNDVgogCXNlbGVjdCBHRU5FUklDX1RJTUVf
VlNZU0NBTEwgaWYgTU1VICYmIDY0QklUCiAJc2VsZWN0IEdFTkVSSUNfVkRTT19USU1FX05TIGlm
IEhBVkVfR0VORVJJQ19WRFNPCiAJc2VsZWN0IEhBVkVfQVJDSF9BVURJVFNZU0NBTEwKKwlzZWxl
Y3QgSEFWRV9BUkNIX0hVR0VfVk1BTExPQyBpZiBIQVZFX0FSQ0hfSFVHRV9WTUFQCiAJc2VsZWN0
IEhBVkVfQVJDSF9IVUdFX1ZNQVAgaWYgTU1VICYmIDY0QklUICYmICFYSVBfS0VSTkVMCiAJc2Vs
ZWN0IEhBVkVfQVJDSF9KVU1QX0xBQkVMIGlmICFYSVBfS0VSTkVMCiAJc2VsZWN0IEhBVkVfQVJD
SF9KVU1QX0xBQkVMX1JFTEFUSVZFIGlmICFYSVBfS0VSTkVMCi0tIAoyLjI1LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
