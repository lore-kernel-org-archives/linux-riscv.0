Return-Path: <SRS0=GCH+=IE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEDBC433DB
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Mar 2021 07:53:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A37965004
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Mar 2021 07:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A37965004
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6fAxL46mqXjGpOuuNlcHRh5QZPdEt6O2dDs88OybUhQ=; b=HBTtwUy8IARjWMkKx7UaN+qRGi
	OCM+Ip8gCx4N5kgiIX6h+W1zGT9muIneAoWreWeVIdllGXNkZoAaXw90VkoyOrOhwj6ZLXffU7sqZ
	lGlK00tsHFfYDJ7nW67X8vCRsiaeq3HDnGJasljXzQ/w46eTl1RW99s4MLruDjJEovtijednsnSto
	AkW+7NQ3ryDxEqa+FQyaWoYeZAdjN2hklg0tkEzJ9iKSFwzwxH1oHscheV5/Hc9wCccCPxXWrdER2
	yU2wG95251LxU/0eofJtl8P0rB/glRqnJP7s6+XIoQnmPam6xBk0y08+WQRRySLGLsiX8U5qbgSMh
	7rijoRwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIRjz-002Bqv-QF; Sat, 06 Mar 2021 07:52:47 +0000
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lIRjt-002Bkt-T1
 for linux-riscv@lists.infradead.org; Sat, 06 Mar 2021 07:52:46 +0000
Received: from linux.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf_O+NENgpj0VAA--.26764S2; 
 Sat, 06 Mar 2021 15:52:30 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: Return -EFAULT if copy_{to,
 from}_user() failed in signal.c
Date: Sat,  6 Mar 2021 15:52:29 +0800
Message-Id: <1615017149-24843-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxf_O+NENgpj0VAA--.26764S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr13ZF18Ww4fGw17KFWfKrg_yoW8Zw1xpF
 45Ca43Kr4xGFn7uas3Jw18WF95Ar93tFyIkr90k3WSyFs8trs8t34kJa4jqF4rJryrCw4v
 ka98trWYkw4rWr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r4xMxAIw28I
 cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
 IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI
 42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
 IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
 87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jcYFXUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210306_075242_720576_76BB73D7 
X-CRM114-Status: GOOD (  10.50  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

copy_{to,from}_user() returns the amount left to copy, it should return
-EFAULT error code if copy {to,from} user failed, just like the return
value is an error code when {put,get}_user() failed, this is to make the
return value consistent, no function change.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/riscv/kernel/signal.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 65942b3..c76d877 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -39,7 +39,7 @@ static long restore_fp_state(struct pt_regs *regs,
 
 	err = __copy_from_user(&current->thread.fstate, state, sizeof(*state));
 	if (unlikely(err))
-		return err;
+		return -EFAULT;
 
 	fstate_restore(current, regs);
 
@@ -67,7 +67,7 @@ static long save_fp_state(struct pt_regs *regs,
 	fstate_save(current, regs);
 	err = __copy_to_user(state, &current->thread.fstate, sizeof(*state));
 	if (unlikely(err))
-		return err;
+		return -EFAULT;
 
 	/* We support no other extension state at this time. */
 	for (i = 0; i < ARRAY_SIZE(sc_fpregs->q.reserved); i++) {
@@ -87,8 +87,12 @@ static long restore_sigcontext(struct pt_regs *regs,
 	struct sigcontext __user *sc)
 {
 	long err;
+
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
+	if (unlikely(err))
+		return -EFAULT;
+
 	/* Restore the floating-point state. */
 	if (has_fpu)
 		err |= restore_fp_state(regs, &sc->sc_fpregs);
@@ -140,8 +144,12 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 {
 	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
 	long err;
+
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
+	if (unlikely(err))
+		return -EFAULT;
+
 	/* Save the floating-point state. */
 	if (has_fpu)
 		err |= save_fp_state(regs, &sc->sc_fpregs);
-- 
2.1.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
