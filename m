Return-Path: <SRS0=1V8E=AI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AF0C433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 13:58:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E537F2184D
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 13:58:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sn8/G8ZY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lm8M5nIo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E537F2184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5hTuGDg9s773s/xdvMBnlLuVZ2GnhdTNmCQ/HCvYXk=; b=sn8/G8ZYHhddAKLdEim8TWmRAH
	fhOl2YK+6KbRT4UK1X6XFomQyTMVVNWX3PZngRt1jiTVQTtmIeSj+YSfBY1zm1sXNxkevn41MiLTN
	AGJ3TMnmuai5L4iqQJ4MBJXMsNY0i5QOzPg9dvbu/VEOTx4BF4jwpIySLLfNblOmbQ4hAz2YIs9k9
	fZB5rttLqtsCsjhYgWlzhlaS58dXdoz3C/n7cHC2JNeblAJopS7Rps2Sm1pi0WHOwnRYqHNeVBKVg
	G7M5lZTZr3tq9pp2ubCt9ondaeT+r9nvjTQQuhZcTfNg2zLPLiPmVUqKX6WeDpgLRPJSV8MCEeMgP
	hKLkGXMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpBLa-0002Mw-En; Sat, 27 Jun 2020 13:58:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpBLW-0002MY-UP
 for linux-riscv@lists.infradead.org; Sat, 27 Jun 2020 13:58:19 +0000
Received: from localhost.localdomain (unknown [89.208.247.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E0E6F2168B;
 Sat, 27 Jun 2020 13:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593266298;
 bh=oewV1O6rTie7xVw3ZbfoIwUSB6OBIDTPoEv9gkp7Umk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lm8M5nIoA+Om5IGeuhZgFH1YBi9xT8SLoDQSKMHbECN1QHQpiWs8i4DvbAb2wTdPz
 mMzKzb+6l/96eWtrIj9e7E4PWPO1rQdLOfhflVc/vdaf8c3urHzTCrE/Or95/eDUm7
 ZObVHpHT7PaqV6gcjGkl7rMH5ax+1a3riNaZrzeU=
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, anup@brainfault.org,
 greentime.hu@sifive.com, zong.li@sifive.com, aou@eecs.berkeley.edu,
 tglx@linutronix.de, tycho@tycho.ws, nickhu@andestech.com
Subject: [PATCH V2 1/3] riscv: Fixup static_obj() fail
Date: Sat, 27 Jun 2020 13:57:06 +0000
Message-Id: <1593266228-61125-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593266228-61125-1-git-send-email-guoren@kernel.org>
References: <1593266228-61125-1-git-send-email-guoren@kernel.org>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

When enable LOCKDEP, static_obj() will cause error. Because some
__initdata static variables is before _stext:

static int static_obj(const void *obj)
{
        unsigned long start = (unsigned long) &_stext,
                      end   = (unsigned long) &_end,
                      addr  = (unsigned long) obj;

        /*
         * static variable?
         */
        if ((addr >= start) && (addr < end))
                return 1;

[    0.067192] INFO: trying to register non-static key.
[    0.067325] the code is fine but needs lockdep annotation.
[    0.067449] turning off the locking correctness validator.
[    0.067718] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.7.0-rc7-dirty #44
[    0.067945] Call Trace:
[    0.068369] [<ffffffe00020323c>] walk_stackframe+0x0/0xa4
[    0.068506] [<ffffffe000203422>] show_stack+0x2a/0x34
[    0.068631] [<ffffffe000521e4e>] dump_stack+0x94/0xca
[    0.068757] [<ffffffe000255a4e>] register_lock_class+0x5b8/0x5bc
[    0.068969] [<ffffffe000255abe>] __lock_acquire+0x6c/0x1d5c
[    0.069101] [<ffffffe0002550fe>] lock_acquire+0xae/0x312
[    0.069228] [<ffffffe000989a8e>] _raw_spin_lock_irqsave+0x40/0x5a
[    0.069357] [<ffffffe000247c64>] complete+0x1e/0x50
[    0.069479] [<ffffffe000984c38>] rest_init+0x1b0/0x28a
[    0.069660] [<ffffffe0000016a2>] 0xffffffe0000016a2
[    0.069779] [<ffffffe000001b84>] 0xffffffe000001b84
[    0.069953] [<ffffffe000001092>] 0xffffffe000001092

static __initdata DECLARE_COMPLETION(kthreadd_done);

noinline void __ref rest_init(void)
{
	...
	complete(&kthreadd_done);

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index e6f8016..f3586e3 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -22,6 +22,7 @@ SECTIONS
 	/* Beginning of code and text segment */
 	. = LOAD_OFFSET;
 	_start = .;
+	_stext = .;
 	HEAD_TEXT_SECTION
 	. = ALIGN(PAGE_SIZE);
 
@@ -54,7 +55,6 @@ SECTIONS
 	. = ALIGN(SECTION_ALIGN);
 	.text : {
 		_text = .;
-		_stext = .;
 		TEXT_TEXT
 		SCHED_TEXT
 		CPUIDLE_TEXT
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
