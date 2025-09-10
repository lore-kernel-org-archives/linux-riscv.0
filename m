Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800B5CA101F
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 09:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNO+JaMtNue7A5OchZRwbwg8fJjYnBItVmidm9zn08Q=; b=TZg50nqCaMEeaI
	7aQvTfl9qwD8TNai8O0nh13lyda8z7fJYu4YdOieK/7cLxjSNIJLB0l6gtQutkoDOZ+ez2V+RcPiw
	WfXabJlMOinIp2skkJPZpyeGHHBvb4RrMKAX1O6KBS/9CqJHgyh4z+Yy8DTEAqS94Gryph0aitOHr
	OeEsVhxmzKUcT0RCqOQfGOP548EvYCB5igQPIrVzclNRPJ2syGxvyjIt1WQgFESWXTk9FboToYsBS
	hg3dXe9SL4nE13aKPLmtCtLgPr/tUzI3kIxxf5C830iIGpt/no/J8F5yiUKFijerh5OCv4DpbpCRW
	ZpY4bUrIINL8mGsJ9K0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHDO-0000000DF1V-3zBp;
	Wed, 10 Sep 2025 09:34:10 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHDM-0000000DEzg-1qfG
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 09:34:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1757496846; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Pr8EoGstQtjK3lXgH2CmjXH5Mo22c8CU5zRjW49QuUo=;
	b=qMgv1nUJQWJg2fX+lUKLhph0qBFqv7oU48iuFYFQNPrK0x5H8/NqK1c63x9VoogOLo7TqYrUhnWkGUM2smdDDUoBmwC7Xp/A2+O/TZr4Mn4SRIhCh9vpJohNapuZpHmVbn6ON2ETAdHON4re7FVGftQ/Lh1cbP/m3p95k5c9ebY=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WnhhBqV_1757496843 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 10 Sep 2025 17:34:05 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: xueshuai@linux.alibaba.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: james.morse@arm.com,
	tony.luck@intel.com,
	cleger@rivosinc.com,
	hchauhan@ventanamicro.com,
	tianruidong@linux.alibaba.com
Subject: [RFC PATCH 3/5] acpi: Introduce SSE and HEE in HEST notification types
Date: Wed, 10 Sep 2025 17:33:45 +0800
Message-Id: <20250910093347.75822-4-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20250910093347.75822-1-tianruidong@linux.alibaba.com>
References: <20250910093347.75822-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_023408_805265_0555ECBD 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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

Introduce atwo new HEST notification type for RISC-V Hardware
Error Exception and SSE. The GHES entry's notification structure
contains the notification to be used for a given error source.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 include/acpi/actbl1.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/acpi/actbl1.h b/include/acpi/actbl1.h
index 99fd1588ff38..0f04ef10f510 100644
--- a/include/acpi/actbl1.h
+++ b/include/acpi/actbl1.h
@@ -1534,7 +1534,9 @@ enum acpi_hest_notify_types {
 	ACPI_HEST_NOTIFY_SEI = 9,	/* ACPI 6.1 */
 	ACPI_HEST_NOTIFY_GSIV = 10,	/* ACPI 6.1 */
 	ACPI_HEST_NOTIFY_SOFTWARE_DELEGATED = 11,	/* ACPI 6.2 */
-	ACPI_HEST_NOTIFY_RESERVED = 12	/* 12 and greater are reserved */
+	ACPI_HEST_NOTIFY_SSE = 12, /* RISCV SSE */
+	ACPI_HEST_NOTIFY_HEE = 13, /* RISCV Hardware Error Exception */
+	ACPI_HEST_NOTIFY_RESERVED = 14	/* 14 and greater are reserved */
 };
 
 /* Values for config_write_enable bitfield above */
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
