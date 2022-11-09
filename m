Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4007C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 19:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Q8AC53B9A99cBj1OQR5j+Ibhsbl5KYbF75VuHrPm03s=; b=iXxMMKTNuYfte5MBaAGZLDKdOF
	4e6sX7jYj1KICvBGCl2N9uKBtBtYK6lQWhvjqFEG1hGwNYffYkx+0rZSObJGY1mowt5A43IFstOaO
	W3R+VAMBthyEElTkO3W98p/ml505Q8SfwX7aVAmdJ5PKoqcQ7z94CwQZKtBahFwDHju3CyP+0VHZU
	EF7Sxn7JqxEkipKjkJSa9tmZHpJ9rSX2XnmQiboW4P5jINmdfslXUdevqWTJIMrB6LVs40dBDtYf0
	mw/mgTgbUkskqcj2K1ZkRpV01TWjcY4yg7r3hwqF8U4ka5sL6Skb4uXSMA9SNXaa/pe1k9XTycqhq
	h+msc3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osrAa-00Gnno-8n; Wed, 09 Nov 2022 19:55:32 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osrAW-00GnlF-1m
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 19:55:30 +0000
Received: by mail-pg1-x534.google.com with SMTP id h193so17093398pgc.10
        for <linux-riscv@lists.infradead.org>; Wed, 09 Nov 2022 11:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lhu0AaXEHpohB57ir2dSQXl6jTPxnwC4FKWIfCDgyuQ=;
        b=KLrj/KYNV8XkhPS1iVxKu/aPMmyU1eZXY/F92davxqF98lFJkaDajitQpvLL4vIrUZ
         RU7h9cdLzbmNLn0L1qXfQRwCmi310yFjxach5EiNriUwsj4QY8tSCN87JHeXJyddsuys
         72M/pHU11niJlVMdwR5BejriAj5tTWIKSL3Zum9Kr5LjGnYIBB+KYcP7u+2Q/hzO4Ovc
         tU1U6kuUmaW/d49VLzRNA0NrCOBTKDlZUJ48t/FF5HX9jTARqKnEoZUIP0SBy4fffs1f
         QNQtfiVfaubbqysdwv5B8gG1PQb5SEDi45P+WAnFZXNK62PytNrCB9DDZsJJ9qdrmxMB
         hRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lhu0AaXEHpohB57ir2dSQXl6jTPxnwC4FKWIfCDgyuQ=;
        b=BSTRUldu4N1Lx9y0oSQBxqM9MxNT5pplzQCUXXj5bFUz1jD7idFtzeTnuozdLg7qs+
         S4S1/E2d/zUInRV7S8t5kdR69EvArEL5bidWhJff0QMeaaj80UGbTxkcx7GBW9GeNvKq
         q+Fnvat3bXo6jztwfPxyEmJDq1M7ToeCaCItmqvsGyogKMvwcvSIGeFhfURpsGD2Cjkt
         UsmTEGpCXpvtwYZxLims+gOuxEezEQeQsog4ucz2rDMm3GSEHTiQOu/BokBxQv1r+eUE
         sSVN1yaCAtZClmtZYdx7o4RGEKk3nfJKqVlyltEyFWSM/eeHAIfenZmGOHU1n4Tm0ImI
         ImCg==
X-Gm-Message-State: ACrzQf15huNZsuSzpb3fmtT+uPGM6zmKj8Q6ON5xQ0jfvX5SSXbEBkxS
	Mshi+kk6voK+mjhYTnjta14aIw==
X-Google-Smtp-Source: AMsMyM4yxxTSRBnPGND+4E6OHwiGrFVk5cgGXo5F+I0YpXul+RM44cAyB0NLsjogLjCA7A1w6czz7Q==
X-Received: by 2002:a05:6a00:1482:b0:56c:6a9c:3d7 with SMTP id v2-20020a056a00148200b0056c6a9c03d7mr62529169pfu.0.1668023725592;
        Wed, 09 Nov 2022 11:55:25 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d14-20020a170902654e00b00172f6726d8esm9466969pln.277.2022.11.09.11.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 11:55:24 -0800 (PST)
Date: Wed, 09 Nov 2022 11:55:24 -0800 (PST)
X-Google-Original-Date: Wed, 09 Nov 2022 11:55:21 PST (-0800)
Subject: Re: [PATCH v5 0/7] Add support for Renesas RZ/Five SoC
In-Reply-To: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  heiko@sntech.de, Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org,
  anup@brainfault.org, Atish Patra <atishp@rivosinc.com>, heinrich.schuchardt@canonical.com,
  devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-renesas-soc@vger.kernel.org, prabhakar.csengg@gmail.com, biju.das.jz@bp.renesas.com,
  prabhakar.mahadev-lad.rj@bp.renesas.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: prabhakar.csengg@gmail.com
Message-ID: <mhng-563fb6cf-4505-4137-8da1-13f631e1c74f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_115528_355423_6E1EE15F 
X-CRM114-Status: GOOD (  24.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 28 Oct 2022 09:59:14 PDT (-0700), prabhakar.csengg@gmail.com wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi All,
>
> The RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP Single)
> 1.0 GHz, 16-bit DDR3L/DDR4 interface. And it also has many interfaces such
> as Gbit-Ether, CAN, and USB 2.0, making it ideal for applications such as
> entry-class social infrastructure gateway control and industrial gateway
> control.
>
> This patch series adds initial SoC DTSi support for Renesas RZ/Five
> (R9A07G043) SoC. Below is the list of IP blocks enabled in the initial
> board DTS which can be used to boot via initramfs on RZ/Five SMARC EVK:
> - AX45MP CPU
> - CPG
> - PINCTRL
> - PLIC
> - SCIF0
> - SYSC
>
> Useful links:
> -------------
> [0] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzfive-risc-v-general-purpose-microprocessors-risc-v-cpu-core-andes-ax45mp-single-10-ghz-2ch-gigabit-ethernet
> [1] http://www.andestech.com/en/products-solutions/andescore-processors/riscv-ax45mp/
>
> Patch series depends on the below patches (which are queued in the Renesas tree for v6.2):
> ------------------------------------------------------------------------------------
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/commit/?h=renesas-dt-bindings-for-v6.2&id=c27ce08b806d606cd5cd0e8252d1ed2b729b5b55
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/commit/?h=renesas-dt-bindings-for-v6.2&id=7dd1d57c052e88f98b9e9145461b13bca019d108
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/commit/?h=renesas-arm-soc-for-v6.2&id=b3acbca3c80e612478b354e43c1480c3fc15873e
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/commit/?h=renesas-arm-dt-for-v6.2&id=49669da644cf000eb79dbede55bd04acf3f2f0a0
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/commit/?h=renesas-arm-dt-for-v6.2&id=b9a0be2054964026aa58966ce9724b672f210835
>
> v4 -> v5:
> ---------
> * Rebased patches on -next
> * Included RB tags
> * Dropped patches #1 and #4 (form v4) as they are queued up by Renesas trees
> * Patch #7 from v4 was not needed anymore so dropped it
> * Patches #4 and #5 are new
>
> v4: https://lore.kernel.org/all/20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> v3: https://lore.kernel.org/lkml/20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> v2: https://lore.kernel.org/all/20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> v1: https://lore.kernel.org/lkml/20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>
> Below are the logs from RZ/Five SMARC EVK:
> ------------------------------------------
>
> / # uname -ra;
> Linux (none) 6.1.0-rc2-00036-gbad82a074f62 #145 SMP Fri Oct 28 17:18:41 BST 2022 riscv64 GNU/Linux
> / # cat /proc/cpuinfo;
> processor       : 0
> hart            : 0
> isa             : rv64imafdc
> mmu             : sv39
> uarch           : andestech,ax45mp
> mvendorid       : 0x31e
> marchid         : 0x8000000000008a45
> mimpid          : 0x500
>
> / # for i in machine family soc_id revision; do echo -n "$i: ";cat /sys/devices/
> soc0/$i; done
> machine: Renesas SMARC EVK based on r9a07g043f01
> family: RZ/Five
> soc_id: r9a07g043
> revision: 0
> / #
> / # cat /proc/interrupts
>            CPU0
>   1:          0  SiFive PLIC 412 Level     1004b800.serial:rx err
>   2:         16  SiFive PLIC 414 Level     1004b800.serial:rx full
>   3:        402  SiFive PLIC 415 Level     1004b800.serial:tx empty
>   4:          0  SiFive PLIC 413 Level     1004b800.serial:break
>   5:      41826  RISC-V INTC   5 Edge      riscv-timer
>   6:         10  SiFive PLIC 416 Level     1004b800.serial:rx ready
> IPI0:         0  Rescheduling interrupts
> IPI1:         0  Function call interrupts
> IPI2:         0  CPU stop interrupts
> IPI3:         0  IRQ work interrupts
> IPI4:         0  Timer broadcast interrupts
> / #
> / # cat /proc/meminfo
> MemTotal:         882252 kB
> MemFree:          860848 kB
> MemAvailable:     858608 kB
> Buffers:               0 kB
> Cached:             1796 kB
> SwapCached:            0 kB
> Active:                0 kB
> Inactive:             72 kB
> Active(anon):          0 kB
> Inactive(anon):       72 kB
> Active(file):          0 kB
> Inactive(file):        0 kB
> Unevictable:        1796 kB
> Mlocked:               0 kB
> SwapTotal:             0 kB
> SwapFree:              0 kB
> Dirty:                 0 kB
> Writeback:             0 kB
> AnonPages:           108 kB
> Mapped:             1200 kB
> Shmem:                 0 kB
> KReclaimable:       6760 kB
> Slab:              12360 kB
> SReclaimable:       6760 kB
> SUnreclaim:         5600 kB
> KernelStack:         620 kB
> PageTables:           32 kB
> SecPageTables:         0 kB
> NFS_Unstable:          0 kB
> Bounce:                0 kB
> WritebackTmp:          0 kB
> CommitLimit:      441124 kB
> Committed_AS:        592 kB
> VmallocTotal:   67108864 kB
> VmallocUsed:        1132 kB
> VmallocChunk:          0 kB
> Percpu:               84 kB
> HugePages_Total:       0
> HugePages_Free:        0
> HugePages_Rsvd:        0
> HugePages_Surp:        0
> Hugepagesize:       2048 kB
> Hugetlb:               0 kB
> / #
> / #
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (7):
>   dt-bindings: riscv: Sort the CPU core list alphabetically
>   dt-bindings: riscv: Add Andes AX45MP core to the list
>   riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
>   riscv: dts: renesas: Add initial devicetree for Renesas RZ/Five SoC
>   riscv: dts: renesas: Add minimal DTS for Renesas RZ/Five SMARC EVK
>   MAINTAINERS: Add entry for Renesas RISC-V
>   riscv: configs: defconfig: Enable Renesas RZ/Five SoC
>
>  .../devicetree/bindings/riscv/cpus.yaml       | 11 ++-
>  MAINTAINERS                                   |  3 +-
>  arch/riscv/Kconfig.socs                       |  5 +
>  arch/riscv/boot/dts/Makefile                  |  1 +
>  arch/riscv/boot/dts/renesas/Makefile          |  2 +
>  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi   | 57 ++++++++++++
>  .../boot/dts/renesas/r9a07g043f01-smarc.dts   | 27 ++++++
>  .../boot/dts/renesas/rzfive-smarc-som.dtsi    | 58 ++++++++++++
>  arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi | 91 +++++++++++++++++++
>  arch/riscv/configs/defconfig                  |  3 +
>  10 files changed, 252 insertions(+), 6 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/renesas/Makefile
>  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
>  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
>  create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
>  create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi

Geert was mentioning taking these though one of his trees, that works 
for me so

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Happy to do a shared tag or whatever, but I think we can just skip that 
here.  The only conflicts would be defconfig and Kconfig.socs, but I 
don't think anything big is in the works for either -- unless Conor was 
planning on re-spinning that Kconfig.socs rework?

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
