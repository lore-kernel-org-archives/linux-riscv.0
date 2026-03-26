Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2AC10A1E77
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 11:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RrXQokvSFLnNG37E9XPpsbVJDQeOiss2RZpm1XKicPo=; b=e703zeQ8G21zDx
	3tZLrtWULHBvGzg41rco5WEDM1P+dtuusxs4x219kNG5wkCrrj1TiwzZ2meTDnNa517LcFQCDJhmr
	wqAUy4o/bzThiW61kbvX/l/IonCm8etybYNIjt3KXihJApFKLEgUyCfW03AyfGOSSs0u0erNeIRW2
	XtWIyjWemUPrwMMs/0qUBhzupYlWpD0nDrn13jm6Fw4jow5Cv8NB/ep3/hLFOF3UUhKZN2+yNziSG
	RzzgxpmmljIsKOcppJ4BYcN9FisXf6adfgPycx1+h35RC731rx6U2eUPehkRZzgLZv4JLt2GJdOo/
	/Q0n3kS+NLHnkdHEkBeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5iir-00000005LUh-49xF;
	Thu, 26 Mar 2026 11:17:58 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5iio-00000005LTG-3l9I
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 11:17:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.at;
	s=s31663417; t=1774523853; x=1775128653; i=manfred.schlaegl@gmx.at;
	bh=83voFvXIA1vfqgZbnkVILN0EgAKxVMLTfU8NnbpCDPc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LHu1s9vXK/mawh7js6geXmVa3nNVH+ded48V4wr8Qll+iJyo5KOIz07+YeHCDILe
	 I/pgquiNXBrR3fHwgdpF73wGIPvLiFvD7JGboZL/KHsHdT5GrFnlR8oe49LDKmFFF
	 v57dqPYZuLwnTFpRttKVutzGMWHLSt/tvuVsYFBoj8Bi0g1M/5pLHqyvXbebeLzyg
	 N7pTxcGk45Qf8NpLUxh3Jqjcz4PqG6mNPWftBnVbV4t36FHYHDctQ2CH5ZPwnghTG
	 WfGmLVtdPFdx0DjdNk0GwdVAV0U/2DXF2IVbo9hDCssPzMIcIs6B5N0NjISGxj4Ok
	 IvJEYBwFL0zhz94OaA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4z6k-1vMrIv1bt6-017JEH; Thu, 26
 Mar 2026 12:17:33 +0100
From: Manfred SCHLAEGL <manfred.schlaegl@gmx.at>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manfred SCHLAEGL <manfred.schlaegl@gmx.at>
Subject: [PATCH] RISC-V: restore U-mode counter access (scounteren)
Date: Thu, 26 Mar 2026 12:17:13 +0100
Message-ID: <20260326111713.2282289-1-manfred.schlaegl@gmx.at>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Provags-ID: V03:K1:vBZB+fnHtEZBBeIyZBpVoHmO/bYCdeFMXqT2z237hWwovaEYZKO
 OhWqEryn3vXQuqx9p4v2m313DoCA/7QtT64+o+KK6j5MGjT7yahr2tGM0r0jEMiGzAbIu3J
 u7ja2xMfRyST32bTZcDXACxRyOp2LcYk72RpmpoSLqOt0zjIdu6GlCPTKYMJEHiqCosMSLJ
 TJyfc/g08pKD7WOiolmCA==
UI-OutboundReport: notjunk:1;M01:P0:lYCYBKl8Pek=;UCZJR8YNjfOKaLL0CZRxjwkz1kq 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 EV24YZg0hOE+SQmgJdvUKcBT/LOT+KJLw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_041755_305651_E21502A7 
X-CRM114-Status: UNSURE (   8.55  )
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

In commit 5bc409786752 ("RISC-V: KVM: Remove scounteren initialization")
the initialization of scounteren was moved from the hypervisor (KVM) to
the supervisor -- a well-argued change. However, the same change also
restricted access to performance counters without comment: previously,
scounteren was set to 0x7 (0b111), allowing U-mode (userspace) access
to instret (IR), cycle (CY), and time (TM). After the change,
scounteren is set to 0x2 (0b010), which allows access only to time (TM)
and prohibits access to instret (IR) and cycle (CY). This breaks user-
space programs that directly use these performance counters.

This change restores the prior behavior: scounteren is set to 0x7,
which re-enables U-mode (userspace) access to instret (IR), cycle (CY),
and time (TM).

Fixes: 5bc409786752 ("RISC-V: KVM: Remove scounteren initialization")
Signed-off-by: Manfred SCHLAEGL <manfred.schlaegl@gmx.at>
---
 arch/riscv/kernel/head.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 9c99c5ad6fe8..5ad5e12a8299 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -133,8 +133,8 @@ secondary_start_sbi:
 	csrw CSR_IP, zero
 
 #ifndef CONFIG_RISCV_M_MODE
-	/* Enable time CSR */
-	li t0, 0x2
+	/* Enable CY, TM, and IR counters in U mode */
+	li t0, 0x7
 	csrw CSR_SCOUNTEREN, t0
 #endif
 
@@ -247,8 +247,8 @@ SYM_CODE_START(_start_kernel)
 	 */
 	csrr a0, CSR_MHARTID
 #else
-	/* Enable time CSR */
-	li t0, 0x2
+	/* Enable CY, TM, and IR counters in U mode */
+	li t0, 0x7
 	csrw CSR_SCOUNTEREN, t0
 #endif /* CONFIG_RISCV_M_MODE */
 
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
