Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E73CC677C4
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 13:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j1BSZk1AApbb+XsB7yQZsUa5XmAWvk4Y+tnn2WZfnpQ=; b=TdC9VY2MhxJpLz
	IBvp4Ykx5mKCCzrdalYUkYztBq84NH+iAOC4Hij9ZmcS3XOmPU0oVg5q5cX0KojdreCl8IKUlIi0G
	jYwXrA2Z8nh30ftN/wIjGh2zKwlu/D/y321vVw/W5EDxIEDHA9NkVkOyK/YNcPQDyYolAGI9EAz7m
	S2R0VhtzeAOV/uCE+40p4GG7hZwwP/wmvZGku3wmIZeD77mRPkRrN6K++Wq0+LTiJI4joq9HQuHr5
	dNQOoCEVq9B5paVcvDd3AoGnI9c5s1S6j38p7qKb1ftt/S8Gr+y6nt8JhXP4MM0hPolKArOIE9ZyA
	dt3V9/mTRyzQCHNIPBCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOd1A-00000004KHw-3bxM;
	Mon, 09 Jun 2025 13:58:28 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOcrA-00000004Hoj-1ZPI
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 13:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749476888; x=1781012888;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Nh0BgWjlfbVva8flxENTWTA3JDu+LJ9JIi1F50J/Rk=;
  b=b7reKp4swZURaFefQMdy0IVhvqkqxlEroIK5E9dUydrmtd2HiBRYpnLw
   PI2sRMGwoeYRZ6HmPVGwiIhqqB7iVf5jRdWUQaSiCfWAX97JbQlA5aJev
   pbMHeQywq4PQ2FwobuldlUYx0/cwFdN0C3T9h6vvovfBhWSzsDtM0LGJ7
   u08nsHmeko52g3uOtJgFaJChgknekftPIP+MdM4s0weWCpbN2YBZGyXVE
   64QUuuAOlUo+eYwKwdbkx8mdQzHf+F3BmkBpg5wewViKYGIl3kkEyhB8T
   opwIfYRzx+sR3G6qL4LJ7yJHhylJC5y64pNnAJ2TcBi5+U6s1mnmKFpHe
   w==;
X-CSE-ConnectionGUID: AAAvlnACQq6rHu3XuFhSVw==
X-CSE-MsgGUID: bC2Tfu/HTtuqmdh3ZNucYQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 16:48:04 +0300
X-CSE-ConnectionGUID: 1XcxbeCbRB6oDqvIEWDlfA==
X-CSE-MsgGUID: OvgSC2WfTua6fFF0uQRAxA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces02_data.me-corp.lan with SMTP; 09 Jun 2025 16:48:02 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 09 Jun 2025 16:48:03 +0300
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
Subject: [PATCH v1 6/7] irqchip: aclint-sswi: reduce data scope
Date: Mon,  9 Jun 2025 16:47:48 +0300
Message-ID: <20250609134749.1453835-7-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_064808_703287_6D8C0BCA 
X-CRM114-Status: GOOD (  13.85  )
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
index 7ff43f685e92..92237fb44855 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -67,11 +67,7 @@ static int aclint_sswi_dying_cpu(unsigned int cpu)
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
@@ -79,7 +75,12 @@ static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
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
