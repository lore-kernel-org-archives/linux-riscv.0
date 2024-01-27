Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530F7C46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 16:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxhu02jcHsszVqtwWabTCT/nHQN83IaBdD9C6N+Aj4o=; b=RCdSty9FWkJ8n0
	L7cMfZBSVKbfz9lUD/vO83jP2ddWZup1CYmmGEZ+GkS1icUhguHU21S2XkKZ2IjOpAMz0Zr4Z0p21
	W5F+JdhvOckWFKDZNy5HpxiER5ub38rHFshgIJNuXe9jeN469ogzOB9hfyJfJO61GNTMlNtUISwpH
	dAmQG2XEO8Or/cqFtrEQryUkbkiLmqKLyNvYGRGACfticDG1+6ZSMa8htcISCLbX22PBc9eufZk8T
	2YJmoi5xKK1ZBR3cPZ8AjhcU9tgbvuZXzF0xAetVRRQjsvMqwkohjUYMYNFaQjNyeUHY8RFPHBpK/
	v9Jj0ULAUEkS50cyFZaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlQe-00000007lsJ-2fQs;
	Sat, 27 Jan 2024 16:21:12 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlP2-00000007kkR-20GE
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 16:19:37 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-290d59df3f0so1097940a91.2
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 08:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706372372; x=1706977172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pa75apFvoQqeTQYHEjcSyJSyGrlM+GD5Ss5R8F0skYA=;
        b=o7jZ46yW/54VPMGeufa8Hx6hiLMb8v/RRnAgFC8s7XrknJI1l10U0b5bofReOgHJk4
         9cgYe47yzTE6e6Hn99DWbLfFPi28gqfw1JGZhfo36s81f5QXgBRg1+UwFKIobFq5wQ9S
         2a4AGaqa1DUbyUWv8Igb7u0vtzRRX+jevrtdNUjUoi3cewGQ/BWGzaVpBIq4qmBOUkOL
         sALGe75bUmfvIGKH0LBbezpoCeqs5i5bHYg14Q2ju7iJ4M2EDSXoVypg6jytGXubuKRJ
         qRjr5YvjlzCv6JgbVr+mmD1O6Ge2XyMQpRLHEtEvL/SiBXGSdHHdzTqP7K6L5ud7DRkH
         wumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706372372; x=1706977172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pa75apFvoQqeTQYHEjcSyJSyGrlM+GD5Ss5R8F0skYA=;
        b=O4LwS++y5xo5MzJx1NlWyi//yGweyh6J9ferz5fPFE+RYQ28IQxCXQajmHsbtrttm+
         K2g19vSsK/yD5Bkv9iLhUnj2+nK/mkwGijK+YgNxzpgUnEucrE6QIjFqAN4jQZssMtI+
         eBgGwOHwk5uHejHSqmnJyeA1N0HkvmHU51WgsmcNemyVVk75so4ZXWYn0mK9TYL1jEAj
         CvIajJnVIFcyU2tASlXdsGzhg68Wq6JrtR86wDo/+S/2Dy2ZiViJvd19dmVonQE1evZ2
         sbKNMPeBcMK8HKhKWOsLz18Wg2PjsygBI8I9um8M06IH1Ii43fhOPbvPTI+Lp699I591
         xITQ==
X-Gm-Message-State: AOJu0YxpUh8TV+bOdJhaWL0Hyw7HIHimb7F4srYGIabAAY2yXZfu1lhw
	ihk/3OP2D+jZjwXdlqapwbPETWXBLMQI27oPmaYowB79T+YwZ6Dp5Hrxfq+2naQ=
X-Google-Smtp-Source: AGHT+IE/rJ2r2skLkyRBRQ7dQ1nBUrmMrx5hJrAYD8oWBMwqSdt16t4NKyP2y8H/3zZRRkEi017a7A==
X-Received: by 2002:a17:90a:72c6:b0:28e:8b5f:6406 with SMTP id l6-20020a17090a72c600b0028e8b5f6406mr1198317pjk.87.1706372371612;
        Sat, 27 Jan 2024 08:19:31 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.17])
        by smtp.gmail.com with ESMTPSA id d11-20020a17090ac24b00b00290f8c708d0sm5091620pjx.57.2024.01.27.08.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 08:19:31 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v12 13/25] genirq/msi: Provide MSI_FLAG_PARENT_PM_DEV
Date: Sat, 27 Jan 2024 21:47:41 +0530
Message-Id: <20240127161753.114685-14-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240127161753.114685-1-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_081932_688990_645C2A04 
X-CRM114-Status: GOOD (  14.09  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Thomas Gleixner <tglx@linutronix.de>

Some platform-MSI implementations require that power management is
redirected to the underlying interrupt chip device. To make this work
with per device MSI domains provide a new feature flag and let the
core code handle the setup of dev->pm_dev when set during device MSI
domain creation.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/msi.h | 2 ++
 kernel/irq/msi.c    | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/msi.h b/include/linux/msi.h
index ac73f678da7d..b21581ca8e9a 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -554,6 +554,8 @@ enum {
 	MSI_FLAG_FREE_MSI_DESCS		= (1 << 6),
 	/* Use dev->fwnode for MSI device domain creation */
 	MSI_FLAG_USE_DEV_FWNODE		= (1 << 7),
+	/* Set parent->dev into domain->pm_dev on device domain creation */
+	MSI_FLAG_PARENT_PM_DEV		= (1 << 8),
 
 	/* Mask for the generic functionality */
 	MSI_GENERIC_FLAGS_MASK		= GENMASK(15, 0),
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 07e9daaf0657..f90952ebc494 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -845,8 +845,11 @@ static struct irq_domain *__msi_create_irq_domain(struct fwnode_handle *fwnode,
 	domain = irq_domain_create_hierarchy(parent, flags | IRQ_DOMAIN_FLAG_MSI, 0,
 					     fwnode, &msi_domain_ops, info);
 
-	if (domain)
+	if (domain) {
 		irq_domain_update_bus_token(domain, info->bus_token);
+		if (info->flags & MSI_FLAG_PARENT_PM_DEV)
+			domain->pm_dev = parent->pm_dev;
+	}
 
 	return domain;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
