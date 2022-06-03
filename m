Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2146C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jun 2022 08:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7XvhmHRkEZmzjBSUMJGte6Qj2+uhrv5pPTbckpoV1KM=; b=oxjEFGFH/cj8kM
	9mNTBBTapHHlmNhBXXcEYz2jvhbOkySbpAcoMoW8AC+1HBjVTfQPtpB70ThUrljrcN78PuDN0yv81
	t/8F4OEnzUzROOZGhr1kCQyk5FlqNZMiQG5DcBN/e24/S8k1N6GAXpP/THGAtMtorQwUYOpMXhdXt
	xttK6G6XbBDBcZ1cB0aljBHZR7t101cXWYyCN2wJk+/1VOW+/hT+oY617D86RX0KxPUfjrffn3/Ab
	QpJ2PMnWK6bwGh2jypQNwneekyUcH5Z/AMM4hOcEAGLw/F0AD+/48i9rFbMQ7YzQpoYwPL3Izqn/A
	vGJxS/rYWhib5nu/V9QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2xz-006ida-F2; Fri, 03 Jun 2022 08:47:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2xv-006iZR-PR
	for linux-riscv@lists.infradead.org; Fri, 03 Jun 2022 08:47:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654246053; x=1685782053;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s/Wd73cyNlv+HFS7l4GyetpqqF75Oqrnu0NEMj+qrPA=;
  b=ymncR9HePv25g7uIF8uTnJ7/IaR2B/1igwf0jATdnSKQ1EQArtFT7DSf
   znD58TPtVYLVt00dmRpuSQWfn++6zJ9ZhuSg8f2wCIWazJZwKLm4CqjCd
   6BwYQELVYPzfB9txopHVbLtZcYkJH8rRTLsM5AlIq7yGv/ak71hhfg9Zb
   Rro9dJKSG4mamCb0mzQ3YqoZzOD7zeto3PQA9GX7yddn8N+V5Z+UnlTDM
   8ZpgB7wz63pkvs+jR0K8mgptxLZkFe+pzQDFLt2BnA9VpuYHFQ24Qbbhy
   GAW6tk4oQPYC3R5Tsf90dNp38pGFtIMiLIaQZtOxSCMSK2Q7hlkuzmZtO
   w==;
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; 
   d="scan'208";a="166617030"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jun 2022 01:47:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 3 Jun 2022 01:47:21 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 3 Jun 2022 01:47:19 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Rob Herring
	<robh@kernel.org>
Subject: [PATCH v2] riscv: dts: microchip: remove spi-max-frequency property
Date: Fri, 3 Jun 2022 09:45:35 +0100
Message-ID: <20220603084534.1919804-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_014731_871525_926F6971 
X-CRM114-Status: UNSURE (   7.83  )
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

spi-max-frequency property is supposed to be a per SPI peripheral device
property, not a SPI controller property, so remove it.

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/lkml/20220526014141.2872567-1-robh@kernel.org/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Since v1:
- Rebase on changed filename JIC
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 3095d08453a1..65a20c0b8af1 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -299,7 +299,6 @@ spi1: spi@20109000 {
 			interrupt-parent = <&plic>;
 			interrupts = <55>;
 			clocks = <&clkcfg CLK_SPI1>;
-			spi-max-frequency = <25000000>;
 			status = "disabled";
 		};
 
@@ -311,7 +310,6 @@ qspi: spi@21000000 {
 			interrupt-parent = <&plic>;
 			interrupts = <85>;
 			clocks = <&clkcfg CLK_QSPI>;
-			spi-max-frequency = <25000000>;
 			status = "disabled";
 		};
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
