Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AC8C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 13:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJEMtN3/7PE9s6cLNjRpsfzw9lDJcf92C7LYwaooP1A=; b=nS2Fq0odCm5gt3
	2Hr+1sTKCOi/Ox9muUxBWRAOZRI73Eg1fufAe8YYxuer5EPIhcK1GK0mo49D5TbpXAK/Bn9MyLAk3
	ak1TRcQqFs/WZyifCVQ8XUdwie/ttkjojwZq0gRnfFk84B0Lo0EkhDZe9B/bmT6FU5jaYU+KqTSor
	35a1fWBVshx2jRbKTzwsH4AGRof8QGJu2DpgISxaAiHgSPxlfnJiDVtoHevmawdNCJWZuDS3t73H/
	65bQa5WG1otfCJDnYcwrwcIbh96icJrUHNfQ3GmPMXgfhC4KnWFYj28o3XFeiXfS141tKdA3qf9lr
	GkZ2ZG+eki/tJBo6yPuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCTo-0000000Enrl-0nAr;
	Mon, 29 Jun 2026 13:56:56 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCTh-0000000EnnC-0ilC
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 13:56:52 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gpnrH2LWNzKHMdp
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 21:56:31 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id D0E8940599
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 21:56:37 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgCXBfOUeUJqDlQCAQ--.44260S5;
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
Subject: [PATCH bpf-next v4 3/6] riscv, bpf: Using kvzalloc_objs to allocate cache buffer
Date: Mon, 29 Jun 2026 14:00:45 +0000
Message-Id: <20260629140048.733346-4-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629140048.733346-1-pulehui@huaweicloud.com>
References: <20260629140048.733346-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgCXBfOUeUJqDlQCAQ--.44260S5
X-Coremail-Antispam: 1UD129KBjvJXoW7WFW3Cw13GrWfGw4Utr4fXwb_yoW8uF1UpF
	4DGrnxCrZYvw4kWF1ktF48WFy3ta1DW3W7GFWjk34fXFyqqrWUX3Z5Cw1Y9Fy5CFW0yw1r
	u3yY9rnI934kJ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI
	0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU04x
	RDUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_065649_581348_755CF1BC 
X-CRM114-Status: GOOD (  10.11  )
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
NjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKaW5kZXggZWJmZjAzODhjM2Ez
Li42OTUxMmQ5M2NhNGEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0
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
L2JwZl9qaXRfY29yZS5jCmluZGV4IDQ1MmNhMDhlMzVhNy4uYzFkNmNjN2E5MTM1IDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvcmUuYworKysgYi9hcmNoL3Jpc2N2L25ldC9i
cGZfaml0X2NvcmUuYwpAQCAtNzIsNyArNzIsNyBAQCBzdHJ1Y3QgYnBmX3Byb2cgKmJwZl9pbnRf
aml0X2NvbXBpbGUoc3RydWN0IGJwZl92ZXJpZmllcl9lbnYgKmVudiwgc3RydWN0IGJwZl9wcgog
CWN0eC0+YXJlbmFfdm1fc3RhcnQgPSBicGZfYXJlbmFfZ2V0X2tlcm5fdm1fc3RhcnQocHJvZy0+
YXV4LT5hcmVuYSk7CiAJY3R4LT51c2VyX3ZtX3N0YXJ0ID0gYnBmX2FyZW5hX2dldF91c2VyX3Zt
X3N0YXJ0KHByb2ctPmF1eC0+YXJlbmEpOwogCWN0eC0+cHJvZyA9IHByb2c7Ci0JY3R4LT5vZmZz
ZXQgPSBremFsbG9jX29ianMoaW50LCBwcm9nLT5sZW4pOworCWN0eC0+b2Zmc2V0ID0ga3Z6YWxs
b2Nfb2JqcyhpbnQsIHByb2ctPmxlbik7CiAJaWYgKCFjdHgtPm9mZnNldCkKIAkJZ290byBvdXRf
b2Zmc2V0OwogCkBAIC0xNjQsNyArMTY0LDcgQEAgc3RydWN0IGJwZl9wcm9nICpicGZfaW50X2pp
dF9jb21waWxlKHN0cnVjdCBicGZfdmVyaWZpZXJfZW52ICplbnYsIHN0cnVjdCBicGZfcHIKIAkJ
CWN0eC0+b2Zmc2V0W2ldID0gbmluc25zX3J2b2ZmKGN0eC0+b2Zmc2V0W2ldKTsKIAkJYnBmX3By
b2dfZmlsbF9qaXRlZF9saW5mbyhwcm9nLCBjdHgtPm9mZnNldCk7CiBvdXRfb2Zmc2V0OgotCQlr
ZnJlZShjdHgtPm9mZnNldCk7CisJCWt2ZnJlZShjdHgtPm9mZnNldCk7CiAJCWtmcmVlKGppdF9k
YXRhKTsKIAkJcHJvZy0+YXV4LT5qaXRfZGF0YSA9IE5VTEw7CiAJfQotLSAKMi4zNC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
