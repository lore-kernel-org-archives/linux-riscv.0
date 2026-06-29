Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CB2C44502
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 13:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dfjb545X65UA5PwNfAK2AQMLREba/gtqI6BNuH0PAik=; b=RrN/SGJAZaGt0E
	2T5bmUGlEruXD16sOA10cqQSIZ0/TcoirWaepcgTUdwxgh+aNr7aWeT6EtQjO6J1CEsRHMuFav4yO
	xZ0SfJz2M8Gs2aIog48kO7yO/h3auKDiJygf3NudVtiSfERG/qLFeaEdvBbAUV8llt1m0X2lcMS+u
	6o5icbk5PwAnOOSk0UZFQkmbE60c8ZOj6pwGgNTdb7F+KNKclarkWmK9ZGj1EGBuSagY34MJA/zXv
	/3NTcLzgxwZbBVyLx4Qd31JcNuj6WwdsKs26lK9i0xGbHjV7R+wtQW/AkP6zVD8epr2FJS3gBuh8Q
	kVftqP6LaHqUghtVMw4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCTk-0000000EnqK-3eCw;
	Mon, 29 Jun 2026 13:56:52 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCTh-0000000Enn9-09nq
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 13:56:51 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gpnrH2vsBzKHMdw
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 21:56:31 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id E1ADE40572
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 21:56:37 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgCXBfOUeUJqDlQCAQ--.44260S6;
	Mon, 29 Jun 2026 21:56:37 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next v4 4/6] riscv, bpf: Add RV_TAILCALL_OFFSET macro to format tailcall offset
Date: Mon, 29 Jun 2026 14:00:46 +0000
Message-Id: <20260629140048.733346-5-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629140048.733346-1-pulehui@huaweicloud.com>
References: <20260629140048.733346-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgCXBfOUeUJqDlQCAQ--.44260S6
X-Coremail-Antispam: 1UD129KBjvJXoW7WrW5AF17uw15WF4kGw4Durg_yoW8CF1fpF
	W5Kwn3Cr9Yqr4FkryDJF4qqa1ayrn0ganrGr43CrW3J3ZFvrykG3WDKws0vry5uFy8GF48
	JFyq9r1fua4DA37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPvb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7
	xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Y
	z7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2
	AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6r
	W5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuY
	vjxUI-eODUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_065649_447828_6795B1FC 
X-CRM114-Status: GOOD (  10.62  )
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

RnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KCkFkZCBSVl9UQUlMQ0FMTF9PRkZT
RVQgbWFjcm8gdG8gZm9ybWF0IHRhaWxjYWxsIG9mZnNldCwgYW5kIGNvcnJlY3QgdGhlCnJlbGV2
YW50IGNvbW1lbnRzLgoKQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+
ClNpZ25lZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Ci0tLQogYXJjaC9y
aXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9u
ZXQvYnBmX2ppdF9jb21wNjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKaW5k
ZXggNjk1MTJkOTNjYTRhLi5jMjM5Njk2Y2NhNjQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0
L2JwZl9qaXRfY29tcDY0LmMKKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwpA
QCAtMjEsNiArMjEsOCBAQAogI2RlZmluZSBSVl9LQ0ZJX05JTlNOUyAoSVNfRU5BQkxFRChDT05G
SUdfQ0ZJKSA/IDEgOiAwKQogLyogaW1tIHRoYXQgYWxsb3dzIGVtaXRfaW1tIHRvIGVtaXQgbWF4
IGNvdW50IGluc25zICovCiAjZGVmaW5lIFJWX01BWF9DT1VOVF9JTU0gMHg3RkZGN0ZGN0ZGN0ZG
N0ZGCisvKiBrY2ZpLCBmZW50cnkgYW5kIFRDQyBpbml0IGluc25zIHdpbGwgYmUgc2tpcHBlZCBv
biB0YWlsY2FsbCAqLworI2RlZmluZSBSVl9UQUlMQ0FMTF9PRkZTRVQgKChSVl9LQ0ZJX05JTlNO
UyArIFJWX0ZFTlRSWV9OSU5TTlMgKyAxKSAqIDQpCiAKICNkZWZpbmUgUlZfUkVHX1RDQyBSVl9S
RUdfQTYKICNkZWZpbmUgUlZfUkVHX1RDQ19TQVZFRCBSVl9SRUdfUzYgLyogU3RvcmUgQTYgaW4g
UzYgaWYgcHJvZ3JhbSBkbyBjYWxscyAqLwpAQCAtMjcyLDkgKzI3NCw3IEBAIHN0YXRpYyB2b2lk
IF9fYnVpbGRfZXBpbG9ndWUoYm9vbCBpc190YWlsX2NhbGwsIHN0cnVjdCBydl9qaXRfY29udGV4
dCAqY3R4KQogCWlmICghaXNfdGFpbF9jYWxsKQogCQllbWl0X2FkZGl3KFJWX1JFR19BMCwgUlZf
UkVHX0E1LCAwLCBjdHgpOwogCWVtaXRfamFscihSVl9SRUdfWkVSTywgaXNfdGFpbF9jYWxsID8g
UlZfUkVHX1QzIDogUlZfUkVHX1JBLAotCQkgIC8qIGtjZmksIGZlbnRyeSBhbmQgVENDIGluaXQg
aW5zbnMgd2lsbCBiZSBza2lwcGVkIG9uIHRhaWxjYWxsICovCi0JCSAgaXNfdGFpbF9jYWxsID8g
KFJWX0tDRklfTklOU05TICsgUlZfRkVOVFJZX05JTlNOUyArIDEpICogNCA6IDAsCi0JCSAgY3R4
KTsKKwkJICBpc190YWlsX2NhbGwgPyBSVl9UQUlMQ0FMTF9PRkZTRVQgOiAwLCBjdHgpOwogfQog
CiBzdGF0aWMgdm9pZCBlbWl0X2JjYyh1OCBjb25kLCB1OCByZCwgdTggcnMsIGludCBydm9mZiwK
QEAgLTM5NCw3ICszOTQsNyBAQCBzdGF0aWMgaW50IGVtaXRfYnBmX3RhaWxfY2FsbChpbnQgaW5z
biwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCiAJb2ZmID0gbmluc25zX3J2b2ZmKHRjX25p
bnNuIC0gKGN0eC0+bmluc25zIC0gc3RhcnRfaW5zbikpOwogCWVtaXRfYnJhbmNoKEJQRl9KRVEs
IFJWX1JFR19UMiwgUlZfUkVHX1pFUk8sIG9mZiwgY3R4KTsKIAotCS8qIGdvdG8gKihwcm9nLT5i
cGZfZnVuYyArIDQpOyAqLworCS8qIGdvdG8gKihwcm9nLT5icGZfZnVuYyArIFJWX1RBSUxDQUxM
X09GRlNFVCk7ICovCiAJb2ZmID0gb2Zmc2V0b2Yoc3RydWN0IGJwZl9wcm9nLCBicGZfZnVuYyk7
CiAJaWYgKGlzXzEyYl9jaGVjayhvZmYsIGluc24pKQogCQlyZXR1cm4gLTE7Ci0tIAoyLjM0LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
