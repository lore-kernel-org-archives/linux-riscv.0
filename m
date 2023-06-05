Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06205C7EE2E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 01:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1P1tPeBHwHssNQH6ojvdXj/BS/MX4TqHNudRxk6742M=; b=qLpOxAHwGZtJ/K
	+KNjY/S8+i58mBUexVc0tqZ5yl+CC9Vlk9aOlTFxonN42Sf578OMrCvCNlpx2IhEbjjLt4NufFjpd
	VcCrl39yOGYMIv6OoxTJbs7CrVhuH9efKswgV7N8678C17wO7s2UJOtxGKAOn4kQfZyHhSYwYt6QS
	Pkzo07gG+vkCR6bH6f5emlZujmEJVczb3V1HhKryYi0fHYIfqQJkLK1hW0XGEuvr7gOMy+brvPLyB
	RlK2FBmvm0yzMIituHu1BzSm+YQzVz7ioE7JdJ9LJpCAVcmC4Sz/W4Snznp+PJAKjXg1DQliHuI+u
	ADGLvkxjKEGSj3l0B/dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5zPy-00DgXF-2i;
	Mon, 05 Jun 2023 01:53:58 +0000
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5zPu-00DgVt-2M
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 01:53:56 +0000
Received: from ed3e173716be.home.arpa (unknown [124.16.138.125])
	by APP-01 (Coremail) with SMTP id qwCowAA3PAArQH1k+HKFCw--.7797S2;
	Mon, 05 Jun 2023 09:53:49 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: andy.shevchenko@gmail.com
Cc: oe-kbuild-all@lists.linux.dev,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: [PATCH v3] gpio: ath79: Add missing check for platform_get_irq
Date: Mon,  5 Jun 2023 09:53:45 +0800
Message-Id: <20230605015345.12801-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowAA3PAArQH1k+HKFCw--.7797S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JFykur1fuF13Jw45Zw15XFb_yoWDXrb_Cw
	1kXw1UCr48Cr9Iqr17Aw1ayrWSyr9rur1fur4vga13tr98A34kur9ruw4rZrnrWr18KFyD
	Ca4DGrWYvFs3GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb38FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUFVyIUUUUU
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_185355_161944_3DD1E1C1 
X-CRM114-Status: GOOD (  10.46  )
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

Add the missing check for platform_get_irq() and return error
if it fails.

Fixes: 2b8f89e19b6d ("gpio: ath79: Add support for the interrupt controller")

Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
Changelog:

v2 -> v3:

1. Check before assigning values.

v1 -> v2:

1. Return "girq->parents[0]" instead of "-ENODEV".
---
 drivers/gpio/gpio-ath79.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index aa0a954b8392..d2d838ad33bb 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -285,7 +285,10 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 					     GFP_KERNEL);
 		if (!girq->parents)
 			return -ENOMEM;
-		girq->parents[0] = platform_get_irq(pdev, 0);
+		err = platform_get_irq(pdev, 0);
+		if (err < 0)
+			return err;
+		girq->parents[0] = err;
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_simple_irq;
 	}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
