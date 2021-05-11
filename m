Return-Path: <SRS0=YITu=KG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACD0C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 17:48:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 297DE613CF
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 17:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 297DE613CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vUMDp5vK59lgok8F70lm9LDH2WxmGl8CnCnjewfHGJ8=; b=SUErqrSekyEsxRUwVc3O8+npQh
	edQPzWPk9+5LmCZoI3NKRH62fuaPwU+AWqVMwR7kU1gDqPde9a4oRxeqnvK/lltxGiwvIIHxRtXtO
	ppKlm/lR59Lh3X1jhcwkrsR3m2SdGiG0Z9dWtedUS0P9M8R8LBNUgBNlzVGhECIh1x4sbhOuI9EZy
	P01iN1KaKUNzSWbjBOOBRlNx53vpaQIaaSVFg/315tdebf8UZMhDr1zsBa/dV/BcBpMVYUrGMq7DE
	hBheKQNXDrZ/iZiB5wv/SRTRkyq53PLwrUfeI8xYWdOTL/AnsYrwuTjzJiEueeBfH8UWu0nHxAH3P
	Rb+qlNNg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgWUP-000xQ5-M4; Tue, 11 May 2021 17:48:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgWUL-000xOX-1H
 for linux-riscv@desiato.infradead.org; Tue, 11 May 2021 17:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=gNbV2evxtF39QMDw6yzbvkVK2nPO0DcmjBsDBPMap9A=; b=ko+zQ5K0aqlnTccB2vl2M70qZP
 gWHfOpd4HJ8ca/jX8TinTQT1bRY97EGjNxaUVghWEah2ihbqBMPconX4s8nUpruJ6mlTJxgjm6GEL
 MRJT875vlP9QzQPtxEyamof7ncgTKV55q0I2SMzm1qclbpTG9K0m3gTanKliBLlKWKYxXIFk6H4Tr
 jpMh/8ghcd4Hb3HHz8i6UafU0E2LTHXchuTVInL8G5XgQjwWy3t6H34PFd/mzYRIDR6289jmVsxQ3
 hzK6WSOMGBfagF7Fdj7Of5IPqW2LbZSviY84xoD5SqIJroPmaIIVIamZVYrWI9VN9gKsdbdZz2bi7
 y2mAe2cQ==;
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lgWUE-009onW-5O
 for linux-riscv@lists.infradead.org; Tue, 11 May 2021 17:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=gNbV2evxtF39QMDw6yzbvkVK2nPO0DcmjBsDBPMap9A=; b=feAP/FbZZOdXx
 3CelCeZURgCsqdbnpcd71oKy5e3FDLcK0+YWq4ZLJHlTJyDYKX8TJ5QzMwem9ZMP
 wdGq7kfckBJ3fyjBqcb0+Pnlr+68dDSPmseQloMqN/DknM4mb5fVr+42gDp+XOxw
 oLetZFhLSNNl79bAnQqMwGRdRttdlk=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygDX3JhFw5pgIoPBAA--.62566S2; 
 Wed, 12 May 2021 01:47:50 +0800 (CST)
Date: Wed, 12 May 2021 01:42:31 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Optimize switch_mm by passing "cpu" to
 flush_icache_deferred()
Message-ID: <20210512014231.466aff04@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygDX3JhFw5pgIoPBAA--.62566S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy3uFW7GF1kZw18KF4DArb_yoW8GF4rpr
 W7Ca1qyr4rJF1I9a9F9FW8ZFyS9a9Yga4xK348Cwn0vF15t34jgr1xXanYyw4UCFyrurW3
 CF4Yyw15Wr42v3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2Iq
 xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
 106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
 xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7
 xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWU
 JVW8JbIYCTnIWIevJa73UjIFyTuYvjxUgg_TUUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_104802_892554_495A63ED 
X-CRM114-Status: UNSURE (   7.97  )
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

Directly passing the cpu to flush_icache_deferred() rather than calling
smp_processor_id() again.

Here are some performance numbers:

With a run of hackbench 30 times on a single core riscv64 Qemu instance
with 1GB memory:

without this patch: mean 36.934
with this patch: mean 36.104 (improved by 2.24%)

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/context.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 68aa312fc352..6d445f2888ec 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -281,10 +281,9 @@ static inline void set_mm(struct mm_struct *mm, unsigned int cpu)
  * actually performs that local instruction cache flush, which implicitly only
  * refers to the current hart.
  */
-static inline void flush_icache_deferred(struct mm_struct *mm)
+static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu)
 {
 #ifdef CONFIG_SMP
-	unsigned int cpu = smp_processor_id();
 	cpumask_t *mask = &mm->context.icache_stale_mask;
 
 	if (cpumask_test_cpu(cpu, mask)) {
@@ -320,5 +319,5 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 
 	set_mm(next, cpu);
 
-	flush_icache_deferred(next);
+	flush_icache_deferred(next, cpu);
 }
-- 
2.31.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
