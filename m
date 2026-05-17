Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DC3CD4F21
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 10:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmOTpQAEMZWc8s3QND/nFtx/3Q+ALFxVBJUOd1Pqe4E=; b=IR4ysio+GuFN0M
	2PsXFI/IAut01fk1TfdshnqtLpfh++cxkSY53MebKTPclTGL2/XuDGddEtpx1n2hjyPRq6BFmov0B
	7keN65qr3uuVrJQeWRs3geyMOsmkluxv/XBEaUaqwfJ6ch8m5FGKGwALM0SK/n/xR5LACchXPuGNJ
	AeQd7LuJtfh36jHk2JCMPbU1f7siHYc+HvJwM0OK0qLtmm2M0+jAsBF/X29CWz9fZApCVaeEkasmo
	J4KvC6coLyLJ0ld0upFrwIjT+YQaxdO2AelQCs/RkD8RtmTSpRoVXWU6yO4Io6J3B2OY4DZJXwJn0
	yZ6AzpORzQ2uXkSSKQuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOZ4d-0000000CYIC-2LN5;
	Sun, 17 May 2026 10:50:19 +0000
Received: from mail-m82212.xmail.ntesmail.com ([156.224.82.212])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOZ4Z-0000000CYGt-3jTY
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 10:50:18 +0000
Received: from Vostro-3710.. (unknown [119.122.215.211])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3eb5cf39b;
	Sun, 17 May 2026 18:50:01 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: legoll@online.fr
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable QSPI for OrangePi RV2
Date: Sun, 17 May 2026 18:40:40 +0800
Message-Id: <20260517104040.1941126-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e92fc4a6-7a63-4d24-9c13-8fec3d8184d3@online.fr>
References: <e92fc4a6-7a63-4d24-9c13-8fec3d8184d3@online.fr>
MIME-Version: 1.0
X-HM-Tid: 0a9e358ea40403a2kunm5a1540d111564e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSx5PVk4YGRoZQh5KTExDSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJSkpZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pOTE5VSktLVUpCS0tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_035016_191755_F2F4F207 
X-CRM114-Status: UNSURE (   8.72  )
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

Hi,

> but cannot see anything relevant to SPI in dmesg, whereas I see [Q]SPI 
> in u-boot output, but there it is listed as:
> [   0.887] SF: Detected XM25QH128A with page size 256 Bytes, erase size 
> 64 KiB, total 16 MiB
> Which is not the same you tested (XM25QU128C).

Please do not trust the flash name printed by vendor UBoot.
XM25QU128C is 0x204118, while XM25QH128A is 0x207018.

~ # cat /sys/kernel/debug/spi-nor/spi0.0/params 
name            spi-nor-generic
id              20 41 18 20 41 18
size            16.0 MiB

You can also check the silkscreen of the SPI NOR flash. By
the way, the IO voltages of these two flashes are different.

> How can I know this patch is working properly ?

[    1.116594] 6 fixed-partitions partitions found on MTD device d420c000.spi
[    1.116609] Creating 6 MTD partitions on "d420c000.spi":
[    1.116615] 0x000000000000-0x000000010000 : "bootinfo"
[    1.119280] 0x000000010000-0x000000020000 : "private"
[    1.120718] 0x000000020000-0x000000060000 : "fsbl"
[    1.122064] 0x000000060000-0x000000070000 : "env"
[    1.126373] 0x000000070000-0x0000000a0000 : "opensbi"
[    1.127679] 0x0000000a0000-0x000000800000 : "uboot"

These partitions can be tested using the mtd command.
Or simply view the contents of these partitions:
~ # hexdump -C /dev/mtd0

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
