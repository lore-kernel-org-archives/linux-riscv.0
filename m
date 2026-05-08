Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF9CCD3436
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 08:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=thkzLpqtqEopYQodbf6FiE7akdJc1sIu3q22FqX99SM=; b=BAtbPyrd44UwTI
	GgDbntXaA7/+0tEL0u1lYkxzKDmlnp23xNYiChessQCvxdtL7NCdqUehxveeaFhEYtj/Jbg5Zy3GF
	v4UR4RhzEZ0GsZWGBEyKnEt0EXCPyMJvIDILrJgjQ9gvUFTNP/9yy5W/XYrSI0NHdZY+TfRGKsxsz
	E2ma9MgKXmkyI/ZxdmCLIzmTidDFuYqg7sPF/iWK89HxUjU17SREEDIgi566zq6S8EAhOSynABpLi
	nPS5cvBE9hKl6DdfpGs2NWme/9P6StY5g+/N5U4P8iwAN/d+BtjktxZJq4kDlOCKrQLDhQ5ac5qcl
	Ove+SxJEwCR0V3hcEhGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGRr-00000005ygh-3Mww;
	Fri, 08 May 2026 08:20:39 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGRp-00000005yev-1856
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 08:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778228430; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=JFOE0oOtrup94m1Ct2dbwxOhyCe8CzDhIKZx+1CT/OA=;
	b=rgaZUly5bQ0b8Ob1C0xR+Mu+Iehkikqu/z01K/1qsNcFayzpWtPGJPYI1anCi+SUWj2H2Nmty6We4l2ves4h7ung7iMsqg4ASO2D2sma/ECgKOOlRGwSzTL00CawmAlIHWIUPYmH+6+hqNOT27q7gBVXy4T1AdwMe200jayDmk8=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R251e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0X2Wljwh_1778228426;
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X2Wljwh_1778228426 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 08 May 2026 16:20:28 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	rafael@kernel.org,
	tony.luck@intel.com,
	bp@alien8.de,
	guohanjun@huawei.com,
	mchehab@kernel.org,
	xueshuai@linux.alibaba.com,
	lenb@kernel.org,
	saket.dumbre@intel.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Ruidong Tian <tianruidong@linux.alibaba.com>
Subject: [PATCH 1/3] acpi: Introduce HEE in HEST notification types
Date: Fri,  8 May 2026 16:20:18 +0800
Message-ID: <20260508082020.3368109-2-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260508082020.3368109-1-tianruidong@linux.alibaba.com>
References: <20260508082020.3368109-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_012037_512988_66E5F3B6 
X-CRM114-Status: UNSURE (   7.82  )
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

Introduce a new HEST notification type for RISC-V Hardware
Error Exception. The GHES entry's notification structure
contains the notification to be used for a given error source.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 include/acpi/actbl1.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/acpi/actbl1.h b/include/acpi/actbl1.h
index 14924383e2d0..2c1ad1d8587b 100644
--- a/include/acpi/actbl1.h
+++ b/include/acpi/actbl1.h
@@ -1793,7 +1793,8 @@ enum acpi_hest_notify_types {
 	ACPI_HEST_NOTIFY_GSIV = 10,	/* ACPI 6.1 */
 	ACPI_HEST_NOTIFY_SOFTWARE_DELEGATED = 11,	/* ACPI 6.2 */
 	ACPI_HEST_NOTIFY_SSE = 12, /* RISCV SSE */
-	ACPI_HEST_NOTIFY_RESERVED = 13	/* 13 and greater are reserved */
+	ACPI_HEST_NOTIFY_HEE = 13, /* RISCV Hardware Error Exception */
+	ACPI_HEST_NOTIFY_RESERVED = 14	/* 14 and greater are reserved */
 };
 
 /* Values for config_write_enable bitfield above */
-- 
2.51.2.612.gdc70283dfc


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
