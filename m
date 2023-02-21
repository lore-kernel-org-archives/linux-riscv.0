Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B8DC6379F
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 14:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JWo4YComoROhB1NsADEeTEGvUijPX0l75rs14OqUwlM=; b=fSpAH2/GKZc6B8
	b8+DbNKU8ezWfshojFlbOLGcbYVmNHl1Yy7MCBdOy1xq/cNjo/3MFCyNv2waQaOsk0G3rZwv6u56t
	ahWCiSvoGlC26aNsTL6ssNnUw3mgwVVWL1MjZ9nAQfiOhEzZu1eA+74v5FE8SMOFmYAxqtPil/pai
	n8ujsh20MFZ8E5ZLha9imyJcf0+S4LV3OZQrozChUqkjx1Bf6a18H33cCCetA44ebOAUvvxvrmHDq
	fpMtSG8a/jvyQ2oghtIIoih7sINToYcDYGp9p5lALIkU3BJGBEQe+ncoyIZO3vwUNDDDnXHj95QkH
	d/aRQMhaqCKrC3YXReMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUTGI-008QOO-SV; Tue, 21 Feb 2023 14:04:54 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUTGC-008QJ2-PF
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 14:04:51 +0000
Received: from mail02.huawei.com (unknown [172.30.67.143])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4PLgyP1Ql7z4f3y1F
	for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 22:04:29 +0800 (CST)
Received: from localhost.localdomain (unknown [10.67.175.61])
	by APP2 (Coremail) with SMTP id Syh0CgAnFuRtz_Rj_qv6Dw--.43008S2;
	Tue, 21 Feb 2023 22:04:31 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
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
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next v3] riscv, bpf: Add kfunc support for RV64
Date: Tue, 21 Feb 2023 22:06:56 +0800
Message-Id: <20230221140656.3480496-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgAnFuRtz_Rj_qv6Dw--.43008S2
X-Coremail-Antispam: 1UD129KBjvdXoWrury5AFWkAFy8Cr47Zr43Wrg_yoWDArg_Cr
	Z7ta4Iy398Ja1xJF4j9r4fZrykG393WFy8Xrn7uryjywn8WF1Ut34kKr97Gry7Zr1FyrWx
	Zrn3Ja92qw42qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxkFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_Wryl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
	QVy7UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_060449_115389_99B281CD 
X-CRM114-Status: UNSURE (   8.12  )
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

RnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KClRoaXMgcGF0Y2ggYWRkcyBrZXJu
ZWwgZnVuY3Rpb24gY2FsbCBzdXBwb3J0IGZvciBSVjY0LiBTaW5jZSB0aGUgb2Zmc2V0CmZyb20g
UlY2NCBrZXJuZWwgYW5kIG1vZHVsZSBmdW5jdGlvbnMgdG8gYnBmIHByb2dyYW1zIGlzIGFsbW9z
dCB3aXRoaW4KdGhlIHJhbmdlIG9mIHMzMiwgdGhlIGN1cnJlbnQgaW5mcmFzdHJ1Y3R1cmUgb2Yg
UlY2NCBpcyBhbHJlYWR5CnN1ZmZpY2llbnQgZm9yIGtmdW5jLCBzbyBsZXQncyB0dXJuIGl0IG9u
LgoKU3VnZ2VzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+ClNpZ25l
ZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+CkFja2VkLWJ5OiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Ci0tLQp2MzoKLSByZXdyaXRlIGNvbW1pdCBtZXNz
YWdlIHRvIG1ha2UgbW9yZSBzZW5zZS4KLSBBZGQgQWNrZWQtYnkgb2YgQmrDtnJuLgoKIGFyY2gv
cmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQu
YyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKaW5kZXggZjVhNjY4NzM2Yzc5Li5h
OTI3MDM2NmRjNTcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMK
KysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwpAQCAtMTc1MSwzICsxNzUxLDgg
QEAgdm9pZCBicGZfaml0X2J1aWxkX2VwaWxvZ3VlKHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4
KQogewogCV9fYnVpbGRfZXBpbG9ndWUoZmFsc2UsIGN0eCk7CiB9CisKK2Jvb2wgYnBmX2ppdF9z
dXBwb3J0c19rZnVuY19jYWxsKHZvaWQpCit7CisJcmV0dXJuIHRydWU7Cit9Ci0tIAoyLjI1LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
