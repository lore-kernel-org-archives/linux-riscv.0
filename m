Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9026FEE01E0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 16:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BTGmqohe7uHCyUO+EWS8m3JIjeUyjUeQ53Nu/u9vNYA=; b=UXwTQqWqG9iaAG
	OhgsMS+D3UtqiFfTMg64fut10d5Ad3lRRM9Fr2g3HhLRkgddj2bwuCdftF7hHvifbqj0TPphc4ahL
	70HjPHvZIlMvdtpgi2Hry6jQnSb9jfJ1Pie6sDYFyEjHuSafujcz5xcXmg5PAvRJ24QvOYpY4TX4j
	1VUUCC4EoZJT/LHHHia1Y269CvinxEwfYtoDSlGgSvMxoOLJ8IR+DZICvEzreapbttfpCIk4qb6b8
	4aBwABTLAZ/uOH4TV+LUSl811Jtte7VwZNSnoEW5e0dgW4PzV9ugMOO5QlLYvg9mBN4+JDRo1ciFB
	aaZVG6xilBjyRZGL4BWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSuZ-006M3A-2U;
	Wed, 13 Sep 2023 16:40:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgStb-006L8D-3D;
	Wed, 13 Sep 2023 16:39:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A2C21FB;
	Wed, 13 Sep 2023 09:39:56 -0700 (PDT)
Received: from merodach.members.linode.com (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F3BD3F5A1;
	Wed, 13 Sep 2023 09:39:17 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-pm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: x86@kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Russell King <linux@armlinux.org.uk>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com,
	justin.he@arm.com
Subject: [RFC PATCH v2 13/35] ACPI: Rename acpi_scan_device_not_present() to be about enumeration
Date: Wed, 13 Sep 2023 16:38:01 +0000
Message-Id: <20230913163823.7880-14-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230913163823.7880-1-james.morse@arm.com>
References: <20230913163823.7880-1-james.morse@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_093920_137459_03934581 
X-CRM114-Status: GOOD (  11.28  )
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

acpi_scan_device_not_present() is called when a device in the
hierarchy is not available for enumeration. Historically enumeration
was only based on whether the device was present.

To add support for only enumerating devices that are both present
and enabled, this helper should be renamed. It was only ever about
enumeration, rename it acpi_scan_device_not_enumerated().

No change in behaviour is intended.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/acpi/scan.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index ed01e19514ef..17ab875a7d4e 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -289,10 +289,10 @@ static int acpi_scan_hot_remove(struct acpi_device *device)
 	return 0;
 }
 
-static int acpi_scan_device_not_present(struct acpi_device *adev)
+static int acpi_scan_device_not_enumerated(struct acpi_device *adev)
 {
 	if (!acpi_device_enumerated(adev)) {
-		dev_warn(&adev->dev, "Still not present\n");
+		dev_warn(&adev->dev, "Still not enumerated\n");
 		return -EALREADY;
 	}
 	acpi_bus_trim(adev);
@@ -327,7 +327,7 @@ static int acpi_scan_device_check(struct acpi_device *adev)
 			error = -ENODEV;
 		}
 	} else {
-		error = acpi_scan_device_not_present(adev);
+		error = acpi_scan_device_not_enumerated(adev);
 	}
 	return error;
 }
@@ -339,7 +339,7 @@ static int acpi_scan_bus_check(struct acpi_device *adev, void *not_used)
 
 	acpi_bus_get_status(adev);
 	if (!acpi_device_is_present(adev)) {
-		acpi_scan_device_not_present(adev);
+		acpi_scan_device_not_enumerated(adev);
 		return 0;
 	}
 	if (handler && handler->hotplug.scan_dependent)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
