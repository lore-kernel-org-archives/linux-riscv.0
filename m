Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90486606A328
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xWePbnmQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UdAKBbGS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QORBbafBTEqDBwRQi5Y0seYqZn4hB7IZAJ5EZuNOTpU=; b=xWePbnmQXfpIHYClljS+IMoHxG
	qtanhs7pFoBXfCVT3nZF13gntmmLmLH9fB32hVwN5OH2f4V2seFFHWof0ODiU8KqmpM21bryxNR9a
	Ny7dA7lKcqrzdBdif/yJiNYe5V35YXbAezWiDhJRyOnqykg3zfChTBljorf8X6NF+KerByd8dFD1g
	pxyPujzlY//Dt9j0huQ8NfAbrnxCmLkJmOW4y0heMsiHE8lt3NRRDqmik0Pvcs9KhWYIwvGOmx6Gt
	kZsFwwBB7KosjShjXuc+uNw8wr1kofkr/7niz36sKFfKwKAVjSbEMmK/VuRwoSwY5cNJI8sZ0f1Q/
	FKo78zNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcMO-00000005h8z-43Br;
	Wed, 04 Nov 2026 14:53:08 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcMK-00000005h8Z-3b3a
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 14:53:07 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-67999045530so705494d50.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 06:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793803983; x=1794408783; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OtVIvE0LCCTII+h8nC0irSrmpYrzDs5fgAChS99QN9w=;
        b=UdAKBbGSJJxhMz3X9hNWIq1PKiU0VuMFU/rKpB3QHZVmGTopfcsVYqBXjxbsW4M5n4
         yfor5xHwdEN3RJ07npm1t5BVbLfdMtDobc7ERIKs0/2h5KAlyJvv6AogNLaZutlD0euX
         y+h6Re0vDIwNVZ8PwJGBdX10YETLUx3IR9JhtggO8bX3qF3++Du1M3qvqdKI/+yi5v4K
         fCzRuwUiCWiZu9eOiq/nSKdS03d9PP0KeBGSgdE4uIP3Ws72VFUoIbkLRFU3fDYFh7G+
         fBLaJhpxoaoTxgFmhI4nADiubRoe5IBZiJfj/09eeNhEoKCi8UzwlP1662KKjOZDoYO5
         q9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803983; x=1794408783;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OtVIvE0LCCTII+h8nC0irSrmpYrzDs5fgAChS99QN9w=;
        b=iOWtJnky/X64qLO1w/gHZzHme5mzn3SUWOGs1asxA8jqMXATxlBDRhN0w8rkuAZfBm
         WVAQP9SB+FpE6S7VUjPESInUp9qsRQdhHFHPFRJ0RZKSUC1SSzp80eftTx/Zec0lXbxd
         v3jtTzMx8AZlMNz8WKDqNNflpr8xnXkUU4jR0Y4q2y4GB91tbMToJ7+OmLl6QjFwY7bS
         /79CCl9CVaaHGPaaU4E1+MutzwWfMIytat84hbLW7Zoj6oT3yWLITg/NGZdeorM6yHY6
         8qUmquLpntrHWwbJ7OF7mbfo6SKY4VhoGJ773SFAqFmfTkp5tRkUTVe6lfZzMa9bQ2pZ
         iNyg==
X-Forwarded-Encrypted: i=1; AKwUvBzqc3/IdxG02avnB6gWKXB+M6rucxZXk0GeToUPSp4EuwoxBIm9hwpRMCeab26IOzWWsli/pEYUY7s+Mg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8FsGI/6xk3fnshc/V6F0RtlbVeQhTJoN+35N+xOQSJ9OcF3+hi
	PNehL4FKE/sR/y23Rl/iqqwdLo+mpwW6A9+ZLgiH06CEsWJZygb1PQNTEFhs+EA60W8=
X-Gm-Gg: AYBFou0sqI0NEajtZP1kDX+2ULvJ4jwu1ONE3rFnzgPWBfyeNK72nAmGAgq4Ea3+hHk
	fT5osxNBoFOo12GWHrOecxUY0fpOMlruv6zuEKB9fQvfRq1VQMkW7WHXXrrjayXF3vfutIkxpmh
	mm6JqVGSdh6NHXP4h4YfYbCo7gQSi4Lk9mM3OpYrXSVHkVAICM7wBzHTD4ts/d5B7SlfdZq4tMK
	W6Dnx49uV2s5ieSd0eSqFumUaOM5G/Fhq0h425vcS3yIwZixsWaDYGsj/QFNenV1YaTXrooAnAa
	tjm0Sc8XBLd1l4oEhA7vMKYG2FQosEd1JaGjelCzvWGrlpgLYtXpuUCzzQ5eLZuz/c2xDbFQLTW
	n/Y0RYJKyGFB6HZqkJv2zuaNa/kjmNgPJl+9kKqzURKnf9smdt9WyhLOMZqnCI9aAIPk15Z6j0S
	7dwOebPD6FNEOnLFs35wB7TXnCrxS8SCi4IDzescpfyhOBFqnZsgluJS/WA6g8ISDFuiFWDGXP4
	rK73I3e1QzCcdH+4g5yHixwt1EJqXA1anOXcM82gfZ7JlVSvaEIQQVIT8TjAXHbIB8fauxS7+yc
	fCTXktSsMM7UAhGwhGoe4hfhbKFd7OW1mqmb0jG+dUkMRo6dNlDMqpMyh3W5qaC8NJqQ
X-Received: by 2002:a05:690e:80c:10b0:67a:7b76:a5b2 with SMTP id 956f58d0204a3-67ba50235b4mr7893297d50.99.1793803983078;
        Wed, 04 Nov 2026 06:53:03 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::33ca])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee24498dsm1569080d50.10.2026.11.04.06.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:53:01 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Subject: [PATCH v2 0/2] riscv: dts: sophgo: add cv1800b ethernet support
 overlay
Date: Wed, 04 Nov 2026 11:52:32 -0300
Message-Id: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr2Jm7ZgWiqAr72FYtGWQUaCmhUZCu
 LuAB3D5kvffnyGQZwpwPczgKXJg16+QHA9gG90/CLlaGRKRnKUQEjtuXxGr0SENDbpIvtUT2jr
 P00Kpi1YC1u3bU82fvXsvfxxG8yQ7bLHNaDgMzk/7cZSb9+8jSpSYF8ZKlak6zczN6Kll4+lkX
 QflsixfiH8Pfc8AAAA=
X-Change-ID: 20261001-milkv-duo-eth-overlay-cf7738449a40
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Chen-Yu Yeh <chenyou910331@gmail.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_065305_192755_8791A8F2 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

The first version of this patch added a board specific ethernet overlay
for the Milk-V Duo. During the review it was pointed out that the Milk-V
Duo 256M already has an identical overlay, because both boards just need
gmac0 and the mdio multiplexer from cv180x.dtsi to be enabled. Instead of
adding one overlay per board, this series makes that overlay shared.

1/2 renames sg2002-milkv-duo256m-eth.dtso to cv18xx-eth.dtso. Only the
file name and its comment change, and the composed DTB for the Milk-V Duo
256M keeps the sg2002-milkv-duo256m-eth.dtb name.

2/2 composes the same overlay with the Milk-V Duo DTB, adding
cv1800b-milkv-duo-eth.dtb.

Changes in v2:
- Use a single shared cv18xx-eth.dtso instead of a board specific overlay.
- Rebase on v7.4-rc1.
- Link to v1: https://patch.msgid.link/20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com

Testing on a Milk-V Duo (CV1800B) with its IO base board, booting the
Milk-V Duo DTB with the ethernet overlay applied by U-Boot:

U-Boot 2026.10-00013-g3c998cf93c4f (Nov 04 2026 - 11:35:44 -0300)milkv_duo

DRAM:  63.3 MiB
Core:  22 devices, 15 uclasses, devicetree: separate
MMC:   mmc@4310000: 0
Loading Environment from FAT... OK
In:    serial@4140000
Out:   serial@4140000
Err:   serial@4140000
Net:   eth0: ethernet@4070000
Hit any key to stop autoboot: 0
** Booting bootflow 'mmc@4310000.bootdev.part_1' with extlinux
1:	Duo-OS (Milk-V Duo Boards Distro)
Retrieving file: /Image.gz
append: root=/dev/mmcblk0p2 ro rootwait console=ttyS0,115200 earlycon=sbi
Retrieving file: /cv1800b-milkv-duo.dtb
Retrieving file: /cv18xx-eth.dtbo
Retrieving file: /cv1800b-milkv-duo-led-blink.dtbo
   Uncompressing Kernel Image to 0

   Booting using the fdt blob at 0x82200000
Working FDT set to 82200000
   Loading Device Tree to 000000008355e000, end 0000000083566fff ... OK
Working FDT set to 8355e000

Starting kernel ...

[...]

root@milkv-duo:~# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen 1000
    link/ether 0a:6e:82:b5:51:74 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.68/24 brd 192.168.0.255 scope global eth0
       valid_lft forever preferred_lft forever
root@milkv-duo:~# dmesg | grep stmmaceth
[    0.500755] stmmaceth 4070000.ethernet: IRQ eth_wake_irq not found
[    0.500827] stmmaceth 4070000.ethernet: IRQ sfty not found
[    0.501156] stmmaceth 4070000.ethernet: Hash table entries set to unexpected value 0
[    0.524693] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
[    0.524795] stmmaceth 4070000.ethernet: 	DWMAC1000
[    0.524819] stmmaceth 4070000.ethernet: DMA HW capability register supported
[    0.524838] stmmaceth 4070000.ethernet: Active PHY interface: RMII (4)
[    0.524860] stmmaceth 4070000.ethernet: RX Checksum Offload Engine supported
[    0.524878] stmmaceth 4070000.ethernet: COE Type 2
[    0.524896] stmmaceth 4070000.ethernet: TX Checksum insertion supported
[    0.524916] stmmaceth 4070000.ethernet: Normal descriptors
[    0.524935] stmmaceth 4070000.ethernet: Ring mode enabled
[    0.524952] stmmaceth 4070000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[    0.525082] stmmaceth 4070000.ethernet: device MAC address 0a:6e:82:b5:51:74
[   12.726604] stmmaceth 4070000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[   12.752406] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
[   12.792299] stmmaceth 4070000.ethernet eth0: No Safety Features support found
[   12.826448] stmmaceth 4070000.ethernet eth0: IEEE 1588-2002 Timestamp supported
[   12.826535] stmmaceth 4070000.ethernet eth0: configuring for phy/internal link mode
[   14.892433] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
Hiago De Franco (2):
      riscv: dts: sophgo: make sg2002-milkv-duo256m-eth overlay generic
      riscv: dts: sophgo: add Milk-V Duo ethernet DTB

 arch/riscv/boot/dts/sophgo/Makefile                                 | 6 ++++--
 .../dts/sophgo/{sg2002-milkv-duo256m-eth.dtso => cv18xx-eth.dtso}   | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261001-milkv-duo-eth-overlay-cf7738449a40

Best regards,
--  
Hiago


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
