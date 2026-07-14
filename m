Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9F7C44501
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 13:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q2GRbF+Ymzd0djuhZX7qdAJd/1wed0zDPMCYYePfpAA=; b=1chAHwUppaheOn
	COwsYb1j4cRwYN1Qc87Tf6Esu+AbmvyxHUQF2Evk2UbmWssOeuFuUyeEQ2mGrKgdr4eFSs8LSjYa1
	4A3Ydm+lTY6gRhBhBT/JILth685ApL+KpYBoMrMaFF/6/XRn2e4r4Sdkd78HchAdEByJoxixak9ha
	yRenGWuNyOG0FCE6RrWd3rAcuR8yNeilWOpCyGt0IZM1b+MEn/v0zh3mAQnFyGcnGDM1wR/4FQlTt
	mKpn96zBqbWrP0YpoT0U0H3ApYEb5uHncTS4dHvY/S5A6iLBApgBcdYaSJzqqXALnR/O0FUMqdTQe
	Xc0Wsa7qrja/YVkNRhNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcr1-0000000C6Ea-1iXP;
	Tue, 14 Jul 2026 13:07:19 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcqy-0000000C6Ce-24pa
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 13:07:18 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7e9ed64d490so1565193a34.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 06:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784034433; x=1784639233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zu2x7nRWgqnkpJB6Jzio2t+71M646t61MeaMLyeHe/o=;
        b=efeOCNGhSG88lXZYzhWj4sM6xsVvF+KNfKGB4HbldcaFktwVhg7p5eCQ91vZRCMCrY
         U+PplUHy4FGEbWbruQZjWn2LPAOfPfsQUhFav8KEseLTq3p2B41khKaxrcxb/Em/VZg0
         /THXB5a904hUGG5IDv80mtr4Uv4cXBRZf5/EdpieQijTD2WTnk3ZuZZFZ5I5ndIWorfD
         rq9t1xlVt18GQf8QHAMRJI0rsuAYCwPI1ITeaHiIuNqX6qx+GHt+uBFT9/OKx+1M1TAo
         4e8gf+i3ViWmWRROrJm5wv7BLsal+XEptQEL6adS6g8aLpoCwifJLYAwWabgT4yLqCFj
         59Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034433; x=1784639233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zu2x7nRWgqnkpJB6Jzio2t+71M646t61MeaMLyeHe/o=;
        b=OZc63WSHPJ/cqDPfPy8Ujabz/TGtSvJFZyevIE4BK0S4aGYn1DSP6th3XslA/LaPdn
         m1RGpVHjLc8hmKZLeAbtKHKdmmmjgzc73bVpNLpcy5XT9CQ93Z+tazd/Fq2cdIh1i3Pp
         EPjGVpQaS7QvB6Hne3whSPoQfla8ZvkOv6y9aAwdxjCSEiQlUXhCbIlfLDJlIU9WSKi8
         YnrAn/zTBkPb7sUXvxt/0ZJFoZ/9ZqhcJYB5216yodNK+EL0PjCUHXd14zKzxQo/qqYr
         CFIdp7KT/RVwrI2s3N0+JignH8iHEtUzQkFZQ94ZJ1g+NNfdwW0FCR6IrNgs3ZzxNBhY
         c80g==
X-Forwarded-Encrypted: i=1; AFNElJ/vMP+AsXdELVmRODnKqVByFpipag05N/PGvneEY3V8IJjr3IBh3hr744BwtTcQqSOk98QHOkTlY5/25A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdmRIScCWw2kTr4V4zjEOk4/7ULU39LjZ6vYLtODjtSLTmBYJ4
	LW4zM9AUvOXpX3h/1F7PLa2/B23eR7O+iQOpd3NmKHG9wmTE2BD3qbs4pJuDrucmdGw=
X-Gm-Gg: AfdE7clRVCburTVi4pWN/uT5vDoVzlyMGy8rxnCxvlY1ixM/L41u+m6yLPmI4nQBKhx
	It5/rp+iu7E761Jj+pEbK/MBbFNAp36saV2zek7DiHNm7oKxw2++9iqiqZtPX9G1gykQbxGvTzz
	zNexqQJAnz8Q+TTmihwZqTVQMWs0JiMM9+Xz2JoSVZfghdu1VevY9D1Oajw5sD91jS7RFGu7m3L
	p1DeplgKCNPZ+9pNeWxRxQrQPvs0gqJAkaqKron54YuslEbojkZwQ64j8ZEI9XLckQ2Go28RSiG
	N4yKXp3CI5ejBy+vXFo8qu144izuwkNW1kT6576wyBQCg4Pm6dsQUo9YADpuN8Q+jzAiqDP/eX9
	u86o8DqBWv+5tlyEW1YAYziFly9z+ZxhPKMiBEVQuGR+rh8zfw/Oy810zz/kZGd46FmthEx0Imr
	4ORgf+B9reGmZdnPKr7JxuQy5XpQ7Wp7lNSLoyE9H/yWsnkL0qki6ZIfScWIapTw==
X-Received: by 2002:a05:6830:4412:b0:7e7:45f:ce3c with SMTP id 46e09a7af769-7ec096ac473mr7449408a34.14.1784034432564;
        Tue, 14 Jul 2026 06:07:12 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([178.93.176.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcab8efc3sm14657738a34.0.2026.07.14.06.07.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 06:07:12 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: joro@8bytes.org,
	palmer@dabbelt.com,
	tony.luck@intel.com,
	reinette.chatre@intel.com,
	tomasz.jeznach@linux.dev
Cc: will@kernel.org,
	robin.murphy@arm.com,
	fustini@kernel.org,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	corbet@lwn.net,
	shuah@kernel.org,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [RFC PATCH 0/7] riscv: iommu: Add QoS ID support for resctrl device assignment
Date: Tue, 14 Jul 2026 21:06:50 +0800
Message-ID: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_060716_924865_34EF3DF2 
X-CRM114-Status: GOOD (  15.36  )
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

This RFC extends RISC-V CBQRI/resctrl support to external requesters
behind a RISC-V IOMMU.

The RISC-V IOMMU QoS ID extension associates a resource-control ID
(RCID) and monitoring ID (MCID) with IOMMU-related memory requests [2].
For a translated device request, the IOMMU obtains the IDs from the
device context translation attributes (DC.ta) and supplies them to the
I/O bridge after a successful translation. The bridge and downstream
CBQRI-controlled resources can then apply their existing allocation and
monitoring policy to the request.

The series is based directly on Drew Fustini's v4 RISC-V Ssqosid and
CBQRI resctrl series [1]. That dependency provides CPU-side QoS ID
plumbing and CBQRI-backed resctrl support. This series extends the same
resctrl identity to device requests translated by a RISC-V IOMMU.

The RISC-V names map to the existing resctrl identifiers as follows:

    resctrl CLOSID  ->  RISC-V RCID
    resctrl RMID    ->  RISC-V MCID

Userspace first creates a resctrl resource group. The new "devices"
file then assigns an external requester to that group:

    userspace
       |
       | mkdir /sys/fs/resctrl/<group>
       |
       | echo "iommu_group:<id>" > /sys/fs/resctrl/<group>/devices
       v
    generic resctrl devices file
       |
       | (closid, rmid)
       v
    RISC-V CBQRI IOMMU binding backend
       |
       | (rcid, mcid)
       v
    RISC-V IOMMU DC.ta.{RCID,MCID}

The "devices" file is an assignment and membership interface only. It
does not describe a new resctrl resource, schema, or monitoring domain;
resource policy remains in the existing schemata and info files.

Common IOMMU helpers:

The userspace ABI names an IOMMU group by the numeric ID already used by
/sys/kernel/iommu_groups. Patch 1 adds iommu_group_get_by_id() as a
narrow, reference-counted lookup for that existing identifier.

Updating a group also needs stronger iteration semantics than separate
iommu_group_for_each_dev() calls can provide. All devices must be
validated before any device context is changed, and group membership
must not change between validation and update. Patch 2 therefore adds
iommu_group_update_devices():

    lock group->mutex
      for each device: check()          /* may fail, no state changed */
      for each device: update()         /* non-failing callback */
    unlock group->mutex

The helper contains no resctrl or QoS policy. It only provides an
all-or-none validation boundary for a group-wide update while keeping
IOMMU group internals private. The RISC-V IOMMU QoS code is its first
caller.

RISC-V IOMMU programming:

For translated device requests, the per-device-context QoS IDs are
programmed in DC.ta. Active contexts are invalidated after an update so
cached translations do not retain stale IDs. BARE mode cannot safely
represent per-IOMMU-group assignment because only the per-IOMMU
iommu_qosid global default is available, so group assignment rejects
BARE mode.

The RISC-V IOMMU also has a per-IOMMU iommu_qosid register. The series
exposes it as:

    /sys/class/iommu/<iommu>/qosid

This sysfs attribute programs the global RCID and MCID used for
IOMMU-originated DDT, CQ, FQ, PQ, and MSI accesses. In BARE mode,
device-originated requests also use these IDs. It is not a resctrl group
assignment interface.

Open questions for this RFC:

  * whether a common resctrl "devices" file is the right ABI for
    associating external requesters with a resource group;
  * whether iommu_group_get_by_id() is an acceptable narrow common
    helper for resolving the numeric IOMMU group ID passed through that
    ABI; and
  * whether iommu_group_update_devices() provides the right common
    contract for checked group-wide updates.

[1] Drew Fustini's CBQRI v4 series:
https://lore.kernel.org/linux-riscv/20260706-dfustini-atl-sc-cbqri-dt-v4-0-e75c20201d64@kernel.org/
[2] RISC-V IOMMU QoS ID extension:
https://docs.riscv.org/reference/cbqri/qos_iommu.html

Zhanpeng Zhang (7):
  iommu: Add group lookup by ID
  iommu: Add checked group device update helper
  resctrl: Add a devices file for external requester assignment
  iommu/riscv: Program QoS IDs for assigned groups
  iommu/riscv: Expose global QoS IDs in sysfs
  riscv_cbqri: Assign IOMMU groups to resource groups
  selftests/iommu: Add RISC-V IOMMU QoS smoke test

 .../ABI/testing/sysfs-class-iommu-riscv-iommu |  27 +
 Documentation/filesystems/resctrl.rst         |  26 +
 MAINTAINERS                                   |  12 +
 arch/Kconfig                                  |   6 +
 arch/riscv/include/asm/qos.h                  |  28 +
 drivers/iommu/iommu.c                         | 140 +++-
 drivers/iommu/riscv/iommu-bits.h              |  15 +
 drivers/iommu/riscv/iommu.c                   | 419 ++++++++++-
 drivers/iommu/riscv/iommu.h                   |  22 +-
 drivers/resctrl/Kconfig                       |   6 +
 drivers/resctrl/Makefile                      |   1 +
 drivers/resctrl/cbqri_iommu.c                 | 276 ++++++++
 fs/resctrl/rdtgroup.c                         | 206 +++++-
 include/linux/iommu.h                         |  30 +
 include/linux/resctrl.h                       |  45 ++
 tools/testing/selftests/iommu/Makefile        |   2 +
 .../selftests/iommu/iommu_qos_smoke.sh        | 649 ++++++++++++++++++
 17 files changed, 1886 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
 create mode 100644 drivers/resctrl/cbqri_iommu.c
 create mode 100755 tools/testing/selftests/iommu/iommu_qos_smoke.sh


base-commit: ab754eba620f5a66e7277b7b2d0e706aa7743e8a
-- 
2.50.1 (Apple Git-155)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
