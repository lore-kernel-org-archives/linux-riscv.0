Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F235EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 07:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e3DfKJgh2DzC6YeoqgyHx2tbr7MCb1HLclgnxvz4N0M=; b=Y/W/8g10oTXMFG
	7ju472nqaCWro58kZsthCUyFNqeng/ML1BDAoIGzsmSt9YAxQqgCzm85vGBeED+eIWC0TIksv9RZp
	TnyHzZ8V2CqHA2uDYuBx3Ya4w38ATXsM2BY7F4uS46zXElj9Xtwk3heZwJ94zB1FqeCzDHlguWqB+
	0U+BtQ/yzkP/pWcNRKzw+DqkGRXN/HBjoNH5EuY77QEH82LcNKMDR3ehgzxbp4eDGNZ1ELdAUIeB1
	NRcqQMyGs7Jkgqe/CP6pmR9Qski5B2fL6XAR715ALKl3WoIwBbZCIKjVg2IUWQH55dCJ3+oNE2WNu
	r0mTDFSyFNz+NfFx6GcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQk3m-000ZnA-1c;
	Tue, 01 Aug 2023 07:44:50 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQk3j-000Zli-1w
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 07:44:48 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-98df3dea907so767989466b.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 00:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690875881; x=1691480681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=duwQiPtNtN/ka+/qSDejTLlGxxydtKaBegoBst6LgQA=;
        b=bflEIgZJpGNTS6Jz8vjxQYTUlCm7p6fq9wi37gFvz6Gi1A1hnh7+v8PhmWz/e2NBHt
         J5vBY1o1UnhJ9Em3FKmkl6F/GOUY+oKXK2ghU7UXx9IeuxZHwAbmhkgcbTajXOEAWioa
         hPhxzLQnLBxTYZgO0jLt9sEd/xETN4tMB3uicL4jqtwOSmPEwbPVUwkEMEqcCsRw0CcW
         O8Iu1uOydcP8C2lk7QC045zuzj7rk5F2AZCsbOoDZDNhnLik1OBdgrOqbQxbqd9x7a9I
         nPLsvQ8EIffw4XaVl8z1SHccErANxiY2i0ZORp2GnU/RQ/VLV2/ykNyo2YP8gYDoWcmE
         XDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690875881; x=1691480681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=duwQiPtNtN/ka+/qSDejTLlGxxydtKaBegoBst6LgQA=;
        b=BKzfneSEHzS9ZUE6VHx6brl1V6KKE8xaKbkbsY0F9uKB0n0fU+hmVYm9FUctfreHhp
         tCRAQqkrWxslkCEJd3dQytOHX9pjmCbjCALPLxFq5aS2pEYDwDuAeFgNs0iV/jPmKsA5
         wGqx4dCU5iH0eocSzqQrxZjGzZg6rrm7v6Qowy1D3OADTb8xIH8R4tAQ/srj6dCnKsXT
         dgaLixlSohzEm3fc9XWCktHTWVCL1oB4pZgdB8EpUePJ+SrvE8mZ0ccZj+vIk+cZGlsd
         gs9bDI8xffcQpKw69pALPIemNzrGgLvSSnzQHdssHnSZ/Uv3e7ITE9EW2u2Ak9Y+uGXO
         4IdQ==
X-Gm-Message-State: ABy/qLYZw50w+OrHBhWgnwnoZ0VGRcqs0C89Di99PczO7aJR93xpzGby
	R0dZkENQ8tA7+eObqZSvOGo=
X-Google-Smtp-Source: APBJJlFqt6jAfAmLQZ3qXcE0/0wX91lgUIY+ZCroPI0JqeFIQL3K+Xkro0RoAHQ81Axcfx+wmIIYZA==
X-Received: by 2002:a17:907:77ce:b0:977:befe:d888 with SMTP id kz14-20020a17090777ce00b00977befed888mr1615099ejc.13.1690875880995;
        Tue, 01 Aug 2023 00:44:40 -0700 (PDT)
Received: from localhost.localdomain ([78.97.234.98])
        by smtp.gmail.com with ESMTPSA id m15-20020a17090607cf00b00993159ce075sm7168595ejc.210.2023.08.01.00.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 00:44:40 -0700 (PDT)
From: Andrei Coardos <aboutphysycs@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	andy@kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org,
	Andrei Coardos <aboutphysycs@gmail.com>,
	Alexandru Ardelean <alex@shruggie.ro>
Subject: [PATCH] gpio: sifive: remove unneeded call to platform_set_drvdata()
Date: Tue,  1 Aug 2023 10:44:30 +0300
Message-Id: <20230801074430.5179-1-aboutphysycs@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_004447_659515_581E330E 
X-CRM114-Status: GOOD (  12.20  )
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

This function call was found to be unnecessary as there is no equivalent
platform_get_drvdata() call to access the private data of the driver. Also,
the private data is defined in this driver, so there is no risk of it being
accessed outside of this driver file.

Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
---
 drivers/gpio/gpio-sifive.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index c6a8d2374e31..0010f607a9ef 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -259,7 +259,6 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	girq->child_to_parent_hwirq = sifive_gpio_child_to_parent_hwirq;
 	girq->handler = handle_bad_irq;
 	girq->default_type = IRQ_TYPE_NONE;
-	platform_set_drvdata(pdev, priv);
 
 	return gpiochip_add_data(&chip->gc, chip);
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
