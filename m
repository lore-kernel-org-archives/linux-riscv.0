Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF145CF8853
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 17:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4+VyI4T3vVzKiQRK2MBSs8Dgr5VuU0YsIx3ICbhGMqs=; b=lhhpSwVq8mYrJF
	RPo6gi/FlZe1RYeNluFTgbtZa5ap0bRN+l+MhXnkViXQ3LwJ88axKVQtl8tjruMNSZ+KGKcfIER7Q
	SAHZmfyO1meSFIFA2wONO3gbg4qVuO1VDhdvnWCb3aNgY8geKMD7ikLP1nMsMzGEZ+t3LTcj5ePo+
	pjCY23nC6vi/OROyZhBRLXX0ssMyxQzOuStB2deLCQaUXR5N9Xbntx/TR6+fRqwZWgCqY/omu7yfP
	DKMPLhfMpOGSDL/GW89XWlLrEs8n6Jvfk9WEmJZ6D4e1babHDnDD4OnaK7V+S/DcvES22/avSnSUW
	mHA/YKT9Jb3ZjKPLfGvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swmDQ-0000000DXoj-3ggS;
	Fri, 04 Oct 2024 17:35:44 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swmAY-0000000DX32-1N3C
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 17:32:48 +0000
X-IronPort-AV: E=Sophos;i="6.11,178,1725289200"; 
   d="scan'208";a="224808644"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Oct 2024 02:32:42 +0900
Received: from localhost.localdomain (unknown [10.226.92.178])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0D1534031864;
	Sat,  5 Oct 2024 02:32:37 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 0/2] Enable serial NOR flash on RZ/G2UL SMARC EVK
Date: Fri,  4 Oct 2024 18:32:30 +0100
Message-ID: <20241004173235.74307-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_103246_707606_A6B4EC01 
X-CRM114-Status: UNSURE (   7.17  )
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

This patch series aims to enable serial NOR flash on RZ/G2UL SMARC EVK.

Also update partition table for spi-nor flash on RZ{G2L,G2LC,V2L}, so
that we can flash bootloaders in Linux by executing the below commands:
flash_erase /dev/mtd0  0 0
flash_erase /dev/mtd1  0 0
mtd_debug write /dev/mtd0 0 ${BL2_FILE_SIZE} ${BL2_IMAGE}
mtd_debug write /dev/mtd1 512 ${FIP_FILE_SIZE} ${FIP_IMAGE}

v4->v5:
 * Updated bl2 size to avoid 4 KiB gap between bl2 and fip partitions.
v3->v4:
 * Dropped patch#1 from the series [1] as it is aceepted.
 * Merged patch#2 for [1] and patch from [2]
 * Updated partition table for spi-nor flash.
 * Removed Rb tag from Geert as there are some changes w.r.to
   partition table.
 [1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=885350
 [2] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230901075932.105822-2-biju.das.jz@bp.renesas.com/
v2->v3:
 * Dropped subnodes, as all pins use the same power-source value.
v1->v2:
 * Enabled 4-bit tx support


Biju Das (2):
  arm64: dts: renesas: rzg2ul-smarc-som: Enable serial NOR flash
  arm64: dts: renesas: rz{g2l,g2lc}-smarc-som: Update partition table
    for spi-nor flash

 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 15 +++++--
 .../boot/dts/renesas/rzg2lc-smarc-som.dtsi    | 15 +++++--
 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    | 45 +++++++++++++++++++
 .../boot/dts/renesas/rzfive-smarc-som.dtsi    |  4 ++
 4 files changed, 71 insertions(+), 8 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
