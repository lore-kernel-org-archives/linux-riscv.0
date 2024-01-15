Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65679C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 12:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IGF2RWOsqNZ+wAgo9aTQyir8YoGWxnz+M4nOS71AK+I=; b=bvSr4jV+HXBw2s
	wMU/obctKKijSzdIVf0AjNJjHAkt/X1KiAGzz7BoN/4y0/fSMSiTZlovlLkDthIco+/ObMr/wrvqt
	SN+uWyJxSvcuVau0vVT354qWCW750ScSvc0uxdVbFmGTtn9jUOuOV42oLGa6NRxxVPOJKRBMSb/7j
	12TJd7jQJ9ydPO+l9frdscjT5zz0T/mwXAwkxpQDzT9xNSK6Sm1SS6UHP2xZPOdscvRr+0W8zGrsb
	SitBO1f7s3zVmZpg5KvTGqYUlRuY/nwG01cEbb8xyM1ha03oSMwysymF+stryCQqTj4TKvgPSPeLw
	6UYVJhC0LZPcruLqTLLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMUm-008xTb-2j;
	Mon, 15 Jan 2024 12:55:16 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMUk-008xRW-0W
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 12:55:15 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4TDBth5v6gzGq0L;
	Mon, 15 Jan 2024 20:54:52 +0800 (CST)
Received: from kwepemd100009.china.huawei.com (unknown [7.221.188.135])
	by mail.maildlp.com (Postfix) with ESMTPS id C5BBB1406AC;
	Mon, 15 Jan 2024 20:54:56 +0800 (CST)
Received: from ultra.huawei.com (10.90.53.71) by
 kwepemd100009.china.huawei.com (7.221.188.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.28; Mon, 15 Jan 2024 20:53:58 +0800
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
Subject: [PATCH bpf-next v3 5/6] riscv, bpf: Optimize sign-extention mov insns with Zbb support
Date: Mon, 15 Jan 2024 12:54:26 +0000
Message-ID: <20240115125427.2914015-6-pulehui@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240115125427.2914015-1-pulehui@huawei.com>
References: <20240115125427.2914015-1-pulehui@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.71]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd100009.china.huawei.com (7.221.188.135)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_045514_363924_4EF6241D 
X-CRM114-Status: UNSURE (   7.07  )
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

QWRkIDgtYml0IGFuZCAxNi1iaXQgc2lnbi1leHRlbnRpb24gd3JhcGVyIHdpdGggWmJiIHN1cHBv
cnQgdG8gb3B0aW1pemUKc2lnbi1leHRlbnNpb24gbW92IGluc3RydWN0aW9ucy4KClNpZ25lZC1v
ZmYtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+CkFja2VkLWJ5OiBCasO2cm4gVMO2
cGVsIDxiam9ybkBrZXJuZWwub3JnPgotLS0KIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaCAgICAg
ICAgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2Nv
bXA2NC5jIHwgIDUgKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0LmggYi9hcmNo
L3Jpc2N2L25ldC9icGZfaml0LmgKaW5kZXggNTFmNmQyMTQwODZmLi5iMDBjNWMwNTkxZDIgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaAorKysgYi9hcmNoL3Jpc2N2L25ldC9i
cGZfaml0LmgKQEAgLTExMTksNiArMTExOSwyOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZW1pdF9z
dWJ3KHU4IHJkLCB1OCByczEsIHU4IHJzMiwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCiAJ
CWVtaXQocnZfc3VidyhyZCwgcnMxLCByczIpLCBjdHgpOwogfQogCitzdGF0aWMgaW5saW5lIHZv
aWQgZW1pdF9zZXh0Yih1OCByZCwgdTggcnMsIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4KQor
eworCWlmIChydnpiYl9lbmFibGVkKCkpIHsKKwkJZW1pdChydnpiYl9zZXh0YihyZCwgcnMpLCBj
dHgpOworCQlyZXR1cm47CisJfQorCisJZW1pdF9zbGxpKHJkLCBycywgNTYsIGN0eCk7CisJZW1p
dF9zcmFpKHJkLCByZCwgNTYsIGN0eCk7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCBlbWl0X3Nl
eHRoKHU4IHJkLCB1OCBycywgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCit7CisJaWYgKHJ2
emJiX2VuYWJsZWQoKSkgeworCQllbWl0KHJ2emJiX3NleHRoKHJkLCBycyksIGN0eCk7CisJCXJl
dHVybjsKKwl9CisKKwllbWl0X3NsbGkocmQsIHJzLCA0OCwgY3R4KTsKKwllbWl0X3NyYWkocmQs
IHJkLCA0OCwgY3R4KTsKK30KKwogc3RhdGljIGlubGluZSB2b2lkIGVtaXRfc2V4dHcodTggcmQs
IHU4IHJzLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkKIHsKIAllbWl0X2FkZGl3KHJkLCBy
cywgMCwgY3R4KTsKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMg
Yi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCmluZGV4IGQ5MDc4NDY3NDY3Ny4uMThi
YmY4MTIyZWIzIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCisr
KyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKQEAgLTEwNzMsOSArMTA3MywxMCBA
QCBpbnQgYnBmX2ppdF9lbWl0X2luc24oY29uc3Qgc3RydWN0IGJwZl9pbnNuICppbnNuLCBzdHJ1
Y3QgcnZfaml0X2NvbnRleHQgKmN0eCwKIAkJCWVtaXRfbXYocmQsIHJzLCBjdHgpOwogCQkJYnJl
YWs7CiAJCWNhc2UgODoKKwkJCWVtaXRfc2V4dGIocmQsIHJzLCBjdHgpOworCQkJYnJlYWs7CiAJ
CWNhc2UgMTY6Ci0JCQllbWl0X3NsbGkoUlZfUkVHX1QxLCBycywgNjQgLSBpbnNuLT5vZmYsIGN0
eCk7Ci0JCQllbWl0X3NyYWkocmQsIFJWX1JFR19UMSwgNjQgLSBpbnNuLT5vZmYsIGN0eCk7CisJ
CQllbWl0X3NleHRoKHJkLCBycywgY3R4KTsKIAkJCWJyZWFrOwogCQljYXNlIDMyOgogCQkJZW1p
dF9zZXh0dyhyZCwgcnMsIGN0eCk7Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
