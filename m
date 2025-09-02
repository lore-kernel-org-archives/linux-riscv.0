Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93225CA1005
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 16:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HaVX+C7Ax9pIlybiq9M4d3EcFOy41LGwKGeaab3qIBI=; b=0blQslLyZipEgS
	2dUAL7TqOsKAD9//4ekARnbwgQCBavgNuGd/l45Yqo1Xby+Ko4Sx3ZVzILADiLx1IRaT5w3+Uowm2
	Om6/hj/HNR04RZM/5FafivuRcr4C8rSZiX2YdJidbJcCAjz5/H/UuJj0tFacQNg6Ki1rlCzNK5A1m
	UTPaUHyzFcj856PuQ6Hg/O1JK72JyjX89sgR46WAx6DdX1uclveonihY+MJnudEMXTJW/EXW0mSTq
	j1+XY8L2YvoVErfmtgGeUurcPg159+EeZ94H8+SGKg7BVoWrafAYcqSCY1sGqqjL3uDxrX1kWu4Kx
	2iSrs7eRtvLvwnJTeo/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTfU-00000000u1d-0Gay;
	Tue, 02 Sep 2025 16:15:36 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ6p-0000000HDzi-21nh
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 12:27:37 +0000
Received: from [127.0.0.1] (unknown [116.232.18.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D8E4F3408F0;
	Tue, 02 Sep 2025 12:27:22 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 02 Sep 2025 20:26:58 +0800
Subject: [PATCH v2] riscv: dts: spacemit: uart: remove sec_uart1 device
 node
MIME-Version: 1.0
Message-Id: <20250902-02-k1-uart-clock-v2-1-f146918d44f6@gentoo.org>
X-B4-Tracking: v=1; b=H4sIAJHitmgC/32NQQ6CMBBFr0Jm7ZhOo7a48h6GRcGhNBiGtJVoC
 He3cgCX7yX//RUSx8AJrtUKkZeQgkwF9KGCbnCTZwyPwqCVPitDFpXGkfDlYsbuKd2IquW25p5
 UzwrKbI7ch/eevDeFh5CyxM/+sNDP/okthISX2rK1J+cMmZvnKYscJXpotm37AlAzF0OxAAAA
X-Change-ID: 20250718-02-k1-uart-clock-0beb9ef10fe0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=moNuE2PRSa0VOYC0+NmKIqSBqUotBU26lZOsdMAaqiU=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBotuKnh7sGv+ULWyGalREl83uFZAXlNGwzlBtHB
 u/qrvncND+JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaLbip18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277SfYD/0Xisz07nPm6GOmWU
 iXPneJjpAPADkmpIhwBkBn4Ey7DtRufKtK4jnZDtAQ2C7CEnPResJ3d+FzXf3TutIfAmmYwAm6F
 msmovcYACCclKjPuHLnQP8j/e2ylroGqPnCGs5PeFo/kYgnz3AdGBTaikS+XcBEYSAReFUrn5/W
 e7yTJJuBWd/4rqqe11gUMQ7fpta5vtbERkn/rs5EXnpqEpWG12w8ERFT7qKj5Rmf8ilIUVEjRbc
 1efbpuVyiQpilqyPBmfwHxTxJNmfnAgJrCNC5xDnxAsqNFCAjXRZqxOWzcg1VryGoW1Grc2zE6H
 Gk5XH2+AwWmfgmA5cwfPSCgmaTaNh8M72VPPq1ZocowDlYyekfoamfKWdEuEC7+z04mB1dT5zQx
 3N4q45D8dXp2rFDikQ/2bT6P85o9Y7gJRSt6x73V3GVRcX6v6paYqxcuhj6EzemlctROdI7s/tg
 YWp4NU9C/swS7PCg+FPluEw5IB0IIEpt59yOPFwo4AcMgI9RZSDmMmkvUMTbS9oPFateEpEsg2r
 XIFDrDpzRlL5wVwA1KuLqSLNFzUp+3w0uwFf2DsZCl+2EVB8MvwJXLZ2+umwv0thXCBYBl1/zwy
 Ne3JVLS/uKHuPU2VSZgCsToiyRSq3JMGxcD2ITzG33pzpW7QAb9xbWh2iuzUoSXRpvog==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_052735_677421_E286AAE3 
X-CRM114-Status: UNSURE (   9.91  )
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

sec_uart1 is not available from Linux, and no clock is implemented in
CCF framework, thus 'make dtbs_check' will pop up this warning message:

  serial@f0612000: 'clock-names' is a required property

Removing the node from device tree to silence the DT check warning.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
This patch try to resolve the DT check warning due to
the clock for sec_uart1 is not implemented.
---
Changes in v2:
- remove sec_uart1 node instead of marking it as reserved
- Link to v1: https://lore.kernel.org/r/20250718-02-k1-uart-clock-v1-1-698e884aa717@gentoo.org
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index abde8bb07c95c5a745736a2dd6f0c0e0d7c696e4..3094f75ed13badfc3db333be2b3195c61f57fddf 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -777,16 +777,7 @@ uart9: serial@d4017800 {
 				status = "disabled";
 			};
 
-			sec_uart1: serial@f0612000 {
-				compatible = "spacemit,k1-uart",
-					     "intel,xscale-uart";
-				reg = <0x0 0xf0612000 0x0 0x100>;
-				interrupts = <43>;
-				clock-frequency = <14857000>;
-				reg-shift = <2>;
-				reg-io-width = <4>;
-				status = "reserved"; /* for TEE usage */
-			};
+			/* sec_uart1: 0xf0612000, not available from Linux */
 		};
 
 		multimedia-bus {

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250718-02-k1-uart-clock-0beb9ef10fe0

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
