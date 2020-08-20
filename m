Return-Path: <SRS0=ioKI=B6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7018EC433E3
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2020 00:01:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F5FC21744
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2020 00:01:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P46pfind";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="v2JxtcBJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F5FC21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0TrOJMu6hCsj824fQ3V1OnVN2GFrK6n0DS3hZQIyjb4=; b=P46pfindOZKqbNG2o8a1/JIOr
	WqaXgvH58pGlaNN9ZuqOeGGTCKB3V6W1a8PWEBCbONyXiT9bo//7lvacvOpvJUvlg797ywycP5qNb
	gRMegxXVJZrKWAnY4tGLeH5NQqVjIM8WC1J955hffTSIWXmjhjibbrLh9UQsuqPs/1/7oWvRO8MXE
	mE2E9NjI6ezcQbVHWq4sBLpBDrELxZtcu004ZZOKChfzWkX0O+O8mTfRjMzPfokFSFHS9Ls9yBpBL
	7n0ZZWxa7TRuBfxahZsaLG4yaSi8JYTorJoo5LJ5Tu7Rt/samnL3mUtuoqi78RFdFzP2B1HCVW86F
	xmNrNE8RA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8Y1U-0000UX-0V; Thu, 20 Aug 2020 00:01:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8Y1R-0000Sz-LB
 for linux-riscv@lists.infradead.org; Thu, 20 Aug 2020 00:01:38 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A4DB207DA;
 Thu, 20 Aug 2020 00:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597881696;
 bh=8hxAY/ez0AI4ber36LIJeoh29mu4g8ODN0OrS542L3c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=v2JxtcBJ8KWGLihK4aQn5GzqgN8kWFC08BI9co6wU3v8H6j1Prq1YP8LDX12b8Vkf
 7eDVjrs0yjyTcmunz7jZwypv74NQB4epXLDDalOrdIzBMM6UAUIP2wtkNTE63X5NIF
 jnK+YDZkMjZTkGluzH5h6Vj9N0bOIEJO8kMoAodk=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 15/27] riscv: Fixup static_obj() fail
Date: Wed, 19 Aug 2020 20:01:04 -0400
Message-Id: <20200820000116.214821-15-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200820000116.214821-1-sashal@kernel.org>
References: <20200820000116.214821-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_200137_813158_71D85F9F 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, Sasha Levin <sashal@kernel.org>,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

[ Upstream commit 6184358da0004c8fd940afda6c0a0fa4027dc911 ]

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
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index e6f8016b366ab..f3586e31ed1ec 100644
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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
