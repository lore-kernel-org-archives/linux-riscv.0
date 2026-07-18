Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE80BC4451C
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jul 2026 04:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jkrDwkZHQPrPzRlkVQeKvlHojnKyiV8ePpw2Qi+a2nU=; b=IEg8HkvWSQ0RcB
	hBILWzXwpHfaOOmYdb7IKCQgA9I+xMmw4NLgs819YFlWIYlK+2DRfbM/0RzvibozpqvVkpNd0l1uE
	4AvOR9U90mhvXL35RkRWj+wc161ub7ZXvb3dMaXim+eJXLJOXt9hpI30n2/AzpK+GxOzyVecrExQl
	4I6jYcJldL6mYx2JEzhOuhEXswwmcRshr5AcPqe936phdVi4z9+wyfPLkL1Il+UIYGSEFCXpz4/67
	Jvxh5ed3Y0psuBEfxTI+WbIx9fb4HwBEEz1eUlcHCv6WjMfw4mTJlstMDy7UIw2LF+U9qdOwVvkRw
	0XNtktdexCJ7EPe0jL+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkwnT-00000003gcp-1J7B;
	Sat, 18 Jul 2026 04:37:07 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkwnQ-00000003gcB-3aqU
	for linux-riscv@lists.infradead.org;
	Sat, 18 Jul 2026 04:37:06 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAAnM0HqAltqw04uAA--.37663S2;
	Sat, 18 Jul 2026 12:36:59 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Rahul Pathak <rahul@summations.net>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] irqchip/riscv-rpmi-sysmsi: Validate system MSI indices
Date: Sat, 18 Jul 2026 12:36:58 +0800
Message-ID: <20260718040000.006.d6f39b01-caplitmus-rv@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAnM0HqAltqw04uAA--.37663S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr1rKF48ur1UKrW7Kw13XFb_yoW8Wr1UpF
	Wjga9I9r4rtF4jv3ya9w48W345C3WvkFWjgFWjywn7Xr13Kryvkr1xuFyYqry8AF43Gw48
	CrZavayUu34UAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9I14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjfUoWlkDUUUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_213705_270887_7597EA13 
X-CRM114-Status: GOOD (  10.86  )
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

SYS_NUM_MSI is the number of available system MSIs. OpenSBI and the Linux
wired-MSI domain therefore treat valid system MSI indices as the half-open
range [0, SYS_NUM_MSI). The driver stores this count in nr_irqs, but its
translation callback only subtracts gsi_base.

For DT, gsi_base is zero, so an interrupt specifier at or above
SYS_NUM_MSI can be retained as the hardware interrupt number. The wired
MSI allocation path uses a separate descriptor index and preserves the
hardware number in the MSI cookie, so the domain size does not reject it.

Reject a raw value below gsi_base and a translated value outside that
half-open range.

Fixes: aa43953e862c ("irqchip: Add driver for the RPMI system MSI service group")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
index 612f3972f7af0..9d957f8a12477 100644
--- a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -174,8 +174,13 @@ static int rpmi_sysmsi_translate(struct irq_domain *d, struct irq_fwspec *fwspec
 	if (WARN_ON(fwspec->param_count < 1))
 		return -EINVAL;
 
-	/* For DT, gsi_base is always zero. */
+	if (fwspec->param[0] < priv->gsi_base)
+		return -EINVAL;
+
 	*hwirq = fwspec->param[0] - priv->gsi_base;
+	if (*hwirq >= priv->nr_irqs)
+		return -EINVAL;
+
 	*type = IRQ_TYPE_NONE;
 	return 0;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
