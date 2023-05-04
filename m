Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC49C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 07:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=056t0ZubM8pAmjKl9UEvTHr8oLPUGLlb2X6UzdsiqXw=; b=J9GFYjTxQw12lq
	vjiohsupK48JriuTaEXx8zUhqeF9q7Z9Oak4wXqbuGEck5nbO3OIi2xXJVCOnfQHDutJGEiUj7RGt
	qxallnmko448NeoOws4dtxSn0GYMfbkzMO01gjEthau5KQRjv5a+LNY1gfnWK81jAycGWzwzQJwVg
	NqaPw9vDpUPk09wXXuiycekrXM5/wmy48S8Ks7Pmp0JVtV3m7QGUtzRX4cFYtCb7ejw17MHd4Nq2y
	6LnAa5OUlVYoHloLbcWs2zwbj1OpgVCB17r/KNR4bk9mpVllPpXhIlZ5aT4doUX8CB47OeilMrLr2
	VVweXqqm3U3flIoANg0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puTQT-006tck-1P;
	Thu, 04 May 2023 07:30:53 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puTQQ-006tbh-28
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 07:30:52 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QBllY1VzkzLnd1;
	Thu,  4 May 2023 15:27:53 +0800 (CST)
Received: from huawei.com (10.67.175.83) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 4 May
 2023 15:30:40 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3] riscv: fix kprobe __user string arg print fault issue
Date: Thu, 4 May 2023 15:29:10 +0800
Message-ID: <20230504072910.3742842-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.67.175.83]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_003050_873718_FC23540F 
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

T24gcmlzY3YgcWVtdSBwbGF0Zm9ybSwgd2hlbiBhZGQga3Byb2JlIGV2ZW50IG9uIGRvX3N5c19v
cGVuKCkgdG8gc2hvdwpmaWxlbmFtZSBzdHJpbmcgYXJnLCBpdCBqdXN0IHByaW50IGZhdWx0IGFz
IGZvbGxvdzoKCmVjaG8gJ3A6bXlwcm9iZSBkb19zeXNfb3BlbiBkZmQ9JGFyZzEgZmlsZW5hbWU9
KzAoJGFyZzIpOnN0cmluZyBmbGFncz0kYXJnMwptb2RlPSRhcmc0JyA+IGtwcm9iZV9ldmVudHMK
CmJhc2gtMTY2ICAgICBbMDAwXSAuLi4xLiAgIDM2MC4xOTUzNjc6IG15cHJvYmU6IChkb19zeXNf
b3BlbisweDAvMHg4NCkKZGZkPTB4ZmZmZmZmZmZmZmZmZmY5YyBmaWxlbmFtZT0oZmF1bHQpIGZs
YWdzPTB4ODI0MSBtb2RlPTB4MWI2CgpiYXNoLTE2NiAgICAgWzAwMF0gLi4uMS4gICAzNjAuMjE5
MzY5OiBteXByb2JlOiAoZG9fc3lzX29wZW4rMHgwLzB4ODQpCmRmZD0weGZmZmZmZmZmZmZmZmZm
OWMgZmlsZW5hbWU9KGZhdWx0KSBmbGFncz0weDgyNDEgbW9kZT0weDFiNgoKYmFzaC0xOTEgICAg
IFswMDBdIC4uLjEuICAgMzYwLjM3ODgyNzogbXlwcm9iZTogKGRvX3N5c19vcGVuKzB4MC8weDg0
KQpkZmQ9MHhmZmZmZmZmZmZmZmZmZjljIGZpbGVuYW1lPShmYXVsdCkgZmxhZ3M9MHg5ODgwMCBt
b2RlPTB4MAoKQXMgcmlzY3YgZG8gbm90IHNlbGVjdCBBUkNIX0hBU19OT05fT1ZFUkxBUFBJTkdf
QUREUkVTU19TUEFDRSwKdGhlICswKCRhcmcyKSBhZGRyIGlzIHByb2Nlc3NlZCBhcyBhIGtlcm5l
bCBhZGRyZXNzIHRob3VnaCBpdCBpcyBhCnVzZXJzcGFjZSBhZGRyZXNzLCBjYXVzZSB0aGUgYWJv
dmUgZmlsZW5hbWU9KGZhdWx0KSBwcmludC4gU28gc2VsZWN0CkFSQ0hfSEFTX05PTl9PVkVSTEFQ
UElOR19BRERSRVNTX1NQQUNFIHRvIGF2b2lkIHRoZSBpc3N1ZSwgYWZ0ZXIgdGhhdCB0aGUKa3By
b2JlIHRyYWNlIGlzIG9rIGFzIGJlbG93OgoKYmFzaC0xNjYgICAgIFswMDBdIC4uLjEuICAgIDk2
Ljc2NzY0MTogbXlwcm9iZTogKGRvX3N5c19vcGVuKzB4MC8weDg0KQpkZmQ9MHhmZmZmZmZmZmZm
ZmZmZjljIGZpbGVuYW1lPSIvZGV2L251bGwiIGZsYWdzPTB4ODI0MSBtb2RlPTB4MWI2CgpiYXNo
LTE2NiAgICAgWzAwMF0gLi4uMS4gICAgOTYuNzkzNzUxOiBteXByb2JlOiAoZG9fc3lzX29wZW4r
MHgwLzB4ODQpCmRmZD0weGZmZmZmZmZmZmZmZmZmOWMgZmlsZW5hbWU9Ii9kZXYvbnVsbCIgZmxh
Z3M9MHg4MjQxIG1vZGU9MHgxYjYKCmJhc2gtMTc3ICAgICBbMDAwXSAuLi4xLiAgICA5Ni45NjIz
NTQ6IG15cHJvYmU6IChkb19zeXNfb3BlbisweDAvMHg4NCkKZGZkPTB4ZmZmZmZmZmZmZmZmZmY5
YyBmaWxlbmFtZT0iL3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy9ldmVudHMva3Byb2Jlcy8iCmZs
YWdzPTB4OTg4MDAgbW9kZT0weDAKClNpZ25lZC1vZmYtYnk6IFJ1YW4gSmluamllIDxydWFuamlu
amllQGh1YXdlaS5jb20+CkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5j
b20+Ci0tLQp2MjoKLSBhZGQgdGhlIGNvbmZpZyBpbiBhbHBoYWJldGljYWwgb3JkZXIKLS0tCnYz
OgotIGNoYW5nZSBzaWduZWQtb2ZmLWJ5IHRvIHVzZSBmdWxsIG5hbWUKLS0tCiBhcmNoL3Jpc2N2
L0tjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwppbmRleCBkMjk2N2Zl
ZmExZDcuLmIwOGVkOTI5ZTIyMCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCisrKyBi
L2FyY2gvcmlzY3YvS2NvbmZpZwpAQCAtMjYsNiArMjYsNyBAQCBjb25maWcgUklTQ1YKIAlzZWxl
Y3QgQVJDSF9IQVNfR0lHQU5USUNfUEFHRQogCXNlbGVjdCBBUkNIX0hBU19LQ09WCiAJc2VsZWN0
IEFSQ0hfSEFTX01NSU9XQgorCXNlbGVjdCBBUkNIX0hBU19OT05fT1ZFUkxBUFBJTkdfQUREUkVT
U19TUEFDRQogCXNlbGVjdCBBUkNIX0hBU19QTUVNX0FQSQogCXNlbGVjdCBBUkNIX0hBU19QVEVf
U1BFQ0lBTAogCXNlbGVjdCBBUkNIX0hBU19TRVRfRElSRUNUX01BUCBpZiBNTVUKLS0gCjIuMjUu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
