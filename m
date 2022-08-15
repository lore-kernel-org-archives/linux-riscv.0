Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9585DC00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 15:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HB3OWyXlDfuCecw+aWU1wK3Pc8oudptfcuYUejPJtZk=; b=J8MZVlTqIuGoL5
	HyWg1nmltgKww6SdJbizX97teZG4wpQ7KpsMKh7TmyrDR9FKwyuABkKJck98sTujwklACkIwC5S6t
	fJtPemM44D1Ie1dwJnPsI3tXMjH5GbjR7FihGhjj93TnXgCQDoFp22WvC6ZcSwJqxWv2apS76K7Vx
	0/85BfQF/tn4+zgD5Vmy0PU51mNizS+BcpO4qM6OtaUtnkPAU+Tw1/uYI7ap0nMX4Hmy7hBsAG0h3
	hEmjTXhw1+y/PCXjYkanZhgLZras92GgYmo/IIh4LsexPkal/lKWEic2WrnkiPba9liXM6YSag5G1
	s2ASWTJyUa+Ym/mDcJaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNbqi-000jre-DO; Mon, 15 Aug 2022 15:17:52 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNbpN-000ib9-N3
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 15:16:31 +0000
X-IronPort-AV: E=Sophos;i="5.93,238,1654527600"; 
   d="scan'208";a="131484180"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 16 Aug 2022 00:16:28 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 95AE040108F7;
	Tue, 16 Aug 2022 00:16:24 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 7/8] MAINTAINERS: Add entry for Renesas RISC-V architecture
Date: Mon, 15 Aug 2022 16:14:50 +0100
Message-Id: <20220815151451.23293-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_081629_958164_234FCE5E 
X-CRM114-Status: UNSURE (   6.20  )
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

Initial Renesas RISC-V architecture support will be for the
RZ/Five SMARC EVK board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
* New patch
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e3058091899f..b03763ed649b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17562,6 +17562,16 @@ F:	drivers/spi/spi-microchip-core.c
 F:	drivers/usb/musb/mpfs.c
 F:	include/soc/microchip/mpfs.h
 
+RISC-V/Renesas RISC-V ARCHITECTURE
+M:	Geert Uytterhoeven <geert+renesas@glider.be>
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+Q:	http://patchwork.kernel.org/project/linux-renesas-soc/list/
+C:	irc://irc.libera.chat/renesas-soc
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
+F:	Documentation/devicetree/bindings/soc/renesas/
+F:	arch/riscv/boot/dts/renesas/
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
