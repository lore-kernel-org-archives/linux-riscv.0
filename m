Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70A7C2BB41
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 18:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qaKYdSe6URs2SO2Y8STcLOgm4rfw8fA3CI+23kb76MI=; b=nIBlyPQxkPSOFf
	0jI4yvDYqwocx8MHWrZLx/xDBKGgI0HNfb0F1qdbF3daCJTG6VGBuhOGds0o2wfRRBTan+YAoxaBo
	poGJ/qzCbKKSIJs6buYoceauj/3wLRiGE7VXuHzDFz4Kn0vAh3/h93aBwlXi3UQKlBvswDfF8zDyY
	wdudwypapklOzwXIkDJz2EAnFDHHijkZm22wQAXfnp3ay9nBz43HiiRktf5e+VHlxh4jgolYZyuLs
	FgZKF9WZ8hx8SZYZpR/alL2o8nfvVvtNAmE2fk5vnFdc+6REp1o24SRfFcqTdv/iinxFfzwkdv2SD
	fZrd+gP9jZvldvWjijTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO1GW-005oKY-N7; Tue, 16 Aug 2022 18:26:12 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO1GN-005oCw-A9
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 18:26:04 +0000
Received: by mail-wr1-x42a.google.com with SMTP id n7so2404671wrv.4
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 11:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=qOyz6Sg85RbWT2/Ms96NRUeJwTK6SHK6KdVqomRoy/M=;
        b=KrY4rxTH3L2TNT0Tj7Ea3n6H60cPP7wN7CFj0YwfZL3/tcHo7JcjAQR1cc9nCseY1Q
         CvSDX4Df1TuJvhRh0FUuNmuoYgfcd89WAuYpiQrxgJ36llVyw9SsimpFpQWVu02nWXcT
         GP9mZWjTux2x2gc3JPak5n3rBobhufro0EeesPdqdBTidWMJ+++fPtnXFwpd1jRaQ5uC
         AdM9UySn5X8nhrYKXkCGiq3sgYwQu5bBzjyBUZLqbo0GGVQfxEfmjHcQYruR4qw0hSOm
         qQQhOVUcytvQsE2/9LnFust0O3PVqEWZT76F7BbyLUy+nlQFXQ/WJkUS2M6MKFTbAD49
         f7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=qOyz6Sg85RbWT2/Ms96NRUeJwTK6SHK6KdVqomRoy/M=;
        b=P5nBck0GtvoH8hz00y+hRHYqoCCSMyI/DNARPn97gq43PkU/AkmA/aT45EyegPnBE2
         26dy1CLN2SwnMgAM9QDfP9i/B14w7Ixya8qoU3qh+y4hOuF5bVbpekLDtHDPhAsKDNrI
         yZmQPUNgLxxkhdIbVc4rDv1uI9KZQFs8N8HIbb2kxFwebuOzFgTEfRV74ZECyu/O2OTE
         J/B0I1qYlV7Np/BI25dvGFObYfPl2D8+VmWjbDsZlwLj7wXLnmxlflxsBu2bpNUSL5NT
         AfQ/hU2ovPChxMLVkl/AoXKyX1zVuOPMDrE1FI3iHsUMOIBCEscU3SLzzTobDcUMjCCf
         Bpmg==
X-Gm-Message-State: ACgBeo15l/7xlTtc8drcU/5V+gpTjK0cwmXchGD9YYs8FDrWJ3Z7KlzP
	WcNqUIRA/cnpvwFxUWeJch7ZCw==
X-Google-Smtp-Source: AA6agR5Eq/Dh2TGsSUxt13F3p2fStw1nzu0BqbZ6aF8bKxqUzWnpGd8AlGfuE2KkOMjcylA72rOhbQ==
X-Received: by 2002:a5d:4a84:0:b0:225:20e3:3ba6 with SMTP id o4-20020a5d4a84000000b0022520e33ba6mr881999wrq.306.1660674361600;
        Tue, 16 Aug 2022 11:26:01 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id s17-20020a1cf211000000b003a603fbad5bsm4015482wmc.45.2022.08.16.11.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 11:26:00 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Daire McNamara <daire.mcnamara@microchip.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 5/6] riscv: dts: microchip: mpfs: remove bogus card-detect-delay
Date: Tue, 16 Aug 2022 19:25:47 +0100
Message-Id: <20220816182547.3454843-6-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816182547.3454843-1-mail@conchuod.ie>
References: <20220816182547.3454843-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_112603_430648_E523AB94 
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

From: Conor Dooley <conor.dooley@microchip.com>

Recent versions of dt-schema warn about a previously undetected
undocumented property:
arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: mmc@20008000: Unevaluated properties are not allowed ('card-detect-delay' was unexpected)
        From schema: Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml

There are no GPIOs connected to MSSIO6B4 pin K3 so adding the common
cd-debounce-delay-ms property makes no sense. The Cadence IP has a
register that sets the card detect delay as "DP * tclk". On MPFS, this
clock frequency is not configurable (it must be 200 MHz) & the FPGA
comes out of reset with this register already set.

Fixes: bc47b2217f24 ("riscv: dts: microchip: add the sundance polarberry")
Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
v2022.08 or later of dt-schema is required.
---
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts | 1 -
 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index ee548ab61a2a..f3f87ed2007f 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -100,7 +100,6 @@ &mmc {
 	disable-wp;
 	cap-sd-highspeed;
 	cap-mmc-highspeed;
-	card-detect-delay = <200>;
 	mmc-ddr-1_8v;
 	mmc-hs200-1_8v;
 	sd-uhs-sdr12;
diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
index dc11bb8fc833..c87cc2d8fe29 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
@@ -70,7 +70,6 @@ &mmc {
 	disable-wp;
 	cap-sd-highspeed;
 	cap-mmc-highspeed;
-	card-detect-delay = <200>;
 	mmc-ddr-1_8v;
 	mmc-hs200-1_8v;
 	sd-uhs-sdr12;
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
