Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0245FCDB479
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 01:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pCMtelcAjFh1FFCblXv3G68t06IwRkwkczVqBNmRIes=; b=A2yRE4Vf8xY7Nm
	D5PHRysAKwyXbGcNYVODqmABuXhKltVc6n/LKKCzPmiSIV3Nx/JrQDcGNENBn0jeKLidcc6abyp9H
	taP7qUG+SJ190VDLK0ZPaaIsQaDBd5gAN50xw04NBskmsWlIe1x1Lm0Lv2QKk0V5BtXQ3mMi/ua3b
	RIlJkDCpMlFrlcfxLGf1oQD3hXcVkYVTcyLTwU15ZIeS94PwMCxHZUaIkYhv/NFdkC3JFqZ/XFoKV
	MBCofPn+iLe795SX1i1TquvFcht4ADvHKUN3/Xcw0Wb5I2Mfwu8SyJP/v5u1Cy3Ugbag636Wy44rL
	pqw/+wlEsI7mnW1JLgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcZ5D-00000008WL1-0uW7;
	Thu, 25 Jun 2026 01:40:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcZ5C-00000008WKu-25cs
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 01:40:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD39260018;
	Thu, 25 Jun 2026 01:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8161F000E9;
	Thu, 25 Jun 2026 01:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782351644;
	bh=viup3qVydYsBij9c3PAbPfpI7+NcZfIzNda/PtjvMwc=;
	h=From:Subject:Date:To:Cc;
	b=QVD/eUd20dfdy+g6W64RZmYZv0kpvGyEukHaHpcLgLg/g1JvqCZLLg37RDCgxnQYJ
	 3KdQVbkpT9fYERGnvFG0zMSFOBPJdoM30Pcd2LvldBdldKQf4O2POXLv2gXAdIjm/n
	 lqjYOQoWIeYRZd0jT7Zu784ijZyikvQVk1d1xbpJPHXZk+wbkYGHfPFwLgxq+ORP0j
	 k9mMWqqg2MoTqCA4oC3DEq7DZ6wPclWzitGHCAau9XXIY/DtWGF9gJUcSJGEC0IRn8
	 Kg1s3egC5vsBIkNujjBfxf4xuWqmz7ffmkODcHcF4oDXSketNoUkLIPqTl04buMrRM
	 f1+RWX2fxdBqg==
From: Drew Fustini <fustini@kernel.org>
Subject: [PATCH v2 0/8] riscv: Add Ssqosid and initial CBQRI resctrl
 support
Date: Wed, 24 Jun 2026 18:38:28 -0700
Message-Id: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJSGPGoC/3WNQQ6CMBBFr0K6dkxbDRVX3sOwKO0Ao6TotBAN4
 e4CxqXLl/z/3iQiMmEU52wSjCNF6sMCepcJ19rQIJBfWGipc5krCb4eYqJAYFMH0YGrnkzgExy
 VdCfURinvxXJ/MNb02tTX8stxqG7o0upbFy3F1PN7a49q3f0yxf/MqEACmsIaow+1reTljhyw2
 /fciHKe5w8kP7Vr0wAAAA==
X-Change-ID: 20260610-dfustini-atl-sc-cbqri-dt-410c8e2711dd
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
 guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Newman <peternewman@google.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Tony Luck <tony.luck@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, 
 Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5991; i=fustini@kernel.org;
 h=from:subject:message-id; bh=mS8sd4fSMPsk+u+fJ5JE6wIXGOfsPvHhpbFRyArZ3m4=;
 b=owGbwMvMwCF2+43O4ZsaG3kYT6slMWTZtEs5Lz/ptO7iZ46qFc17rm9QdeDbfD5Dal6ubqWoW
 XbHPo3pHaUsDGIcDLJiiiybPuRdWOIV+nXB/BfbYOawMoEMYeDiFICJHDnA8L9Ic8vvfeZ3L64Q
 SVLe055jspdp/iSWgM/R3Sd+SbxM8z/IyDDX7v+T6efmzfETmrZpVuvGqozMmZov7u2ZdIcr/OG
 0RZO5AQ==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
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

This series adds initial RISC-V QoS support: the Ssqosid extension [1]
(srmcfg CSR), the CBQRI controller interface [2] integrated with resctrl
[3], and a DT-based platform driver for cache controllers. It has been
tested on both the Tenstorrent Ascalon Shared Cache controller and a QEMU
implementation [4].

  qemu-system-riscv64 -M virt,aia=aplic-imsic -nographic -m 1G -smp 8 \
      -kernel arch/riscv/boot/Image \
      -append "root=/dev/vda ro console=ttyS0 rootwait" \
      -drive if=none,file=rootfs.ext2,format=raw,id=hd0 \
      -device virtio-blk-device,drive=hd0 \
      -device riscv.cbqri.capacity,max_mcids=256,max_rcids=64,ncblks=16,mmio_base=0x04820000

Cache allocation can be exercised on the booted system. Mount resctrl
and read the default schemata. The L2 controller has 16 capacity
blocks, so the default capacity bitmask (CBM) is 0xffff:

  # mount -t resctrl resctrl /sys/fs/resctrl
  # cat /sys/fs/resctrl/schemata
  L2:0=ffff

Write a narrower CBM to a new control group and read it back to confirm
the L2 controller applied it:

  # mkdir /sys/fs/resctrl/group0
  # echo "L2:0=ff" > /sys/fs/resctrl/group0/schemata
  # cat /sys/fs/resctrl/group0/schemata
  L2:0=ff

Note that this series only implements support for resctrl L2 and L3
cache resources using CBQRI capacity allocation control. cc_block_mask
maps onto resctrl's existing cbm schema. However, cc_cunits is not
supported as there is no existing equivalent for capacity units in the
resctrl schemata.

I had previously been iterating on an RFC series [5] that did a full
implementation of CBQRI including capacity monitoring, bandwidth
allocation and monitoring. The bandwidth controls for CBQRI do not fit
well into resctrl's existing throttle-based MB schemata. I believe that
the path forward is Reinette's generic schema description proof of
concept [6]. My plan is to rebase the full support of CBQRI onto the
generic schema once it is ready.

This series is based on the linux-next tag next-20260623.

[1] https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
[2] https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
[3] https://docs.kernel.org/filesystems/resctrl.html
[4] https://github.com/tt-fustini/qemu/tree/riscv-cbqri-cache
[5] https://lore.kernel.org/linux-riscv/20260601-ssqosid-cbqri-rqsc-v7-0-v6-16-baf00f50028a@kernel.org/
[6] https://lore.kernel.org/all/aab804b9-e8b5-40ad-a85b-af7033391243@intel.com/

Changes in v2:
--------------
The changes in this revision address the Sashiko review of v1.

- Restore the srmcfg CSR for the current task on CPU_PM_EXIT and
  CPU_PM_ENTER_FAILED, so it is not left configured incorrectly until
  the next context switch.

- Serialize the cbqri_controllers list insert and the boot time walk
  with a mutex, so an asynchronous driver probe cannot corrupt the list.

- Skip a controller at an unsupported cache level instead of aborting
  resctrl setup, so valid L2 and L3 controllers still register.

- RISCV_ISA_SSQOSID selects ARCH_HAS_CPU_RESCTRL and RISCV_CBQRI
  together, so no intermediate commit enables RESCTRL_FS without the
  CBQRI resctrl glue.

- Rename the RISCV_CBQRI_DRIVER to RISCV_CBQRI, since it builds the
  CBQRI core ops and resctrl integration rather than a driver.

- Drop the RISCV_CBQRI_DRIVER_DEBUG Kconfig option and rely on dynamic
  debug to control the pr_debug() output.

- Note: Sashiko flagged the lack of suspend/resume state restore. I will
  not fix that as register state is only lost when the power domain is
  gated, which offlines the harts sharing the cache. resctrl reprograms
  the default capacity mask through the normal control domain online
  path on resume.

Link to v1:
https://lore.kernel.org/all/20260619-dfustini-atl-sc-cbqri-dt-v1-0-e79a7723fab0@kernel.org/

Sashiko review:
https://sashiko.dev/#/patchset/20260619-dfustini-atl-sc-cbqri-dt-v1-0-e79a7723fab0%40kernel.org

---
Drew Fustini (8):
      dt-bindings: riscv: Add Ssqosid extension description
      riscv: Detect the Ssqosid extension
      riscv: Add support for srmcfg CSR from Ssqosid extension
      riscv_cbqri: Add capacity controller probe and allocation device ops
      riscv_cbqri: resctrl: Add cache allocation via capacity block mask
      riscv: Enable resctrl filesystem for Ssqosid
      dt-bindings: riscv: Add generic CBQRI controller binding
      riscv_cbqri: Add CBQRI cache capacity-allocation platform driver

 .../devicetree/bindings/riscv/extensions.yaml      |   6 +
 .../devicetree/bindings/riscv/riscv,cbqri.yaml     |  97 +++
 MAINTAINERS                                        |  15 +
 arch/riscv/Kconfig                                 |  20 +
 arch/riscv/include/asm/csr.h                       |   5 +
 arch/riscv/include/asm/hwcap.h                     |   1 +
 arch/riscv/include/asm/processor.h                 |   3 +
 arch/riscv/include/asm/qos.h                       |  83 +++
 arch/riscv/include/asm/resctrl.h                   | 147 ++++
 arch/riscv/include/asm/switch_to.h                 |   3 +
 arch/riscv/kernel/Makefile                         |   2 +
 arch/riscv/kernel/cpufeature.c                     |   1 +
 arch/riscv/kernel/qos.c                            |  98 +++
 drivers/resctrl/Kconfig                            |  29 +
 drivers/resctrl/Makefile                           |   5 +
 drivers/resctrl/cbqri_capacity.c                   | 132 ++++
 drivers/resctrl/cbqri_devices.c                    | 520 ++++++++++++++
 drivers/resctrl/cbqri_internal.h                   | 107 +++
 drivers/resctrl/cbqri_resctrl.c                    | 779 +++++++++++++++++++++
 include/linux/riscv_cbqri.h                        |  47 ++
 20 files changed, 2100 insertions(+)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260610-dfustini-atl-sc-cbqri-dt-410c8e2711dd

Best regards,
-- 
Drew Fustini <fustini@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
