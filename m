Return-Path: <SRS0=wFsd=DO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81056C41604
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2020 15:09:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07BAA21548
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2020 15:09:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zqw2zXmf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSu15+dl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07BAA21548
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NZvQbKU3CX8UG3r8bXVJcYiHGSm1k1sZR4+p0TfKAh8=; b=Zqw2zXmf12F0fGhcqqg5J+lWST
	H4BcBoRzbLSI04bGjmuTQOtcG+WenK87+vL+kc77zjoMddxPd7AUBh4S/C7w/Pvm3gPu24LUFE7H7
	AQiqn5lTdrXOzORr38ONBU/UrlVEI3A/Dar3BofvMnfjr8fz6PrqSaMolKLlDPaNDFyBke/ugHiiL
	fGPI9RQBOK79Z7ISsqDNnCM/CF5hSHVUAiBu2bNny40IV11ZIcqnqNbMJWj1psQJI8Bl0bcEKINSS
	lDy5BoLS+x1FMRpGSaZ6RTSKB7X2wmkR/v/lD58CdO3zGa68gyUBJ+oGscy5wzzInvUd2RBWRAe4H
	zuBLNyZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQB4M-0001gR-Pj; Wed, 07 Oct 2020 15:09:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQB4K-0001fh-Cf
 for linux-riscv@lists.infradead.org; Wed, 07 Oct 2020 15:09:29 +0000
Received: from localhost.localdomain (89.208.247.74.16clouds.com
 [89.208.247.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12F0D20797;
 Wed,  7 Oct 2020 15:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602083366;
 bh=ue48qs9GmEev9xcyNZPMQmpU0ksnr3ttGA99FAlJ2uw=;
 h=From:To:Cc:Subject:Date:From;
 b=WSu15+dlN2JP7df3PziufzZRGpBKyUde1uJwJgq1GJJBU01R+cu7UGB7SH1+FzCOz
 l+dP9iQudbkVbaW0eji2GP08amEFv5yjWzj4cESavSeE7xuzGqbLsw3tC9V+KNDtF2
 qtXql4qvqqvER79nz12DWA7+UH62/8KAphJ0QS2g=
From: guoren@kernel.org
To: palmerdabbelt@google.com
Subject: [PATCH 1/2] Revert "riscv: Fixup static_obj() fail"
Date: Wed,  7 Oct 2020 15:08:32 +0000
Message-Id: <1602083313-19239-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_110928_551682_D4ED7046 
X-CRM114-Status: GOOD (  12.78  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 schwab@linux-m68k.org, atishp@atishpatra.org, linux-riscv@lists.infradead.org,
 aurelien@aurel32.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

This reverts commit 6184358da0004c8fd940afda6c0a0fa4027dc911.

It will cause bootup failure with HARDENED_USERCOPY.

As Aurelien has reported:

[    3.484586] AppArmor: AppArmor sha1 policy hashing enabled
[    4.749835] Freeing unused kernel memory: 492K
[    4.752017] Run /init as init process
[    4.753571] usercopy: Kernel memory overwrite attempt detected to kernel text (offset 507879, size 11)!
[    4.754838] ------------[ cut here ]------------
[    4.755651] kernel BUG at mm/usercopy.c:99!
[    4.756445] Kernel BUG [#1]
[    4.756815] Modules linked in:
[    4.757542] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.8.0-1-riscv64 #1 Debian 5.8.7-1
[    4.758372] epc: ffffffe0003b5120 ra : ffffffe0003b5120 sp : ffffffe07f783ca0
[    4.758960]  gp : ffffffe000cc7230 tp : ffffffe07f77cec0 t0 : ffffffe000cdafc0
[    4.759772]  t1 : 0000000000000064 t2 : 0000000000000000 s0 : ffffffe07f783cf0
[    4.760534]  s1 : ffffffe00095d780 a0 : 000000000000005b a1 : 0000000000000020
[    4.761309]  a2 : 0000000000000005 a3 : 0000000000000000 a4 : ffffffe000c1f340
[    4.761848]  a5 : ffffffe000c1f340 a6 : 0000000000000000 a7 : 0000000000000087
[    4.762684]  s2 : ffffffe000941848 s3 : 000000000007bfe7 s4 : 000000000000000b
[    4.763500]  s5 : 0000000000000000 s6 : ffffffe00091cc00 s7 : fffffffffffff000
[    4.764376]  s8 : 0000003ffffff000 s9 : ffffffe0769f3200 s10: 000000000000000b
[    4.765208]  s11: ffffffe07d548c40 t3 : 0000000000000000 t4 : 000000000001dcd0
[    4.766059]  t5 : ffffffe000cc8510 t6 : ffffffe000cd64aa
[    4.766712] status: 0000000000000120 badaddr: 0000000000000000 cause: 0000000000000003
[    4.768308] ---[ end trace 1f8e733e834d4c3e ]---
[    4.769129] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    4.770070] SMP: stopping secondary CPUs
[    4.771110] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reported-by: Aurelien Jarno <aurelien@aurel32.net>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Atish Patra <atishp@atishpatra.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>
---
 arch/riscv/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index f3586e3..e6f8016 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -22,7 +22,6 @@ SECTIONS
 	/* Beginning of code and text segment */
 	. = LOAD_OFFSET;
 	_start = .;
-	_stext = .;
 	HEAD_TEXT_SECTION
 	. = ALIGN(PAGE_SIZE);
 
@@ -55,6 +54,7 @@ SECTIONS
 	. = ALIGN(SECTION_ALIGN);
 	.text : {
 		_text = .;
+		_stext = .;
 		TEXT_TEXT
 		SCHED_TEXT
 		CPUIDLE_TEXT
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
