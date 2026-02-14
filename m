Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D6BEF99F4
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Feb 2026 02:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5m0TGHCyrKDbxSqYxyfnEvaT+qvw0HrQdrZ5exAiwfw=; b=cGKuUY6GHzwza0
	xdXHm2uicSZm/hcm3bmF11fVFepQESJ/+RDai8RlsQEFuglxGJ5U6rmbdOQpt9RtUVfHv+52me57G
	iQOdft2XbPZ+k0j3noIWcYirn4f9JAzN36gRDfdxFft00V3HXHghCpbgtC1I4sgL8IBjJLqkK9qY7
	3MU7hBhnqT1CE6G1GTkA32UZFldizXp73RyjnN7EbF1HlJ+vYCyKwEM5CUMIGtx/aNU23Fnr/pdrI
	YIoM6xSP87sJBWHc0jNUGUXRBE55VP/f4ypQs1G+EEDdgATclrr85Htmlnom7J6cWZk6wyDR9JmLq
	bc+ayQOlW3s13wt6qzSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr5YL-00000004Ak2-2WUU;
	Sat, 14 Feb 2026 02:38:37 +0000
Received: from out-179.mta1.migadu.com ([2001:41d0:203:375::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr5YJ-00000004Ais-1dcR
	for linux-riscv@lists.infradead.org;
	Sat, 14 Feb 2026 02:38:36 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771036713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i6QACbWSNDKCXmWcy6tkfOeR6o72/bnitArXUWOcfcM=;
	b=ub8fza77ZsQlVxe72Mbjhr0xr6gsj52Ancru3QFdOgH3m1kf2VBrIU1l3K2wD/4bameWZ5
	S/KuJevXIGb9lTKhf4O66Pc2y8vspVXbtCiZtkY56w3RVcCq6PWcgXWiuBGdh/V1oVQmFx
	l/pBUsU7C35y8RIMKXzO3HIdfDTwXKQ=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Zhouyi Zhou <zhouzhouyi@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [PATCH RESEND 2/2] riscv: head.S: fix typo and wrong #endif comment
Date: Sat, 14 Feb 2026 10:38:04 +0800
Message-Id: <20260214023804.677127-3-kunwu.chan@linux.dev>
In-Reply-To: <20260214023804.677127-1-kunwu.chan@linux.dev>
References: <20260214023804.677127-1-kunwu.chan@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_183835_566040_46F10D65 
X-CRM114-Status: UNSURE (   7.72  )
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

- Fix spelling: "intruction" -> "instruction".

- Fix #endif comment: the matching #ifdef is CONFIG_XIP_KERNEL,
  not CONFIG_XIP.

Reviewed-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 arch/riscv/kernel/head.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 9c99c5ad6fe8..1618d2cb91b3 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -81,7 +81,7 @@ relocate_enable_mmu:
 	sub a1, a1, a2
 	add ra, ra, a1
 
-	/* Point stvec to virtual address of intruction after satp write */
+	/* Point stvec to virtual address of instruction after satp write */
 	la a2, 1f
 	add a2, a2, a1
 	csrw CSR_TVEC, a2
@@ -287,7 +287,7 @@ SYM_CODE_START(_start_kernel)
 	/* first time here if hart_lottery in RAM is not set */
 	beq t0, t1, .Lsecondary_start
 
-#endif /* CONFIG_XIP */
+#endif /* CONFIG_XIP_KERNEL */
 #endif /* CONFIG_RISCV_BOOT_SPINWAIT */
 
 #ifdef CONFIG_XIP_KERNEL
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
