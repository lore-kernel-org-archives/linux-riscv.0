Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5A4CD11BF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 12:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EyFQ2WbedqhEZnaSwBsyjjlcq8THfDnl7nIeUf/T58s=; b=NZbZgQlPwaMZuQ
	pjlgoPZeG2icahb8OAEzhsexwXbkY0QkWZ8A076VVGyT1vlPporyl1GDcPKheMP04CsEVWLnv99lQ
	tQd3EVX79RxMVhbB/nGfLa1l0oEf0hLxu0LsU2NYn+SCjqT24JLWnMX3DqsaPm1oB8re7eAbYFu07
	s+PS5nWc1cIBYoM1UhQltdFqfPpFp1kTLRFXygmcfv+Lb7v2/nx/oJ39cyBAL88hXPE8MP7VQ4MF4
	IWwmc9Blw2KaiobvaA86CMFn5Sae5n4uUAYQjbQTY7RW5RJ2AHEg8qHT3A6fSm813H5TqFyGfEMkr
	2LmR1N0riQTVA2QpvNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0Fc-0000000AL18-37Vq;
	Sat, 23 Mar 2024 12:13:28 +0000
Received: from out203-205-221-210.mail.qq.com ([203.205.221.210])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0FQ-0000000AKpn-3sfs
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 12:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1711195994; bh=gxGEA1zI0RM+I3kpAeG2Tfht93lBnbsfTrZDhfruV3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AV50GZApwLPOJywfaEN0XIWPyTIJsC3Ne6CzKmNU45ml6vYcefjhKnKkZM3gMqvDH
	 muZvoLaJivp6Td7HhV0E54Nvi9K5MbYzspHDGDg/qmNNpDfist3MKtgTiu121A9ge/
	 dTRW9pSXLe58A9gemHjV9UnMYzEFJ+XW7WgVpxxk=
Received: from cyy-pc.lan ([240e:379:225d:8e00:b91:b2e7:7c69:8554])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id 32594C7F; Sat, 23 Mar 2024 20:12:37 +0800
X-QQ-mid: xmsmtpt1711195971tonyfvaik
Message-ID: <tencent_C07CF3823CDA708E47B879312E213C8DB908@qq.com>
X-QQ-XMAILINFO: OZZSS56D9fAj61jTOe54p85UExhdidaDwwLUsRR7zkr0fCV9v9nd4Trhy5U/Eq
	 1eGcetKRrVcRFO3+d6O2nKFy0N+YEo+zNX6QYJ9ZnWgZssmh5u3xAzfOpfnwl5RlmroYW/yhSJQF
	 60LUYBoW8b1fsDq42tXjLPaPVF3KU733xftgU82ZlqdK/QNHwp46Q/cUoF631vOe4FALQHsuJxOj
	 Kd1q/A7swXqYqLzBNXSFYlqHEwHkBqF+0ynNFjt0tA78iN2l6c5bw/5p0SMQVBTKlDJ5XJSp4zdd
	 i6MME9fypgZoQSnjtt9ArlyqC0/c+Ke+rdEyX95i/Q0m6Dbx1hJsmufb/4NbOzCdPH8kjj5OQIo0
	 KDihCCiVpuhO7G0PHq1W/LaODrU286x8Q42G0aUSZ/tscaeJDOXpthYPQ6Ju8+kQaNSxHXQr/Xbd
	 swEIP1S7J8Cy9cVGrW0Vx34ggJZU+5w6sJwFChIKmu5A2yNySFrBVYMKPMFmVytPKOYIlsYuEbTP
	 BkgJPEWvBnquRl2rhj+whKTWlFhApb1wAl2g6AlN9U4BalBUrLG6AV0r01mHxSGdFPuTmx3/WAc+
	 CAq2HW+hHmvDRZgspEjF2nftibfTjBFrzVgIbKaZckhv79V+fyqW/r3qjHHpNywIcl7WQbOjB5PJ
	 kJlopcwYbeHjoD1Iwe3ejXaG9gSJQ+SmH7iFrV0xdV7TcewDi7TVaRtROP4HRsRyPyvaUVKfi3VA
	 jXjqpDEzfHu5J8RCUEap75d8GL98b+tc9PWaIZrbEeP4TfCzDL+otr85+ZL4ZDW9NLvT+3QVT0I8
	 Uhl2/ctTuQx2Sbpa8iFNo1XRhF+qVYJ/l/TTH0YsDq3rrvayLu9mIrvGoJahhQEm8aW/whfM5Z7w
	 JK8hRtfdweSf1DRhyYdiOUEVeOP1T+nOJCebiWLRaJCW301V9TOVa+fLf//rZ+j7PdJ7nHpkmklD
	 JXGBfoM7Rc816OezvwWbabQUKZ4GTKd+zu9J4Sb9u6BAGRipM3Rx6pkgIoQwJe0FY2kcxA2B3LK9
	 otE2bCORE/acVXNzm4Bf1QM6wX2MXg82fHmFKZSA==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v6 06/11] soc: canaan: Deprecate SOC_CANAAN and use SOC_CANAAN_K210 for K210
Date: Sat, 23 Mar 2024 20:12:18 +0800
X-OQ-MSGID: <20240323121223.1729328-6-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_051317_404912_2CB12EAA 
X-CRM114-Status: GOOD (  13.13  )
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
SoCs is already on the mailing list [2,3,4], we remove the use of
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
