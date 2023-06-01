Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C82C77B7E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 08:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+ghBfsSs8MoKpX5Va03GLxgHKjXIpdWL8i9ZK9ZNf20=; b=0TWgewd8AMPZJV
	1EFMOuD/KIxoQwQakIH6IshcWdySXC/sYv77ZC+UE8IVE4LxfACXR8oyhAaSL4wLQL6rub+CS1LVx
	FcyeH1DdY5nsXLl18W+4tnVzd3kJ8qhWJCa1EPfYnCrtj58l1VIXdtC3yTx9FY7YHtW+Z8KLKaLjn
	CIsKwA47BK5cd+Hu8DhuVR8BonfD17svtW20r6hztgr7ors95VI2gcfyEWeobaevL/ThxY20qdUj3
	8oyxcfXFq88CqpXkxiRqgFg6Em0S8hXJ8mjndYiY4jLg5YDvrdyeYUq/+gM4Y0J2ol+TmrzxbOOGd
	asYrRS2LDGKB2aA4GXYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4dcD-002Xbm-18;
	Thu, 01 Jun 2023 08:25:01 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4dc9-002XaI-2j
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 08:25:00 +0000
Received: from localhost.localdomain (unknown [124.16.138.125])
	by APP-05 (Coremail) with SMTP id zQCowACnrpLJVXhkdUgwCQ--.53814S2;
	Thu, 01 Jun 2023 16:24:42 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: [PATCH] gpio: sifive: Add missing check for platform_get_irq
Date: Thu,  1 Jun 2023 16:24:40 +0800
Message-Id: <20230601082440.30110-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowACnrpLJVXhkdUgwCQ--.53814S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw1UtrykKF17Ww43Ww4DJwb_yoWfJFg_Gw
	1kuFW7X3y0vFn0gF12y3yayr92vF95Wrn3ursakFyftryDu348ur17Xrs5ZFnxXr4UtFy7
	Gay8uw47Aa13GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbckFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
	ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUhdbbUUUUU=
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_012458_265241_D134063E 
X-CRM114-Status: GOOD (  11.06  )
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

Add missing check for platform_get_irq and return error
if it fails.

Fixes: f52d6d8b43e5 ("gpio: sifive: To get gpio irq offset from device tree data")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 drivers/gpio/gpio-sifive.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 98939cd4a71e..7bca9c415564 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -221,8 +221,11 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	for (i = 0; i < ngpio; i++)
+	for (i = 0; i < ngpio; i++) {
 		chip->irq_number[i] = platform_get_irq(pdev, i);
+		if (chip->irq_number[i] < 0)
+			return -ENODEV;
+	}
 
 	ret = bgpio_init(&chip->gc, dev, 4,
 			 chip->base + SIFIVE_GPIO_INPUT_VAL,
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
