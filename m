Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442A1EE6426
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 02:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lXzqDW0KZdhsd9n9haOBfQ3CVv3yZtaWgIYAiL2d5gU=; b=Py8eMrruh02Gj7
	n6YGD5b4jnMwDuAa+t/K81V7+DDdVQHFaMc1fgMMrn7CyXL/ninCgx//x6Ynd8c/vdSx4v4auhKfg
	+wHRMWTgJiE6dJNRnyZ9dn7/wr8Nuo6uvW/4wqgie4CB5G1qDEzFCFqB1Z5OH7Z7CdJPYwvW+RfyO
	YbUJVG9tUY9nfvMth4O6NBTM7bak8ROFzmXP21FWGA2M76V1xmaCgJuSQSDPI5fqMLwiJdDUS2k4Z
	5ZVD7H/5mkV62RxsEK2wmWBNTwEYHQouy2PAj7M/s+LclNAGbUK2uvA2HEW+Ri3RRAb/ukgKAPPmz
	bnFnkoqoBH1AdIeKqaxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soa3k-0000000BhMr-0agd;
	Thu, 12 Sep 2024 02:59:52 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soa0S-0000000BgBo-1FJE
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 02:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1726109768;
	bh=Q+f7Y6NaDNcklTT7is2kRztTuiX4oAl/H2qYe+la9kk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=B/lJoPWEIcqng/uR0kLhoS0Bk2g4B4gQU0lkkS65+otJUHi6XLIDjBrnY8C9ghwcE
	 NwD6VGKdhqtRMyIvy1em0K7rK0LUFjnj9SeI54AHOWg6ZmgdAQYdjf+3QikK5rOmMJ
	 pFyQdji79e6l5l5E+QVFe3ZlHcSjItbkpj+LClNE=
X-QQ-mid: bizesmtp81t1726109752tgd9zc2a
X-QQ-Originating-IP: FwNYInude3/6pcUIZW5jorMw7+H52eujKyRqd6Fcx+8=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 12 Sep 2024 10:55:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4074563589889725486
From: WangYuli <wangyuli@uniontech.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org,
	sashal@kernel.org,
	william.qiu@starfivetech.com,
	emil.renner.berthing@canonical.com,
	conor.dooley@microchip.com,
	wangyuli@uniontech.com,
	xingyu.wu@starfivetech.com,
	walker.chen@starfivetech.com,
	robh@kernel.org,
	hal.feng@starfivetech.com
Cc: kernel@esmil.dk,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	richardcochran@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH 6.6 v2 2/4] riscv: dts: starfive: pinfunc: Fix the pins name of I2STX1
Date: Thu, 12 Sep 2024 10:55:06 +0800
Message-ID: <3D0F65E42817C96F+20240912025539.1928223-2-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.43.4
In-Reply-To: <20240912025539.1928223-1-wangyuli@uniontech.com>
References: <20240912025539.1928223-1-wangyuli@uniontech.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_195628_848597_028E25E9 
X-CRM114-Status: UNSURE (   8.92  )
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

From: Xingyu Wu <xingyu.wu@starfivetech.com>

[ Upstream commit 4e1abae5688aae9dd8345dbd4ea92a4b9adf340d ]

These pins are actually I2STX1 clock input, not I2STX0,
so their names should be changed.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
Reviewed-by: Walker Chen <walker.chen@starfivetech.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/riscv/boot/dts/starfive/jh7110-pinfunc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-pinfunc.h b/arch/riscv/boot/dts/starfive/jh7110-pinfunc.h
index fb0139b56723..256de17f5261 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-pinfunc.h
+++ b/arch/riscv/boot/dts/starfive/jh7110-pinfunc.h
@@ -240,8 +240,8 @@
 #define GPI_SYS_MCLK_EXT			30
 #define GPI_SYS_I2SRX_BCLK			31
 #define GPI_SYS_I2SRX_LRCK			32
-#define GPI_SYS_I2STX0_BCLK			33
-#define GPI_SYS_I2STX0_LRCK			34
+#define GPI_SYS_I2STX1_BCLK			33
+#define GPI_SYS_I2STX1_LRCK			34
 #define GPI_SYS_TDM_CLK				35
 #define GPI_SYS_TDM_RXD				36
 #define GPI_SYS_TDM_SYNC			37
-- 
2.43.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
