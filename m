Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25884C6FA86
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdBSAIvGG8hnKbzm6ZUe26H3vtQCmfnFfsDin+kit0Q=; b=moMfJMVgNNKnjM
	+ezQ2gnBZeMZO/qEvjM/5jm2sIEEBfSn58NkKWsR8azvjr7fL5upFO2dguwRetLeNJ2h2DGwpSxNO
	F//rlasFBllm1dF/aVk1Wua+uFJt5QaDKX3k82PfbilltdgHOib/Zcar+fgrnaUnuxABXUfv2Zj+z
	Akfs0JamOEFFhHREQ56d+/F1fzwR8QPrDj3s4Bj5KYWYtyhaU84nD6pHYNEcLhmkptO+BaXDOfuOt
	WxqXPvBWPCrFHlsKF/Wrukj67z9/QkgiempyjP5yDWN9Fj1R8yY0RQ1JeGrog8j1rBS6/F/rJLQG7
	hM2CcaTKK8fy7YAt+wpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrV-005QLe-Ap; Fri, 23 Sep 2022 18:57:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrR-005QJy-Ax
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F1FEAB8239A;
	Fri, 23 Sep 2022 18:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1567C433D6;
	Fri, 23 Sep 2022 18:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959434;
	bh=wdNj8i+xnIBbvXB2PbijpzCf2x/tqzD37FI/ksYv71A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DUonFgbSUWOpLdLEoTV2X6oXwJglI1obV+wusUv5c0iMHS/MJulB+gBeHdkHY9eyh
	 xLTg590Zhv/XPA9xhQMC/O1qAkVz0uCT2pvkeLnXI3vZPmFd2x/EZlrZ25iC4+Qdyg
	 B+jkey3XihlU9bw0bnHKX2eNHlrXKxW9tcppz1GLCnT3S3xFhIHmIEuTEUr0VRAiDN
	 WgUbSPl4L8EJ37wp4sjWvvOB9UkuxRaHxzzSL+wsuUMrQLqkcOf2UFpzK13zqOitsF
	 oL8u/YVDEqWGcM2ASmWi6h/MKti5V5RBEmC2/kOPi1qBkUvHIkFQhQat/agDMUqSsH
	 xIUqeARrNU1uw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 02/27] i2c: microchip-corei2c: replace SOC_MICROCHIP_POLARFIRE with ARCH_MICROCHIP
Date: Fri, 23 Sep 2022 19:55:41 +0100
Message-Id: <20220923185605.1900083-3-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115717_557188_F3D2E9A0 
X-CRM114-Status: GOOD (  11.29  )
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

At LPC, we decided that for the sake of consistency the SOC_FOO symbols
in arch/riscv should be replaced with ARCH_FOO so that we could have a
consistent policy regardless of whether a vendor had ARM legacy or was
a RISC-V "incumbent".

microchip-corei2c depends on the SOC version of the symbol, so convert
it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 0c48d8a9f44a..9915aea1ad8b 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -785,7 +785,7 @@ config I2C_MESON
 
 config I2C_MICROCHIP_CORE
 	tristate "Microchip FPGA I2C controller"
-	depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	depends on OF
 	help
 	  If you say yes to this option, support will be included for the
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
