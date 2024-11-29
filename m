Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3150D6EBE0
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Nov 2024 06:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YdARoZ4WCsCRbXRk8RLbV4sVPT759C3tkRUnMFkp4ok=; b=1497/xACNZQhRw
	6VT8RwSphSHrM6hM1L0wnYvi8ZD6XEaJm7oVBGOlMPREixfBe36tgRtiOyR1Que94DVqTXx6iCIps
	/oeZhyn1xP+8Jvop6uzqEh462Nd5YcKN1McZpbJIlDPDDdOT+V8BSdUrT7/Io2ckfYlmLaF/XvGvh
	i2NTwtVRLdN9q1tF36ra2+cjiiD0AQNuk7MYAh5MSUYjXy6GF+nVu4p4CAaQLIaz9A8h4nXbxl35P
	csDVMk57AkAUJ0OzUYS2F67hP7M7x8OE4qSGN1sN1RMYaT2CBoI2p60FGoXqL5ScAIuQAOjq46bQ5
	THJg+cS6tsSW7yB244MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGuvg-0000000H2C8-3zsn;
	Fri, 29 Nov 2024 06:56:40 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGuvd-0000000H2Bc-3Euj
	for linux-riscv@lists.infradead.org;
	Fri, 29 Nov 2024 06:56:39 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aa51bf95ce1so296724566b.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Nov 2024 22:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732863395; x=1733468195; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cZpu8a5EMmLER/Hz9zEMZQsXy/+FN55QQku8wtacaCM=;
        b=ydlxuWMPMYZWl0ZimzaquUiRwlP/guPwSJqa/o5WLUIJHwSpvGje6PLsg5sqiMMwfm
         ASWcswCscJ6I2PHmerW5LmlDs1exAjwG04NiA8tXhD8mhhIwO7FVBudqAiYrZQ0X2wMH
         CS+EsHF5Q0Zn6QYgJUsZSxa1SsfXlpG94ImdXu6VUDAvQb83OGV4042ydXW4Zz4MAcoC
         u7CuVHgiu5B25LNxsjr+G0oJDzu0fcm8Q0Ofdu+1DVNau/wVPNnxVsYemRIhB7urV/R3
         H/m6Wo/kfJmKQDPs0oe+5/0jqGjVBwCgh78mt3xYXjfv2QsEaaTy4B8GOyGbg46YCU1Q
         /BOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732863395; x=1733468195;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cZpu8a5EMmLER/Hz9zEMZQsXy/+FN55QQku8wtacaCM=;
        b=lCDvKzq6IoqBl7RvqQeDxQSBHMgr/K8XYC1JM6K4wHWVvxRFkLLvcKXxRCc9KmF5n9
         VQa4TcpMC8Q3vqmE37gMcdcbwTht26AJFymCJWTr0uAa+eGUP5YbZ54oSJpTxhY35Euq
         yX2kQTk25BdXy4Q6l+TTfe5jJOQzVn4BG7UR4IRTpQJog+F8szheqVGVmGRl8HaVnPBR
         unAw6SycoPHvLh7/UlYOjBWg7pbVNVlqCpN2HzjvbbMVbUFIgH/r89ZWEyj+Y+3GBta7
         16IygvqsN/R+SnmMSai0VASo54mcGldlZw5+iXt2nuc7yRR9biNattUb0BowuHsKKPbP
         NEeA==
X-Gm-Message-State: AOJu0Yy49URUVV8rm9uq1OnQGmPATe5Z28iW1qxnXkIQmkSoQzZO/Tbw
	sn8+CN55rcYwx9esjLFJZFc2w3S8xbwlENYgZFbFk/5K97q2pCAqTRs9SKlThSQ=
X-Gm-Gg: ASbGncv8vU25W3dmqFhuHPZNEqhJ7ghQIJFk1RqzYmJ/ezCV/26CHYVGij4zGAsqeCx
	XaDtHtEQ8Vn+ijvjf4jK8RZD1QiPure6B3nlhvr6s/WZZQzMZoBX6Ha0SU5BB3fjm82WBazXcTT
	/DHn1cZHdhrb1Usrh8Odc9UDgMBYLg8LhXUMqgySeMJtO+leI44+gC6X1wqf+NTaqH1kSM2LQcA
	h1JXVUx/2uHj6ked0sOT5CS7YvQfjRMOjTVN0IXBz/aOUmCkSljNQ==
X-Google-Smtp-Source: AGHT+IEdAlY0q42bKNhBnr3B+jWx4U+4nuqOEqn9vHD+VORQCfIR1boNcY2R7ZzSjKtfszAWEKQ3CA==
X-Received: by 2002:a17:907:770c:b0:aa5:38c5:c1c8 with SMTP id a640c23a62f3a-aa580f22b9dmr1016696266b.19.1732863395355;
        Thu, 28 Nov 2024 22:56:35 -0800 (PST)
Received: from localhost ([41.210.159.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6d96sm142786566b.126.2024.11.28.22.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 22:56:34 -0800 (PST)
Date: Fri, 29 Nov 2024 09:56:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-riscv@lists.infradead.org
Subject: [bug report] mailbox: Introduce support for T-head TH1520 Mailbox
 driver
Message-ID: <a99e72be-8490-4960-ad26-cbfef6af238f@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_225637_836759_B5BBE330 
X-CRM114-Status: UNSURE (   5.49  )
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

Hello Michal Wilczynski,

Commit 5d4d263e1c6b ("mailbox: Introduce support for T-head TH1520
Mailbox driver") from Nov 4, 2024 (linux-next), leads to the
following Smatch static checker warning:

drivers/mailbox/mailbox-th1520.c:535 th1520_mbox_suspend_noirq() error: buffer overflow 'ctx->intr_mask' 3 <= 3
drivers/mailbox/mailbox-th1520.c:548 th1520_mbox_resume_noirq() error: buffer overflow 'ctx->intr_mask' 3 <= 3

drivers/mailbox/mailbox-th1520.c
    525 static int __maybe_unused th1520_mbox_suspend_noirq(struct device *dev)
    526 {
    527         struct th1520_mbox_priv *priv = dev_get_drvdata(dev);
    528         struct th1520_mbox_context *ctx = priv->ctx;
    529         u32 i;
    530         /*
    531          * ONLY interrupt mask bit should be stored and restores.
    532          * INFO data all assumed to be lost.
    533          */
    534         for (i = 0; i < TH_1520_MBOX_CHANS; i++) {
--> 535                 ctx->intr_mask[i] =

The ctx->intr_mask[] array has TH_1520_MBOX_CHANS - 1 elements so this is
memory corruption.

    536                         ioread32(priv->local_icu[i] + TH_1520_MBOX_MASK);
    537         }
    538         return 0;
    539 }

regards,
dan carpenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
