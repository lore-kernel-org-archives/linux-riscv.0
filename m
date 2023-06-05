Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55CBC7EE23
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 10:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Mime-Version:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6bD3HN2Z4SkEfUBhm8nRKzejLOGcPi8MFiT8H3pvNOo=; b=eO9EDpWv9hfarv
	W8jBYDjKDlshxLepuUFalmxqjNbanQW+a37Bs7iUjWuWjGEAvXqqizgeCWYECu8TvfYXvViAJCC+v
	Y9UiMOuij6J16T8jeAoXwIG9dn1SBc6vCFlBbBkHWRYu9XOfBktLdwgKcbaJxdAtu9LIxk16RveNE
	o7WFGvtXzPYm+85vAHmqb0HnvNRbcCPmbTrA6phfW/jDo1IyLF00KKDYleJZfvh7WGD++3a596SUU
	XzNLiOz0Ym/ey3D6ODfkUZXe2bk3zIcDDgAXi886sq7LjZx86XklCQ4BgHGFxlSP96rjOFZ/N6Wja
	t7vuwYI2ZW39PMONoBlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q67ph-00F614-0I;
	Mon, 05 Jun 2023 10:53:05 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q67pc-00F5qW-34
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 10:53:03 +0000
X-QQ-GoodBg: 0
X-QQ-SSF: 0020000000000050
X-QQ-FEAT: q2IHZsLIAbj5AxpmXnqEnoSbEBnmly2KsHAeliX8VLdm3GtVo5aMJjCropIRt
	Uj8kiW2B2j2S7Ak6F65pg3Ln6HatLuNglBbsZnv2ASPnDWto3hvBDP+P6a7aUtAmdAo5Vor
	6lfNeUJxABOjNZ3PHli+8KzIgKjrEORgFzWO3tNs/+hkmzB+0urpeBWSZcSyopZl7fv0ItL
	YNDXP3vrBYeR2rGBLr6xPkh+5ST9s3nfgjPXZiKornR4IdxajS42BHpSLkP00lb7RSndDFn
	FJlyzer3++fWsd/vkVG3Ek9wx42XZV3VF1iwJLvrOmeQbSqLe0KrmYxeBXYylENpao2Mz6B
	wRYxkxiNyhae4YlHvHIin+1JGRA3Q==
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 221.226.231.35
X-QQ-STYLE: 
X-QQ-mid: logic304t1685962334t5322315
From: "=?utf-8?B?U29uZyBTaHVhaQ==?=" <songshuaishuai@tinylab.org>
To: "=?utf-8?B?YWxleGdoaXRp?=" <alexghiti@rivosinc.com>, "=?utf-8?B?cm9iaA==?=" <robh@kernel.org>, "=?utf-8?B?YWpvbmVz?=" <ajones@ventanamicro.com>, "=?utf-8?B?YW51cA==?=" <anup@brainfault.org>, "=?utf-8?B?cGFsbWVy?=" <palmer@rivosinc.com>, "=?utf-8?B?amVlaGVuZy5zaWE=?=" <jeeheng.sia@starfivetech.com>, "=?utf-8?B?bGV5Zm9vbi50YW4=?=" <leyfoon.tan@starfivetech.com>, "=?utf-8?B?bWFzb24uaHVv?=" <mason.huo@starfivetech.com>, "=?utf-8?B?cGF1bC53YWxtc2xleQ==?=" <paul.walmsley@sifive.com>, "=?utf-8?B?Y29ub3IuZG9vbGV5?=" <conor.dooley@microchip.com>, "=?utf-8?B?Z3VvcmVu?=" <guoren@kernel.org>
Cc: "=?utf-8?B?bGludXgtcmlzY3Y=?=" <linux-riscv@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>
Subject: Bug report: kernel paniced while booting  
Mime-Version: 1.0
Date: Mon, 5 Jun 2023 10:52:14 +0000
X-Priority: 3
Message-ID: <tencent_7C3B580B47C1B17C16488EC1@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-BIZMAIL-ID: 9876853723717290176
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Mon, 05 Jun 2023 18:52:16 +0800 (CST)
Feedback-ID: logic:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_035301_331644_C0039561 
X-CRM114-Status: GOOD (  16.53  )
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

Description of problem:

Booting Linux With RiscVVirtQemu edk2 firmware, a Store/AMO page fault was trapped to trigger a kernel panic.
The entire log has been posted at this link : https://termbin.com/nga4.

You can reproduce it with the following step :

1. prepare the environment with 
   - Qemu-virt:  v8.0.0 (with OpenSbi v1.2)
   - edk2 : at commit (2bc8545883 "UefiCpuPkg/CpuPageTableLib: Reduce the number of random tests")
   - Linux : v6.4-rc1 and later version 

2. start the Qemu virt board  
   
```sh
$ cat ~/8_riscv/start_latest.sh
#!/bin/bash
/home/song/8_riscv/3_acpi/qemu/ooo/usr/local/bin/qemu-system-riscv64 \
        -s -nographic -drive file=/home/song/8_riscv/3_acpi/Build_virt/RiscVVirtQemu/RELEASE_GCC5/FV/RISCV_VIRT.fd,if=pflash,format=raw,unit=1 \                                                                    
        -machine virt,acpi=off -smp 2 -m 2G \
        -kernel /home/song/9_linux/linux/00_rv_def/arch/riscv/boot/Image \
        -initrd /home/song/8_riscv/3_acpi/buildroot/output/images/rootfs.ext2 \
        -append "root=/dev/ram ro console=ttyS0 earlycon=uart8250,mmio,0x10000000 efi=debug loglevel=8 memblock=debug" ## also panic by memtest
```
3. Then you will encounter the kernel panic logged in the above link

Other Information:

1. -------

This report is not identical to my prior report -- "kernel paniced when system hibernates" [1], but both of them 
are closely related with the commit (3335068f8721 "riscv: Use PUD/P4D/PGD pages for the linear mapping").

With this commit, hibernation is trapped with "access fault" while accessing the PMP-protected regions (mmode_resv0@80000000) 
from OpenSbi (BTW, hibernation is marked as nonportable by Conor[2]).

In this report, efi_init handoffs the memory mapping from Boot Services to memblock where reserves mmode_resv0@80000000, 
so there is no "access fault" but "page fault".

And reverting commit 3335068f8721 indeed fixed this panic.

2. -------
   
As the gdb-pt-dump [3] tool shows, the PTE which covered the fault virtual address had the appropriate permission to store. 
Is there another way to trigger the "Store/AMO page fault"? Or the creation of linear mapping in commit 3335068f8721 did something wrong?

```
(gdb) p/x $satp
$1 = 0xa000000000081708
(gdb) pt -satp 0xa000000000081708
             Address :     Length   Permissions    
  0xff1bfffffea39000 :     0x1000 | W:1 X:0 R:1 S:1
  0xff1bfffffebf9000 :     0x1000 | W:1 X:0 R:1 S:1
  0xff1bfffffec00000 :   0x400000 | W:1 X:0 R:1 S:1
  0xff60000000000000 :   0x1c0000 | W:1 X:0 R:1 S:1
  0xff60000000200000 :   0xa00000 | W:0 X:0 R:1 S:1
  0xff60000000c00000 : 0x7f000000 | W:1 X:0 R:1 S:1  // badaddr: ff6000007fdb1000
  0xff6000007fdc0000 :    0x3d000 | W:1 X:0 R:1 S:1
  0xff6000007ffbf000 :     0x1000 | W:1 X:0 R:1 S:1
  0xffffffff80000000 :   0xc00000 | W:0 X:1 R:1 S:1
  0xffffffff80c00000 :   0xa00000 | W:1 X:0 R:1 S:1

```

3. ------
   
You can also reproduce similar panic by appending "memtest" in kernel cmdline.
I have posted the memtest boot log at this link: https://termbin.com/1twl.

Please correct me if I'm wrong.

[1]: https://lore.kernel.org/linux-riscv/CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com/
[2]: https://lore.kernel.org/linux-riscv/20230526-astride-detonator-9ae120051159@wendy/
[3]: https://github.com/martinradev/gdb-pt-dump
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
