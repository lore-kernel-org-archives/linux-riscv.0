Return-Path: <SRS0=K/tH=SZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5A1C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2019 00:17:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 097B920811
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2019 00:17:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZjbVr/So";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="aDuHijj5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 097B920811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/MyARAA4nfPMnqKmgp1Elu6w2GCWv7DWdXXZb2SAb50=; b=ZjbVr/So4lkCL8
	gdXumSMNg3WZN+WAQRwC+Gltao6s+ul95NCaqWnvQjj3N1rnzAutemevR9TqelIf3udgpPoATJ84/
	QMAdX72Y2qLrGQrNa6h6oCxJ/kBzvrYc4vAeNnXnPEsZgqGdfW0WvPudghNWFoXJVdJ3lZAYb+ryW
	xZmGKB/d4YEPqOHeV9Aynxn4nmXef/A5GFtX0gQmoFQiBjG6xtI6gOBbQkOvrFFrt486CgdqKdIYX
	QaMyakILoYf11Vj2f4Z8u9Zi8b5+S+HXfe4ewob/poeBYzjweVFCtsDumgZIijMzJKskTqk9lZdZb
	MmFcjo88hgrFHbKUESWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIj8B-0008LZ-Vw; Tue, 23 Apr 2019 00:17:51 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIj88-0008L5-JA
 for linux-riscv@lists.infradead.org; Tue, 23 Apr 2019 00:17:50 +0000
Received: by mail-ot1-x332.google.com with SMTP id o74so11232056ota.3
 for <linux-riscv@lists.infradead.org>; Mon, 22 Apr 2019 17:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:message-id:user-agent:mime-version;
 bh=juMVrKHWe6BA8aLmU2ilY/nSc2lXa6zcTAF7dsxRPQs=;
 b=aDuHijj5KgRVDUQ2ySlFDqHU1xFop6sW1O3BLtOeH7vbKiL/FUVBBlSb+8MiLIU+Tg
 zcploVM30tpjdIKKd3+W6zqAHaUUHjGIPazPnZ59w2L1KaCIc5sBkzAr7s/rfGzE0Ucs
 jmSmMUU8vOLz6mt62DMapWoAZE+zVSZ2+sgwAqsCn/CjC+g4xk3KXUsviNzgLzzwnoTb
 r5HefrvhdkozYSTK/JIvJMRSOyorZldunfSecAZzanT0nDQ/niGkk+S78UzMmss1Gn1G
 TUs9/byPaBzOMopq+ph0yvQXA9iKBMq40ueVCvCD+dTjygnzE8xFeSKLduY3nCS7RzEs
 O60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=juMVrKHWe6BA8aLmU2ilY/nSc2lXa6zcTAF7dsxRPQs=;
 b=WJ1saoAD1zlC4spg66IYK3pSe+EAMOnH3CvIfYCqteyMdqZv2nC3DBhLc4D3Y7v/tU
 GzEYIMra9OZBH3nr7sPRfT0JTdNujGwr+aDta71eJS0llg8aFSm+DISgDH9MI1F3acKT
 /ri4x6UP/Y7qVwBTmrT1sHaZOkwILimurn8L95Xl6S03qF5uxkwKZuDXZ0MDQO+MPMfJ
 uHfXkHb6HpBQp0L15wmgnLZqJnkSvayACHOQn4006yPpXsZiUjeBkRtoSA+OoBcuJF0m
 DeHvC5jNszkfqEzfw+C0pnijALzIxAgtGU4YKK3ACQu26tAHUdnWqFI5C1a7apP12tyM
 g4Mw==
X-Gm-Message-State: APjAAAU8CK94WQp/6NxMFTIMxXxdNilZ3++rfnaGPUOtAFItcdK7Bbpd
 7LgPSUdIs4OwrLRFktRz2y+BV+3/CmU=
X-Google-Smtp-Source: APXvYqwJDH0ahqtxz6b+vjzzuEsFRL9/rFt0U0fWQhjhqUG0gxjx1O1PQjfEQLmmpraiD6wIb4E9aw==
X-Received: by 2002:a05:6830:1559:: with SMTP id
 l25mr13480418otp.355.1555978666763; 
 Mon, 22 Apr 2019 17:17:46 -0700 (PDT)
Received: from localhost (175.sub-174-209-26.myvzw.com. [174.209.26.175])
 by smtp.gmail.com with ESMTPSA id h23sm7189658oic.10.2019.04.22.17.17.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 22 Apr 2019 17:17:45 -0700 (PDT)
Date: Mon, 22 Apr 2019 17:17:43 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Subject: Testing the recent RISC-V DT patchsets
Message-ID: <alpine.DEB.2.21.9999.1904221705170.18377@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_171748_644670_E8BEAD87 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


I've heard from two separate people who have had trouble getting started 
with BBL & open-source FSBL test flows with arbitrary DT files on the 
Freedom Unleashed board.  The following instructions should help get 
people started.

The core issue, aside from general unfamiliarity, is that multiple parts 
of the pre-kernel software stack try to parse and/or modify the kernel DT.
We wish to avoid this as much as possible.

Testing with U-boot and OpenSBI is currently left as an exercise for the 
reader, for a similar reason and because those ports are still quite new.

The following instructions are provided with no warranty whatsoever, and 
assume knowledge of the shell and Linux.  If implemented carelessly, may 
trash your filesystems or do other horrible things.


- Paul


These instructions assume that bare metal and Linux RV64 cross-toolchains 
are installed.  If not, consider using crosstool-ng with the 
"riscv64-unknown-elf" and "riscv64-unknown-linux-gnu" experimental sample 
configurations.  You will need both.

1. Put the location of the temporary build tree into the BASE
   environment variable, and set up some initial directories:
   export BASE=~/riscv-test; mkdir -p ${BASE}/work

2. Partition a microSD card with (at least) two GPT partitions.
   Here is a sample sfdisk dump:

label: gpt
label-id: 074689DB-0440-411C-91DB-440DFE5BA0B6
device: /dev/sda
unit: sectors
first-lba: 34
last-lba: 62333918

/dev/sda1 : start=        2048, size=        2048, type=5B193300-FC78-40CD-8002-E86C45580B47, uuid=DEAD9378-45FF-44FB-B2E3-F3FEA45ADC9E, name="fsbl"
/dev/sda2 : start=        4096, size=       65536, type=2E54B353-1271-4842-806F-E436D6AF6985, uuid=1B48DE68-8004-444D-BA47-AAA8DBEBFA60, name="bbl"
/dev/sda3 : start=       69632, size=    62264287, type=0FC63DAF-8483-4772-8E79-3D69D8477DE4, uuid=D672F1FC-3E45-4CC1-835A-E6384A26C395, name="rootfs"


3. Download the open-source FSBL:
   cd ${BASE}
   git clone https://github.com/sifive/freedom-u540-c000-bootloader

4. Build the open-source FSBL:
   cd freedom-u540-c000-bootloader
   CROSSCOMPILE=/opt/rv64gc-mmu-elf/bin/riscv64-unknown-elf- make

5. Write the open-source FSBL to the first partition of the SD card with
   something like:
   sudo dd if=fsbl.bin of=/dev/SD-CARD-DEVICE1 conv=nocreat

6. Copy an initramfs sysroot into ${BASE}/work/buildroot_initramfs_sysroot.
   A reasonable one to start with is the sysroot built by
   freedom-u-sdk, in work/buildroot_initramfs_sysroot.

7. Set the CROSS_COMPILE environment variable to point to your
   cross-compiler, in the Linux kernel form:
   export CROSS_COMPILE=/opt/rv64gc-mmu-linux-8.2.0/bin/riscv64-unknown-linux-gnu-

8. Put something like this into a script and run it:

if [ ! -d ${BASE} ]; then
    echo Base build directory must be set in the BASE environment variable
fi
if [ ! -x ${CROSS_COMPILE}gcc ]; then
    echo Path to cross-compiler must be set in the CROSS_COMPILE 
environment variable
fi

export ARCH=riscv
export OBJCOPY=${CROSS_COMPILE}objcopy
export CC=${CROSS_COMPILE}gcc

CORES=$(getconf _NPROCESSORS_ONLN)

#
#

cd ${BASE}
git clone -b dev/paulw/reduce-dt-load-v1 
https://github.com/sifive/riscv-pk
git clone -b dev/paulw/dts-v5.1-rc6-experimental 
https://github.com/sifive/riscv-linux

cd riscv-linux
make -j${CORES} defconfig dtbs vmlinux

${CROSS_COMPILE}strip -o ${BASE}/work/vmlinux-stripped 
${BASE}/riscv-linux/vmlinux

rm -rf ${BASE}/work/riscv-pk
mkdir -p ${BASE}/work/riscv-pk
cd ${BASE}/work/riscv-pk
ln -sf 
${BASE}/riscv-linux/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dtb 
${BASE}/riscv-pk/linux.dtb
${BASE}/riscv-pk/configure \
	--host=riscv64-unknown-linux-gnu \
	--enable-print-device-tree --with-payload=../vmlinux-stripped
CFLAGS="-mabi=lp64d -march=rv64imafdc" make

$OBJCOPY -S -O binary --change-addresses -0x80000000 bbl ../bbl.bin


9.  Write ${BASE}/work/bbl.bin to the second partition of your microSD 
    card with something like:
    sudo dd if=${BASE}/work/bbl.bin of=/dev/SD-CARD-DEVICE2 bs=64k conv=nocreat

10. Boot the microSD card on your Unleashed board.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
