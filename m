Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3354ECCFA1A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 11:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFSjoZ3GyHqk+uJVP8aWO3kQ54i+dafdN7z19G3fr7g=; b=khqUHvIrtre2XN
	50LSS0s75PbAOlsKrGX9yvHnY6XmFAxWnEMtu0yG1yr1/es7svGcDvfbWkjDV5Dq18Qk/+ZM8Muga
	n+7cClxOAHd3HZtiJrh+K/OvEpEgAyczVRsPAkbZf2wZ1jsH41jDP/y31tiNeyGLIE35+ViR6To4x
	yWudWSm/ivaHj/47NbtK7YlAfjNdy2DZ1Tjb6iCEejLwue6ZV7Ann6guDSfFY8g5UrpO3EYyGOgQQ
	C3EoUj90DMM02zA6XeeFvVN7RK0wbtk4cunGabt9Ca2iLhhePEIdsHn+MCrl55wuCw94DepP1+VAB
	vsO5lu6CTkWOm3pazYSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImPT-000000073bP-3Wfn;
	Tue, 11 Nov 2025 11:19:39 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImPR-000000073aF-3GVz
	for linux-riscv@lists.infradead.org;
	Tue, 11 Nov 2025 11:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762859976; x=1794395976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iFxkT7B47RCS6uuoDSZiQSPOjd+qK9G8OyWkqKGNTlc=;
  b=BGjf1tWhrTleT2Gq9ASnjYd3y4qQcohg4AOIxjFqlYvjcYGcr26/rnOE
   8OajS23DYDv8JrwN3w+JM/5xUlg592Pcd7f5IW/D+F4c1mejRtR0QJOa2
   J0G3v62xoaYNBxncUd0XwIHZWIWOqV3TeltVUSz9li4DAPfnU+SJgfFt2
   Gzjah7AzfPwkoNx9oOrCQyQ0m8hIrm4T6XM6dJb52gs9XVib0kD6xAJbP
   JZEuId/aNeFtnuwVQiNejrVn7XRKK4W6CL0kA/GLW4v21OD4sLOA1bbJl
   iOp3HW/kkgaiwWpSfK04fd3Z7J5QmL8re+fsMHpWu2/mYkqy2LYpNt3Kb
   Q==;
X-CSE-ConnectionGUID: g7eymDr5TCueRPVdkbEHvQ==
X-CSE-MsgGUID: XrDz4l8GSOa65s+E5ZQrvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="63922917"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="63922917"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 03:19:32 -0800
X-CSE-ConnectionGUID: LM+Tx7byTUSiOs06Nl6lFQ==
X-CSE-MsgGUID: c/kstrYRQOeX5wjS4aPC6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="226200395"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 11 Nov 2025 03:19:33 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 7B64397; Tue, 11 Nov 2025 12:19:31 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Cc: Yixun Lan <dlan@gentoo.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] mfd: simple-mfd-i2c: Make ID table style consistent
Date: Tue, 11 Nov 2025 12:18:35 +0100
Message-ID: <20251111111930.796837-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251111111930.796837-1-andriy.shevchenko@linux.intel.com>
References: <20251111111930.796837-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_031937_828347_AE3BD677 
X-CRM114-Status: GOOD (  10.36  )
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

The lines in the OF ID table are written in three different styles.
Choose the most common in the kernel and update accordingly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mfd/simple-mfd-i2c.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 0a607a1e3ca1..5fd0ef3fa44a 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -114,11 +114,11 @@ static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "fsl,lx2160aqds-fpga" },
 	{ .compatible = "fsl,lx2160ardb-fpga" },
 	{ .compatible = "kontron,sl28cpld" },
-	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
-	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
-	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
-	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a},
-	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },
+	{ .compatible = "maxim,max5970", .data = &maxim_max5970 },
+	{ .compatible = "maxim,max5978", .data = &maxim_max5970 },
+	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705 },
+	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a },
+	{ .compatible = "spacemit,p1", .data = &spacemit_p1 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
