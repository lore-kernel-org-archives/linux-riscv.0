Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E07C47258
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 13:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=so8tjKb2wT5yTSfoNq19F7vGMao7d4c1W4AbIyoad1Q=; b=KT0Us/Qzw3ew9W
	WW9svDc9RY0oUWUpEMYMMjuZCbdoq/G4hERrRN0qx3vCt/6GGTsNpIU3pqXw0hXJQsP6NOQUoorj6
	stI34b2G8TAe7K8MRkNlgxkNbjNajgGv8B1qvOdu4x86OZ9jRHo5hP4BBxFc4dIAmW0ef2zTFpbTf
	r3SsiYqslb+s2OIt4iJj/JQG4f5qL0UH9slflTTdnW6TBV3BPgV4X6m9yZ3XWugM50AAiKMeFSBgR
	8DLXZq4C9nMb6kbfI0ZvHLqj+nG9Wns6qIcsL6ZgE4bH2g/ZyiA0c1igcsFd3qAaegVaY73KXc7Tx
	gdvKyzWzonzDx/6tlvtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMlJ-0091IU-0V;
	Mon, 15 Jan 2024 13:12:21 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMlD-0091Ev-2D
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 13:12:18 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4TDCGT5pgvz4f3lVb
	for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 21:12:01 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id D52D81A0CAE
	for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 21:12:07 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with SMTP id gCh0CgBnu20iL6VlSeWtAw--.15591S3;
	Mon, 15 Jan 2024 21:12:07 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH RESEND bpf-next v3 1/6] riscv, bpf: Unify 32-bit sign-extension to emit_sextw
Date: Mon, 15 Jan 2024 13:12:30 +0000
Message-Id: <20240115131235.2914289-2-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240115131235.2914289-1-pulehui@huaweicloud.com>
References: <20240115131235.2914289-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgBnu20iL6VlSeWtAw--.15591S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww1xZrykCryrKw4xuFyrXrb_yoW5Jr4xpF
	45Krs3CrZ2qF4FqasrtFsrWr45GFsYvFW7KryfW398Ja1IqFsrG3WFkw4ayry5JFyrWa1r
	ZFWqkr12k3WvgrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBK14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
	AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUj3Ef7UUUUU=
	=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_051216_276588_80CA17FD 
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

RnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KCkZvciBjb2RlIHVuaWZpY2F0aW9u
LCBhZGQgZW1pdF9zZXh0dyB3cmFwcGVyIHRvIHVuaWZ5IGFsbCB0aGUgMzItYml0CnNpZ24tZXh0
ZW5zaW9uIG9wZXJhdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3
ZWkuY29tPgpBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KLS0tCiBh
cmNoL3Jpc2N2L25ldC9icGZfaml0LmggICAgICAgIHwgIDUgKysrKysKIGFyY2gvcmlzY3YvbmV0
L2JwZl9qaXRfY29tcDY0LmMgfCAxMCArKysrKy0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQv
YnBmX2ppdC5oIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oCmluZGV4IGE1Y2UxYWI3NmVjZS4u
ZjlmOGQ4NmU3NjJmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0LmgKKysrIGIv
YXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oCkBAIC0xMDg3LDYgKzEwODcsMTEgQEAgc3RhdGljIGlu
bGluZSB2b2lkIGVtaXRfc3Vidyh1OCByZCwgdTggcnMxLCB1OCByczIsIHN0cnVjdCBydl9qaXRf
Y29udGV4dCAqY3R4KQogCQllbWl0KHJ2X3N1YncocmQsIHJzMSwgcnMyKSwgY3R4KTsKIH0KIAor
c3RhdGljIGlubGluZSB2b2lkIGVtaXRfc2V4dHcodTggcmQsIHU4IHJzLCBzdHJ1Y3QgcnZfaml0
X2NvbnRleHQgKmN0eCkKK3sKKwllbWl0X2FkZGl3KHJkLCBycywgMCwgY3R4KTsKK30KKwogI2Vu
ZGlmIC8qIF9fcmlzY3ZfeGxlbiA9PSA2NCAqLwogCiB2b2lkIGJwZl9qaXRfYnVpbGRfcHJvbG9n
dWUoc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpOwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9u
ZXQvYnBmX2ppdF9jb21wNjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKaW5k
ZXggNThkYzY0ZGQ5NGE4Li43M2Y4YTA5MzhhZGEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0
L2JwZl9qaXRfY29tcDY0LmMKKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwpA
QCAtNDE3LDggKzQxNyw4IEBAIHN0YXRpYyB2b2lkIGVtaXRfemV4dF8zMl9yZF9ycyh1OCAqcmQs
IHU4ICpycywgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCiAKIHN0YXRpYyB2b2lkIGVtaXRf
c2V4dF8zMl9yZF9ycyh1OCAqcmQsIHU4ICpycywgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgp
CiB7Ci0JZW1pdF9hZGRpdyhSVl9SRUdfVDIsICpyZCwgMCwgY3R4KTsKLQllbWl0X2FkZGl3KFJW
X1JFR19UMSwgKnJzLCAwLCBjdHgpOworCWVtaXRfc2V4dHcoUlZfUkVHX1QyLCAqcmQsIGN0eCk7
CisJZW1pdF9zZXh0dyhSVl9SRUdfVDEsICpycywgY3R4KTsKIAkqcmQgPSBSVl9SRUdfVDI7CiAJ
KnJzID0gUlZfUkVHX1QxOwogfQpAQCAtNDMzLDcgKzQzMyw3IEBAIHN0YXRpYyB2b2lkIGVtaXRf
emV4dF8zMl9yZF90MSh1OCAqcmQsIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4KQogCiBzdGF0
aWMgdm9pZCBlbWl0X3NleHRfMzJfcmQodTggKnJkLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0
eCkKIHsKLQllbWl0X2FkZGl3KFJWX1JFR19UMiwgKnJkLCAwLCBjdHgpOworCWVtaXRfc2V4dHco
UlZfUkVHX1QyLCAqcmQsIGN0eCk7CiAJKnJkID0gUlZfUkVHX1QyOwogfQogCkBAIC0xMTAzLDcg
KzExMDMsNyBAQCBpbnQgYnBmX2ppdF9lbWl0X2luc24oY29uc3Qgc3RydWN0IGJwZl9pbnNuICpp
bnNuLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCwKIAkJCWVtaXRfc3JhaShyZCwgUlZfUkVH
X1QxLCA2NCAtIGluc24tPm9mZiwgY3R4KTsKIAkJCWJyZWFrOwogCQljYXNlIDMyOgotCQkJZW1p
dF9hZGRpdyhyZCwgcnMsIDAsIGN0eCk7CisJCQllbWl0X3NleHR3KHJkLCBycywgY3R4KTsKIAkJ
CWJyZWFrOwogCQl9CiAJCWlmICghaXM2NCAmJiAhYXV4LT52ZXJpZmllcl96ZXh0KQpAQCAtMTUw
Myw3ICsxNTAzLDcgQEAgaW50IGJwZl9qaXRfZW1pdF9pbnNuKGNvbnN0IHN0cnVjdCBicGZfaW5z
biAqaW5zbiwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgsCiAJCSAqIGFzIHQxIGlzIHVzZWQg
b25seSBpbiBjb21wYXJpc29uIGFnYWluc3QgemVyby4KIAkJICovCiAJCWlmICghaXM2NCAmJiBp
bW0gPCAwKQotCQkJZW1pdF9hZGRpdyhSVl9SRUdfVDEsIFJWX1JFR19UMSwgMCwgY3R4KTsKKwkJ
CWVtaXRfc2V4dHcoUlZfUkVHX1QxLCBSVl9SRUdfVDEsIGN0eCk7CiAJCWUgPSBjdHgtPm5pbnNu
czsKIAkJcnZvZmYgLT0gbmluc25zX3J2b2ZmKGUgLSBzKTsKIAkJZW1pdF9icmFuY2goQlBGX0pO
RSwgUlZfUkVHX1QxLCBSVl9SRUdfWkVSTywgcnZvZmYsIGN0eCk7Ci0tIAoyLjM0LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
