Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EA0C44506
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 06:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IrrQBynFMoaaCvaLYG3UNCFwZfsKY96HlUj3PVl9Or8=; b=xdi6eg6oi7br7j
	lPYi2l7DNkbQiVwYPnFEYBRUPcB0OcR0g8ZNUaypXz+59ou1oD/3zEAD79L39ouJdSGuJqh6+v5SM
	LfbP+POpC6Zf1Gf4GvmC04e5j5xzcTiFcMHsH6Leb5deQlOm9l0RWqklMXyQUZm35y8prVA/3hwQj
	jcSe1c5CEwLKNV6G/aMhUFLwk8EDMu+yBajKTAh1PoJA/Xv32j+Ze/mWDADu2wMf0dCkzNGgUr/LV
	XQO3ws6uLGLrutYJDitJ1uEeWC0tQchOQ2xj25w8A+DRRpsgCte5eltDNI54liDvaFFytUoDkhQpM
	Ef12KnUf6PfnQFmPdUKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whLxT-0000000GQ02-1sKI;
	Wed, 08 Jul 2026 06:40:35 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whLxP-0000000GPxC-3fQb
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 06:40:34 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gw7kh26sRzYQtlY
	for <linux-riscv@lists.infradead.org>; Wed,  8 Jul 2026 14:40:12 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id DDD2440594
	for <linux-riscv@lists.infradead.org>; Wed,  8 Jul 2026 14:40:16 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgD32yfQ8E1qblLgAQ--.30661S5;
	Wed, 08 Jul 2026 14:40:16 +0800 (CST)
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
Subject: [PATCH bpf-next v6 3/7] riscv, bpf: Using kvzalloc_objs to allocate cache buffer
Date: Wed,  8 Jul 2026 06:44:32 +0000
Message-Id: <20260708064436.2971933-4-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708064436.2971933-1-pulehui@huaweicloud.com>
References: <20260708064436.2971933-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgD32yfQ8E1qblLgAQ--.30661S5
X-Coremail-Antispam: 1UD129KBjvJXoW7WFW3Cw13GrWfGw4Utr4fXwb_yoW8Kw1fpF
	4DWwnxCrZY9w48WF4kta18ZFy3Ja1DW3W7GFWUu34fur90gryrX3ZY934Yga98CFW8Aw1f
	urWY9rnxu34kJ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ew
	Av7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY
	6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14
	v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jz
	E__UUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_234032_958101_82D5E70E 
X-CRM114-Status: GOOD (  10.68  )
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

RnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KCkl0IGlzIHVubmVjZXNzYXJ5IHRv
IGFsbG9jYXRlIGNvbnRpbnVvdXMgcGh5c2ljYWwgbWVtb3J5IGZvciBjYWNoZQpidWZmZXIsIGFu
ZCB3aGVuIGVicGYgcHJvZ3JhbSBpcyB0b28gbGFyZ2UsIGl0IG1heSBjYXVzZSBtZW1vcnkKYWxs
b2NhdGlvbiBmYWlsdXJlLgoKQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5v
cmc+ClNpZ25lZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Ci0tLQogYXJj
aC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8IDQgKystLQogYXJjaC9yaXNjdi9uZXQvYnBm
X2ppdF9jb3JlLmMgICB8IDYgKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2Nv
bXA2NC5jIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwppbmRleCA0MDZlNzc0YjRh
YzMuLjJmMDY3NTJmYjAzNiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21w
NjQuYworKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCkBAIC0xMTk1LDcgKzEx
OTUsNyBAQCBzdGF0aWMgaW50IF9fYXJjaF9wcmVwYXJlX2JwZl90cmFtcG9saW5lKHN0cnVjdCBi
cGZfdHJhbXBfaW1hZ2UgKmltLAogCX0KIAogCWlmIChmbW9kX3JldC0+bnJfbm9kZXMpIHsKLQkJ
YnJhbmNoZXNfb2ZmID0ga3phbGxvY19vYmpzKGludCwgZm1vZF9yZXQtPm5yX25vZGVzKTsKKwkJ
YnJhbmNoZXNfb2ZmID0ga3Z6YWxsb2Nfb2JqcyhpbnQsIGZtb2RfcmV0LT5ucl9ub2Rlcyk7CiAJ
CWlmICghYnJhbmNoZXNfb2ZmKQogCQkJcmV0dXJuIC1FTk9NRU07CiAKQEAgLTEzMDAsNyArMTMw
MCw3IEBAIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBmX3RyYW1wb2xpbmUoc3RydWN0IGJw
Zl90cmFtcF9pbWFnZSAqaW0sCiAKIAlyZXQgPSBjdHgtPm5pbnNuczsKIG91dDoKLQlrZnJlZShi
cmFuY2hlc19vZmYpOworCWt2ZnJlZShicmFuY2hlc19vZmYpOwogCXJldHVybiByZXQ7CiB9CiAK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29yZS5jIGIvYXJjaC9yaXNjdi9u
ZXQvYnBmX2ppdF9jb3JlLmMKaW5kZXggN2NjZTE5MTE4NjE5Li5jYmZjZDI4N2VhMTYgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29yZS5jCisrKyBiL2FyY2gvcmlzY3YvbmV0
L2JwZl9qaXRfY29yZS5jCkBAIC03Miw3ICs3Miw3IEBAIHN0cnVjdCBicGZfcHJvZyAqYnBmX2lu
dF9qaXRfY29tcGlsZShzdHJ1Y3QgYnBmX3ZlcmlmaWVyX2VudiAqZW52LCBzdHJ1Y3QgYnBmX3By
CiAJY3R4LT5hcmVuYV92bV9zdGFydCA9IGJwZl9hcmVuYV9nZXRfa2Vybl92bV9zdGFydChwcm9n
LT5hdXgtPmFyZW5hKTsKIAljdHgtPnVzZXJfdm1fc3RhcnQgPSBicGZfYXJlbmFfZ2V0X3VzZXJf
dm1fc3RhcnQocHJvZy0+YXV4LT5hcmVuYSk7CiAJY3R4LT5wcm9nID0gcHJvZzsKLQljdHgtPm9m
ZnNldCA9IGt6YWxsb2Nfb2JqcyhpbnQsIHByb2ctPmxlbik7CisJY3R4LT5vZmZzZXQgPSBrdnph
bGxvY19vYmpzKGludCwgcHJvZy0+bGVuKTsKIAlpZiAoIWN0eC0+b2Zmc2V0KQogCQlnb3RvIG91
dF9vZmZzZXQ7CiAKQEAgLTE3MCw3ICsxNzAsNyBAQCBzdHJ1Y3QgYnBmX3Byb2cgKmJwZl9pbnRf
aml0X2NvbXBpbGUoc3RydWN0IGJwZl92ZXJpZmllcl9lbnYgKmVudiwgc3RydWN0IGJwZl9wcgog
CQkJY3R4LT5vZmZzZXRbaV0gPSBuaW5zbnNfcnZvZmYoY3R4LT5vZmZzZXRbaV0pOwogCQlicGZf
cHJvZ19maWxsX2ppdGVkX2xpbmZvKHByb2csIGN0eC0+b2Zmc2V0KTsKIG91dF9vZmZzZXQ6Ci0J
CWtmcmVlKGN0eC0+b2Zmc2V0KTsKKwkJa3ZmcmVlKGN0eC0+b2Zmc2V0KTsKIAkJa2ZyZWUoaml0
X2RhdGEpOwogCQlwcm9nLT5hdXgtPmppdF9kYXRhID0gTlVMTDsKIAl9CkBAIC0yMzQsNyArMjM0
LDcgQEAgdm9pZCBicGZfaml0X2ZyZWUoc3RydWN0IGJwZl9wcm9nICpwcm9nKQogCQkgKi8KIAkJ
aWYgKGppdF9kYXRhKSB7CiAJCQlicGZfaml0X2JpbmFyeV9wYWNrX2ZpbmFsaXplKGppdF9kYXRh
LT5yb19oZWFkZXIsIGppdF9kYXRhLT5oZWFkZXIpOwotCQkJa2ZyZWUoaml0X2RhdGEtPmN0eC5v
ZmZzZXQpOworCQkJa3ZmcmVlKGppdF9kYXRhLT5jdHgub2Zmc2V0KTsKIAkJCWtmcmVlKGppdF9k
YXRhKTsKIAkJfQogCQloZHIgPSBicGZfaml0X2JpbmFyeV9wYWNrX2hkcihwcm9nKTsKLS0gCjIu
MzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
