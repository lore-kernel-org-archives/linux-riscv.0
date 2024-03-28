Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CD0CD1283
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 17:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yc8iB6kdFTW5YFQ/wQPmRelUfU++96RHLbCw78ZKECU=; b=3P1g/L2RBTthua
	ndznYxMWfz/K804MXc8twLnbiCf2y0HITD1mi9bJe5TIZGa1aT42kB5wLXfeuZU/FGI0/mpxYoOIb
	tiq1VBJQYO45Om0KcXTl/wGh4JlxdUpt7fHxFlmZSkgGQKVrkGrWkiLa1AbA06Ph/U3cl13LA4sbp
	ORK5O48SItmWXDBjIzClVazE5mCtSwNcKJEaetbDomyye6Y1sm6MYKWcHMNP8zSTzBMkSMfUt3H8m
	enKJUfS0tOD651Iysfs1WEoBqDf31OEe4Nx/+0noVpR7hNjVkKe8Zn6WufBSUbaAAKrrusf4CEDGE
	ej3iMqtWy02QPRwZTtyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptDF-0000000EuOe-2FW1;
	Thu, 28 Mar 2024 17:06:49 +0000
Received: from out203-205-221-209.mail.qq.com ([203.205.221.209])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptDA-0000000EuKJ-3Y3C
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 17:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1711645601; bh=ShRfnoFe4/QTY7IWset6XRPKvmziMcmsdCdl78vdWsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N+VPNXMI7i5YVlfU8+bnr+QXIvudiBS04OVDybCbyK2suqGQ34GPMYVKJ+Q52Qz0r
	 oaFtBSJU9oFdcswZniNoa/hGnXUdrVMCOU93C/ph4JLVYSSsD4H4DbwRnv0miqflNk
	 eI0jkpt77pnN5KJVnjqmAuH6DySwG1OCSAAQmRcw=
Received: from cyy-pc.lan ([240e:379:2277:8a00:7feb:196a:dd5b:c05f])
	by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
	id 199B7A03; Fri, 29 Mar 2024 01:06:25 +0800
X-QQ-mid: xmsmtpt1711645598tgdi2glgr
Message-ID: <tencent_8A35663124AED1894F53905E1BC0F1091705@qq.com>
X-QQ-XMAILINFO: Nfm/+M6ONQ57uqGksiE1sIyx981IWc6h3ZDq8dDiTnV4PmY1QRaC0DZckQyVix
	 jnKTFyYAwhabDVHbsVwwpsAlIUrjx1YTYJCgc2U+Qxj0yzYT8EBk0tDy0Tdl6vxP5dyEaXXTIjzB
	 oboFs30cYRKhFPhnwElS9zw41vSyXwE7J+tfkTxUdXE0jE1jNJT1Nt2VfNIc5qjP6KSSm8xeLAFg
	 uRkDSzEyaXZEP5UMcJxj2CE08GYlHRkbl/w3GxAw4yBjdbqVK6uFCsv4797BNUpOKv1WbyoTddVV
	 LEx1Mmr/8B4IdPWQDpB3dMjJk+/If1/n1XZYJaQCi9a8+J8hLT1WVRVDqlEDw6Ye2pSfIhhH+AZv
	 f4K+HGC+O2HA0EWsZa5RqcmlAjpn2mcvboI6986EWL6d26B2NvYQ7UPy9c0C37FclxmUmSAOH2Wc
	 WWfhdbd7kI6busyDg84DosRAXL85gzrgYHT1VGD5FOJNXeLci88xzsw/lfsQxngRK1SFtCgAKgva
	 rx827kcfRT5aRgzmj/rxaS6rXP9BewMSe0tvGztMFfhWkBTyEgKXe5ch+fjy5N+3fp6ECaDwqw4K
	 4GP0JqMLsP75xEBZAhW/+NojX6an4gLutGmhadcIZCAkIh9zykrcXAxGpiSKvAIcIqXMh6pFZm6H
	 46MXMCkrmzaRS37nf1quZaQwSxW7P+En7uLsGEx5sMjLKGsbfqPn/yf1e3QJ7BLxMu20rWE9gkIR
	 0p+HgWvrq3ITKGgIFMgCvZmoFAnYwV6mju3J3gmuto1q4USuRs7XSQMamZcDAeQMMiaZNCebMP58
	 FqU29XWXQXTXh2a5PUBcI18NzuaEEW1gAumK1NAjuIsEukulpX2l1uQ/2AcNtUPVikt75dzgCmHS
	 DSurfMRVEEpY+RTc25KFkbmJbJckdlenNYNSg7iI/GYMuep/Yx7L0xKUvNuiPNSBp1S1+br2WkKg
	 nNdatZYR7v2Cbb2HqUx28HUr/Ah2B56gcGPHOE7NgYOsV8ZPOQU+j2bsli4WGWg8S1mEtQkEi9cS
	 Ae8jx/d+H8OZVm/2QIOTqcr7C4Yke2e7rzDN/E8qjvEtAEYQf2gJYHlTytD1el3u9yMMSD4MpC3w
	 LnD2Wd0gEC9cSDvcE=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
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
Subject: [PATCH v1 5/5] reset: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
Date: Fri, 29 Mar 2024 01:06:13 +0800
X-OQ-MSGID: <20240328170613.120131-5-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_2E60E33C1F88A090B6B3A332AE528C6B8806@qq.com>
References: <tencent_2E60E33C1F88A090B6B3A332AE528C6B8806@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_100645_608985_0BFD2DF1 
X-CRM114-Status: GOOD (  12.09  )
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
SoCs is already in the mailing list [2,3,4,5], we remove the use of
SOC_CANAAN and introduced SOC_CANAAN_K210 for K210-specific drivers,

Thus, we replace its drivers depends on SOC_CANAAN_K210 and default select
when it has the symbol SOC_CANAAN_K210.

[1] https://lore.kernel.org/linux-riscv/20221121221414.109965-1-conor@kernel.org/
[2] https://lore.kernel.org/linux-riscv/20240305-praying-clad-c4fbcaa7ed0a@spud/
[3] https://lore.kernel.org/linux-riscv/20240305-fled-undrilled-41dc0c46bb29@spud/
[4] https://lore.kernel.org/linux-riscv/20240305-stress-earflap-d7ddb8655a4d@spud/
[5] https://lore.kernel.org/linux-riscv/20240305-praying-clad-c4fbcaa7ed0a@spud/

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 drivers/reset/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 85b27c42cf65..7112f5932609 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -103,9 +103,9 @@ config RESET_INTEL_GW
 
 config RESET_K210
 	bool "Reset controller driver for Canaan Kendryte K210 SoC"
-	depends on (SOC_CANAAN || COMPILE_TEST) && OF
+	depends on (SOC_CANAAN_K210 || COMPILE_TEST) && OF
 	select MFD_SYSCON
-	default SOC_CANAAN
+	default SOC_CANAAN_K210
 	help
 	  Support for the Canaan Kendryte K210 RISC-V SoC reset controller.
 	  Say Y if you want to control reset signals provided by this
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
