Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CA3C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 02:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hsqaZywNqoY5nl3ivxfoxr7fpZmjBD3C7xR0GN/1QZk=; b=WXzaRTAH417CeV
	YQA+1odOCVA5GdpL443y+eleTA2Iz3sWJ6UUe2BLXc9iuWxj6716BH3Qr0aEjvg28eSCHIyMwqbxx
	wGZUxQVF5k6fULhhv6GviDozgoucfDTZC5cqmfK6B+ZWYHN9rLlbDCLxBBR3F0Mf423niWNx4Rn6G
	QUiX9LBJU3TLP8M84YnHxbOX06MrcRnnbFAVuM7DTMvoLzZZQxyXsbB2xxgrnRDz5w/WqXy/NBmGn
	t763T5a2XnfeHs5GQ56oBR/TrpHxhqYuaiHFogZQ/sD8QvHlJdyiPyMvHJ2CqH+CoNGbnmMF+PHrt
	Y4MBp5lkow79V3M/L/lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0vdN-0058nY-2P;
	Mon, 22 May 2023 02:50:53 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0vdH-0058ll-0R
	for linux-riscv@lists.infradead.org;
	Mon, 22 May 2023 02:50:52 +0000
X-QQ-mid: bizesmtp66t1684723824tixnfbhg
Received: from localhost.localdomain ( [221.226.144.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 22 May 2023 10:50:23 +0800 (CST)
X-QQ-SSF: 01200000000000204000000A0000000
X-QQ-FEAT: fp7GbACbaw5+/Q/MDriKgD9K7a4eKyWoz7734QLbFWStCUU/K7or6Lv1s5wOQ
	z89TIgb0hFWuT+B13h0yWpejC28/IEq+yFu5lnWDBG//Hf0Vw5LHFNvPNgOi6Bu6SS1MM5A
	mZi57ZiIsGAlPBD7i0UGXyb7AhQf/J2SDcp2KZM8wDWqlBaBjt/Nf2EsPHPCYK4Fpb7Bz0r
	V5SYhnifPJ6awCgeF8okbGEiD4YWUK+R1WCgYPBhYmAINustflXk79e14nHnpLSL6IKbtjH
	7Aw5Ccd02qII2Iv5a6ovTcZtirCSalh//tzOo9q75WEawLfmRA/6/E3YrV+63bo9spXftFG
	brd6ajRUBnvXlVsH0Xvsmt9srrsIY1F6RxRF5aaJgJDz41/PxU=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14716206032302420397
From: Song Shuai <songshuaishuai@tinylab.org>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	suagrfillet@gmail.com,
	mason.huo@starfivetech.com,
	leyfoon.tan@starfivetech.com,
	ajones@ventanamicro.com,
	jeeheng.sia@starfivetech.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <songshuaishuai@tinylab.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V2] riscv: hibernation: Remove duplicate call of suspend_restore_csrs
Date: Mon, 22 May 2023 10:50:20 +0800
Message-Id: <20230522025020.285042-1-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_195047_500796_7F450287 
X-CRM114-Status: UNSURE (   6.91  )
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

The suspend_restore_csrs is called in both __hibernate_cpu_resume
and the `else` of subsequent swsusp_arch_suspend.

Removing the first call makes both suspend_{save,restore}_csrs
left in swsusp_arch_suspend for clean code.

Fixes: c0317210012e ("RISC-V: Add arch functions to support hibernation/suspend-to-disk")
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---

Changes since V1:
https://lore.kernel.org/linux-riscv/20230519102908.253458-1-suagrfillet@gmail.com/
- fix incorrect email in the Author and SoB field
- add Fixes tag

---
 arch/riscv/kernel/hibernate-asm.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/hibernate-asm.S b/arch/riscv/kernel/hibernate-asm.S
index 5c76671c7e15..d698dd7df637 100644
--- a/arch/riscv/kernel/hibernate-asm.S
+++ b/arch/riscv/kernel/hibernate-asm.S
@@ -28,7 +28,6 @@ ENTRY(__hibernate_cpu_resume)
 
 	REG_L	a0, hibernate_cpu_context
 
-	suspend_restore_csrs
 	suspend_restore_regs
 
 	/* Return zero value. */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
