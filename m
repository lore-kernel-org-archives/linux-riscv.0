Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6B7C7114C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JcBFaCsW8jJgovI86g6SXlwgKP67WvWIFpiEFd96JWM=; b=OTywE8BUj6xnsU
	L4H7zlI5BnE2fMMi/OFWTtxwSLd53woArnP6PGnIGVpmXLxHi0wqkyokVdGY5Ywg8axS53FfOuSAF
	ar03RQk0uGjq7KuEncbfAGBB2+BNRVJ+lWWN//EgEsX4zQotwQL0Wx+mDWabO07nF6U3WkdwjnuDU
	+erQ6FlchdVWG2ZeIjf/nwe2zDThbHnQJmlOX6psep7t0Su/sekiwuaSnSZAoVO0R2S7rXSScviIp
	wIOFEAWFGrJwBTfMzXFczmRctSxyH5yRX34tYAxucWc9i3XTlGjFpMq46yR9ublcrY/5BjgGVgUgs
	KWnbtbHilwxXbDRfjrpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowX-0000000EXUQ-2j3b;
	Thu, 12 Jun 2025 20:54:37 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPj5P-0000000DeDB-3zKu
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 14:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749739164; x=1781275164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qHQZtgOUSppdb/h/ZBO+JNEWe7/fBqOyl/vdXLNJOYQ=;
  b=qPhZ9XYC3hycCzmp0x7brCWoHr8Um/RS4goVt6mXOC1kaa3LwraExzQ7
   Br5esaUdU98l2jffrZ3NbwJRNZnxbz34blY4RhrTN3EK6grRPDA+jEgWB
   bimy96ZnWX8ualr6I1KAIyYrYSeh2OmFgY3h5KOx8OruZSxYEWz0LMfgl
   s9E0U9qvIxKrspqWWlMrsRqR7Uqahw0pVpTV/dC29oUmd1G6hN0+26U/O
   JF7qrC4XnNGz59mK5uRo7n8XvSuLj/zfmgOuv8eHq331+yjcxHpjRYwFG
   C7inn6dwZ3sKC4AYFdbV8BcOwnrD88ybYBasKbULbJ+ep7DgzeQhxo4SI
   w==;
X-CSE-ConnectionGUID: 74lIZzGrQlm/+9SCHFjGbQ==
X-CSE-MsgGUID: G26gDay8SwqP4bK68RvN/A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 17:39:22 +0300
X-CSE-ConnectionGUID: 7KsuaaKlTxqTEHgxHTSWtg==
X-CSE-MsgGUID: pZwLk6cwTG2vxbWmD9CagA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.1])
  by ces02_data.me-corp.lan with SMTP; 12 Jun 2025 17:39:21 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Thu, 12 Jun 2025 17:39:21 +0300
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
Subject: [PATCH v3 7/7] irqchip/aclint-sswi: remove extra includes
Date: Thu, 12 Jun 2025 17:39:11 +0300
Message-ID: <20250612143911.3224046-8-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_073924_287782_96BAA70F 
X-CRM114-Status: UNSURE (   9.25  )
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

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/irq-aclint-sswi.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index a604c7e1e416..51ecb509a984 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -7,15 +7,9 @@
 
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
-#include <linux/io.h>
-#include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
-#include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/pci.h>
 #include <linux/spinlock.h>
 #include <linux/smp.h>
 #include <linux/string_choices.h>
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
