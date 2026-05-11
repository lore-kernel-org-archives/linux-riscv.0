Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C625CD4844
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 05:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q06oQSZjHYgnSo+A7jgXSXCjKm/0Rt7ao++DtKQGQ/s=; b=R3l0KWxc1HbfkR
	yEtn7ZO2uLYIZT8Z7LTtV4xj6xI59LQIuQun1darJZUQ25ofW0wvoKv0HQEVWrC2IOBWiwxosr2fm
	zVy5xMqOH46G8/JKFp49IvvENfAZp1NgDWUOALDkto5zEUt8ESk+/GCt3GQbCQ023d8Mr42+s+juS
	hL0s0eFVq34b15kj0PKrFGEFrqfHxfEG1pcg0K60d+9o2h/AnGuG/iyA7LaoF0HdIG2pBW14td5gM
	2PGCeo41nMECmjg7b6ZVwLS+yen8xk1cjtMWHetrUstq5dsf3b0DGJVLoZqeKlR6nAhb/HA6U5QmR
	gR2qWn3s4fHbucWgSegw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIvf-0000000CLaZ-3bUU;
	Mon, 11 May 2026 05:11:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIvc-0000000CLRX-0CZ8
	for linux-riscv@bombadil.infradead.org;
	Mon, 11 May 2026 05:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=VUWXERqi3yIeOEVZb39w5zUGCZ+BfwZMpFOSi0+iWIE=; b=Y/YhhDznA22Re5Po7u/XEmVFiv
	yRb+XrV5hpBX1QAMfKpuggnqOo1vsyOjH4YVhH9Ip1E2xz85UesyEt3pPxFkZYZWaQZDp3jWbyvfg
	0z4ZA6PGjVj1Frqzyth6M25wUhrJSt6KXmpIDilNofENUu46tOmB9QVLwZ6KT8fO292jJJa33nI7P
	/LbwFY21M7MwKqsHnTUxjDjEn5RxujELpH0E5QDoTeCeBYfdEOdE4eaW6hODokT/jvTGPoI1Ic0Fl
	8hcgNqM8UN1MRwUMS8dHOkDn4a6D77eEkoZedSLoqEWPAGuPqks8MondSPRIvXmXaEdWBxnw3kjle
	iLGXpsTg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIvB-0000000Ae1A-0zlF
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 05:11:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 259F94411C;
	Mon, 11 May 2026 05:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED82C2BCB0;
	Mon, 11 May 2026 05:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778476269;
	bh=1bjEctrKc8U3pwHQ7F6COx+333aais51yWOAJe1WnU8=;
	h=From:Subject:Date:To:Cc:From;
	b=oMFanZHW2UGbGWDX6uzQAqxBjvTVtm3e4VdQ/GrAqpib6KdtmicTIPbF7/B4HQmDN
	 qnpRJ8D3SL4p9pz299iyvOskfF5RbJtTqa5u8Wvj8UjzC+IkYS67kz9htI1xvthcCt
	 5WHPrgdGmNNK7XbqyYGeDR1zO8/qb1vVRor/G2O5EFMCcN6bFglLK7BRuM72Y+8LnJ
	 aK8NoIcFL5MtDnvxaJo0cv6uet4kfkZL14jXqW/Cr/KGj/J1/LbWhrXbSQHe3XnJOj
	 huaLnqHu4+SwteyMPiVhHJftAwcF33+040fCX+85UQUpMZVZOwY7B5yreGT+EYzkW2
	 VsTUBkymbjMEg==
From: Drew Fustini <fustini@kernel.org>
Subject: [PATCH RFC v4 00/18] riscv: add Ssqosid and CBQRI resctrl support
Date: Sun, 10 May 2026 22:10:56 -0700
Message-Id: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOFkAWoC/3WNQQ7CIBREr9L8tRgEItSViYkHcGu6APptiaZYv
 iGapncX2bt8M5k3CxCmgASHZoGEOVCIUwG1acCPdhqQhb4wCC72XIqWEc2RQs+8m1NgaSbPsma
 cOe61Mc46ZSyU9TPhLbyr+QqX8wm6Eo6BXjF96luWtapitVN/xVn+7NIJ1Ngape3xjmnCxzamA
 bp1Xb/0CMGTxAAAAA==
X-Change-ID: 20260329-ssqosid-cbqri-rqsc-v7-0-b0c788bab48a
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
 Conor Dooley <conor.dooley@microchip.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, Gong Shuai <gong.shuai@sanechips.com.cn>, 
 Gong Shuai <gsh517@gmail.com>, liu.qingtao2@zte.com.cn, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Drew Fustini <fustini@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8738; i=fustini@kernel.org;
 h=from:subject:message-id; bh=1bjEctrKc8U3pwHQ7F6COx+333aais51yWOAJe1WnU8=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWQxpjyd01HBcu1DhpG5rR/flIfBu69nfG9w+qhfYVB+Y
 9285SeDO0pZGMS4GGTFFFk2fci7sMQr9OuC+S+2wcxhZQIZwsDFKQATyeRhZDgWp+Y4efa+JSwx
 YZZFW8/WHTx/aHUG62E2h0USj5wfs/ox/PexfhmQ+HPKIkUGsdB6wZz/ik1vr0kcnJk8welfk+i
 mmcwA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_061130_339895_590A6CB9 
X-CRM114-Status: GOOD (  17.93  )
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

This RFC series adds RISC-V QoS support: the Ssqosid extension [1]
(srmcfg CSR), the CBQRI controller interface [2] integrated with
resctrl [3], and ACPI RQSC [4] for controller discovery. DT support
is possible but no platform drivers are included. The series is
also available as a branch [5].

QEMU support for Ssqosid and CBQRI lives in [6], with ACPI RQSC as
a follow-on series [7]. There is also a combined branch [8].

Series organization
-------------------
01      DT binding for Ssqosid extension
02-03   Ssqosid ISA support (detection, srmcfg CSR, switch_to)
04-06   fs/resctrl helpers and resource type additions
07-10   CBQRI device ops (cbqri_devices.c): capacity probe +
        allocation, capacity monitoring, bandwidth probe +
        allocation, bandwidth monitoring
11-15   CBQRI resctrl integration (cbqri_resctrl.c): cache
        allocation, L3 cache occupancy monitoring, MB_MIN
        bandwidth allocation, MB_WGHT bandwidth allocation,
        mbm_total_bytes monitoring
16-17   ACPI RQSC parser and init
18      Enable resctrl filesystem for Ssqosid (Kconfig)

Refer to the v3 cover letter [9] for the test setup including the
reference SoC layout and the corresponding QEMU command line.

[1] https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
[2] https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
[3] https://docs.kernel.org/filesystems/resctrl.html
[4] https://github.com/riscv-non-isa/riscv-rqsc/blob/main/src/
[5] https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/log/?h=b4/ssqosid-cbqri-rqsc
[6] https://lore.kernel.org/qemu-devel/20260105-riscv-ssqosid-cbqri-v4-0-9ad7671dde78@kernel.org/
[7] https://lore.kernel.org/qemu-devel/20260202-riscv-rqsc-v1-0-dcf448a3ed73@kernel.org/
[8] https://github.com/tt-fustini/qemu/tree/b4/riscv-rqsc
[9] https://lore.kernel.org/r/20260414-ssqosid-cbqri-rqsc-v7-0-v3-0-b3b2e7e9847a@kernel.org

Key design decisions
--------------------
- Create new resource types as RDT_RESOURCE_MBA cannot represent the
  semantics of the CBQRI bandwidth controllers:

  - RDT_RESOURCE_MB_MIN matches CBQRI Rbwb (reserved bandwidth
    blocks). The sum of Rbwb across all control groups must be
    <= MRBWB (maximum number of reserved bandwidth blocks).

  - RDT_RESOURCE_MB_WGHT matches CBQRI Mweight, the weighted shared of
    the remaining bandwidth blocks. Values are in [0, 255]: 0 disables
    work-conserving sharing for the group, 1..255 compete for the
    leftover pool.

- mbm_total_bytes is supported but only on platforms that expose one
  mon-capable bandwidth controller. That single BC pairs with every L3
  monitoring domain on the assumption that all memory traffic flows
  through it.

Open issues
-----------
 - RDT_RESOURCE_MB_MIN and RDT_RESOURCE_MB_WGHT are intended to drive
   discussion, not as the final solution. I plan to rebase onto
   Reinette's proof of concept once it is posted.

 - resctrl monitoring scope limitations:
   - monitor-only L3 capacity controllers are not supported.
   - CBQRI capacity controllers can monitor any cache level, but resctrl
     only supports occupancy on L3.
   - resctrl needs to gain a non-CPU scope level in order for
     mbm_total_bytes to be supported on platforms with multiple
     bandwidth controllers.

 - cc_cunits is not supported. cc_block_mask maps well onto resctrl's
   existing CBM schema, but there is no existing equivalent for
   capacity units.

 - RQSC structs live in drivers/acpi/riscv/rqsc.h until the spec is
   ratified and the ACPICA upstream submission lands. They will then move
   to include/acpi/actbl2.h. The spec is in the final phase
   before ratification.

Changes in v4:
--------------
resctrl:
 - Add RDT_RESOURCE_MB_MIN and RDT_RESOURCE_MB_WGHT
 - Add default_to_min to resctrl_membw so MB_MIN defaults to min_bw
 - Add L3 cache occupancy monitoring for L3-scoped capacity controllers
 - Add mbm_total_bytes bandwidth monitoring when there is a single
   bandwidth controller
 - Move domain creation into cpuhp callbacks so that cpu_mask reflects
   only online CPUs
 - resctrl_arch_reset_rmid() returns early when called with IRQs
   disabled.

CBQRI:
 - Replace per-controller spinlock with mutex. Each CBQRI op is a
   write-then-poll-busy cycle of up to 1 ms. A sleeping mutex paired
   with readq_poll_timeout() keeps preemption enabled across the
   busy-wait. All resctrl-arch entry points run in process context.
 - Replace struct cbqri_config with direct params in helper functions.
 - max_rmid = min(max_rmid, ctrl->mcid_count) now gated on
   ctrl->mon_capable.
 - Validate that the sum of Rbwb does not exceed MRBWB.
 - Move CDP enable state from file-scope globals to per-resource
   cdp_enabled / cdp_capable.
 - Configure both AT_CODE and AT_DATA limits when CDP is supported but
   not enabled.

Ssqosid:
 - __switch_to_srmcfg() emits RISCV_FENCE(rw, o) before and (o, rw)
   after csrw to drain old-task stores and order new-task loads.
 - Invalidate per-cpu cpu_srmcfg on hart online via CPUHP_AP_ONLINE_DYN.
   Also seed already-online CPUs synchronously at init.

ACPI:
 - Drop the PPTT helper patch and resolve cache_size via cacheinfo at
   cbqri_resctrl_setup() time.
 - ACPI driver now calls riscv_cbqri_register_controller() and the
   cbqri_controller internals stay in cbqri_internal.h.

Refer to v3 for previous change logs:
https://lore.kernel.org/r/20260414-ssqosid-cbqri-rqsc-v7-0-v3-0-b3b2e7e9847a@kernel.org

---
Drew Fustini (18):
      dt-bindings: riscv: Add Ssqosid extension description
      riscv: detect the Ssqosid extension
      riscv: add support for srmcfg CSR from Ssqosid extension
      fs/resctrl: Add resctrl_is_membw() helper
      fs/resctrl: Add RDT_RESOURCE_MB_MIN and RDT_RESOURCE_MB_WGHT
      fs/resctrl: Let bandwidth resources default to min_bw at reset
      riscv_cbqri: Add capacity controller probe and allocation device ops
      riscv_cbqri: Add capacity controller monitoring device ops
      riscv_cbqri: Add bandwidth controller probe and allocation device ops
      riscv_cbqri: Add bandwidth controller monitoring device ops
      riscv_cbqri: resctrl: Add cache allocation via capacity block mask
      riscv_cbqri: resctrl: Add L3 cache occupancy monitoring
      riscv_cbqri: resctrl: Add MB_MIN bandwidth allocation via Rbwb
      riscv_cbqri: resctrl: Add MB_WGHT bandwidth allocation via Mweight
      riscv_cbqri: resctrl: Add mbm_total_bytes bandwidth monitoring
      ACPI: RISC-V: Parse RISC-V Quality of Service Controller (RQSC) table
      ACPI: RISC-V: Add support for RISC-V Quality of Service Controller (RQSC)
      riscv: enable resctrl filesystem for Ssqosid

 .../devicetree/bindings/riscv/extensions.yaml      |    6 +
 MAINTAINERS                                        |   15 +
 arch/riscv/Kconfig                                 |   20 +
 arch/riscv/include/asm/acpi.h                      |   10 +
 arch/riscv/include/asm/csr.h                       |    5 +
 arch/riscv/include/asm/hwcap.h                     |    1 +
 arch/riscv/include/asm/processor.h                 |    3 +
 arch/riscv/include/asm/qos.h                       |   64 +
 arch/riscv/include/asm/resctrl.h                   |  152 +++
 arch/riscv/include/asm/switch_to.h                 |    3 +
 arch/riscv/kernel/Makefile                         |    2 +
 arch/riscv/kernel/cpufeature.c                     |    1 +
 arch/riscv/kernel/qos.c                            |   49 +
 drivers/acpi/riscv/Makefile                        |    1 +
 drivers/acpi/riscv/init.c                          |   21 +
 drivers/acpi/riscv/rqsc.c                          |  147 +++
 drivers/acpi/riscv/rqsc.h                          |   52 +
 drivers/resctrl/Kconfig                            |   33 +
 drivers/resctrl/Makefile                           |    6 +
 drivers/resctrl/cbqri_devices.c                    | 1016 ++++++++++++++
 drivers/resctrl/cbqri_internal.h                   |  240 ++++
 drivers/resctrl/cbqri_resctrl.c                    | 1388 ++++++++++++++++++++
 fs/resctrl/ctrlmondata.c                           |    3 +-
 fs/resctrl/internal.h                              |    2 +
 fs/resctrl/rdtgroup.c                              |   16 +-
 include/linux/resctrl.h                            |   13 +-
 include/linux/riscv_cbqri.h                        |   66 +
 27 files changed, 3326 insertions(+), 9 deletions(-)
---
base-commit: ef5f46b630235b75beec43174348c3d01d6fc49a
change-id: 20260329-ssqosid-cbqri-rqsc-v7-0-b0c788bab48a

Best regards,
--  
Drew Fustini <fustini@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
