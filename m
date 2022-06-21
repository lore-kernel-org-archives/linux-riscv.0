Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464CAC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 19:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PhMkisglPnDDc8GE1QZDb0IJtEQet/uWB3o8cK5k0bc=; b=oDZHvbL42NEcAM
	IZJ8/ETVkOEkqIbZGag60R3nUZPACul8sze5s1rLThv+UlIzP7EeueutDT20IUb607PstkrFIQ40z
	HwmYv0IUa9Z8B4lBb/kG4AOv9VvQB3vkW6i4SBKlC/qhkaqbAp0YBRnzQD8fe/MWZq6PfY9Y0esyI
	01XgbnkQ0VjbaoiBNWVjdEXnJWwXM8cAWECK/LE38LNP6G8I55FUc8+lPDF2hEib3bRkYFm5lG3/x
	m1Xsio/pQ/SWUH47I3LQlKOOF079ZtwILOleOQ38GLBCH1JtDDr3jRkDqOVYUopis0mxI+peO0TiI
	/kCU3p0xwO1NnoZpa9fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3jRQ-006oJh-4Q; Tue, 21 Jun 2022 19:21:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3jQi-006o1E-HO; Tue, 21 Jun 2022 19:20:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5440A1688;
	Tue, 21 Jun 2022 12:20:48 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 48BFB3F792;
	Tue, 21 Jun 2022 12:20:46 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
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
Subject: [PATCH v4 01/20] ACPI: PPTT: Use table offset as fw_token instead of virtual address
Date: Tue, 21 Jun 2022 20:20:15 +0100
Message-Id: <20220621192034.3332546-2-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621192034.3332546-1-sudeep.holla@arm.com>
References: <20220621192034.3332546-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_122052_688692_73A46418 
X-CRM114-Status: GOOD (  14.24  )
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

Cc: linux-acpi@vger.kernel.org
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/acpi/pptt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Hi Rafael,

If you are happy with this change, can you provide Ack, so that it can be
merged together with other changes ?

Regards,
Sudeep

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
