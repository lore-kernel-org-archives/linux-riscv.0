Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23006C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 22:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=npEtPMnb6fuexOMH0C45Dyb+7RCBxNKv3VxCtFh0aRw=; b=G/SU+dVhO0k9CI
	VA9wWRgde08d2Wc6l+ttmLLbzBCJdjOqv7TQ5KxQU1zJQKBhUnrjg8RPESHvhi76TQoR0qMubdcJH
	Zi21cDZoRjhQ9GmOEIUxfutMrKHTE4q4nVVXcHoW4wQBSnITMp7oFaZa8M4y4QKI3E7Up4UmSwc6R
	Mk+DoqG4SmOzSnYO+UzkM5JNiIk9jDzbt1TAPr2XOl/Lz2VsldyG4FJ+U6K0hoPu3h5k2356Sbcmq
	TBhHyQ88oHticXco8XP9pWVHlv9XCOI6i5IjOtbHU5oKl0+S2h0a97ZU070J4wKSGYkO0NJbKZJzZ
	23LVOWQsF8dWh+hn1dLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW2AZ-002fwU-27;
	Tue, 15 Aug 2023 22:05:43 +0000
Received: from mail.loongson.cn ([114.242.206.163])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW2AU-002fsd-0d
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 22:05:41 +0000
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8CxNvGp9ttkfeUYAA--.51256S3;
	Wed, 16 Aug 2023 06:05:29 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxJ82n9ttk23JbAA--.26360S2;
	Wed, 16 Aug 2023 06:05:27 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v4] PCI/VGA: Make the vga_is_firmware_default() less arch-dependent
Date: Wed, 16 Aug 2023 06:05:27 +0800
Message-Id: <20230815220527.1316537-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: AQAAf8DxJ82n9ttk23JbAA--.26360S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9fXoW3uw4DCw13Xw15Jw4fKw4ftFc_yoW8XFW8Wo
	WDGrsrZrW8Gr4Uuw4rA342qF47Xay3KFsakF1UCw4DGFs7Aw4UGr4av3WxX39xZF10y34U
	Zw12kFn8Ww1Dtrn3l-sFpf9Il3svdjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUU5R7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r1j6r4UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJUUUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_150538_566675_5950F80B 
X-CRM114-Status: GOOD (  17.62  )
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

Currently, the vga_is_firmware_default() function only works on x86 and
ia64, it is a no-op on ARM, ARM64, PPC, RISC-V, etc. This patch completes
the implementation for the rest of the architectures. The added code tries
to identify the PCI(e) VGA device that owns the firmware framebuffer
before PCI resource reallocation happens.

This patch makes the vga_is_firmware_default() function works on whatever
arch that has UEFI GOP support. But we make it available only on platforms
where PCI resource relocation happens. if the provided method proves to be
effective and reliable, it can be expanded to other arch easily.

v2:
	* Fix test robot warnnings and fix typos

v3:
	* Fix linkage problems if the global screen_info is not exported

v4:
	* Handle linkage problems by hiding behind of CONFIG_SYSFB,
	* Drop side-effects and simplify.

Since only one GPU could owns the firmware fb in normal case, things
are almost done once we determine the boot VGA selected by firmware.
By using the DECLARE_PCI_FIXUP_CLASS_HEADER(), we also ensure that we
could identify the primary display (if there do have one) before PCI
resource reallocation happen.

The method provided in this patch will be effective as long as the target
platform has a way set up the kernel's screen_info. For the machines with
UEFI firmware, the screen_info is typically set up by the UEFI stub with
respect to the UEFI GOP protocol. Since the UEFI stub executes in the
context of the decompressor, and it cannot access the kernel's screen_info
directly. Hence, the efi stub copies the screen_info provided by firmware
to kernel's counterpart. Therefore, we handle linkage problems by using
the CONFIG_EFI guard. Since when CONFIG_EFI is set, the kernel's
screen_info is guaranteed to be static linkable for arm, arm64, riscv.
V4 of this patch handle linkage problems by hiding behind of CONFIG_SYSFB,
since sysfb reference the global screen_info as well.

This patch is tested on:

1) LS3A5000+LS7A1000 platform with three video cards

$ lspci | grep VGA

 00:06.1 VGA compatible controller: Loongson Technology LLC DC (Display Controller) (rev 01)
 03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Caicos XT [Radeon HD 7470/8470 / R5 235/310 OEM]
 07:00.0 VGA compatible controller: S3 Graphics Ltd. Device 9070 (rev 01)
 08:00.0 VGA compatible controller: S3 Graphics Ltd. Device 9070 (rev 01)

Before apply this patch:

[    0.361748] pci 0000:00:06.1: vgaarb: setting as boot VGA device
[    0.361751] pci 0000:00:06.1: vgaarb: bridge control possible
[    0.361753] pci 0000:00:06.1: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.361763] pci 0000:03:00.0: vgaarb: bridge control possible
[    0.361765] pci 0000:03:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    0.361771] pci 0000:07:00.0: vgaarb: bridge control possible
[    0.361773] pci 0000:07:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    0.361777] pci 0000:08:00.0: vgaarb: bridge control possible
[    0.361779] pci 0000:08:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    0.361781] vgaarb: loaded
[    0.367838] pci 0000:00:06.1: Overriding boot device as 1002:6778
[    0.367841] pci 0000:00:06.1: Overriding boot device as 5333:9070
[    0.367843] pci 0000:00:06.1: Overriding boot device as 5333:9070

After apply this patch:

[    0.357780] pci 0000:03:00.0: vgaarb: BAR 0 contains firmware FB
[    0.361726] pci 0000:00:06.1: vgaarb: setting as boot VGA device
[    0.361729] pci 0000:00:06.1: vgaarb: bridge control possible
[    0.361731] pci 0000:00:06.1: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.361741] pci 0000:03:00.0: vgaarb: setting as boot VGA device (overriding previous)
[    0.361743] pci 0000:03:00.0: vgaarb: bridge control possible
[    0.361745] pci 0000:03:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    0.361751] pci 0000:07:00.0: vgaarb: bridge control possible
[    0.361753] pci 0000:07:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    0.361757] pci 0000:08:00.0: vgaarb: bridge control possible
[    0.361759] pci 0000:08:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    0.361761] vgaarb: loaded
[   14.730255] radeon 0000:03:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=none

Please note that before apply this patch, vgaarb can not select the right
boot vga due to weird logic introduced with the commit 57fc7323a8e7c ("LoongArch: Add PCI controller support")

Please also note that VARM Bar do moves on LoongArch:

$ dmesg | grep 0000:03:00.0

[    0.357688] pci 0000:03:00.0: [1002:6778] type 00 class 0x030000
[    0.357713] pci 0000:03:00.0: reg 0x10: [mem 0xe0050000000-0xe005fffffff 64bit pref]
[    0.357730] pci 0000:03:00.0: reg 0x18: [mem 0xe0065300000-0xe006531ffff 64bit]
[    0.357741] pci 0000:03:00.0: reg 0x20: [io  0x20000-0x200ff]
[    0.357762] pci 0000:03:00.0: reg 0x30: [mem 0xfffe0000-0xffffffff pref]
[    0.357780] pci 0000:03:00.0: vgaarb: BAR0 contains firmware FB

[    0.359809] pci 0000:03:00.0: BAR 0: assigned [mem 0xe0030000000-0xe003fffffff 64bit pref]
[    0.359821] pci 0000:03:00.0: BAR 2: assigned [mem 0xe0065200000-0xe006521ffff 64bit]
[    0.359832] pci 0000:03:00.0: BAR 6: assigned [mem 0xe0065220000-0xe006523ffff pref]
[    0.359846] pci 0000:03:00.0: BAR 4: assigned [io  0x5000-0x50ff]
[    0.361741] pci 0000:03:00.0: vgaarb: setting as boot VGA device (overriding previous)
[    0.361743] pci 0000:03:00.0: vgaarb: bridge control possible
[    0.361745] pci 0000:03:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none

2) LS3A5000+LS7A2000 platform with four video cards

$ lspci | grep VGA

00:06.1 VGA compatible controller: Loongson Technology LLC Device 7a36 (rev 02)
01:00.0 VGA compatible controller: Silicon Motion, Inc. Device 0768 (rev 03)
04:00.0 VGA compatible controller: Device 0709:0001 (rev 01)
05:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Lexa PRO [Radeon 540/540X/550/550X / RX 540X/550/550X] (rev c7)

Before apply this patch:

[    0.359345] pci 0000:00:06.1: vgaarb: setting as boot VGA device
[    0.359347] pci 0000:00:06.1: vgaarb: bridge control possible
[    0.359349] pci 0000:00:06.1: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.359358] pci 0000:01:00.0: vgaarb: bridge control possible
[    0.359360] pci 0000:01:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    0.359364] pci 0000:04:00.0: vgaarb: bridge control possible
[    0.359366] pci 0000:04:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    0.359369] pci 0000:05:00.0: vgaarb: bridge control possible
[    0.359370] pci 0000:05:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    0.359373] vgaarb: loaded
[    0.365852] pci 0000:00:06.1: Overriding boot device as 126F:768
[    0.365855] pci 0000:00:06.1: Overriding boot device as 709:1
[    0.365857] pci 0000:00:06.1: Overriding boot device as 1002:699F
[   14.011380] amdgpu 0000:05:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=none

After apply this patch:

[    0.357142] pci 0000:05:00.0: vgaarb: BAR 0 contains firmware FB
[    0.359291] pci 0000:00:06.1: vgaarb: setting as boot VGA device
[    0.359294] pci 0000:00:06.1: vgaarb: bridge control possible
[    0.359296] pci 0000:00:06.1: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.359305] pci 0000:01:00.0: vgaarb: bridge control possible
[    0.359307] pci 0000:01:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    0.359311] pci 0000:04:00.0: vgaarb: bridge control possible
[    0.359312] pci 0000:04:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    0.359316] pci 0000:05:00.0: vgaarb: setting as boot VGA device (overriding previous)
[    0.359318] pci 0000:05:00.0: vgaarb: bridge control possible
[    0.359319] pci 0000:05:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    0.359321] vgaarb: loaded
[   14.399907] amdgpu 0000:05:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=none

Again, the VRAM Bar do moves:

$ dmesg | grep 0000:05:00.0

[    0.357076] pci 0000:05:00.0: [1002:699f] type 00 class 0x030000
[    0.357093] pci 0000:05:00.0: reg 0x10: [mem 0xe0030000000-0xe003fffffff 64bit pref]
[    0.357104] pci 0000:05:00.0: reg 0x18: [mem 0xe0040000000-0xe00401fffff 64bit pref]
[    0.357112] pci 0000:05:00.0: reg 0x20: [io  0x40000-0x400ff]
[    0.357120] pci 0000:05:00.0: reg 0x24: [mem 0xe0074300000-0xe007433ffff]
[    0.357128] pci 0000:05:00.0: reg 0x30: [mem 0xfffe0000-0xffffffff pref]
[    0.357142] pci 0000:05:00.0: vgaarb: BAR0 contains firmware FB
[    0.357720] pci 0000:05:00.0: BAR 0: assigned [mem 0xe0060000000-0xe006fffffff 64bit pref]
[    0.357728] pci 0000:05:00.0: BAR 2: assigned [mem 0xe0058000000-0xe00581fffff 64bit pref]
[    0.357736] pci 0000:05:00.0: BAR 5: assigned [mem 0xe0072b00000-0xe0072b3ffff]
[    0.357740] pci 0000:05:00.0: BAR 6: assigned [mem 0xe0072b40000-0xe0072b5ffff pref]
[    0.357750] pci 0000:05:00.0: BAR 4: assigned [io  0x5000-0x50ff]
[    0.359316] pci 0000:05:00.0: vgaarb: setting as boot VGA device (overriding previous)
[    0.359318] pci 0000:05:00.0: vgaarb: bridge control possible
[    0.359319] pci 0000:05:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none

3) Mips (LS3A4000/LS7A1000 + SM750 + Radeon)

Loongson Mips have no UEFI GOP support, we test this patch by modifying the
screen_info manually.

$ lspci | grep VGA

 04:00.0 VGA compatible controller: Silicon Motion, Inc. SM750 (rev a1)
 05:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Oland [Radeon HD 8570 / R7 240/340 OEM] (rev 87)

$ dmesg | grep 04:00.0

 pci 0000:04:00.0: [126f:0750] type 00 class 0x030000
 pci 0000:04:00.0: reg 0x10: [mem 0x58000000-0x5bffffff pref]
 pci 0000:04:00.0: reg 0x14: [mem 0x5f000000-0x5f1fffff]
 pci 0000:04:00.0: reg 0x30: [mem 0xffff0000-0xffffffff pref]
 pci 0000:04:00.0: BAR 0: assigned [mem 0x50000000-0x53ffffff pref]
 pci 0000:04:00.0: BAR 1: assigned [mem 0x54000000-0x541fffff]
 pci 0000:04:00.0: BAR 6: assigned [mem 0x54200000-0x5420ffff pref]

$ dmesg | grep 05:00.0

 pci 0000:05:00.0: [1002:6611] type 00 class 0x030000
 pci 0000:05:00.0: reg 0x10: [mem 0x40000000-0x4fffffff 64bit pref]
 pci 0000:05:00.0: reg 0x18: [mem 0x5f300000-0x5f33ffff 64bit]
 pci 0000:05:00.0: reg 0x20: [io  0x40000-0x400ff]
 pci 0000:05:00.0: reg 0x30: [mem 0xfffe0000-0xffffffff pref]
 pci 0000:05:00.0: BAR 0: assigned [mem 0x40000000-0x4fffffff 64bit pref]
 pci 0000:05:00.0: BAR 2: assigned [mem 0x5b300000-0x5b33ffff 64bit]
 pci 0000:05:00.0: BAR 6: assigned [mem 0x5b340000-0x5b35ffff pref]
 pci 0000:05:00.0: BAR 4: assigned [io  0x21000-0x210ff]

Specify the firmware fb at BAR 0 of SM750 by hardcode:

screen_info = (struct screen_info) {
    .orig_video_isVGA = VIDEO_TYPE_EFI,
    .lfb_base = 0x58000000,
    .lfb_size = 1280 * 800 * 4 * 2,
};

$ dmesg | grep vgaarb

 vgaarb: loaded
 pci 0000:04:00.0: vgaarb: BAR 0 contains firmware FB
 pci 0000:04:00.0: vgaarb: setting as boot VGA device
 pci 0000:04:00.0: vgaarb: bridge control possible
 pci 0000:04:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
 pci 0000:05:00.0: vgaarb: bridge control possible
 pci 0000:05:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none

Specify the firmware fb at BAR 0 of ATI GPU by hardcode:

screen_info = (struct screen_info) {
    .orig_video_isVGA = VIDEO_TYPE_EFI,
    .lfb_base = 0x40000000,
    .lfb_size = 1280 * 800 * 4 * 2,
};

$ dmesg | grep vgaarb

 vgaarb: loaded
 pci 0000:04:00.0: vgaarb: setting as boot VGA device
 pci 0000:04:00.0: vgaarb: bridge control possible
 pci 0000:04:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
 pci 0000:05:00.0: vgaarb: BAR 0 contains firmware FB
 pci 0000:05:00.0: vgaarb: setting as boot VGA device (overriding previous)
 pci 0000:05:00.0: vgaarb: bridge control possible
 pci 0000:05:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
 radeon 0000:05:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=io+mem

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/vgaarb.c | 76 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 5a696078b382..7b6c3a772e91 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -60,7 +60,8 @@ static int vga_count, vga_decode_count;
 static bool vga_arbiter_used;
 static DEFINE_SPINLOCK(vga_lock);
 static DECLARE_WAIT_QUEUE_HEAD(vga_wait_queue);
-
+/* The PCI(e) device who owns the firmware framebuffer */
+static struct pci_dev *pdev_boot_vga;
 
 static const char *vga_iostate_to_str(unsigned int iostate)
 {
@@ -571,6 +572,9 @@ static bool vga_is_firmware_default(struct pci_dev *pdev)
 
 		return true;
 	}
+#else
+	if (pdev_boot_vga && pdev_boot_vga == pdev)
+		return true;
 #endif
 	return false;
 }
@@ -1555,3 +1559,73 @@ static int __init vga_arb_device_init(void)
 	return rc;
 }
 subsys_initcall_sync(vga_arb_device_init);
+
+/*
+ * Get the physical address range that the firmware framebuffer occupies.
+ *
+ * The global screen_info is arch-specific, CONFIG_SYSFB is chosen as
+ * compile-time conditional to suppress linkage problems.
+ */
+static bool vga_arb_get_firmware_fb_range(resource_size_t *start,
+					  resource_size_t *end)
+{
+	resource_size_t fb_start = 0;
+	resource_size_t fb_size = 0;
+	resource_size_t fb_end;
+
+#if defined(CONFIG_X86) || defined(CONFIG_IA64) || defined(CONFIG_SYSFB)
+	fb_start = screen_info.lfb_base;
+	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
+		fb_start |= (u64)screen_info.ext_lfb_base << 32;
+
+	fb_size = screen_info.lfb_size;
+#endif
+
+	/* No firmware framebuffer support */
+	if (!fb_start || !fb_size)
+		return false;
+
+	fb_end = fb_start + fb_size - 1;
+
+	*start = fb_start;
+	*end = fb_end;
+
+	return true;
+}
+
+/*
+ * Identify the PCI VGA device that contains the firmware framebuffer
+ */
+static void pci_boot_vga_finder(struct pci_dev *pdev)
+{
+	resource_size_t fb_start;
+	resource_size_t fb_end;
+	unsigned int i;
+
+	/* Already found the pdev which has firmware framebuffer ownership */
+	if (pdev_boot_vga)
+		return;
+
+	if (!vga_arb_get_firmware_fb_range(&fb_start, &fb_end))
+		return;
+
+	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
+		struct resource *res = &pdev->resource[i];
+
+		if (resource_type(res) != IORESOURCE_MEM)
+			continue;
+
+		if (!res->start || !res->end)
+			continue;
+
+		if (res->start <= fb_start && fb_end <= res->end) {
+			pdev_boot_vga = pdev;
+
+			vgaarb_info(&pdev->dev,
+				    "BAR %d contains firmware FB\n", i);
+			break;
+		}
+	}
+}
+DECLARE_PCI_FIXUP_CLASS_HEADER(PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_DISPLAY_VGA,
+			       8, pci_boot_vga_finder);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
