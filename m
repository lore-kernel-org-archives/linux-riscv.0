Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38684C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 00:01:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2F2D61924
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 00:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2F2D61924
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WtuF3q2uftUc3OU9SlRWhswxxPY0iEBQ68ky2ZUYYSQ=; b=gW5yULsybpCvRxNiNNbLeYlvkv
	hETy4sfhh5oGb1nB7ZMuLGZ6OeIzxiIsUSaA545FcNItFMnSiSEJV0x+2RF+8Fdc6hvhM67vVrpCs
	ktHlP9sejghPKRnqijpJ3jb0zT1HU6Dc7LOPy4mHg9D/3Fn5EW8Utkyv5xqHiGM20em9xWXHB0Zyi
	KspHR2lFaZUHNf8sMDtBx+Lzm7JlcydbVuSmCzs+fQSa3A7HLaCVLTR2aRD0DQmSlbSrqBttEF3A9
	oaTylQkkmi3vEL3ER6YvJjq5uE1Guh3JuXX1uNXQeJpB0Mxchq+LyKPZ992O9T7Uj2t7IESNIQ45p
	V0Pzbmtw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR1oT-0025lm-H9; Tue, 30 Mar 2021 00:00:53 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lQwW5-0011vx-39
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 18:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=XrZJAq43JW6HFt7rYWH6mHR4qDLWTV1MNg7sqstLDSo=; b=iJ+UZQOhzqW8W
 TdSCmSqp0nMMiBOVTjEtrznoZpQxeIGrkIKtXLmgTvBEDdkka2jz7QdozNUcWDJA
 UMFQSHKQifXjKRW3tPOqefKcmYg1K+nnAwm84vr4dEvwP3YFZkrrMt2zGnJPCMcs
 rCEAx5GCDl3swpW5edoe3jc5mvfmW4=
Received: from xhacker (unknown [101.86.19.180])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygC3WpmnGmJg++ppAA--.5113S2; 
 Tue, 30 Mar 2021 02:21:27 +0800 (CST)
Date: Tue, 30 Mar 2021 02:16:24 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
 <guoren@linux.alibaba.com>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: keep interrupts disabled for BREAKPOINT exception
Message-ID: <20210330021624.2b776386@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygC3WpmnGmJg++ppAA--.5113S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFyxtrW5CF4kZF4UKr4Uurg_yoW3urX_C3
 WxJ39IgrW3KF4IvFWUXw4fu3yay34rtFZ5Xw1IyrW5GFy5Wr47ta9I93s8XrZ5WF4ftFnx
 A3s7WFZ5tr4IqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbFkYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2Iq
 xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
 106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
 xVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7
 xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j
 6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2eHqUUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_192147_341395_F00D59CD 
X-CRM114-Status: UNSURE (   6.45  )
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

From: Jisheng Zhang <jszhang@kernel.org>

Current riscv's kprobe handlers are run with both preemption and
interrupt enabled, this violates kprobe requirements. Fix this issue
by keeping interrupts disabled for BREAKPOINT exception.

Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/entry.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 744f3209c48d..4114b65698ec 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -130,6 +130,8 @@ skip_context_tracking:
 	 */
 	andi t0, s1, SR_PIE
 	beqz t0, 1f
+	li t0, EXC_BREAKPOINT
+	beq s4, t0, 1f
 #ifdef CONFIG_TRACE_IRQFLAGS
 	call trace_hardirqs_on
 #endif
-- 
2.31.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
