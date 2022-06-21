Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6795BC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 07:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPXYsv9a5P24wplvRZlcHbLVicsbPl/DsVcGKJI6BKg=; b=IsaN2iYAuqR9wE
	OwIMwBg8MNz2Y9qHnkT1g/Isfl5mHYBXS9tliDVoAxc1z2vPb0D1YP55iGRif4mLD09ZuRkmE4pLz
	KuomsmFM140fie4nMKRupxHlTZZp8okvf/4A8e1CHZDAvphC70GWoR88ikW+5hyVT049T19FHs7J8
	hbSxOTduWIKO+7COkCluLNavTFZDPRktqJJ7rT25fsN7N/GN8wfSVnQquUrjB/SzyDDa7Od6epOXk
	/PDbzIpk3/a6AQNC5xhKYVhrJrkrwsaME+sz5yk/kgpCtdINRc0BiTUM2vHQoLHcdp48MUUCVyfME
	6Eb0WpL+8x/z9nE0DXNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3YYu-004ATk-2u; Tue, 21 Jun 2022 07:44:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3YYq-004APd-T9
	for linux-riscv@lists.infradead.org; Tue, 21 Jun 2022 07:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655797472; x=1687333472;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ga0yI8b3nFUJ/A1nAFDaHWb+WYFb6o6Ncf2niaqtUg8=;
  b=r0/iZMfd7SjytEpxJDRoLCI2TylC6n8p8qCldphg04o3vV+Fz/e1+ps0
   sUsLA97wOBLPp6VsH/wuG/gkqRD7pIJw8wHQmpoR0t4zVvuEq/xwfLlOb
   tF4dWTxSetWQLeF0HH1bq+0MmQWqkZDz0fhWzS+umDnnztlK8RpZ0yL41
   8HMJYhl/Elwo3X+nrRgMq6tdVPbQlCPc+5TzrqU33FrM9B4XyWJ55qHnb
   bAU/WjX369O+pjFpJPwgA0QnWejgkgdWIjf5UsQVnrwaU5dWL19TEHgfx
   o65/ykrJbwbggthkUTtlSIQYNEMj1OYdfv+K8n0rwD1vQqpguTEilb2EA
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; 
   d="scan'208";a="164318494"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jun 2022 00:44:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 21 Jun 2022 00:44:23 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 21 Jun 2022 00:44:21 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <ben.dooks@codethink.co.uk>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <daire.mcnamara@microchip.com>,
	<conor.dooley@microchip.com>
Subject: [PATCH v6 2/2] MAINTAINERS: add the polarfire soc's i2c driver
Date: Tue, 21 Jun 2022 08:42:39 +0100
Message-ID: <20220621074238.957177-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621074238.957177-1-conor.dooley@microchip.com>
References: <20220621074238.957177-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_004433_022693_2B36E36D 
X-CRM114-Status: UNSURE (   9.04  )
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

Add the newly added i2c controller driver to the existing entry for
PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
New in v6.
FYI: I have several maintainers updates in flight - usb, pwm, spi
of which some will be in 5.20 & clk/hwrng/pci that are likely to
go into 5.19-rcN.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a6d3bd9d2a8d..90de65041863 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17141,6 +17141,7 @@ M:	Conor Dooley <conor.dooley@microchip.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
 F:	arch/riscv/boot/dts/microchip/
+F:	drivers/i2c/busses/i2c-microchip-core.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/soc/microchip/
 F:	include/soc/microchip/mpfs.h
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
