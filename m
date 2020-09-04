Return-Path: <SRS0=91Bs=CN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FORGED_MUA_MOZILLA,HEADER_FROM_DIFFERENT_DOMAINS,
	INVALID_MSGID,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876A4C433E2
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 13:07:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 432C8206F2
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 13:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dumFwwqD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 432C8206F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.com.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UWkG9/Rph3lz+8NlJQF4iI2tnt+iqJwpDuCCv8l5C7k=; b=dumFwwqDQp2T9iEavN4ogT8Hn
	ZWbm0DlGy85VW4yVHEEHmNccb4KprWyboBNtc8AjWqXn1H9nvqmws9zoXHzeHaIYZG9w0CMUoqHUq
	oykXyO6vF2NTKffGjyg0v3iCb8ZujobiWq6tgSaVvvXgu833Qwg1/8LnmJqkFXeCTnFnz6ZBZGzAe
	iDF+iCpeCfTgqa02qzKI2N/Sa1H5SZJjXqMcXmF5m9zCOSwB/FBJpTrd1PQlt6N3OOW6KH5DjOjMB
	OHoOcISyUG62Y1zU+n7/UdAYaYL6mfcVRsp8rJGwuwEnzbnpEebsozKr0sRqAwKUO5RwW0QTDMh7s
	XhqhMBXOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEBQX-0001II-PN; Fri, 04 Sep 2020 13:06:49 +0000
Received: from smtpbg550.qq.com ([183.3.226.152] helo=qq.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEBQU-0001H1-Tp
 for linux-riscv@lists.infradead.org; Fri, 04 Sep 2020 13:06:48 +0000
X-QQ-mid: bizesmtp7t1599224306t1ubczmgx
Received: from [192.168.1.11] (unknown [111.19.38.230])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 04 Sep 2020 20:58:25 +0800 (CST)
X-QQ-SSF: 01400000002000207000B00A0000000
X-QQ-FEAT: mAJfWfDYrJOhY6ERVKcHgLC0GDAZHlUIfRXkj76PwONazJxhawnF6bbn1+9Yy
 wasSUXANktasu8iOALyhllUy4Ny36vYwqDI806A0LsHaRg2aWSxxZSXp4pAc23dVI4IHG57
 OsO3AD5uxHtm1dLXSrK/YFfeftmXdb4XOy3MAdu5w9DacMA6hu5ZsM1aYGviSKeelAsJBgA
 aaMgtIYYi0zIisnq2rzrwkKinlDsXUk7VWfH5YODRN3RlqqhvAUhuhbrNKPHKQlZqM33Oot
 fdpSrNO7rTAVlDlj8aFTdnloTQBCev7bti6J/ScE0poYJEU5PkPSpJ0Vuhnuj0P/TqKF4K+
 nSv5bEANFVS2w2e7V0=
X-QQ-GoodBg: 2
Subject: Re: [GIT PULL] RISC-V Fixes for 5.9-rc2
To: Anup Patel <anup@brainfault.org>, Christoph Hellwig <hch@infradead.org>
References: <mhng-32c8d053-acbd-4c72-b41d-8d6042ac639d@palmerdabbelt-glaptop1>
 <CAHk-=wi_tf4qsiBj5UD0GG3wz8Hi5NrHzqdrx+CwtfAY+_UiGg@mail.gmail.com>
 <20200904083109.GA9182@infradead.org>
 <CAAhSdy3S8FfMAWih_VoBHw0xd-7c=urzuJ+PPdug9iX_pWyTsQ@mail.gmail.com>
 <20200904094617.GA27846@infradead.org>
 <CAAhSdy2x0ROqoTzzZRZgKCTL99WPy-8e4CQ921sf-=GQDm_gxA@mail.gmail.com>
From: Qiu Wenbo <qiuwenbo@kylinos.com.cn>
Message-ID: <f1be6ee1-0802-82ca-ffdb-4c294925cd9a@kylinos.com.cn>+7622B06EA1A49627
Date: Fri, 4 Sep 2020 20:58:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy2x0ROqoTzzZRZgKCTL99WPy-8e4CQ921sf-=GQDm_gxA@mail.gmail.com>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:kylinos.com.cn:qybgweb:qybgweb11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_090647_449035_A290A5D8 
X-CRM114-Status: GOOD (  25.77  )
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

I can confirm this patch also breaks K210 support. It seems that 
csr_read(CSR_TIME) will trigger an illegal instruction exception on K210.

On 9/4/20 6:04 PM, Anup Patel wrote:
> On Fri, Sep 4, 2020 at 3:16 PM Christoph Hellwig <hch@infradead.org> wrote:
>> On Fri, Sep 04, 2020 at 03:12:18PM +0530, Anup Patel wrote:
>>> I tried Linux-5.9-rc3 using nommu_virt_defconfig at my end. I am not
>>> able to reproduce
>>> this issue. Is there additional Kconfig option required to reproduce
>>> this issue ??
>> export CROSS_COMPILE=/usr/bin/riscv64-linux-gnu-
>> make ARCH=riscv nommu_virt_defconfig
>> make ARCH=riscv -j4 loader
>>
>> /opt/qemu-riscv/bin/qemu-system-riscv64 \
>>          -smp 2 \
>>          -m 256 \
>>          -machine virt \
>>          -nographic \
>>          -kernel arch/riscv/boot/loader \
>>          -drive file=rootfs.ext2,format=raw,id=hd0 \
>>          -device virtio-blk-device,drive=hd0
>>
> I tried your suggested QEMU command line with Linux-5.0-rc3 NoMMU
> kernel and it reaches till user-space for me but I don't have NoMMU rootfs
> so it is not able to start init process.
>
> anup@anup-ubuntu64-vm:~/Work/riscv-test/nommu$ qemu-system-riscv64
> -smp 2 -m 256 -machine virt -nographic -kernel
> ./build-riscv64/arch/riscv/boot/loader -drive
> file=../rootfs_riscv64.ext2,format=raw,id=hd0 -device
> virtio-blk-device,drive=hd0
> qemu-system-riscv64: warning: No -bios option specified. Not loading a firmware.
> qemu-system-riscv64: warning: This default will change in a future
> QEMU release. Please use the -bios option to avoid breakages when this
> happens.
> qemu-system-riscv64: warning: See QEMU's deprecation documentation for details.
> [    0.000000] Linux version 5.9.0-rc3 (anup@anup-ubuntu64-vm)
> (riscv64-unknown-linux-gnu-gcc (GCC) 9.2.0, GNU ld (GNU Binutils)
> 2.34) #1 SMP Fri Sep 4 15:02:31 IST 2020
> [    0.000000] earlycon: uart8250 at MMIO 0x0000000010000000 (options
> '115200n8')
> [    0.000000] printk: bootconsole [uart8250] enabled
> [    0.000000] Zone ranges:
> [    0.000000]   DMA32    [mem 0x0000000080000000-0x000000008fffffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000080000000-0x000000008fffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x000000008fffffff]
> [    0.000000] riscv: ISA extensions acdfimsu
> [    0.000000] riscv: ELF capabilities acdfim
> [    0.000000] percpu: max_distance=0x18000 too large for vmalloc space 0x0
> [    0.000000] percpu: Embedded 12 pages/cpu s18592 r0 d30560 u49152
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 64640
> [    0.000000] Kernel command line: root=/dev/vda rw
> earlycon=uart8250,mmio,0x10000000,115200n8 console=ttyS0
> [    0.000000] Dentry cache hash table entries: 32768 (order: 6,
> 262144 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 16384 (order: 5, 131072
> bytes, linear)
> [    0.000000] Sorting __ex_table...
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Memory: 256224K/262144K available (1283K kernel code,
> 138K rwdata, 200K rodata, 106K init, 133K bss, 5920K reserved, 0K
> cma-reserved)
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=2.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
> is 25 jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [    0.000000] riscv-intc: 64 local interrupts mapped
> [    0.000000] plic: plic@c000000: mapped 53 interrupts with 2
> handlers for 4 contexts.
> [    0.000000] random: get_random_bytes called from 0x00000000800019b4
> with crng_init=0
> [    0.000000] clint: clint@2000000: timer running at 10000000 Hz
> [    0.000000] clocksource: clint_clocksource: mask:
> 0xffffffffffffffff max_cycles: 0x24e6a1710, max_idle_ns: 440795202120
> ns
> [    0.000206] sched_clock: 64 bits at 10MHz, resolution 100ns, wraps
> every 4398046511100ns
> [    0.007108] Console: colour dummy device 80x25
> [    0.027252] Calibrating delay loop (skipped), value calculated
> using timer frequency.. 20.00 BogoMIPS (lpj=40000)
> [    0.044401] pid_max: default: 4096 minimum: 301
> [    0.050023] Mount-cache hash table entries: 512 (order: 0, 4096
> bytes, linear)
> [    0.051126] Mountpoint-cache hash table entries: 512 (order: 0,
> 4096 bytes, linear)
> [    0.108000] rcu: Hierarchical SRCU implementation.
> [    0.112062] smp: Bringing up secondary CPUs ...
> [    0.137273] smp: Brought up 1 node, 2 CPUs
> [    0.156765] devtmpfs: initialized
> [    0.179774] clocksource: jiffies: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 7645041785100000 ns
> [    0.180920] futex hash table entries: 16 (order: -2, 1024 bytes, linear)
> [    0.243189] clocksource: Switched to clocksource clint_clocksource
> [    0.337332] workingset: timestamp_bits=62 max_order=16 bucket_order=0
> [    0.359428] Serial: 8250/16550 driver, 1 ports, IRQ sharing disabled
> [    0.368316] printk: console [ttyS0] disabled
> [    0.371915] 10000000.uart: ttyS0 at MMIO 0x10000000 (irq = 2,
> base_baud = 230400) is a 16550A
> [    0.381511] printk: console [ttyS0] enabled
> [    0.381511] printk: console [ttyS0] enabled
> [    0.383556] printk: bootconsole [uart8250] disabled
> [    0.383556] printk: bootconsole [uart8250] disabled
> [    0.422472] virtio_blk virtio0: [vda] 65536 512-byte logical blocks
> (33.6 MB/32.0 MiB)
> [    0.423634] vda: detected capacity change from 0 to 33554432
> [    0.442785] syscon-poweroff soc:poweroff: pm_power_off already
> claimed (____ptrval____)
> [    0.444267] syscon-poweroff: probe of soc:poweroff failed with error -16
> [    0.476602] VFS: Mounted root (ext2 filesystem) on device 254:0.
> [    0.484743] devtmpfs: mounted
> [    0.509267] Freeing unused kernel memory: 104K
> [    0.509818] This architecture does not have kernel memory protection.
> [    0.510888] Run /sbin/init as init process
> [    0.532914] Starting init: /sbin/init exists but couldn't execute
> it (error -8)
> [    0.534654] Run /etc/init as init process
> [    0.567910] Run /bin/init as init process
> [    0.568801] Run /bin/sh as init process
> [    0.570511] Starting init: /bin/sh exists but couldn't execute it (error -8)
> [    0.573827] Kernel panic - not syncing: No working init found.  Try
> passing init= option to kernel. See Linux
> Documentation/admin-guide/init.rst for guidance.
> [    0.577228] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc3 #1
> [    0.578884] Call Trace:
> [    0.579903] [<000000008001da90>] 0x000000008001da90
> [    0.580994] [<000000008001dc00>] 0x000000008001dc00
> [    0.581820] [<000000008013e79c>] 0x000000008013e79c
> [    0.582699] [<000000008002154c>] 0x000000008002154c
> [    0.585067] [<000000008014face>] 0x000000008014face
> [    0.588753] [<000000008001c932>] 0x000000008001c932
> [    0.591942] SMP: stopping secondary CPUs
> [    0.593858] ---[ end Kernel panic - not syncing: No working init
> found.  Try passing init= option to kernel. See Linux
> Documentation/admin-guide/init.rst for guidance. ]---
>
> Regards,
> Anup
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
