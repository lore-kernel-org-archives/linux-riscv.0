Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A8CCA0ECE
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 07:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5rA6uwUKjhQComd4Ji0ODYUu/EffmPf6QjdvWafufmo=; b=dkHp+sZtUFFODI
	X6YvbmM9N9lwNTX183x7BIQlFWyaW8zQDyIYefaz+HwqD5OoHGHGsVdzhUrgxHpvYqjztusr931Uu
	oGd5L02FpIbJpkQ2ScZmR1H5cauaTl/Y3T3hNsRrBlXpfvIi/bCW6hxqm5zzCoqaJYUnQ70eDL593
	oofQCxOguymgJ+ifFXZ6I8aLdEibXq6rIh2/lX97U0BwFbuZO9Yrzr8LZffv8lsLxTObN77VBUHri
	nQF50tYpr/ILhQHtPDrTZCJ1Xc4A6FNMAx7q2Yoimsj+sAdrd5Xz7Uqce+9PRZ0dTDM0Lr1RXYxnf
	aR+ACOlb1yPcjhRNdqxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxsg-002PFN-1C;
	Tue, 12 Sep 2023 07:32:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxsd-002PE6-2o
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 07:32:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4CC12615DE;
	Tue, 12 Sep 2023 07:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB7BC433C7;
	Tue, 12 Sep 2023 07:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694503934;
	bh=SNTi6EXjRzqklc00AhX/G/qenKAaP0mCu6dWGFTJ448=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CYnnR/ilRkGT4q9ek9ocgu4MaGhNF2mRvrrgfNo2WpDw23NReL/A8pizQ26tmjD7R
	 juAJ6MV424uoVvVVEWzbmY6aadsfMg5z0lVP4QQ2udB0tzQhF3ECWF5GGVggNqSr4B
	 DvxnT/UNemTM9BT2px1Tyxynh18gL12NGGyoXEMASZQlj/r6pHHXbHGMPQb4UTkHL8
	 0D67ELq1bJ0L0V3JFrLZ6y2RY3SLgVNCZQRV6CEKI76NYH34w4lqEkMoWWp5X90pTZ
	 zOk28jh56mjyvJ7Vxfe21TjDxZkwkdetE6O8V/8P1ZIaCQK176IHagZeRZGFib3lIs
	 TmBOFMQmncTIA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [RESEND PATCH 2/3] riscv: vdso.lds.S: merge .data section into .rodata section
Date: Tue, 12 Sep 2023 15:20:14 +0800
Message-Id: <20230912072015.2424-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230912072015.2424-1-jszhang@kernel.org>
References: <20230912072015.2424-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_003215_952888_B7EA5E7A 
X-CRM114-Status: UNSURE (   8.86  )
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

The .data section doesn't need to be separate from .rodata section,
they are both readonly.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Tested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/kernel/vdso/vdso.lds.S | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index d43fd7c7dd11..671aa21769bc 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -29,7 +29,13 @@ SECTIONS
 	.eh_frame_hdr	: { *(.eh_frame_hdr) }		:text	:eh_frame_hdr
 	.eh_frame	: { KEEP (*(.eh_frame)) }	:text
 
-	.rodata		: { *(.rodata .rodata.* .gnu.linkonce.r.*) }
+	.rodata		: {
+		*(.rodata .rodata.* .gnu.linkonce.r.*)
+		*(.got.plt) *(.got)
+		*(.data .data.* .gnu.linkonce.d.*)
+		*(.dynbss)
+		*(.bss .bss.* .gnu.linkonce.b.*)
+	}
 
 	/*
 	 * This linker script is used both with -r and with -shared.
@@ -44,13 +50,6 @@ SECTIONS
 	.alternative : {
 		*(.alternative)
 	}
-
-	.data		: {
-		*(.got.plt) *(.got)
-		*(.data .data.* .gnu.linkonce.d.*)
-		*(.dynbss)
-		*(.bss .bss.* .gnu.linkonce.b.*)
-	}
 }
 
 /*
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
