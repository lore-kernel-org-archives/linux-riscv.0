Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF172606A334
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 22:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BrNcxBSW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fKrsGAiM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZHdPTY3U1cOPX+HIWn4hQ8nipE1fEEQXWW5ENq69PZI=; b=BrNcxBSWBhNm4gW/Bk1Gv+OWHA
	fMrPpBjVlzn+v9mER4Wgn7UfhD427ucgfbjA2B+eBbz5/xFWedrlLKCDaXMwNKixChfo+EOJJdWnH
	GXA0uDhlbb9a8+ix1ZiIMIrdQly0wLBqxBaWnRVTc9xiQVr1L2XPeIByG/kRkfyQONtnCySJ3Pa7A
	nlhOSrsJSGHXNZOJ3beujc8te3Nutwtp+yd8Ql9Iw3JQ8hRFmrPZJLCFjnW/hCYfpeCalMekc7BqT
	n3glCS5WY7DUMhfqBotOTGdbDnJvFB7nTarnPgqOfFul9KtfKGkZONHG/gNB4okgiC+N5lFIj7aTA
	pC4wQGBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRP2-00000007CJX-09hS;
	Tue, 17 Nov 2026 22:11:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRP0-00000007CJJ-2AJR
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 22:11:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 14B33404C1;
	Tue, 17 Nov 2026 22:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3551F000C4;
	Tue, 17 Nov 2026 22:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794953506;
	bh=W76m1kA29m11mitv66UWNu9BvE4/1RWqBsu/ibkYDmo=;
	h=From:Subject:Date:To:Cc;
	b=fKrsGAiMFbMXfUQ/82fYhR2PbjROTe5AZKOWMl4Kn4d0oaZl1i1JalNfz2AR6L6R2
	 WU30jrdH9QsCjoidt1KY110hes1dAPSjJPE+RI4jHGK3H8gWAY8NnApg/xxRtM8IrK
	 Wz8/KfYFNBBjzuRFJro8ZqlqClk+ptAW3UMIqZz7D1lf3DDAyefZ10sL0k4ZsPCc4R
	 LvdQB8gbx/gHGmzGkXnP3FY0e91ttQkdWHQ5fA5RmGh/u6JiZKmUCd4TBPI1FL24T1
	 jrEdBUTWvHsk6OJyV48wDoMFv60pIjGtovSmZUFXH0sDShmNoNbxFrHYQsaulzlooo
	 96dJNCAEkxNHQ==
From: "Drew Fustini (Tenstorrent)" <fustini@kernel.org>
Subject: [PATCH 0/3] ACPI: RISC-V: Add support for the RQSC table
Date: Tue, 17 Nov 2026 14:11:26 -0800
Message-Id: <20261117-acpi-rqsc-v1-0-381ce645751e@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA7R/GoC/0WO0WoDIRBFf2XxuQOOsWr3V0IedBzbKc0mq24oh
 Px73abQxwOXc+5dNa7CTc3TXVW+SZPLMgBfJkUfcXlnkDxYGW0cog4Q6SpQ10bgcgkeY3I6RDX
 218pFvn9dx9OT25Y+mfou+FtUXrcR6c/Zf2Oe9oJ2qCGXrXVZBGL/gtGhtFaB3MGipsDGI+Y83
 9DsyhQbA13OZ+nzFDklb7y13ll90Fbn12DIofVhfC02+lTeKB/U6fH4AaFsXGP6AAAA
X-Change-ID: 20261108-acpi-rqsc-6df871ab608a
To: Sunil V L <sunilvl@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Atish Patra <atish.patra@linux.dev>, 
 Anup Patel <anup.patel@oss.qualcomm.com>, 
 Chen Pei <cp0613@linux.alibaba.com>, yunhui cui <cuiyunhui@bytedance.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Zeng Heng <zengheng@picoheart.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Ben Horgan <ben.horgan@arm.com>, 
 James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
 Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Samuel Holland <samuel.holland@sifive.com>, guo.wenjia23@zte.com.cn, 
 liu.qingtao2@zte.com.cn, Dave Martin <Dave.Martin@arm.com>, 
 Babu Moger <babu.moger@amd.com>, Fenghua Yu <fenghuay@nvidia.com>, 
 Peter Newman <peternewman@google.com>, 
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, linux-acpi@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Drew Fustini (Tenstorrent)" <fustini@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3888; i=fustini@kernel.org;
 h=from:subject:message-id; bh=WmnhmP2WahYjVuyNgnoCKqB9zmwoEfibIao2Z1EuyAE=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWT9uSgjPsv6rd1VJXbV1U633gf/XOdycoeLf+1aljWLd
 deYF0f/7ihlYRDjYpAVU2TZ9CHvwhKv0K8L5r/YBjOHlQlkCAMXpwBMxOcAw19xAbewfXYZKdtE
 VTy4JBKWl70LszV8a8/KdobFbFkhSxfDP12ZyEcver4zKGuJnxJy6HAPOFfXV3HMtv3xzXq+uT9
 esQAA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for the ACPI RISC-V Quality of Service Controllers (RQSC)
table [1] that describes the CBQRI controllers [2] present in a system.
Create a platform device for each controller so that the same CBQRI
driver can bind on device tree and ACPI systems.

Patch 1 adds the table definitions. They stay in drivers/acpi/riscv
until ACPICA carries them [3]. Patch 2 parses the table and creates
the platform devices. It is derived from the large RFC series that
implemented all of CBQRI [4]. Patch 3 makes the CBQRI capacity driver
bind to the capacity controller devices. I plan to add support for
bandwidth controller devices once the resctrl generic schema lands.

This series depends on:
 - "riscv: Add initial CBQRI resctrl support" v12 [5]

Tested on QEMU virt with the RQSC table support [6], two L2 capacity
controllers, one L3 capacity controller and one bandwidth controller:

  ACPI: RQSC 0x00000000BDD5B000 0000E0 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
  ACPI: RQSC: 4 CBQRI controllers

  # ls /sys/bus/platform/devices | grep cbqri
  cbqri-bandwidth.2
  cbqri-capacity.0
  cbqri-capacity.1
  cbqri-capacity.3

  # grep cbqri /proc/iomem
  04820000-04820fff : cbqri-capacity.0
    04820000-04820fff : cbqri-capacity.0 cbqri-capacity.0
  04821000-04821fff : cbqri-capacity.1
    04821000-04821fff : cbqri-capacity.1 cbqri-capacity.1
  04828000-04828fff : cbqri-bandwidth.2
  0482b000-0482bfff : cbqri-capacity.3
    0482b000-0482bfff : cbqri-capacity.3 cbqri-capacity.3

The capacity driver binds and resctrl shows the L2 and L3 domains:

  cbqri-capacity cbqri-capacity.0: registered L2 capacity controller at 0x0000000004820000 (cache_id=33685504, rcid=64)
  cbqri-capacity cbqri-capacity.1: registered L2 capacity controller at 0x0000000004821000 (cache_id=33685508, rcid=64)
  cbqri-capacity cbqri-capacity.3: registered L3 capacity controller at 0x000000000482b000 (cache_id=33751040, rcid=64)

  # mount -t resctrl resctrl /sys/fs/resctrl
  # cat /sys/fs/resctrl/schemata
  L2:33685504=fff;33685508=fff
  L3:33751040=ffff

[1] https://github.com/riscv-non-isa/riscv-rqsc/releases/tag/v1.0.0
[2] https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
[3] https://github.com/open-acpica/acpica/pull/1262
[4] https://lore.kernel.org/all/20260601-ssqosid-cbqri-rqsc-v7-0-v6-0-baf00f50028a@kernel.org/
[5] https://lore.kernel.org/all/20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org/
[6] https://lore.kernel.org/qemu-devel/20261113-riscv-rqsc-v2-0-34d47fa4141e@kernel.org/

Signed-off-by: Drew Fustini (Tenstorrent) <fustini@kernel.org>
---
Drew Fustini (Tenstorrent) (3):
      ACPI: RISC-V: Add RQSC table definitions
      ACPI: RISC-V: Enumerate CBQRI controllers from the RQSC table
      riscv_cbqri: Bind to RQSC platform devices

 drivers/acpi/riscv/Kconfig       |   3 +
 drivers/acpi/riscv/Makefile      |   1 +
 drivers/acpi/riscv/init.c        |   2 +
 drivers/acpi/riscv/init.h        |   1 +
 drivers/acpi/riscv/rqsc.c        | 210 +++++++++++++++++++++++++++++++++++++++
 drivers/acpi/riscv/rqsc.h        |  67 +++++++++++++
 drivers/resctrl/Kconfig          |  11 +-
 drivers/resctrl/cbqri_capacity.c | 111 +++++++++++++++------
 8 files changed, 371 insertions(+), 35 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261108-acpi-rqsc-6df871ab608a
prerequisite-change-id: 20260610-dfustini-atl-sc-cbqri-dt-410c8e2711dd:v12
prerequisite-patch-id: 492fe81aa4f3c885ac5bb48252def2fdc5527275
prerequisite-patch-id: b4f0bd4bf660c92dbf4ca0c7d871c1550b66df0d
prerequisite-patch-id: a2e36f0788f8e11c708d162dce653351dd99c4f0
prerequisite-patch-id: d1d359c5cf89b2b5018d64ca8f320892f6dbcca2
prerequisite-patch-id: 5b7fea6f1ad8f2137ffe45681d56b83e17f7cb2a

Best regards,
--  
Drew Fustini (Tenstorrent) <fustini@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
