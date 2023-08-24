Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D8DC3DA6F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 01:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dtURpMI+XhgLHmv1tvQwWzD+tqx9x3BFxaImrGf6kKc=; b=g3gahuP5Y2zDc4
	J/nCGcfLJM9dRs/v26n0wJVQUEfO5oB+IwyZwgXQqmUXrmHy/feT1wynLTDeZhOopDbSqUXZvUTAU
	dIDByQb5MZuMBikgnYDYYymKz+nReILDcDDXdVK73XJjClGNfdX6eAANsQU2W9lUUnuNidNjCG+OH
	uDKmyp1ZBkwotXLPxUHODlkMdtKWzbREiPKg32thgIhVlVV1qGwutRSmBU2zUa7Tf5DwLNKJ+468N
	Gaxm/7ksecbv1ynTqSFgT76JEFLstSXZCMpcAvYdS4Ct7tsinFLarMzo5qLD+m3BycFg9s/yXOrVg
	XAj3Dwlq3Bwh9axcn/Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYzQB-001u0t-2X;
	Thu, 24 Aug 2023 01:46:03 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYzQ7-001tyX-2t
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 01:46:01 +0000
Received: from mail02.huawei.com (unknown [172.30.67.169])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4RWQsC71mbz4f3pFp
	for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 09:45:51 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with SMTP id gCh0CgB3TaBNtuZk2HbCBQ--.33536S6;
	Thu, 24 Aug 2023 09:45:53 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Xu Kuohai <xukuohai@huawei.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next v2 4/7] riscv, bpf: Support 32-bit offset jmp insn
Date: Thu, 24 Aug 2023 09:49:58 +0000
Message-Id: <20230824095001.3408573-5-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824095001.3408573-1-pulehui@huaweicloud.com>
References: <20230824095001.3408573-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgB3TaBNtuZk2HbCBQ--.33536S6
X-Coremail-Antispam: 1UD129KBjvdXoW7Wry5Ww4rXry3Jr4UArykAFb_yoWfCwb_Cr
	yxJa4Ig398GFZ8Jw1Uur4Fvryjk393GF1DZ34SgFWUC3Z8W3Wvy34kKr9Iqryxur4xtFZx
	Zrn3Ja9Iyw4agjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb9kFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M280x2IEY4vEnII2IxkI6r1a6r45M28IrcIa0xkI8V
	A2jI8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJ
	M28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2I
	x0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK
	6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4
	xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8
	JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20V
	AGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
	c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUv
	cSsGvfC2KfnxnUUI43ZEXa7sRiVbyDUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_184600_097325_331E37F0 
X-CRM114-Status: UNSURE (   7.80  )
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

RnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KCkFkZCBzdXBwb3J0IDMyLWJpdCBv
ZmZzZXQgam1wIGluc3RydWN0aW9uIGZvciBSVjY0LgoKU2lnbmVkLW9mZi1ieTogUHUgTGVodWkg
PHB1bGVodWlAaHVhd2VpLmNvbT4KQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5l
bC5vcmc+Ci0tLQogYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8IDYgKysrKystCiAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9q
aXRfY29tcDY0LmMKaW5kZXggYmNmMWU3NTA5Y2I5Li4wNzY2MTlmNGFhODIgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBm
X2ppdF9jb21wNjQuYwpAQCAtMTMyNyw3ICsxMzI3LDExIEBAIGludCBicGZfaml0X2VtaXRfaW5z
bihjb25zdCBzdHJ1Y3QgYnBmX2luc24gKmluc24sIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4
LAogCiAJLyogSlVNUCBvZmYgKi8KIAljYXNlIEJQRl9KTVAgfCBCUEZfSkE6Ci0JCXJ2b2ZmID0g
cnZfb2Zmc2V0KGksIG9mZiwgY3R4KTsKKwljYXNlIEJQRl9KTVAzMiB8IEJQRl9KQToKKwkJaWYg
KEJQRl9DTEFTUyhjb2RlKSA9PSBCUEZfSk1QKQorCQkJcnZvZmYgPSBydl9vZmZzZXQoaSwgb2Zm
LCBjdHgpOworCQllbHNlCisJCQlydm9mZiA9IHJ2X29mZnNldChpLCBpbW0sIGN0eCk7CiAJCXJl
dCA9IGVtaXRfanVtcF9hbmRfbGluayhSVl9SRUdfWkVSTywgcnZvZmYsIHRydWUsIGN0eCk7CiAJ
CWlmIChyZXQpCiAJCQlyZXR1cm4gcmV0OwotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
