Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C01C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 09:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ea3ZbCBdFlpN1EtGT2nsnR+9krm7EJCRhYbgsQ2jJOw=; b=4QGgJLsrXVTiKF
	HyoEV/Pw+iYaxy3cp1IZ0QaMkgAVEnLREaUA3aXjUNKwHlLEdQUVWZ71Vofq3PKOIBrqbtFvT7Vyr
	jPShOO0gYh8eV2AN9y9OBo5wyQcrDi5xIq5yLeU7eOvaYRJTXyGUiwrJi1YO2iNNM1ZSqtoTx5CnH
	XgQuLQnhfquo6VCI6QTL5ldkpE9OTob30ZiEFdMY6i4eLUOiCg5eSmEe6oqRfFaEDXiA2teKjzfvA
	eIktQijNAscLamVKo4NX1R3lxZryOjqqwsIrcD7jhy0/qJeeadjyHKmL12pvp6pyL0p7qLeCix09W
	nMJzQw8ZrmlwW/VBSliA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeC1U-008Gai-Ui; Fri, 30 Sep 2022 09:09:32 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeC1R-008GWk-8F
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 09:09:31 +0000
X-QQ-mid: bizesmtp78t1664528816tuqcmaei
Received: from ubuntu.localdomain ( [113.72.146.201])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Sep 2022 17:06:54 +0800 (CST)
X-QQ-SSF: 01000000000000305000000A0000000
X-QQ-FEAT: dcYQFNbI8vHgGBegdo4q9m3MYLIYCHcw61t0e3fQ/Hq7EkLkmrCEJbkHKfFlG
	J4zmi7grr3n/OnwCkitlLiu4qcHnTOsYdPqejqBFnT0LtYo71L1edvOVk8EqtBU/4NITA1v
	PtvMIi33G6+geE5Dd7Xac7PKFO83VGfrb9v3HUE71s36L+Ak4KHisHaZkXU39WXe8TV7AUX
	q+V7+WA4YGqKpmQTORK9G3XgM1C5YwLvoydQ6vz8XQ8mL/G9PJW987+tEw4XK5Hu7XQzgcN
	KjPitbWT1T8TMnUvEQDlipeEru32FxvLp89vTIwWeP2uI+17rxGu3MROCL82u0OFZBPCrY+
	J8aBzuhMWa2Us40P8GNsprTnvf4zhQfu4pLTNgpXugz2pvHj18+EXRpgSYrCSlqRLsMhXA8
	O7fk+0n7ykI=
X-QQ-GoodBg: 0
From: Hal Feng <hal.feng@linux.starfivetech.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@linux.starfivetech.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 29/30] RISC-V: defconfig: Enable CONFIG_SERIAL_8250_DW
Date: Fri, 30 Sep 2022 17:06:53 +0800
Message-Id: <20220930090653.7449-1-hal.feng@linux.starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_020929_613946_95C76BBB 
X-CRM114-Status: UNSURE (   6.99  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add CONFIG_SERIAL_8250_DW=y, which is a necessary option for
StarFive JH7110 and JH7100 SoCs to boot with serial ports.

Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index aed332a9d4ea..0c44484cd3a4 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -122,6 +122,7 @@ CONFIG_MICROSEMI_PHY=y
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
