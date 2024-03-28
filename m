Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD17CD1284
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 17:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0tk1rsxVyRibtHSj7lOKGfyFZ0bi10IIMCb5PXrJ/g=; b=KygMuS7cteerJV
	R67zhhVU5TgAi+rfDSxUq0DIvTHaOROnhLw8t3cMoqp2Qh7YAMYkCYu+TJT1cAMyvTm+G4PkHDDXd
	1E+XZ4N046pIO46SHhd+6pnKUyh2Sj4yS8bxghurbEjgeVvFYxnkWQXVy/bn9w6KJzzeTIy2qEwIr
	T9Gdw+BW2gsvDnF6Hq75Qk6BEetAFG19URhuw8BN6GU1FIyBhwsY43w6+c/VbazTO++fKnNrMYmbt
	n27dkJn897Navehb2FPgg2T0yB6QCQKlXjklHFHQjCvyRiK9+DO25QoYgLK4F9DkAF0Mcd3A/Sn3+
	/9Wsu9EIR4DbpvkwV6rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptDE-0000000EuOA-1ZVB;
	Thu, 28 Mar 2024 17:06:48 +0000
Received: from out203-205-221-149.mail.qq.com ([203.205.221.149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptD8-0000000EuIU-1v1K
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 17:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1711645594; bh=RnwPI3xUzFH0YfHcr806XZGfdJDxCh40cBGvRvtlcpo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=z4LPhXyV6zXEPym+gj6mxKT1QL2cG0syvinZaEvp1/mOYWJ4A/pX+3cqoWfvnka0p
	 Bbr7+FoWEYpRWrjOlZDh46s3G6Hxz8/AwOJjULFchn/5f/1PEkGFXIrQKNvf8JGkJa
	 +UWbn7wB8TU6FVijnCEatUur5kKhEnIG8EhWlYF4=
Received: from cyy-pc.lan ([240e:379:2277:8a00:7feb:196a:dd5b:c05f])
	by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
	id 199B7A03; Fri, 29 Mar 2024 01:06:25 +0800
X-QQ-mid: xmsmtpt1711645591tckem6orr
Message-ID: <tencent_9B2484D4343EF1ED092E6A1F3A66E206C40A@qq.com>
X-QQ-XMAILINFO: NQR8mRxMnur9xxghampKTcaF5ygM6Xb3xSu1tk3h3SU9QixsXNmc8ddLbj5+bM
	 VVOLuu0xXtZ0DO9etmedCYZOVEFeWmtfQKaowR079nT94bzbxvjJr6m5Gykd2e/sEAYMkxERPtHb
	 xtvwT2TPDvwDpg0siCck/O8aEb7NgNctEMkTdj6Px4aGCFerSGGUW7G+QAoMApznDrpnLwFd+/WH
	 2v9UCo1KCwJSiQwdSCEAIfU5wxPc7rroWAC36CbIl+HzkP/nN27ZtdsH0KkJUKnrLe53gRp+F6ki
	 I+CxTQs6erhGmNo0vg2M4E+eE4mJEyZqFKGMMB6XgKCzW3r04yTOAzWJ9EerY7KTArJitCzp4O7p
	 2zfM7QTyvCe7CBOVIMuRhvfyOf1k/uPUK8nu0I1SmX3IjA48fBD/lHWAksTY3PiDuQ5fyPPQd9gJ
	 +E/M0CAnu2f14ACDd54RFzb4rL+lGwRo4Dlp2g/nLrAUTb0Ks0GXT/wnliHwVDaBQKvEnGWWwdhJ
	 sU8qp+1dVIfS+Z3Am/2JqYGF2PxJhbtHJk48TinV4lQK5sp4wuUuJ9qb1RaEB7GNSnsWIr/AyBXf
	 coysIo15AnyIPfrFaid2LTZNLBSDx4x6Q3ZkKYPVKED0/Jm1bRHoILu9X352thpGKWzc41ewAJyb
	 DoDaWcUM4mw3AtSBeVPJ4s3sx+wvRstvF/tz/Afx8l7MiFdumk7BV5NLmnPqaAAe6tBmcom/W9RM
	 I3cvcG26hhKkC6VvIJfKRt1Ww6V/mlspajE0Ei6ecbIpZfWwsXYGHEp0mtmUSuwkh4Ii5Wl06gYw
	 5UzhNv5O+3EpSOIAqiSdpg+29BjxxZF8fhr2iuHAUPW1n7fBYr44lOAtTXrT99DYE0VckGpAGbTQ
	 FOwvNnuKFEDoMsaMX4E9TH7dL6nf1d+xLPegg92xl/ys1ClSfdo76G6+H6jdmKP/bwzF7dPI8YVi
	 5bejQZHNUIKLJAdI0lnb4VNAafVvLD1kKdXW+KKBl4RFA1P5qj3+G3D02Uz9/DpTPQTTtxCJd+/Z
	 SKkkl+kfkaVBR1mkEA6AgUTFRKqH1l+nd1pbz+/Q==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v1 2/5] soc: canaan: Deprecate SOC_CANAAN and use SOC_CANAAN_K210 for K210
Date: Fri, 29 Mar 2024 01:06:10 +0800
X-OQ-MSGID: <20240328170613.120131-2-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_2E60E33C1F88A090B6B3A332AE528C6B8806@qq.com>
References: <tencent_2E60E33C1F88A090B6B3A332AE528C6B8806@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_100642_933774_B1C08211 
X-CRM114-Status: GOOD (  13.11  )
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

Since SOC_FOO should be deprecated from patch [1], and cleanup for other
SoCs is already in the mailing list [2,3,4], we remove the use of
SOC_CANAAN and use ARCH_CANAAN for SoCs vendored by Canaan instead from now
on. Thus, we should also change the Makefile here to use ARCH_CANAAN.

Then, since we have introduced SOC_CANAAN_K210 for K210-specific drivers,
we should replace its drivers depends on SOC_CANAAN_K210 and default select
when it has the symbol SOC_CANAAN_K210.

[1] https://lore.kernel.org/linux-riscv/20221121221414.109965-1-conor@kernel.org/
[2] https://lore.kernel.org/linux-riscv/20240305-praying-clad-c4fbcaa7ed0a@spud/
[3] https://lore.kernel.org/linux-riscv/20240305-fled-undrilled-41dc0c46bb29@spud/
[4] https://lore.kernel.org/linux-riscv/20240305-stress-earflap-d7ddb8655a4d@spud/

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 drivers/soc/Makefile       | 2 +-
 drivers/soc/canaan/Kconfig | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index ba8f5b5460e1..fb2bd31387d0 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -7,7 +7,7 @@ obj-y				+= apple/
 obj-y				+= aspeed/
 obj-$(CONFIG_ARCH_AT91)		+= atmel/
 obj-y				+= bcm/
-obj-$(CONFIG_SOC_CANAAN)	+= canaan/
+obj-$(CONFIG_ARCH_CANAAN)	+= canaan/
 obj-$(CONFIG_ARCH_DOVE)		+= dove/
 obj-$(CONFIG_MACH_DOVE)		+= dove/
 obj-y				+= fsl/
diff --git a/drivers/soc/canaan/Kconfig b/drivers/soc/canaan/Kconfig
index 43ced2bf8444..3121d351fea6 100644
--- a/drivers/soc/canaan/Kconfig
+++ b/drivers/soc/canaan/Kconfig
@@ -2,9 +2,9 @@
 
 config SOC_K210_SYSCTL
 	bool "Canaan Kendryte K210 SoC system controller"
-	depends on RISCV && SOC_CANAAN && OF
+	depends on RISCV && SOC_CANAAN_K210 && OF
 	depends on COMMON_CLK_K210
-	default SOC_CANAAN
+	default SOC_CANAAN_K210
 	select PM
 	select MFD_SYSCON
 	help
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
