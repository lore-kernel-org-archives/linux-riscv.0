Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CEFCA0EED
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 07:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oXLgQdZEiPnrbWZKnRfxm09TGmIHTQqgCYNVOHAsbnE=; b=vjYs/Jrpltvqxx
	ex22/FMM/TPvOdLDe9zQrSRAnDM3J/PqqZnQLdyPxnvwoNO79Y+MrZ7Q8R6ZanfygjwfU035FGEls
	VeeA5o9ieljHKwlW2xg057G/Ywar3bjcUtGGKMCQUBGVTWfmbCiDF2cKdz5Q0rASmLNwUod4xyqJ3
	FtLCh5IVbwuChFRylEm2qAPnvAOuDPxNIqGjrJw4+jgquOs1d4Bki9Fs0eppFUlS/JnJKsNYOUYQz
	1sp0PS0B1ca7NjusytsPcP7FoYyg4Cb1ety5vy23PFGjy6cVqYZoKZTsUd3+XYaQLhB7/sCYRT5FM
	yKqMid6QuaU3Yp36Ly6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRej-00000007AZe-0QaH;
	Mon, 25 Aug 2025 07:30:17 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR6p-000000075EI-0pn3
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 06:55:16 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-61d99c87e35so1322067eaf.2
        for <linux-riscv@lists.infradead.org>; Sun, 24 Aug 2025 23:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104914; x=1756709714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+yGjr2heO21gMCA2kFQQZ2y9Wya4HGwCF6Hx9Cjwbc=;
        b=FxuTIpSNVn1+Mfn/a2BhnTcLbl/Q8mmClqC61f/oDXdSElOoXca7bgvbepZk2/t80t
         3xyPfItssqPlLLnZHgyZUNltqJ3RMN6cNHjSUhRXkS7aKzWhfGEgmNe8+s3Xfp5IvpN9
         kYK96SL18j7+9SUibGua3lLJGoQj3LwHwq5YyEEXZUm4RRGPCdFed/b6F3hTkqx0PPI1
         dLf+Ze+IZyP57kdVmvbg8BEuLMBaiFJPC3mseinWDrZOHqKY10pcAXolN325f/9bEAnd
         Nd6sREKE2Ju0WI3uiS/MAM8WCR7SLRHvgBf+nTJ665c48HL/UQOGKiEwT0HqCH6Cf45i
         iqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104914; x=1756709714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+yGjr2heO21gMCA2kFQQZ2y9Wya4HGwCF6Hx9Cjwbc=;
        b=bDaZcE1XpbISSUYtUmbk14rsY0yQvzQyfL7fO1J5Gyy5wTljpky3ETH5CEtwOgd/TE
         7cmMj0AuTDR3p30qNppVJuw/WpPFWElcbjy1W2FdMCo7TjL5Alq38tp/UOqMk+3WRH7K
         B5nQGBv9L9NPj0/b+2Zx90D7z+a47S9+L428PgohRSzs44vfVAmrhR6f/pwQ2ZaGl9ur
         folJM2A7vNBWHc9wHJNdMczCvjrVagAAqfHjj1zrtRJJ5pldmEYk0LAxeespLVuVcRcz
         7VDb07aCi4gwVcg+wJ4YD6GXuD7k+RknPfQHfBEuBdJDzJo6ag1QP9xwLfPcAI5lVxC/
         I3lw==
X-Forwarded-Encrypted: i=1; AJvYcCUndfkp8zHlrG37kVV9OI7pP3jiqEOLCKYoee19jIvGhhyCMDUAoAzDvtSciAD3qs3Nq2onVwgLfz4NVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCAb3Jmsgh1AVgRi10AZEx/UvYWQhCkJwGcteMx35mV5qKIEmK
	Io763liVFVBuo0YyltFgEtZ/5NqGm5OJn0Pow4lxoiMZyDhlbifMR6KF
X-Gm-Gg: ASbGncs6NJPWurRf4QJxduaRXxWt5VfZ59XveNtvUkA9E3CH5zmji32c5OhC0yKEqYI
	6S00HwKmk9whjmgzt6Sbegl2AASKDooH6+CrnhbW7oLLM69TMgJZY6yg40MCE5ytDsyP1WJZiuZ
	e6OODVEdBcW5LN6Xgfp/hZrLe7A1TC/E+rObjWA1u9Nrd9t+ly+rJJLyMoCOvYa6jqY7YgjBTUv
	JUBlz6kmX/Mw9PNR/rbsT+SsHcolJTlKqJ4ratglyt3tqpH/IFR233ZrjcnenfarzZsgKkOsCzM
	ER8VlHOgnwri3rqMGK3KkaAy2FbHNMJgo4s/5oiBkAknRnq0tSi9wPxOq+VnYipXJrRZ1w0qY0M
	HSoP04ZVvgWIDjRUizCutIMDw8EabCbXv
X-Google-Smtp-Source: AGHT+IHekG6OTGU3l6qQrokM25geuzr8Jsvhtci+xI2DkA29jrojoxfyJ2/APQwGqhsrHpj23jMdtQ==
X-Received: by 2002:a05:6870:249c:b0:30b:bb5b:8d8b with SMTP id 586e51a60fabf-314dcabd8e4mr5680879fac.4.1756104914059;
        Sun, 24 Aug 2025 23:55:14 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-314f7d98e29sm1618117fac.31.2025.08.24.23.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:55:12 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	looong.bin@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH 1/4] irqchip/sg2042-msi: Improve the logic of obtaining msi-ranges parameters
Date: Mon, 25 Aug 2025 14:55:03 +0800
Message-Id: <adb383f0f4a3cb588448a5a708fb7a907d5e9403.1756103516.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756103516.git.unicorn_wang@outlook.com>
References: <cover.1756103516.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_235515_237327_A92F072B 
X-CRM114-Status: GOOD (  11.68  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Get the arguments of msi-ranges by specifying nargs directly instead of
using nargs_prop. This only takes one step, unlike the previous two
steps to get the values of all the arguments.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/irqchip/irq-sg2042-msi.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
index 3b13dbbfdb51..5249afd93b4a 100644
--- a/drivers/irqchip/irq-sg2042-msi.c
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -276,17 +276,9 @@ static int sg2042_msi_probe(struct platform_device *pdev)
 	data->doorbell_addr = res->start;
 
 	ret = fwnode_property_get_reference_args(dev_fwnode(dev), "msi-ranges",
-						 "#interrupt-cells", 0, 0, &args);
+						 NULL, 3, 0, &args);
 	if (ret) {
-		dev_err(dev, "Unable to parse MSI vec base\n");
-		return ret;
-	}
-	fwnode_handle_put(args.fwnode);
-
-	ret = fwnode_property_get_reference_args(dev_fwnode(dev), "msi-ranges", NULL,
-						 args.nargs + 1, 0, &args);
-	if (ret) {
-		dev_err(dev, "Unable to parse MSI vec number\n");
+		dev_err(dev, "Unable to parse MSI Ranges\n");
 		return ret;
 	}
 
@@ -298,7 +290,7 @@ static int sg2042_msi_probe(struct platform_device *pdev)
 	}
 
 	data->irq_first = (u32)args.args[0];
-	data->num_irqs = (u32)args.args[args.nargs - 1];
+	data->num_irqs = (u32)args.args[2];
 
 	mutex_init(&data->msi_map_lock);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
