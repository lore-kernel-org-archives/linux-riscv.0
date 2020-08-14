Return-Path: <SRS0=Z5mV=BY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF14C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 21:49:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8E0B20716
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 21:49:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1BMCKT3a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="dYHzppwK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8E0B20716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6A034GTAisnPIOOzN1b+fh2BpJYG37MWtT+BA7KsHIw=; b=1BMCKT3aj72nvIhJBzQt8eBh3
	Run86DyyBicy8H0njWJc5ZEhlUjhfUqD/72yRHHGY9Z00vZCzqGF8PMc4jXD/lnB2+PwF1I/t03cd
	gZl69Irfq2BvkS4jz3sEpZ7VBA/6yFv52M2j6EiRzmEDkFjSeYTxnZwtF5a8DYWdWeswmbDvh9Z+5
	HK6lm5VNfSzPe5UieM2bQuyFhNcaFjKya2HWY7rtaw9rKN4TMZvcMfLn1tDx0mkcYrs4O36G6YaZ7
	kukhhxtv0QB0W7WmCwKFnKJ1tx8xZ2k3MXWdXX+Kz9x6mkHkKhDncDDl9zu56JftSZroX/sCw0Rhy
	tszxqu4Yg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6hZG-0008Qf-95; Fri, 14 Aug 2020 21:48:54 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6hYv-0008IE-GE; Fri, 14 Aug 2020 21:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1597441713; x=1628977713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0l8UMU0Nf80nnOcPq6fS4BA8LVPERcrIfgcS5BiLKhg=;
 b=dYHzppwKZRNTqari1W/+UMbO1/OuYaJ5tqoDuJlAlNhGU+ivBs6Lx1E3
 gj5/6jmerslw6dx1BQeOSLaPoZwFSG24rraiDo8WwANP+f08mUYrgilOr
 I1LW707eXGiRzYX39GKQX/Js7eqlxUAe/poaJy3Ogaqf3qoin9Qw9YbV4
 k24ktGJtypItrvhYx5zEt76ltXGbVWv/pTNneeeYwp6XbsMAVkn7PrghT
 ieOdp7PxtD+T97DJQFeo9LcXtmxngvd3aii7C2Df0uVksO4Wre+kpCoPG
 d60jt0TYgLYA/PVhibwXKuiOZaSU5Z1IfXzVMtdLPW5oIgYDl+6hm1//8 Q==;
IronPort-SDR: nXqu3BIdOkQl8zeuy2mfK9whxVOREuMIhF+UNgRpMb6tAY3sDPEfFTgoxLpKEoKWlFzM2udEgN
 I4p1kcLfBTOai69nh4H9K+3TckqvR5pkqdicPy+Kv7ljEcKcgISY6YhnJFWqFDmf8+O7gXDIwd
 JcoxG3cjQKQxwx2FzuIBlwV1gdiIlE58WG079Eeh14v9nAMncXwoCj36IE2cmMS0TrYJExTybt
 f12T3rYzvDNGC8kfhEDrA8HmbHjwLArkBFCIW2U7H3GGnwzuHeQ2eb8X9mKzV6ZOrhazscRS/+
 Sc8=
X-IronPort-AV: E=Sophos;i="5.76,313,1592841600"; d="scan'208";a="254397130"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Aug 2020 05:48:30 +0800
IronPort-SDR: hLC02LxaymhKN8OZg9T2Z+5w76xfzAFyaiVBhS5CeoVfLTlkrVPoXAvG6dlVNalJjsbHdTJeyO
 yUiyWUUTqEdw==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 14:35:36 -0700
IronPort-SDR: GdemDOqwgj4kCAjq3L57gKGOb0BWT3gQzwEH1J+zYbKEVIRvsWAvkgfPVY9GgvZMY4uY0At5b4
 uSyUDwfD8Rkg==
WDCIronportException: Internal
Received: from cnf006060.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.56])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Aug 2020 14:48:29 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC/RFT PATCH 3/6] arm64,
 numa: Move pcibus_to_node definition to generic numa code
Date: Fri, 14 Aug 2020 14:47:22 -0700
Message-Id: <20200814214725.28818-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200814214725.28818-1-atish.patra@wdc.com>
References: <20200814214725.28818-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_174833_731334_38BF9EC8 
X-CRM114-Status: GOOD (  16.61  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atish.patra@wdc.com>,
 Zong Li <zong.li@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ganapatrao Kulkarni <gkulkarni@cavium.com>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Nick Hu <nickhu@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

pcibus_to_node is used only when numa is enabled and does not depend
on ISA. Thus, it can be moved the generic numa implementation.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/arm64/kernel/pci.c  | 10 ----------
 drivers/base/arch_numa.c | 11 +++++++++++
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kernel/pci.c b/arch/arm64/kernel/pci.c
index 1006ed2d7c60..07c122946c11 100644
--- a/arch/arm64/kernel/pci.c
+++ b/arch/arm64/kernel/pci.c
@@ -54,16 +54,6 @@ int raw_pci_write(unsigned int domain, unsigned int bus,
 	return b->ops->write(b, devfn, reg, len, val);
 }
 
-#ifdef CONFIG_NUMA
-
-int pcibus_to_node(struct pci_bus *bus)
-{
-	return dev_to_node(&bus->dev);
-}
-EXPORT_SYMBOL(pcibus_to_node);
-
-#endif
-
 #ifdef CONFIG_ACPI
 
 struct acpi_pci_generic_root_info {
diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index 83341c807240..4ab1b20a615d 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -11,6 +11,7 @@
 #include <linux/acpi.h>
 #include <linux/memblock.h>
 #include <linux/module.h>
+#include <linux/pci.h>
 #include <linux/of.h>
 
 #ifdef CONFIG_ARM64
@@ -60,6 +61,16 @@ EXPORT_SYMBOL(cpumask_of_node);
 
 #endif
 
+#ifdef CONFIG_PCI
+
+int pcibus_to_node(struct pci_bus *bus)
+{
+	return dev_to_node(&bus->dev);
+}
+EXPORT_SYMBOL(pcibus_to_node);
+
+#endif
+
 static void numa_update_cpu(unsigned int cpu, bool remove)
 {
 	int nid = cpu_to_node(cpu);
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
