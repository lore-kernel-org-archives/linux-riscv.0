Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C6EC02198
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 09:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPNE1TPRl2XD1v0EyoVRqIdfKNeAHn7QGE2T68yXFe4=; b=ucMlqeNuNH1YoV
	2IGMH2dhD8C5NreTwyXRQTt3R64tQeBX+ZbTXZuamojY9Jeu71AlMr2GsChwSeuMHvBTAMMGq300L
	QtzAn9LNnoJKai4pX5E0GdRRj2jWbW94wa3sFF8U7SiDAYCEtqjpyjX27rOPoffa2kuGpm6d89KM1
	YXLfyYjGYtgjbbc8YSKCDCLBfX6R58VMJLxDp4CppB1aEkLjJsAg9UQftd7LLd8RnYFD6MaINAHVH
	ZNMzgggtePj0iBZbDauLd5gg4VTae53QQyr0quLkqe6v72z4ufY1779svB8W5aIS/3kZ56NGJ4c+m
	8IWUj1kxkqWaDsx8gnew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tircL-0000000EEUN-1rJA;
	Fri, 14 Feb 2025 09:04:13 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirWb-0000000ED2z-2wa1
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 08:58:18 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-2b8e2606a58so970531fac.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2025 00:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739523497; x=1740128297; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QtD1EK2iHm2J01pml3P/unMeIKoZgkx4ph4Uy7XYIUg=;
        b=imTiu3EyBL4b6svJkD46BhYhUfpZbU1TRvBnTD62XMWOHdDCQdnQlyIh+57PMi81jn
         xFCAIst20wrUBY80AylXv6Gbp+voAyx3ebEi/evzG1kndSelb5MzThbfhubQQteart0X
         cZV/qy5LL0TrZan+cr1nKU8xLPrfVBH3sBRi/xWQcZXLoJwnuh0uEH7oxEno/0MdrpmP
         MoZK6ApVoX+lZ9YNxn1jaKv6o021JhP/Y2eWDy0geZ6jFV5rEmt7A+HbfoUfGOtHyXAY
         n80r7NdsRmsHTSG8EqvrajbIg+0UK5H+tjEiAF4UZAe5LXRgnrQyrk2DGRwtxUXlMypi
         RNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739523497; x=1740128297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QtD1EK2iHm2J01pml3P/unMeIKoZgkx4ph4Uy7XYIUg=;
        b=wp3Ri4k4fr62xzVAYLsg4ocCfkR7skqV5ojGKv3J9Dzud8Y3mAFgwnHeZLfSpM4DC4
         hWP7wtlF1jpOM7p+PNTr0i39LZqRZyXRf35U0VzUQFrSwX+HJq+x898gWHpeRX4aaOyP
         zjHzooVXGKv4DKRc2K+Gshi64JpywWnHahLn29mP+epwLr0k4Y71cRmgcbZbq70WGBum
         sTLyznRZwLNSNUJar8LIMG08okja+cXgUVjxOz6ZffeXx9YNgNIonza4BWkscBIAEwyy
         IOPoFm/cZTBhtQbgyzraLlU8sZkafnoRTClDC0oDBlL6jY3EBg78f72nWyjfuPy39ATU
         WdqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxzLiWxJ+G4x2tNaELDma7q0aBucppcWVV/238iMvnKRuVtzF+i7ljo0BAjKmCB7/1Kw1AQ/IA0frUjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxI+loWoPKa3UyN3DgKytNSH9ihCAElgBh+J/Vp416hs+1raHUC
	+rEVz559iEdBNlbxfhwuOdnqwVHrHMi8cysfHHR9Clm5/1zb138MPqG43Ig7tzh0A6cZ8qLdGhb
	f4HmNp3L6PLKFA4aGH7kHjTkjiVU=
X-Gm-Gg: ASbGnctY6g42UtIxACh6GO4BSOE5enPGNqkAoPclFqq1gctbN0fsz/KcBca4K6Oteev
	53/DolVoD6Vy2G9D0Yr6b978CT8loETj7UXbOhUFA84PD0bwY2to0hzLhGFcwPt5nnBzzCXYlav
	dSRqJ1oYIKonxpjdZgaRpYYUMU2utC
X-Google-Smtp-Source: AGHT+IFLewb412noj4uqcVc4O05Mx0s640QthBlKi29bsLaw4fZCgCoki/X1a7yUuRxKarNYApMZBkUEJ48ks/HSldc=
X-Received: by 2002:a05:6870:ec94:b0:29e:29ac:5ade with SMTP id
 586e51a60fabf-2b8daf9798fmr6678884fac.35.1739523496658; Fri, 14 Feb 2025
 00:58:16 -0800 (PST)
MIME-Version: 1.0
References: <20250127061529.2437012-1-zhangchunyan@iscas.ac.cn>
 <c0a2fbeb-9a0d-4b69-bc6b-e1652e13debf@molgen.mpg.de> <Z5gJ35pXI2W41QDk@ghost>
 <CAAfSe-utAb53278x9X4tKn6jWzdehsPKDRa_CoQy61ND=cXbxQ@mail.gmail.com> <Z65l51hrDmKQP6dM@ghost>
In-Reply-To: <Z65l51hrDmKQP6dM@ghost>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Fri, 14 Feb 2025 16:57:40 +0800
X-Gm-Features: AWEUYZk6Nb2w_oOkYEtmCWxquIeInQemENiiDTKj3yi3kUf3z09tHcasYvPqllI
Message-ID: <CAAfSe-tcNHYY+Jw5CZNOxXgLcK8gvBq7rgOY5KZfM_+9PbTfHw@mail.gmail.com>
Subject: Re: [PATCH V2] raid6: Add RISC-V SIMD syndrome and recovery calculations
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Chunyan Zhang <zhangchunyan@iscas.ac.cn>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Song Liu <song@kernel.org>, Yu Kuai <yukuai3@huawei.com>, 
	linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_005817_742497_0CE825B2 
X-CRM114-Status: GOOD (  29.98  )
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

On Fri, 14 Feb 2025 at 05:36, Charlie Jenkins <charlie@rivosinc.com> wrote:
>
> On Tue, Feb 11, 2025 at 05:59:26PM +0800, Chunyan Zhang wrote:
> > On Tue, 28 Jan 2025 at 06:34, Charlie Jenkins <charlie@rivosinc.com> wrote:
> > >
> > > On Mon, Jan 27, 2025 at 09:39:11AM +0100, Paul Menzel wrote:
> > > > Dear Chunyan,
> > > >
> > > >
> > > > Thank you for the patch.
> > > >
> > > >
> > > > Am 27.01.25 um 07:15 schrieb Chunyan Zhang:
> > > > > The assembly is originally based on the ARM NEON and int.uc, but uses
> > > > > RISC-V vector instructions to implement the RAID6 syndrome and
> > > > > recovery calculations.
> > > > >
> > > > > Results on QEMU running with the option "-icount shift=0":
> > > > >
> > > > >    raid6: rvvx1    gen()  1008 MB/s
> > > > >    raid6: rvvx2    gen()  1395 MB/s
> > > > >    raid6: rvvx4    gen()  1584 MB/s
> > > > >    raid6: rvvx8    gen()  1694 MB/s
> > > > >    raid6: int64x8  gen()   113 MB/s
> > > > >    raid6: int64x4  gen()   116 MB/s
> > > > >    raid6: int64x2  gen()   272 MB/s
> > > > >    raid6: int64x1  gen()   229 MB/s
> > > > >    raid6: using algorithm rvvx8 gen() 1694 MB/s
> > > > >    raid6: .... xor() 1000 MB/s, rmw enabled
> > > > >    raid6: using rvv recovery algorithm
> > > >
> > > > How did you start QEMU and on what host did you run it? Does it change
> > > > between runs? (For me these benchmark values were very unreliable in the
> > > > past on x86 hardware.)
> > >
> > > I reported dramatic gains on vector as well in this response [1]. Note
> > > that these gains are only present when using the QEMU option "-icount
> > > shift=0" vector becomes dramatically more performant. Without this
> > > option we do not see a performance gain on QEMU. However riscv vector is
> > > known to not be less optimized on QEMU so having vector be less
> > > performant on some QEMU configurations is not necessarily representative
> > > of hardware implementations.
> > >
> > >
> > > My full qemu command is (running on x86 host):
> > >
> > > qemu-system-riscv64 -nographic -m 1G -machine virt -smp 1\
> > >     -kernel arch/riscv/boot/Image \
> > >     -append "root=/dev/vda rw earlycon console=ttyS0" \
> > >     -drive file=rootfs.ext2,format=raw,id=hd0,if=none \
> > >     -bios default -cpu rv64,v=true,vlen=256,vext_spec=v1.0 \
> > >     -device virtio-blk-device,drive=hd0
> > >
> > > This is with version 9.2.0.
> > >
> > >
> > > I am also facing this issue when executing this:
> > >
> > > raid6: rvvx1    gen()   717 MB/s
> > > raid6: rvvx2    gen()   734 MB/s
> > > Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
> > >
> > > Only rvvx4 is failing. I applied this patch to 6.13.
> >
> > I used your command to run but no issue on my side (x86 host, qemu
> > version is 9.2.0, kernel 6.13 too):
> >
> > qemu-system-riscv64 -nographic -m 1G -machine virt -smp 1 -icount shift=0 \
> >         -kernel arch/riscv/boot/Image   \
> >         -append "rootwait root=/dev/vda ro"     \
> >         -drive file=rootfs.ext4,format=raw,id=hd0 \
> >         -bios default -cpu rv64,v=true,vlen=256,vext_spec=v1.0 \
> >         -device virtio-blk-device,drive=hd0
>
> I am able to reproduce it with this defconfig:
>
> CONFIG_SYSVIPC=y
> CONFIG_NO_HZ_IDLE=y
> CONFIG_HIGH_RES_TIMERS=y
> CONFIG_BPF_SYSCALL=y
> CONFIG_IKCONFIG=y
> CONFIG_IKCONFIG_PROC=y
> CONFIG_NAMESPACES=y
> CONFIG_USER_NS=y
> CONFIG_CHECKPOINT_RESTORE=y
> CONFIG_BLK_DEV_INITRD=y
> CONFIG_EXPERT=y
> # CONFIG_SYSFS_SYSCALL is not set
> CONFIG_PROFILING=y
> CONFIG_SMP=y
> CONFIG_CPU_FREQ=y
> CONFIG_CPU_FREQ_STAT=y
> CONFIG_CPU_FREQ_GOV_USERSPACE=y
> CONFIG_CPU_FREQ_GOV_ONDEMAND=y
> CONFIG_CPUFREQ_DT=y
> CONFIG_JUMP_LABEL=y
> CONFIG_DEVTMPFS=y
> CONFIG_DEVTMPFS_MOUNT=y
> CONFIG_MTD=y
> CONFIG_MTD_BLOCK=y
> CONFIG_MTD_CFI=y
> CONFIG_MTD_CFI_ADV_OPTIONS=y
> CONFIG_BLK_DEV_LOOP=y
> CONFIG_VIRTIO_BLK=y
> CONFIG_MD=y
> CONFIG_BLK_DEV_MD=y
> CONFIG_MD_RAID456=y
> CONFIG_INPUT_MOUSEDEV=y
> CONFIG_SERIAL_8250=y
> CONFIG_SERIAL_8250_CONSOLE=y
> CONFIG_SERIAL_8250_DW=y
> CONFIG_SERIAL_OF_PLATFORM=y
> CONFIG_SERIAL_SIFIVE=y
> CONFIG_SERIAL_SIFIVE_CONSOLE=y
> CONFIG_VIRTIO_CONSOLE=y
> CONFIG_HW_RANDOM_VIRTIO=y
> CONFIG_PINCTRL=y
> CONFIG_GPIOLIB=y
> CONFIG_GPIO_DWAPB=y
> CONFIG_GPIO_SIFIVE=y
> CONFIG_SOUND=y
> CONFIG_RTC_CLASS=y
> CONFIG_RTC_DRV_GOLDFISH=y
> CONFIG_DMADEVICES=y
> CONFIG_DW_AXI_DMAC=y
> CONFIG_VIRTIO_BALLOON=y
> CONFIG_VIRTIO_INPUT=y
> CONFIG_VIRTIO_MMIO=y
> CONFIG_GOLDFISH=y
> CONFIG_MAILBOX=y
> CONFIG_RPMSG_CTRL=y
> CONFIG_RPMSG_VIRTIO=y
> CONFIG_PM_DEVFREQ=y
> CONFIG_IIO=y
> CONFIG_LIBNVDIMM=y
> CONFIG_EXT4_FS=y
> CONFIG_EXT4_FS_POSIX_ACL=y
> CONFIG_EXT4_FS_SECURITY=y
> CONFIG_AUTOFS_FS=y
> CONFIG_ISO9660_FS=y
> CONFIG_JOLIET=y
> CONFIG_ZISOFS=y
> CONFIG_MSDOS_FS=y
> CONFIG_VFAT_FS=y
> CONFIG_PRINTK_TIME=y
> CONFIG_SCHED_STACK_END_CHECK=y
> # CONFIG_RCU_TRACE is not set
> # CONFIG_FTRACE is not set
> # CONFIG_RUNTIME_TESTING_MENU is not set
>
> I took the riscv/defconfig and added MD_RAID456 and it's dependencies.
> So that the message wasn't too long I started removing some unnecessary
> configs. Try this out and let me know if you encounter the issue.

I took the riscv/defconfig and set MD_RAID456=y, but didn't see this issue.
Since RAID6_PQ is selected by MD_RAID456, so RAID6_PQ=y, I got the
raid6 test result during kernel init.

[    0.317147] raid6: rvvx1    gen()    45 MB/s
[    0.390800] raid6: rvvx2    gen()    45 MB/s
[    0.459435] raid6: rvvx4    gen()    45 MB/s
[    0.527651] raid6: rvvx8    gen()    44 MB/s
[    0.596123] raid6: int64x8  gen()  1232 MB/s
[    0.664686] raid6: int64x4  gen()  2728 MB/s
[    0.733291] raid6: int64x2  gen()  3405 MB/s
[    0.801836] raid6: int64x1  gen()  2730 MB/s
[    0.801895] raid6: using algorithm int64x2 gen() 3405 MB/s
[    0.870379] raid6: .... xor() 493 MB/s, rmw enabled

Thanks,
Chunyan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
