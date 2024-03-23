Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EAFC54E58
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 12:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9MY2K+zVXEi2PhB8yIvqQ9BQRDnXlrOgMBpFkL/2MmM=; b=FQtrPXUrg7fkrV
	Uj1KQcsw6EEJqcZj0XswVT/emW9yv2b22+Xlb0u49LndHW3CIAN0tTnTVsfdUHHOd3fDymM3lMLKp
	pYMFdC2gwM13j7Zlk8U91Lj/wd/v0QTGLPHvpMgfaN68n8/lmF0DgdRlff28TukNruUv2wdRLkfTo
	YYyda/hLR6IN3yf0BErb/PSoyE7lsKpk6iLkmW7q+joSWoWBVPUc+nWV9GbLzCov1HLld/tux3FXe
	bsfJo2JZBNEJ+j7ZCW6W63wcG50gDQbfh8m6yiQyIhnatZoGl7emtChBwI4R65OIcVQH3b/+qsykY
	feofsBDZcNkS9ToxxvPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0FL-0000000AKmK-3W3O;
	Sat, 23 Mar 2024 12:13:11 +0000
Received: from out203-205-221-190.mail.qq.com ([203.205.221.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0FE-0000000AKfT-1Qwg
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 12:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1711195977; bh=Mhw9uIUtgqh31+f3FsQG870+GJ/mAlkg2CUWtyQ+yl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RXC6B1AT38wp4flybuunP9El5jwE34nUC5TNj8OhSsGhqfg9lknv6YLxXbzXzyHAH
	 5fI6JlD5szHRVlUsDDV1GDYGU6eZP1OCQA7pckx66lazcCg7+6bpfHf7ujaK7O6CPT
	 QGfPSbb29YFsUQPsg/kBrR3w7rLG+rUMNWd9Ynic=
Received: from cyy-pc.lan ([240e:379:225d:8e00:b91:b2e7:7c69:8554])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id 32594C7F; Sat, 23 Mar 2024 20:12:37 +0800
X-QQ-mid: xmsmtpt1711195973ti896svy3
Message-ID: <tencent_F06FC1196D1D47235C8898CF10ED4632BE07@qq.com>
X-QQ-XMAILINFO: OKkKo7I1HxIe57aA5A2c3PUOYwJgdumhef5e4VKF8/tfQppXOl3jPTQThZWrmD
	 JEQS5Th9U+9MN5UUYs4UhH4mr/pyaxIiagnqvktF50wn+8rGQt0+FmE7ALENpb7DKKuvIJbL7KP6
	 75kjlhsFVPo9/LmCwAbHfwhPpByX8UySgI730L2GTODL5luhmyM69+xh1phkVgCTxBJhTX9cgWr0
	 Xaz01wv1XqJQFNQsBJG8JNzFDcxy8umEns6zQ/xg5GNwyRqtYmu2lCTjgMtV8qbzMFXSAqeFd/+u
	 z/Q8pOgLv7BoEd84oN8hqyf2wNwJ4oktvYvQ+s2xEjC2T9jQZ/M9MuFTUpUtbt+MonVpiIKlz9ra
	 O7bWmSTcZsxFJDuUI5p/J/ox7SoyCPbtslEr56c/lY+2cOueR65/yWrrTRovkIHJ+h1yOg3+KV5+
	 I1PdDWFo5OJlydJFTLbzum+qF0h/Fo+1lEhKrbMYHPORp5HUlWSNl4vHoEG1/yVivOV4fpyWOPaG
	 z4eEZ5GIA5M3n2xrv/CRG7r65akpOArndjo80qULCr64tEEeeMPazztamSFJ/boBENS7XvqrnXAv
	 qx+jIU0cGH/UemhCBWfZjv6iLKzMHQZL+8WaDne65w0+jSoemT1Au79h601lZYh8546KAOVdA+oO
	 VqODt586V5WfXqEbPi7nPXfvT68150zFhmPBKYJ1/kDExZkKPIwW1q8wvS1yqenld0fEGmVDeZvi
	 R5jgWO1chHTW6fQQyd2ONhXvIXWU4kF5ag2BR/VvsJcdU9yzKJ4IU5sZeHgFlVfiAf2N7JJkBrwJ
	 47p0WYZngFeqd+YqrFDFvjq7oWf4FTDWvL78+CKgRTHDJKeBdqze3ilrr4zpsHqAuZ3QbP513HJl
	 ZU4XY6pAp7r3x+EKLR9kkxDquX6uZB2GZpcrUR0UKNyoo0Vod173SXcXw7TzR8EUQ/kQarrTnEsK
	 ery9lOzpwKGp26zUtd2c8GnH274l5BOLHfWluvTXFBjrA7LBgsK1ME7JZglY4c++npiLrHVZJdrQ
	 BmvduzW3xKxYQ2LUfIp6ozDiK8n68pWwZDJFDwjL6fRvbHJCa+feZ6a2FCG6blUePUyjQKTA==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
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
Subject: [PATCH v6 07/11] clk: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
Date: Sat, 23 Mar 2024 20:12:19 +0800
X-OQ-MSGID: <20240323121223.1729328-7-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_051304_927394_9EAD4E15 
X-CRM114-Status: GOOD (  12.31  )
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
