Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4659C6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 18:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l/mkvljDT2V53R63gFnpDBvYhbIsfbYsnWASuuX9jKg=; b=Wa09kU2YxP1Yp0
	cSHFjV/HDCU1OOPTyZmQq7Fc2SGjG8l+f3rMQUL9QdVe6RCQCT+Z+wDsQ5R6W+yVoS4uUBF8c8C/p
	IvWkpYwajrP/aSBuTslnKUbVZGA2Xad4sOohqRAWndOSpTlVeEc/HQfHNHD2MtemYuo+tAv62p8Sr
	vQutZI0e11ERwo1fjUpcXZud+khcYM1Eb2rtmnXleLsN5DaqRW++x41jnahKRpdpDbyPXSNO8UimS
	liNzDcakPRE5WA7twllV7b8wRPa6PKsaJ8ctPSN09GdZEYqWVzasrxw3FchXcCuFBonZAtLqXo+Q2
	BT5hiSqAsPL8Mep08CgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiJz-005pUC-QV; Tue, 20 Sep 2022 18:50:15 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiJw-005pQh-7k
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 18:50:14 +0000
Received: by mail-wm1-x329.google.com with SMTP id d12-20020a05600c3acc00b003b4c12e47f3so2314668wms.4
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 11:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=mBOhVS+5AmDZQ1vXaz/tmCZ6rhsPVwcL735FkJnxU34=;
        b=CWTzIiv9GsktkvLu74bcLVeSUxuVuQnjlEzc7Xb6NjEVxNcsCQs8KXr0XM01BdCxsY
         SSLgJ5apgaoPcuKEgHV8yGqBP5mvuUpgi+lF6OgWZ33yenx4oeQNJaODHF0YvtLCNXQ6
         NhSIK/IJ/7NJ5dK2xn3KdNzF7YCSLVyJ/vMZb9e08hOcLziB0yesBouJlCCk1VtrNfTG
         d8CJB94d1XsAeqHr5VnllpieFar4tq5tbJUKrkoUgZWZjQsxwWmJg/hJaVcAC3T3SCnz
         JDf1HqM5BSRZQ3SKBVX/X16SgVzj+cuXRrIXp5cKoWUP/suPOTH0Q9Lfa8zGva1WhyHU
         YDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=mBOhVS+5AmDZQ1vXaz/tmCZ6rhsPVwcL735FkJnxU34=;
        b=idCUV2TsldNSklYyGvcsiOSI0r4wp6JnfbLx14mTuuGYeJZvN6zBz2bAat5OZsWGGM
         oNOE9rN5orVOQRz7uoUslocYHT8F+Ro0FXA15P3S8WtkKNMqzXA8s/IpSveMgG9rPpdb
         DM820snk1V8tXvJUOmPYijZweQr/8dyCsbN1wo/8SUTgASaGIDDvYBE6nFaJyUnAmb29
         GzQoUgDe0QwiQe++w5hO+jf4dz+g08162Ye9GEmFOml+5R+Am1LSiXIE5NQdjYI1BuXw
         fcljdFfQcr4uJj61v/bLahXW+sYqvcHj5mBIWpVQ5HUwAbLnIRhl16MGDp5xFzfc4DZV
         xrXA==
X-Gm-Message-State: ACrzQf3zaezrqMSiYtFrhUbp41/OEFZaDhNMFpPEIHQIVkhc7lYb7MY9
	ONdTy9PJh9qTay+EGbPcH64=
X-Google-Smtp-Source: AMsMyM4FJ3g8Fg1rTzFVkG/C+GJTOwYE7yfxbQaxX7io2eIVBOUCCe5YEykEPYpYKOAk/kmjHhpQCg==
X-Received: by 2002:a05:600c:524a:b0:3b4:8db0:1cc9 with SMTP id fc10-20020a05600c524a00b003b48db01cc9mr3398530wmb.202.1663699808329;
        Tue, 20 Sep 2022 11:50:08 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:e9a4:d6c9:505d:20d0])
        by smtp.gmail.com with ESMTPSA id cc4-20020a5d5c04000000b00228de351fc0sm582722wrb.38.2022.09.20.11.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 11:50:07 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Atish Patra <atishp@rivosinc.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 00/10] Add support for Renesas RZ/Five SoC
Date: Tue, 20 Sep 2022 19:48:54 +0100
Message-Id: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_115012_306295_4365E775 
X-CRM114-Status: GOOD (  14.76  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

The RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP Single)
1.0 GHz, 16-bit DDR3L/DDR4 interface. And it also has many interfaces such
as Gbit-Ether, CAN, and USB 2.0, making it ideal for applications such as
entry-class social infrastructure gateway control and industrial gateway
control.

This patch series adds initial SoC DTSi support for Renesas RZ/Five
(R9A07G043) SoC and updates the bindings for the same. Below is the list
of IP blocks added in the initial SoC DTSI which can be used to boot via
initramfs on RZ/Five SMARC EVK:
- AX45MP CPU
- CPG
- PINCTRL
- PLIC
- SCIF0
- SYSC

Useful links:
-------------
[0] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzfive-risc-v-general-purpose-microprocessors-risc-v-cpu-core-andes-ax45mp-single-10-ghz-2ch-gigabit-ethernet
[1] http://www.andestech.com/en/products-solutions/andescore-processors/riscv-ax45mp/

Patch series depends on the below (which are already in -next apart from the last one):
--------------------------------------------------
[0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220914134211.199631-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20220915165256.352843-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[2] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220919104606.96553-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v3 -> v4:
-------
* Rebased patches on -next
* Included RB tags
* Fixed review comments pointed by Conor and Geert

v3: https://lore.kernel.org/lkml/20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
v2: https://lore.kernel.org/all/20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
v1: https://lore.kernel.org/lkml/20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Below are the logs from RZ/Five SMARC EVK:
------------------------------------------
/ # uname -ra
Linux (none) 6.0.0-rc6-next-20220920-00025-gc002c40ce550-dirty #136 SMP Tue Sep 20 13:47:31 BST 2022 riscv64 GNU/Linux
/ # cat /proc/cpuinfo 
processor       : 0
hart            : 0
isa             : rv64imafdc
mmu             : sv39
uarch           : andestech,ax45mp
mvendorid       : 0x31e
marchid         : 0x8000000000008a45
mimpid          : 0x500

/ # for i in machine family soc_id revision; do echo -n "$i: ";cat /sys/devices/
soc0/$i; done
machine: Renesas SMARC EVK based on r9a07g043f01
family: RZ/Five
soc_id: r9a07g043
revision: 0
/ # 
/ # cat /proc/interrupts 
           CPU0       
  1:          0  SiFive PLIC 412 Level     1004b800.serial:rx err
  2:         33  SiFive PLIC 414 Level     1004b800.serial:rx full
  3:        919  SiFive PLIC 415 Level     1004b800.serial:tx empty
  4:          0  SiFive PLIC 413 Level     1004b800.serial:break
  5:      44106  RISC-V INTC   5 Edge      riscv-timer
  6:         62  SiFive PLIC 416 Level     1004b800.serial:rx ready
IPI0:         0  Rescheduling interrupts
IPI1:         0  Function call interrupts
IPI2:         0  CPU stop interrupts
IPI3:         0  IRQ work interrupts
IPI4:         0  Timer broadcast interrupts
/ # 
/ # cat /proc/meminfo 
MemTotal:         882308 kB
MemFree:          861440 kB
MemAvailable:     859188 kB
Buffers:               0 kB
Cached:             1796 kB
SwapCached:            0 kB
Active:                0 kB
Inactive:             84 kB
Active(anon):          0 kB
Inactive(anon):       84 kB
Active(file):          0 kB
Inactive(file):        0 kB
Unevictable:        1796 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:           120 kB
Mapped:             1200 kB
Shmem:                 0 kB
KReclaimable:       6732 kB
Slab:              12088 kB
SReclaimable:       6732 kB
SUnreclaim:         5356 kB
KernelStack:         636 kB
PageTables:           32 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:      441152 kB
Committed_AS:        592 kB
VmallocTotal:   67108864 kB
VmallocUsed:         840 kB
VmallocChunk:          0 kB
Percpu:               84 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
Hugetlb:               0 kB
/ # 

-------------------


Lad Prabhakar (10):
  dt-bindings: soc: renesas: Move renesas.yaml from arm to soc
  dt-bindings: riscv: Sort the CPU core list alphabetically
  dt-bindings: riscv: Add Andes AX45MP core to the list
  dt-bindings: soc: renesas: renesas.yaml: Document Renesas RZ/Five SoC
  riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
  riscv: dts: renesas: Add initial devicetree for Renesas RZ/Five SoC
  riscv: dts: r9a07g043: Add placeholder nodes
  riscv: dts: renesas: Add minimal DTS for Renesas RZ/Five SMARC EVK
  MAINTAINERS: Add entry for Renesas RISC-V architecture
  riscv: configs: defconfig: Enable Renesas RZ/Five SoC

 .../devicetree/bindings/riscv/cpus.yaml       |  11 +-
 .../{arm => soc/renesas}/renesas.yaml         |   5 +-
 MAINTAINERS                                   |   4 +-
 arch/riscv/Kconfig.socs                       |   5 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/renesas/Makefile          |   2 +
 arch/riscv/boot/dts/renesas/r9a07g043.dtsi    | 270 ++++++++++++++++++
 .../boot/dts/renesas/r9a07g043f01-smarc.dts   |  27 ++
 .../boot/dts/renesas/rzfive-smarc-som.dtsi    |  19 ++
 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi |  15 +
 arch/riscv/configs/defconfig                  |   3 +
 11 files changed, 353 insertions(+), 9 deletions(-)
 rename Documentation/devicetree/bindings/{arm => soc/renesas}/renesas.yaml (98%)
 create mode 100644 arch/riscv/boot/dts/renesas/Makefile
 create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043.dtsi
 create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
 create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
 create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
