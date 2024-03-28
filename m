Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3187CD128D
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 17:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5zgEafW8Uv6dgp5Xlj9t0UopZqrrbyISwyBCjPJ1a10=; b=bSbmOE6ReMDfmQ
	g+fSfASEAamDLpnkEOMTiMgkQGZt5iDmOf/o291kaSpvMb8II7Y0R6NUmyQl1fXLr53kjqKdn7y4A
	8lRJz3zaZh/ejrx6xYlAH2gvChuSzvUaqPwu3/SDbqfsn9sQ9HsSXKwqYBvqoIUWsE17GyJxU3DRB
	4wo4LLORfRQRxDFtNnzPNa4F9iPOPOokGrhf2w55/qD8yXjhEspGbHQ4H8LDLTASdq6yXVC4OJ7MQ
	UUnLJ0XTa1ozlAqbdeBZ1zmmMRE3tvM3QRmL/yYua99NcoWS+OxEyJuH6+ExUjLzjduwJUcWafrw+
	WDWNATRXVdqYXUTBFKKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptDH-0000000EuPY-1ef6;
	Thu, 28 Mar 2024 17:06:51 +0000
Received: from out203-205-221-240.mail.qq.com ([203.205.221.240])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptDD-0000000EuLc-1Nnc
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 17:06:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1711645599; bh=L2lkCcExhcCSZci/+XbSJe7RshMmWIbz8lRm/dAsp5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D7N3NO9XiclQeusBoSRciwNFX8h0CR643D3jtyeGQgQHTS10TS4WezUbWzzeCI04V
	 COxS2eHvcd1/NzFDNc0F/psALNgIWelESrrA4P/vKLgecqLCQSb40kGRqHJm5AZv6b
	 q4WkvsdPw4N8rPmVQovUu3aTAZX62gxKX1HRAx5Y=
Received: from cyy-pc.lan ([240e:379:2277:8a00:7feb:196a:dd5b:c05f])
	by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
	id 199B7A03; Fri, 29 Mar 2024 01:06:25 +0800
X-QQ-mid: xmsmtpt1711645596tdwddzrgm
Message-ID: <tencent_DB11214C8D0D7C48829ADA128E7BB8F13108@qq.com>
X-QQ-XMAILINFO: NMGzQWUSIfvTNMP2jtZxLCFW1PIkrRFpEbd8CFMBnnDWS+4rcko4Wwu1VcTYYI
	 Jv+Qii0fPVnQFco/q+0pNKeDoK+4aqtPIK78H9JnOIM07p2UpArsZk0bUPw3Ia9NKYw44Fo7YQNw
	 D38x8y+sGFVnXgB5HwOHLQ8Gq+wmy3tlpThH+4ftr08MFZ7zM8pUBrEXsPN3bVZAA/MnzqrYQx9K
	 qqvZQk1H1nIIxZSB4H20CEnH5O49hlUPhWmKyPSZG6xLUNWf8e/KMh05dD/NoTaPYG0RQu7BMHmf
	 IdHWmNPvo3HUacip14GUl+jyUb/0HuFffyAszOql4ZXt7ZSYQAWwE3d+fQGwDbhRmSnVZNJWws7G
	 GOEJ5SPh0ZULLP0fWhV27X8zLwyJLdzek4JmIq4l1kyiyfR7bvt+wSyryOMEboSoSKyJv84oHVWJ
	 E/HVW3q2QeSaV5iqtI9QqXPGLieKYeGpaeiG9XSFFjmkO6DdILK4kZ9wd4BKPbajGCkob5zS8Skp
	 1voYk6+8NxaxMpmzQVMtmofs9DEre+mgFK9gTel8Uzaajgt0p7GWzUCq8z0qgLtlV1YpmXkgix2b
	 AiWCctCng0910fXjyg5ktmhiHaNyhOvigvg20dmRSBcf7k4Dbww7B0wDhemkjBTSQ7DhYDXcb+pG
	 639LFTFVAk09vuiy16OGagFCP2UXdtIAbBTWkAN46+2uneR6L/jZJwqUw9KFCe44AkmTV69eBc7w
	 4nYSxLkFMBPpFM+cZs1i45jAi4h+BFJrQ7gVfbPdmOMOfq6YkqRLPh8koRp8jS8lHx/NuTEfSwRV
	 RXxzrKtosbYvffH2VxPvUS3ZA31s5MwAL1qo9cetC2EHcBwQ3L6wxtKmZIUT5C+/C5Q110Rog+9i
	 GlsRpD6Mw7jHIW65xKdbYxf4XwpVYLrCojZASyzIapW1MTb75Z53HlzFPrFxoVhdyk/kKBAsLET3
	 340vpJumhJgwec5gRqTLq3Hga2d1CppBT8F7EwUZ4wvH65scjd/C3d/vh9dFt/Y3xO2mS1qGJitd
	 NwWinoYcOqg5/IPzKge/GcNhq95Zk5sVDqd0lj7x9h6/fUV1sY
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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
Subject: [PATCH v1 4/5] pinctrl: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
Date: Fri, 29 Mar 2024 01:06:12 +0800
X-OQ-MSGID: <20240328170613.120131-4-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_2E60E33C1F88A090B6B3A332AE528C6B8806@qq.com>
References: <tencent_2E60E33C1F88A090B6B3A332AE528C6B8806@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_100647_828907_A0DDE415 
X-CRM114-Status: GOOD (  12.10  )
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
SOC_CANAAN and introduced SOC_CANAAN_K210 for K210-specific drivers,

Thus, we replace its drivers depends on SOC_CANAAN_K210 and default select
when it has the symbol SOC_CANAAN_K210.

[1] https://lore.kernel.org/linux-riscv/20221121221414.109965-1-conor@kernel.org/
[2] https://lore.kernel.org/linux-riscv/20240305-praying-clad-c4fbcaa7ed0a@spud/
[3] https://lore.kernel.org/linux-riscv/20240305-fled-undrilled-41dc0c46bb29@spud/
[4] https://lore.kernel.org/linux-riscv/20240305-stress-earflap-d7ddb8655a4d@spud/

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 drivers/pinctrl/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index d45657aa986a..1be05efccc29 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -235,13 +235,13 @@ config PINCTRL_INGENIC
 
 config PINCTRL_K210
 	bool "Pinctrl driver for the Canaan Kendryte K210 SoC"
-	depends on RISCV && SOC_CANAAN && OF
+	depends on RISCV && SOC_CANAAN_K210 && OF
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	select GPIOLIB
 	select OF_GPIO
 	select REGMAP_MMIO
-	default SOC_CANAAN
+	default SOC_CANAAN_K210
 	help
 	  Add support for the Canaan Kendryte K210 RISC-V SOC Field
 	  Programmable IO Array (FPIOA) controller.
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
