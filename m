Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DADC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 16:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rmeA7IhggcMN2eWoLzJSroIsoGfS5NAD2hwds3dRDAw=; b=rMZTRal9RlYVvn
	YdPisb9Ar3eeM4EPMH9CozFy+R57rXYm5yoFMPo5u/wDgnIUKpM2oQhF1z4DayPC9dUTG3R6WzSF+
	LImTza6ozNYPtbALwQSnvh0wdRneye7EiQ/FdMssCjtDQcuXIoBBnfZPC7S1NRvb9jk8UoSnS06tj
	WKW3nsQUE+oUsRFG+OSeiUJmhi2Mbr9Nb/rDRuyzHmDjhaRH0AM3Mqe7UlRGgibIXo/lfadNdnYtw
	zR6liB06nyLldEqTCB7DfXnpTLbr3fkceQ1P+OWFCMNr89qTWJKcDLZrQFbeJ9bSM5fufEilQ6sTs
	pecvCyGwfoepi2kw3D5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rxS-001uH3-4Q; Mon, 27 Jun 2022 16:51:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rx0-001u21-KW; Mon, 27 Jun 2022 16:51:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05639175A;
	Mon, 27 Jun 2022 09:51:00 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 09AFC3F792;
	Mon, 27 Jun 2022 09:50:57 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Atish Patra <atishp@atishpatra.org>,
	Atish Patra <atishp@rivosinc.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>,
	Rob Herring <robh+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v5 01/19] ACPI: PPTT: Use table offset as fw_token instead of virtual address
Date: Mon, 27 Jun 2022 17:50:29 +0100
Message-Id: <20220627165047.336669-2-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627165047.336669-1-sudeep.holla@arm.com>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_095102_784143_C03E5123 
X-CRM114-Status: GOOD (  14.93  )
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

There is need to use the cache sharing information quite early during
the boot before the secondary cores are up and running. The permanent
memory map for all the ACPI tables(via acpi_permanent_mmap) is turned
on in acpi_early_init() which is quite late for the above requirement.

As a result there is possibility that the ACPI PPTT gets mapped to
different virtual addresses. In such scenarios, using virtual address as
fw_token before the acpi_permanent_mmap is enabled results in different
fw_token for the same cache entity and hence wrong cache sharing
information will be deduced based on the same.

Instead of using virtual address, just use the table offset as the
unique firmware token for the caches. The same offset is used as
ACPI identifiers if the firmware has not set a valid one for other
entries in the ACPI PPTT.

Link: https://lore.kernel.org/r/20220621192034.3332546-2-sudeep.holla@arm.com
Cc: linux-acpi@vger.kernel.org
Tested-by: Ionela Voinescu <ionela.voinescu@arm.com>
Acked-by: Rafael J. Wysocki <rafael@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/acpi/pptt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
index 701f61c01359..763f021d45e6 100644
--- a/drivers/acpi/pptt.c
+++ b/drivers/acpi/pptt.c
@@ -437,7 +437,8 @@ static void cache_setup_acpi_cpu(struct acpi_table_header *table,
 		pr_debug("found = %p %p\n", found_cache, cpu_node);
 		if (found_cache)
 			update_cache_properties(this_leaf, found_cache,
-			                        cpu_node, table->revision);
+						ACPI_TO_POINTER(ACPI_PTR_DIFF(cpu_node, table)),
+						table->revision);
 
 		index++;
 	}
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
