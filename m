Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC7BC02180
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 12:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q4ZT7dPTWskhKJhK/OZXIc0BGpOqcTK7bFvGv2c9mbs=; b=0SSIEHaze/ShKd
	yXXYloGOU5o5KJ+NS7PSsiwMqdGPtSDJ+dbiz7jWOX3z+xZyZbhgwMpLn7M7rirlSa7OjkjxuzyQh
	DFLccNWCwHsuU7TiImX/bFNeYusweMzw5trR6sRi/HOogaJoaLNOJGagx86i7WHfWgsyDM+KbhZlr
	DRtSZYeI4ZzwhH1RLHKVXRE9yM/rzAyZeAEK/02GcLZeVHjgPxQgOx7jpzatylY2GyyssbMCTYI83
	nnQDMLRhyqPy34nkyZU6sNI7xt9jptYyiKrEMeiLJGqT6rIwpVsIMNUxT9BQ5lK+ffIobOf85Vfdx
	gOEjXi1L311yE/vssnFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYOel-0000000Eq90-0Lm3;
	Thu, 16 Jan 2025 12:07:27 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYOei-0000000Eq8D-3RMK
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 12:07:25 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2f43da61ba9so1198872a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jan 2025 04:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737029239; x=1737634039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vjoIrNj0QMsZmobnE1Uo6wEuvK/kGWI+sEPaN56KSbk=;
        b=QxoA/Y/eP4IIVxV7aFh36DZb4IB5Q94+arhJBOH7mtyzF7+jCuKU6ZLWV8EAC5KeWD
         8g2DPqNXu+IpGPs8x1XGIMlAY18MaovXH1gDAg/k1GQwP0nbeTw+R86rmA0HE4+m5iCp
         QOLo5/Cq1zXTXbTzwvS3vi3NKSYnqRi3ysrg45+DujCF1BGsld/R1ZdlYlSgXFEJoyGZ
         2376GmsWp1NH/CbmO+pV0zQjUkz+xPCwGW5ZfFRPmi3ApiYvbeqb51BXH3i11WLlyPd6
         hjA9/yd6dXu0l9raY2+d9GCMgtNIWnA1crwbjqHdpB25QzdNCTjS92+cr/7AVHKxs4gJ
         Buew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737029239; x=1737634039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjoIrNj0QMsZmobnE1Uo6wEuvK/kGWI+sEPaN56KSbk=;
        b=CqFjrAiMNvwV6NImh0ngCGMiV/Z4T6s+GvxfYS17T21+/jR8OJGV7BoO+nIcMkQr5A
         gXYZRynsEkqDOLOn0XXEt+U94L6kgJ9lPZDDy6i99zozxsYSz/VcKw/Rf3yYDRI1XzMg
         WviFr49l9G0tM1jVfLFi4QTpCtE1qAJ4AVcaTnU0epW114jXhyzOBp3w0SZj5e37YeVi
         rNM8l+G/I3wIs+MSjcsQ5+8hc4wwWCXKYI50QljY4R2GszG4lQYlFD0Didh0ihR2LEy5
         85LHZYJk/E6+6FPuCgg+Z05YUsWjli4O5cWFgz0b7CZ8PoLJyHxdHKptIRJyLY3IFgQU
         +tNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWslRg4IO8uus4FSfkeND2iGGYdX5yX+dXfYbjXos0KNrg+q0ZukINw//9ceuYefXig3jPaz4W/dI2fg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRPpEUav8HACyTA6XQJ51FNRs/k728ZgvYY8d63mHgtVl+Mku1
	gvUeSvDcflkBVlLT3sR+1AM4t3WiWGb7F8SqiYcpHxtrv/lr7puDn23OHZyer7Y=
X-Gm-Gg: ASbGncs2M0vu6BC5nr6TXf+yRthspwPkpqk9hucFZwULdtTNQ0ryVc7dMxON67JFrxQ
	hzW/F8iuiCzamZLkMju8Mid6HfdbBmyTUCr2cA5as5NzyE1u1McbbJk7BOkzlSLopRx+qteAGEX
	gXQOJVeeJ8hDBh+Qgknvvk2pi/E2q7GLNAbq3yldUBq0bxhGIfcddgf7E+NyCA2DCcwJ0GFxALf
	GflmXheDyItu1gi4qwmAeiWVAmBS4KQUo4hMhfAg9bWYlBviEKC88/Hh3UIQ8U6gazHkI9Ca1lW
	zBhZV6GXYIfJcYur08KtDpCLfXG+LRbv8OuaNdY=
X-Google-Smtp-Source: AGHT+IG/9il8Yue5wq3oM4xM55blK3qfafjyNG3fhU5P1xQXgw0XjZHCXKdJv5mrxQVtLQUQ2Gsmqw==
X-Received: by 2002:a17:90b:1f8a:b0:2ee:c9d8:d01a with SMTP id 98e67ed59e1d1-2f548f33b54mr50115619a91.11.1737029239201;
        Thu, 16 Jan 2025 04:07:19 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c1ccc88sm3432507a91.21.2025.01.16.04.07.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jan 2025 04:07:18 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: anup@brainfault.org,
	tglx@linutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH] irqchip: riscv: Order normal writes and IPI writes
Date: Thu, 16 Jan 2025 20:07:10 +0800
Message-Id: <20250116120710.51673-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_040724_858898_13DCEC5D 
X-CRM114-Status: UNSURE (   9.16  )
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

Replace writel_relaxed() with writel() when issuing IPI to ensure all
previous write operations made by current CPU are visible to other CPUs.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c      | 2 +-
 drivers/irqchip/irq-thead-c900-aclint-sswi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index c5c2e6929a2f..275df5005705 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -27,7 +27,7 @@ static void imsic_ipi_send(unsigned int cpu)
 {
 	struct imsic_local_config *local = per_cpu_ptr(imsic->global.local, cpu);
 
-	writel_relaxed(IMSIC_IPI_ID, local->msi_va);
+	writel(IMSIC_IPI_ID, local->msi_va);
 }
 
 static void imsic_ipi_starting_cpu(void)
diff --git a/drivers/irqchip/irq-thead-c900-aclint-sswi.c b/drivers/irqchip/irq-thead-c900-aclint-sswi.c
index b0e366ade427..8ff6e7a1363b 100644
--- a/drivers/irqchip/irq-thead-c900-aclint-sswi.c
+++ b/drivers/irqchip/irq-thead-c900-aclint-sswi.c
@@ -31,7 +31,7 @@ static DEFINE_PER_CPU(void __iomem *, sswi_cpu_regs);
 
 static void thead_aclint_sswi_ipi_send(unsigned int cpu)
 {
-	writel_relaxed(0x1, per_cpu(sswi_cpu_regs, cpu));
+	writel(0x1, per_cpu(sswi_cpu_regs, cpu));
 }
 
 static void thead_aclint_sswi_ipi_clear(void)
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
