Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E10CD3940D
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 11:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-Type:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mDULEpsrNA5L5Ks9QTRU7X4Tj7cwyAYYAEv1QZAX3Bs=; b=i+btZ2hFxBoNbolbwK9o3rLQQr
	DIBorhn7UXV1DIHcxEDhB1/+QYUg2uj8dSIPGChDE+ylFq/nKPoC4YDd/FNYUvCqrKE0IOJd7uOZx
	7OoMrtXfb/IOaMLknuhkrJtmGTm7WlbtocyURwynkO7wjOtooTj39KWllDmYK5RhQSbYxanjzYGkt
	mlhiZW4FYkNfmy0dorPvI0E7VgyCsNHCWd89hN1Fjaqf2OWUgOsH6j54797z5bIEr0AoMhLG3L+RH
	16JlkGd8HE0nRI5eUpY3etC85lTGrCS5oyWmpIzF1JlIaOPfrBj/XikcDO94tY+2/E/kUdRtnfDgC
	ViOlsvRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Fq7-0000000HU3F-08i4;
	Thu, 02 Apr 2026 11:03:55 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Fq0-0000000HU1w-22PV
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 11:03:54 +0000
X-QQ-mid: esmtpsz21t1775127771td994b3a1
X-QQ-Originating-IP: yO+rSNzX/32Xosdy8EhNj2+g8t4NL02brshAxrJddoY=
Received: from [192.168.40.154] ( [59.174.116.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 02 Apr 2026 19:02:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12538368949216069988
EX-QQ-RecipientCnt: 7
Content-Type: multipart/mixed; boundary="------------NHfogiQoLPu2FAobpvbgZa0d"
Message-ID: <3D34B48DF08573FE+e70f68e9-59f7-4b41-bcce-3c58d4cea05b@nucleisys.com>
Date: Thu, 2 Apr 2026 19:02:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: guibing <guibing@nucleisys.com>
Subject: [BUG] riscv: Kernel panic in free_initmem when driver triggers
 modprobe
To: linux-riscv <linux-riscv@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Cc: palmer <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 =?UTF-8?B?5pa55Y2O5ZCv?= <hqfang@nucleisys.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:nucleisys.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NqlQHeD3iZu/zhA54AUHUZRSrtdirOGfeS5Qyzl0vqsrf848AxWM9071
	EbsLwlMdlrJcw1weHL3CgqS9/ZpmW2Z/0j9sh883sJBClSs6lbPDw1XWS63fvSjTI3QmnD0
	kedvbPSC5pKqqcl5wYKbOI04V2GUnfC0dX6uOTC7cZ6ZECU6vM435KBlrPHS8hh+XMydumT
	45Pii/Hw0RSmQ7zhASWMiixacWg6biVMeT4aIGmlCUU07nHG2cPC3QPQkvnhpWOMO71NNtv
	i/Ub6qJ1n8rChLDn4CsrSh4E8AAZFsSAobV95DhcC/LGjP/xLOeJjpD1mMjkQuyQ20nLxGZ
	NGqLW7t7DWaXHwfkXHxKazI9i6S2G/EBDj55S9Uv8JU9Ai3KDCNri7BavBEp7/Adx2p1eOk
	32XlslE1ll3ctQ8tWGGD6WUskhIp2X1N1NvZs86U6odKEYszaEBpTxu9gHtPDKH+LhsFIAa
	DybYkh/i5nFOLbPB2jF1ciD9yLHCr6T+ufbLD7ukFv5n+/AF39D0v6gnGjqpfdlqYH7HWNE
	YV9KceBqPK+oVhCgiDoKAl2Nn2OP42+tF+FeYP8DNWRnDbHw6ehbzAc+FWFGypqeLddceJB
	Lhe/8DpXWUSk5vyJts/c/mYubkYRXbVF32litZUnHSzg817p8ye6kJL5LmKqS+WgfMYhqPm
	U2zHDSJ19RWDnnf5w1yFgp2jRtwUJtOkRHXRa8XdAp7QJcvEQO7MMzw7Xl5VVP9ZVbAVsIc
	4G33x2BuP3rnDOusAN8GX7X6UwhibtGxDxfuK9EbWCjW2yWnXez9E2yVh+W0Q9on/M2HxWN
	np6K3Awvn9Wox0LYzmm1wh3NKES+agqQyU2/Z6u4o/YFeqJ2RJLRCSadsCOj8CAzoan4HSl
	K0izvVwGZ4qYg9fgU047CmE2VEM+juEa2/RVrHanLUmSb4/OyOgpqLeLm+jZzCsF+RzQnfS
	rRnH7TZJkyYVqAvj1g+sHY0Ec/Q4AZxhc9loo7nOEDUZLixBZ51B96GXE6U2YzaZ/YRldxt
	sIrgbiRy8AmkIepehFT319Nya5wgPT79OCi0aIJIVnPEiCKM5QzhQKBiHjOYPtK2nN2dx+b
	Q==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_040349_232447_28C8502E 
X-CRM114-Status: GOOD (  15.63  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.
--------------NHfogiQoLPu2FAobpvbgZa0d
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I encountered a kernel panic on RISC-V 32-bit (rv32) during the boot 
process, specifically inside free_initmem(). This happens when a 
built-in ethernet driver triggers a firmware request that falls back to 
calling /sbin/modprobe.

I have created a minimal dummy driver (trigger_bug) to reproduce this 
issue reliably on QEMU.

Environment
  Kernel: Linux 6.1.166
  Architecture: RISC-V 32-bit (rv32)
  Hardware: QEMU virt machine

Steps to Reproduce
1.Add the dummy driver

place trigger_bug in driver/net/ethernet/

add obj-$(CONFIG_TRIGGER_BUG) += trigger_bug/ to 
linux/drivers/net/ethernet/Makefile

add source "drivers/net/ethernet/trigger_bug/Kconfig" to 
linux/drivers/net/ethernet/Kconfig

2.Modify Device Tree

add trigger_bug dts node:

         trigger_bug: trigger-bug@50000000 {
             compatible = "trigger-bug";
             reg = <0x0 0x50000000 0x0 0x1000>;
             status = "okay";
         };

3.Run Qemu

qemu-system-riscv32 -M virt -m 256M -nographic  -kernel 
linux/arch/riscv/boot/Image -dtb qemu.dtb -initrd  initramfs.cpio.gz.lz4 
-append "console=ttyS0"

you will see the following OOPS:

[    0.907212] goldfish_rtc 101000.rtc: setting system clock to 
2026-04-02T07:59:36 UTC (1775116776)
[    0.911464] syscon-poweroff poweroff: pm_power_off already claimed 
for sbi_srst_power_off
[    0.912662] syscon-poweroff: probe of poweroff failed with error -16
[    0.914795] sdhci: Secure Digital Host Controller Interface driver
[    0.915143] sdhci: Copyright(c) Pierre Ossman
[    0.915754] sdhci-pltfm: SDHCI platform and OF driver helper
[    0.916948] usbcore: registered new interface driver usbhid
[    0.917289] usbhid: USB HID core driver
[    0.917937] riscv-pmu-sbi: SBI PMU extension is available
[    0.918940] riscv-pmu-sbi: 16 firmware and 31 hardware counters
[    0.919278] riscv-pmu-sbi: Perf sampling/filtering is not supported 
as sscof extension is not available
[    0.923904] NET: Registered PF_INET6 protocol family
[    0.933131] Segment Routing with IPv6
[    0.933519] In-situ OAM (IOAM) with IPv6
[    0.934309] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    0.938873] NET: Registered PF_PACKET protocol family
[    0.940997] 9pnet: Installing 9P2000 support
[    0.941546] Key type dns_resolver registered
[    0.956257] debug_vm_pgtable: [debug_vm_pgtable         ]: Validating 
architecture page table helpers
[    0.967011] clk: Disabling unused clocks
[    0.976583] Unable to handle kernel paging request at virtual address 
c0800000
[    0.978314] Oops [#1]
[    0.978461] Modules linked in:
[    0.978823] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.1.166 #2
[    0.979240] Hardware name: riscv-virtio,qemu (DT)
[    0.979616] epc : __memset+0x58/0xf4
[    0.979965]  ra : free_reserved_area+0x166/0x1c0
[    0.980229] epc : c0792ab0 ra : c016c33e sp : c1c43f30
[    0.980488]  gp : c18b8610 tp : c1c28000 t0 : c0800000
[    0.980744]  t1 : c0c12000 t2 : c18ba868 s0 : c1c43f50
[    0.981000]  s1 : 00000000 a0 : c0800000 a1 : cccccccc
[    0.981248]  a2 : 00001000 a3 : c0801000 a4 : 00000000
[    0.981507]  a5 : 80c00000 a6 : 00000800 a7 : 000000cc
[    0.981758]  s2 : c1121b18 s3 : 00000000 s4 : 00000000
[    0.982009]  s5 : 00000000 s6 : 00000000 s7 : 00000000
[    0.982255]  s8 : 00000000 s9 : 00000000 s10: 00000000
[    0.982506]  s11: 00000000 t3 : 00080400 t4 : c11a5b20
[    0.982763]  t5 : 000000ff t6 : c0000000
[    0.982965] status: 00000120 badaddr: c0800000 cause: 0000000f
[    0.983397] [<c0792ab0>] __memset+0x58/0xf4
[    0.983755] [<c0003f42>] free_initmem+0x74/0x82
[    0.983965] [<c079d2ea>] kernel_init+0x3a/0x106
[    0.984208] [<c0003490>] ret_from_exception+0x0/0x16
[    0.985116] ---[ end trace 0000000000000000 ]---
[    0.985683] Kernel panic - not syncing: Attempted to kill init! 
exitcode=0x0000000b
[    0.986385] ---[ end Kernel panic - not syncing: Attempted to kill 
init! exitcode=0x0000000b ]---

Cause Analysis

During kernel boot, before free_initmem() is called, if any device 
driver triggers /sbin/modprobe execution, the current process's 
mm_struct switches from init_mm to the user-space modprobe process. This 
causes a page table context switch, updating the satp (page table base 
address register).

The free_initmem() function calls set_memory_rw_nx() to modify page 
attributes to RW, non-X of the __init_begin section. but, 
set_memory_rw_nx() operates on init_mm's page tables (swapper_pg_dir). 
However, the subsequent free_initmem_default memset() that poisons the 
memory region uses satp that is the current process's mm_struct (the 
modprobe process) to translate the virtual address.

GDB Debug On Qemu

(gdb) b free_initmem
Breakpoint 7 at 0xc00022e8: free_initmem. (2 locations)
(gdb) b trigger_probe
Breakpoint 8 at 0xc079a198: file 
drivers/net/ethernet/trigger_bug/trigger_bug.c, line 9.
(gdb) c
Continuing.

Breakpoint 8, trigger_probe (pdev=0xc1cb7000)
     at drivers/net/ethernet/trigger_bug/trigger_bug.c:9
9           printk(KERN_INFO "trigger_probe request_module start...\n");
(gdb) info r satp
satp           0x80081cbe       -2146952002
(gdb) finish
Run till exit from #0  trigger_probe (pdev=0xc1cb7000)
     at drivers/net/ethernet/trigger_bug/trigger_bug.c:9
platform_probe (_dev=0xc1cb7010)
     at drivers/base/platform.c:1401
1401                    if (ret)
Value returned is $1 = 0
(gdb) info r satp
satp           0x804821b5       -2142756427
(gdb) c
Continuing.

Breakpoint 7.2, free_initmem ()
     at arch/riscv/kernel/setup.c:356
356                     set_kernel_memory(lm_alias(__init_begin), 
lm_alias(__init_end), set_memory_rw_nx);
(gdb) s
set_kernel_memory (startp=<optimized out>,
     endp=<optimized out>, set_memory=<optimized out>)
     at ./arch/riscv/include/asm/set_memory.h:27
27              return set_memory(start, num_pages);
(gdb) s
set_memory_rw_nx (addr=3229614080, numpages=1043)
     at arch/riscv/mm/pageattr.c:350
350             return __set_memory(addr, numpages, __pgprot(_PAGE_READ 
| _PAGE_WRITE),
(gdb) p /x 3229614080
$3 = 0xc0800000
(gdb) p /x __init_begin
$4 = 0xc0800000 <set_reset_devices>
(gdb) b pageattr_pmd_entry
Breakpoint 9 at 0xc0007b92: file arch/riscv/mm/pageattr.c, line 58.
(gdb) b pageattr_pte_entry
Breakpoint 10 at 0xc0007bc2: file arch/riscv/mm/pageattr.c, line 71.
(gdb) b free_initmem_default
Breakpoint 11 at 0xc00022f0: free_initmem_default. (2 locations)
(gdb) c
Continuing.

Breakpoint 9, pageattr_pmd_entry (
     pmd=0xc18bec08 <swapper_pg_dir+3080>, addr=3229614080,
     next=3233808384, walk=0xc1c43ef0)
     at arch/riscv/mm/pageattr.c:58
58              pmd_t val = READ_ONCE(*pmd);
(gdb) c
Continuing.

Breakpoint 9, pageattr_pmd_entry (
     pmd=0xc18bec0c <swapper_pg_dir+3084>, addr=3233808384,
     next=3233886208, walk=0xc1c43ef0)
     at arch/riscv/mm/pageattr.c:58
58              pmd_t val = READ_ONCE(*pmd);
(gdb) c
Continuing.

Breakpoint 11.2, free_initmem_default (poison=204)
     at ./include/linux/mm.h:2681
2681            return free_reserved_area(&__init_begin, &__init_end,
(gdb) info r satp
satp           0x804821b5       -2142756427
(gdb) monitor xp /x (0x821B5000 + 770*4)
00000000821b5c08: 0x203000eb
(gdb) si
...
(gdb) si
0xc016c336      8617                            memset(direct_map_addr, 
poison, PAGE_SIZE);
(gdb) si
0xc016c33a      8617                            memset(direct_map_addr, 
poison, PAGE_SIZE);
(gdb) info r a0 a1 a2 satp
a0             0xc0800000       -1065353216
a1             0xcc     204
a2             0x1000   4096
satp           0x804821b5       -2142756427
(gdb) monitor xp /x (0x821B5000 + 770*4)
00000000821b5c08: 0x203000eb
(gdb)

Test Cases

I have try the following cases:
1).rv32 on kernel v5.10.252, there is no problem, but not strict kernel rwx.
2).rv64 on kernel v6.1.166, there is no problem.
3).rv32 on kernel v6.6.129/v6.18.19, it seems write wrong address, 
although it not happen crash.
4).use ko to load my driver, there is no problem.

I have attached the dummy driver source code for reference. Any 
suggestions would be appreciated.

Best regards,
Matthew.Gui

--------------NHfogiQoLPu2FAobpvbgZa0d
Content-Type: application/x-gzip; name="trigger_bug.tar.gz"
Content-Disposition: attachment; filename="trigger_bug.tar.gz"
Content-Transfer-Encoding: base64

H4sIAAAAAAAAA+2X3W4aRxTHuWVfoLdHpBe45WPBLEh1XcmxCULB2DJO1aqtVgsMMMmyS4dZ
EitCsuWoTVNHUaRUcaOmclq1cb/iVJVat7aVx8gLsBhf5RUy+wEBguVUcmK1mZ9kWGZnzpz5
nzlnxpTgchkROW+Uw56XhMhISJJnmT2/8fjKL91v8RmeiBSJj8dikpiIe8RILBYd94D0shzq
x6hThQB4ygbOY618aL+j3v9HoX3xP1vQtRI+/iXa8Y/FDo1/NC458R9PSBEWeDEiJaKSB8Rj
92QEr3n8T0FufuaDYAYXkFZHwXQRaRSXMCLvQGo+E4yGxKCuqUuCszVgcSGdSiUX5NPnUoKX
7R0mHkXgo6hOoUQQkrGGaRVVfYK3gtSa4AXIKUvwIegEZqGCCAJcgiXdgIuKRoHqYNQR0Ar7
s0xU9aKhopA1bEqt66A0FKwqeRWBUgel9/qkRfsf0Z//fc+hwjHOcUT+R6MRN/9jESmaiLH8
T4hxnv+vhFNYK6hGEcG7KtaMS2E3xSrvCcNvrMwe1V5TFVrSSVUuogarIqO6aIge/lIvWa2C
VUlwAbBVFdx9WCN6HvnrlBgFCkPTwFs19jAmXBaAUSNs3AX/2eRCVk5nz8yxitRvAwj61GD1
RXZWB1bIaSgU+ljzjU3YBuyPcBg6j77u3Ftr7Xy/v7HSXt86uP3g4Lv1/TtX2hvb5qPVJ7sr
5oPV1u6dzsPV/VubEK6zLWFJZs/StdG+erO186v58G5n6yvz2kZnb6+1vdza/rm1fd38bd38
ZtOyt3nPvHv7ye5aa+8za84//2jt/NC5/6N54yYz3L76V3t5xbz2U/uLL22rg/77fZquyegS
q76sWruNAyv5l3ogrTigBkHUIBqIE0JzZGAIquqNoyPjHWWHHSSs0LtD9ZI7SMbFnnXWWFVo
ofLRJzAJTnwvQ6igV2vMgHUWTPaWE2SlyheAZsCN3cHna+bW3+Y/t2BmMQdMZ+gbZv7+bXv5
vmuvKTQnhNm5mXOZpDyTfD89nZQXp05nkn69FHjOEyZL1/3n1kxwA5HeCPdn1++QI7fN5OC+
DjgdHCmHOjiNbg/XpNPDMWu3a0oV2W2DYgheb6jrt0wVR6/hBTmmmwFLBMHZBPLQkvyDS7Ik
cOXKMLGyuaTfxy4I1o7pqZibXkjPL6bnsn7fFDQwoYaiQlcgveuEfdojhahL0M0csDxnlk66
GL6G9J//s8oFVMIqOu45jrr/W3f+3v0/IrLzPy7GEvz8fxW86P1fz58PvumfnsueSafkvv8C
xuDtZ+XFujjqPIs5HA6Hw+FwOBwOh8PhcDgcDofDOWmeAvhSZZkAKAAA
--------------NHfogiQoLPu2FAobpvbgZa0d
Content-Type: application/octet-stream; name="qemu.dtb"
Content-Disposition: attachment; filename="qemu.dtb"
Content-Transfer-Encoding: base64

0A3+7QAAErwAAAA4AAAQ0AAAACgAAAARAAAAEAAAAAAAAAHsAAAQmAAAAAAAAAAAAAAAAAAA
AAAAAAABAAAAAAAAAAMAAAAEAAAAAAAAAAIAAAADAAAABAAAAA8AAAACAAAAAwAAAA0AAAAb
cmlzY3YtdmlydGlvAAAAAAAAAAMAAAASAAAAJnJpc2N2LXZpcnRpbyxxZW11AAAAAAAAAXBv
d2Vyb2ZmAAAAAAAAAAMAAAAEAAAALAAAVVUAAAADAAAABAAAADIAAAAAAAAAAwAAAAQAAAA5
AAAABAAAAAMAAAAQAAAAG3N5c2Nvbi1wb3dlcm9mZgAAAAACAAAAAXJlYm9vdAAAAAAAAwAA
AAQAAAAsAAB3dwAAAAMAAAAEAAAAMgAAAAAAAAADAAAABAAAADkAAAAEAAAAAwAAAA4AAAAb
c3lzY29uLXJlYm9vdAAAAAAAAAIAAAABcGxhdGZvcm0tYnVzQDQwMDAwMDAAAAAAAAAAAwAA
AAQAAABAAAAAAwAAAAMAAAAQAAAAUQAAAAAAAAAABAAAAAIAAAAAAAADAAAABAAAAAAAAAAB
AAAAAwAAAAQAAAAPAAAAAQAAAAMAAAAZAAAAG3FlbXUscGxhdGZvcm0Ac2ltcGxlLWJ1cwAA
AAAAAAACAAAAAW1lbW9yeUA4MDAwMDAwMAAAAAADAAAABwAAAFhtZW1vcnkAAAAAAAMAAAAQ
AAAAZAAAAACAAAAAAAAAABAAAAAAAAACAAAAAWNwdXMAAAAAAAAAAwAAAAQAAAAAAAAAAQAA
AAMAAAAEAAAADwAAAAAAAAADAAAABAAAAGgAmJaAAAAAAWNwdUAwAAAAAAAAAwAAAAQAAAB7
AAAAAQAAAAMAAAAEAAAAWGNwdQAAAAADAAAABAAAAGQAAAAAAAAAAwAAAAUAAACDb2theQAA
AAAAAAADAAAABgAAABtyaXNjdgAAAAAAAAMAAAAEAAAAigAAAEAAAAADAAAABAAAAKAAAABA
AAAAAwAAAAQAAAC2AAAAQAAAAAMAAAC4AAAAzGkAbQBhAGYAZABjAHppYzY0YgB6aWNib20A
emljYm9wAHppY2JvegB6aWNjYW1vYQB6aWNjaWYAemljY2xzbQB6aWNjcnNlAHppY250cgB6
aWNzcgB6aWZlbmNlaQB6aWhpbnRudGwAemloaW50cGF1c2UAemlocG0AemE2NHJzAHpjYQB6
Y2YAemNkAHNzY2NwdHIAc3Njb3VudGVyZW53AHNzdHZhbGEAc3N0dmVjZABzdmFkdQAAAAAD
AAAABgAAAOFydjMyaQAAAAAAAAMAAAC3AAAA8HJ2MzJpbWFmZGNfemljNjRiX3ppY2JvbV96
aWNib3BfemljYm96X3ppY2NhbW9hX3ppY2NpZl96aWNjbHNtX3ppY2Nyc2VfemljbnRyX3pp
Y3NyX3ppZmVuY2VpX3ppaGludG50bF96aWhpbnRwYXVzZV96aWhwbV96YTY0cnNfemNhX3pj
Zl96Y2Rfc3NjY3B0cl9zc2NvdW50ZXJlbndfc3N0dmFsYV9zc3R2ZWNkX3N2YWR1AAAAAAAD
AAAACwAAAPpyaXNjdixzdjMyAAAAAAABaW50ZXJydXB0LWNvbnRyb2xsZXIAAAAAAAAAAwAA
AAQAAAEDAAAAAQAAAAMAAAAAAAABFAAAAAMAAAAPAAAAG3Jpc2N2LGNwdS1pbnRjAAAAAAAD
AAAABAAAAHsAAAACAAAAAgAAAAIAAAABY3B1LW1hcAAAAAABY2x1c3RlcjAAAAAAAAAAAWNv
cmUwAAAAAAAAAwAAAAQAAAEpAAAAAQAAAAIAAAACAAAAAgAAAAIAAAABcG11AAAAAAMAAAA8
AAABLQAAAAEAAAAB////+QAAAAIAAAAC/////AABABkAAQAZ////+AABABsAAQAb////+AAB
ACEAAQAh////+AAAAAMAAAAKAAAAG3Jpc2N2LHBtdQAAAAAAAAIAAAABZnctY2ZnQDEwMTAw
MDAwAAAAAAMAAAAAAAABSQAAAAMAAAAQAAAAZAAAAAAQEAAAAAAAAAAAABgAAAADAAAAEQAA
ABtxZW11LGZ3LWNmZy1tbWlvAAAAAAAAAAIAAAABZmxhc2hAMjAwMDAwMDAAAAAAAAMAAAAE
AAABVgAAAAQAAAADAAAAIAAAAGQAAAAAIAAAAAAAAAACAAAAAAAAACIAAAAAAAAAAgAAAAAA
AAMAAAAKAAAAG2NmaS1mbGFzaAAAAAAAAAIAAAABY2hvc2VuAAAAAAADAAAAFQAAAWEvc29j
L3NlcmlhbEAxMDAwMDAwMAAAAAAAAAADAAAAIAAAAW0yt2FzbuG2id+FfyDSzE7VDJjz/sAH
M2A351jg6TCGPwAAAAIAAAABc29jAAAAAAMAAAAEAAAAAAAAAAIAAAADAAAABAAAAA8AAAAC
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
AAAIAAAAAAAAAAAAAAAAAwAAAAMAAAAjAAAIAAAAAAAAAAAAAAAABAAAAAMAAAAgAAAQAAAA
AAAAAAAAAAAAAQAAAAMAAAAiAAAQAAAAAAAAAAAAAAAAAgAAAAMAAAAjAAAQAAAAAAAAAAAA
AAAAAwAAAAMAAAAgAAAQAAAAAAAAAAAAAAAABAAAAAMAAAAhAAAYAAAAAAAAAAAAAAAAAQAA
AAMAAAAjAAAYAAAAAAAAAAAAAAAAAgAAAAMAAAAgAAAYAAAAAAAAAAAAAAAAAwAAAAMAAAAh
AAAYAAAAAAAAAAAAAAAABAAAAAMAAAAiAAAAAwAAAFQAAABRAQAAAAAAAAAAAAAAAAAAAAMA
AAAAAAAAAAEAAAIAAAAAAAAAQAAAAAAAAABAAAAAAAAAAEAAAAADAAAAAAAAAwAAAAAAAAAD
AAAAAAAAAAEAAAAAAAAAAwAAABAAAABkAAAAADAAAAAAAAAAEAAAAAAAAAMAAAAAAAABSQAA
AAMAAAAIAAAB0QAAAAAAAAD/AAAAAwAAAAQAAAHbAAAAAAAAAAMAAAAEAAAAWHBjaQAAAAAD
AAAAFgAAABtwY2ktaG9zdC1lY2FtLWdlbmVyaWMAAAAAAAADAAAABAAAAA8AAAACAAAAAwAA
AAQAAAEDAAAAAQAAAAMAAAAEAAAAAAAAAAMAAAACAAAAAXRyaWdnZXItYnVnQDUwMDAwMDAw
AAAAAAAAAAMAAAAMAAAAG3RyaWdnZXItYnVnAAAAAAMAAAAQAAAAZAAAAABQAAAAAAAAAAAA
EAAAAAADAAAABQAAAINva2F5AAAAAAAAAAIAAAACAAAAAgAAAAkjYWRkcmVzcy1jZWxscwAj
c2l6ZS1jZWxscwBjb21wYXRpYmxlAG1vZGVsAHZhbHVlAG9mZnNldAByZWdtYXAAaW50ZXJy
dXB0LXBhcmVudAByYW5nZXMAZGV2aWNlX3R5cGUAcmVnAHRpbWViYXNlLWZyZXF1ZW5jeQBw
aGFuZGxlAHN0YXR1cwByaXNjdixjYm9wLWJsb2NrLXNpemUAcmlzY3YsY2Jvei1ibG9jay1z
aXplAHJpc2N2LGNib20tYmxvY2stc2l6ZQByaXNjdixpc2EtZXh0ZW5zaW9ucwByaXNjdixp
c2EtYmFzZQByaXNjdixpc2EAbW11LXR5cGUAI2ludGVycnVwdC1jZWxscwBpbnRlcnJ1cHQt
Y29udHJvbGxlcgBjcHUAcmlzY3YsZXZlbnQtdG8tbWhwbWNvdW50ZXJzAGRtYS1jb2hlcmVu
dABiYW5rLXdpZHRoAHN0ZG91dC1wYXRoAHJuZy1zZWVkAGludGVycnVwdHMAY2xvY2stZnJl
cXVlbmN5AHJpc2N2LG5kZXYAaW50ZXJydXB0cy1leHRlbmRlZABpbnRlcnJ1cHQtbWFwLW1h
c2sAaW50ZXJydXB0LW1hcABidXMtcmFuZ2UAbGludXgscGNpLWRvbWFpbgA=
--------------NHfogiQoLPu2FAobpvbgZa0d
Content-Type: text/plain; charset=UTF-8; name="qemu.dts"
Content-Disposition: attachment; filename="qemu.dts"
Content-Transfer-Encoding: base64

L2R0cy12MS87CgovIHsKCSNhZGRyZXNzLWNlbGxzID0gPDB4MDI+OwoJI3NpemUtY2VsbHMg
PSA8MHgwMj47Cgljb21wYXRpYmxlID0gInJpc2N2LXZpcnRpbyI7Cgltb2RlbCA9ICJyaXNj
di12aXJ0aW8scWVtdSI7CgoJcG93ZXJvZmYgewoJCXZhbHVlID0gPDB4NTU1NT47CgkJb2Zm
c2V0ID0gPDB4MDA+OwoJCXJlZ21hcCA9IDwweDA0PjsKCQljb21wYXRpYmxlID0gInN5c2Nv
bi1wb3dlcm9mZiI7Cgl9OwoKCXJlYm9vdCB7CgkJdmFsdWUgPSA8MHg3Nzc3PjsKCQlvZmZz
ZXQgPSA8MHgwMD47CgkJcmVnbWFwID0gPDB4MDQ+OwoJCWNvbXBhdGlibGUgPSAic3lzY29u
LXJlYm9vdCI7Cgl9OwoKCXBsYXRmb3JtLWJ1c0A0MDAwMDAwIHsKCQlpbnRlcnJ1cHQtcGFy
ZW50ID0gPDB4MDM+OwoJCXJhbmdlcyA9IDwweDAwIDB4MDAgMHg0MDAwMDAwIDB4MjAwMDAw
MD47CgkJI2FkZHJlc3MtY2VsbHMgPSA8MHgwMT47CgkJI3NpemUtY2VsbHMgPSA8MHgwMT47
CgkJY29tcGF0aWJsZSA9ICJxZW11LHBsYXRmb3JtXDBzaW1wbGUtYnVzIjsKCX07CgoJbWVt
b3J5QDgwMDAwMDAwIHsKCQlkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwoJCXJlZyA9IDwweDAw
IDB4ODAwMDAwMDAgMHgwMCAweDEwMDAwMDAwPjsKCX07CgoJY3B1cyB7CgkJI2FkZHJlc3Mt
Y2VsbHMgPSA8MHgwMT47CgkJI3NpemUtY2VsbHMgPSA8MHgwMD47CgkJdGltZWJhc2UtZnJl
cXVlbmN5ID0gPDB4OTg5NjgwPjsKCgkJY3B1QDAgewoJCQlwaGFuZGxlID0gPDB4MDE+OwoJ
CQlkZXZpY2VfdHlwZSA9ICJjcHUiOwoJCQlyZWcgPSA8MHgwMD47CgkJCXN0YXR1cyA9ICJv
a2F5IjsKCQkJY29tcGF0aWJsZSA9ICJyaXNjdiI7CgkJCXJpc2N2LGNib3AtYmxvY2stc2l6
ZSA9IDwweDQwPjsKCQkJcmlzY3YsY2Jvei1ibG9jay1zaXplID0gPDB4NDA+OwoJCQlyaXNj
dixjYm9tLWJsb2NrLXNpemUgPSA8MHg0MD47CgkJCXJpc2N2LGlzYS1leHRlbnNpb25zID0g
ImlcMG1cMGFcMGZcMGRcMGNcMHppYzY0YlwwemljYm9tXDB6aWNib3BcMHppY2Jvelwwemlj
Y2Ftb2FcMHppY2NpZlwwemljY2xzbVwwemljY3JzZVwwemljbnRyXDB6aWNzclwwemlmZW5j
ZWlcMHppaGludG50bFwwemloaW50cGF1c2VcMHppaHBtXDB6YTY0cnNcMHpjYVwwemNmXDB6
Y2RcMHNzY2NwdHJcMHNzY291bnRlcmVud1wwc3N0dmFsYVwwc3N0dmVjZFwwc3ZhZHUiOwoJ
CQlyaXNjdixpc2EtYmFzZSA9ICJydjMyaSI7CgkJCXJpc2N2LGlzYSA9ICJydjMyaW1hZmRj
X3ppYzY0Yl96aWNib21femljYm9wX3ppY2Jvel96aWNjYW1vYV96aWNjaWZfemljY2xzbV96
aWNjcnNlX3ppY250cl96aWNzcl96aWZlbmNlaV96aWhpbnRudGxfemloaW50cGF1c2Vfemlo
cG1femE2NHJzX3pjYV96Y2ZfemNkX3NzY2NwdHJfc3Njb3VudGVyZW53X3NzdHZhbGFfc3N0
dmVjZF9zdmFkdSI7CgkJCW1tdS10eXBlID0gInJpc2N2LHN2MzIiOwoKCQkJaW50ZXJydXB0
LWNvbnRyb2xsZXIgewoJCQkJI2ludGVycnVwdC1jZWxscyA9IDwweDAxPjsKCQkJCWludGVy
cnVwdC1jb250cm9sbGVyOwoJCQkJY29tcGF0aWJsZSA9ICJyaXNjdixjcHUtaW50YyI7CgkJ
CQlwaGFuZGxlID0gPDB4MDI+OwoJCQl9OwoJCX07CgoJCWNwdS1tYXAgewoKCQkJY2x1c3Rl
cjAgewoKCQkJCWNvcmUwIHsKCQkJCQljcHUgPSA8MHgwMT47CgkJCQl9OwoJCQl9OwoJCX07
Cgl9OwoKCXBtdSB7CgkJcmlzY3YsZXZlbnQtdG8tbWhwbWNvdW50ZXJzID0gPDB4MDEgMHgw
MSAweGZmZmZmZmY5IDB4MDIgMHgwMiAweGZmZmZmZmZjIDB4MTAwMTkgMHgxMDAxOSAweGZm
ZmZmZmY4IDB4MTAwMWIgMHgxMDAxYiAweGZmZmZmZmY4IDB4MTAwMjEgMHgxMDAyMSAweGZm
ZmZmZmY4PjsKCQljb21wYXRpYmxlID0gInJpc2N2LHBtdSI7Cgl9OwoKCWZ3LWNmZ0AxMDEw
MDAwMCB7CgkJZG1hLWNvaGVyZW50OwoJCXJlZyA9IDwweDAwIDB4MTAxMDAwMDAgMHgwMCAw
eDE4PjsKCQljb21wYXRpYmxlID0gInFlbXUsZnctY2ZnLW1taW8iOwoJfTsKCglmbGFzaEAy
MDAwMDAwMCB7CgkJYmFuay13aWR0aCA9IDwweDA0PjsKCQlyZWcgPSA8MHgwMCAweDIwMDAw
MDAwIDB4MDAgMHgyMDAwMDAwIDB4MDAgMHgyMjAwMDAwMCAweDAwIDB4MjAwMDAwMD47CgkJ
Y29tcGF0aWJsZSA9ICJjZmktZmxhc2giOwoJfTsKCgljaG9zZW4gewoJCXN0ZG91dC1wYXRo
ID0gIi9zb2Mvc2VyaWFsQDEwMDAwMDAwIjsKCQlybmctc2VlZCA9IDwweDMyYjc2MTczIDB4
NmVlMWI2ODkgMHhkZjg1N2YyMCAweGQyY2M0ZWQ1IDB4Yzk4ZjNmZSAweGMwMDczMzYwIDB4
MzdlNzU4ZTAgMHhlOTMwODYzZj47Cgl9OwoKCXNvYyB7CgkJI2FkZHJlc3MtY2VsbHMgPSA8
MHgwMj47CgkJI3NpemUtY2VsbHMgPSA8MHgwMj47CgkJY29tcGF0aWJsZSA9ICJzaW1wbGUt
YnVzIjsKCQlyYW5nZXM7CgoJCXJ0Y0AxMDEwMDAgewoJCQlpbnRlcnJ1cHRzID0gPDB4MGI+
OwoJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPDB4MDM+OwoJCQlyZWcgPSA8MHgwMCAweDEwMTAw
MCAweDAwIDB4MTAwMD47CgkJCWNvbXBhdGlibGUgPSAiZ29vZ2xlLGdvbGRmaXNoLXJ0YyI7
CgkJfTsKCgkJc2VyaWFsQDEwMDAwMDAwIHsKCQkJaW50ZXJydXB0cyA9IDwweDBhPjsKCQkJ
aW50ZXJydXB0LXBhcmVudCA9IDwweDAzPjsKCQkJY2xvY2stZnJlcXVlbmN5ID0gPDB4Mzg0
MDAwPjsKCQkJcmVnID0gPDB4MDAgMHgxMDAwMDAwMCAweDAwIDB4MTAwPjsKCQkJY29tcGF0
aWJsZSA9ICJuczE2NTUwYSI7CgkJfTsKCgkJdGVzdEAxMDAwMDAgewoJCQlwaGFuZGxlID0g
PDB4MDQ+OwoJCQlyZWcgPSA8MHgwMCAweDEwMDAwMCAweDAwIDB4MTAwMD47CgkJCWNvbXBh
dGlibGUgPSAic2lmaXZlLHRlc3QxXDBzaWZpdmUsdGVzdDBcMHN5c2NvbiI7CgkJfTsKCgkJ
dmlydGlvX21taW9AMTAwMDgwMDAgewoJCQlpbnRlcnJ1cHRzID0gPDB4MDg+OwoJCQlpbnRl
cnJ1cHQtcGFyZW50ID0gPDB4MDM+OwoJCQlyZWcgPSA8MHgwMCAweDEwMDA4MDAwIDB4MDAg
MHgxMDAwPjsKCQkJY29tcGF0aWJsZSA9ICJ2aXJ0aW8sbW1pbyI7CgkJfTsKCgkJdmlydGlv
X21taW9AMTAwMDcwMDAgewoJCQlpbnRlcnJ1cHRzID0gPDB4MDc+OwoJCQlpbnRlcnJ1cHQt
cGFyZW50ID0gPDB4MDM+OwoJCQlyZWcgPSA8MHgwMCAweDEwMDA3MDAwIDB4MDAgMHgxMDAw
PjsKCQkJY29tcGF0aWJsZSA9ICJ2aXJ0aW8sbW1pbyI7CgkJfTsKCgkJdmlydGlvX21taW9A
MTAwMDYwMDAgewoJCQlpbnRlcnJ1cHRzID0gPDB4MDY+OwoJCQlpbnRlcnJ1cHQtcGFyZW50
ID0gPDB4MDM+OwoJCQlyZWcgPSA8MHgwMCAweDEwMDA2MDAwIDB4MDAgMHgxMDAwPjsKCQkJ
Y29tcGF0aWJsZSA9ICJ2aXJ0aW8sbW1pbyI7CgkJfTsKCgkJdmlydGlvX21taW9AMTAwMDUw
MDAgewoJCQlpbnRlcnJ1cHRzID0gPDB4MDU+OwoJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPDB4
MDM+OwoJCQlyZWcgPSA8MHgwMCAweDEwMDA1MDAwIDB4MDAgMHgxMDAwPjsKCQkJY29tcGF0
aWJsZSA9ICJ2aXJ0aW8sbW1pbyI7CgkJfTsKCgkJdmlydGlvX21taW9AMTAwMDQwMDAgewoJ
CQlpbnRlcnJ1cHRzID0gPDB4MDQ+OwoJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPDB4MDM+OwoJ
CQlyZWcgPSA8MHgwMCAweDEwMDA0MDAwIDB4MDAgMHgxMDAwPjsKCQkJY29tcGF0aWJsZSA9
ICJ2aXJ0aW8sbW1pbyI7CgkJfTsKCgkJdmlydGlvX21taW9AMTAwMDMwMDAgewoJCQlpbnRl
cnJ1cHRzID0gPDB4MDM+OwoJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPDB4MDM+OwoJCQlyZWcg
PSA8MHgwMCAweDEwMDAzMDAwIDB4MDAgMHgxMDAwPjsKCQkJY29tcGF0aWJsZSA9ICJ2aXJ0
aW8sbW1pbyI7CgkJfTsKCgkJdmlydGlvX21taW9AMTAwMDIwMDAgewoJCQlpbnRlcnJ1cHRz
ID0gPDB4MDI+OwoJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPDB4MDM+OwoJCQlyZWcgPSA8MHgw
MCAweDEwMDAyMDAwIDB4MDAgMHgxMDAwPjsKCQkJY29tcGF0aWJsZSA9ICJ2aXJ0aW8sbW1p
byI7CgkJfTsKCgkJdmlydGlvX21taW9AMTAwMDEwMDAgewoJCQlpbnRlcnJ1cHRzID0gPDB4
MDE+OwoJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPDB4MDM+OwoJCQlyZWcgPSA8MHgwMCAweDEw
MDAxMDAwIDB4MDAgMHgxMDAwPjsKCQkJY29tcGF0aWJsZSA9ICJ2aXJ0aW8sbW1pbyI7CgkJ
fTsKCgkJcGxpY0BjMDAwMDAwIHsKCQkJcGhhbmRsZSA9IDwweDAzPjsKCQkJcmlzY3YsbmRl
diA9IDwweDVmPjsKCQkJcmVnID0gPDB4MDAgMHhjMDAwMDAwIDB4MDAgMHg2MDAwMDA+OwoJ
CQlpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPDB4MDIgMHgwYiAweDAyIDB4MDk+OwoJCQlpbnRl
cnJ1cHQtY29udHJvbGxlcjsKCQkJY29tcGF0aWJsZSA9ICJzaWZpdmUscGxpYy0xLjAuMFww
cmlzY3YscGxpYzAiOwoJCQkjYWRkcmVzcy1jZWxscyA9IDwweDAwPjsKCQkJI2ludGVycnVw
dC1jZWxscyA9IDwweDAxPjsKCQl9OwoKCQljbGludEAyMDAwMDAwIHsKCQkJaW50ZXJydXB0
cy1leHRlbmRlZCA9IDwweDAyIDB4MDMgMHgwMiAweDA3PjsKCQkJcmVnID0gPDB4MDAgMHgy
MDAwMDAwIDB4MDAgMHgxMDAwMD47CgkJCWNvbXBhdGlibGUgPSAic2lmaXZlLGNsaW50MFww
cmlzY3YsY2xpbnQwIjsKCQl9OwoKCQlwY2lAMzAwMDAwMDAgewoJCQlpbnRlcnJ1cHQtbWFw
LW1hc2sgPSA8MHgxODAwIDB4MDAgMHgwMCAweDA3PjsKCQkJaW50ZXJydXB0LW1hcCA9IDww
eDAwIDB4MDAgMHgwMCAweDAxIDB4MDMgMHgyMCAweDAwIDB4MDAgMHgwMCAweDAyIDB4MDMg
MHgyMSAweDAwIDB4MDAgMHgwMCAweDAzIDB4MDMgMHgyMiAweDAwIDB4MDAgMHgwMCAweDA0
IDB4MDMgMHgyMyAweDgwMCAweDAwIDB4MDAgMHgwMSAweDAzIDB4MjEgMHg4MDAgMHgwMCAw
eDAwIDB4MDIgMHgwMyAweDIyIDB4ODAwIDB4MDAgMHgwMCAweDAzIDB4MDMgMHgyMyAweDgw
MCAweDAwIDB4MDAgMHgwNCAweDAzIDB4MjAgMHgxMDAwIDB4MDAgMHgwMCAweDAxIDB4MDMg
MHgyMiAweDEwMDAgMHgwMCAweDAwIDB4MDIgMHgwMyAweDIzIDB4MTAwMCAweDAwIDB4MDAg
MHgwMyAweDAzIDB4MjAgMHgxMDAwIDB4MDAgMHgwMCAweDA0IDB4MDMgMHgyMSAweDE4MDAg
MHgwMCAweDAwIDB4MDEgMHgwMyAweDIzIDB4MTgwMCAweDAwIDB4MDAgMHgwMiAweDAzIDB4
MjAgMHgxODAwIDB4MDAgMHgwMCAweDAzIDB4MDMgMHgyMSAweDE4MDAgMHgwMCAweDAwIDB4
MDQgMHgwMyAweDIyPjsKCQkJcmFuZ2VzID0gPDB4MTAwMDAwMCAweDAwIDB4MDAgMHgwMCAw
eDMwMDAwMDAgMHgwMCAweDEwMDAwIDB4MjAwMDAwMCAweDAwIDB4NDAwMDAwMDAgMHgwMCAw
eDQwMDAwMDAwIDB4MDAgMHg0MDAwMDAwMCAweDMwMDAwMDAgMHgwMyAweDAwIDB4MDMgMHgw
MCAweDAxIDB4MDA+OwoJCQlyZWcgPSA8MHgwMCAweDMwMDAwMDAwIDB4MDAgMHgxMDAwMDAw
MD47CgkJCWRtYS1jb2hlcmVudDsKCQkJYnVzLXJhbmdlID0gPDB4MDAgMHhmZj47CgkJCWxp
bnV4LHBjaS1kb21haW4gPSA8MHgwMD47CgkJCWRldmljZV90eXBlID0gInBjaSI7CgkJCWNv
bXBhdGlibGUgPSAicGNpLWhvc3QtZWNhbS1nZW5lcmljIjsKCQkJI3NpemUtY2VsbHMgPSA8
MHgwMj47CgkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8MHgwMT47CgkJCSNhZGRyZXNzLWNlbGxz
ID0gPDB4MDM+OwoJCX07CgogICAgICAgIHRyaWdnZXJfYnVnOiB0cmlnZ2VyLWJ1Z0A1MDAw
MDAwMCB7CiAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidHJpZ2dlci1idWciOwogICAgICAg
ICAgICByZWcgPSA8MHgwIDB4NTAwMDAwMDAgMHgwIDB4MTAwMD47CiAgICAgICAgICAgIHN0
YXR1cyA9ICJva2F5IjsKICAgICAgICB9OwoJfTsKfTsK

--------------NHfogiQoLPu2FAobpvbgZa0d
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--------------NHfogiQoLPu2FAobpvbgZa0d--

