Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B30FA373D
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 16:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n8SWAFOuAoLoUbNESJuPXxLp89ZOSaxchsV8UtWSDGQ=; b=rp3GLW29dwYZJZ
	XzXkTWD7UzESSJ/+kbuFCadWRMBWkzKWTCR7yqxmgTKmVbSVb5zIY6I/BRIXmIgsensgtxdbjZ2M1
	TQboCN5i1pghRAHAtb1DUPPPBcrnZr20rfvcvdv4fTZaJGO/Gbc+pntcp7APK+XUKinR8540TogVm
	q6PPBagxsX/pUJRhkSRrbSBaaN/IMdSXury30EvIZi4Y4btugIrmtSrrH2df5ZZu+wgYkYKgIQu75
	79foyw/9QoPxev65ydnDp1FTKA9s1t2iPISNRpYR5ivF27S0JeIgwiyv0gtaW2ujCGK4a2kLZHxeR
	PXpmhM7ncX10jAlaAj/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oluUS-008qOH-PU; Fri, 21 Oct 2022 16:03:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oluUP-008qKG-Fb
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 16:03:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D655061ED3;
	Fri, 21 Oct 2022 16:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 456DDC433B5;
	Fri, 21 Oct 2022 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666368195;
	bh=0BdqJvq/BQm9IJEw+9LBrBGViUUKrHzJKUXJpEZshk8=;
	h=From:To:Cc:Subject:Date:From;
	b=BwzXzdfQxfvdkqX5xIXYo2tx6Q4C/ygtjiTGy1M5kjHNgxo3qky0Pl/Ii3frMjLmI
	 AE5Uwyss3rzYaFJ9wcA9LFpUFqQZ9ze46zMz9q8Z48T45/ZiENBqUR9yQHYmZHZqM8
	 JWbEKlzlwRZCdW2tGpmAgNyaKll4s0+8W7XL5oLdHAZQmpCSYftENb2utGPe5gWI7W
	 vdMOKwBT7wQ4GEGG0uTjV6mWAP4TMnVeUV3I7KgN/dNx2xEelIf3n+KKSv2yAwpOts
	 BY0Xm6kp8rCN8m5DKdzMwZh+/nDSgoM2Jrf9koU0QOMcZqrOVGYhnUA4SB1btfr97S
	 EEP29pcd4UmhQ==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: daire.mcnamara@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] RISC-V: enable sparsemem by default for defconfig
Date: Fri, 21 Oct 2022 17:00:30 +0100
Message-Id: <20221021160028.4042304-1-conor@kernel.org>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_090317_627088_0B8B99E4 
X-CRM114-Status: GOOD (  11.11  )
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

on an arch level, RISC-V defaults to FLATMEM. On PolarFire SoC, the
memory layout is almost always sparse, with a maximum of 1 GiB at
0x8000_0000 & a possible 16 GiB range at 0x10_0000_0000. The Icicle kit,
for example, has 2 GiB of DDR - so there's a big hole in the memory map
between the two gigs. Prior to v6.1-rc1, boot times from defconfig
builds were pretty bad on Icicle but enabling sparsemem would fix those
issues. As of v6.1-rc1, the Icicle kit no longer boots from defconfig
builds with the in-kernel devicetree. A change to the memory map
resulted in a futher "sparse-ification", producing a splat on boot:

	OF: fdt: Ignoring memory range 0x80000000 - 0x80200000
	Machine model: Microchip PolarFire-SoC Icicle Kit
	earlycon: ns16550a0 at MMIO32 0x0000000020100000 (options '115200n8')
	printk: bootconsole [ns16550a0] enabled
	printk: debug: skip boot console de-registration.
	efi: UEFI not found.
	Zone ranges:
	  DMA32    [mem 0x0000000080200000-0x00000000ffffffff]
	  Normal   [mem 0x0000000100000000-0x000000107fffffff]
	Movable zone start for each node
	Early memory node ranges
	  node   0: [mem 0x0000000080200000-0x00000000bfbfffff]
	  node   0: [mem 0x00000000bfc00000-0x00000000bfffffff]
	  node   0: [mem 0x0000001040000000-0x000000107fffffff]
	Initmem setup node 0 [mem 0x0000000080200000-0x000000107fffffff]
	Kernel panic - not syncing: Failed to allocate 1073741824 bytes for node 0 memory map
	CPU: 0 PID: 0 Comm: swapper Not tainted 5.19.0-dirty #1
	Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
	Call Trace:
	[<ffffffff800057f0>] show_stack+0x30/0x3c
	[<ffffffff807d5802>] dump_stack_lvl+0x4a/0x66
	[<ffffffff807d5836>] dump_stack+0x18/0x20
	[<ffffffff807d1ae8>] panic+0x124/0x2c6
	[<ffffffff80814064>] free_area_init_core+0x0/0x11e
	[<ffffffff80813720>] free_area_init_node+0xc2/0xf6
	[<ffffffff8081331e>] free_area_init+0x222/0x260
	[<ffffffff808064d6>] misc_mem_init+0x62/0x9a
	[<ffffffff80803cb2>] setup_arch+0xb0/0xea
	[<ffffffff8080039a>] start_kernel+0x88/0x4ee
	---[ end Kernel panic - not syncing: Failed to allocate 1073741824 bytes for node 0 memory map ]---

With the aim of keeping defconfig builds booting on icicle, enable
SPARSEMEM_MANUAL.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

I had it in my head that keeping defconfig booting on ~all~ as many
platforms as possible was a goal, I think from one of the Kconfig.socs
conversations. Hence this patch..

 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 05fd5fcf24f9..daba5d743862 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -38,6 +38,7 @@ CONFIG_KVM=m
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
+CONFIG_SPARSEMEM_MANUAL=y
 CONFIG_BLK_DEV_THROTTLING=y
 CONFIG_NET=y
 CONFIG_PACKET=y
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
