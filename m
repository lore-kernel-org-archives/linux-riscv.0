Return-Path: <SRS0=SHZ6=F3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A15C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 23:00:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA1CB22288
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 23:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA1CB22288
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=prGTlM2D19WUjRMUBvOEVmJ4baxFBn4ezdRMSlrBTMY=; b=nuPIVbSYzk2yRGBH+WnAa2neF
	YFAs+AwWfVvQQlDidozrBfGYYCMKnKXpl5cu74HNgfmWz1veE6qIPcBv/6ooxOhzqSoT0bJRUNk6k
	MuGiCktDu0D3Ly4qfxATBdVc3NJRkwvKEMPCGi2QwZe6WTpynUMVYk4vNFRGC7P8tuHXsHeNVXVaq
	80CIrpVUq28nTh7nthGvrFDMyw+lD53lwjvd4TGMKbQ9AjQ1woi+D2Qt4e7Xdt3fbCZLum+A7Z2p3
	Ot7tXQE3AdjmtO6Vcsj/k9foQ0DFS4cbV0m9oI8kEPjOAoo0icAoO4+P1qDFFKGmIEAeIuwXyKmUb
	YArrjvosg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksD76-0001Cw-Vz; Wed, 23 Dec 2020 23:00:13 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksD73-0001CR-HE
 for linux-riscv@lists.infradead.org; Wed, 23 Dec 2020 23:00:10 +0000
Received: by mail-il1-x133.google.com with SMTP id 75so507983ilv.13
 for <linux-riscv@lists.infradead.org>; Wed, 23 Dec 2020 15:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lx/eZ9P0FL5LvmorDTB+Jomdm0qS6pfQwAZVU4fWvVM=;
 b=gOADxH9N1BLmZ3FUMYrClBirW8nADsv5YwFuLHqEJe+z5Bsj9QNkE/tgtJpOXi91f/
 NDA0JuaWcd9ZovUn4YXNg5ZlJZ7Ex85cAKWf7puMnikIz2TAsM0+SN6I+3OkuUwHaJaF
 mIPt+sIrDCm3asVM4gWcHfW0waysJu51GkePA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lx/eZ9P0FL5LvmorDTB+Jomdm0qS6pfQwAZVU4fWvVM=;
 b=TzoknS6Hy1V7Gf8Z/sW9bscHLJEWCb/W61tF0NedGJHXrKbE62JUbjtBg6XqN7+QqZ
 0ZpSWm6Ibb+6mxyYG7OvSgWUXEcvhkhBXJ5wTNgWiagXU2z25bd8ScmUebAy79ptVlK/
 Foy/mnhzV/3ktXPH1XN2qE4rseogrOg4m/OWyYkQOXFyNxyiM8uPaKD5rbTLCQ9Q0uI7
 XIO8ExavWsuqupbj0vFCn7f0ZVZjDCLi1tzYG6g4QfcDhmr02wSEL3jxi1fbW3SZ7uPN
 XLh5ilv0J3X7gpaIFXCGTYJB/yal6qnCvIhDel0ZiImgqS6oX+vA3b+ijnzaoaePKPUk
 Q32A==
X-Gm-Message-State: AOAM531zM57nFy09lS3/y6/Qej9Xt6EQtDUBIpu761Ec2R64JwRyyrXk
 WLUyssXSXnD+Nvm958ZsK8cTCx/3A5wVteP2C1Nb
X-Google-Smtp-Source: ABdhPJyvuWbEjsNRbBPcKs3Tupj0ykpI9nQ3sqDx19ZA7Gr1leC2a/c0ZocKdpugiFPMTKgwh7BFHysmuHq69ainnUs=
X-Received: by 2002:a92:204:: with SMTP id 4mr27362666ilc.79.1608764407024;
 Wed, 23 Dec 2020 15:00:07 -0800 (PST)
MIME-Version: 1.0
References: <787d35c6-8933-ae5e-2e3a-a3de8c6f27ee@bootlin.com>
In-Reply-To: <787d35c6-8933-ae5e-2e3a-a3de8c6f27ee@bootlin.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 23 Dec 2020 14:59:56 -0800
Message-ID: <CAOnJCU+QsxmMakcMJTLc7pQSHbEV3tbQq6sRaacNwda-zqxv6A@mail.gmail.com>
Subject: Re: No device tree source for the QEMU Risc-V virt board?
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_180009_736867_E1A311C3 
X-CRM114-Status: GOOD (  29.94  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 23, 2020 at 12:22 PM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Greetings,
>
> I struggled to get Linux to boot from U-Boot on the QEMU Risc-V virt
> board. I know that I can boot Linux directly, and this is well
> documented, but booting U-Boot first and then Linux was much harder and
> not really documented (at least according to what I found).
>
> I believe that booting Linux from U-Boot is better in terms of
> demonstrating a more realistic Risc-V system, that's why I wanted to do
> this.
>
> One of the issues that I got was that U-Boot didn't want to boot the
> kernel binary without a DTB. However, I didn't find any corresponding DT
> sources in the Linux sources. To get a working DTB, I had to boot Linux
> directly, and then get the "/sys/firmware/fdt" file contents! Would you
> have any other way to suggest to make me prouder?
>

Copy pasting my explanation from sw-dev to avoid redundant replies,

You shouldn't have to do that. The DTB is copied a few times during the boot.
In RISC-V, every boot loader stage passes the memory address of DTB in a1.
Thus, Qemu loader will pass the DTB address in a1 to OpenSBI and
OpenSBI passes that to U-Boot via a1.
Before that, OpenSBI may copy the DTB depending on the firmware type
(fw_jump or fw_dynamic).
U-Boot relocates the DT the $fdtcontroladdr. You can verify the
correct fdt by doing the following at U-Boot prompt.

<AT U-Boot prompt>
#fdt addr $fdtcontroladdr
#fdt print

Depending on how you have configured U-Boot, it may again need to be
copied to fdt_addr_r if that's the address
you are using while using booti/bootm command so that Linux kernel
gets the correct DTB address in a1.

> For people interested in doing the same thing, here are my raw notes...
>
> Thanks in advance for your insights about the QEMU virt board DTB. I'm
> probably missing something.
>
> Cheers,
>
> Michael.
>
> ---
>
> QEMU Risc-V instructions
> For booting Linux from U-Boot in QEMU's virt machine
>
>
> Linux (5.10.0)
> export ARCH=riscv
> make defconfig
> make -j8 Image
>
> Create a disk image with 2 partitions, to mimic a real-life case:
> - A fat32 one (for the kernel and DTB)
> - An ext2 or ext4 one (for the root fs)
>
> To boot this kernel from QEMU, I need to compile opensbi for Linux
> cd opensbi
> make PLATFORM=generic FW_PAYLOAD_PATH=../linux/arch/arm/boot/Image
>
> Boot ing Linux directly:
> qemu-system-riscv64 -M virt -m 2G -nographic -kernel
> opensbi/build/platform/generic/firmware/fw_payload.elf -device
> virtio-blk-device,drive=hd0 -drive file=disk.img,format=raw,id=hd0
> -append "console=ttyS0 rw root=/dev/vda2 earlycon=sbi"
>
> From the booted system, copy /sys/firmware/fdt to the first partition of
> the virtio drive, naming the file "dtb". Why don't we get one from the
> Linux kernel sources?
>
> Now, we can prepare U-Boot for booting Linux. Without a dtb, U-Boot
> refused to start the Linux kernel.
>
> U-Boot (c15f44acf9d473f4682bfdc63b8aebd313492b15, 2021.04-rc4)
>
> cd u-boot
> make qemu-riscv64_smode_defconfig
>
> Modify the configuration to support loading an environment from a FAT
> partition on a virtio disk. That's closer to real life:
> CONFIG_ENV_IS_IN_FAT=y
> CONFIG_ENV_FAT_INTERFACE="virtio"
> CONFIG_ENV_FAT_DEVICE_AND_PART="0:1"
> make -j 8
>
> Now, let's compile opensbi again:
> cd opensbi
> make clean
> make PLATFORM=generic FW_PAYLOAD_PATH=../u-boot/u-boot.bin
>
> We can now boot U-Boot:
> qemu-system-riscv64 -M virt -m 2G -nographic -bios
> opensbi/build/platform/generic/firmware/fw_payload.elf -device
> virtio-blk-device,drive=hd0 -drive file=disk.img,format=raw,id=hd0
>
> The first time, interrupt the U-Boot countdown and set environment
> variables:
> setenv bootcmd 'fatload virtio 0:1 80200000 Image; fatload virtio 0:1
> 0x82000000 dtb; booti 0x80200000 - 0x82000000'
> setenv bootargs 'root=/dev/vda2 rootwait console=ttyS0
> earlycon=sbiroot=/dev/vda2 rootwait console=ttyS0 earlycon=sbi'
> saveenv
>
> You can now restart QEMU and Linux boots!
>
> --
> Michael Opdenacker, CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
