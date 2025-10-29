Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E30CCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 15:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hkEyDsmQ0d4Q6uz12rEZgCdAHEKYC8WuYjVClpNXJRM=; b=HTqvXN0vTHmzU7
	w83J8C9RnfE+D9SiNCHz2s5W8nikqdGFRB2AdfnZ8yUncvZAT0ryEnZPJYEj0pWvpaab2c4Df3Qfu
	Wmc1QETZj26dCXO3pc7M0pcpl/8ZZ8e0vRyzltS2ExFR+4tpx8n72vkXXA5hxJxCGE+jUQjidtb5N
	iHT6y4yz6sdQisiNa42oyr1OOtgsEI/QpS1g5ASENuR4zDQZhNKTErRX3bBJuKuEft7lPpJvpgdg0
	Qqr/176iqEa6kiYR34UEFmns5SoCoR1kuptIEIiox2WKIRH12Rv3T0ROPQSuIWNgWD8CiRmMcDY/l
	lKAcES/rr+BZKPHWzSdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE88P-00000001naX-2CrZ;
	Wed, 29 Oct 2025 15:30:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE88N-00000001nZe-341s
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 15:30:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C1367621A5;
	Wed, 29 Oct 2025 15:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9C0C4CEFF;
	Wed, 29 Oct 2025 15:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761751846;
	bh=2hdstVg2puYafsBTOCnoES2CaeIJ0Hw7wVB412L5tmc=;
	h=From:To:Cc:Subject:Date:From;
	b=F5MfGFC6PNY3c/r+xiQ3oupqq/p5ciVtjbPUIaFLY3o+P54GPUz0NhHfaAkPkkD8B
	 AdtsVuYPAgzo10GgJl/1vqp2zOjie1CsReBn46UotstWVHRTicclQ5Ii0sjOCHiyzO
	 W+Apb+Z07HSjhsfx4DxsYyGCnoFjkBDHVZUOMP/Y4y11cy5SgEZBHf4KIbPm60IVAe
	 epDusAWSZpQynZqm0M2c834iMfWNiDKNdB/ujR1hjWZ6Ki99cY3Y6lvAEyKU3ZRQnW
	 USIC+LAkp//kmaictwnDttOb+D7wdsY/qv/qrqv2l74myOA4OtrDUL3Dsd3NFpZ/ee
	 tpznUKJSs96kg==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v1] pinctrl: mpfs-iomux0: fix compile-time constant warning for LLVM prior to 17
Date: Wed, 29 Oct 2025 15:29:35 +0000
Message-ID: <20251029-isolation-shield-b66aea79a9a4@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3792; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=k5YmnBFs6Pdap83fQ2HuN6cRh1zztlgSjeWri2rbeJQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlMRvdi928S8DXVnSeicjBMIDL5wZ6u84esVDbvff4r7 6G+Q+HqjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzEuZThf+KqVf+Ncl+98yia wfW1lfN+/p5lX3fcnbZP48fEqwrrHQ4x/Hcu2KW29N2No73SjRq7nU0UA5uSPn3oOXhQUOjhnI3 zlnMBAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

With LLVM prior to 17.0.0:

drivers/pinctrl/pinctrl-mpfs-iomux0.c:89:2: error: initializer element is not a compile-time constant
        MPFS_IOMUX0_GROUP(spi0),
        ^~~~~~~~~~~~~~~~~~~~~~~
drivers/pinctrl/pinctrl-mpfs-iomux0.c:79:10: note: expanded from macro 'MPFS_IOMUX0_GROUP'
        .mask = BIT(mpfs_iomux0_##_name##_pins[0]),     \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/vdso/bits.h:7:19: note: expanded from macro 'BIT'
\#define BIT(nr)                 (UL(1) << (nr))
                                ^~~~~~~~~~~~~~~

This is a constant, but LLVM prior to a change from Nick to match the
gcc behaviour did not allow this. The macro isn't really all that much
of an idiot-proofing, just change it to the same sort that's in the
gpio2 driver, where a second argument provides the mask/setting.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Link: https://github.com/ClangBuiltLinux/linux/issues/2140
Fixes: 46397274da22 ("pinctrl: add polarfire soc iomux0 pinmux driver")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

Not entirely sold on the fixes tag since it's to shut up an old
compiler, but no harm in it I guess.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
CC: Bill Wendling <morbo@google.com>
CC: Justin Stitt <justinstitt@google.com>
CC: linux-riscv@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: llvm@lists.linux.dev
---
 drivers/pinctrl/pinctrl-mpfs-iomux0.c | 36 +++++++++++++--------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mpfs-iomux0.c b/drivers/pinctrl/pinctrl-mpfs-iomux0.c
index 49d9fcec0a16..cf5b2e4e8f5b 100644
--- a/drivers/pinctrl/pinctrl-mpfs-iomux0.c
+++ b/drivers/pinctrl/pinctrl-mpfs-iomux0.c
@@ -73,33 +73,33 @@ static const unsigned int mpfs_iomux0_uart4_pins[] = { 11 };
 static const unsigned int mpfs_iomux0_mdio0_pins[] = { 12 };
 static const unsigned int mpfs_iomux0_mdio1_pins[] = { 13 };
 
-#define MPFS_IOMUX0_GROUP(_name) { \
+#define MPFS_IOMUX0_GROUP(_name, _mask) { \
 	.name = #_name "_mssio",	\
 	.pins = mpfs_iomux0_##_name##_pins,	\
-	.mask = BIT(mpfs_iomux0_##_name##_pins[0]),	\
+	.mask = _mask,	\
 	.setting = 0x0,	\
 }, { \
 	.name = #_name "_fabric",	\
 	.pins = mpfs_iomux0_##_name##_pins,	\
-	.mask = BIT(mpfs_iomux0_##_name##_pins[0]),	\
-	.setting = BIT(mpfs_iomux0_##_name##_pins[0]),	\
+	.mask = _mask,	\
+	.setting = _mask,	\
 }
 
 static const struct mpfs_iomux0_pin_group mpfs_iomux0_pin_groups[] = {
-	MPFS_IOMUX0_GROUP(spi0),
-	MPFS_IOMUX0_GROUP(spi1),
-	MPFS_IOMUX0_GROUP(i2c0),
-	MPFS_IOMUX0_GROUP(i2c1),
-	MPFS_IOMUX0_GROUP(can0),
-	MPFS_IOMUX0_GROUP(can1),
-	MPFS_IOMUX0_GROUP(qspi),
-	MPFS_IOMUX0_GROUP(uart0),
-	MPFS_IOMUX0_GROUP(uart1),
-	MPFS_IOMUX0_GROUP(uart2),
-	MPFS_IOMUX0_GROUP(uart3),
-	MPFS_IOMUX0_GROUP(uart4),
-	MPFS_IOMUX0_GROUP(mdio0),
-	MPFS_IOMUX0_GROUP(mdio1),
+	MPFS_IOMUX0_GROUP(spi0, BIT(0)),
+	MPFS_IOMUX0_GROUP(spi1, BIT(1)),
+	MPFS_IOMUX0_GROUP(i2c0, BIT(2)),
+	MPFS_IOMUX0_GROUP(i2c1, BIT(3)),
+	MPFS_IOMUX0_GROUP(can0, BIT(4)),
+	MPFS_IOMUX0_GROUP(can1, BIT(5)),
+	MPFS_IOMUX0_GROUP(qspi, BIT(6)),
+	MPFS_IOMUX0_GROUP(uart0, BIT(7)),
+	MPFS_IOMUX0_GROUP(uart1, BIT(8)),
+	MPFS_IOMUX0_GROUP(uart2, BIT(9)),
+	MPFS_IOMUX0_GROUP(uart3, BIT(10)),
+	MPFS_IOMUX0_GROUP(uart4, BIT(11)),
+	MPFS_IOMUX0_GROUP(mdio0, BIT(12)),
+	MPFS_IOMUX0_GROUP(mdio1, BIT(13)),
 };
 
 static const char * const mpfs_iomux0_spi0_groups[] = { "spi0_mssio", "spi0_fabric" };
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
