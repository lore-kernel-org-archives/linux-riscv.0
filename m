Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC310C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 09:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SMelvvM+bB2vUTeACVJKuhST4LDwZ6nd7RWnPHVCTCg=; b=h62JGaF1xtcxt3
	vNwZWtxSkMfcTMT4bvAdqaYoROqVeFlgfFAkqcWW1PdBvDM2N81hU37jfOQkefmKHQmSHdeAs7Scg
	wM2gf6v4X88Nk3MLIS+WrRJSj2/6ySkCFJ/86dN//6qNjm2QbE+8Xk8621PNMLMMH5/x/dSLLqRL3
	Psmx0efkMEwDtxIFFQSTcomNnxkLUtLRIwqdMlZfr7mT2BHsM9S9tvt/n0Wr/UtESNKbSuv6JYZ5q
	h6olAzBc0A1oJJq09proTj2khiN7fUIKqIeP+fu42ILVs3n6khzZ+4sKii6Fchx8D442Gmi9OpPnq
	oGp0wyUasJXJ2lLVvK4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4fte-001WyL-Ol; Fri, 24 Jun 2022 09:46:38 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4fta-001Wri-LT
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 09:46:36 +0000
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LTscF0KCKzSh2t;
	Fri, 24 Jun 2022 17:42:53 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 24 Jun
 2022 17:46:18 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<akpm@linux-foundation.org>, <pasha.tatashin@soleen.com>,
	<tongtiangen@huawei.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] riscv/mm: Fix build error while PAGE_TABLE_CHECK enabled without MMU
Date: Fri, 24 Jun 2022 16:52:36 +0800
Message-ID: <20220624085236.18544-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_024634_894606_62F6EFEE 
X-CRM114-Status: UNSURE (   6.48  )
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

bW0vcGFnZV90YWJsZV9jaGVjay5jOiBJbiBmdW5jdGlvbiDigJhfX3BhZ2VfdGFibGVfY2hlY2tf
cHRlX2NsZWFy4oCZOgptbS9wYWdlX3RhYmxlX2NoZWNrLmM6MTQ4OjY6IGVycm9yOiBpbXBsaWNp
dCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhwdGVfdXNlcl9hY2Nlc3NpYmxlX3BhZ2XigJk7
IGRpZCB5b3UgbWVhbiDigJh1c2VyX2FjY2Vzc19zYXZl4oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1m
dW5jdGlvbi1kZWNsYXJhdGlvbl0KICBpZiAocHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdlKHB0ZSkp
IHsKICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CiAgICAgIHVzZXJfYWNjZXNzX3NhdmUK
CkFSQ0hfU1VQUE9SVFNfUEFHRV9UQUJMRV9DSEVDSyBzaG91bGQgb25seSBlbmFibGVkIHdpdGgg
TU1VLgoKRml4ZXM6IDNmZWUyMjlhOGViOSAoInJpc2N2L21tOiBlbmFibGUgQVJDSF9TVVBQT1JU
U19QQUdFX1RBQkxFX0NIRUNLIikKU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmlu
Z0BodWF3ZWkuY29tPgotLS0KIGFyY2gvcmlzY3YvS2NvbmZpZyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwppbmRleCA4NTBmNmZiYjBiNWYuLmQ2YTA3
YjlhZGQwNSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCisrKyBiL2FyY2gvcmlzY3Yv
S2NvbmZpZwpAQCAtMzgsNyArMzgsNyBAQCBjb25maWcgUklTQ1YKIAlzZWxlY3QgQVJDSF9TVVBQ
T1JUU19BVE9NSUNfUk1XCiAJc2VsZWN0IEFSQ0hfU1VQUE9SVFNfREVCVUdfUEFHRUFMTE9DIGlm
IE1NVQogCXNlbGVjdCBBUkNIX1NVUFBPUlRTX0hVR0VUTEJGUyBpZiBNTVUKLQlzZWxlY3QgQVJD
SF9TVVBQT1JUU19QQUdFX1RBQkxFX0NIRUNLCisJc2VsZWN0IEFSQ0hfU1VQUE9SVFNfUEFHRV9U
QUJMRV9DSEVDSyBpZiBNTVUKIAlzZWxlY3QgQVJDSF9VU0VfTUVNVEVTVAogCXNlbGVjdCBBUkNI
X1VTRV9RVUVVRURfUldMT0NLUwogCXNlbGVjdCBBUkNIX1dBTlRfREVGQVVMVF9UT1BET1dOX01N
QVBfTEFZT1VUIGlmIE1NVQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
