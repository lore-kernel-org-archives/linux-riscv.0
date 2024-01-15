Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0558C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 13:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bb9LaLaUsURVOAh2hDJfGscONOQyrbVaFyrOEkWQEqg=; b=riu4fA1SambGcS
	hy5OjdxBFsw/UDbI08bAxdesup9y2Hd6pZW3jq7Ol8iyTH2+kJTV9jspfd+0w8EpFsiKUoQwxZiZJ
	yojXxQ5oF0EoQmLcTg+z67adHv8KvFYaGLEUSMkqBdC/J2zSYSA4pPazAHX254GAo5XKc14FN8NZy
	LxnGZhvDiFjCE8bHaRPcf95T1x3329QDO7/98W/y3DZLOzxBDtS9YBg5b7Xu4sPqbM25UdLO2B2My
	6OGmX4+I9xSkjDvnO7zKnwFy1uBd4QsgaaNbT+azkJCebCBpbtHpHcDoNpbHDhht9nQy63UUhwu0/
	8mdMLQ23QIoUxoexk/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMlG-0091Ge-1F;
	Mon, 15 Jan 2024 13:12:18 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMlC-0091EO-08
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 13:12:16 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4TDCGZ1z8Bz4f3jqX
	for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 21:12:06 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 608BA1A016E
	for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 21:12:08 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with SMTP id gCh0CgBnu20iL6VlSeWtAw--.15591S7;
	Mon, 15 Jan 2024 21:12:08 +0800 (CST)
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
Subject: [PATCH RESEND bpf-next v3 5/6] riscv, bpf: Optimize sign-extention mov insns with Zbb support
Date: Mon, 15 Jan 2024 13:12:34 +0000
Message-Id: <20240115131235.2914289-6-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240115131235.2914289-1-pulehui@huaweicloud.com>
References: <20240115131235.2914289-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgBnu20iL6VlSeWtAw--.15591S7
X-Coremail-Antispam: 1UD129KBjvJXoW7KryDur1xJF48AF18JFy5Arb_yoW8CF1kpF
	WUGrn3CrWvqF1fKF9xtF47Wr15GF4vvF17KF47K398ta1Iqr4DGw1Fkw12yF98GFy8W3Wr
	WFWjkry3C3Wvva7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUl
	2NtUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_051214_411897_B9642183 
X-CRM114-Status: UNSURE (   7.85  )
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

RnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KCkFkZCA4LWJpdCBhbmQgMTYtYml0
IHNpZ24tZXh0ZW50aW9uIHdyYXBlciB3aXRoIFpiYiBzdXBwb3J0IHRvIG9wdGltaXplCnNpZ24t
ZXh0ZW5zaW9uIG1vdiBpbnN0cnVjdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVs
ZWh1aUBodWF3ZWkuY29tPgpBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9y
Zz4KLS0tCiBhcmNoL3Jpc2N2L25ldC9icGZfaml0LmggICAgICAgIHwgMjIgKysrKysrKysrKysr
KysrKysrKysrKwogYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8ICA1ICsrKy0tCiAy
IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5o
CmluZGV4IDUxZjZkMjE0MDg2Zi4uYjAwYzVjMDU5MWQyIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L25ldC9icGZfaml0LmgKKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oCkBAIC0xMTE5LDYg
KzExMTksMjggQEAgc3RhdGljIGlubGluZSB2b2lkIGVtaXRfc3Vidyh1OCByZCwgdTggcnMxLCB1
OCByczIsIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4KQogCQllbWl0KHJ2X3N1YncocmQsIHJz
MSwgcnMyKSwgY3R4KTsKIH0KIAorc3RhdGljIGlubGluZSB2b2lkIGVtaXRfc2V4dGIodTggcmQs
IHU4IHJzLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkKK3sKKwlpZiAocnZ6YmJfZW5hYmxl
ZCgpKSB7CisJCWVtaXQocnZ6YmJfc2V4dGIocmQsIHJzKSwgY3R4KTsKKwkJcmV0dXJuOworCX0K
KworCWVtaXRfc2xsaShyZCwgcnMsIDU2LCBjdHgpOworCWVtaXRfc3JhaShyZCwgcmQsIDU2LCBj
dHgpOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgZW1pdF9zZXh0aCh1OCByZCwgdTggcnMsIHN0
cnVjdCBydl9qaXRfY29udGV4dCAqY3R4KQoreworCWlmIChydnpiYl9lbmFibGVkKCkpIHsKKwkJ
ZW1pdChydnpiYl9zZXh0aChyZCwgcnMpLCBjdHgpOworCQlyZXR1cm47CisJfQorCisJZW1pdF9z
bGxpKHJkLCBycywgNDgsIGN0eCk7CisJZW1pdF9zcmFpKHJkLCByZCwgNDgsIGN0eCk7Cit9CisK
IHN0YXRpYyBpbmxpbmUgdm9pZCBlbWl0X3NleHR3KHU4IHJkLCB1OCBycywgc3RydWN0IHJ2X2pp
dF9jb250ZXh0ICpjdHgpCiB7CiAJZW1pdF9hZGRpdyhyZCwgcnMsIDAsIGN0eCk7CmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIGIvYXJjaC9yaXNjdi9uZXQvYnBm
X2ppdF9jb21wNjQuYwppbmRleCBkOTA3ODQ2NzQ2NzcuLjE4YmJmODEyMmViMyAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYworKysgYi9hcmNoL3Jpc2N2L25ldC9i
cGZfaml0X2NvbXA2NC5jCkBAIC0xMDczLDkgKzEwNzMsMTAgQEAgaW50IGJwZl9qaXRfZW1pdF9p
bnNuKGNvbnN0IHN0cnVjdCBicGZfaW5zbiAqaW5zbiwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpj
dHgsCiAJCQllbWl0X212KHJkLCBycywgY3R4KTsKIAkJCWJyZWFrOwogCQljYXNlIDg6CisJCQll
bWl0X3NleHRiKHJkLCBycywgY3R4KTsKKwkJCWJyZWFrOwogCQljYXNlIDE2OgotCQkJZW1pdF9z
bGxpKFJWX1JFR19UMSwgcnMsIDY0IC0gaW5zbi0+b2ZmLCBjdHgpOwotCQkJZW1pdF9zcmFpKHJk
LCBSVl9SRUdfVDEsIDY0IC0gaW5zbi0+b2ZmLCBjdHgpOworCQkJZW1pdF9zZXh0aChyZCwgcnMs
IGN0eCk7CiAJCQlicmVhazsKIAkJY2FzZSAzMjoKIAkJCWVtaXRfc2V4dHcocmQsIHJzLCBjdHgp
OwotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
