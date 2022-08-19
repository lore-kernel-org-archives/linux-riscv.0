Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674B1C28D13
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 23:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qaKYdSe6URs2SO2Y8STcLOgm4rfw8fA3CI+23kb76MI=; b=G+HuIfvnsVDXZJ
	1dQBDYMGmVOtoNICE1ic2jZylc7TobaF72FM4S9pZ5u0p4jgk3gQoZ1Moybgf5+V7vRJ2GKX834Ux
	5WlZxSdnSZSzTLL0KYBlX/HkZ58ZwKeVs8mp8oH6PzED8LfNkhucoRPg3behTPiU9BbIJu0r8IgXp
	wBPFu+RRMx5JNZEi+vfwlY4xMBAX8Ad3/weebuoUz8SjbgckMrD6nzgw8Nd4Vbh5VlXcf8Et1/05F
	ysTxsjJd5Vg3Wir43t/mSq8NX0WaX4BHzKbx7SNQ/aMp6Ac7VOYMA24WbXuC5FyjmMTcskw7TvBz+
	ZwOH3KMcoxbkRcBPKZNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPBCJ-00DHdJ-P5; Fri, 19 Aug 2022 23:14:39 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPBCB-00DHOq-FM
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 23:14:32 +0000
Received: by mail-wr1-x42a.google.com with SMTP id bs25so6722991wrb.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 16:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=qOyz6Sg85RbWT2/Ms96NRUeJwTK6SHK6KdVqomRoy/M=;
        b=b20LHdRRH8R/Q+oePil62xrPW3l+XqvP6OmHEeWw5bOMd1EMbcO5TLuIWroY5y4Ee4
         CtEA5P44vdN71F2XBMUzih8Oyi5MNTB6RCneepbuqNo+PvIRb28c3l0VYVyt+z2a3ArX
         MnCcFo1H7PxGuAjpRKHazx2atqDqRZV1JtUGrw7N3Q2HleE0QUrVKEJAnY3qwDKkLFC3
         M9vIok1W1mUEtYuyX4YpLrISDk1RfxX5dRP4o4ReB9RDkWygOCIS/hSJ6FJROZ9Yq5Eo
         5HBu79m9ltkIkSUT/q1W4UEGTGZiXchtMW9C+KujCeX4I44CfYxOaytpkD2uT91XGFvA
         xpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=qOyz6Sg85RbWT2/Ms96NRUeJwTK6SHK6KdVqomRoy/M=;
        b=QBTt9eJ2iF5c/kZJBzuIST4Jol/I0l30e2yA4steR5BqK+MYEft145S/T4hEKzZQSZ
         jD94w3HDKjfAGPkIYECpywWbwa1y30ZfdK8uz/BjfbsPNFm+wpPwV7FkXBzXzecnAyF4
         0rKsitkV6tuvTdwE6w5k69Z2fSWrs27RpxE0mM9JmKZtzA4hTMcy08/ZxesfTep1MTcE
         9+Lz5nlWsaGuuq39b8Rt32W1vNDAv2ybK2TRxxbDm6haqN0tlrRv1b395sQulHY+UWBu
         awsWYbdPJOCPpfyWjlPXQBJA5NRvc/GatSfDBcVhQyx0PFpdRzX/eRwgiYR44axDYmHV
         6NTw==
X-Gm-Message-State: ACgBeo3jkVL+DUduAM097TunH1OMRaKGB0IGj2AlPQclHHsKDYuobhV9
	Vj8XLu20EAPsH96lO26wLfLHkA==
X-Google-Smtp-Source: AA6agR6vUaHN6BTvJT+nGrbl0qd+vCmNAcWX79JjfXB/fht2QO+oi5yTVfEecpWAaDUdcw+aY1zs+A==
X-Received: by 2002:a5d:64e2:0:b0:220:7dc6:1353 with SMTP id g2-20020a5d64e2000000b002207dc61353mr5381793wri.411.1660950871065;
        Fri, 19 Aug 2022 16:14:31 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id g17-20020a5d46d1000000b0020fff0ea0a3sm5198522wrs.116.2022.08.19.16.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 16:14:30 -0700 (PDT)
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
Subject: [PATCH v3 6/7] riscv: dts: microchip: mpfs: remove bogus card-detect-delay
Date: Sat, 20 Aug 2022 00:14:15 +0100
Message-Id: <20220819231415.3860210-7-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220819231415.3860210-1-mail@conchuod.ie>
References: <20220819231415.3860210-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_161431_549400_9C5AD545 
X-CRM114-Status: UNSURE (   9.69  )
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
