Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D9EC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 01:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2h6DQxERh7gmbnlnS+Jz0KNTcPRdUdr+Yxwk3X/Ppk=; b=ce/LoYctqCRPp+
	9XSRroHKG858Ra4hzbFgdr/x4oAtJifbVWBknSmdoPWtGhuv5PAwB6Ffuy0tY7sYUJ3oA+d9IVlou
	zPwRoc8bMbuhXLQGoLNJDtmcGsZ6nlORnjaZHyLYm7r2Z646CHop3A2AyLB76dym82WzJVd3+Wbiq
	3txIFdzTOmgEDffFrQFv3PRykx5ktYCNN5f59BviwaUwxR9NhhutT2T9R2ny73JyOVlcaD1kinQOu
	zZnYGuxggPxNx0HbBYxEjh6TROQ4aH6u+N1DoLo2RwWvvBJT76XEwAIZJrjc7aEGlnOrjYvdqO7eO
	rLnhVR5+xx/ty0N1Xeyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpL45-000c1h-Ks; Tue, 23 Nov 2021 01:57:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpL43-000c0f-7d
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 01:57:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0034560F45;
 Tue, 23 Nov 2021 01:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637632662;
 bh=BdXerXyBKn++TZTW4qxVgfzjOM5davINOBe2TBLOin0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fQYZWTvJk3uy/Za1q4jH5+qviOz8pTbZ9dps+9tOZZzxry2+uB0mCaYNr6R55+Mus
 pgMIMRGpXfQcM7IMnKQkXsOuWRkeuHLSGZ0U7mVZz8g9TFWX6f9WRF7e1FAkMumlDV
 BJTrQoORbLTsUwpdx/JF66nx8AHj2974HDUcZTfc/vBap6bjeY3Wa2OxDcNKuouv1S
 RIcCg9ZW+Yug/8jcFYyjx1vbpIcM32r4G8C+xl6Y/Vvi8SC3ivr/JqiUxaW+SgLJmi
 R2sARQP94ln1HNHEPqI76/8iJlYEYk9A6rDgycS0MLdQsu0Z0DMSOHnAtdtFciZv+U
 Dz3CHDy8KhImQ==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, palmer@dabbelt.com,
 atishp@rivosinc.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Anup Patel <anup.patel@wdc.com>
Subject: [RFC PATCH 3/3] riscv: Add riscv.fwsz kernel parameter
Date: Tue, 23 Nov 2021 09:57:17 +0800
Message-Id: <20211123015717.542631-4-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123015717.542631-1-guoren@kernel.org>
References: <20211123015717.542631-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_175743_318677_5D0003AB 
X-CRM114-Status: UNSURE (   7.51  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The firmware of riscv (such as opensbi) occupy 2MB(64bit) /
4MB(32bit) in Linux. It's very wasteful to small memory footprint
soc chip such as Allwinner D1s/F133. The kernel parameter gives a
chance to users to set the proper size of the firmware and get
more than 1.5MB of memory.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Atish Patra <atishp@rivosinc.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 9725c546a0d4..ee505743c8f4 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4964,6 +4964,9 @@
 			[KNL] Disable ring 3 MONITOR/MWAIT feature on supported
 			CPUs.
 
+	riscv.fwsz=nn[KMG]
+			[RISC-V] Determine firmware size to save memory
+
 	ro		[KNL] Mount root device read-only on boot
 
 	rodata=		[KNL]
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
