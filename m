Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625C1C43458
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 04:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1W2kt639h3eK9js33BJmHcKLlt5W1IGsY+lv/cgj/3U=; b=luFaZR/XI5PJOo
	7ufQNEVcXD/JK3A/rV77bJzEqcHhGStPCGZ6gk9Jjt8oAnP3e6PCixapi1To2Jnu47LqQKkmRKqdP
	06Odr6ZpGsp4c4SsGVXS+ADsWP3cHixj1C2iuAvMDPe9UuHFufDFQNw85FxyKEC0XPP1+rSLwvg14
	C7c9Er2fR/ecBVZiIrlFbVd93Bx5Dvsx4TCoqCBYUm4b4Z8IXqSexMAM1CU8UrrZ5GH6C9NOuIOZq
	xjBMkZgmk+RkUJ/e4k0xrrf1xqDgIiyP/aKxuSoyIQouKklDWufCQB/N+QbdoF76zBAs9i9P2FxRu
	0qNQPttLZGxasvgWX+uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wimBz-000000079Rw-1Gvr;
	Sun, 12 Jul 2026 04:53:27 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wimBw-000000079R2-0tnH
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 04:53:25 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so34850645ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 11 Jul 2026 21:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783832003; x=1784436803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vtqux2brqZY3L9xWBvozGrzsW9R7W5/4mbtliRjhCrk=;
        b=Lqy9pVNtZArdIQQ3F0FfFoNBlqPog5nEnby9F/ubySNUa1w4R+57w8RGvBExeHuPDD
         5va1VpflmcEvUbvmAOMjmUQhLadr84jntiRieA5N88RPa+ClqDmpipsqvN4KSg+AINGt
         nhkNXda6KCiygL7U60U+nUIATiJO17t1PmOLvEf87QZIo5J48/fKlGkgAguTnSUv/lwN
         PLqXwZ6eMhG3nhQx0xmbRTCLySW2IfqDBQsx5VDqbgZztfkedLjioMu1XY+V6dMX1Gag
         JpiOZWb4RX0CPVEPusMT+0ucK2CNS/rd5K9/J2QE/YAhNp21JOPlB8z8E/UnBb42s+uC
         rOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783832003; x=1784436803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vtqux2brqZY3L9xWBvozGrzsW9R7W5/4mbtliRjhCrk=;
        b=QWCYYTaGg+F1rRY1pSvSC21hP8XhSdK0Wf5qjldL5iQUQyDuboDh62AFrH7qut9eQb
         xAkN6UlWZxweKwaGryp4BbZu5rnlZE0Vd1PPGUsduYISXZLF8bZXqtRVHci77gWAfU7s
         uVd+oM23s6LiZFKToV3J2cVggFVdQGWWJDfMpd5euIJxSfAS6dR+P0CFpHyQ3aUUgh7o
         SXfe2hiq0m4MbzZmewLhmJKCKiv6trp+xDc+QqiRrDwsjnG7uXqGa2oCXm8phZ70Fqx2
         9ZQr9ZZhWY051bvph6u4KN1SnmqHX5EdzKQs4z5BHOjDLOjaKlknlgFh5uwgpf85NZHC
         jHQQ==
X-Forwarded-Encrypted: i=1; AHgh+RpN0mcLxM4BlfuvZ0kb/wuDzNPZbelRjW6xX0oTJnxwURcYJzC2zx/+oQ5TF8dvO2Eg/pHUEbjbdMfhNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUvFGi8vJVLchuSBJWgPrCZFwP+UAyMCR5a6fHjZpFVKttPLT7
	euPpWbMcF/c6uVwUJpOShyZrNWVK77r4UnhAvRhKvEXdDNcmG1JOi25D
X-Gm-Gg: AfdE7cnRQekE3SOjFMu2ru0FQUHv+8HwQ4mHDGHp9kFmFJX/cLI0Xc1kT3zOVkYOuXt
	eAveO0NnKNDmSUHq/4K4uqXdFFygeWwsQdeBXMr/aP1KJduerRmfJNDy6TlyV/xp0MEl8xKGUNj
	7WRoLp5To42oF3UbloM5NiQDZB+p9KZgM4d3UIMPX/38Ynub65Uuw/AbgLPv7gIEmuT2VRZRpWM
	UiE3jUHxK6zCDtLRoPsbtgYlXgXZhCRte/EAcgYAxruYoIGdAm5Qf3loARPN9gM+/K9jCWumBmL
	tJpPOGZtDLxc4H6K8JVaDWFg5xkcFvPpZE9V2BXmjUZVaD1oogNwZJTNTLod668ClClBVk9fTEs
	j7jGNvtVPLyXL96ojtg5lc8dk79UkW8DFBPFxd5bXOHZuy1ZjQwu6TDVGVNVQAL+dFDWZxeGrmr
	0=
X-Received: by 2002:a17:902:f68b:b0:2ca:1eef:5096 with SMTP id d9443c01a7336-2ce9f15ccacmr45287845ad.36.1783832002767;
        Sat, 11 Jul 2026 21:53:22 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3da55sm81624355ad.71.2026.07.11.21.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 21:53:22 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	E Shattow <e@freeshell.de>,
	Han Gao <gaohan@iscas.ac.cn>
Subject: Failed to reinit phy of spacemit-dwmac when reset-gpio is present
Date: Sun, 12 Jul 2026 12:52:33 +0800
Message-ID: <20260712045233.800748-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_215324_300225_B6E45621 
X-CRM114-Status: GOOD (  13.23  )
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

TL;DR:

The DWMAC on Spacemit K3 is failled to register phy after the reload
the driver module (rmmod then insmod). Because the reset-gpio is
asserted while unloading the driver and is not desserted before reading
the c22 id, which leads to a fault.

Description

In a few days ago, E Shattow reports he has sufferred the a weird issue,
when unloading the spacemit-dwmac driver and then reloading it, he got
the following error:

[   60.713071] mdio_bus stmmac-0: MDIO device at address 1 is missing.

This only occurs when reloading the driver but the first initialization
successed. After some function tracking, I found it is failed at reading
c22 id. The call graph is as the follows:

stmmac_mdio_register
	mdiobus_alloc
	of_mdiobus_register
		__of_mdiobus_register
		__mdiobus_register
		__of_mdiobus_parse_phys
			of_mdiobus_child_is_phy
			of_mdiobus_register_phy
				fwnode_mdiobus_register_phy
					get_phy_device
						get_phy_c22_id

By checking the difference between the initialization process and the
reloading process, I found the reset gpio is asserted in the function
mdiobus_unregister(). And there is no any function desserted this reset
gpio in the loading stage. And in the initialization process, the reset
goio is deasserted.

This bug report is sent as I found it is hard to solve this problem
and ask for help to fix this issue as it is related to the framework
instead of a specific driver.

The possible workaround I found is as the following, just use the phy
id in the compatible string (Confirmed by dlan):
---
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -196,7 +196,8 @@ &eth0 {

 	mdio {
 		phy0: phy@1 {
-			compatible = "ethernet-phy-ieee802.3-c22";
+			compatible = "ethernet-phy-id001c.c916",
+				     "ethernet-phy-ieee802.3-c22";
 			reg = <1>;
 			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
---
An interesting thing is, moving the reset-gpio to the MDIO bus level
does not solve this problem. Only setting the right phy id can mitigate
the problem.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
