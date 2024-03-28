Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D57DCD1283
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 17:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M4YBbnEznHxcTGawEzXYnWDhW7DZrTW0fqlnWeu5lqg=; b=cAebc1lKH4Srek
	NyjEiNkzXdqgJohxGEQskpY8XhLKhgXkz4Lg1/Y8W6RsHurLJJDrQHu4NCoy8KeEgbgjEwSr7amQF
	Vz9rY5oYUbEa6ktiDBLxO6GfGmNQlFlOTmZco5nPC3+CqrR5d4F+/+T8M+FNQIkq6yXjSASEflMpP
	LCcIWpplRjJfJ8fNn0UHnerOKHHA+27EhhfpPhEJXvTefa+/BlNGC+Y6+7MdgkH7sWHDNhwSP1SN6
	0cNk6ApE4tem3e/BKFol9Rjt5mCgVrMnMhTMdkgVyOcVffSDINxHl+5oIOLDYBUrm0Qr7/L+OQgmj
	rCP6moNNuZ9Xr5dYoPLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptDK-0000000EuS5-399W;
	Thu, 28 Mar 2024 17:06:55 +0000
Received: from out203-205-221-240.mail.qq.com ([203.205.221.240])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptDG-0000000EuOW-3ij9
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 17:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1711645597; bh=gwLy8EHIrL7+lUNma349SO3H+5GaIQblVCaOrJwekyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jFofzEIQ1LZK/TMBKP4ln9u0EH57DRWbvqd9XFfOdv1B5H1gSE8sAHoY+ed2SYHVn
	 rIdD6Ib5CN/KTHamDav7h/awYqDWnPcn3+mRllgA95lukt1RCG64CBQL0BGpzZnkjU
	 1ikGC++bS8NrAcuXVbarQUBxoZPQSfYTUZlxvrUo=
Received: from cyy-pc.lan ([240e:379:2277:8a00:7feb:196a:dd5b:c05f])
	by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
	id 199B7A03; Fri, 29 Mar 2024 01:06:25 +0800
X-QQ-mid: xmsmtpt1711645594tp24uy5gv
Message-ID: <tencent_4FC67CBE4B41306D52C71C5CEC989690FF07@qq.com>
X-QQ-XMAILINFO: M5WvXNp9ZPrQurtbw2kfLYxuV4kvz5IMKbHDLqezAnXQBFGRi/vH2JvXDuHJ8m
	 GwscIy/reNZCHHLZSIz/tKsD4X96rRjH5tX4Hc9Q4Eou9TwpAeEspgv0RO2xP+GPVy7WMCPxB8WG
	 D3wYPa29Mi86cVL+hV51vRRILct5aONLYi/3Vx916HRmpmRSrsPOakmDBo6nloIDWTzj+4q8Lum3
	 AlOgN36kChzj0i3aQ7amE9MhRnm2lf3Z3WiThgoY8LoFsNwU+hMmg+eIEwnCP3c9/HQpqe72Gg7J
	 7QzsFvIxaO1yGWpNIxztIhcIVbj853jF//l1m77wJ8e5yyvRpwmauHQsmpAKaawdWF6jhYCYapjq
	 CrGDkwN5QJk06DD+H0CHbs+dVpWnwZr43UmE3D2eOMwk3odxhyAZxHOVrMxIlyvV+YpGpfJL1XCF
	 mQdmvCJgNBLZpMR8EU5wjVJqivVnqqeQiu6nJjSIImgScyc+DXOIhYUVVO/JN6mIAaofzHvp8RsD
	 S6FndPhCgVNztifc/hUmOulHf+jQP/x4mS7Tuj8tFigQ+RlmzGcWDAHy5Z5WTnTuK1sdjUDxoQHT
	 x0SBqrL5hpW7hWILUPY9gj9HIqx1W5MQ6YqfXAtSSsVXORfnoxxsYqwW7EjqtBUNsxbjnANSYuor
	 JKcj6HmjQ97xAGNCHxLIlxDOyVNl+4nrlibYDQRmdQf1J7jgPtLIretR/UOCEXS0EbZ6KH5DbCnm
	 c004RJhjtASDy7k84y6QXVNjq7I/Gklgyvof5BLPVOeA67M44cFMHdhPI6RTyG5f44gPxpwbsOHc
	 h8h2CAY97edCTHbjWiYwT3hwkvpW/mAxnyZITHEy8FRbUcZju5L33sSjye/ZUDWkRzZnqmy2qzqB
	 lyejbrX8G2kcElySiyZf1bHZ6yNAqcU5xZWG/jOY7qDDVesQcr8n8Onai4F9cLQdZIzE7Ekga26b
	 qG6I8UGm40i6+jG9ELmRDu6zL+jkE4L78JPwAyyEN5DGl/n4HEFD0uplS/NWIWxJNJ3YA1EqXgOE
	 thCXnt/OHVKChjWtiTyPMu+ORceccGkQuXKUcr0w==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
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
Subject: [PATCH v1 3/5] clk: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
Date: Fri, 29 Mar 2024 01:06:11 +0800
X-OQ-MSGID: <20240328170613.120131-3-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_2E60E33C1F88A090B6B3A332AE528C6B8806@qq.com>
References: <tencent_2E60E33C1F88A090B6B3A332AE528C6B8806@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_100651_413214_E8EDB9C2 
X-CRM114-Status: GOOD (  12.17  )
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
 drivers/clk/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 50af5fc7f570..7517a0dfd15c 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -451,8 +451,8 @@ config COMMON_CLK_FIXED_MMIO
 
 config COMMON_CLK_K210
 	bool "Clock driver for the Canaan Kendryte K210 SoC"
-	depends on OF && RISCV && SOC_CANAAN
-	default SOC_CANAAN
+	depends on OF && RISCV && SOC_CANAAN_K210
+	default SOC_CANAAN_K210
 	help
 	  Support for the Canaan Kendryte K210 RISC-V SoC clocks.
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
