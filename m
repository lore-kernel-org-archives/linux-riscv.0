Return-Path: <SRS0=LUeZ=A7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C63C4346A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 21:38:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E60022D02
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 21:38:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZEDq1cRI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2zLYRU5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E60022D02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ur7l7y5cwpfJmQlOGuQ0nmtGpMrB1z5cnhb3W6lkaGM=; b=ZEDq1cRIrIMKwXlR74/3WvlWr
	4kquzigSmKJ/LU+047iqMjtPJPCLBpw7bHGweuPWXHR3bSit2udamE+DXFeaqQYrMtdOtP65talTz
	FWXTzE3b93+OW95pSVDCB75gtF3e+9eYoSvY6zL0WmKs+B33h5NSpzh1LR0ivgNEeveg1hNqfmW5a
	kz+uDWWOIyoiyJ90Ah1AH3sqGfC6bTf6gEtq9x3dnFt6Ogrv46opzvxBj/NoD8itH+7Zzh6sj1grZ
	2o4wX8Pwy0FoGUkeLuQGO2c0Zi6lKudOm2/wuKpEbkQ9uYUcbsLb4jqWYFz/uBGHReQK0uEqfsNgO
	nBAeI6f2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxdUE-0001x6-9I; Mon, 20 Jul 2020 21:38:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxdU1-0001sQ-9S
 for linux-riscv@lists.infradead.org; Mon, 20 Jul 2020 21:38:03 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E25022D04;
 Mon, 20 Jul 2020 21:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595281080;
 bh=dVQ0hwlWWpDvG5Xm+0dZcSPdLlPaxjOtR+QNtoShlzE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K2zLYRU593nx12iFElgAmBndEGNWW81NANOK3NCUOTpiHnYxh42agFjTaBFAqgUm1
 +diutGeLibd2Jl3Q+7vQ1MyMLqJBaAV5ICquTC4iOeYB5yNbgx8EmYc/bZc1LwNm6/
 qXoar2cKTHQ6nbo140ElTYwj4Gm2ijajVfcVxwgA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 36/40] asm-generic/mmiowb: Allow
 mmiowb_set_pending() when preemptible()
Date: Mon, 20 Jul 2020 17:37:11 -0400
Message-Id: <20200720213715.406997-36-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720213715.406997-1-sashal@kernel.org>
References: <20200720213715.406997-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_173801_537441_D1513508 
X-CRM114-Status: GOOD (  16.30  )
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
Cc: Sasha Levin <sashal@kernel.org>, linux-arch@vger.kernel.org,
 Emil Renner Berthing <kernel@esmil.dk>, Arnd Bergmann <arnd@arndb.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Guo Ren <guoren@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Will Deacon <will@kernel.org>

[ Upstream commit bd024e82e4cd95c7f1a475a55f99871936c2b2db ]

Although mmiowb() is concerned only with serialising MMIO writes occuring
in contexts where a spinlock is held, the call to mmiowb_set_pending()
from the MMIO write accessors can occur in preemptible contexts, such
as during driver probe() functions where ordering between CPUs is not
usually a concern, assuming that the task migration path provides the
necessary ordering guarantees.

Unfortunately, the default implementation of mmiowb_set_pending() is not
preempt-safe, as it makes use of a a per-cpu variable to track its
internal state. This has been reported to generate the following splat
on riscv:

 | BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
 | caller is regmap_mmio_write32le+0x1c/0x46
 | CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc3-hfu+ #1
 | Call Trace:
 |  walk_stackframe+0x0/0x7a
 |  dump_stack+0x6e/0x88
 |  regmap_mmio_write32le+0x18/0x46
 |  check_preemption_disabled+0xa4/0xaa
 |  regmap_mmio_write32le+0x18/0x46
 |  regmap_mmio_write+0x26/0x44
 |  regmap_write+0x28/0x48
 |  sifive_gpio_probe+0xc0/0x1da

Although it's possible to fix the driver in this case, other splats have
been seen from other drivers, including the infamous 8250 UART, and so
it's better to address this problem in the mmiowb core itself.

Fix mmiowb_set_pending() by using the raw_cpu_ptr() to get at the mmiowb
state and then only updating the 'mmiowb_pending' field if we are not
preemptible (i.e. we have a non-zero nesting count).

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Guo Ren <guoren@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Reported-by: Palmer Dabbelt <palmer@dabbelt.com>
Reported-by: Emil Renner Berthing <kernel@esmil.dk>
Tested-by: Emil Renner Berthing <kernel@esmil.dk>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Link: https://lore.kernel.org/r/20200716112816.7356-1-will@kernel.org
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/asm-generic/mmiowb.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/mmiowb.h b/include/asm-generic/mmiowb.h
index 9439ff037b2d1..5698fca3bf560 100644
--- a/include/asm-generic/mmiowb.h
+++ b/include/asm-generic/mmiowb.h
@@ -27,7 +27,7 @@
 #include <asm/smp.h>
 
 DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
-#define __mmiowb_state()	this_cpu_ptr(&__mmiowb_state)
+#define __mmiowb_state()	raw_cpu_ptr(&__mmiowb_state)
 #else
 #define __mmiowb_state()	arch_mmiowb_state()
 #endif	/* arch_mmiowb_state */
@@ -35,7 +35,9 @@ DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
 static inline void mmiowb_set_pending(void)
 {
 	struct mmiowb_state *ms = __mmiowb_state();
-	ms->mmiowb_pending = ms->nesting_count;
+
+	if (likely(ms->nesting_count))
+		ms->mmiowb_pending = ms->nesting_count;
 }
 
 static inline void mmiowb_spin_lock(void)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
