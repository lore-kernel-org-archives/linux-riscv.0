Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31CBCA5FC4
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 01:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XCBh1Xauywt+fiPYpYab8rVskQK8DK2ajiKHEULYmV4=; b=zMaXVuL94gPScc
	esny+ltxlsZ1P0y4cBvbr+JIhw0UmX+//XXMo0G8cjfi7/JQYyF+/zAiNP0qT2k5QD9YxCtDu6Mfx
	Dv5LNfY1+ZztDqqe4Qxn6iSAXktD4Sx/vwH7L5dbu6eo1rgUbVRdGkCq7Uko1BuXvoWlxG0nvBvC2
	DNjpmUYddMXxmBoY1h7awlCnnBiKbdQAlyN2EsLEIbMlYVIPCEXtWlRrdDkpMBJ/kfQpwl839yAER
	4AxWdrvZftvH1M88n/9OqMBqfAYS3xgwvAwKa3tUmWUHg5UaGV+38hahTd4/PmF4pMCmBREiPP5P4
	5nArdAIYKb6jwglE3o1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC5aB-00000007ZL0-0Kln;
	Thu, 01 Oct 2026 01:27:35 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC5a8-00000007ZKU-1OW1
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 01:27:33 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-5c83fbd23a5so263286e0c.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 18:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790818050; x=1791422850; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Nf26PtyZyqNQ8F/dA4/jfbxWwkqjE7SC80bfURzMGRo=;
        b=pgDedEuPmeusYeGjxg3iPO3OAtHs0j8TiRF8itFshW8EbKH7gfAFYhQ21rJ7tYv7nv
         E4+fCSKEKRd/QCMBU0M1LpFgA72tIGG3A/aMUtwtnnHe/wZ/hvQJNbd1DOCZ76+pkGhI
         6yFpSk7u9jJG0SKEsS/JhGuz2fciLvjyj+eZZGPnmUMyv9HOzLtBF6x6M6CILJDCZbF9
         /sDIiBuyRuKqTqeGT9iuIX8XJ5zQP6eJO5F77S4mMcK1T0A1hnVs3rHp4BCJ5g8ROsoy
         Hy7t2t6FctwfxAhXT8U2Gft9QXi214kfRr2tIulSdJvWE7UIx6YfU976Etl5KsK6vCf9
         607A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790818050; x=1791422850;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Nf26PtyZyqNQ8F/dA4/jfbxWwkqjE7SC80bfURzMGRo=;
        b=I+cW9JjWRYOI1KNBabUG62KvDvjkDahNlUrHMgJTDQd3Z2Kkz9XcEJDN8P3n3EYhK1
         2yF4ZHOS29QJ7DWTeTb31NmQ4cwDGjj9VsfBgU/dzA22MXxirgN1z+WMgrwc4XieWVou
         n710bU1NiZyGQqJOQ34p1CB6IruxywwzKwJ05EHIM/56uBqhYWebD61DdDCoHI53V+9I
         Vg+0bh7kaOSmh7mRiapTD40cwGWEmmCkwSo10A24+EqlHul+cnf5xUTwH10GRUNggJ2b
         WqwdojA34hEjsjlpyWfi1ZCYJZanocaXt++nFZo7is70aW73H3Gut48/jUW+cMEm9DNR
         ebfg==
X-Forwarded-Encrypted: i=1; AKwUvBzxPLQtDJYM4pvNPr/0VqwsT4Oityz+iIBN9Iaua8xvsm84MDCOvScfVuaNwmZY2cfWbVWEHoumVbKLfQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKiiqchCB2h2rsNnWahFAnK6p7+2oc4TewYAkNY1v8GRanWwBF6
	BEwTP0xMokEhbSpxVT21J2yV1iCqG7qVmvYQYBErAmO5gXUmqEuglZCPJvQcCfpzfBw=
X-Gm-Gg: AYBFou2Nq6pgf0nb8G4tLzYrLaLKWuB61nvPApVaKzraFLnatRxFJNfG428kwRlxtXQ
	Gjmpr3SJxpOPq5m58jy5DYjzBsMxRl9WAlEhBxXMyecJ1F//NGsIwIoz19qkR+uXYyX+DO6LI/T
	Q/X6pbxtVPHDBU0+jFEBkJTRKoL+plx3wjxf6bKToe2ZErj6beyy7WCB2kz/UnRk8P8tHKGPlJE
	HEZvZYQ8+E8p8QQwR+SR3f4IohhDG1bMHK57PYKLF1/y5f0IxARTsb1q2hfWTuH0rxY4Jd5gH8m
	1jt4Yw2UKClcZhv5546A0kYGk78FOkRsjYUOP8b66KCHdTAx9DEmfEC+FKroXu5f0uHyEi+MSug
	dJYmEIcFAFfnK876lY2Cqr4OOYY5y/4nUr36FRNrfh58p2NUrzaIq66Vdmg48wLk+bmOYpyDkv6
	qffoFFCtZGGM57SWXWJnaBekdgmNGkTdOK1Ov131/SV5Qze8M6OSCDdQg20suLES7WMz8Wvc+Eg
	e88Z0eeiiGpvan6hqI6pYz8pGYRG5a9bdRbzGmzgBE9Nltw
X-Received: by 2002:a05:6122:e41:b0:5ce:cdfd:89c6 with SMTP id 71dfb90a1353d-5d7b414cd85mr351702e0c.10.1790818050509;
        Wed, 30 Sep 2026 18:27:30 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14c:4c5:9534::ddab])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d7fa498de7sm1536275e0c.4.2026.09.30.18.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 18:27:29 -0700 (PDT)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Wed, 30 Sep 2026 22:26:40 -0300
Subject: [PATCH] riscv: dts: sophgo: cv1800b-milkv-duo: enable ethernet
MIME-Version: 1.0
Message-Id: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6CMBBG4Vchs3aSyqUEX8W4EOYXxkshbSEkh
 He34vJbnLNRgFcEumQbeSwadHQJ51NG3XB3PVglmXKTW9MUhj/6fi0s88iIA7xDZCt1IVZMVbY
 NpXDyeOh6TK+3v8PcPtHF34n2/QujMlumdgAAAA==
X-Change-ID: 20260930-milkv-duo-ethernet-6d73d6d054b9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_182732_402990_18B889C2 
X-CRM114-Status: UNSURE (   8.81  )
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

The CV1800B SoC has a DWMAC controller connected to an internal 10/100
Ethernet PHY. Both the MAC (gmac0) and the MDIO multiplexer used to
reach the internal PHY are already described in cv180x.dtsi, but are
disabled by default.

Enable gmac0 and the MDIO multiplexer to make ethernet work.

Tested on a Milk-V Duo (CV1800B) with its IO base board. The link comes
up at 100Mbps/Full and the interface gets an address via DHCP.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
Hi,

This was tested on MilkV Duo 64M (CV1800B) with the IO board, to use the
ethernet connector. Log:

root@milkv-duo:~# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq qlen 1000
    link/ether e2:b0:30:2c:e8:16 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.74/24 brd 192.168.0.255 scope global eth0
       valid_lft forever preferred_lft forever
root@milkv-duo:~# dmesg | grep stmmaceth
[    0.583766] stmmaceth 4070000.ethernet: IRQ eth_wake_irq not found
[    0.590691] stmmaceth 4070000.ethernet: IRQ sfty not found
[    0.597211] stmmaceth 4070000.ethernet: Hash table entries set to unexpected value 0
[    0.607833] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
[    0.615538] stmmaceth 4070000.ethernet:     DWMAC1000
[    0.620820] stmmaceth 4070000.ethernet: DMA HW capability register supported
[    0.628360] stmmaceth 4070000.ethernet: Active PHY interface: RMII (4)
[    0.635356] stmmaceth 4070000.ethernet: RX Checksum Offload Engine supported
[    0.642881] stmmaceth 4070000.ethernet: COE Type 2
[    0.648072] stmmaceth 4070000.ethernet: TX Checksum insertion supported
[    0.655153] stmmaceth 4070000.ethernet: Normal descriptors
[    0.661063] stmmaceth 4070000.ethernet: Ring mode enabled
[    0.666880] stmmaceth 4070000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[    0.675084] stmmaceth 4070000.ethernet: device MAC address e2:b0:30:2c:e8:16
[   14.965810] stmmaceth 4070000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[   14.986562] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
[   15.050700] stmmaceth 4070000.ethernet eth0: No Safety Features support found
[   15.092635] stmmaceth 4070000.ethernet eth0: IEEE 1588-2002 Timestamp supported
[   15.114625] stmmaceth 4070000.ethernet eth0: configuring for phy/internal link mode
[   17.193586] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
---
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
index 0e6d79e6e3a4..6fcd1d1f451f 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
@@ -35,6 +35,14 @@ coprocessor_rtos: region@83f40000 {
 	};
 };
 
+&gmac0 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
 &osc {
 	clock-frequency = <25000000>;
 };

---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260930-milkv-duo-ethernet-6d73d6d054b9

Best regards,
--  
Hiago


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
