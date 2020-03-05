Return-Path: <SRS0=aH+X=4W=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7445C3F2D9
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2020 17:13:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A714E20870
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2020 17:13:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BmZvuJu1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uT5Tryw1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A714E20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xBmeQZ8vTZfcdTT07Glxj1f2n3RFDB6aDMG+Qo2OhSU=; b=BmZvuJu1DII6XZ
	FusPjscFLhCzDv3pyXYZm7BUC1vmRupd7YMv1eBpLTEsZ0pjV2MrI7Hluq+eryIRpnuTgrDnUePZt
	bpExYpWRstyOsgsuiINgGYWFxemAhHpD+avN7FZElHjTCkUVjfJAB9itKon2BHNev7CL1g8eh43EE
	MhesIGp0cnIZD6YJsuhXF5WV2s/bTIrrj71XJXO3NLBhnzClFJxHxLHzmMVo+W+cZbdrM1DrtH6lw
	VAW6nMnEoHT1ky5K75h4JsHvq1RePwJZvSXCALTVloYiLezAUg+v6FDdwlD8etj+Dwm9UYN6kTDgz
	ILDA8Jf7KABk1ny0TY0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9u43-00025R-DX; Thu, 05 Mar 2020 17:13:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9u40-00023o-H7
 for linux-riscv@lists.infradead.org; Thu, 05 Mar 2020 17:13:37 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D6DF21556;
 Thu,  5 Mar 2020 17:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583428416;
 bh=BhyIfmtJjmMPuNVk8eJ8v3alPCrVguYeSygPeKGfx1Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uT5Tryw1uX7mfyLsNfwExEo+YmWtvlKwjjMzOlIt1ZKliN6mYss8r/NOTjkHY6Wqw
 NzyXJI9c9LU+/upBOxlj7CqIyDyNPTi6oThwDFOjbQ5f34jD+U6UDSSumfOgB1vdL0
 Or0SNZIlBxB+bWXevU9PYhR0dO72ByXJMxU0A4TI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 19/67] RISC-V: Don't enable all interrupts in
 trap_init()
Date: Thu,  5 Mar 2020 12:12:20 -0500
Message-Id: <20200305171309.29118-19-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305171309.29118-1-sashal@kernel.org>
References: <20200305171309.29118-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_091336_583374_74F502F8 
X-CRM114-Status: GOOD (  10.35  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org,
 Anup Patel <anup.patel@wdc.com>, Sasha Levin <sashal@kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Anup Patel <anup.patel@wdc.com>

[ Upstream commit 6a1ce99dc4bde564e4a072936f9d41f4a439140e ]

Historically, we have been enabling all interrupts for each
HART in trap_init(). Ideally, we should only enable M-mode
interrupts for M-mode kernel and S-mode interrupts for S-mode
kernel in trap_init().

Currently, we get suprious S-mode interrupts on Kendryte K210
board running M-mode NO-MMU kernel because we are enabling all
interrupts in trap_init(). To fix this, we only enable software
and external interrupt in trap_init(). In future, trap_init()
will only enable software interrupt and PLIC driver will enable
external interrupt using CPU notifiers.

Fixes: a4c3733d32a7 ("riscv: abstract out CSR names for supervisor vs machine mode")
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
Tested-by: Palmer Dabbelt <palmerdabbelt@google.com> [QMEU virt machine with SMP]
[Palmer: Move the Fixes up to a newer commit]
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/kernel/traps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f4cad5163bf2c..ffb3d94bf0cc2 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -156,6 +156,6 @@ void __init trap_init(void)
 	csr_write(CSR_SCRATCH, 0);
 	/* Set the exception vector address */
 	csr_write(CSR_TVEC, &handle_exception);
-	/* Enable all interrupts */
-	csr_write(CSR_IE, -1);
+	/* Enable interrupts */
+	csr_write(CSR_IE, IE_SIE | IE_EIE);
 }
-- 
2.20.1


