Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D21C25B6B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=graWO4bHsZpztl9DIUxSzrQw60qHRcpNRYBfod76qmA=; b=NZHNTW6WOCEoof
	sS2lwRNHWoCdRPViX6TuSQGxMwq7P5vJoWHgQ+lbiprRfpjEHjkMmAvKYUG89bZujXqIo7opNOwsF
	Mq/beFDtnTnutdKPLy8T5OnO0pfGENcVV3Pk261db4p8xoptxeDR8XkyZqbFr6HPvHfSqZcl6q+g+
	h1yA/noDnuOHIVeOth0WjzsCJWCdA4v/Hx+p81Jk+b2edIc4oGF2rZdhyqWqSv0RUUaUvMZ5o/9eF
	r3VeJbbq9fJVinsKtoCe8dkB3lJFH1rPXiOHQ/ufbnyXd82UmyGR7fKN0Cye59dHf8Me2Qx37E3Nn
	7mO9ASOcImApf4CaR3lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkQu-00D2pM-0k;
	Wed, 25 Oct 2023 20:24:52 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkQg-00D2fA-36
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:24:40 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6b77ab73c6fso101068b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698265477; x=1698870277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8S/JDCmwBJX/s4tcuif01AJjqTYAtUjVSzvHHCYv3Q=;
        b=Y/qiP1RQo8GKJEWBvFJB2O5Cq4UW/Tc87xjvUsCeo79JkHSzle5BV7K+xx6BiLR0CD
         MUPdEgWAq4TKsHjtkb+leY+1ipynmDx/hoMcrvXsd5g+AO6/tnfexFOM/vqTmEnLY47z
         ZxZm7SskfzQjF89I5UUnZBiXz9W7UMEyWnGSARyD8PoCk+pgwSSxjIj4wt4SEFTSN19v
         QU2gWQDc0nBEyVpK62W9t4lIX4P5MVDdj6/LZNPVGgf/Cv6KqjkdzERJtsjuJ9CBznMb
         y0Gn++odl/7FDAPtrdWKUq3c/6dJjXt37i9SaVQj44sANX/rn7mxS56jiRf8ytDv1fvf
         nICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265477; x=1698870277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8S/JDCmwBJX/s4tcuif01AJjqTYAtUjVSzvHHCYv3Q=;
        b=quBnF96xvVQaZ8Lz4vWJPbfdOAx60cjdmdG0uatr4bk+ttNzZnoJ4Hr7Z73xwClRBm
         sGhLPdFN61xHhR4xY71S9E64ePGA9G9YFm3jI8I+o1Z872d0FhcFRfS+WjaGmfTzSDri
         fqmeKjRGIe8oW9zVvj04W0kGYk+NzRPioNN9ochmeZXGaSxbHERF0cI30VomXOF6uxTS
         E8PNP8jgr+XDXI4ZrhweOLGrGFv+A40+KnLogncbyJCf8YvkT2Z3Kl/OYFDG0pjDXvV4
         PJSHL1QdXvhJIyBWpFK8flGX4oxivk5llzSTS+qP0nl5IQnXON1h9Y0ILyBzjhATIPRZ
         HztA==
X-Gm-Message-State: AOJu0YxlJQuycUI1X7j7dlsIoQvVJ5lJTgkjTlsNrAeg0ztrVoEbyZZA
	EonA0mUagT0jfEK5NcB770DWkA==
X-Google-Smtp-Source: AGHT+IGn0Ntg16V2ATutjBKN8vUehxORe09c59/GsjNsvnPR9Qebb6VfuMhALgVB74e2gHGUr8GJNA==
X-Received: by 2002:a05:6a00:1396:b0:68f:b015:ea99 with SMTP id t22-20020a056a00139600b0068fb015ea99mr913751pfg.10.1698265477463;
        Wed, 25 Oct 2023 13:24:37 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b006b84ed9371esm10079590pfo.177.2023.10.25.13.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:24:37 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [RFC PATCH v2 05/21] pnp.h: Return -EPROBE_DEFER for disabled IRQ resource in pnp_irq()
Date: Thu, 26 Oct 2023 01:53:28 +0530
Message-Id: <20231025202344.581132-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025202344.581132-1-sunilvl@ventanamicro.com>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_132438_999389_8E1E5C96 
X-CRM114-Status: GOOD (  12.40  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

To support deferred PNP driver probe, pnp_irq() must return -EPROBE_DEFER
so that the device driver can do deferred probe if the interrupt controller
is not probed early.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 include/linux/pnp.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/linux/pnp.h b/include/linux/pnp.h
index c2a7cfbca713..21cf833789fb 100644
--- a/include/linux/pnp.h
+++ b/include/linux/pnp.h
@@ -147,12 +147,18 @@ static inline resource_size_t pnp_mem_len(struct pnp_dev *dev,
 }
 
 
-static inline resource_size_t pnp_irq(struct pnp_dev *dev, unsigned int bar)
+static inline int pnp_irq(struct pnp_dev *dev, unsigned int bar)
 {
 	struct resource *res = pnp_get_resource(dev, IORESOURCE_IRQ, bar);
 
-	if (pnp_resource_valid(res))
+	if (pnp_resource_valid(res)) {
+#if IS_ENABLED(CONFIG_ARCH_ACPI_DEFERRED_GSI)
+		if (!pnp_resource_enabled(res))
+			return -EPROBE_DEFER;
+#endif
+
 		return res->start;
+	}
 	return -1;
 }
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
