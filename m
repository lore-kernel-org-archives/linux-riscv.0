Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABC5C47258
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 12:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYHmrEcDQuOZT9smDXG9u7G1J9k4spT1VL80Y3W9Jlo=; b=QoooRXrYKR4K6J
	4Zw6rtkfD2AwIfYwo/LSuWWcZrFdISdcuQ/PdVKglmRT9pU+awLQgBvFl/NPPeOXW1IVxaLBmqQ5T
	BMWv67RCYr7PLxvqQa268k5nEHZMHjYMtcAlG3TO0/Gg+GSsA9x30faUi/LWzlAUkS6JTTx+vqZ7t
	uhJcmG2E96tFjp1ejnUM4FRL2TgUbQPTbkZxK3hfZh62C9LzqtQXqo1vFSsCNYSG0JK2ErabLhwjs
	K5mz9fLVna+95Ci6QfyBsqxvTQ0nK+oNUS8ILW5cs7ULDTY4Z2qO7vyJ2x/yl+GvunZsWebs2tMy1
	6o6TBO2qHhq188cWKC1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMTu-008x5d-37;
	Mon, 15 Jan 2024 12:54:22 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMTr-008x3d-0p
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 12:54:21 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4TDBrJ6v2zzvTtj;
	Mon, 15 Jan 2024 20:52:48 +0800 (CST)
Received: from kwepemd100009.china.huawei.com (unknown [7.221.188.135])
	by mail.maildlp.com (Postfix) with ESMTPS id 915D81402E0;
	Mon, 15 Jan 2024 20:53:56 +0800 (CST)
Received: from ultra.huawei.com (10.90.53.71) by
 kwepemd100009.china.huawei.com (7.221.188.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.28; Mon, 15 Jan 2024 20:53:55 +0800
From: Pu Lehui <pulehui@huawei.com>
To: <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<netdev@vger.kernel.org>
CC: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	<andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
	<song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Luke
 Nelson <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
	<pulehui@huaweicloud.com>
Subject: [PATCH bpf-next v3 1/6] riscv, bpf: Unify 32-bit sign-extension to emit_sextw
Date: Mon, 15 Jan 2024 12:54:22 +0000
Message-ID: <20240115125427.2914015-2-pulehui@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240115125427.2914015-1-pulehui@huawei.com>
References: <20240115125427.2914015-1-pulehui@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.71]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd100009.china.huawei.com (7.221.188.135)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_045419_639271_1E8615E1 
X-CRM114-Status: UNSURE (   9.17  )
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

Rm9yIGNvZGUgdW5pZmljYXRpb24sIGFkZCBlbWl0X3NleHR3IHdyYXBwZXIgdG8gdW5pZnkgYWxs
IHRoZSAzMi1iaXQKc2lnbi1leHRlbnNpb24gb3BlcmF0aW9ucy4KClNpZ25lZC1vZmYtYnk6IFB1
IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+CkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9y
bkBrZXJuZWwub3JnPgotLS0KIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaCAgICAgICAgfCAgNSAr
KysrKwogYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8IDEwICsrKysrLS0tLS0KIDIg
ZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0LmggYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0LmgK
aW5kZXggYTVjZTFhYjc2ZWNlLi5mOWY4ZDg2ZTc2MmYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
bmV0L2JwZl9qaXQuaAorKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0LmgKQEAgLTEwODcsNiAr
MTA4NywxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZW1pdF9zdWJ3KHU4IHJkLCB1OCByczEsIHU4
IHJzMiwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCiAJCWVtaXQocnZfc3VidyhyZCwgcnMx
LCByczIpLCBjdHgpOwogfQogCitzdGF0aWMgaW5saW5lIHZvaWQgZW1pdF9zZXh0dyh1OCByZCwg
dTggcnMsIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4KQoreworCWVtaXRfYWRkaXcocmQsIHJz
LCAwLCBjdHgpOworfQorCiAjZW5kaWYgLyogX19yaXNjdl94bGVuID09IDY0ICovCiAKIHZvaWQg
YnBmX2ppdF9idWlsZF9wcm9sb2d1ZShzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCk7CmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIGIvYXJjaC9yaXNjdi9uZXQv
YnBmX2ppdF9jb21wNjQuYwppbmRleCA1OGRjNjRkZDk0YTguLjczZjhhMDkzOGFkYSAxMDA2NDQK
LS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYworKysgYi9hcmNoL3Jpc2N2L25l
dC9icGZfaml0X2NvbXA2NC5jCkBAIC00MTcsOCArNDE3LDggQEAgc3RhdGljIHZvaWQgZW1pdF96
ZXh0XzMyX3JkX3JzKHU4ICpyZCwgdTggKnJzLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkK
IAogc3RhdGljIHZvaWQgZW1pdF9zZXh0XzMyX3JkX3JzKHU4ICpyZCwgdTggKnJzLCBzdHJ1Y3Qg
cnZfaml0X2NvbnRleHQgKmN0eCkKIHsKLQllbWl0X2FkZGl3KFJWX1JFR19UMiwgKnJkLCAwLCBj
dHgpOwotCWVtaXRfYWRkaXcoUlZfUkVHX1QxLCAqcnMsIDAsIGN0eCk7CisJZW1pdF9zZXh0dyhS
Vl9SRUdfVDIsICpyZCwgY3R4KTsKKwllbWl0X3NleHR3KFJWX1JFR19UMSwgKnJzLCBjdHgpOwog
CSpyZCA9IFJWX1JFR19UMjsKIAkqcnMgPSBSVl9SRUdfVDE7CiB9CkBAIC00MzMsNyArNDMzLDcg
QEAgc3RhdGljIHZvaWQgZW1pdF96ZXh0XzMyX3JkX3QxKHU4ICpyZCwgc3RydWN0IHJ2X2ppdF9j
b250ZXh0ICpjdHgpCiAKIHN0YXRpYyB2b2lkIGVtaXRfc2V4dF8zMl9yZCh1OCAqcmQsIHN0cnVj
dCBydl9qaXRfY29udGV4dCAqY3R4KQogewotCWVtaXRfYWRkaXcoUlZfUkVHX1QyLCAqcmQsIDAs
IGN0eCk7CisJZW1pdF9zZXh0dyhSVl9SRUdfVDIsICpyZCwgY3R4KTsKIAkqcmQgPSBSVl9SRUdf
VDI7CiB9CiAKQEAgLTExMDMsNyArMTEwMyw3IEBAIGludCBicGZfaml0X2VtaXRfaW5zbihjb25z
dCBzdHJ1Y3QgYnBmX2luc24gKmluc24sIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4LAogCQkJ
ZW1pdF9zcmFpKHJkLCBSVl9SRUdfVDEsIDY0IC0gaW5zbi0+b2ZmLCBjdHgpOwogCQkJYnJlYWs7
CiAJCWNhc2UgMzI6Ci0JCQllbWl0X2FkZGl3KHJkLCBycywgMCwgY3R4KTsKKwkJCWVtaXRfc2V4
dHcocmQsIHJzLCBjdHgpOwogCQkJYnJlYWs7CiAJCX0KIAkJaWYgKCFpczY0ICYmICFhdXgtPnZl
cmlmaWVyX3pleHQpCkBAIC0xNTAzLDcgKzE1MDMsNyBAQCBpbnQgYnBmX2ppdF9lbWl0X2luc24o
Y29uc3Qgc3RydWN0IGJwZl9pbnNuICppbnNuLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCwK
IAkJICogYXMgdDEgaXMgdXNlZCBvbmx5IGluIGNvbXBhcmlzb24gYWdhaW5zdCB6ZXJvLgogCQkg
Ki8KIAkJaWYgKCFpczY0ICYmIGltbSA8IDApCi0JCQllbWl0X2FkZGl3KFJWX1JFR19UMSwgUlZf
UkVHX1QxLCAwLCBjdHgpOworCQkJZW1pdF9zZXh0dyhSVl9SRUdfVDEsIFJWX1JFR19UMSwgY3R4
KTsKIAkJZSA9IGN0eC0+bmluc25zOwogCQlydm9mZiAtPSBuaW5zbnNfcnZvZmYoZSAtIHMpOwog
CQllbWl0X2JyYW5jaChCUEZfSk5FLCBSVl9SRUdfVDEsIFJWX1JFR19aRVJPLCBydm9mZiwgY3R4
KTsKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
