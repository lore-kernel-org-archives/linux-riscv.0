Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B295C6FA86
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 18:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yfutMMKSTj1CJSYJ5fI4zjk/xzl8dWI5FJnYXkQzqec=; b=tSvf0beAPEONdL
	W9I8Q3ADSp26Io5wqpsX1UZ5Miz2dAINlJtrGv/fhSL/GsJlW0mEf8Mi6zNyZtq/04vaYBoqjLY4G
	RHJDudUR19AaDIxl8whUZB/SoH0KFokCvAAK8vFpntiycQYqGvSRq7KfoBcnEcqN4CxnOmKbbD4Oc
	kbgp0y2l07ZFgDUReccbBg+L25eGMfiU17yBTUyJD0IUsRaWyvRymes6sVJdjE05KTebbZBITQQC5
	EvV0pW4u0qm0Q1imFtaJF1H5i/XxFhcGIliZ2YcVhGhfIYSMRehMB2mLg6sbWc2+B1g1CR7Gh/SYz
	zlc2ZmwvxCowCNu3xing==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtQZ-00FU6M-1L; Thu, 15 Sep 2022 18:17:31 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtQW-00FU2d-Fx
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 18:17:30 +0000
Received: by mail-wr1-x42e.google.com with SMTP id h8so25147951wrf.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 11:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=leABp5dxBF86jRRL8C7lYXNCQh2iHxzm/rbyCLJ37f8=;
        b=ZIszAlAmfuoIBxkrUf/JOjKU8aD9wJQPuOlp9udFrtnYluf3hAuavgakf0YbU/Oxo8
         VI3G0kg1wYU6VgIweo2Sx18qssSpkMbm3nHhXsLBQtnXn2KcbvgMJucncJXKh0GI3PoS
         cuhEgth/Y8GpoGlaSKOi+9qwKWqfs4JulpjgpLzEwbc+YJPEj/8LWfsonWI3CKy/mAAe
         fth3DO1yhqjPHmw/ZLiQDBy3Q2e6n7ov8zayY9NMEb10PRlA+FN8/SbnrVeNliK4DpTm
         vz591pf9ZrKPrwtRJrUxPc+ZEuyMHQWTr7gYoFIAGtLZ8LuchI1OTmuNGdCdl+vGuwTb
         cSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=leABp5dxBF86jRRL8C7lYXNCQh2iHxzm/rbyCLJ37f8=;
        b=zIT8AL9jJgPGJdUUtvTnkiRVKtTpyA3eWu4Ycqef/dzhMsicssN13jQW+1MrmU3mJW
         1PFZ8FpIyWMFIi4JDrWPgAYUUU5voGfclk44bUTtzdp5xBru40e9hRoeFphk/KNbfn90
         2NiJZbdPSCXUeKaICk8Qh9IT242iZeYFNcArfeChmfNmA+1Mr8pWcozdKMnt7o/ALAGB
         ncZHjW7zcVpI/zq2kc4AGYFXnZEK22POYCsg2oJUyU3mu5dS4tM3fArk3U4rATqZUVw8
         KngU/zq1ZNd/CBCUtQGI6kfjc44s76rOsZle9MNerqKlrETP5ZDgb/X4lsOfKrVhOef0
         nCmw==
X-Gm-Message-State: ACrzQf1CIZfrLEWez3qqq8jvgUgblaZvSvG7SXJ/k/jNEWsImrTF93TK
	sJEUDTEXRMV4Da0TKalK8uk=
X-Google-Smtp-Source: AMsMyM6R/1FlXSTZ6NAwAo0wfIgogWFuTsDNrmpkpfkvSyqrn6clLDTw+IuBNwWor8/JYj76jPKsDw==
X-Received: by 2002:adf:edc9:0:b0:228:60de:1d4b with SMTP id v9-20020adfedc9000000b0022860de1d4bmr630578wro.306.1663265843758;
        Thu, 15 Sep 2022 11:17:23 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:d411:a48b:4035:3d98])
        by smtp.gmail.com with ESMTPSA id c11-20020a05600c0a4b00b003b47e8a5d22sm4243151wmq.23.2022.09.15.11.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 11:17:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Atish Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 00/10] Add support for Renesas RZ/Five SoC
Date: Thu, 15 Sep 2022 19:15:48 +0100
Message-Id: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_111728_582846_4A57FCFF 
X-CRM114-Status: GOOD (  14.49  )
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

Patch series depends on:
-----------------------
[0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220914134211.199631-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20220915165256.352843-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v2->v3:
-------
* Re-used RZ/G2UL SMARC EVK SoM and carrier DTSI
* Included RB tags
* Rebased patches on -next

v2: https://lore.kernel.org/all/20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
v1: https://lore.kernel.org/lkml/20220726180623.1668-5-prabhakar.mahadev-lad.rj@bp.renesas.com/

Below are the logs from RZ/Five SMARC EVK:
------------------------------------------
/ # uname -ra                                                                
Linux (none) 6.0.0-rc5-next-20220915-00016-g0f0153102a13 #121 SMP Thu Sep 15 16:54:44 BST 2022 riscv64 GNU/Linux
/ # cat /proc/cpuinfo 
processor       : 0
hart            : 0
isa             : rv64imafdc
mmu             : sv39
uarch           : andestech,ax45mp
mvendorid       : 0x31e
marchid         : 0x8000000000008a45
mimpid          : 0x500

/ # cat /proc/interrupts 
           CPU0       
  1:          0  SiFive PLIC 412 Level     1004b800.serial:rx err
  2:          0  SiFive PLIC 414 Level     1004b800.serial:rx full
  3:        178  SiFive PLIC 415 Level     1004b800.serial:tx empty
  4:          0  SiFive PLIC 413 Level     1004b800.serial:break
  5:    1879569  RISC-V INTC   5 Edge      riscv-timer
  6:         37  SiFive PLIC 416 Level     1004b800.serial:rx ready
IPI0:         0  Rescheduling interrupts
IPI1:         0  Function call interrupts
IPI2:         0  CPU stop interrupts
IPI3:         0  IRQ work interrupts
IPI4:         0  Timer broadcast interrupts
/ # cat /proc/meminfo 
MemTotal:         882356 kB
MemFree:          861740 kB
MemAvailable:     859488 kB
Buffers:               0 kB
Cached:             1796 kB
SwapCached:            0 kB
Active:                0 kB
Inactive:             80 kB
Active(anon):          0 kB
Inactive(anon):       80 kB
Active(file):          0 kB
Inactive(file):        0 kB
Unevictable:        1796 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:           116 kB
Mapped:             1136 kB
Shmem:                 0 kB
KReclaimable:       6732 kB
Slab:              11932 kB
SReclaimable:       6732 kB
SUnreclaim:         5200 kB
KernelStack:         540 kB
PageTables:           32 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:      441176 kB
Committed_AS:        592 kB
VmallocTotal:   67108864 kB
VmallocUsed:         760 kB
VmallocChunk:          0 kB
Percpu:               84 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
Hugetlb:               0 kB
/ # 

Cheers,
Prabhakar

Lad Prabhakar (10):
  dt-bindings: soc: renesas: Move renesas.yaml from arm to soc
  dt-bindings: riscv: Sort the CPU core list alphabetically
  dt-bindings: riscv: Add Andes AX45MP core to the list
  dt-bindings: soc: renesas: renesas.yaml: Document Renesas RZ/Five SoC
  RISC-V: Kconfig.socs: Add Renesas RZ/Five SoC kconfig option
  riscv: dts: renesas: Add initial devicetree for Renesas RZ/Five SoC
  riscv: boot: dts: r9a07g043: Add placeholder nodes
  riscv: dts: renesas: Add minimal DTS for Renesas RZ/Five SMARC EVK
  MAINTAINERS: Add entry for Renesas RISC-V architecture
  RISC-V: configs: defconfig: Enable Renesas RZ/Five SoC

 .../devicetree/bindings/riscv/cpus.yaml       |  11 +-
 .../{arm => soc/renesas}/renesas.yaml         |   3 +-
 MAINTAINERS                                   |   4 +-
 arch/riscv/Kconfig.socs                       |  14 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/renesas/Makefile          |   2 +
 arch/riscv/boot/dts/renesas/r9a07g043.dtsi    | 297 ++++++++++++++++++
 .../boot/dts/renesas/r9a07g043f01-smarc.dts   |  27 ++
 .../boot/dts/renesas/rzfive-smarc-som.dtsi    |  42 +++
 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi |  56 ++++
 arch/riscv/configs/defconfig                  |   2 +
 11 files changed, 451 insertions(+), 8 deletions(-)
 rename Documentation/devicetree/bindings/{arm => soc/renesas}/renesas.yaml (99%)
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
