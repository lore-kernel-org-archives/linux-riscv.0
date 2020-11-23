Return-Path: <SRS0=TXXs=E5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7D9C56202
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2020 15:42:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B13C62080A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2020 15:42:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zPzphtJV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BBzoE8ca"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B13C62080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwuZOBSs8KTVFbY+TvswIow3dkOwI5EC+66wpksTn70=; b=zPzphtJVRJN1EQhFmQNLc6JUcT
	LTvmN0r1UW5Q21RxX84W6NPwc1EIdf4BAxp4TXBOLhOekYkTuxyQGljUqXQICnmAyMo1aMJCr0jdR
	sb8EGlaDUXMIChs8Rt+I4X/60VneY/GjJWBQQZNQeQNjvS3iFGpTdclsJczEzsO7hNHrZLBt9oij7
	M5zgT34+G1QmmfV2OiHc+9R8w78tlDBSFshYQlNrYz60LUgVOeYWfKoUZ2uDl4SYgXRyk9+ff4096
	KawXL1wI1dy3pyIfj9lb+otEPDLIc1Op4eJPNwOw69rAH/cPFdKa0Jeo/zjNV3SaMFBvK/Byykj36
	DzKEW4GQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khDyd-0008IO-N0; Mon, 23 Nov 2020 15:42:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khDya-0008Hv-UE
 for linux-riscv@lists.infradead.org; Mon, 23 Nov 2020 15:42:01 +0000
Received: from localhost.localdomain (unknown [42.120.72.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D9F472080A;
 Mon, 23 Nov 2020 15:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606146120;
 bh=OkJ2G8OhwKYgiWV+wVeIHk5f00NcDCpYKGYROpWFFj8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BBzoE8caN1W5rpt/49LeI61b+JMMUEYmqcfkKzb6pQje5cJixZm7fpK7/c5xsYqrB
 s17eWacNj1VxpG3oYW8dukePKbcubXUXDjZ7a0PNm3u1ywUpMORABnl1EhQC0lFeLN
 o0lFPm1/He8laSaKCDBp2mkloa37H4isO4U1ZPp0=
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, anup@brainfault.org,
 greentime.hu@sifive.com, zong.li@sifive.com, atish.patra@wdc.com
Subject: [PATCH 2/2] riscv: Fixup trace_hardirqs_on in entry.S
Date: Mon, 23 Nov 2020 15:39:40 +0000
Message-Id: <1606145980-5153-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606145980-5153-1-git-send-email-guoren@kernel.org>
References: <1606145980-5153-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_104201_346813_15EDA3B4 
X-CRM114-Status: GOOD (  12.24  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Vincent Chen <vincent.chen@sifive.com>,
 guoren@kernel.org, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Move trace_hardirqs_on to correct place. If SR_PIE isn't set, the
trace_hardirqs_on will cause wrong record.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/kernel/entry.S | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 7a1a6bb..c1b38e2 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -124,17 +124,17 @@ skip_context_tracking:
 	REG_L a1, (a1)
 	jr a1
 1:
-#ifdef CONFIG_TRACE_IRQFLAGS
-	call trace_hardirqs_on
-
-	REG_L s1, PT_STATUS(sp)
-#endif
 	/*
 	 * Exceptions run with interrupts enabled or disabled depending on the
 	 * state of SR_PIE in m/sstatus.
 	 */
 	andi t0, s1, SR_PIE
 	beqz t0, 1f
+#ifdef CONFIG_TRACE_IRQFLAGS
+	call trace_hardirqs_on
+
+	REG_L s1, PT_STATUS(sp)
+#endif
 	csrs CSR_STATUS, SR_IE
 
 1:
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
