Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BDEC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 06:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ahkcppMnikwPxHKHJqtZ6FMEfVCdaoxO3ddugTZiCBs=; b=u0axcPjgkR+f1X
	oTByUxxUxGCJo6DdYVgOiNROo9ECHIDJUQedmRVRrVAdPWL3ZQ0E3sulwFo2LlJU213t/MFpDewWc
	se6wIU0CSCScc3kbjv009hEpy7jzI49WFQ2pDW1K4Wiv9R0c+VsN1Rh4mxHkM7H+ETVYDNTi/jtHl
	Gt3AiVG4vdlXn6PfKnvjKcuSg0jq5l1tYcTPGG+nmNApKDEu4jsIznLfCacGVOAhue7m6mY3h/Ngz
	iZIHdhX7DSIllYpV2UIx87+OaNCH98lEXAznCxR3B+9QGF/9fEKKQZoQysNeXdXgPbWc/q7ox5trY
	GFLZm//tVaa5jDyjQ1YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwcTj-0000000B700-1nJ7;
	Tue, 16 Apr 2024 06:39:39 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwcTc-0000000B6ta-3jN2;
	Tue, 16 Apr 2024 06:39:34 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4VJZBd69jmz4f3nTY;
	Tue, 16 Apr 2024 14:39:05 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id B06AD1A0175;
	Tue, 16 Apr 2024 14:39:14 +0800 (CST)
Received: from k01.huawei.com (unknown [10.67.174.197])
	by APP1 (Coremail) with SMTP id cCh0CgDnAQsRHR5mMjd4KA--.14140S4;
	Tue, 16 Apr 2024 14:39:14 +0800 (CST)
From: Xu Kuohai <xukuohai@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Ivan Babrou <ivan@cloudflare.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next 2/2] riscv, bpf: Fix incorrect runtime stats
Date: Tue, 16 Apr 2024 14:42:08 +0800
Message-Id: <20240416064208.2919073-3-xukuohai@huaweicloud.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240416064208.2919073-1-xukuohai@huaweicloud.com>
References: <20240416064208.2919073-1-xukuohai@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgDnAQsRHR5mMjd4KA--.14140S4
X-Coremail-Antispam: 1UD129KBjvJXoW7uFyfJFWxuryDWr1kXw4kXrb_yoW8JFyrpa
	1UG39xAFWv9F4DXws7JF17Xry5tF4qqr13CF42yrWrAan0qrWUuwn3Kws0yry5CryrZr18
	Xr1j9Fna93WDZ37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvGb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXw
	A2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjxU2GYLDUUUU
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_233933_125759_E40571BE 
X-CRM114-Status: UNSURE (   9.09  )
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

From: Xu Kuohai <xukuohai@huawei.com>

When __bpf_prog_enter() returns zero, the s1 register is not set to zero,
resulting in incorrect runtime stats. Fix it by setting s1 immediately upon
the return of __bpf_prog_enter().

Fixes: 49b5e77ae3e2 ("riscv, bpf: Add bpf trampoline support for RV64")
Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 15e482f2c657..e713704be837 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -730,6 +730,9 @@ static int invoke_bpf_prog(struct bpf_tramp_link *l, int args_off, int retval_of
 	if (ret)
 		return ret;
 
+	/* store prog start time */
+	emit_mv(RV_REG_S1, RV_REG_A0, ctx);
+
 	/* if (__bpf_prog_enter(prog) == 0)
 	 *	goto skip_exec_of_prog;
 	 */
@@ -737,9 +740,6 @@ static int invoke_bpf_prog(struct bpf_tramp_link *l, int args_off, int retval_of
 	/* nop reserved for conditional jump */
 	emit(rv_nop(), ctx);
 
-	/* store prog start time */
-	emit_mv(RV_REG_S1, RV_REG_A0, ctx);
-
 	/* arg1: &args_off */
 	emit_addi(RV_REG_A0, RV_REG_FP, -args_off, ctx);
 	if (!p->jited)
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
