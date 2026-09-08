Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8394C79F9E
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 02:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3Ua/BX3g/fsElOh5IdWnxOhjb0pZp4nseZB4tAa3J6w=; b=F15I3tIBNsRDMH
	wS3mnhn9r7xi7rJxYFR/pU5/SqNkr+s57IhHH/B8N02KBwxpTXYG/X5sxszG9iyb/Rjwa3fBdvzAd
	Es9ei3KrYamYjmpWsVC3y+IOgGa8CsdxwzwiX9PAcJ4ierrIPEcloatnBLlh7gOdkbmvs2saX6fwi
	zXg82eqTSN7HlbscwoA0T1NjfXCfnC+OUhCyCUXckg4bCfzOMZUND7rHOmvHLeYjUxMzAsXVi9uiC
	wJY56aLjyYiUvFcQqXFDtbwHBYvl0x5Sh9hrm9yWVEKTcfbkpaO9DhVJLkLaiFomlVEu2y5Qzjyas
	uX4iFRMowqmpkjbeYasg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3lBi-00000007ulX-3twM;
	Tue, 08 Sep 2026 02:03:54 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3lBg-00000007uka-0nJf
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 02:03:53 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso4439607a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 07 Sep 2026 19:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788833030; x=1789437830; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3sMw9iwve27Y2nH1ScSWttLx8rW++NN1zuHxfgNDdI=;
        b=O5XeGcfgpEQx56PGPqisjBWCjA1K7ZZObOlBkP4+ATgadsTe5nwOPxazaAqZ5Mnlqo
         +XHaGsE2BIbrrnmUcus14bmglSsnI3n4d3OTn8ZCbYgSVS6quNXoRivKlXyiGlDEkqBj
         WRSjM4HqjcmDZjXg4oaViQMZK52l1CgFE+yeL6Zp4wGyfffMn7szWvh1lSs1A6s16OqY
         wATCPVd8Acpj4+O9OymMfIKlpij3IHSQq+bXsP8yia6KFQ/idmXwhZ+t8vr1Kon3iA1L
         8lPSGx+D7rnnIysJ73Cah6L0m2jhTVDWxAIkzv3TTkKKa1kImjHQKycyiUpa0AwI4eaq
         03SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788833030; x=1789437830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3sMw9iwve27Y2nH1ScSWttLx8rW++NN1zuHxfgNDdI=;
        b=gCWV5Kzbqz0QrKVZgELx9jdirsj74xT6AMjmPuCabz4mosJDQOs00o+BfHhuFHNgh5
         nm41ZUrCHC7n6ObzEN0rSX1nhz3TsHSXQQnkCuwhDPFxSYsMg14r4pOkHaMXqqa3Oo5A
         LBi3az/wyKHnhKDLnRUCK9ErYfvtOYA8CZ/wL9pYBugRQiWduetq0TDIkm8F35w/Ek4v
         tp5vlaF3wqJXr9evfBpnAKDB5fbUUlseP2A034kW5yUplMiMWgJb9eWC+dBSZN/LCQs3
         E3ZnQWztlTZLJNfgd/ZfhsjNX2b4piDlcAgQmal5Xst4zQDzwt4/XW625V+J8ZKQT8KS
         97Ag==
X-Forwarded-Encrypted: i=1; AKwUvBy/oY1/DynGzzGfaW2CcoxkutxKT61E/UO+X5aGrD4XqY5KhXFbQumN7hklR9Qo8iG2ue7moFl320p3qw==@lists.infradead.org
X-Gm-Message-State: AFuF++nQOI9qpUDr7mZn3IbeMz/XJMgyGYvYa1Htoh/C738IZDeeUJIC
	PkdV+F8JcyvA1C7z7e5/w/mZn9YuhJnDTQ+JdO5ajWBhVPp57DWxWz8ujECSlz08lK4=
X-Gm-Gg: AYBFou1PwBDTXJfEAUk3peO/7M1kB2gc9nK5e4vgrCugsc36HT6Kv5hDLfqcZJYqlbd
	kIl1ALXD29pOIsJ40PosZRSF9v/MNLdcv1edgh3TVlPOFT6cSZVXtLGVrwYMlU0SaBXQ3mSESRH
	cbJekDEGKV//r82cE5xfY+Oi9l7gon0D8bLd96+WeC7tgHZWInIXCRGuDA11jm4JwSzFKvAUknz
	m7Z6db4Kf4N4PD9txQZ1GS06icOP/6odqnK5tXA9Ynn6K613mickSTeL52Bi0ISpAT5nkVPsm8c
	J/WSJ67a9prMz5sGe+aVVNoND7NMo/QkEBSUc2oKmUSdx0vjqqasMY7fwniGvZKIyj7So3++Vft
	cQSDqNy9t/vqdUlOKWMcjomwQ22xZFWBPY64e/9y7Gij9YdVouitBwqzIMdq6EadIFm4iJZxElC
	8beGSTI+XYUGDLSI1IP6gsyzHupQIE4h19Y053OyWwbVuNJC4LcQPDyweGGUEO/qXL5FCVrpMoR
	CEXzhL8Kg4=
X-Received: by 2002:a17:90b:3944:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-39b261b19d9mr43841330a91.14.1788833030494;
        Mon, 07 Sep 2026 19:03:50 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434c745a09sm893671c88.7.2026.09.07.19.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 19:03:49 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	mark.rutland@arm.com,
	andrew.jones@oss.qualcomm.com,
	guoren@kernel.org,
	david.laight.linux@gmail.com,
	zhangzhanpeng.jasper@bytedance.com,
	yang.yicong@picoheart.com,
	nutty.liu@hotmail.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v9 0/2] RISC-V IOMMU HPM support
Date: Mon,  7 Sep 2026 19:03:43 -0700
Message-ID: <20260908020347.1836653-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_190352_282398_89F35A77 
X-CRM114-Status: GOOD (  16.48  )
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

This series implements support for the RISC-V IOMMU hardware performance
monitor.

The RISC-V IOMMU PMU driver is implemented as an auxiliary device driver
created by the parent RISC-V IOMMU driver. Therefore, the child driver
can obtain resources and information from the parent device, such as
the MMIO base address and IRQ number.

Changed in v8:
- Rebased onto v7.3-rc2
- Add irq work mechanism for IRQCHIP_MOVE_DEFERRED case
- Filter multiple cycle event case

Changed in v7:
- Rebased onto the v7.3-rc1
- Remove raw spinlock
- Check CPU matching at the beginning of irq handler
- Add PERF_HES_STOPPED check before overflow handling

Changed in v6:
- Rebased onto the latest v7.3-rc
- Use sysfs_emit instead of cpumap_print_to_pagebuf
- Set up on_cpu and irq affinity by cpuhp callbacks
- Change type of on_cpu from unsigned int to int
- Reject filter operands of cycle event in event_init
- Check return value of counter number and  masks in probe
- Add raw spinlock for race condition (third commit)

Changed in v5:
- Pick up suggestions from sashiko-bot as follows
- Fix event group validation for sw event
- Bind IRQ to aux PMU dev instead of parent IOMMU dev
- Clear OF bit when event is NULL
- Improve hi-lo-hi patten
- Add back IRQF_SHARED flag due to mismatch
- Manage cpuhp and pmu register by devre

Changed in v4:
- Rebased onto v7.3-rc
- Use is_sampling_event() instead of accessing vairable directly
- Rename the matching name from "iommu.pmu" to "riscv-iommu.pmu"
- Change the naming of PMU device for avoid ":" in PCIe case
- Add suppress_bind_attrs attribute
- Remove IRQF_SHARED flag
- Set irq affinity to local CPU of IOMMU
- Allocate ID by IDA for auxiliary device
- Pick up suggestions from sashiko-bot

Changed in v3:
- Rebased onto v7.2-rc3
- Use hi_lo_writeq/readq to access register
- Pick comments from sashiko-bot as follows
- Set IRQ CPU affinity
- Remove IRQF_ONESHOT flag when request irq
- Adjust cycle event check by checking event_id field only
- Fix bug for group events verificaiton
- Fix KASAN issue about casting 32-bit variable to unsigned long pointer
- Clear IPSR pending bit before starting counter
- Clear OF bit in event selector register in irq handler
- Release irq by devm instead of explicit free_irq

Changed in v2:
- Rebased onto v7.2-rc1
- Use hi-lo-hi mechanism to read counter.
  Suggested by Guo Ren and David Laight

Changed in v1:
- Rebased onto v6.19-rc8
- Pick all suggestions and feedbacks from v1 series
- Add cpu hotplug implementation to avoid race enablement
- Move PMU-related definition from header to c file
- Change PMU driver to auxiliary device driver

Changed in RFC:
- Rebase onto v6.13-rc7
- Clear interrupt pending before handling interrupt
- Fix the counter value issue caused by OF bit in the cycle counter.
- Invoke riscv_iommu_hpm_disable() instead of riscv_iommu_pmu_uninit()
  in riscv_iommu_remove()

Zong Li (2):
  drivers/perf: riscv-iommu: add risc-v iommu pmu driver
  iommu/riscv: create a auxiliary device for HPM

 drivers/iommu/riscv/Kconfig      |    1 +
 drivers/iommu/riscv/iommu-bits.h |   61 --
 drivers/iommu/riscv/iommu.c      |   37 ++
 drivers/perf/Kconfig             |   12 +
 drivers/perf/Makefile            |    1 +
 drivers/perf/riscv_iommu_pmu.c   | 1020 ++++++++++++++++++++++++++++++
 6 files changed, 1071 insertions(+), 61 deletions(-)
 create mode 100644 drivers/perf/riscv_iommu_pmu.c

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
