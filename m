Return-Path: <SRS0=83+V=KP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467EBC433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 20 May 2021 19:03:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C087060D07
	for <linux-riscv@archiver.kernel.org>; Thu, 20 May 2021 19:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C087060D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+MWWoeIM2Zck1CuHpj4b79mppgQBSVtDuHcpRmvHKQ=; b=LZjKluDIuPmFiDF2HKrcsmtwZS
	ceFA0/GgOHKwdaVgOzrwPyYoM4q8HGRvFeNdw84YexwBEZoyyW7bK03Pvo5XUEcX3QVmU77Zs0S4A
	+35T0RoBvLEa0hOXj7DWmxF+eVx0AeU+fnBiBphIciW+ICpuE0ZYtcH9hYLVx1X/8JDTeILCiaG7l
	O6jZmiYLiJMlvQVTupUZ1Uf0k6DzKuDdEqL0AezOQqXX1N9kYqqQOEyY/V6st2X57x3u1t5lB8VI3
	dJI5NUNKdKIVSERUFAsGUJLYKJDPBH0WYC3tVCJ71/zlC/OiT4ujlmMV9pEbPx7xUewMUHag1g+Mc
	sslNn4fA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljnwf-002P0W-F4; Thu, 20 May 2021 19:02:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljnvA-002OgY-FR
 for linux-riscv@desiato.infradead.org; Thu, 20 May 2021 19:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=SBAKKQalOJHvEKpRKihiee3lgyfHDvw81EwoK2O6KMU=; b=0TuZhgEFCRiDQy//ULXNpUlISs
 9EQ7kLY9ugBrtgMB8cD+FaLM9jQWBq9B3/V5PMrLs3mwq72n5GMlxb5vW9NrQ/qa28w0AnwCAqNG8
 CCLDnKRHXOFVlrpMOtXD2WzpXnCow2hrR/VDKZrEyHwubUzo1ggDIIgN1ButFjK/hrkTkbp1LXwuF
 lYHmQegMtUzL8GtYL1i6t9TukKiIf6P3W7q0BidWkKyQGe3BmEpsSlkOaD64m1oOmJZGm4NmM9wJK
 neThQND2/gLTnqdOH4us2gkfiAej8u34AXA/1NvKYXtApIoeudCG2bindL+2Nf2DtI4I0HwAHQkrw
 aHd/roSA==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljnv7-00GaqK-Pk
 for linux-riscv@lists.infradead.org; Thu, 20 May 2021 19:01:23 +0000
Received: by mail-wr1-x42d.google.com with SMTP id j14so16978047wrq.5
 for <linux-riscv@lists.infradead.org>; Thu, 20 May 2021 12:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SBAKKQalOJHvEKpRKihiee3lgyfHDvw81EwoK2O6KMU=;
 b=TOvjUnExrJkfS1a45A6elsHA3Nl0rygE9dkkcvcFh7uIdhijihhEW8zz9F8JQcWqPR
 kvAVumtrWHiDB8TqE6unzMoO12ejgb5og9J8YLybBHJUDy7sgnIqJZsImgJEdH6I48kT
 +WLUmf3bQC8ISrYcCGnO25lOmgOJ60bVSo5aJu8sYffcdHdFmBWxtXJEJ/JCU8d1DzIn
 et09Sl6fYThOAIVhfqyZBsDepD2VA+Nxy9HMXXamTsLFUElmIWlTUeGR8jdX5M1AUC8y
 /h/c74ZlUYgJQRJl3cEgJr7yikN8q8eMcnajBiKVQvUpvC2lPlxt7tNsxJpNaRDpzCBD
 xh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SBAKKQalOJHvEKpRKihiee3lgyfHDvw81EwoK2O6KMU=;
 b=hHoeHUoYOoNl40G0AWf7/8UOCxM+XdvFIlYFR2hyPwzU88TPy+MkgoNeyLM+HmfXhC
 9Wy3SdVD1LvUO906W3gjj4tzyAwbQeted8FJnORV+7zsqedHuyfKBGaKKM5w2Edj/UtL
 ZRlaiMuRrJGD1zvPCJ9oRcLiTzE26ciZWz7c18j4NES/8GFRgZ5Lij/WfEGnb5EX3rBX
 XybTJewvf/I5+eW6X+I7YyqhZ7jU0vddzq/NUrMOKdWgL+DeLrR7/ja0oMPHy7fZSjz6
 1cO1/FHGiKVdzVcac4nHc/MaCurZ17pOGIseQ/eGcbxN4ZnAQAwg2M2s52LL5csx+rXi
 0Zuw==
X-Gm-Message-State: AOAM532xS0sgghX4G9B1GT3+yfJkNceg8ooe+GZGEmXt49sEoYKSLWdO
 EFqZ4VNnI/+FK2hz9NYQKymOzg==
X-Google-Smtp-Source: ABdhPJz+/a10pqf8oJ6E1JvsxS0ZPNJkmppgFWPCA+O5Gqw1gs8ZbTONZBJ3SYcvJc2naOp2wIYlFQ==
X-Received: by 2002:a5d:4046:: with SMTP id w6mr5792880wrp.15.1621537280605;
 Thu, 20 May 2021 12:01:20 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id p20sm9011899wmq.10.2021.05.20.12.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 12:01:20 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Peter Korsgaard <peter@korsgaard.com>,
 Andrew Lunn <andrew@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Larsson <andreas@gaisler.com>, linux-i2c@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 10/16] i2c: busses: i2c-ocores: Place the expected function
 names into the documentation headers
Date: Thu, 20 May 2021 20:00:59 +0100
Message-Id: <20210520190105.3772683-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520190105.3772683-1-lee.jones@linaro.org>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_120121_853240_E979A1BA 
X-CRM114-Status: GOOD (  14.12  )
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

Fixes the following W=1 kernel build warning(s):

 drivers/i2c/busses/i2c-ocores.c:253: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/i2c/busses/i2c-ocores.c:267: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/i2c/busses/i2c-ocores.c:299: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/i2c/busses/i2c-ocores.c:347: warning: expecting prototype for It handles an IRQ(). Prototype was for ocores_process_polling() instead

Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: linux-i2c@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/i2c/busses/i2c-ocores.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index 273222e38056e..a0af027db04c1 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -250,7 +250,7 @@ static irqreturn_t ocores_isr(int irq, void *dev_id)
 }
 
 /**
- * Process timeout event
+ * ocores_process_timeout() - Process timeout event
  * @i2c: ocores I2C device instance
  */
 static void ocores_process_timeout(struct ocores_i2c *i2c)
@@ -264,7 +264,7 @@ static void ocores_process_timeout(struct ocores_i2c *i2c)
 }
 
 /**
- * Wait until something change in a given register
+ * ocores_wait() - Wait until something change in a given register
  * @i2c: ocores I2C device instance
  * @reg: register to query
  * @mask: bitmask to apply on register value
@@ -296,7 +296,7 @@ static int ocores_wait(struct ocores_i2c *i2c,
 }
 
 /**
- * Wait until is possible to process some data
+ * ocores_poll_wait() - Wait until is possible to process some data
  * @i2c: ocores I2C device instance
  *
  * Used when the device is in polling mode (interrupts disabled).
@@ -334,7 +334,7 @@ static int ocores_poll_wait(struct ocores_i2c *i2c)
 }
 
 /**
- * It handles an IRQ-less transfer
+ * ocores_process_polling() - It handles an IRQ-less transfer
  * @i2c: ocores I2C device instance
  *
  * Even if IRQ are disabled, the I2C OpenCore IP behavior is exactly the same
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
