Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A336C021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 21:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gfj4nDeOzK+6GeAfDA0WcJkTJUBBWRApJx7qjZtshRA=; b=ewmnIrMD4fhAw0
	ioRlcpjIrLTDvbrG/lMJTpUORyZp406mhOBUwHcKYpDbd5MoTDR95FkMeVud1EVrXAqtAH7k79ie4
	9elzYJUFuisaChUgZrqe7xg8Br3jrBMAxShi6Q0aKpz9vDoLtgKP03HdoFn3nQ6W9TFRtzqdUdhaL
	OWAGMFJYchd0hWEBevzenBNQNyp16yw8iynkD/GqdxQ6Fsm5vKWKx9KAlze9T4q9K9d2SyFymN6hZ
	8CKOcvOPrk8oUbzA66OIfroYRhvncFGAUaB+C9mtrBK2pfEyKgEPTluef+iO2uBvEXf0+xvBTe8Nw
	JgAskp36jMNx31m+FjkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tigt2-0000000Ciak-3sjO;
	Thu, 13 Feb 2025 21:36:44 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tigt0-0000000CiZp-2vFW
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 21:36:44 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-6f679788fd1so10704457b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 13:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739482601; x=1740087401; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tN5YgbLMf1aDRtVPiBKlBRhDfg2WRlderUDGvHcqbTY=;
        b=kPvlkiWt5DIYKT2Jsi2I0H4ga9icZMSjNR6z3twUbFJn4GZ89KWJGTf1RZ2eiSKYby
         OHkGwfxlSJrz/L/awaT9qoe+1xsVspBEMjhkCpuM0K/TIeHT+w3sVSryFyRBxF06uqar
         Krg2X8pDEhFMS+3cLNsBYSjPhzyNykq0oca/pM25YnnFToHk2eBxwLNTcc781lVDfvCh
         fB4Rw84IteECT8NGBoms//5YT2+kUWJPz4B6Zden9JSEz0A3cuXK1UxabnTD6F6igsuA
         1bDw55I762Rf/kf01ZVioWMhZLFOu+jKXPpJPR4XvBriZ8YBA8tYtuXyVqdz4Zzvbixt
         8cEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739482601; x=1740087401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tN5YgbLMf1aDRtVPiBKlBRhDfg2WRlderUDGvHcqbTY=;
        b=WIgqyHn2mEZ/Rbm89dfQ8VPp3DlpGQNlolqrEAkAr3FB5Kj/hV9jdPtP2sniijISec
         /swILy9aMHhTSW8I6OHIyqdebw/lJLnoy6reGdQyswzzwjBd9Hs/jD7ZxvdwXmJkjGyO
         XER1V6iB8+1l4+qEN80yjpR/zH1fH/UqhoA1rCZixBEGGIwEVMiDh5m6VhYigfk/Z3X/
         vPTawAYqWgIycRWWMIi/x11HDwLzSIziUS1RHXr2rU2zjmVKQ5nqqUOcGvPi1JNTFS29
         sglplaF6k7/UOk0zNElSrcryAdwu9nR+3AtA9UiDelQNd5Ks2t/a6MG75C3Isuq4jjI/
         qe2w==
X-Forwarded-Encrypted: i=1; AJvYcCX8xAhtHHBcHNO6P5c/AUw7+5iu9GrTKFhEzw8VnkeX8APDWBIhckdTM4Sx3szI2XN/aBL3m7b+kSnu9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuP85GnUJ9wpigRsO+Tmk6XQaJXpSmD6SOOJ9WDhbj0kg/129I
	qTBGXVGkzT3lekpXINoHOUwFitxBInmgQzKjhDOPWl+A/t7dTDyWufWZnF92D3I=
X-Gm-Gg: ASbGncswh70NfN2AaULP40OljDYMzmHU4xDy1CvJy3JOetyE/J0ggDkPO/hVby4czHZ
	d50/7+qmlDpMrFEBFJPpQaPZUiscEh3Q5xWoISE4sXPu7xuxQF7lCFyuYONiaJGpkwywpxb0LmJ
	nsMmiG8X0qoP0lyLtg+xKYYgxOI5DfjwkM0NJNY1nUPkenD7AaY+2L4RZvuJQLLmBWbx6s/5BMy
	bWtvGYd+ZDQkln5NAUCpATF+5fZYZ+iNbyClGUSxdSqDjUk0Bq6KpEKBw66ZES6hHBKpsKCKBC1
	gvY=
X-Google-Smtp-Source: AGHT+IFrZXty2zvWMcfr9wxzGzvWLUXiH8mGsSyxSxV6zHOMIiY7RNEUKUZiPnL5TCqkmw//gUw1NA==
X-Received: by 2002:a05:6902:1186:b0:e5b:1dda:8f6a with SMTP id 3f1490d57ef6-e5da0209accmr8160531276.12.1739482601327;
        Thu, 13 Feb 2025 13:36:41 -0800 (PST)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5dae0da26csm595254276.44.2025.02.13.13.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 13:36:40 -0800 (PST)
Date: Thu, 13 Feb 2025 13:36:39 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>, linux-riscv@lists.infradead.org,
	linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] raid6: Add RISC-V SIMD syndrome and recovery
 calculations
Message-ID: <Z65l51hrDmKQP6dM@ghost>
References: <20250127061529.2437012-1-zhangchunyan@iscas.ac.cn>
 <c0a2fbeb-9a0d-4b69-bc6b-e1652e13debf@molgen.mpg.de>
 <Z5gJ35pXI2W41QDk@ghost>
 <CAAfSe-utAb53278x9X4tKn6jWzdehsPKDRa_CoQy61ND=cXbxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAfSe-utAb53278x9X4tKn6jWzdehsPKDRa_CoQy61ND=cXbxQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_133642_869309_FFF94654 
X-CRM114-Status: GOOD (  28.78  )
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

On Tue, Feb 11, 2025 at 05:59:26PM +0800, Chunyan Zhang wrote:
> On Tue, 28 Jan 2025 at 06:34, Charlie Jenkins <charlie@rivosinc.com> wrote:
> >
> > On Mon, Jan 27, 2025 at 09:39:11AM +0100, Paul Menzel wrote:
> > > Dear Chunyan,
> > >
> > >
> > > Thank you for the patch.
> > >
> > >
> > > Am 27.01.25 um 07:15 schrieb Chunyan Zhang:
> > > > The assembly is originally based on the ARM NEON and int.uc, but uses
> > > > RISC-V vector instructions to implement the RAID6 syndrome and
> > > > recovery calculations.
> > > >
> > > > Results on QEMU running with the option "-icount shift=0":
> > > >
> > > >    raid6: rvvx1    gen()  1008 MB/s
> > > >    raid6: rvvx2    gen()  1395 MB/s
> > > >    raid6: rvvx4    gen()  1584 MB/s
> > > >    raid6: rvvx8    gen()  1694 MB/s
> > > >    raid6: int64x8  gen()   113 MB/s
> > > >    raid6: int64x4  gen()   116 MB/s
> > > >    raid6: int64x2  gen()   272 MB/s
> > > >    raid6: int64x1  gen()   229 MB/s
> > > >    raid6: using algorithm rvvx8 gen() 1694 MB/s
> > > >    raid6: .... xor() 1000 MB/s, rmw enabled
> > > >    raid6: using rvv recovery algorithm
> > >
> > > How did you start QEMU and on what host did you run it? Does it change
> > > between runs? (For me these benchmark values were very unreliable in the
> > > past on x86 hardware.)
> >
> > I reported dramatic gains on vector as well in this response [1]. Note
> > that these gains are only present when using the QEMU option "-icount
> > shift=0" vector becomes dramatically more performant. Without this
> > option we do not see a performance gain on QEMU. However riscv vector is
> > known to not be less optimized on QEMU so having vector be less
> > performant on some QEMU configurations is not necessarily representative
> > of hardware implementations.
> >
> >
> > My full qemu command is (running on x86 host):
> >
> > qemu-system-riscv64 -nographic -m 1G -machine virt -smp 1\
> >     -kernel arch/riscv/boot/Image \
> >     -append "root=/dev/vda rw earlycon console=ttyS0" \
> >     -drive file=rootfs.ext2,format=raw,id=hd0,if=none \
> >     -bios default -cpu rv64,v=true,vlen=256,vext_spec=v1.0 \
> >     -device virtio-blk-device,drive=hd0
> >
> > This is with version 9.2.0.
> >
> >
> > I am also facing this issue when executing this:
> >
> > raid6: rvvx1    gen()   717 MB/s
> > raid6: rvvx2    gen()   734 MB/s
> > Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
> >
> > Only rvvx4 is failing. I applied this patch to 6.13.
> 
> I used your command to run but no issue on my side (x86 host, qemu
> version is 9.2.0, kernel 6.13 too):
> 
> qemu-system-riscv64 -nographic -m 1G -machine virt -smp 1 -icount shift=0 \
>         -kernel arch/riscv/boot/Image   \
>         -append "rootwait root=/dev/vda ro"     \
>         -drive file=rootfs.ext4,format=raw,id=hd0 \
>         -bios default -cpu rv64,v=true,vlen=256,vext_spec=v1.0 \
>         -device virtio-blk-device,drive=hd0

I am able to reproduce it with this defconfig:

CONFIG_SYSVIPC=y
CONFIG_NO_HZ_IDLE=y
CONFIG_HIGH_RES_TIMERS=y
CONFIG_BPF_SYSCALL=y
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_NAMESPACES=y
CONFIG_USER_NS=y
CONFIG_CHECKPOINT_RESTORE=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_EXPERT=y
# CONFIG_SYSFS_SYSCALL is not set
CONFIG_PROFILING=y
CONFIG_SMP=y
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_STAT=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPUFREQ_DT=y
CONFIG_JUMP_LABEL=y
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_MTD=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_CFI=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_BLK_DEV_LOOP=y
CONFIG_VIRTIO_BLK=y
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_RAID456=y
CONFIG_INPUT_MOUSEDEV=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DW=y
CONFIG_SERIAL_OF_PLATFORM=y
CONFIG_SERIAL_SIFIVE=y
CONFIG_SERIAL_SIFIVE_CONSOLE=y
CONFIG_VIRTIO_CONSOLE=y
CONFIG_HW_RANDOM_VIRTIO=y
CONFIG_PINCTRL=y
CONFIG_GPIOLIB=y
CONFIG_GPIO_DWAPB=y
CONFIG_GPIO_SIFIVE=y
CONFIG_SOUND=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_DRV_GOLDFISH=y
CONFIG_DMADEVICES=y
CONFIG_DW_AXI_DMAC=y
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=y
CONFIG_VIRTIO_MMIO=y
CONFIG_GOLDFISH=y
CONFIG_MAILBOX=y
CONFIG_RPMSG_CTRL=y
CONFIG_RPMSG_VIRTIO=y
CONFIG_PM_DEVFREQ=y
CONFIG_IIO=y
CONFIG_LIBNVDIMM=y
CONFIG_EXT4_FS=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
CONFIG_AUTOFS_FS=y
CONFIG_ISO9660_FS=y
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
CONFIG_MSDOS_FS=y
CONFIG_VFAT_FS=y
CONFIG_PRINTK_TIME=y
CONFIG_SCHED_STACK_END_CHECK=y
# CONFIG_RCU_TRACE is not set
# CONFIG_FTRACE is not set
# CONFIG_RUNTIME_TESTING_MENU is not set

I took the riscv/defconfig and added MD_RAID456 and it's dependencies.
So that the message wasn't too long I started removing some unnecessary
configs. Try this out and let me know if you encounter the issue.

- Charlie

> 
> Thanks,
> Chunyan
> 
> >
> > - Charlie
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
