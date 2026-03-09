Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2F7EA8542
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 04:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VW7wQmrVXRwYA+kO57zRwmJVTZ/mHC2RiWQoAFavbus=; b=NU1oPXelRL+NLK
	wDfSkQEHFI4Er1Qs+2M4epxUFAJyzItmiDA7jF45SmESFuYNhEYUC03Y6a3pZQx8F9G3Cvtoq6tjz
	JqXNxUHPM6awyqEneDAddiRBIRajnQzARU/e3aytvruJIhJ5ejCELeA007cL+gIfvVZ5N0Jeym5Kq
	MQWLl/CovQF12sugiTYzon/r9SA7UuPr593SXdi2ZQKDrhTZDHbyRgM5bRT97h0F18nG0TASuaNJ/
	nvxBhhiJwai4V4G7RVX/jsX8iDgax8+sXX4QxDkeDSeSHoltWoWQpg2Oq2lV50dkWyDfEJAg27eq3
	QlNM5+gf1tTUuGuXIpmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzS3c-00000006dB9-1sdF;
	Mon, 09 Mar 2026 04:17:29 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzS3Z-00000006d9C-1AE8
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 04:17:26 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zb0eE+ABbIztFz17I9xJEIXO/NgQFVL9CzG3OvGn4TQ=;
	b=kmGTZOZ+f4KHMGUbkvEcncnAlAymW/Z07WbkXN8FvRpuLaTyuRb2nSEhH/M04VIb9sA7nUtY5
	v0MubPK9yw+wKfb35tNjKakWZ+5aCu2BIzvHOhr0JQnAV7vlPJjTTPGrgC+yn43FQj6V07z6Eo3
	7B+YZFGra9na5nZCkNbtBlM=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fTk9T2xKTz1T4Fc;
	Mon,  9 Mar 2026 12:11:57 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id B732140561;
	Mon,  9 Mar 2026 12:17:05 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Mar 2026 12:17:04 +0800
From: Chengwen Feng <fengchengwen@huawei.com>
To: <linux-pci@vger.kernel.org>, <bhelgaas@google.com>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v4 0/2] Fix get cpu steer-tag fail on ARM64 platform
Date: Mon, 9 Mar 2026 12:16:56 +0800
Message-ID: <20260309041659.18815-1-fengchengwen@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260303003625.39035-1-fengchengwen@huawei.com>
References: <20260303003625.39035-1-fengchengwen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_211725_507182_0EDEA180 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: Chengwen Feng <fengchengwen@huawei.com>, rafael@kernel.org, wei.huang2@amd.com, Eric.VanTassell@amd.com, stable@vger.kernel.org, wangliupu@loongson.cn, sunilvl@oss.qualcomm.com, linux-acpi@vger.kernel.org, wangzhou1@hisilicon.com, liuyonglong@huawei.com, jeremy.linton@arm.com, jonathan.cameron@huawei.com, linux-riscv@lists.infradead.org, chenhuacai@loongson.cn, wanghuiqiang@huawei.com, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patchset addresses the issue where retrieving the CPU steer-tag
fails on ARM64 platforms. The first commit is a pure renaming of the
ACPI CPU ID retrieval interface (no functional changes), which serves
as preparation for the second commit that implements the core fix for
the steer-tag retrieval logic.

---
Changes in v4:
- Split the rename into a separate commit.

Changes in v3:
- Rename existing get_acpi_id_for_cpu() to acpi_get_cpu_acpi_id() other
  than add one new API.

Changes in v2:
- Add ECN _DSM reference doc name and its URL.
- Separate implement acpi_get_cpu_acpi_id() in each arch which supports
  ACPI.
- Refine commit-log.

Chengwen Feng (2):
  ACPI: Rename get_acpi_id_for_cpu() to acpi_get_cpu_acpi_id() on
    non-x86
  PCI/TPH: Fix get cpu steer-tag fail on ARM64 platform

 Documentation/PCI/tph.rst          |  4 ++--
 arch/arm64/include/asm/acpi.h      |  4 ++--
 arch/loongarch/include/asm/acpi.h  |  2 +-
 arch/riscv/include/asm/acpi.h      |  2 +-
 arch/riscv/kernel/acpi_numa.c      |  2 +-
 arch/x86/include/asm/acpi.h        |  2 ++
 arch/x86/kernel/cpu/common.c       |  8 ++++++++
 drivers/acpi/pptt.c                | 16 ++++++++--------
 drivers/acpi/riscv/rhct.c          |  2 +-
 drivers/pci/tph.c                  | 11 ++++++-----
 drivers/perf/arm_cspmu/arm_cspmu.c |  2 +-
 include/linux/pci-tph.h            |  4 ++--
 12 files changed, 35 insertions(+), 24 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
