Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191E1EE01E4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 16:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dTI92/HPJoNAMzx9gaJBTMi4VdZBWMd3rWo4wa//G5M=; b=jeL+mRxRndOBjZ
	9mfOBCB6+HLby7ZyJi+gB9cwWk0eBLjero4B2PMxwl2sZRZ4dAHqHioKjSePOMI0O2f1grV/pY0CQ
	yQWGoYeWIhbdJUdfbe5HCqSSK33AC3x1wDTCMZ+tvP1+dNudTrf27sdVgRP6JLAzh+2xdSeUOmhf8
	V7sIQT+PQOTodulSqgvcqQaP3P4LXdILkfgMwppaNK6IKYFPIFn3+VcND4W1Fx5Vr4Qy6vhfc99ET
	R7ZinG6QwqtoAIkCIIuC9/QNgKfJUUVK/Knuk80mCwIs8+AqQkHIcXUtBZFlCAxZBpbIT4vJOB6jm
	Pn8DipleDI8uBTeN2aqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSwJ-006Nz5-2R;
	Wed, 13 Sep 2023 16:42:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSuI-006LmY-1r;
	Wed, 13 Sep 2023 16:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0IaUdsZYMwZODNM6RHkcy8yl9XjtDnRmanHVV7mMIjc=; b=nNUYY/78lDus6hQdDAwrfCZrC3
	Aj4AnCW5G779xNFno7aQnBErDUOYHw7kuqGENZRzKMmeCfa30yKm+f+D2h6c8yjdxuAQH5oNDNzRU
	RFOAoDqIApk0TvqykSz5tEaRyV34l+UASUXNQcClIR0GM7afgHsUIAItlqIiRkI+1EFt/7DcDFS0K
	5bZNQAfbMKoOkoDZP3k0lOTNjDtP4kLmaKOU8HK7guuFfNIoO4Gv5aFcW1kXH7gHrT5F5yoo3ixBG
	PIZtvNM8peSxpvhF3cllC2j3Rfm/vbwGCpX6lV4DJSKswv6VvyIl06wzHLYDMRr2HcAC8U4pdQ7PX
	HLrjC6LQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSuB-007AQI-2F;
	Wed, 13 Sep 2023 16:40:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5359111FB;
	Wed, 13 Sep 2023 09:40:24 -0700 (PDT)
Received: from merodach.members.linode.com (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 585FC3F5A1;
	Wed, 13 Sep 2023 09:39:45 -0700 (PDT)
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
Subject: [RFC PATCH v2 27/35] ACPICA: Add new MADT GICC flags fields [code first?]
Date: Wed, 13 Sep 2023 16:38:15 +0000
Message-Id: <20230913163823.7880-28-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230913163823.7880-1-james.morse@arm.com>
References: <20230913163823.7880-1-james.morse@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_173957_445213_34C0A2E9 
X-CRM114-Status: UNSURE (   9.89  )
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

Add the new flag field to the MADT's GICC structure.

'Online Capable' indicates a disabled CPU can be enabled later.

Signed-off-by: James Morse <james.morse@arm.com>
---
This patch probably needs to go via the upstream acpica project,
but is included here so the feature can be testd.
---
 include/acpi/actbl2.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index 3751ae69432f..c433a079d8e1 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -1046,6 +1046,7 @@ struct acpi_madt_generic_interrupt {
 /* ACPI_MADT_ENABLED                    (1)      Processor is usable if set */
 #define ACPI_MADT_PERFORMANCE_IRQ_MODE  (1<<1)	/* 01: Performance Interrupt Mode */
 #define ACPI_MADT_VGIC_IRQ_MODE         (1<<2)	/* 02: VGIC Maintenance Interrupt mode */
+#define ACPI_MADT_GICC_CPU_CAPABLE      (1<<3)	/* 03: CPU is online capable */
 
 /* 12: Generic Distributor (ACPI 5.0 + ACPI 6.0 changes) */
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
