Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D5ACD4851
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 04:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TD+BuMZ7wwVHWX/LGKrrxSbId3DgsM9V9tYEr9ti3z4=; b=TaH79RENGKkiQW
	EaUbDKle4NWgcKY7QAfQjhixunjXG13XHu5qmlDq1+r3dDrEzA9qaqGBEkQwbPocHF/Djs8XaLBUX
	Y/fPHXmjku46DC6TUkv/H83ZJdEHcH5jU0WYYwUvO6u5i33ToSmt0MG94ytqIdERoQ4dwygDutBPO
	yReSf6AbinXMuEUntJRFL2tjYQm4bojyYzPjKw4TWbt7rVoigkceGwp2Wfb50D374OsMmKiuCdI8J
	u1kXaCHIiuyUKhw8zduujrXpaJ+Qy3Ltu+X3wk0Y8PQ3wRCIB3IRVXe4S+Tq/2DFFCn22kwfS5maf
	uRQhs5Fey8UzcSENOw7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBrX-0000000053x-0Jx0;
	Tue, 19 May 2026 04:15:23 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBrS-00000000506-0njA
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 04:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=mSw2a+RDrVOcV8ZSoq/p8SdqL+RrV1G3jvfZ9SHsGmw=; b=uBTcsGjQWTryN5hW5QQx9lIae3
	5HgW4XWxajw8+zGNsQ8U8IRDrPF4eoX9TecZO8udDoDJBj9c+NiekFZ+VQAoCzqA7A3N0TbmmSEq3
	hUf9RptC/tapKqdf1SAq8W3OWL761YmXvKcVlqWRhBahn0A0OvvkWp4+PlDV65ryWa+W13kTCViN3
	nzs3vNmVZQqqi1aj+RC5P0hlNjLA6W14Dre9JD/K92eEXXVCaluVI8OBkqBmHMbHWQyBbXprkaadA
	oIyUkF9FcvK2EX9wT3R/CtYu6XZMqoArFXuy7stc6b9P6Q0Ru7eysr8EuuFbFosXjTA1vgowR27c/
	nzJQC90w==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wPBrH-000000032ll-3qar;
	Tue, 19 May 2026 06:15:07 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 3/5] riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
Date: Tue, 19 May 2026 06:12:37 +0200
Message-ID: <20260519041458.3287843-4-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519041458.3287843-1-aurelien@aurel32.net>
References: <20260519041458.3287843-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_211518_252898_63C93338 
X-CRM114-Status: GOOD (  10.40  )
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

The Milk-V Jupiter board has a connector for an eMMC module. Add an
entry for it in the device tree and alias it mmc0.

Mark the device as non-removable as eMMC modules have no CD pin and are
not supposed to be inserted or removed while the system is running. On
systems without an eMMC module installed, the kernel emits the following
informational message during boot:

mmc0: SDHCI controller on d4281000.mmc [d4281000.mmc] using ADMA
mmc0: Failed to initialize a non-removable card

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

v2: Mark the eMMC as non-removable

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 450d28e438293..eb53198b95061 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -17,6 +17,7 @@ aliases {
 		ethernet1 = &eth1;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
+		mmc0 = &emmc;
 		serial0 = &uart0;
 	};
 
@@ -138,6 +139,16 @@ &cpu_7 {
 	cpu-supply = <&buck1_3v45>;
 };
 
+&emmc {
+	bus-width = <8>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	non-removable;
+	no-sd;
+	no-sdio;
+	status = "okay";
+};
+
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
