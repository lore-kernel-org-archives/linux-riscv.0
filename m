Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9257ECAC5AE
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uNmdODb0SIBqK1q2fhgRq41PViB1A4TLBPXTDgPJiPU=; b=arIakRQ/nN1pYC
	kq7McPyc33NdTVRwLRFomkqVu9t+idFXo+6Lufxocp+rzlXH9kx95/iVwEe4EhPFgJnQ+FTGpiWoB
	yZ5xKc7u/KFaMINHAgTT7DbNYmC2sCiDWQFRglJXbZtwGAtLU+pwun0LuFTDVEbGoda2Q7V2SO1kJ
	2RtalZXbKpUacjGh7FpirfCDjZ7fm2FxDZbmsAiD+zAgpWMxhNw1xw0Qtls6BihDqOvoQ6gEURR8+
	SexBs179ozppoR512CHLbkxGFrMiVrO4jsXD6euPp4cLy9gPPjpjo+cG07PTfpRA7A8JPNg6/fqbz
	BXO7wDsFwLRpgzE7cZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MF-00000005tIi-1A7e;
	Sat, 20 Sep 2025 20:38:59 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MB-00000005tFS-1HCe
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:38:56 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-425715aeccdso835635ab.2
        for <linux-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400734; x=1759005534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfdnGB1sHNv96VJcVAg715QoFjcIQwVKNMZEvz9AAmU=;
        b=dPfgpsGq/9rgShoj38pT6gpRLTLe7hyz9Z7NgxSe7oOyShZIsR2Uv4OwbF6wcGj/Yi
         Ub8f50NndHLyJqrWP46IdH/0Bpy8+x5mD5yvpWJBdNlr5akiE7SgY+CMz5PNm/rxi/Ha
         2w2Bt0kuWCGNRvFyPpIJaCpmtwukLRWq90NyBHbs/qTQK0LWtJQi0KDgJwEFQBvi3dn3
         7a5fz3EW2M9Ah25d90rbBsgpVxvg5mFjWOxmSYJYiByWBWMTSE9HMHufFl2sFjya3I+N
         bBvW6ylFjIoqPBhs9WSQItcgYf5wrIAJU3ev1qprxWCT1h61/VrIyVD6o4E+qaydkM/z
         fPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400734; x=1759005534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfdnGB1sHNv96VJcVAg715QoFjcIQwVKNMZEvz9AAmU=;
        b=SiyI615qj5VBj1I6vVrqcg6o6/4DZNujV/Xhihu8V3lRya4X2HBeZNGUk9src03e2l
         tld9n2w9J8FYGY9JzXTI2GMyyPgZJlKGPBmwgiKpXxmiAUtcl8+L1+K/7VKR4CrMTxvq
         leFPnzNUUzcw+1RKIFs8rPLeKBOB8nSfimdjf7J1tKP6wxL19OwBiqJXFS0i9Cr41KfY
         Zz5oVsW55qsDB4gv/D4BgYHYkeBoSF3LOmAX2QJgqOkmYgYoq9x7m5Ugb+bV/moY590V
         g1iQSfCEiZPXbLGmrTA0lgaN+6gbtOBuk6J85/GaYS5agnKDKCWa14DbaYpr3x1xxTi3
         +jtA==
X-Forwarded-Encrypted: i=1; AJvYcCU3DT5uqU9TlfIJHHmFLjewxiusur++MDs4NXcU7zso+aUgW8BHOrHotkMi4VEL56jf0085tkpZsronIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ9nrLjIDevkXzuvk/eYQ1YoUV5vcrqzAmLDqkQwfXd5Pgy0Me
	rKDwuwKAwWR50sWfTHOOjVl1yf+o1QY1lOgPHgOiWAk3x9MoKWm1EyR/7EdQUIERYiA=
X-Gm-Gg: ASbGncu//YvQv+S79tJYMddaxZJ7XolmvRnwtDwsIiX+NqSARDHBeOQywr6hMkCzhBt
	V9aKGbI0hSQveSxB/vhvtUjLAgMXcocUPU8kTTtFaMkpyjr6W2kbXW0Pogj6CAUMpytepgFugqv
	KbeiTDksjUz+PVenLCi8PIagFi9X0KLvvLAY81vKOq7us1u9MDRfz/eGnkNyu6CgRHJfoSmmdsz
	f5Bi2Gi0rwjJ8jlDncr98GSxPahegywRabkuFiIJMR2Lbgc1vcKWFjdwcv4feocONSVX/L15jFv
	2cpGxjJ+XOiA2LjjBa/sNoRDFm2FrgXjPcoHPRj3C4rSTmwx71yjfUieLr5CbZ6pCQw4xMPbrYN
	cF7zNfOdHRpT4v365M1nadJmo
X-Google-Smtp-Source: AGHT+IER7JqLT6oTfCQWU199+6p/3PvuPfDuYsKata5YQ6Fx68IZQQdwLhEBfg4EZlP9xJt6h7cJ2Q==
X-Received: by 2002:a05:6e02:d07:b0:424:8c2d:ca45 with SMTP id e9e14a558f8ab-4248c2dccf6mr34706195ab.31.1758400734326;
        Sat, 20 Sep 2025 13:38:54 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d3e337de1sm3755155173.25.2025.09.20.13.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:38:54 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com,
	zong.li@sifive.com,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr
Subject: [RFC PATCH v2 01/18] genirq/msi: Provide DOMAIN_BUS_MSI_REMAP
Date: Sat, 20 Sep 2025 15:38:51 -0500
Message-ID: <20250920203851.2205115-21-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133855_343926_55755EE4 
X-CRM114-Status: GOOD (  17.04  )
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

Provide a domain bus token for the upcoming support for the RISC-V
IOMMU interrupt remapping domain, which needs to be distinguished
from NEXUS domains. The new token name is generic, as the only
information that needs to be conveyed is that the IRQ domain will
remap MSIs, i.e. there's nothing RISC-V specific to convey.

Since the MSI_REMAP domain implements init_dev_msi_info() with
msi_parent_init_dev_msi_info(), which makes 'domain' point to
the NEXUS domain, while keeping 'msi_parent_domain' pointing to
itself, there's nothing to do in msi-lib to add support except
to accept the token.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/irqchip/irq-msi-lib.c  | 8 ++++----
 include/linux/irqdomain_defs.h | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-msi-lib.c b/drivers/irqchip/irq-msi-lib.c
index 908944009c21..90ef0af866eb 100644
--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -36,14 +36,14 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 		return false;
 
 	/*
-	 * MSI parent domain specific settings. For now there is only the
-	 * root parent domain, e.g. NEXUS, acting as a MSI parent, but it is
-	 * possible to stack MSI parents. See x86 vector -> irq remapping
+	 * MSI parent domain specific settings. There may be only the root
+	 * parent domain, e.g. NEXUS, acting as a MSI parent, or there may
+	 * be stacked MSI parents, typically used for remapping.
 	 */
 	if (domain->bus_token == pops->bus_select_token) {
 		if (WARN_ON_ONCE(domain != real_parent))
 			return false;
-	} else {
+	} else if (real_parent->bus_token != DOMAIN_BUS_MSI_REMAP) {
 		WARN_ON_ONCE(1);
 		return false;
 	}
diff --git a/include/linux/irqdomain_defs.h b/include/linux/irqdomain_defs.h
index 36653e2ee1c9..676eca8147ae 100644
--- a/include/linux/irqdomain_defs.h
+++ b/include/linux/irqdomain_defs.h
@@ -27,6 +27,7 @@ enum irq_domain_bus_token {
 	DOMAIN_BUS_AMDVI,
 	DOMAIN_BUS_DEVICE_MSI,
 	DOMAIN_BUS_WIRED_TO_MSI,
+	DOMAIN_BUS_MSI_REMAP,
 };
 
 #endif /* _LINUX_IRQDOMAIN_DEFS_H */
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
