Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED810C4828E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 08:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ruw1/cqEpipd/J+RhpoEHtxio2wUD+Cmal/GWvE8BdE=; b=OF5ot4O+ffLL5w
	ErOv422jvFyvIGNVaPOLiboboeFaiwp9DHIf2yIlOjyXMi9S/ZiVvp/zlBToPyS/SOSURG5UOe6wX
	jtCXvFLCCERPqcBl5SfE5/cM3lO/T5uR2k62uwu4+mCYWWcOaKus3IgEV+Typ+QnteesN/GvFQjo7
	1ActmS7tHG0K/G8vU4tADSA0G44v8TMunw2QAV2EMcVNQuqa2iwlwl2bjrt+WjAROs57xGJIlmadE
	FHVRdE9D5oaJqU5PVMNR7YKLCH9XAgJVxwEJfXFRm11EykVHpwWG6ArYI21HXpBPUIjkofEJGXEvN
	7zwiFxxVtEXdjVZE5ylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVSVX-000000075Bk-0ISo;
	Thu, 01 Feb 2024 08:33:15 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVSVS-0000000756j-3X3S
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 08:33:12 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4TQXGc4DBRz4f3l2m
	for <linux-riscv@lists.infradead.org>; Thu,  1 Feb 2024 16:32:56 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id C99391A0390
	for <linux-riscv@lists.infradead.org>; Thu,  1 Feb 2024 16:33:00 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with SMTP id gCh0CgA3PnA8V7tlRXylCg--.9426S5;
	Thu, 01 Feb 2024 16:33:00 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next v3 3/4] riscv, bpf: Add RV_TAILCALL_OFFSET macro to format tailcall offset
Date: Thu,  1 Feb 2024 08:33:50 +0000
Message-Id: <20240201083351.943121-4-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201083351.943121-1-pulehui@huaweicloud.com>
References: <20240201083351.943121-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgA3PnA8V7tlRXylCg--.9426S5
X-Coremail-Antispam: 1UD129KBjvJXoW7WrW5JFW5uFyxXrW8ArykGrg_yoW8AF1xpF
	4UCwn3uF9Yqr18Cry7AF4DWa1YkFn0qF47GrW3CrW3G3ZF9rykG3WDK3yYvry5CFy8Jr18
	Jryq9w1fC34kArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr
	1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUCXdbU
	UUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_003311_264006_6BA6AE3B 
X-CRM114-Status: UNSURE (   9.48  )
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

RnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KCkFkZCBSVl9UQUlMQ0FMTF9PRkZT
RVQgbWFjcm8gdG8gZm9ybWF0IHRhaWxjYWxsIG9mZnNldCwgYW5kIGNvcnJlY3QgdGhlCnJlbGV2
YW50IGNvbW1lbnRzLgoKU2lnbmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNv
bT4KQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+Ci0tLQogYXJjaC9y
aXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8IDkgKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
bmV0L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCmlu
ZGV4IDc0Zjk5NWFiZjJjMi4uMzUxNmQ0MjVjNWViIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L25l
dC9icGZfaml0X2NvbXA2NC5jCisrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMK
QEAgLTEzLDcgKzEzLDkgQEAKICNpbmNsdWRlIDxhc20vcGF0Y2guaD4KICNpbmNsdWRlICJicGZf
aml0LmgiCiAKLSNkZWZpbmUgUlZfRkVOVFJZX05JTlNOUyAyCisjZGVmaW5lIFJWX0ZFTlRSWV9O
SU5TTlMJMgorLyogZmVudHJ5IGFuZCBUQ0MgaW5pdCBpbnNucyB3aWxsIGJlIHNraXBwZWQgb24g
dGFpbGNhbGwgKi8KKyNkZWZpbmUgUlZfVEFJTENBTExfT0ZGU0VUCSgoUlZfRkVOVFJZX05JTlNO
UyArIDEpICogNCkKIAogI2RlZmluZSBSVl9SRUdfVENDIFJWX1JFR19BNgogI2RlZmluZSBSVl9S
RUdfVENDX1NBVkVEIFJWX1JFR19TNiAvKiBTdG9yZSBBNiBpbiBTNiBpZiBwcm9ncmFtIGRvIGNh
bGxzICovCkBAIC0yNjAsOCArMjYyLDcgQEAgc3RhdGljIHZvaWQgX19idWlsZF9lcGlsb2d1ZShi
b29sIGlzX3RhaWxfY2FsbCwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCiAJaWYgKCFpc190
YWlsX2NhbGwpCiAJCWVtaXRfYWRkaXcoUlZfUkVHX0EwLCBSVl9SRUdfQTUsIDAsIGN0eCk7CiAJ
ZW1pdF9qYWxyKFJWX1JFR19aRVJPLCBpc190YWlsX2NhbGwgPyBSVl9SRUdfVDMgOiBSVl9SRUdf
UkEsCi0JCSAgaXNfdGFpbF9jYWxsID8gKFJWX0ZFTlRSWV9OSU5TTlMgKyAxKSAqIDQgOiAwLCAv
KiBza2lwIHJlc2VydmVkIG5vcHMgYW5kIFRDQyBpbml0ICovCi0JCSAgY3R4KTsKKwkJICBpc190
YWlsX2NhbGwgPyBSVl9UQUlMQ0FMTF9PRkZTRVQgOiAwLCBjdHgpOwogfQogCiBzdGF0aWMgdm9p
ZCBlbWl0X2JjYyh1OCBjb25kLCB1OCByZCwgdTggcnMsIGludCBydm9mZiwKQEAgLTM4Miw3ICsz
ODMsNyBAQCBzdGF0aWMgaW50IGVtaXRfYnBmX3RhaWxfY2FsbChpbnQgaW5zbiwgc3RydWN0IHJ2
X2ppdF9jb250ZXh0ICpjdHgpCiAJb2ZmID0gbmluc25zX3J2b2ZmKHRjX25pbnNuIC0gKGN0eC0+
bmluc25zIC0gc3RhcnRfaW5zbikpOwogCWVtaXRfYnJhbmNoKEJQRl9KRVEsIFJWX1JFR19UMiwg
UlZfUkVHX1pFUk8sIG9mZiwgY3R4KTsKIAotCS8qIGdvdG8gKihwcm9nLT5icGZfZnVuYyArIDQp
OyAqLworCS8qIGdvdG8gKihwcm9nLT5icGZfZnVuYyArIFJWX1RBSUxDQUxMX09GRlNFVCk7ICov
CiAJb2ZmID0gb2Zmc2V0b2Yoc3RydWN0IGJwZl9wcm9nLCBicGZfZnVuYyk7CiAJaWYgKGlzXzEy
Yl9jaGVjayhvZmYsIGluc24pKQogCQlyZXR1cm4gLTE7Ci0tIAoyLjM0LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
