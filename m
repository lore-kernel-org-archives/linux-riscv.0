Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA28ECCF9F0
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 16:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WtZy2+okXm3XovQ+iY7ragh/phrdUCXzEqDQoqht2/A=; b=a7JZlnJA3x89/o
	VH5izI9iKAQ1JxXBixFWK9xO8C/f85cvyPOSqEl8iVtlaRosMONa71cGz/eIl6iZ71k4qICMxWnqe
	AdignoOvvVt41u/ykAVfKXjZf+818CSfAnPnFNtdbdv+0CWdQa4H4KyFNjJDg4rfU8wLdMP6DyM9W
	yegK7gz+z5w2f3JUFDgpprivMx3iaJedS9O8tdwAe6rYZnZatV2AImYOubX1niMeyvwieL/zIPsL1
	iQ+3ZPECYS34LJf0qcBNecKNLPxv++Hhgz6SSeohF+Et830ZFdj5QD87wKP6r6auOLIJ2wA3rt5sO
	eIQzIX8DRoD0bfqIMoEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97l-000000021m8-1W22;
	Wed, 29 Oct 2025 16:34:13 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97W-000000021Tt-1EMg
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 16:33:59 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-63c556b4e0cso6571227a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 09:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755636; x=1762360436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhxpRTp1uOQ7/yJc+0xNuSmcJdpaGHV/pw/kDcH2Yfg=;
        b=J9PHRKQx20ZLK6/NgN2ZZvMQRPVlUI/zmsLLiojgnoDdbHEU5rJ9fpeyoES2jb39P7
         fYya4x6iKsNgSaCRfmV9ZPSrvzyFasNe04UdZRQR+X18sRBPGEkWDJEGGptnacYC9m7S
         SZNLYPFXSLDOpC2ps21hdU45coMYZTwf1J95nLapsA+BP4GclZ0WrAzfuhuJp6ZhDs63
         KHebPrwMRLfFOS/vZNeZrb/4ugFslPwxHRbHgVcpNZeaY27TLgudEouC9oIe1UV85/+o
         qCobiLxKGTjRX+JicVbjBy7AulXEZv3k/39d/vGvp+gbR+swnHuiRibZ+GoXtzC5C2ax
         Y7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755636; x=1762360436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhxpRTp1uOQ7/yJc+0xNuSmcJdpaGHV/pw/kDcH2Yfg=;
        b=op95fY67LtD894h2h44MLf6HsID8rndPW1XDQmvxY6rd+B4HIYEE0uBxzHdAvr5kgX
         YF/nX1ROHT/pj7X8MO/XnSQYhvVeP8XozDepTy4MYbo4vHhc0IWIiRZ1wS70AkClAKZ6
         X9PNboWa18OQtl/RfM3UNC4qWP9uRAgWQJaXrISeHt/AoEIgDfi+TU7fAhj8gJ33mnJL
         KBeEOLv13TmAfKd7ze5ZPw0MVeRQsuYdAAXpzn9oRLh9A35HfGeSgSQllhbWDgJ08PaZ
         669p62B8bHeQmx8jqnEWvuOm3CVpbxF1wNcDvQAfMwCpFpcIuvAkYThgXPBGTnhqtBxz
         7MCA==
X-Forwarded-Encrypted: i=1; AJvYcCVBdQt21KE7uMo6pVi9NvB5oRJVfxvkRg+zmb5tHSVZ+dw7qH6fvWEFRkf4As6KcI0uV/0RHr24QYt2LA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjcIvq3KAv37qONMlZQJtosLrHGvQLOnCQNiEl8xF69WF8ap8c
	tA/3o2KCAEEx7jYTLf2Z1kOHmjGkCHskI4OROSQTX/at4r3Bq1LBCzTM
X-Gm-Gg: ASbGncu9nnZuuKrk+LX2M9YsL26+t7hpbiufMQkjyEFfu3eGxHwP32vEtFJDFRqoT3a
	6PEJaPEg4NVFNo3Y+nlzTtsvr+ADu2Wq2uit59lqQ3bLsXn2Wp1OYfoompCWNRS2ITO5a+7dOgG
	Xuoyr3vWy/kq/9BO8LwasVA5t9JRJJMmQROYv6mm1cQ5WkD6Pg5IJN5D3LsU+mnt84FLZibxxtk
	4NDzTXbGuyO0sIVWbTz62Y9WBiKNgXw82pJjduML678AvM6yC/2fX/TEwGORsjjr+at+q5FF2Hf
	ev9R8EiHIsjFDxpCLdaLAP/wSgKMVohyI39EAysLLNjrvoKWY3X8w4v67zkeWwcQcyKFImtOOur
	/oQUdkMI8elYG9TAwBt0csT3Zdjaj0gemCsS/X6pak+cw//GRGYv4n68lNHQYTbpQbz577eMiKa
	bo0NwnSj2TnEpnjK9miCEomn7s/Nmc+PaGoETwsowmXLe0Y+129e4UbJUXT54ZnBrg7i0e
X-Google-Smtp-Source: AGHT+IEBhKyqSuQzRg5+jPbNr1lJJJfXBtMjYTViFyDgVE4pc7ia4Gu9caVkoUUyuihmK5MM+ILYDA==
X-Received: by 2002:a05:6402:5c9:b0:62f:50ff:b675 with SMTP id 4fb4d7f45d1cf-6404437f5a7mr2656312a12.33.1761755636037;
        Wed, 29 Oct 2025 09:33:56 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6404de640fcsm1695354a12.8.2025.10.29.09.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:54 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] irqchip/irq-imx-gpcv2: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:35 +0100
Message-ID: <20251029163336.2785270-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_093358_356849_B676CA74 
X-CRM114-Status: GOOD (  16.93  )
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

From: Thierry Reding <treding@nvidia.com>

Pass the driver-specific data via the syscore struct and use it in the
syscore ops.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- adjust for API changes and update commit message
- remove unused global variable

 drivers/irqchip/irq-imx-gpcv2.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
index 04f7ba0657be..ebfc659af385 100644
--- a/drivers/irqchip/irq-imx-gpcv2.c
+++ b/drivers/irqchip/irq-imx-gpcv2.c
@@ -19,6 +19,7 @@
 
 
 struct gpcv2_irqchip_data {
+	struct syscore		syscore;
 	struct raw_spinlock	rlock;
 	void __iomem		*gpc_base;
 	u32			wakeup_sources[IMR_NUM];
@@ -26,8 +27,6 @@ struct gpcv2_irqchip_data {
 	u32			cpu2wakeup;
 };
 
-static struct gpcv2_irqchip_data *imx_gpcv2_instance __ro_after_init;
-
 static void __iomem *gpcv2_idx_to_reg(struct gpcv2_irqchip_data *cd, int i)
 {
 	return cd->gpc_base + cd->cpu2wakeup + i * 4;
@@ -35,14 +34,10 @@ static void __iomem *gpcv2_idx_to_reg(struct gpcv2_irqchip_data *cd, int i)
 
 static int gpcv2_wakeup_source_save(void *data)
 {
-	struct gpcv2_irqchip_data *cd;
+	struct gpcv2_irqchip_data *cd = data;
 	void __iomem *reg;
 	int i;
 
-	cd = imx_gpcv2_instance;
-	if (!cd)
-		return 0;
-
 	for (i = 0; i < IMR_NUM; i++) {
 		reg = gpcv2_idx_to_reg(cd, i);
 		cd->saved_irq_mask[i] = readl_relaxed(reg);
@@ -54,13 +49,9 @@ static int gpcv2_wakeup_source_save(void *data)
 
 static void gpcv2_wakeup_source_restore(void *data)
 {
-	struct gpcv2_irqchip_data *cd;
+	struct gpcv2_irqchip_data *cd = data;
 	int i;
 
-	cd = imx_gpcv2_instance;
-	if (!cd)
-		return;
-
 	for (i = 0; i < IMR_NUM; i++)
 		writel_relaxed(cd->saved_irq_mask[i], gpcv2_idx_to_reg(cd, i));
 }
@@ -70,10 +61,6 @@ static const struct syscore_ops gpcv2_syscore_ops = {
 	.resume = gpcv2_wakeup_source_restore,
 };
 
-static struct syscore gpcv2_syscore = {
-	.ops = &gpcv2_syscore_ops,
-};
-
 static int imx_gpcv2_irq_set_wake(struct irq_data *d, unsigned int on)
 {
 	struct gpcv2_irqchip_data *cd = d->chip_data;
@@ -279,8 +266,9 @@ static int __init imx_gpcv2_irqchip_init(struct device_node *node,
 	 */
 	writel_relaxed(~0x1, cd->gpc_base + cd->cpu2wakeup);
 
-	imx_gpcv2_instance = cd;
-	register_syscore(&gpcv2_syscore);
+	cd->syscore.ops = &gpcv2_syscore_ops;
+	cd->syscore.data = cd;
+	register_syscore(&cd->syscore);
 
 	/*
 	 * Clear the OF_POPULATED flag set in of_irq_init so that
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
