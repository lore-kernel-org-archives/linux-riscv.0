Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78034C43143
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 18:43:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 248042082A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 18:43:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YXzkkO4P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="GHEIZkl1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 248042082A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:Subject:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q82C3iew7C7/JKCCI0xFTKJ5UUYf/52Hz7QEyrez9/s=; b=YXzkkO4PiZShn6Acy5hCmuRTdZ
	pCRxytgnFA9Jbs6+xyZal63+JU4lVBZdgaHrdecRMWncyEzW5w8a5y0fFnrcTI5261W3RzMP+u2lf
	+1Fr4hGgasTsg58omj0pCvMoI8afNb+oD2RpsFIP9E7vS9NAKCJ+9RVyxd2rrfYws0a5sz2P/g4Oz
	JY94N9vWWs6BDZvAcY9EY61T0g6pVzSpqx+S6iOPk7EHsyXUf/9KcDQ/i4PIJNtPALn3Y7/tb8fwQ
	DEfRdbBB5z03qJszurZ5Kn7dZT5KT2lNQ+6rGQCkEB5nof4pRfH1EyTQvJt8lZXw63hKkDP59rCdb
	97i3mEmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7Pdc-0001bt-Mx; Tue, 02 Oct 2018 18:43:16 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7PdZ-0001bG-M1
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 18:43:15 +0000
Received: by mail-pl1-x629.google.com with SMTP id s4-v6so2171829plp.0
 for <linux-riscv@lists.infradead.org>; Tue, 02 Oct 2018 11:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=urn7wTEzgqdDWdmh2OtZ1EwalYAZW9lcwkGZRpvyRPk=;
 b=GHEIZkl1pj8ouInkTlK9eMPScmFwagejGsRBFW2jR6aAW0rHuIL6w615e9moHAFjuu
 mHtuHXu1Cco2KC7s1Fky8Rmb1wNDiv4UQ6wMwWICxDrqhErcSXxUPomMy+tdWV5PsT4c
 hsRBSolurCOfyqwlmScZJd9ijNIGv9bjts4l0A8Ysh1DHin7muqQZMdWKbBq+zemfOF4
 UF5qQH7xhUlPKN9GHtEVs5AN2Y6gZtiL1lVqxCS7blQmxELvk/Xy+ZOyYxyQTME5mKDr
 LDB5YnFHKwx2HwzdC9/P0rzPZoizk+IkBcDY7Iw6ApHqJp+wOfMtSwnv0J6VOoVfttmt
 Yr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=urn7wTEzgqdDWdmh2OtZ1EwalYAZW9lcwkGZRpvyRPk=;
 b=uaeXGNk0Dcn9vtbynn92zf2omyWe3B1vbxXYMS5BXYYRiNz0TRhSOnESrZGoiL6gfX
 8ozbspt+NNUXxsQVwaoMvhmCf9S+VEu7CdKnRm6VFQYiZ0GX667qwwGI5nArb3s3VeOG
 bb2Z9AuZSgxPEDsDN9N1F8++kk2ROVs1B7V+XfFVyYKs/2knAEaaqwa1yvph5imQA9St
 +7auktalHbRHTN/2v3jhSFIRcEAQsmICRYAuYfySjyNWfRfMlBLgjQeOHZCs5ZFUc0lI
 hl9Sd4zfkMOIf2FlHCAUmXJbH1+P36LPf2YBq8InVgnEhEhhKf0u+wJgJ2TCh+mR8vX/
 BuNg==
X-Gm-Message-State: ABuFfoi0bwnsr2OIaGNJU5cHcmEShHC4PiDyJWYRBxMUJNS3caNvKNfH
 aFMyAEsQT6LAuHWC/mVdQ4xu8w==
X-Google-Smtp-Source: ACcGV60hdwyFCrwaUj29obsiN/ZeK4K3shHBgnGygqS8rGCNG84/sl1pfa/MLfA2uF+m2peJxjxAdw==
X-Received: by 2002:a17:902:8c84:: with SMTP id
 t4-v6mr18004795plo.188.1538505781268; 
 Tue, 02 Oct 2018 11:43:01 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id v5-v6sm25038447pfd.64.2018.10.02.11.43.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Oct 2018 11:43:00 -0700 (PDT)
Date: Tue, 02 Oct 2018 11:43:00 -0700 (PDT)
X-Google-Original-Date: Tue, 02 Oct 2018 11:42:58 PDT (-0700)
Subject: VirtIO GPU in QEMU
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-e8ffbf9d-9789-4256-b808-6b6bc1a17647@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_114313_749610_6AD6F3A5 
X-CRM114-Status: GOOD (  11.81  )
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
Cc: alistair.francis@wdc.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002184300.2iqjL2qmIMSkniKYTe5V03vIWHTk3oA8m-0H4OBMHWs@z>

Alistair recently (maybe 6 weeks ago) posted some patches to the QEMU mailing 
list to enable support for VirtIO GPU devices on the RISC-V virt machine in 
QEMU.  I've been excited to try these out for a while and finally got around to 
in this morning.  I'm using QEMU master with his patches applied

    * 3db98f2e2f8d - (HEAD -> vga) hw/riscv/virt: Connect a VirtIO net PCIe device (2 hours ago) <Alistair Francis>
    * 2542422da056 - hw/riscv/sifive_u: Connect the Xilinx PCIe (2 hours ago) <Alistair Francis>
    * 8bf2bc25d2ec - riscv: Enable VGA and PCIE_VGA (2 hours ago) <Alistair Francis>
    * 7e872529c291 - hw/riscv/virt: Connect the gpex PCIe (2 hours ago) <Alistair Francis>
    * ac38103d897b - hw/riscv/virt: Increase the number of interrupts (2 hours ago) <Alistair Francis>
    *   3892f1f1a963 - (origin/master, origin/HEAD, master) Merge remote-tracking branch 'remotes/dgibson/tags/libfdt-20181002' into staging (10 hours ago) <Peter Maydell>
    |\
    | * 0b001b3094bc - Update dtc/libfdt submodule to v1.4.7 (15 hours ago) <David Gibson>
    * |   8f09da690f84 - Merge remote-tracking branch 'remotes/xtensa/tags/20181001-xtensa' into staging (11 hours ago) <Peter Maydell>

and on the kernel side I'm using 4.19-rc5.  After twiddling some QEMU 
command-line options, I've ended up with

    ./riscv64-softmmu/qemu-system-riscv64 -machine virt -smp 2 -m 2G -kernel /home/palmer/work/riscv/riscv-pk/build/bbl -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-device,rng=rng0 -append "console=ttyS0 ro root=/dev/vda" -device virtio-blk-device,drive=hd0 -drive file=stage4-disk.img,format=raw,id=hd0 -device virtio-net-device,netdev=usernet -netdev user,id=usernet,hostfwd=tcp::10000-:22 -device virtio-gpu

and the following diff from 4.19-rc5's kernel defconfig (which appears to be 
mostly noise)

    $ diff -u defconfig arch/riscv/configs/defconfig 
    --- defconfig	2018-10-02 11:39:47.831328320 -0700
    +++ arch/riscv/configs/defconfig	2018-09-28 16:29:21.682511931 -0700
    @@ -1,3 +1,6 @@
    +CONFIG_SMP=y
    +CONFIG_PCI=y
    +CONFIG_PCIE_XILINX=y
     CONFIG_SYSVIPC=y
     CONFIG_POSIX_MQUEUE=y
     CONFIG_IKCONFIG=y
    @@ -8,17 +11,10 @@
     CONFIG_CGROUP_BPF=y
     CONFIG_NAMESPACES=y
     CONFIG_USER_NS=y
    -CONFIG_CHECKPOINT_RESTORE=y
     CONFIG_BLK_DEV_INITRD=y
     CONFIG_EXPERT=y
    +CONFIG_CHECKPOINT_RESTORE=y
     CONFIG_BPF_SYSCALL=y
    -CONFIG_SMP=y
    -CONFIG_PCI=y
    -CONFIG_PCIEPORTBUS=y
    -CONFIG_PCI_HOST_GENERIC=y
    -CONFIG_PCIE_XILINX=y
    -CONFIG_MODULES=y
    -CONFIG_MODULE_UNLOAD=y
     CONFIG_NET=y
     CONFIG_PACKET=y
     CONFIG_UNIX=y
    @@ -52,8 +48,6 @@
     # CONFIG_PTP_1588_CLOCK is not set
     CONFIG_DRM=y
     CONFIG_DRM_RADEON=y
    -CONFIG_DRM_VGEM=y
    -CONFIG_DRM_VIRTIO_GPU=y
     CONFIG_FRAMEBUFFER_CONSOLE=y
     CONFIG_USB=y
     CONFIG_USB_XHCI_HCD=y
    @@ -64,11 +58,8 @@
     CONFIG_USB_OHCI_HCD_PLATFORM=y
     CONFIG_USB_STORAGE=y
     CONFIG_USB_UAS=y
    -CONFIG_VIRTIO_PCI=y
    -CONFIG_VIRTIO_BALLOON=y
    -CONFIG_VIRTIO_INPUT=y
     CONFIG_VIRTIO_MMIO=y
    -CONFIG_SIFIVE_PLIC=y
    +CONFIG_RAS=y
     CONFIG_EXT4_FS=y
     CONFIG_EXT4_FS_POSIX_ACL=y
     CONFIG_AUTOFS4_FS=y
    @@ -81,5 +72,8 @@
     CONFIG_NFS_V4_1=y
     CONFIG_NFS_V4_2=y
     CONFIG_ROOT_NFS=y
    -CONFIG_CRYPTO_USER_API_HASH=y
     # CONFIG_RCU_TRACE is not set
    +CONFIG_CRYPTO_USER_API_HASH=y
    +CONFIG_MODULES=y
    +CONFIG_MODULE_UNLOAD=y
    +CONFIG_SIFIVE_PLIC=y

I can finally get to the point where I see "*ERROR Failed setting up TTM BO 
subsystem", which cascades into an error probing the virtio_gpu device.

I was wondering if anyone else has tried these patches?

Time permitting I'll take a look, but no promises...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
