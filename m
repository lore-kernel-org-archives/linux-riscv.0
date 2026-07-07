Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F47FC43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 14:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gIoMR91cG4XILVUW1tkmnZ8mFUTRBe9LUl7b2pA03cM=; b=4wrY4WC2SRV84R
	KLvIEN/jFyQKQ0KJsWg8/DlZza+lW4Rs/H/F/hvT9NBKlqu1XN83pc8yTLQYDhU2lLtTbnlHCI0RA
	9clY6L/BMelI2Fjqx4wuKb5nC2qamGiWlLNN8PMky3d/JfU4Hlh9EUMSiiZ+DdnBGorh8O73kH3x2
	N7HS4F1L3gymP9HeAtBgQFI7PPAaNbfZ7Ok2pR66WiBQ0JC1YH7klqRNf7i/r3DQ0qOOKWtp82574
	V1Tm7+1awUIT6P119Stgz7Nk1Kp5XMHWOj3OP6W1Cyvb4fD4us87Mz2FSbAxb1zj4kwOgx66ug85B
	sLL4OZqoujqIhayGnZbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6ep-0000000F9R7-1OXy;
	Tue, 07 Jul 2026 14:20:19 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6ej-0000000F8BB-471L
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 14:20:17 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gvjxK5q7hzYQtjx
	for <linux-riscv@lists.infradead.org>; Tue,  7 Jul 2026 22:17:57 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 3F27C4093A
	for <linux-riscv@lists.infradead.org>; Tue,  7 Jul 2026 22:18:01 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP1 (Coremail) with UTF8SMTPA id cCh0CgBnd3OXCk1qwUWNAQ--.43005S4;
	Tue, 07 Jul 2026 22:18:01 +0800 (CST)
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
Subject: [PATCH bpf-next v5 2/6] riscv, bpf: Using kvzalloc_objs to allocate cache buffer
Date: Tue,  7 Jul 2026 14:22:15 +0000
Message-Id: <20260707142219.2871758-3-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707142219.2871758-1-pulehui@huaweicloud.com>
References: <20260707142219.2871758-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgBnd3OXCk1qwUWNAQ--.43005S4
X-Coremail-Antispam: 1UD129KBjvJXoW7WFW3Cw13GrWfGw4Utr4fXwb_yoW8uF1UpF
	4DGrnxCrZYvw18WF1kta18WFy5ta1DW3W7GFWUC34fWFyqqrWUX3Z5Cw1Y9a45CFW0y34r
	u3yYvrnI934kJ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ew
	Av7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY
	6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14
	v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jI
	sjbUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_072014_420605_3C660EA1 
X-CRM114-Status: GOOD (  10.22  )
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
X2ppdF9jb3JlLmMgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21w
NjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKaW5kZXggNDA2ZTc3NGI0YWMz
Li4yZjA2NzUyZmIwMzYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0
LmMKKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwpAQCAtMTE5NSw3ICsxMTk1
LDcgQEAgc3RhdGljIGludCBfX2FyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGluZShzdHJ1Y3QgYnBm
X3RyYW1wX2ltYWdlICppbSwKIAl9CiAKIAlpZiAoZm1vZF9yZXQtPm5yX25vZGVzKSB7Ci0JCWJy
YW5jaGVzX29mZiA9IGt6YWxsb2Nfb2JqcyhpbnQsIGZtb2RfcmV0LT5ucl9ub2Rlcyk7CisJCWJy
YW5jaGVzX29mZiA9IGt2emFsbG9jX29ianMoaW50LCBmbW9kX3JldC0+bnJfbm9kZXMpOwogCQlp
ZiAoIWJyYW5jaGVzX29mZikKIAkJCXJldHVybiAtRU5PTUVNOwogCkBAIC0xMzAwLDcgKzEzMDAs
NyBAQCBzdGF0aWMgaW50IF9fYXJjaF9wcmVwYXJlX2JwZl90cmFtcG9saW5lKHN0cnVjdCBicGZf
dHJhbXBfaW1hZ2UgKmltLAogCiAJcmV0ID0gY3R4LT5uaW5zbnM7CiBvdXQ6Ci0Ja2ZyZWUoYnJh
bmNoZXNfb2ZmKTsKKwlrdmZyZWUoYnJhbmNoZXNfb2ZmKTsKIAlyZXR1cm4gcmV0OwogfQogCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvcmUuYyBiL2FyY2gvcmlzY3YvbmV0
L2JwZl9qaXRfY29yZS5jCmluZGV4IGNlM2JkMzc2MmUwOC4uMzY3YWU5MjNlYTQwIDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvcmUuYworKysgYi9hcmNoL3Jpc2N2L25ldC9i
cGZfaml0X2NvcmUuYwpAQCAtNzIsNyArNzIsNyBAQCBzdHJ1Y3QgYnBmX3Byb2cgKmJwZl9pbnRf
aml0X2NvbXBpbGUoc3RydWN0IGJwZl92ZXJpZmllcl9lbnYgKmVudiwgc3RydWN0IGJwZl9wcgog
CWN0eC0+YXJlbmFfdm1fc3RhcnQgPSBicGZfYXJlbmFfZ2V0X2tlcm5fdm1fc3RhcnQocHJvZy0+
YXV4LT5hcmVuYSk7CiAJY3R4LT51c2VyX3ZtX3N0YXJ0ID0gYnBmX2FyZW5hX2dldF91c2VyX3Zt
X3N0YXJ0KHByb2ctPmF1eC0+YXJlbmEpOwogCWN0eC0+cHJvZyA9IHByb2c7Ci0JY3R4LT5vZmZz
ZXQgPSBremFsbG9jX29ianMoaW50LCBwcm9nLT5sZW4pOworCWN0eC0+b2Zmc2V0ID0ga3Z6YWxs
b2Nfb2JqcyhpbnQsIHByb2ctPmxlbik7CiAJaWYgKCFjdHgtPm9mZnNldCkKIAkJZ290byBvdXRf
b2Zmc2V0OwogCkBAIC0xNzAsNyArMTcwLDcgQEAgc3RydWN0IGJwZl9wcm9nICpicGZfaW50X2pp
dF9jb21waWxlKHN0cnVjdCBicGZfdmVyaWZpZXJfZW52ICplbnYsIHN0cnVjdCBicGZfcHIKIAkJ
CWN0eC0+b2Zmc2V0W2ldID0gbmluc25zX3J2b2ZmKGN0eC0+b2Zmc2V0W2ldKTsKIAkJYnBmX3By
b2dfZmlsbF9qaXRlZF9saW5mbyhwcm9nLCBjdHgtPm9mZnNldCk7CiBvdXRfb2Zmc2V0OgotCQlr
ZnJlZShjdHgtPm9mZnNldCk7CisJCWt2ZnJlZShjdHgtPm9mZnNldCk7CiAJCWtmcmVlKGppdF9k
YXRhKTsKIAkJcHJvZy0+YXV4LT5qaXRfZGF0YSA9IE5VTEw7CiAJfQotLSAKMi4zNC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
