Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F128E8B391
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 03:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0PvmkTZkmndpUgPDPx2fJVcpzoaDtof3+UmoDVlvBgk=; b=pCyxnp88TcFQSp
	tAaTtKYqmjlAQS04JdmKeFKqoiNwhsARPcg/5m6/VwYMxMI2DyehROQi6YiifrFPOKqzWcI09ZoA0
	WC10uDUxoG8rwad1+K7wCpHa6Cx4dNiM06l+79QJkSUfeoqQnRCdyYkVg5aJlWFwcrdqZMbfaogIw
	IxD39KnEfa1pgo1Q3ik6V1wmhyVP/RQdNmae08vvSF0emjEikeVQxuBVA6nrY/mCrYxxO+5T+eJf7
	Lt+ZaKkCb6StXNzxwbPrLjH5QgTsUlZGmBgMCAomrJE6iF0hAFBxmkYKfzEqDQq26vjLLBOmVB6vs
	zXIyer2gJFI0qHCJ0Ylg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnTSa-00000007ohH-0cOA;
	Wed, 04 Feb 2026 03:21:44 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnTSX-00000007og3-0LTI
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 03:21:42 +0000
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowAAnDOMeu4Jpv9KlBw--.63664S4;
	Wed, 04 Feb 2026 11:21:04 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Wed, 04 Feb 2026 11:20:34 +0800
Subject: [PATCH 2/2] riscv: smp: Clarify comment "cache" -> "instruction
 cache"
MIME-Version: 1.0
Message-Id: <20260204-riscv-smp-comment-update-2026-01-v1-2-8b77aa181530@iscas.ac.cn>
References: <20260204-riscv-smp-comment-update-2026-01-v1-0-8b77aa181530@iscas.ac.cn>
In-Reply-To: <20260204-riscv-smp-comment-update-2026-01-v1-0-8b77aa181530@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Ingo Molnar <mingo@kernel.org>, Valentin Schneider <vschneid@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID: rQCowAAnDOMeu4Jpv9KlBw--.63664S4
X-Coremail-Antispam: 1UD129KBjvdXoWruw13WF1fWry5Xw1xXr1kZrb_yoWDtFc_WF
	s7K34fC3yfCan2vFyDJr4SqFZFk34vvFyjkasrtFZrAryDA3Z2v3sYvr4rArZ8ArWSgrs3
	ArnxJ3s5Zw17CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUblAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXwA2048vs2IY02
	0Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gr4l42xK82IYc2Ij64vIr41l4c8E
	cI0Ec7CjxVAaw2AFwI0_Jw0_GFyl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU0WrWDU
	UUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_192141_501063_4A199848 
X-CRM114-Status: UNSURE (   9.77  )
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

local_flush_icache_all() only flushes and synchronizes the *instruction*
cache, not the data cache. Since RISC-V does have a cbo.flush
instruction for data cache flush, clarify the comment to avoid
confusion.

Fixes: 58661a30f1bc ("riscv: Flush the instruction cache during SMP bringup")
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/kernel/smpboot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 0e6fe20c69a2..8b628580fe11 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -251,8 +251,8 @@ asmlinkage __visible void smp_callin(void)
 	set_cpu_online(curr_cpuid, true);
 
 	/*
-	 * Remote cache and TLB flushes are ignored while the CPU is offline,
-	 * so flush them both right now just in case.
+	 * Remote instruction cache and TLB flushes are ignored while the CPU
+	 * is offline, so flush them both right now just in case.
 	 */
 	local_flush_icache_all();
 	local_flush_tlb_all();

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
