Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115CCC10DC3
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 15:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8QVk4ecuXWDQYOy+cxUVzmkT6AEawMCg30aQypKj/P8=; b=mvGSqgTIs/kSCf
	x9OyzJYhZsDP6pkTJe6U0WNQuRGqKzCdQY+SBlKBmVfgw1+R2AfcNl3+wC1noaj2XUrUJdR4OblvL
	dPGt/Bfp2h4iGZ23VIwFtU3RcLde0Ugaxpv3c9FBSSSoNHiouVNFAN5Rn8KF4nATXEDAqtzy5nlF1
	iI8hK2CuBn6e94elviFEd1LgTB4iRo/GDaQUTeFOGpy/DYfkMn8VSlyHmN79uefjdV42gTWxvspW1
	5u7khETVvgb6bFTSvKLJtMXmVFtUNiK6xsBPhk3KlTm6M3DmXKNVFzr7urvCk+gfYWn179YVsEywt
	eZ5y3KtOkzVyYkvEL2vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCiEr-005RTy-0S;
	Mon, 11 Dec 2023 15:30:33 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCh4r-00598k-2a
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 14:16:12 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702304168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppjU+31LnK9VxtavD2GvL4JVjKrjbiZoU7R+ROKBQw0=;
	b=hDjdil+9JU5/ytG0e6pkeyZEi9edP1ZWxu1wXzWH9ftXHULdjTHR1m6Pidh/DpgHOJYozI
	XhD5eCdVGfxOBwp5i25Vvxwn+ipA0o2iZpmzoKMuDTtBdWZr/bdKalDhIRgo39NV6DCNWk
	oCdvQR4T06kV0c8sEJnSmaRiiN8Pq4Rdro2hV3WDV4IP1SXNIXAp+RLXJZ7dl+hMU1T3LS
	+yVnBMcUdWUrFNwsneDvxu9wkG9fdvJYPkmcl13RMSIqKFIDtAuXU84mTO5hfCpzUCkcId
	eJLJRXkgv94QnTJJQdLce7L+H+N0r6hlJHcC6IhDwDfVyMdp+8x+cBUlXJPx8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702304168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppjU+31LnK9VxtavD2GvL4JVjKrjbiZoU7R+ROKBQw0=;
	b=ibuq7a5Az7Pjp0C516ChSpwDNo8VYpdGUiMuwu2e4BF0j1aNiiNTNq3aHUS31bE6P+aI6D
	IgAuM+cNwzYVydDA==
To: stable@vger.kernel.org
Cc: jiajie.ho@starfivetech.com,
	palmer@rivosinc.com,
	conor.dooley@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>
Subject: [PATCH v6.1] riscv: Kconfig: Add select ARM_AMBA to SOC_STARFIVE
Date: Mon, 11 Dec 2023 15:15:55 +0100
Message-Id: <20231211141555.89648-1-namcao@linutronix.de>
In-Reply-To: <20231211145750.7bc2d378@namcao>
References: <20231211145750.7bc2d378@namcao>
MIME-Version: 1.0
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

From: Jia Jie Ho <jiajie.ho@starfivetech.com>

[ Upstream commit 78a03b9f8e6b317f7c65738a3fc60e1e85106a64 ]

Selects ARM_AMBA platform support for StarFive SoCs required by spi and
crypto dma engine.

Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
[ resolve conflict due to removal of "select SIFIVE_PLIC" ]
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/Kconfig.socs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 69774bb362d6..29d78eefc889 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -23,6 +23,7 @@ config SOC_STARFIVE
 	select PINCTRL
 	select RESET_CONTROLLER
 	select SIFIVE_PLIC
+	select ARM_AMBA
 	help
 	  This enables support for StarFive SoC platform hardware.
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
