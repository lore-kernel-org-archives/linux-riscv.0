Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE9CCA0FE7
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 01:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAcjSGtY6E8+9P2DGr6fBBPz9mz0PuZJqP/ncY8Yat0=; b=f4pgEqgwlkf8H3
	5iiZ2kPSKlYxdfO4MR/Zbl52snJ2MrZ4zxzbPVkPRQO/Y7F5hH9cC8oiO4GaId1PJZYhvcb3ommH6
	QTS9SjyGYchVf25ktIw7rpFLyjGRGSvKwXiBUjvoxSS/wJxqv7HQtSCqF9pHQMcjNoYwMw0Rj34Xb
	200+i6WXxUls/4ccaNuQ/JqTb8gzGtSM7KQnRrjutEqHJRGix5PBloGUHXjXRq/anaF904ZMwyrDJ
	I1uuXDL7qm20OwBU2v/qioibTXmGLq6Z2MgL29fqSlYZ00YQGmaI2xb0bKd2nYHtXtDBzWLX6icXt
	QZg0zZbJLwxuUuZhFyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqiC4-0000000AG0w-0gAy;
	Tue, 26 Aug 2025 01:09:48 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqiC1-0000000AG00-1qjL
	for linux-riscv@lists.infradead.org;
	Tue, 26 Aug 2025 01:09:46 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-74374a65f35so3551336a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 18:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756170584; x=1756775384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKcbDX8RSeeRVr6XtjQvaqenalc/kXd0hVTqBKK4oPg=;
        b=cn/IxUn+keMag6Ud7W3SWFBeqv2wEmzq5aKv2g6RGtzMNkfSRvWsTtv0HyeoNlZKbJ
         jdgz9NdqiGi6VrtajVmKwNepVvCmPSQOKfKaTvmwdQSUPpxkr3HG4QZ/v9USjutbX45k
         Ziy0jYVryKr9cEqSaUjm1ybCRCRHi8RPTm+4OdUmEUBSm8GOz2RKbWdHfgQUgOCjCz6w
         z2BDU/T/VQ8HxT6SputL9zyL7WUD5/g46TCqISINqqr8Z+VP1+W1Y/mbyvQ4J6/f05Oi
         17eL598FWRaEZFOIOvPh7Q57AiMwLIgyCXq1472WNSAGLHlUcQHpaQQfAdRrxR1vVGdf
         PfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756170584; x=1756775384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKcbDX8RSeeRVr6XtjQvaqenalc/kXd0hVTqBKK4oPg=;
        b=rNaZnZrimeG+iW3ovwRh7kgKoGDUhx92CGuwgwjMElvg4+g01hYL1oWkS77HKfXndA
         JLdPyVWsEXCROUgeCB+ugeOx14FlK5+VGEETxaR3BIif7wjkCwr5mnPFLC4ZQa39V7WN
         GRE+2RPO4D9lpfljM6/6s0/dJLD0WzJM38hDJZ07kT716xC5ZvESNRXIbmNdYS+8kKG8
         cLnDbYGKJfFk7X+orUcX7L4AqroIJwBg9mYpcswNhb6xBxB9f00Ur50vPpUCmY6SFSMo
         k5KzJbRw/QUAg8ssM6XGNUleGEG2YhzsiMM1sMLek1FnciQSaFxjwFbCpHzAaKcGRzKf
         zp7g==
X-Forwarded-Encrypted: i=1; AJvYcCXUIoWIJVPOM7bUmo/ANKm5bPrAKojaWT6AFaCajQlzs90IVzMG9QJ0Xwi9e1Ni7yU03kPTAzmOgAMvYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/x41dcvueAoWc92nNmEjmPuT62vC2kOANqBB+rJ8xIaaFO6Fy
	8NlV+TGTT6HChXgsjojRMFTmIO6kekldlW3kq0XUE4MunjpFJ0xwiIHL
X-Gm-Gg: ASbGnctGD/iyx+d5ysYehIXZsyLpjpwYwMi0WFVWfQY6Sa2DKcGPX/ufmb6Uri5vTBN
	B/XvLakp7GJJcVtEm4R8AuBBdZjSryFGq/W3KO3dS9kCnsq3MTIWA52a/aGsNnEuoGFgUJRUW5u
	nnwpzYXone5oczoAo2kR4kGEsBi0E5v35erQJMYyqoZWZDEXM54IFPIIa8iSgPRW8GVonU0iMiL
	q25W7ovTrAaGSfqcHkZ/2fl++IsC73BJkq77+PejaOiR11bbTSil1B2kvHV0IivrCn8d0lAXVy2
	7jggajKdvgti6g8utkXI/zCGJ5jq9r/YQOJyksLV0bEaqnnpiBYhCil7gK7mkAL0lG0nD7Dt2jW
	Z9IKbv8Opv4sct9i+EgigbfDOM1+/ng38
X-Google-Smtp-Source: AGHT+IE6F65QfwFabXNAuH7zs863T2wcLpZREnYgSei9bH+TLiPtsmlTeVF5Ku/WEWK907SSi5O82Q==
X-Received: by 2002:a05:6808:1799:b0:437:75ea:6c77 with SMTP id 5614622812f47-437be056166mr849846b6e.20.1756170584317;
        Mon, 25 Aug 2025 18:09:44 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-437967dc1dasm1327704b6e.14.2025.08.25.18.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 18:09:43 -0700 (PDT)
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
Subject: [PATCH v2 1/3] irqchip/sg2042-msi: Set irq type according to DT configuration
Date: Tue, 26 Aug 2025 09:09:35 +0800
Message-Id: <49e70989c2f0a8a67e48527e57b4877262996214.1756169460.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756169460.git.unicorn_wang@outlook.com>
References: <cover.1756169460.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_180945_481889_010E7AE1 
X-CRM114-Status: GOOD (  13.67  )
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

The original MSI interrupt type was hard-coded, which was not a good idea.
Now it is changed to read the device tree configuration and then set the
interrupt type.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/irqchip/irq-sg2042-msi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
index 3b13dbbfdb51..f7cf0dc72eab 100644
--- a/drivers/irqchip/irq-sg2042-msi.c
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -30,6 +30,7 @@ struct sg204x_msi_chip_info {
  * @doorbell_addr:	see TRM, 10.1.32, GP_INTR0_SET
  * @irq_first:		First vectors number that MSIs starts
  * @num_irqs:		Number of vectors for MSIs
+ * @irq_type:		IRQ type for MSIs
  * @msi_map:		mapping for allocated MSI vectors.
  * @msi_map_lock:	Lock for msi_map
  * @chip_info:		chip specific infomations
@@ -41,6 +42,7 @@ struct sg204x_msi_chipdata {
 
 	u32					irq_first;
 	u32					num_irqs;
+	unsigned int				irq_type;
 
 	unsigned long				*msi_map;
 	struct mutex				msi_map_lock;
@@ -137,14 +139,14 @@ static int sg204x_msi_parent_domain_alloc(struct irq_domain *domain, unsigned in
 	fwspec.fwnode = domain->parent->fwnode;
 	fwspec.param_count = 2;
 	fwspec.param[0] = data->irq_first + hwirq;
-	fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
+	fwspec.param[1] = data->irq_type;
 
 	ret = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
 	if (ret)
 		return ret;
 
 	d = irq_domain_get_irq_data(domain->parent, virq);
-	return d->chip->irq_set_type(d, IRQ_TYPE_EDGE_RISING);
+	return d->chip->irq_set_type(d, data->irq_type);
 }
 
 static int sg204x_msi_middle_domain_alloc(struct irq_domain *domain, unsigned int virq,
@@ -298,6 +300,7 @@ static int sg2042_msi_probe(struct platform_device *pdev)
 	}
 
 	data->irq_first = (u32)args.args[0];
+	data->irq_type = (unsigned int)args.args[1];
 	data->num_irqs = (u32)args.args[args.nargs - 1];
 
 	mutex_init(&data->msi_map_lock);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
