Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0C0D2ED14
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PEcPr2elZ9cmhd9NiBv7TzFKwx3S3sveOCOoquQ7320=; b=ZfrI3nvIFlqtka
	vn1hq4A4w4MI9p8+ma+8RHW6FB8c8bzeulZAx13Kj5eWSxmfaD1mWMJp0zK6nbIrrm9ufBcOl7AZA
	3cddctK3xLDqKkBAytr4iDubiJPHYyyRYBiVmdiB1/NbnW+u89R57aZCZ03UFaxCwMyXyjKOYFaMB
	V66O/Ya/9qQEVH+r3lISa+oAHBWRcSlwa9/tcvj7VpuFgrtCrRxhKFgF1si9Fy+nmuOvNofAZq4qc
	csBz5zgiBILglHr1c6vo3C/CSvcTyJWW7VD+zzMHJ+uKOtUar3g8uOOlVR0fSdFlDPEZM9oxcH0wh
	u6nKf2bTU2WrCITz+d1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39s-000000039VJ-3OPc;
	Tue, 20 Jan 2026 04:16:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39F-000000039Ku-0Vib
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:15:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C72640136;
	Tue, 20 Jan 2026 04:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC191C16AAE;
	Tue, 20 Jan 2026 04:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768882517;
	bh=6sisZqiC0hHclKdH/nGj0mfmQcZPf0CcsEWodDjCCCY=;
	h=From:Subject:Date:To:Cc:From;
	b=kNbjyKf0T9l9Misi9pZK6efHgZLVu1+Nv5ROKroKCW7G1ZATgWpbjpHBou+dnUBv0
	 i92vYTEbnfiyXBoJGM4k2luPKyuUeGTDMOpyOVHhk9vWYpQzKzxVG5Me9f+Vd9dG+X
	 g4eIr+apKTE2DTDK8YlOw0DjEuiJAnK3uTyA4Px/TyygGKHvXRE1gby7kK313fPYab
	 FoPRvchLdZF1gG9nkVRcwNfxZsmIglSGvFuAb3tJlMocD5F2wgbUf6wHCyrwRYNk8d
	 46pBUzZ5lMnkQpm+nYMSwxaonWJPG9M4LFUGi3fL461UriGhRRgvdctergSfIzO2Jt
	 4IVdb/3K4QXOA==
From: Drew Fustini <fustini@kernel.org>
Subject: [PATCH RFC 00/19] RISC-V: QoS: add CBQRI resctrl interface
Date: Mon, 19 Jan 2026 20:14:37 -0800
Message-Id: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAC0Bb2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Mj3eLiwvzizBTd5KTCokxdEwPz5LTklETLtDQTJaCegqLUtMwKsHn
 RSkFuzkqxtbUAe7UY9WQAAAA=
X-Change-ID: 20260112-ssqosid-cbqri-407cfcda9ff4
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Atish Kumar Patra <atishp@rivosinc.com>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, liu.qingtao2@zte.com.cn, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Drew Fustini <fustini@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12510; i=fustini@kernel.org;
 h=from:subject:message-id; bh=6sisZqiC0hHclKdH/nGj0mfmQcZPf0CcsEWodDjCCCY=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTmMwbapWuopycckZ8adp01j1ehq/9qKOvW/6uXTOZUq
 Uq3m3Smo5SFQYyLQVZMkWXTh7wLS7xCvy6Y/2IbzBxWJpAhDFycAjARjkRGhr0M5QpHl/jejHVJ
 WJy1ucTG2nh3UdVuaelPO9OrOnis2RgZlp82SFlV2Ho8oD/otsVTvpOLFRT915x/9/OsdZaUvYk
 eHwA=
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_201524_759923_B19547C5 
X-CRM114-Status: GOOD (  34.56  )
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

This RFC series implements the RISC-V Quality-of-Service Identifiers
(Ssqosid) extension [1] which adds the srmcfg register. It also
implements the RISC-V Capacity and Bandwidth Controller QoS Register
Interface (CBQRI) specification [2] and integrates resctrl [3] support.
The patches are also available as a branch [4].

There is a Qemu patch series [5] that implements Ssqosid and CBQRI, and
a corresponding Qemu branch with those patches too [6].

[1] https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
[2] https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
[3] https://docs.kernel.org/filesystems/resctrl.html
[4] https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/log/?h=b4/ssqosid-cbqri
[5] https://lore.kernel.org/qemu-devel/20260105-riscv-ssqosid-cbqri-v4-0-9ad7671dde78@kernel.org/
[6] https://github.com/tt-fustini/qemu/tree/b4/riscv-ssqosid-cbqri

RISC-V QoS
----------
QoS (Quality of Service) in this context is concerned with shared
resources on an SoC such as cache capacity and memory bandwidth.

The Sssqosid extension defines the srmcfg CSR which configures a hart
with two identifiers:

 - Resource Control ID (RCID)
 - Monitoring Counter ID (MCID)

These identifiers accompany each request issued by the hart to shared
resource controllers. This allows the capacity and bandwidth resources
used by a software workload (e.g. a process or a set of processes) to be
controlled and monitored.

CBQRI defines operations to configure resource usage limits, in the form
of capacity or bandwidth, for an RCID. CBQRI also defines operations to
configure counters to track resource utilization per MCID. Furthermore,
the Access Type (AT) field allows resource usage to be differentiated
between data and code.

x86 comparison
--------------
The existing QoS identifiers on x86 map well:

  CLOSID (Class of Service ID) on x86 is RCID on RISC-V
    RMID (Resource Monitoring ID) on x86 is MCID on RISC-V

In addition, CDP (code data prioritization) on x86 is similar to the
AT (access type) field in CBQRI which defines code and data types.

One aspect of CBQRI that simplifies the RISC-V resctrl interface is that
any cpu (technically a hart, or hardware thread, in RISC-V terminology)
can access the memory-mapped registers of any CBQRI controller in the
system. This means it does not matter which cpu runs the resctrl code.

Example SoC
-----------
This series also includes a Qemu device tree and platform drivers for a
hypothetical SoC with a cache controller that implements CBQRI capacity
operations and a memory controller that implements CBQRI bandwidth
operations.

  - L2 cache controllers
    - Resource type: Capacity
    - Number of capacity blocks (NCBLKS): 12
    	- In the context of a set-associative cache, the number of
	  capacity blocks can be thought of as the number of ways
    - Number of access types: 2 (code and data)
    - Usage monitoring not supported
    - Capacity allocation operations: CONFIG_LIMIT, READ_LIMIT

  - Last-level cache (LLC) controller
    - Resource type: Capacity
    - Number of capacity blocks (NCBLKS): 16
    - Number of access types: 2 (code and data)
    - Usage monitoring operations: CONFIG_EVENT, READ_COUNTER
    - Event IDs supported: None, Occupancy
    - Capacity allocation ops: CONFIG_LIMIT, READ_LIMIT, FLUSH_RCID

  - Memory controllers
    - Resource type: Bandwidth
    - Number of bandwidth blocks (NBWBLKS): 1024
       - Bandwidth blocks do not have a unit but instead represent a
         portion of the total bandwidth resource. For NWBLKS of 1024,
	 each block represents about 0.1% of the bandwidth resource.
    - Maximum reserved bandwidth blocks (MRBWB): 819 (80% of NBWBLKS)
    - Number of access types: 1 (no code/data differentiation)
    - Usage monitoring operations: CONFIG_EVENT, READ_COUNTER
    - Event IDs supported: None, Total read/write byte count, Total
                           read byte count, Total write byte count
    - Bandwidth allocation operations: CONFIG_LIMIT, READ_LIMIT

The memory map for this example SoC:

  Base addr  Size
  0x4820000  4KB  Cluster 0 L2 cache controller
  0x4821000  4KB  Cluster 1 L2 cache controller
  0x4828000  4KB  Memory controller 0
  0x4829000  4KB  Memory controller 1
  0X482a000  4KB  Memory controller 2
  0X482b000  4KB  Shared LLC cache controller

This configuration is only meant to provide a "concrete" example, and it
represents just one of many possible ways that hardware can implement
the CBQRI spec.

The example SoC configuration is created with the following:

  qemu-system-riscv64 \
        -M virt \
        -nographic \
        -smp 8 \
        -device riscv.cbqri.capacity,max_mcids=256,max_rcids=64,ncblks=12,alloc_op_flush_rcid=false,mon_op_config_event=false,mon_op_read_counter=false,mon_evt_id_none=false,mon_evt_id_occupancy=false,mmio_base=0x04820000 \
        -device riscv.cbqri.capacity,max_mcids=256,max_rcids=64,ncblks=12,alloc_op_flush_rcid=false,mon_op_config_event=false,mon_op_read_counter=false,mon_evt_id_none=false,mon_evt_id_occupancy=false,mmio_base=0x04821000 \
        -device riscv.cbqri.capacity,max_mcids=256,max_rcids=64,ncblks=16,mmio_base=0x0482B000 \
        -device riscv.cbqri.bandwidth,max_mcids=256,max_rcids=64,nbwblks=1024,mrbwb=819,mmio_base=0x04828000 \
        -device riscv.cbqri.bandwidth,max_mcids=256,max_rcids=64,nbwblks=1024,mrbwb=819,mmio_base=0x04829000 \
        -device riscv.cbqri.bandwidth,max_mcids=256,max_rcids=64,nbwblks=1024,mrbwb=819,mmio_base=0x0482a000

In addition, please note that this series only implements the register
interface that CBQRI specifies. It does not attempt to emulate the
performance impact of configuring limits on shared resources like cache
and memory bandwidth. 

Versioning
----------
I chose to make this series v1 as there have been many changes from the
old proof-of-concept. However, here are previous series to make the
history clear:

 [RFC PATCH 00/21] RISC-V: QoS: add CBQRI resctrl interface
 https://lore.kernel.org/all/20230419111111.477118-1-dfustini@baylibre.com/
 The original RFC from the CBQRI proof-of-concept in 2023 that worked
 in conjunction with the Qemu patch series for the proof-of-concept.

 [PATCH v4 0/3] RISC-V: Detect Ssqosid extension and handle srmcfg CSR
 https://lore.kernel.org/all/20251007-ssqosid-v4-0-e8b57e59d812@kernel.org/
 More recently I thought it would be simpler to upstream just the
 Ssqosid patches first. However, I got feedback that it was hard to
 review without the CBQRI patches in the same series.

Open issues:
------------
 - Checkpatch false positive: there is a checkpatch warning about
   "Argument '__next' is not used in function-like macro"
   - __switch_to_srmcfg(__next) is needed to avoid the error reported
     by LKP for riscv-allnoconfig:
     https://lore.kernel.org/oe-kbuild-all/202509162355.wByessnb-lkp@intel.com/
   - __switch_to_srmcfg() will trigger a build error in clang when
     CONFIG_RISCV_ISA_SSQOSID is turned off.

 - The number of CBQRI controllers is hard coded
   - This was done as a simple approach in the proof-of-concept as there
     were 6 controllers
   - I need to refactor this so that it is dynamically allocated based
     on the number of controllers present in the system

 - Stub platform drivers are included to demonstrate device tree integration
   - I am expecting a real CBQRI-enabled hardware platform using device
     tree would have real platform drivers for controllers that
     implement CBQRI.
   - To demonstrate the interaction with the qemu model, I have included
     patches which create "stub" drivers for a cache controller and a
     generic bandwidth controller. These patches are not meant for
     upstream, so I did not create binding documentation for the
     compatibles.

 - Add RQSC table support for ACPI platforms
   - My kernel patches from the RQSC proof-of-concept were based on
     v6.14, so I need to rebase them.
   - The necessary PPTT helpers are already in 6.19 thanks to the MPAM
     driver series. This should help reduce the number of patches in my
     RQSC series.
   - My Qemu patches for RQSC will also take some work to rebase on top
     of my recent Qemu CBQRI+Ssqosid v4 series.

 - No L2 and L3 cache occupancy monitoring
   - This is not currently implemented and I have to decided to leave
     it as an enhancement for a future series after the Ssqosid and
     CBQRI core are merged.

 - No MBM (bandwidth monitoring)
   - MBA schema works ok for the CBQRI-enabled memory controllers, but
     resctrl does not currently have solution for representing MBM for
     bandwidth resources that are not associated with a L3 cache.
   - For the old CBQRI proof-of-concept RFC, two separate domains were
     created for each memory controller: one for MB (allocation) and one
     for MBM (monitoring).
   - The monitoring domains had to pretend that these memory controllers
     were L3 caches which is not the case. I have removed this as it was
     too complicated and not the right solution.
   - Fenghua Yu talked about a similar problem last month at LPC in the
     resctrl BoF during the "MBA/MBM on CPU-less Memory Node" topic:
     https://lpc.events/event/19/contributions/2093/
   - I hope to work with resctrl developers on finding a solution.

---
Drew Fustini (19):
      dt-bindings: riscv: Add Ssqosid extension description
      RISC-V: Detect the Ssqosid extension
      RISC-V: Add support for srmcfg CSR from Ssqosid ext
      RISC-V: QoS: define properties of CBQRI controllers
      RISC-V: QoS: define CBQRI capacity and bandwidth capabilities
      RISC-V: QoS: define CBQRI resctrl resources and domains
      RISC-V: QoS: define prototypes for resctrl interface
      RISC-V: QoS: add resctrl interface for CBQRI controllers
      RISC-V: QoS: expose implementation to resctrl
      RISC-V: QoS: add late_initcall to setup resctrl interface
      RISC-V: QoS: add to build when CONFIG_RISCV_ISA_SSQOSID set
      RISC-V: QoS: make CONFIG_RISCV_ISA_SSQOSID select resctrl
      dt-bindings: riscv: add riscv,cbqri bindings
      [NFU] resctrl: riscv: add CBQRI cache controller driver
      [NFU] resctrl: riscv: add CBQRI bandwidth controller driver
      [NFU] resctrl: riscv: build CBQRI drivers
      [NFU] riscv: dts: qemu: add dump from virt machine
      [NFU] riscv: dts: qemu: add CBQRI controller nodes
      [NFU] riscv: dts: build qemu dtb for CONFIG_ARCH_VIRT

 .../devicetree/bindings/riscv/extensions.yaml      |    6 +
 .../devicetree/bindings/riscv/riscv,cbqri.yaml     |   28 +
 MAINTAINERS                                        |   10 +
 arch/riscv/Kconfig                                 |   20 +
 arch/riscv/boot/dts/Makefile                       |    1 +
 arch/riscv/boot/dts/qemu/Makefile                  |    3 +
 arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts       |  458 ++++++++
 arch/riscv/include/asm/csr.h                       |    8 +
 arch/riscv/include/asm/hwcap.h                     |    1 +
 arch/riscv/include/asm/processor.h                 |    3 +
 arch/riscv/include/asm/qos.h                       |   41 +
 arch/riscv/include/asm/resctrl.h                   |    2 +
 arch/riscv/include/asm/switch_to.h                 |    3 +
 arch/riscv/kernel/Makefile                         |    2 +
 arch/riscv/kernel/cpufeature.c                     |    1 +
 arch/riscv/kernel/qos/Makefile                     |    2 +
 arch/riscv/kernel/qos/internal.h                   |  155 +++
 arch/riscv/kernel/qos/qos.c                        |   32 +
 arch/riscv/kernel/qos/qos_resctrl.c                | 1191 ++++++++++++++++++++
 drivers/resctrl/Kconfig                            |    2 +
 drivers/resctrl/Makefile                           |    2 +
 drivers/resctrl/riscv/Kconfig                      |   25 +
 drivers/resctrl/riscv/Makefile                     |    4 +
 drivers/resctrl/riscv/cbqri_bandwidth.c            |   79 ++
 drivers/resctrl/riscv/cbqri_cache.c                |  106 ++
 include/linux/riscv_qos.h                          |   78 ++
 26 files changed, 2263 insertions(+)
---
base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
change-id: 20260112-ssqosid-cbqri-407cfcda9ff4

Best regards,
-- 
Drew Fustini <fustini@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
