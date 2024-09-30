Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB35CF64A2
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 11:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9h7kxsg0AxgxOHeceFVXeuU6TcQOJOsCgLq5qSNoYEE=; b=atKnQbxXkn2OTl
	uH7u+6FVAqrumG2WcSVVBzMn6xOKjWHGSejoBHvHiU8815IQ8Z3MS7gb5HlGz/YtKTGpDgxofpCus
	4YOt/x//UFuMQRXW6r8UvFVx47sw/k34K535aYt1l80wNBUyADaBMKZmJqndMJk2tHR9F+QtgOOrD
	gHT+PpUPLGMyvTCDDANgH4Kz/WOF+Lh3fZcyIxACMaWduo39NRyyMBjbxQLrHjI82p3MXSZ0yDfzo
	4HHENTwJCxL398SD+CCz35qaaO/LPkUbiYriclH4xTleIJzwlVfy1hMspoxBzoTrn5JVzMhdgQPez
	Zx2uuEOkcCtVVyj6uPIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svENE-0000000GoAL-2Yu3;
	Mon, 30 Sep 2024 11:15:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svD8i-0000000GbI3-1yLH
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 09:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727690184; x=1759226184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VnYhiKqEKDEMV+fEe2vy3iLrZ4s2UszPQqt9ym5foD8=;
  b=wwDvmPPxipH5yMVZKdrhMw3q35o9HuODbEzeubY1DIZhgP1WLUizA9n0
   cl+UsOCG68f6BwUSujpwM/VWqSMJXxvg6+Y0qG1tWIgz1r4lMJUlCFcza
   2T50qSHVIGPbZfHJGvgpvh3Z/tn2xQhET6VylV7cI/JUDu4m5UOHTmOu+
   FVRjpggfVPdNCDVMYzIKky2Bb1GPVB0gsR3C0PopEyIB1kNKBjcQnvtr/
   0TGEC/FToIkZODE0XbJDYGZzGptXnJXEnLG9ttD06vPiH3oSphy04DBsP
   TzsAZr57a74PlWBWU0xthDToqm4F3igx3RasC68LNyZXZ6niggmZ7wZxb
   Q==;
X-CSE-ConnectionGUID: 05QWoWIkRFGrt6egQKNmgw==
X-CSE-MsgGUID: lLD75AxwRaGK1prnAD8u1g==
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="32388030"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Sep 2024 02:56:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 30 Sep 2024 02:55:58 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 30 Sep 2024 02:55:56 -0700
From: <pierre-henry.moussay@microchip.com>
To: <Linux4Microchip@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Paul Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [linux][PATCH v2 20/20] riscv: dts: microchip: remove POLARFIRE mention in Makefile
Date: Mon, 30 Sep 2024 10:54:49 +0100
Message-ID: <20240930095449.1813195-21-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_025625_066779_0B05205E 
X-CRM114-Status: UNSURE (   7.63  )
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

Substitute user hidden CONFIG_ARCH_MICROCHIP_POLARFIRE by user visible
CONFIG_ARCH_MICROCHIP.

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 arch/riscv/boot/dts/microchip/Makefile | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
index 806f80424d49..06ef63d8fad2 100644
--- a/arch/riscv/boot/dts/microchip/Makefile
+++ b/arch/riscv/boot/dts/microchip/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-beaglev-fire.dtb
-dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-icicle-kit.dtb
-dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-m100pfsevp.dtb
-dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-polarberry.dtb
-dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-sev-kit.dtb
-dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-tysom-m.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-beaglev-fire.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-icicle-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-m100pfsevp.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-polarberry.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-sev-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-tysom-m.dtb
 dtb-$(CONFIG_ARCH_MICROCHIP) += pic64gx-curiosity-kit.dtb
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
