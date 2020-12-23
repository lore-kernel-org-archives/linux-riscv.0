Return-Path: <SRS0=SHZ6=F3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA1DC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 20:22:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2159322482
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 20:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2159322482
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z2G/gAY2Gm6w0q6IummMmMz5A0KlWGE8b7tgSf7gjVQ=; b=kVm1njWElwarms2m5JPfZQR4VR
	Lwl7aHaiiIT7e1rUoT8MQ6WiY9tdeeUK41I19UTZu7rx906BIFqM6JGruKn0tUKtWVW1Au5VmXS3z
	bBalDQ5aFpcRAlDQoKfL7wr+6lAUELs5z4oGWaov09Gab0GqSyV9I66plGFFoPi/KlFA19NLQO52I
	gNL/HKPQWO9ZdEsT1IvEquYjdfJK+kJI+rSiDyGilArZSbgOE0atlGZs7sWe1WxCECwNE/pbyE6d1
	bXHOwThRvBTsDU+Sv1gQ1N7qVPZ74o1RS8ZSBmsToGIzNg1fvyiJAfAmffl3fguGdZ3IH/Ya7kuQH
	hjFXYDmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksAeO-0006EP-Hv; Wed, 23 Dec 2020 20:22:24 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksAeL-0006Ds-9C
 for linux-riscv@lists.infradead.org; Wed, 23 Dec 2020 20:22:23 +0000
X-Originating-IP: 109.210.251.148
Received: from [192.168.1.15]
 (amontpellier-552-1-196-148.w109-210.abo.wanadoo.fr [109.210.251.148])
 (Authenticated sender: michael.opdenacker@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 7A1171BF206
 for <linux-riscv@lists.infradead.org>; Wed, 23 Dec 2020 20:22:16 +0000 (UTC)
To: linux-riscv@lists.infradead.org
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: No device tree source for the QEMU Risc-V virt board?
Organization: Bootlin
Message-ID: <787d35c6-8933-ae5e-2e3a-a3de8c6f27ee@bootlin.com>
Date: Wed, 23 Dec 2020 21:22:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_152221_435587_77809EC7 
X-CRM114-Status: GOOD (  16.34  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Greetings,

I struggled to get Linux to boot from U-Boot on the QEMU Risc-V virt
board. I know that I can boot Linux directly, and this is well
documented, but booting U-Boot first and then Linux was much harder and
not really documented (at least according to what I found).

I believe that booting Linux from U-Boot is better in terms of
demonstrating a more realistic Risc-V system, that's why I wanted to do
this.

One of the issues that I got was that U-Boot didn't want to boot the
kernel binary without a DTB. However, I didn't find any corresponding DT
sources in the Linux sources. To get a working DTB, I had to boot Linux
directly, and then get the "/sys/firmware/fdt" file contents! Would you
have any other way to suggest to make me prouder?

For people interested in doing the same thing, here are my raw notes...

Thanks in advance for your insights about the QEMU virt board DTB. I'm
probably missing something.

Cheers,

Michael.

---

QEMU Risc-V instructions
For booting Linux from U-Boot in QEMU's virt machine


Linux (5.10.0)
export ARCH=riscv
make defconfig
make -j8 Image

Create a disk image with 2 partitions, to mimic a real-life case:
- A fat32 one (for the kernel and DTB)
- An ext2 or ext4 one (for the root fs)

To boot this kernel from QEMU, I need to compile opensbi for Linux
cd opensbi
make PLATFORM=generic FW_PAYLOAD_PATH=../linux/arch/arm/boot/Image

Boot ing Linux directly:
qemu-system-riscv64 -M virt -m 2G -nographic -kernel
opensbi/build/platform/generic/firmware/fw_payload.elf -device
virtio-blk-device,drive=hd0 -drive file=disk.img,format=raw,id=hd0
-append "console=ttyS0 rw root=/dev/vda2 earlycon=sbi"

From the booted system, copy /sys/firmware/fdt to the first partition of
the virtio drive, naming the file "dtb". Why don't we get one from the
Linux kernel sources?

Now, we can prepare U-Boot for booting Linux. Without a dtb, U-Boot
refused to start the Linux kernel.

U-Boot (c15f44acf9d473f4682bfdc63b8aebd313492b15, 2021.04-rc4)

cd u-boot
make qemu-riscv64_smode_defconfig

Modify the configuration to support loading an environment from a FAT
partition on a virtio disk. That's closer to real life:
CONFIG_ENV_IS_IN_FAT=y
CONFIG_ENV_FAT_INTERFACE="virtio"
CONFIG_ENV_FAT_DEVICE_AND_PART="0:1"
make -j 8

Now, let's compile opensbi again:
cd opensbi
make clean
make PLATFORM=generic FW_PAYLOAD_PATH=../u-boot/u-boot.bin

We can now boot U-Boot:
qemu-system-riscv64 -M virt -m 2G -nographic -bios
opensbi/build/platform/generic/firmware/fw_payload.elf -device
virtio-blk-device,drive=hd0 -drive file=disk.img,format=raw,id=hd0

The first time, interrupt the U-Boot countdown and set environment
variables:
setenv bootcmd 'fatload virtio 0:1 80200000 Image; fatload virtio 0:1
0x82000000 dtb; booti 0x80200000 - 0x82000000'
setenv bootargs 'root=/dev/vda2 rootwait console=ttyS0
earlycon=sbiroot=/dev/vda2 rootwait console=ttyS0 earlycon=sbi'
saveenv

You can now restart QEMU and Linux boots!

-- 
Michael Opdenacker, CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
