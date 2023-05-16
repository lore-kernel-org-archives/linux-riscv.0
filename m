Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5672BC7EE2C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 09:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MBdaGEJPae8NH8Uht/I3ppilzKi0o/PkiFuMe3L23lM=; b=t5b7TSGv76D71n
	ibRr6hYrFxb6hQc/l8UWtpF5SCIMkPwKBOInreh5bf04JfvVkPmWMEAvFDtiMplasgfpWToZjFSIE
	gT7blzRFXkbxB9FKE1BpHx85ZHB8ujCKr+mxCBuoqLTNsbo6PE2aV4nJQOQwZA9oRd/wJN+ZCozOq
	OYSHS99YFi4xxvNOnjbCfUzCglMePeAFAiq8ysmrofjgcjk2ZqLPEh0oZs1brrWsZaokV+iOK5ahi
	8EYo5Xlvoohhtt3ooMZOdzXafCLL4noft8cPy/haUZwGAoGPnsw464j5FencjBHqsJukfgaaI9p2x
	bJC/34a0gdxswclzq0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyrPg-0059i2-13;
	Tue, 16 May 2023 09:56:12 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyrPb-0059d5-1I
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 09:56:10 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 96E2324E339;
	Tue, 16 May 2023 17:55:23 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 16 May
 2023 17:55:23 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX066.cuchost.com
 (172.16.7.66) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 16 May
 2023 17:55:23 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Tue, 16 May 2023 17:55:23 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Song Shuai <suagrfillet@gmail.com>, "alexghiti@rivosinc.com"
	<alexghiti@rivosinc.com>, "robh@kernel.org" <robh@kernel.org>, Andrew Jones
	<ajones@ventanamicro.com>, "anup@brainfault.org" <anup@brainfault.org>,
	"palmer@rivosinc.com" <palmer@rivosinc.com>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>, Mason Huo <mason.huo@starfivetech.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Conor Dooley
	<conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: Bug report: kernel paniced when system hibernates
Thread-Topic: Bug report: kernel paniced when system hibernates
Thread-Index: AQHZh9g1UxpK4+O/SUareMzY680B/K9cp3zQ
Date: Tue, 16 May 2023 09:55:23 +0000
Message-ID: <5902235c8f5046be9cbd7411955ec43e@EXMBX066.cuchost.com>
References: <CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com>
In-Reply-To: <CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [60.53.70.89]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_025607_920145_F67F70DC 
X-CRM114-Status: GOOD (  26.83  )
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

Hi Song,

Thanks for the investigation. Indeed, the exposure of the PMP reserved region to the kernel page table is causing the problem.
Here is the similar report: https://groups.google.com/u/0/a/groups.riscv.org/g/sw-dev/c/ITXwaKfA6z8

Thanks
Regards
Jee Heng

> -----Original Message-----
> From: Song Shuai <suagrfillet@gmail.com>
> Sent: Tuesday, May 16, 2023 5:24 PM
> To: alexghiti@rivosinc.com; robh@kernel.org; Andrew Jones <ajones@ventanamicro.com>; anup@brainfault.org;
> palmer@rivosinc.com; JeeHeng Sia <jeeheng.sia@starfivetech.com>; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo
> <mason.huo@starfivetech.com>; Paul Walmsley <paul.walmsley@sifive.com>; Conor Dooley <conor.dooley@microchip.com>; Guo
> Ren <guoren@kernel.org>
> Cc: linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Bug report: kernel paniced when system hibernates
> 
> Description of problem:
> 
> The latest hibernation support[1] of RISC-V Linux produced a kernel panic.
> The entire log has been posted at this link: https://termbin.com/sphl .
> 
> How reproducible:
> 
> You can reproduce it with the following step :
> 
> 1. prepare the environment with
> - Qemu-virt v8.0.0 (with OpenSbi v1.2)
> - Linux v6.4-rc1
> 
> 2. start the Qemu virt
> ```sh
> $ cat ~/8_riscv/start_latest.sh
> #!/bin/bash
> /home/song/8_riscv/3_acpi/qemu/ooo/usr/local/bin/qemu-system-riscv64 \
> -smp 2 -m 4G -nographic -machine virt \
> -kernel /home/song/9_linux/linux/00_rv_test/arch/riscv/boot/Image \
> -append "root=/dev/vda ro eaylycon=uart8250,mmio,0x10000000
> early_ioremap_debug console=ttyS0 loglevel=8 memblock=debug
> no_console_suspend audit=0 3" \
> -drive file=/home/song/8_riscv/fedora/stage4-disk.img,format=raw,id=hd0 \
> -device virtio-blk-device,drive=hd0 \
> -drive file=/home/song/8_riscv/fedora/adisk.qcow2,format=qcow2,id=hd1 \
> -device virtio-blk-device,drive=hd1 \
> -gdb tcp::1236 #-S
> ```
> 3. execute hibernation
> 
> ```sh
> swapon /dev/vdb2 # this is my swap disk
> 
> echo disk > /sys/power/state
> ```
> 
> 4. Then you will encounter the kernel panic logged in the above link
> 
> 
> Other Information:
> 
> After my initial and incomplete dig-up, the commit (3335068f8721
> "riscv: Use PUD/P4D/PGD pages for the linear mapping")[2]
> is closely related to this panic. This commit uses re-defined
> `MIN_MEMBLOCK_ADDR` to discover the entire system memory
> and extends the `va_pa_offset` from `kernel_map.phys_addr` to
> `phys_ram_base` for linear memory mapping.
> 
> If the firmware delivered the firmware memory region (like: a PMP
> protected region in OpenSbi) without "no-map" propriety,
> this commit will result in firmware memory being directly mapped by
> `create_linear_mapping_page_table()`.
> 
> We can see the mapping via ptdump :
> ```c
> ---[ Linear mapping ]---
> 0xff60000000000000-0xff60000000200000 0x0000000080000000 2M PMD D A G
> . . W R V ------------- the firmware memory
> 0xff60000000200000-0xff60000000c00000 0x0000000080200000 10M PMD D A G . . . R V
> 0xff60000000c00000-0xff60000001000000 0x0000000080c00000 4M PMD D A G . . W R V
> 0xff60000001000000-0xff60000001600000 0x0000000081000000 6M PMD D A G . . . R V
> 0xff60000001600000-0xff60000040000000 0x0000000081600000 1002M PMD D A
> G . . W R V
> 0xff60000040000000-0xff60000100000000 0x00000000c0000000 3G PUD D A G . . W R V
> ---[ Modules/BPF mapping ]---
> ---[ Kernel mapping ]---
> 0xffffffff80000000-0xffffffff80a00000 0x0000000080200000 10M PMD D A G . X . R V
> 0xffffffff80a00000-0xffffffff80c00000 0x0000000080c00000 2M PMD D A G . . . R V
> 0xffffffff80c00000-0xffffffff80e00000 0x0000000080e00000 2M PMD D A G . . W R V
> 0xffffffff80e00000-0xffffffff81400000 0x0000000081000000 6M PMD D A G . . . R V
> 0xffffffff81400000-0xffffffff81800000 0x0000000081600000 4M PMD
> ```
> 
> In the hibernation process, `swsusp_save()` calls
> `copy_data_pages(&copy_bm, &orig_bm)` to copy these two memory
> bitmaps,
> the Oops(load access fault) occurred while copying the page of
> PAGE_OFFSET (which maps the firmware memory).
> 
> I also did two other tests:
> Test1:
> 
> The hibernation works well in the kernel with the commit 3335068f8721
> reverted at least in the current environment.
> 
> Test2:
> 
> I built a simple kernel module to simulate the access of the value of
> `PAGE_OFFSET` address, and the same panic occurred with the load
> access fault.
> So hibernation seems not the only case to trigger this panic.
> 
> Finally, should we always leave the firmware memory with
> `MEMBLOCK_NOMAP` flag by some efforts from Linux or OpenSbi (at least
> in the current environment) or any other suggestions?
> 
> Please correct me if I'm wrong.
> 
> [1]: https://lore.kernel.org/r/20230330064321.1008373-5-jeeheng.sia@starfivetech.com
> [2]: https://lore.kernel.org/r/20230324155421.271544-4-alexghiti@rivosinc.com
> 
> --
> Thanks,
> Song
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
