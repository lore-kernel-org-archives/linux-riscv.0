Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F1EC47DDB
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 08:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TuVNsYgFJTcFbSmJZEuKuPqK7FjNGGkhZBzioMEwo34=; b=slwEl7VsBkCnGi
	095l99MMN+3Ek0AmP0JC5GD0xJgbfLD3z1hOGOXUSLQw4OTIWz2RwoNtoWe5SIWb7yBvMkUp5zC64
	yfkKrJ3NUaNI/B0EzxPg3bAa/wUzzSJBOD928LulLp5iZltAjdiQRRkH7au8Nc3+jYMTeBYrtF/S2
	ud7vatgnQsTBSHXiebs+Ky2GJ+upzOY7kJRY75JKMwu0IRKoPZelKjZzfBay8BlCsajaSKn68lyIY
	BUQ5wkRtdEvB8S+n5l/WHGIjjUFpAJHCPrWiCIj+2rVtfFS+FE9mEqkMqIH3nJQgwhU4R36I/b+dx
	8RQ5iIXc0J1vCPf+XpRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVSVU-0000000759J-08f0;
	Thu, 01 Feb 2024 08:33:12 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVSVQ-00000007576-2tD0
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 08:33:10 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4TQXGZ0Qj0z4f3mHc
	for <linux-riscv@lists.infradead.org>; Thu,  1 Feb 2024 16:32:54 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 9458E1A0199
	for <linux-riscv@lists.infradead.org>; Thu,  1 Feb 2024 16:33:00 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with SMTP id gCh0CgA3PnA8V7tlRXylCg--.9426S3;
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
Subject: [PATCH bpf-next v3 1/4] riscv, bpf: Remove redundant ctx->offset initialization
Date: Thu,  1 Feb 2024 08:33:48 +0000
Message-Id: <20240201083351.943121-2-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201083351.943121-1-pulehui@huaweicloud.com>
References: <20240201083351.943121-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgA3PnA8V7tlRXylCg--.9426S3
X-Coremail-Antispam: 1UD129KBjvdXoW7XFW8Jr15KF1fuF45XrW5KFg_yoW3tFX_C3
	4xta4fXrWrJa1qkw1jvr1rXr1qyw1rtFyruF1fXry5C3Z0qw1vy3s7KrnrGry7urn8ZrW8
	WFZ7JrW7Xw1YgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbD8FF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
	0Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWx
	JVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUSYLPUUUUU
	=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_003308_935949_18B15587 
X-CRM114-Status: UNSURE (   6.79  )
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
aXMgYWxyZWFkeSB6ZXJvLWluaXRpYWxpemVkLiBMZXQncyByZW1vdmUgdGhpcyBjb2RlLgoKU2ln
bmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KQWNrZWQtYnk6IEJqw7Zy
biBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+Ci0tLQogYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9j
b3JlLmMgfCA1IC0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvcmUuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9q
aXRfY29yZS5jCmluZGV4IDdiNzBjY2I3ZmVjMy4uYjI3MTI0MGY0OGM5IDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L25ldC9icGZfaml0X2NvcmUuYworKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0
X2NvcmUuYwpAQCAtOTEsMTEgKzkxLDYgQEAgc3RydWN0IGJwZl9wcm9nICpicGZfaW50X2ppdF9j
b21waWxlKHN0cnVjdCBicGZfcHJvZyAqcHJvZykKIAkJZ290byBvdXRfb2Zmc2V0OwogCX0KIAot
CWZvciAoaSA9IDA7IGkgPCBwcm9nLT5sZW47IGkrKykgewotCQlwcmV2X25pbnNucyArPSAzMjsK
LQkJY3R4LT5vZmZzZXRbaV0gPSBwcmV2X25pbnNuczsKLQl9Ci0KIAlmb3IgKGkgPSAwOyBpIDwg
TlJfSklUX0lURVJBVElPTlM7IGkrKykgewogCQlwYXNzKys7CiAJCWN0eC0+bmluc25zID0gMDsK
LS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
