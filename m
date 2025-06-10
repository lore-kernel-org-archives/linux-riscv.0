Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99B7C5B552
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 10:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gbS5dHPDaPiomgrvpYVKYXfC14mwI6887JpyVhHnN/s=; b=emUSrJlAGq/bLF
	KHVS/ln+l6YBZIcLLb/G7iAfE0FYHdo5psJfXKjDJTO6E8LWHnb5nOHvO9fkNy6oMg7DZDgGIB3e6
	T6basJxb6YxuEa43OKt0fI4W3pAblDz/1NSDHFKG1dqRDiV0kHBD6OSV+wxx68XaUZpDfm1a0Fvpr
	TlqaFTj5Ta05cAbdFM7+QriJFo+wLera/088jmMGhwkU2XMRb5p+kF5IFI3oqQvXv6bBUIf+nc3OU
	IawOkveki6mBbB6OpGeClBSad5yRGc2EQanYK7dSLZl0wXWf03DBMlyw/kfrDJBNg5VGiPpTiJpRw
	DO3fnK0L4a9DcOcvD9tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwfe-00000006ZAn-3xJv;
	Tue, 10 Jun 2025 10:57:34 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvsS-00000006S6N-05Sx
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 10:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749550004; x=1781086004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yrAUwdd2dTnCDhtIRwLaXhkYCRfkmhb5FNwQyH1E6+k=;
  b=kMYE9hVa4zzJl38Rf9yupOPrr76jnohufKQbqwXqu0JpiNXoP1SUGFbI
   HCsI2ErTz0+DMp7IqzfhN0nTC9CVqZDlt2JP0MwoM7tW3pL9oJ41vipsG
   EwoqHPmXYxMRptj7yHySWnTUV/ywa2QBW2/+SOVWas7fJXOT4MqbHmz/2
   Y2je1as136UMkRGJM/YbB/KFc0+UGGp4+2H1J68lHpls2kLT8cks2qzzt
   F51nXC5yevTTxht/rB3ejvAFOYBnp0mrs2Qom8iw8ynT4wO4dJ59cu941
   2EFGEbbzGSxoF0ECXG8cm1hkdv0yA3HJz1mqrEuBWA5+nfiI8S9zT3sso
   w==;
X-CSE-ConnectionGUID: D0Ke/WOQSLqYZnyv3G1BdQ==
X-CSE-MsgGUID: I9j9gvMLSHeM31T2vNjpHA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:06:40 +0300
X-CSE-ConnectionGUID: kf7t9c2kS5OjhTjsVC/tJQ==
X-CSE-MsgGUID: m1n8WQB0R5K04I6yn90eAw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.1])
  by ces04_data.me-crop.lan with SMTP; 10 Jun 2025 13:06:39 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 10 Jun 2025 13:06:39 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v2 5/7] irqchip: aslint-sswi: resolve hart index
Date: Tue, 10 Jun 2025 13:05:38 +0300
Message-ID: <20250610100540.2834044-6-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_030644_320232_C1C9C6EE 
X-CRM114-Status: GOOD (  10.92  )
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

Resolve hart index according to assignment in the
"riscv,hart-indexes" property as defined in [1]

Link: https://github.com/riscvarchive/riscv-aclint [1]
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/irq-aclint-sswi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index ec21785df518..186a021beaef 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -71,6 +71,7 @@ static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
 	unsigned long hartid;
 	u32 contexts, i;
 	int rc, cpu;
+	u32 hart_index;
 
 	contexts = of_irq_count(to_of_node(fwnode));
 	if (!(contexts)) {
@@ -92,6 +93,11 @@ static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
 
 		cpu = riscv_hartid_to_cpuid(hartid);
 
+		rc = riscv_get_hart_index(fwnode, i, &hart_index);
+		if (rc) {
+			pr_warn("%pfwP: hart index [%d] not found\n", fwnode, i);
+			return -EINVAL;
+		}
 		per_cpu(sswi_cpu_regs, cpu) = reg + hart_index * 4;
 	}
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
