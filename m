Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94800CA5FCE
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 19:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GEYY4gjak5kUCQmRCV45lyFPZZwB2/VOhkBq+2WVCMQ=; b=JatQwT7KvKmbJe
	jOlk6MNJeMAI3CdFH2YJH0P5i7t6pcd4BpOkVpgNJ7mAtdA0zQz/8NeKfsOB3C4rxKF55+/F9QKvO
	ohS8aBXmuDEUIeZSNXuuSVSKr89ox7gBKMqlOkJjXLi5QcW23DRV/baSsqnJED+yE+v4GdBzWTe1W
	KIpqk/3hCLKmVxTDV3oyreULLnNiANskh+u450MwzNPgwl1S6jz9TgWu6pWGkYsIVrXiIYhIGYn80
	72X8swE8eOtM/z+fhqjsXfJPsfasm1IHalV/IzBK0+ukYCfuqlGpkAygjjH1t9xAijp5GEpiM9Jkx
	ICr9iphuqQWIgJIqnnBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMce-0000000A6G7-0SnP;
	Thu, 01 Oct 2026 19:39:16 +0000
Received: from mail-vs2-x28.google.com ([2a00:1450:4864:3a::28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMcc-0000000A6Fj-0XR7
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 19:39:15 +0000
Received: by mail-vs2-x28.google.com with SMTP id ada2fe7eead31-7bac9728285so1090090137.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 12:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790883552; x=1791488352; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qwRtr1D4uvDf2NM6dCLPnk+e61bN3tdOAsVS/ij5Mfc=;
        b=QCLySRX/NlIBsLu/wnho8ZyUhQLZ+B06pnRY3sS7BXJeDFG36NTGxt/sGjHTDosgAG
         C960d4FGelP241LwgdheEZcBRzgJ7DIj+nClgpcNmc2xRaolHUCyCmcWDxfHmm+V37SR
         X43UzbpJuxBkPnyPsg2TIzh5Ec+vxKF707Wu7/tuk+GjEy/sah5IZLrYnfkTnd98HKP8
         wdtfsRcBhihVI8AsQLrmUM+kdMBq7LxNaKR/hq+FdouPy6PL56uXkLqRiA+BctJPCabh
         2MZCgtCIav1l6P1cQqQGqNkN1WClysljx0PwDNgjUclFuoEPSx5SB5eMFREucQwgVn9U
         tGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883552; x=1791488352;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qwRtr1D4uvDf2NM6dCLPnk+e61bN3tdOAsVS/ij5Mfc=;
        b=1Fm7SBwz0ZgQDxw+EoS6tL6AQI9ZU7hjgWW3G1Y3yrIaHmdKUGVAWtnw0voNJWNxBk
         mvu5UGyv6l3MpR8rJrgAEUpTiq08zpqmPCWGMbLaQVR4bjly5LgyEdqJ9z4XSoEIGqoB
         2Ago+l7JneuuCtBb0w6iMhuZiOJH9O5XNZtTQAovbIop9/QWcCnwc2k7d5NtFSLsiPk2
         WWe9TKzxL81NQV11NyAh4P0GKXlqdd8oKsGlDUQsMtwVI3HjzEOp2lE14pQ1t7K91efA
         UTEBKqu0iZwRaqYKrBs2OZH74sKLm5dM+uL498UBNJP8SdRBPyJxKzYgaXWF7TO67YQu
         rc9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwGiAZX+UNzuq7cv+Ik8iCGJzCKG7Xr2ePi9VV/04uNNlj+QSwoitmTrvVwYLaRhL1vrQtAmnKEqL8x8w==@lists.infradead.org
X-Gm-Message-State: AFq9FYIa8Au3kTpAZjhTqZlCygdjSWk3B5FU00aerRXlgV5Y0cZxvigM
	PSgbyC4Ub6BgKL0Dua35hwlyvS96f1KXkmZsJsZEbVAoCloC2s6vQovD/L5iVm48Z+U=
X-Gm-Gg: AYBFou3/6UiMGsW/ietjckQHJxDP2RP4q8mvezhubKesbEOQasMRuEk2UlLaHhcMZB4
	neA7BKAcSSMplu86Ts5P7OP0+jQC6weZT3Ll4S2bMhR7UDPQxdRZwVlqCorubXOqiLEWiDhvVbj
	BN1iGkYfqimX1XEbge2pG/Sj+w5688rAtyMPTIeIPfZfsXf1mhFg01DEME6D6kuTBD4Pi0VsQRr
	CF+c3Ovhmn3CTExmvuCiEsnV3MbabLySwEvhfUPsJ8OMHf+sOzhN36HruML17mJUdybgoOUYfo7
	k3WZCCqK4yD+r/eSJay6h8/2LAAPKLV/Npi2WKgeK4Yzip2/coVVK4/zpqCw0m3aDrVaWS8y5S8
	wlUKHIMWujD4iL1fcmzYn6S7UbuVzvYgg0Lbly+Enbnb7x57LM3Qt/SCJN5zSdMcRRadlQ4MdF8
	ryK1+cu5mOfInPuchJ9mBJjLBhvAqxyzVssYCSjPdMUY3Ls3EgrtuTABYv4vEACWFQZJg9ps+zV
	uFTkdHDkJEdVriK4B3WESoe8dK9QTCxnrgZEOeaOpedHuw1
X-Received: by 2002:a05:6102:3fa8:b0:7b5:4f3e:70ac with SMTP id ada2fe7eead31-7c0f4c9e8d6mr134416137.24.1790883552571;
        Thu, 01 Oct 2026 12:39:12 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::ffae])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da612086f4sm921797e0c.5.2026.10.01.12.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:39:12 -0700 (PDT)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Thu, 01 Oct 2026 16:38:30 -0300
Subject: [PATCH] riscv: dts: sophgo: add cv1800b ethernet support overlay
MIME-Version: 1.0
Message-Id: <20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6DIBBA0auYWTsJKNHaqxgXiGOdasWAEo3x7
 tJ2+Rb/n+DJMXl4Jic4CuzZzhEyTcAMen4RchcNmcgKKYTED09jwG6zSOuANpCb9IGmL8v8oVS
 llYDYLo563n/fuvnbb+2bzPqdwXXdIrIOGHkAAAA=
X-Change-ID: 20261001-milkv-duo-eth-overlay-cf7738449a40
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>, 
 Andrei Lalaev <andrey.lalaev@gmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_123914_192650_396EA83C 
X-CRM114-Status: GOOD (  13.42  )
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

The CV1800B SoC has a DWMAC controller connected to an internal 10/100
Ethernet PHY. Both the MAC (gmac0) and the MDIO multiplexer used to
reach the internal PHY are already described in cv180x.dtsi, but are
disabled by default.

Enable gmac0 and the MDIO multiplexer to make ethernet work.

Tested on a Milk-V Duo (CV1800B) with its IO base board. The link comes
up at 100Mbps/Full and the interface gets an address via DHCP.

This can not be enabled by default as others may want to use the same
pins as GPIO, that is the reason an overlay is being used.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
Hi,

This is a continuation of patch [1]. The same patch was sent before [2],
and an overlay was suggested, altought it was not sent. Therefore I am
sending this overlay now.

U-Boot logs:

milkv_duo# setenv fdtoverlay_addr_r 0x82480000
milkv_duo# boot
** Booting bootflow 'mmc@4310000.bootdev.part_1' with extlinux
1:	Poky (Yocto Project Reference Distro)
Retrieving file: /Image.gz
append: root=/dev/mmcblk0p2 ro rootwait console=ttyS0,115200 earlycon=sbi
Retrieving file: /cv1800b-milkv-duo.dtb
Retrieving file: /cv1800b-milkv-duo-eth.dtbo
   Uncompressing Kernel Image to 0
\## Flattened Device Tree blob at 82200000
   Booting using the fdt blob at 0x82200000
Working FDT set to 82200000
   Loading Device Tree to 0000000083560000, end 0000000083568fff ... OK
Working FDT set to 83560000

Kernel logs:

root@milkv-duo:~# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq qlen 1000
    link/ether 22:9c:5e:8d:3b:0c brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.124/24 brd 192.168.0.255 scope global eth0
       valid_lft forever preferred_lft forever
root@milkv-duo:~# dmesg | grep stmmaceth
[    0.580448] stmmaceth 4070000.ethernet: IRQ eth_wake_irq not found
[    0.587750] stmmaceth 4070000.ethernet: IRQ sfty not found
[    0.594165] stmmaceth 4070000.ethernet: Hash table entries set to unexpected value 0
[    0.604856] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
[    0.612359] stmmaceth 4070000.ethernet: 	DWMAC1000
[    0.617641] stmmaceth 4070000.ethernet: DMA HW capability register supported
[    0.625189] stmmaceth 4070000.ethernet: Active PHY interface: RMII (4)
[    0.632191] stmmaceth 4070000.ethernet: RX Checksum Offload Engine supported
[    0.639720] stmmaceth 4070000.ethernet: COE Type 2
[    0.644915] stmmaceth 4070000.ethernet: TX Checksum insertion supported
[    0.651995] stmmaceth 4070000.ethernet: Normal descriptors
[    0.657911] stmmaceth 4070000.ethernet: Ring mode enabled
[    0.663737] stmmaceth 4070000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[    0.671939] stmmaceth 4070000.ethernet: device MAC address 22:9c:5e:8d:3b:0c
[   13.104870] stmmaceth 4070000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[   13.125037] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
[   13.172421] stmmaceth 4070000.ethernet eth0: No Safety Features support found
[   13.203664] stmmaceth 4070000.ethernet eth0: IEEE 1588-2002 Timestamp supported
[   13.229963] stmmaceth 4070000.ethernet eth0: configuring for phy/internal link mode
[   15.278278] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx

[1] https://lore.kernel.org/sophgo/20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com/
[2] https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
---
 arch/riscv/boot/dts/sophgo/Makefile                   |  3 +++
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index d5c80d4ff005..adea990ad912 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,5 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
+cv1800b-milkv-duo-eth-dtbs := cv1800b-milkv-duo.dtb cv1800b-milkv-duo-eth.dtbo
+dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo-eth.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso
new file mode 100644
index 000000000000..52c85b4e0155
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Enable ethernet support on Milk-V Duo (CV1800B).
+ *
+ * Copyright (c) 2026, Hiago De Franco <hfranco@baylibre.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gmac0 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};

---
base-commit: d24e8ac715de2e16a53c144005b1863660a5fbea
change-id: 20261001-milkv-duo-eth-overlay-cf7738449a40

Best regards,
--  
Hiago


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
