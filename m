Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CA0606A330
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 07:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rwWisoTc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ADHGPBzq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+RxiyW4Nf9D1bU+5GCXgtHDSkuWa8Ri84RpVJ1+1F7A=; b=rwWisoTcmE5yFargQauvQ0UtaQ
	5/hWMrXSsGhaTVXOPF3IR3rbFHqteai2dPcqdfGpmUoblLnxJYkFeTKkDfJlnJTLaFwgIjDlvKxEo
	jinXMxY2CUmy8bHgppPWRTQMgjNStWsITuI6MiWAhrVk3jpTN1qiW/J9QYdN+B7z9znsNPGvT5oEi
	EN2BpPrbpUilCeclhCqpuxn29CDtqd9u4mBH7fvroiXlMdle70s2K3WWTArokSK500ULP07OTkxrz
	paOipTjJfCDY5x3GLjCe5sIi/MC5FCS7NM69GVpd0sleSsQZIqOjOXSrmSHwV1UaemM43P6G0nvlF
	VkLLNrsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPaqy-0000000EJqv-0DR3;
	Sat, 07 Nov 2026 07:28:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPaqs-0000000EJqc-3fNj
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 07:28:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B3C2760ED9;
	Sat,  7 Nov 2026 07:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CAFB1F0089F;
	Sat,  7 Nov 2026 07:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036517;
	bh=4meGpp5bM9W2KlfdPIeQIZ6PeWQUimuoG86VDalLWzY=;
	h=From:To:Cc:Subject:Date;
	b=ADHGPBzq1Bu7EA2ZwzWl7vo2h1riz92TljyGwx5IFXTpJfCbgr8i3PTPQehfFmKef
	 jSb3ZXxqFtYBKSc1Z1zjk+vEb/aMjGGDVkLilVERL8wKye2Z8RXABU9I3qFLOdy1wY
	 W236BK7EEkKPghJc+pIn49hSlieU1Ue+SARymHmbwEfVQ6uMC1mdPZuwbfLRUw5eLj
	 pxpZgsSUZKK1t3TqbdopwXCvCRVO5oYkikX7GZ73E3fUdSDmr99exl/XIuk+CNcC5j
	 LUel3poqS38OR+Li9c6dK1tq8LPVK265IdIdm9KEQE/k3HzV2OPiWoExkCR3CEtJbP
	 9dpv58p6ns13g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Establish entry state for kernel software-check exceptions
Date: Sat,  7 Nov 2026 15:08:27 +0800
Message-ID: <20261107070827.17414-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The kernel-mode software-check exception path calls die() without
performing the entry bookkeeping used by other kernel trap handlers.
die() invokes diagnostics and notifiers which need the corresponding
RCU and tracing state established.

Wrap the kernel fault handling with irqentry_nmi_enter() and
irqentry_nmi_exit(), following the existing kernel trap paths.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 arch/riscv/kernel/traps.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f8292adda099..f28e03f98af0 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -402,8 +402,11 @@ asmlinkage __visible __trap_section void do_trap_software_check(struct pt_regs *
 
 		irqentry_exit_to_user_mode(regs);
 	} else {
+		irqentry_state_t state = irqentry_nmi_enter(regs);
+
 		/* sw check exception coming from kernel is a bug in kernel */
 		die(regs, "Kernel BUG");
+		irqentry_nmi_exit(regs, state);
 	}
 }
 
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
