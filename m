Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC2FC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 18:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GKjM91nVx1GQOFeGWUuyfun+iVwJNKRbVOeV6Q9qhR0=; b=GThUOu1nHhJlka
	X9lwlXYaPvdyCnUS4GQDDzBQMsln7rcaTC8ddC1sHF1oPnSoJ6U9HyUNuuJ67ejHKjC6vIYIpWRuZ
	wXk43fmYHZ3RERRPsrT8srGcLIa+kVn95595QKecy0NCp7hI8SVqhK9J1vThz1woRT8RojQozJj2a
	p/4I9wMyti5xijhr/x2gVJFzulok/wqjRdHK+BK+wlFl817eTZsC3aLwXRCtPsIxMRyl8Jzkf/mqP
	UhdRmxuwfkty3hqIXYoNYVRnth+S4C2GoGx0ZDfacvcVp/XvvdCWBul6P5YCLb+FKD5ftXtggR6fM
	Ak02Y/qWBIUKka6yE+HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD8ZE-00AyDw-GD; Wed, 04 Jan 2023 18:32:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD8YG-00AxZI-4M; Wed, 04 Jan 2023 18:31:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D2281063;
	Wed,  4 Jan 2023 10:32:28 -0800 (PST)
Received: from pierre123.arm.com (unknown [10.57.44.105])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9E47F3F663;
	Wed,  4 Jan 2023 10:31:42 -0800 (PST)
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Pierre Gondois <pierre.gondois@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Gavin Shan <gshan@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v4 4/6] ACPI: PPTT: Remove acpi_find_cache_levels()
Date: Wed,  4 Jan 2023 19:30:27 +0100
Message-Id: <20230104183033.755668-5-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104183033.755668-1-pierre.gondois@arm.com>
References: <20230104183033.755668-1-pierre.gondois@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_103148_247462_48B499EE 
X-CRM114-Status: GOOD (  11.47  )
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

Also reorder the local variables in the 'reversed Christmas tree'
order.

Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>
Acked-by: Rafael J. Wysocki  <rafael.j.wysocki@intel.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
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
