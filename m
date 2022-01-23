Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE76C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jan 2022 09:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8O3sEXTYuqLHKYPJP5oKX5yYTyvwmSjXWoQLtsjiCus=; b=eUJbsgvTuHxo5X
	NSzf6KIT7UWMLi3RplSQ/65YNCaryM66nnCRz5iYi+d9gzGZTmC3k2ZYtnuz62pDDvr+IBieF4DJu
	Js0a5krlJBGzs0q7zU5o1LrU4Oc9EAn3B2rGwZyfB9wJHhqv0t4aMmE2o5rd9tO3BznYzZ6Za1Mg2
	HogvtdHgj8NYbVp3h5h1q92dWsKeSVKxeU71AXvdsFM5scOlyn2YLdb2JWkkDAAf5RXfGt5D9P1Mr
	eYptxvNhLuHP0DKr4PP5k0INeus5JT7q9w/XMCTRmhOqu+M+FroG9M/NWbR+mZAc4n4CSYuHEqh0h
	z6l/rEaQQN+gl1+ZYVIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBYui-000VCy-3x; Sun, 23 Jan 2022 09:11:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBYuf-000VCU-QH
 for linux-riscv@lists.infradead.org; Sun, 23 Jan 2022 09:11:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76D3560920;
 Sun, 23 Jan 2022 09:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69046C340E2;
 Sun, 23 Jan 2022 09:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642929111;
 bh=GY0mrEgMOzSKYYtrDyOe4VtoCDIItsAvJ4mvQZEWyBI=;
 h=From:To:Cc:Subject:Date:From;
 b=SoOM7DOLAc8e2q4paRwbWH5vQRJmAtFLeiIUtAM/OJHlSBDEhHN7uaKaVNuK2UU2Z
 kihXg33VqYjwC7QEB6PvPxNVljrkq1Rp/TRPDuY4I+biTsUj1+YY34avXYVLp7bbS8
 j3FrOhSJG1VCiwVskW0NoS875dTKJULRElPrWfKfhop7QwI1LoSqfMCgxN58oCXExO
 1oj9u5LVhNN5vqmmjlF7Fq7JpEtYib77mNto90LUOHsTNU28L71f+2rlteCxKj1SL2
 asgr2iRzhCrLWVbrC6rjacE7xZ/jPIuhjSZOvJEdRLC2t+YhOYpoUPUQZeGG9mPSWW
 bWSmt5MLx3hxA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH] riscv: extable: fix err reg writing in dedicated uaccess
 handler
Date: Sun, 23 Jan 2022 17:04:17 +0800
Message-Id: <20220123090417.630-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_011153_937445_218AED71 
X-CRM114-Status: GOOD (  11.93  )
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

Mayuresh reported commit 20802d8d477d ("riscv: extable: add a dedicated
uaccess handler") breaks the writev02 test case in LTP. This is due to
the err reg isn't correctly set with the errno(-EFAULT in writev02
case). First of all, the err and zero regs are reg numbers rather than
reg offsets in struct pt_regs; Secondly, regs_set_gpr() should write
the regs when offset isn't zero(zero means epc)

Fix it by correcting regs_set_gpr() logic and passing the correct reg
offset to it.

Reported-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Fixes: 20802d8d477d ("riscv: extable: add a dedicated uaccess handler")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/extable.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/mm/extable.c b/arch/riscv/mm/extable.c
index 05978f78579f..35484d830fd6 100644
--- a/arch/riscv/mm/extable.c
+++ b/arch/riscv/mm/extable.c
@@ -33,7 +33,7 @@ static inline void regs_set_gpr(struct pt_regs *regs, unsigned int offset,
 	if (unlikely(offset > MAX_REG_OFFSET))
 		return;
 
-	if (!offset)
+	if (offset)
 		*(unsigned long *)((unsigned long)regs + offset) = val;
 }
 
@@ -43,8 +43,8 @@ static bool ex_handler_uaccess_err_zero(const struct exception_table_entry *ex,
 	int reg_err = FIELD_GET(EX_DATA_REG_ERR, ex->data);
 	int reg_zero = FIELD_GET(EX_DATA_REG_ZERO, ex->data);
 
-	regs_set_gpr(regs, reg_err, -EFAULT);
-	regs_set_gpr(regs, reg_zero, 0);
+	regs_set_gpr(regs, reg_err * sizeof(unsigned long), -EFAULT);
+	regs_set_gpr(regs, reg_zero * sizeof(unsigned long), 0);
 
 	regs->epc = get_ex_fixup(ex);
 	return true;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
