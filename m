Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3164C0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4bsULVPVUEZ5SCuAPjf06vcf6rEDgNPoe2ua7lW5vQ=; b=HIrtbiUJoNCDBe
	ZGXnjU/jZaeTbYsWz6Sw+rNPkSq5TMqzY8cmhgjrdP/tUMIOTh90fAXi42HglMCxu4FK/ciTIv66p
	HtACb5tJSxqAZ7qwlhTLEuBjz9eHD0J0AOruaTBRZFiNEz7OCug+FJA+Q+oo9KjeIYHhLRNeZs+Cv
	RXmnoFPG1p8hYLtybv6clLd8dMf4vQmNUxHYa8aZ4YHKZTfvyhips2oF68RxMKfZo9X7++JtCYYPv
	udswo5+EuZrl8MUnqzvs8oVqJ7tHwo/mPWpnJ/8PQC4IyYi7xfNP241JT75OC8Jd1Qbf4YDPf8Kn7
	AhIBQfxyNmQ0Q96eQn2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkRy-00D3ij-1q;
	Wed, 25 Oct 2023 20:25:58 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkRN-00D39u-36
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:25:23 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6934202b8bdso143405b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698265519; x=1698870319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kojFGf2ZSJMlibBdobzZmgsjyx4Ywkx3WkwDcrmlX4=;
        b=FM3RqCXHRS8e9rSjOEGPALVD3fXW+jeBCm+22uOx3zjwjgtLHLb5WIniIra844tqPO
         Au97AuOX1v9c9zEK8ZUOVzmLv8LNreALvSLw3IKmonqOCpvY9IJYzgAkBAy2KHTD/YGa
         LIxsRP2VQdYRpInAuz9DsT7myVsVjrlLgj4EDQwFqhY6OuUPb1BGn+2c+UowVhE1iFnE
         pK5jmkkMvFZgA+X7WVG7OYLyF60oZb1BrPKXB2EvzHW8Ji7isv+qqm0CNLelt5HmZO+f
         ieWCiAIv0Rh3VsYPI2pCN624r6qTMhs443PPPGv+2bntXIn/gxsLrGSHfmnEkuWcbjLe
         FJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265519; x=1698870319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5kojFGf2ZSJMlibBdobzZmgsjyx4Ywkx3WkwDcrmlX4=;
        b=OhohrMfGagoTbe029bGSEr3vFbc9ECOJxylo8bw8sOmFtDtvi7cBt0pk8hxjGFK+kK
         nqGvtqRQ1HSK+7P4/+57juSExaaixMcp5u7yt90ZferraJeVpXxVprTTXfHpqbeABznF
         mJUJ3Z1UHYHryiKu/KEHibBLxNQpTOpm/bLFYNe/sHQwk74NW8ULHb/fK7u4+Rprmcm5
         oltGXuBBCV3FpHAYhd7++54Tg9sm8Qq+V8xwERbr81YXeuUE13Khm3OpItnYN4Dyv6jk
         BT9oHTMtXhkU+uQXl5vohY49MEiloHMpMZ2kuZAWble++sKH7huaMBZNRG1PONd/7C8i
         8gww==
X-Gm-Message-State: AOJu0YwskDx4WBc5dcTaw7hZLS9YxwyvsIOQ8qF6cRhnV2vtNcZpydIe
	aWTx81sYOXxknA15zplBcRWtXA==
X-Google-Smtp-Source: AGHT+IEA5VCpygjnJt29h1aUuFMuVqz64Qf8m3MJ6i95Ryf0OFy3qLoON8TOXsusky9X3JJetvXkcA==
X-Received: by 2002:aa7:888b:0:b0:6bd:9281:9446 with SMTP id z11-20020aa7888b000000b006bd92819446mr19186279pfe.10.1698265518840;
        Wed, 25 Oct 2023 13:25:18 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b006b84ed9371esm10079590pfo.177.2023.10.25.13.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:25:18 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [RFC PATCH v2 12/21] PCI: pci-acpi.c: Return correct value from pcibios_alloc_irq()
Date: Thu, 26 Oct 2023 01:53:35 +0530
Message-Id: <20231025202344.581132-13-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025202344.581132-1-sunilvl@ventanamicro.com>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_132522_006209_A5C03FED 
X-CRM114-Status: GOOD (  10.56  )
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

Return the correct value from pcibios_alloc_irq().

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/pci/pci-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index c8c3369fd69f..80dc0b290544 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1528,7 +1528,7 @@ arch_initcall(acpi_pci_init);
 int pcibios_alloc_irq(struct pci_dev *dev)
 {
 	if (!acpi_disabled)
-		acpi_pci_irq_enable(dev);
+		return acpi_pci_irq_enable(dev);
 
 	return 0;
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
