Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F25C48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 19:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1rFMIcQ9fJdwLSwQS2z1KXmVbbYnJ1ANvJ3oyRjHBUk=; b=iqzioGXG0EogGX
	NS+jabDXZd+73EcgfSXc72gauyL37K5du+jyN6KdEoS8fj5DGdQq8zy/Oe3hN7M8cesExVY7CGOPM
	JdOLHgbqGvRn9X0hYiHtX/ow2le0dYlnjLKTiLifdx/GuwxyceWeSEFebYJn0AMGZRvPve4svg2Gx
	aoeod+Iv7TYuzLnbmO/eT3QTS0sWfWqbr2N0gd0T6EL1b1ULxJW8TXl+5Ns8qM2a6DQ31q5kvqzda
	1t9dL8pRELhHQfvS3RIKwQ4FNw74PECWADot2nLwdtqlN/C0+63IX9k9LvRUUkWZUvW9fabsBD0GW
	QaU6UoG191jCU8T0eg7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZylc-0000000AWrQ-2917;
	Tue, 13 Feb 2024 19:48:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZylZ-0000000AWr4-2gXd
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 19:48:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D38DD616A8;
	Tue, 13 Feb 2024 19:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B5CC43394;
	Tue, 13 Feb 2024 19:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707853707;
	bh=LOX8mWhWCWZAzKruDHe75rVsGqtYVGs5VrfHwVtW92g=;
	h=From:To:Cc:Subject:Date:From;
	b=a0bT8f+OiuU6Q8XK7AHs8YiV9SKRQFKU3+g8x4UA6/L0YBT+1RNRJHAmcxaiqUIne
	 a/g451M18CFooVq7j3xKNlefamQ396FcWyM/vjEQPaV0k2J8Dx+iBqMOWk810dH3s5
	 9Z2KBoRNCw+VH+LPXTdqiOv2srGNyfkBKhCuaE4BTtPqoWLoiVSYS0W6AU8PwpEerE
	 XJ8ArnWwXa/4Lm51owJSoNUKxHR6E8sWdSd508dPho4h9yRPTk1I76LhmShQFzDgZy
	 GDYyjP4pz9X7jdFcT0SyXDMi3DYt6sic3gnbu9nctVstSyexxyFkhsQud8kGRA3W6W
	 v7tylbWl4tK3Q==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] riscv: dts: sifive: add missing #interrupt-cells to pmic
Date: Tue, 13 Feb 2024 19:47:19 +0000
Message-ID: <20240213-protegee-shoplift-c9bc09f62a7a@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=861; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=qoFy0Tjh9UWMI4zeMpY9R1fk4+oiT4sSbjgFJsKhQcg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKmnj7sZhIfkF9bnX+qxm3rrw5+0i4fTtiXlKnt9vXnOc ZZUj+7FjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkgjYjw5r32jN95dd0FGx+ u/naPps5bK+25xpNqXbLmp7g1LVE/xMjw4sbllemH9J8WKGU+rcjdu8rSbYiji3r1SoaIvg3Twp w5AYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_114829_751591_4A7C030F 
X-CRM114-Status: UNSURE (   6.10  )
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

From: Conor Dooley <conor.dooley@microchip.com>

At W=2 dtc complains:
hifive-unmatched-a00.dts:120.10-238.4: Warning (interrupt_provider): /soc/i2c@10030000/pmic@58: Missing '#interrupt-cells' in interrupt provider

Add the missing property.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 07387f9c135c..72b87b08ab44 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -123,6 +123,7 @@ pmic@58 {
 		interrupt-parent = <&gpio>;
 		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
+		#interrupt-cells = <2>;
 
 		onkey {
 			compatible = "dlg,da9063-onkey";
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
