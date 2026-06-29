Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF4CC44501
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 13:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LAEZhZDaRa+BTVoSEL9sj6y2NkTU20823mia+cINYOI=; b=gWSh047pDCHErD
	T8cp1YGn9sNuuT5gwA/ZReRI13q6ixorNyB5azk4dURfV0Hb0+Gh42ImAHRYl5ZyvMmdIV+Prb3pF
	nOlF+EbKYT1n2SLJ8wg2BXzANk8QCnhGaz8lD7vWF/8Fp1iWOeVaNtoSnKuDgqv45cDjNuj9PxWy0
	zmdM2tgbshllA4E/FmeujtJiuIkN4ShXoN+JqqEVK3cAN2Eqy/oiPsww0HffRt/epWNtTaKdzzWs4
	v5gGnKE2+wFjaQ7JTPQio92X7a+TBJh2jBf2ILvwN9jPNDYgtYLaAInN1wU0sPBS0M+kb4Bf6hngX
	m5309JAhvL8ZlbXWPNmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCTr-0000000Envn-2rmS;
	Mon, 29 Jun 2026 13:56:59 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCTm-0000000Enn8-1UEd
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 13:56:55 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gpnqQ4NzfzYQv0S
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 21:55:46 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id C10BD40570
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 21:56:37 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgCXBfOUeUJqDlQCAQ--.44260S4;
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
Subject: [PATCH bpf-next v4 2/6] riscv, bpf: Remove redundant ctx->offset initialization
Date: Mon, 29 Jun 2026 14:00:44 +0000
Message-Id: <20260629140048.733346-3-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629140048.733346-1-pulehui@huaweicloud.com>
References: <20260629140048.733346-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgCXBfOUeUJqDlQCAQ--.44260S4
X-Coremail-Antispam: 1UD129KBjvdXoW7XFW8Jr15KF1fuF45WryxGrg_yoWfArb_Ca
	4xta4xW3yfJa1vkr1j9r1fZr1qkw1rtF1ruF1fXryUA3Z8tw10y3s3tr17GrW7urn5ZrW8
	WrZ7JrW7Xw1YgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbq8YFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r15M2
	8IrcIa0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK
	021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r
	4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
	0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxV
	W8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUIID7
	DUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_065654_616204_1D13C7AF 
X-CRM114-Status: UNSURE (   7.77  )
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

RnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KClRoZXJlIGlzIG5vIGdhaW4gaW4g
aW5pdGlhbGl6aW5nIGN0eC0+b2Zmc2V0IGFuZCBwcmV2X2luc25zLCBhbmQKY3R4LT5vZmZzZXQg
aXMgYWxyZWFkeSB6ZXJvLWluaXRpYWxpemVkLiBMZXQncyByZW1vdmUgdGhpcyBjb2RlLgoKQWNr
ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IFB1
IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Ci0tLQogYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9j
b3JlLmMgfCA1IC0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvcmUuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9q
aXRfY29yZS5jCmluZGV4IDQzNjVkMDdhYWY1NC4uNDUyY2EwOGUzNWE3IDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L25ldC9icGZfaml0X2NvcmUuYworKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0
X2NvcmUuYwpAQCAtNzksMTEgKzc5LDYgQEAgc3RydWN0IGJwZl9wcm9nICpicGZfaW50X2ppdF9j
b21waWxlKHN0cnVjdCBicGZfdmVyaWZpZXJfZW52ICplbnYsIHN0cnVjdCBicGZfcHIKIAlpZiAo
YnVpbGRfYm9keShjdHgsIGV4dHJhX3Bhc3MsIE5VTEwpKQogCQlnb3RvIG91dF9vZmZzZXQ7CiAK
LQlmb3IgKGkgPSAwOyBpIDwgcHJvZy0+bGVuOyBpKyspIHsKLQkJcHJldl9uaW5zbnMgKz0gMzI7
Ci0JCWN0eC0+b2Zmc2V0W2ldID0gcHJldl9uaW5zbnM7Ci0JfQotCiAJZm9yIChpID0gMDsgaSA8
IE5SX0pJVF9JVEVSQVRJT05TOyBpKyspIHsKIAkJcGFzcysrOwogCQljdHgtPm5pbnNucyA9IDA7
Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
