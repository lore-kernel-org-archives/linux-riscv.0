Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DF8C0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8AL4Fb0EDPusVJsd4dYvG3VIPwdAIagSHQ6vFIg4waI=; b=edZD6FNiKW0Uq5
	orjxoFRWXwYkdK5dDyJ2RyzfNhVZHMyPOoBSN4flYrn3mTzV2WeIm0+iBD+3E1+Q4TyzIqqugHnJ+
	6yL3SRfzWnCa8jmVGNLOregl5qQvxmMgUYt8XMCJ/ybk9Ht37z3Z7IhkT0NuO0fig8R/77cOZXWwl
	f02Yg3ZaXw1ObfXQOWMu4D7SoSNYB8Bg6/Jh4L3K0dhC2wgmftx5yH737CITc6YEZjZPoH7v+JfDw
	0zKlSsTnRevOtlRFDZczjPYKuFFufNmpignzZ8rMi838k+UAn0vI6c9W8HIiumhNucZrZuCzP91bL
	37xXCDC4pvXb/hhHSJvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkRp-00D3Zs-05;
	Wed, 25 Oct 2023 20:25:49 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkRF-00D36A-1x
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:25:15 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6b77ab73c6fso101447b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698265513; x=1698870313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksJT9a6E7b+AgWOW+0QqZAQKxEPs+GfkSTk4Wygp/9k=;
        b=jLcyAYhWtSv+vNzEATJ1S9hqFJrTjg89uY+BsZeaPunCRAhvwFkIo0WH5kZA/q7ss7
         +5bdvOToHeeGQJACB981qyWcGWch/UUAsufUY3nTRt+xdGSmJtNMUYYugkeTR4eULGYp
         keheaYVHZmhaxd/ziMqF6jrJYbvm5BtR1kIh5xfosQmWAe/l4pIMOFTPnR8hmGQw7LE2
         /+tJ7suTe67CRwnpRiezXO+JIrcACOpNtB/EeIeKJV0SwU+E6m7c5XuEgASWzljOLBpH
         vDTkdPO0N3ohYVuSg4cp3CdG//eFhzYyEDvgkkVinCpH+KjwgC20pzEFws8uuYGC7p8p
         gjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265513; x=1698870313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksJT9a6E7b+AgWOW+0QqZAQKxEPs+GfkSTk4Wygp/9k=;
        b=TQ3qXMFflvcDbM56VSylPMDDLsrJPspAU3kaSAbdzhBS/w9sbnfbRX4bmS/bTRIws3
         tzqvXaZ8JoUPChEVquO7yki4TK2edkZI6WX7NHsl5EBLE0r3OvBpomvVjynA8pRg6hf+
         DIo+Kvn30Su9LVuiA2B21P3f+ooUZeDXTFK1lmzFdF27WQNcgJSnLtIn3AyjmzbKoJwk
         6eES/00KA/bY/UpKFMTj4hM4wTc5xWJMO/KkcUaGbkoP6lDzoYdC0pgEgZvwN5ClSsvm
         WHz6uY57OXhEWFh/5EWsjsSbvqHzCUDqotqNJvEJ+lEIzhYBaEE3tANK5Z9hmD9X3Fca
         hy1Q==
X-Gm-Message-State: AOJu0YzX4LZBJ50MVyau2co0fy/RetKc1pji0TwzGornQCv11Gngaidt
	juA+dJmG4GiYVCRnEHtOPXaTmQ==
X-Google-Smtp-Source: AGHT+IEV/ROdZJJDw08iKQqN+bmgqdHT2tEV8SRCTGnJc4fD81is4j8SLEFb3dBe1vSckHTdkPvdfA==
X-Received: by 2002:a05:6a00:478c:b0:6b4:64ac:eab2 with SMTP id dh12-20020a056a00478c00b006b464aceab2mr801836pfb.1.1698265512788;
        Wed, 25 Oct 2023 13:25:12 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b006b84ed9371esm10079590pfo.177.2023.10.25.13.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:25:12 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [RFC PATCH v2 11/21] PCI: MSI: Add helper function to set system wide MSI support
Date: Thu, 26 Oct 2023 01:53:34 +0530
Message-Id: <20231025202344.581132-12-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025202344.581132-1-sunilvl@ventanamicro.com>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_132513_655724_828C0787 
X-CRM114-Status: GOOD (  10.72  )
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

Like pci_no_msi() used to disable MSI support, add a function to enable
system wide MSI support.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/pci/msi/msi.c | 5 +++++
 drivers/pci/pci.h     | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index ef1d8857a51b..e76ccb8b5f0b 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -913,3 +913,8 @@ void pci_no_msi(void)
 {
 	pci_msi_enable = 0;
 }
+
+void pci_set_msi(void)
+{
+	pci_msi_enable = 1;
+}
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 39a8932dc340..2f876c29f75c 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -167,8 +167,10 @@ extern unsigned int pci_pm_d3hot_delay;
 
 #ifdef CONFIG_PCI_MSI
 void pci_no_msi(void);
+void pci_set_msi(void);
 #else
 static inline void pci_no_msi(void) { }
+static inline void pci_set_msi(void) { }
 #endif
 
 void pci_realloc_get_opt(char *);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
