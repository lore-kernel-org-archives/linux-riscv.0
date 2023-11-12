Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78E4C4167D
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HbBmmMUPPihKKEU4U1IsRAE/S+mYrhqHiz121dbv7bY=; b=k8Ng7cjx9E9gUI
	/osczshPT9lCAionEgl8Zjgn1lVLozuWX8RhF++exCwWgZSelpVPHVeust9KBe9MXG+k2gRtp/nu+
	doUd4zwFOP8+pGW2jV2lT0g1dQCNvRy+5QV7dV1zetDu4K9tfDiGsIoNIGunQabZmJgOgyMMzEv31
	68kgMAbNuyrQoLkHOk7hl1bYY2kWynis6BpDbckiDZwF3lXCw7u8cfjK/mI8OwE8tzoI494KSy5xR
	csLDYEd8lgstbfEzvb6vJR4MLG57XlRFBemPKtZ2F/rR6/DqQx5j662w23/Ry5S9L6aUPPkJn8Ii2
	xG/WMExjzhduIiJlVcHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23oO-00BlXv-2t;
	Sun, 12 Nov 2023 06:19:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23oM-00BlUx-02
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:19:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 31563B80A2B;
	Sun, 12 Nov 2023 06:19:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DF4C433CA;
	Sun, 12 Nov 2023 06:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769947;
	bh=NRQ3+7zYtWxcLMyaVKQL6b/W2ki6kHtASjhWDkIuCOI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VbI2EEzZrCv1lHLtCSo4ml+lsXoi2BDR011BlUq9xT0ZNKfCfIJqP1pKQzJBh8N7g
	 kiMUAnJS6x4AZgmjx2yE/Ll/Yh2fkJYiBAoM1ZsZW9v4oJc0VHf32QSGCngpncB27v
	 LrJ7/m8DB/od4SkM4KJERf+onE6k2uJojjXohO3T1P7hGXPF9PwyWGjUI50nFnK721
	 NoXn00HX/mfQHlJg2099EljXDIxLj0RA4ke7+vHnDG/TY9K29A8ZFU5Obq3R9yBR2D
	 rgeYSxG2x8DJrDFwGs5DcDwJRy82wG1hlg4UfnC8H60hdWaKQfalzVHUZciXmdD3qd
	 MVlNJeiEpTn4w==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	anup@brainfault.org,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	wefu@redhat.com,
	U2FsdGVkX1@gmail.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com,
	luto@kernel.org,
	fweimer@redhat.com,
	catalin.marinas@arm.com,
	hjl.tools@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V2 36/38] irqchip: riscv: s64ilp32: Use __riscv_xlen instead of CONFIG_32BIT
Date: Sun, 12 Nov 2023 01:15:12 -0500
Message-Id: <20231112061514.2306187-37-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221910_192544_1FE085AE 
X-CRM114-Status: UNSURE (   9.29  )
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

When s64ilp32 enabled, CONFIG_32BIT=y but __riscv_xlen=64. So we
must use __riscv_xlen to detect real machine XLEN for CSR access.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 drivers/irqchip/irq-riscv-intc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 4adeee1bc391..ee3514ef4326 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -22,10 +22,7 @@ static struct irq_domain *intc_domain;
 
 static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
 {
-	unsigned long cause = regs->cause & ~CAUSE_IRQ_FLAG;
-
-	if (unlikely(cause >= BITS_PER_LONG))
-		panic("unexpected interrupt cause");
+	xlen_t cause = regs->cause & ~CAUSE_IRQ_FLAG;
 
 	generic_handle_domain_irq(intc_domain, cause);
 }
@@ -117,7 +114,7 @@ static int __init riscv_intc_init_common(struct fwnode_handle *fn)
 {
 	int rc;
 
-	intc_domain = irq_domain_create_linear(fn, BITS_PER_LONG,
+	intc_domain = irq_domain_create_linear(fn, __riscv_xlen,
 					       &riscv_intc_domain_ops, NULL);
 	if (!intc_domain) {
 		pr_err("unable to add IRQ domain\n");
@@ -132,7 +129,7 @@ static int __init riscv_intc_init_common(struct fwnode_handle *fn)
 
 	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
 
-	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
+	pr_info("%d local interrupts mapped\n", __riscv_xlen);
 
 	return 0;
 }
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
