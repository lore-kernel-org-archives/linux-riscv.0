Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3507BE77188
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 19:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8yIJWhOm5oNs7DW5FsoypLoCytOywI3uagP+A116Zqo=; b=gllOlxYH7YLEBa
	nxJYlyXc4RESPPUWydgwTKv+zoVsWfHcR92tIB36sEJTncvtDTdKB4y94K4JcmmxoPY0yL3APcfOU
	sjEDVeB7BuCzPz5lO/TJmcBKWEjZzRFim+Joyl9TY2gvbxEa3A3GDUQn6jyiCRQPJULveqbQzZe75
	SOkiOX6ajw/yGPGdYCsxlShKf9CgXDhcIONyZypAgWmAnPzN/pbiZ9B8b/hq6Z02f2GAgIC1QnEzm
	3kcrQFXmgktP4BBC2h1UtAnpZ+Xq9ReO1UwKHZmV5+HDYRQEsUEyFGeTCgJUCguel/oOAkXwT2Y3b
	AAbIbYISgTZH01c5JzvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTR98-0000000BIwx-0V40;
	Thu, 02 Jan 2025 19:46:18 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTR95-0000000BIul-2WfL
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 19:46:16 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c8:31de:bf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id D26B3B4B3085;
	Thu,  2 Jan 2025 20:46:11 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	E Shattow <e@freeshell.de>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 4/5] riscv: dts: starfive: jh7110-common: add eeprom node to i2c5
Date: Thu,  2 Jan 2025 11:45:10 -0800
Message-ID: <20250102194530.418127-5-e@freeshell.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102194530.418127-1-e@freeshell.de>
References: <20250102194530.418127-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_114615_814620_B0DE52AE 
X-CRM114-Status: UNSURE (   7.75  )
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

StarFive VisionFive2 and similar JH7110 boards have an eeprom compatible
with Atmel 24c04. Add the node so this may be used with the at24 driver.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index bf2f0c34ad4e..ad5cb85ebc59 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -245,6 +245,12 @@ emmc_vdd: aldo4 {
 			};
 		};
 	};
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c04";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
 };
 
 &i2c6 {
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
