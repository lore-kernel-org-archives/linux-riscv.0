Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDF5EE36A0
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 09:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/3WrVkoVX5TZSm0x3eSyy4LCJJCkixWmlxQzO8CmPy4=; b=aHdat/FeqL9RT+
	c6Sm9+Y33SAYbamWeOeBbSTFgKUTWspPkXBgEhfBy6Eyln2hu/okjEa22V0TL9pMbpV0D6YqRYguC
	+yQE11nGPBxVVqBr6cOGBP9dhyn00J//DGVXPvViO7/0MGD1xwfPnsQ8e1jjHMEr3eatmtY9TVy6z
	B2A7FJHcNxTizkNKjnM56WAgZbTb4mMnFz2crxRJq4+/F9S3K6bzYyEK10UDXyQqxolx1AlKn4bGk
	QPvFZiVpBYd1GDGtNWW8S1S/rL9ntVDWEwnV7R0fgCBt5KckVV9GiRKy3Kedzf6rk9c+FECOu7tNZ
	RpMDadAMrnJvCDIr8P2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqprr-00000003GjL-3Ylr;
	Fri, 13 Feb 2026 09:53:43 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpro-00000003Giq-2jlY
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 09:53:42 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770976418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zDVsVDuC8rklFvkCvFEiDn5ZrvFzaaQPmiG4+7zn3VE=;
	b=nCGIM1KaaOHLCRVyW02WQo4HC//PTS3xQd69Y7Ha/zVZx1ZzT1Db2mib8k2Jmmaa4EmkTn
	H7HIhLK98yDQ+c5W5LgtbwWZtHpFp4KUyVMoDChCJy2oDjuP9BcBf6W34G50817XTQTnkT
	DDkAQXOdMrEyIlgRr0UfPRuEE+S7n50=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	zhouzhouyi <zhouzhouyi@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [PATCH 1/2] riscv: xip_fixup.h: fix comment typo and whitespace issue
Date: Fri, 13 Feb 2026 17:52:40 +0800
Message-Id: <20260213095241.399068-1-kunwu.chan@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_015341_367788_3CB9376A 
X-CRM114-Status: UNSURE (   8.49  )
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

Fix two minor issues in XIP_FIXUP_OFFSET macro:

- The comment describes the fixup formula as
  "reg += CONFIG_PHYS_RAM_BASE - _start", but the actual assembly
  code subtracts _sdata, not _start. Fix the comment to match.

- Replace spaces with a tab for the "add" instruction to keep
  consistent indentation with surrounding lines.

Reviewed-by: zhouzhouyi <zhouzhouyi@gmail.com>
Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 arch/riscv/include/asm/xip_fixup.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/xip_fixup.h b/arch/riscv/include/asm/xip_fixup.h
index f3d56299bc22..56db595b0e14 100644
--- a/arch/riscv/include/asm/xip_fixup.h
+++ b/arch/riscv/include/asm/xip_fixup.h
@@ -16,10 +16,10 @@
 	 *
 	 * The start of data in Flash is _sdata and the start of data in RAM is
 	 * CONFIG_PHYS_RAM_BASE. So this fix-up essentially does this:
-	 * reg += CONFIG_PHYS_RAM_BASE - _start
+	 * reg += CONFIG_PHYS_RAM_BASE - _sdata
 	 */
 	li t0, CONFIG_PHYS_RAM_BASE
-        add \reg, \reg, t0
+	add \reg, \reg, t0
 	la t0, _sdata
 	sub \reg, \reg, t0
 .endm
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
