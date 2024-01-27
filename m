Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7422C46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 16:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qnm85etAs8t6tUWwiYPIv01Q/WrKedj8QNscXJ2HMKE=; b=kyNGnFXF9MmH+w
	t0gOEcZXq7Lxp+HKtmcA19+1hqKP/wJtAcHZ7Soj+MC4Ecn9PPimDf8UpNqJvxKLfRrsKVIwDl36m
	GAeML8a+Hd83z/Zfg43poaHhi6TJ5OWwrcmF7oovv8iaEXOND/V6yD3LilBw46Rsh+IsDso0wSZxl
	yeshreZfNEBJ/NULtnQY/4Wf0Lz3xNRjqJ9pX5CkF0vB16UND6X37MyZI1FXhuN+19dDL5KZPE7uI
	DrydTraoyz+1B2hRXRUwjZWHD++8N5y8c3AqlD0BsXYtq6Wfg5aKoFi6kPhiLNB/7TLw1b1/JJne+
	KKL1B3YK/XtSoXNGaBdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlPC-00000007kso-2bTE;
	Sat, 27 Jan 2024 16:19:42 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlOW-00000007kKq-2kUK
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 16:19:06 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d746856d85so8259525ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 08:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706372339; x=1706977139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gS7tKJF9YkEmWkNlSPZ/rvbRwowleOoX+c6J0HN4mAw=;
        b=XKk+quFA0HWIDuDfs8jb4ns0LgsnIUzwP7flxtfim3AeZpKvRp8Hy9bAlWffhNK2Ie
         8s5H95fIelGqiaA768PT0S9oI7fMICcPXH18M49dQzcpGIkY8WQSIXAW6kRpGInNRlTL
         yvRppsesB1LjiiWMBKE1QPPeArbUE3mybwokff10TO//xOq8Jqa2hzyhS2LLoZ6l843R
         gkyvwxE5GAdAaaEUhfAlbohbuyxt2zvGJsYzV0Tji0iYtPF8fa7dKKn7cjjEsAQ01p9L
         AkEe2WJiif+BxdiW+0ionCaMhvN0Ztwv/Gw6gxybTHGLzJT7UZCFPa8+Bu/mx9R6GJ+9
         TIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706372339; x=1706977139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gS7tKJF9YkEmWkNlSPZ/rvbRwowleOoX+c6J0HN4mAw=;
        b=bXKwbo7gDtbWzlbnmYVFUMcTUsfhei2bn+LrpgIvoQVOqWU6G/sHmvs3LnE94uzEON
         Hb3pQvLDeNq+WmaPwr7u4jQqzInEXBZZiT/38lDbmWXktSg1CZ++amHXnzC5gaSAdKE8
         2eFm8YeEIBVhiLWQt+zH2wRtFiip58SaZbuFGNnO6reetshUMx1VAExysjuu6TNXlcTJ
         WJc7iGzOnR+bbkqNBQRbCT1GLj60mG5tSbjoTeaVCIYkOlAj082f9LTdNUw4wexBuRo8
         eJkGoDt97j+Xe8whEdQ8LxsdbQNwMD1DrDBV1FTO/emlmzCW1e6QKQ8+/jieXxvOhnwo
         msRg==
X-Gm-Message-State: AOJu0YyeO+6ECU/3fYO1ZTYWpL2OEBfJVvlYBgdUJ3mU5cGUgG+sd36C
	W9iB9XOhmLi/gxl49DrF8EySHmBQU8wfgm/catVmT81MLoyAMH2RNsHAB8ZUJ8w=
X-Google-Smtp-Source: AGHT+IEBUp0hCCn7L8sX9sb+HHegemANWFUoOpOylQh+vsDyWc2YB/ckMjuHMjoiGdG/0Mue/ndfbg==
X-Received: by 2002:a17:902:cec6:b0:1d8:ae30:edbc with SMTP id d6-20020a170902cec600b001d8ae30edbcmr1005729plg.12.1706372339173;
        Sat, 27 Jan 2024 08:18:59 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.17])
        by smtp.gmail.com with ESMTPSA id d11-20020a17090ac24b00b00290f8c708d0sm5091620pjx.57.2024.01.27.08.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 08:18:58 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v12 07/25] genirq/msi: Provide optional translation op
Date: Sat, 27 Jan 2024 21:47:35 +0530
Message-Id: <20240127161753.114685-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240127161753.114685-1-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_081901_041177_D5D072AD 
X-CRM114-Status: GOOD (  18.18  )
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

irq_create_fwspec_mapping() requires translation of the firmware spec to a
hardware interrupt number and the trigger type information.

Wired interrupts which are connected to a wire to MSI bridge, like MBIGEN
are allocated that way. So far MBIGEN provides a regular irqdomain which
then hooks backwards into the MSI infrastructure. That's an unholy mess and
will be replaced with per device MSI domains which are regular MSI domains.

Interrupts on MSI domains are not supported by irq_create_fwspec_mapping(),
but for making the wire to MSI bridges sane it makes sense to provide a
special allocation/free interface in the MSI infrastructure. That avoids
the backdoors into the core MSI allocation code and just shares all the
regular MSI infrastructure.

Provide an optional translation callback in msi_domain_ops which can be
utilized by these wire to MSI bridges. No other MSI domain should provide a
translation callback. The default translation callback of the MSI
irqdomains will warn when it is invoked on a non-prepared MSI domain.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/msi.h |  5 +++++
 kernel/irq/msi.c    | 15 +++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/msi.h b/include/linux/msi.h
index 9bec9ca19800..fd184309a429 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -412,6 +412,7 @@ bool arch_restore_msi_irqs(struct pci_dev *dev);
 struct irq_domain;
 struct irq_domain_ops;
 struct irq_chip;
+struct irq_fwspec;
 struct device_node;
 struct fwnode_handle;
 struct msi_domain_info;
@@ -431,6 +432,8 @@ struct msi_domain_info;
  *			function.
  * @msi_post_free:	Optional function which is invoked after freeing
  *			all interrupts.
+ * @msi_translate:	Optional translate callback to support the odd wire to
+ *			MSI bridges, e.g. MBIGEN
  *
  * @get_hwirq, @msi_init and @msi_free are callbacks used by the underlying
  * irqdomain.
@@ -468,6 +471,8 @@ struct msi_domain_ops {
 					    struct device *dev);
 	void		(*msi_post_free)(struct irq_domain *domain,
 					 struct device *dev);
+	int		(*msi_translate)(struct irq_domain *domain, struct irq_fwspec *fwspec,
+					 irq_hw_number_t *hwirq, unsigned int *type);
 };
 
 /**
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 79b4a58ba9c3..c0e73788e878 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -726,11 +726,26 @@ static void msi_domain_free(struct irq_domain *domain, unsigned int virq,
 	irq_domain_free_irqs_top(domain, virq, nr_irqs);
 }
 
+static int msi_domain_translate(struct irq_domain *domain, struct irq_fwspec *fwspec,
+				irq_hw_number_t *hwirq, unsigned int *type)
+{
+	struct msi_domain_info *info = domain->host_data;
+
+	/*
+	 * This will catch allocations through the regular irqdomain path except
+	 * for MSI domains which really support this, e.g. MBIGEN.
+	 */
+	if (!info->ops->msi_translate)
+		return -ENOTSUPP;
+	return info->ops->msi_translate(domain, fwspec, hwirq, type);
+}
+
 static const struct irq_domain_ops msi_domain_ops = {
 	.alloc		= msi_domain_alloc,
 	.free		= msi_domain_free,
 	.activate	= msi_domain_activate,
 	.deactivate	= msi_domain_deactivate,
+	.translate	= msi_domain_translate,
 };
 
 static irq_hw_number_t msi_domain_ops_get_hwirq(struct msi_domain_info *info,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
