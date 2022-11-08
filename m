Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E943C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 11:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=imZCQ9fvcYqsxuj0DrKg/WF1pYTqurgAVxnEZjJ7O38=; b=MnCoTbqWukHWUy
	kwJ7xyr9r0f8NeKmrDBJ77jXF6hLigM9/+/8V7HEbdDkKAqebDGiubgVv1e+fLGNUo9dwcYIC+Um6
	YVzvIQTfURR5Bel4i9L3P2Lm1vx75WSroQ4QZ84fGHMd/i00acIulSwsb/hxmdFVu37YLMRQSiPQK
	KOF1nXNtC3xDG53sKVwnrfTB62msE47vCLLZUKFj7Yz+ZjCzBeoY+uehGRjjwGV60wi56JBpr9SSg
	ZpenCWZbER/HLRPS79O4UrYvKnDu0iXa0Q09k9oBdjR0ejtjGABtg1tgCxln5kFt5F4cjhimHhzHA
	q6gQ0nz3RjQOuvMg9p6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osMRT-004kPx-NW; Tue, 08 Nov 2022 11:06:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osMQw-004k7t-In; Tue, 08 Nov 2022 11:06:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77B41113E;
	Tue,  8 Nov 2022 03:06:26 -0800 (PST)
Received: from pierre123.arm.com (unknown [10.57.5.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9FE8E3F534;
	Tue,  8 Nov 2022 03:06:17 -0800 (PST)
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Pierre Gondois <pierre.gondois@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gavin Shan <gshan@redhat.com>,
	Peter Chen <peter.chen@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH 3/5] ACPI: PPTT: Remove acpi_find_cache_levels()
Date: Tue,  8 Nov 2022 12:04:19 +0100
Message-Id: <20221108110424.166896-4-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221108110424.166896-1-pierre.gondois@arm.com>
References: <20221108110424.166896-1-pierre.gondois@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_030622_705323_1C1981CD 
X-CRM114-Status: GOOD (  11.13  )
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

acpi_find_cache_levels() is used at a single place and is short
enough to be merged into the calling function. The removal allows
an easier renaming of the calling function in the next patch.

Also reorder the parameters in the 'reversed Christmas tree' order.

Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
---
 drivers/acpi/pptt.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
index c91342dcbcd6..97c1d33822d1 100644
--- a/drivers/acpi/pptt.c
+++ b/drivers/acpi/pptt.c
@@ -281,19 +281,6 @@ static struct acpi_pptt_processor *acpi_find_processor_node(struct acpi_table_he
 	return NULL;
 }
 
-static int acpi_find_cache_levels(struct acpi_table_header *table_hdr,
-				  u32 acpi_cpu_id)
-{
-	int number_of_levels = 0;
-	struct acpi_pptt_processor *cpu;
-
-	cpu = acpi_find_processor_node(table_hdr, acpi_cpu_id);
-	if (cpu)
-		number_of_levels = acpi_count_levels(table_hdr, cpu);
-
-	return number_of_levels;
-}
-
 static u8 acpi_cache_type(enum cache_type type)
 {
 	switch (type) {
@@ -613,9 +600,10 @@ static int check_acpi_cpu_flag(unsigned int cpu, int rev, u32 flag)
  */
 int acpi_find_last_cache_level(unsigned int cpu)
 {
-	u32 acpi_cpu_id;
+	struct acpi_pptt_processor *cpu_node;
 	struct acpi_table_header *table;
 	int number_of_levels = 0;
+	u32 acpi_cpu_id;
 
 	table = acpi_get_pptt();
 	if (!table)
@@ -624,7 +612,10 @@ int acpi_find_last_cache_level(unsigned int cpu)
 	pr_debug("Cache Setup find last level CPU=%d\n", cpu);
 
 	acpi_cpu_id = get_acpi_id_for_cpu(cpu);
-	number_of_levels = acpi_find_cache_levels(table, acpi_cpu_id);
+	cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
+	if (cpu_node)
+		number_of_levels = acpi_count_levels(table, cpu_node);
+
 	pr_debug("Cache Setup find last level level=%d\n", number_of_levels);
 
 	return number_of_levels;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
