Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4145DC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 04:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qo8XAHdVjnN/VLnCYKxvUtAC5Oqf1Se1IqQm0kOtL9A=; b=CLHQIK8roiBtSc
	R1pT5s3E/m4EEnr8IkWToVkGNtC3UNRELg3cf/I8u/xvNQEi8OMnzZQ/8Vvs1/ocsFJtWcJ2DMnxw
	hyT4JFowLPHyV7y5CLg6LRVWmEzye1k4Mnr+aTO1+Zw2dXYvoRyEEmNvEtX5ryQeDeQ3nlYZeM0Xt
	Y6YIumqMZF+HrPeXAw25J05Jg44wnIj5U3IjBJhrPgPLQcRe81f/P4cu4wRdDGeSTiJUgq+Cc7Kel
	GYYHQD8Vx3lgNj3+2/2+ev12QZ4MmZMcksTdEl2Q866hXhZ7iXXoyPG8IliOR7WBsJOw6Nqc6ghpZ
	oJq2D4GP+y1FFZdVVrAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUfRA-0000000FDHd-0df2;
	Tue, 30 Jan 2024 04:09:28 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUfR7-0000000FDFc-0TWt
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 04:09:27 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4TPBW85Yt8z4f3k6X
	for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 12:09:08 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 4DE3D1A0199
	for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 12:09:11 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with SMTP id Syh0CgCHqg1ldrhlqljQCQ--.26624S3;
	Tue, 30 Jan 2024 12:09:11 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Song Liu <song@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
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
Subject: [PATCH bpf-next v2 1/4] riscv, bpf: Remove redundant ctx->offset initialization
Date: Tue, 30 Jan 2024 04:09:55 +0000
Message-Id: <20240130040958.230673-2-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130040958.230673-1-pulehui@huaweicloud.com>
References: <20240130040958.230673-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgCHqg1ldrhlqljQCQ--.26624S3
X-Coremail-Antispam: 1UD129KBjvdXoW7XFW8Jr15KF1fuF45XrW5KFg_yoW3Awb_C3
	4fta4xXrWfJa1qkr1jqr1rXr1qyw1rtFyrur1fXry5C3Z0qw1vy3s7Kr17Gry7urn8ZrWx
	WFZ7JrW7Zw1YgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb6kFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
	0Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
	ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWU
	JVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7V
	AKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
	IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUecTQUUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_200925_356582_7558483C 
X-CRM114-Status: UNSURE (   6.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Pu Lehui <pulehui@huawei.com>

There is no gain in initializing ctx->offset and prev_insns, and
ctx->offset is already zero-initialized. Let's remove this code.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit_core.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
index 7b70ccb7fec3..b271240f48c9 100644
--- a/arch/riscv/net/bpf_jit_core.c
+++ b/arch/riscv/net/bpf_jit_core.c
@@ -91,11 +91,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 		goto out_offset;
 	}
 
-	for (i = 0; i < prog->len; i++) {
-		prev_ninsns += 32;
-		ctx->offset[i] = prev_ninsns;
-	}
-
 	for (i = 0; i < NR_JIT_ITERATIONS; i++) {
 		pass++;
 		ctx->ninsns = 0;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
