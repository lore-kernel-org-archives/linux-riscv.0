Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2582C3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 16:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aOs22PRBbLpP8xeIEga3lTPC3E8XE5OxIhfj8yndWKQ=; b=rrBycw8H0lq+Yr
	Q7f/fAggFRW+uY/AtaLybKlKnfIEnL5UVo3ANHKqskkI1hChrvBKTtBtymA6gGxGwpwN9AWDOQ4lz
	sI3QeHCIG+xlD+66aCPJQr2AJhKX63ZiLkZXllkLcbXlj89Z1bn2ZwofJmNbLceVYTJpRc5vFk/YS
	a3DED+2+ukmOADztfSgFoHPJI1PwvltUojEWuBptNx+9Au6HD8ZRpg2JNZKBPtdzFz/xs/ieYoktB
	v43TC958t5p3W91ueLOm5ZLZfG+x5r/QktFVxJzBcGwZuqep0DUi32upbfbIimqGVlCupRPiUI6Am
	SAYltTn6OtIOC5JtkatA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRwY8-0000000EfMx-1Eih;
	Thu, 11 Jul 2024 16:21:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRwY4-0000000EfLW-3JkG
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 16:21:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D03761DA4;
	Thu, 11 Jul 2024 16:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA722C4AF07;
	Thu, 11 Jul 2024 16:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720714895;
	bh=2lkZDO62KKSLWoCZyINk2tMegh2s5zBoWrcbbgs+qh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SLQvcD8Sff05TBENEvofTjbdmesTqf2NPUlspiQ/Voj+aB6BV1h23XrCpi7qwawMV
	 CifuO2YwsYlm1GHM/RTnoQHcygrdA9Xy4xgB7ORlvIMOQsTJ6KkyruSbqJ16IUMjQ2
	 rx2kbjHGNrODg8kVu52A1Nssnp0LTI6p0bl8Wbu/pteurjOn6vPOyAMbYKUJmnXItQ
	 +fNFHszgzdR/sCkO0MGjg+Wl34904u7cTYpd+mSXUlN0hlHu7ytBa6RY5VpuOU391D
	 e4ZVq9OL9bZSc/eR+mnWtJACTQvzhQhURy17YJonWXwWQxHlijtgYWzLUWEGBc85QI
	 v+L0gImT8LO8w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/2] serial: 8250_early: add xscale earlycon support
Date: Fri, 12 Jul 2024 00:07:20 +0800
Message-ID: <20240711160720.3488-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240711160720.3488-1-jszhang@kernel.org>
References: <20240711160720.3488-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_092136_906887_0CAE558F 
X-CRM114-Status: UNSURE (   8.23  )
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

After commit 3a50365d8c79 ("serial: 8250: Add OF support for Xscale
variant"), 8250_of can support the xscale variant. Now, let's add
the earlycon support for xscale too.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/tty/serial/8250/8250_early.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250_early.c b/drivers/tty/serial/8250/8250_early.c
index 2ab61d6673d2..6176083d0341 100644
--- a/drivers/tty/serial/8250/8250_early.c
+++ b/drivers/tty/serial/8250/8250_early.c
@@ -178,6 +178,7 @@ static int __init early_serial8250_rs2_setup(struct earlycon_device *device,
 
 	return early_serial8250_setup(device, options);
 }
+OF_EARLYCON_DECLARE(uart, "intel,xscale-uart", early_serial8250_rs2_setup);
 OF_EARLYCON_DECLARE(uart, "mrvl,mmp-uart", early_serial8250_rs2_setup);
 OF_EARLYCON_DECLARE(uart, "mrvl,pxa-uart", early_serial8250_rs2_setup);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
