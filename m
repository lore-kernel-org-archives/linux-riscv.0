Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FFAEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FZnxJkHqVWaTMSEbYQjEVna1A+RxMIfLgpYFM29uDhQ=; b=YO014Y/aYzmT4O
	WCWg4N+GTRbOhE+sFJ9TUt6I7Ley3+3aggZVroGHaT7C0ORJ3eCxg4p9KTq9ieyqREN6cuSrN+hCt
	9RNGFzxoGYhFF0Sws38fFZgu5P8UWNGN1x9dLt66tisXNMc/OIKNxktwflEGoHKjdOz35NLtehPyd
	Zw1o1IbIAEIzw9vl7UOi2JkF3S4QbBbIsmWAFU7ugDRVvLzHtjGLrCW2xM4jSQzwH28zYrphZi2fZ
	zBJfHVOFGe2bQPHHEd0O+dmC0IkoH0VMYbT7gLOtPz4VcuIC58ApjTpebFY0TQDom3QoIrcPGTCwJ
	1kBm1Bw0/6YeCBrR8n3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0f3-005jjF-00;
	Wed, 19 Jul 2023 06:27:45 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzcc-005Dg5-0a
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=+0QGjlRpZPrM/uup2zUmaQINAkyP6D0Lf8mXdHziHdo=; b=XoL7YUeGKvNMgLPADEcvpdFHi1
	vmwwSTB2P4jObgRPjW4Loht8SqAtVHzLTslvI4ZKP3VY00CBDzu/yf2b5VFZLT0/aKMvfGRB0knfs
	pWUZlCGWegw+rXKkwIbHgRqBnuyzhvOvQVrrJalOljcn8JobKjBnP5PJ87W//o9HXoFNW8D8iPlpw
	7h/MNqzRhXlBE8T58PWUg3YPp6EmBpOct8mVwVwywi7k7jQQ1R3nyPQ3tUDBYxS8yYa7088edFS1w
	9TI8QYK68N8TPjranABpLphVdwiSOdfTOcD8D+HKG/x7Sjz1sDIDDrDq+izpZjpJ3u50athPeMHC1
	2CvgaSpw==;
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qLaYS-004WCu-Fx
	for linux-riscv@lists.infradead.org; Tue, 18 Jul 2023 02:35:15 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 36I2WUJO074398;
	Tue, 18 Jul 2023 10:32:30 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.158) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Tue, 18 Jul 2023
 10:32:29 +0800
From: Mina HuiMin-Chou <minachou@andestech.com>
To: <linux-riscv@lists.infradead.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <chenhuang5@huawei.com>, <tim609@andestech.com>, <dylan@andestech.com>,
        <minachou@andestech.com>, <az70021@gmail.com>
Subject: [PATCH] riscv: Move the "Call Trace" to dump_backrace().
Date: Tue, 18 Jul 2023 10:32:01 +0800
Message-ID: <20230718023201.16018-1-minachou@andestech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.158]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 36I2WUJO074398
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_033513_054167_6FACFE06 
X-CRM114-Status: UNSURE (   8.73  )
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

From: Hui Min Mina Chou <minachou@andestech.com>

It would be appropriate to show "Call Trace" within the dump_backtrace
function to ensure that some kernel dumps include this information.

This patch is based on Chen Huang's comment [1] and Palmer Dabbelt's
patch [2].

[1] https://lore.kernel.org/lkml/mhng-75c14e1e-a23c-404b-a1f6-235e53bdb6f3@palmerdabbelt-glaptop/
[2] https://lore.kernel.org/lkml/20220419174842.488-1-palmer@rivosinc.com/

Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
---
 arch/riscv/kernel/stacktrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 64a9c093aef9..ff136031a592 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -118,12 +118,12 @@ static bool print_trace_address(void *arg, unsigned long pc)
 noinline void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
 		    const char *loglvl)
 {
+	pr_cont("%sCall Trace:\n", loglvl);
 	walk_stackframe(task, regs, print_trace_address, (void *)loglvl);
 }
 
 void show_stack(struct task_struct *task, unsigned long *sp, const char *loglvl)
 {
-	pr_cont("%sCall Trace:\n", loglvl);
 	dump_backtrace(NULL, task, loglvl);
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
