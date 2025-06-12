Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C56FC7114B
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4PechUUPUsHSunuDYhwqoM6wFSC0MSAX1NhVptp5xn4=; b=dSz0OKNVaLF0gj
	2XRu8j056S7UTFrO+TKAvHZ/qfqMh+BGdY+ct7oZEkSwbaeeohf8GvPl3Lld8dOtVEul2GYu6vxE0
	slOO2Gx3Yrg61L8a43IXguaqWH3taI5zVyF1QGN8xeJAjkgVbPJCzHtkeVa4S9o2HNlKXIMs4yTgL
	uqkoNthym4YEOBFn5GZAakPMLmMmFbRMxNIRK4JlT2eRCWaL+yt/qybsjc60ILWnk5mgaqf3txtG+
	6VMeOD9mUZjromSGWLYSiM4FSMx5+rbMZE+cNypJ1a4D0fo2DVgYmXKaVgBAPvTFIbSO4LQr0gdx0
	YwtFqJrhTHkK5PCPjOhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowW-0000000EXT1-3Ru4;
	Thu, 12 Jun 2025 20:54:36 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPj5P-0000000DeBX-2Kd7
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 14:39:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749739163; x=1781275163;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6/mZP00EM9rJ5UOmw5xRb/tAHJW+hgPGA9vOCXCI5fo=;
  b=DTXGg1k3G7dJANzuQuygw9kXA06PPXjAca6MSYzvYQO1Kq/PI9D1NUeC
   aMI8yr1jlW8JoEWoylAGHf6GBFDi6fBraojZZSEhLC15E5mL1VqiRNmrF
   GMuxcb2IQj7+7QJLjvaOnR0kAp8UzJwRc6HH5JhhxN8XGwpLk6yf1JCl4
   Ghzssrk8TBAj2gwHXVR20XSikXR76fAjx2Tb9vKlSgvqyEl90wDf9Tgbo
   kAfdRveCtvmZAS7rsw4DRKT7GC6LHTCPAVDORQ0gFjGkjL9fVC3QTgkve
   Z0YOePVktWCkd3bp/1Qzq5g9zW5oFuzuc2/F42VRorf0/8pM3hqnOt2fQ
   g==;
X-CSE-ConnectionGUID: 74lIZzGrQlm/+9SCHFjGbQ==
X-CSE-MsgGUID: ONMQOBjLT0qAPL40KZRwnQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 17:39:22 +0300
X-CSE-ConnectionGUID: coDxqz9uTa2+dzqVxqKfCA==
X-CSE-MsgGUID: JoxQzBbCSY2r56AZOvU54A==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces02_data.me-corp.lan with SMTP; 12 Jun 2025 17:39:19 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Thu, 12 Jun 2025 17:39:20 +0300
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
Subject: [PATCH v3 6/7] irqchip/aclint-sswi: reduce data scope
Date: Thu, 12 Jun 2025 17:39:10 +0300
Message-ID: <20250612143911.3224046-7-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_073923_909411_55267823 
X-CRM114-Status: GOOD (  13.92  )
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

Move variables to the innermost scope where it is used

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/irq-aclint-sswi.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index 81d28a53635e..a604c7e1e416 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -68,11 +68,7 @@ static int aclint_sswi_dying_cpu(unsigned int cpu)
 static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
 					void __iomem *reg)
 {
-	struct of_phandle_args parent;
-	unsigned long hartid;
-	u32 contexts, i;
-	int rc, cpu;
-	u32 hart_index;
+	u32 contexts;
 
 	contexts = of_irq_count(to_of_node(fwnode));
 	if (!(contexts)) {
@@ -80,7 +76,12 @@ static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
 		return -EINVAL;
 	}
 
-	for (i = 0; i < contexts; i++) {
+	for (u32 i = 0; i < contexts; i++) {
+		struct of_phandle_args parent;
+		unsigned long hartid;
+		int rc, cpu;
+		u32 hart_index;
+
 		rc = of_irq_parse_one(to_of_node(fwnode), i, &parent);
 		if (rc)
 			return rc;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
