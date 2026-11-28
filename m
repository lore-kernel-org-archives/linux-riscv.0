Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BE7606A31C
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Nov 2026 11:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v95Pzp/M;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=GO+tAk1w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2aPaJm/Gk91dtM2Iu9GAJYzhX34lv+86AdiS/ujxD8Q=; b=v95Pzp/MmjbpNAEtkdAlFELbFV
	cJTmZOzUqYL0VMhtPlWenNOJ7MGrwahvmp5Dzhakyn0sXxuzMzdI1JF2sZwQ+wXdDXCKkkmyMb5CM
	3bmpqjZnrNhTRW0FeneRpcT1ke0RX1v69RHWcq65j+KNtGpMrpHO9bTVZ+xqJ5+A0HmNhgGlGSMTP
	5jY8i9CpknYa8U+gyF69TBp95NbIURfiHwRaDr7iqZdtEk1gleodUAH9FSwZ8FzbuvTOPGmhqptBO
	8NismoWUWE4l7rTFHWQSvkSW6d8/FoC/DJNDI1dXFRl3+wmVUO4uOCnfyA03Ui5lSWG+5y1lO3T3e
	jRZ3RAWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXGCg-00000000hT6-3gph;
	Sat, 28 Nov 2026 11:02:52 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXGCS-00000000hN7-0fH4
	for linux-riscv@lists.infradead.org;
	Sat, 28 Nov 2026 11:02:37 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5656652b1;
	Sat, 28 Nov 2026 19:02:31 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: linusw@kernel.org,
	brgl@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	maz@kernel.org,
	atish.patra@linux.dev,
	wesley@sifive.com,
	yash.shah@sifive.com,
	kamlakant.patel@broadcom.com
Cc: linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH 2/2] gpio: xlp: Unregister the GPIO chip on unbind
Date: Sat, 28 Nov 2026 19:02:29 +0800
Message-Id: <20261128110229.875394-3-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261128110229.875394-1-202300460064@mail.sdu.edu.cn>
References: <20261128110229.875394-1-202300460064@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0aa221d22c4503a2kunmfbc41f2a3cbc87
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTUwaVhpMGR1JH0lNSklJHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=GO+tAk1weVKYr8bx1pxZ5eTAGkxbZ1Esx1w9X3ZH4sfGSerk5jLFn4U7/K0jFqBv3q7Jf0qYnw7u3H/xJWCgbdCg0brXfYEfXQSjzV9PgiQB3N8Laz1St5wRwqrrch5i8d6F0in03WT+2SRA0sATflvIOe8FfSbB3XaVXkdwT1M=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=bvsCi811ICl989Zhp9gIItL7LZeR3KrMd+e1Qib+C28=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_030236_487775_F1950E5E 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The XLP driver registers its GPIO chip without removing it on unbind.
The GPIO chip and its IRQ parent array are both managed allocations.

Use managed GPIO registration so the chip is removed before its
backing storage is freed.

This issue was found by our static analysis tool under development.

Fixes: ff7188000679 ("gpio: xlp: GPIO controller for Netlogic XLP SoCs")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/gpio/gpio-xlp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index e9618608f2a0..89aab2663d62 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -291,7 +291,7 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
 
-	err = gpiochip_add_data(gc, priv);
+	err = devm_gpiochip_add_data(&pdev->dev, gc, priv);
 	if (err < 0)
 		return err;
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
