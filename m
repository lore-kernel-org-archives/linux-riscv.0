Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C72C46CCD
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 17:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVrYk6A4dJ2Rj+sjMxQvbpIMVVmV4lDM+BNHZsAxgrs=; b=mLO5yQfsS3ktdP
	cn0GhHYr93msiN0iuVHC3XZzE8PAfuOMesSXAxxApaDYiCIODuogOdRNjLybO5f2c8RNPlSFAILx0
	FiSUFA4ewwH9m3S91Jo4NiFgNmdZfv0wR7tFDOTj+T49gfiKmypfAP4dAJoZ9wEGI/bGnq20TOcEw
	S3cL6wM0HJ7o90FIlmLgLktVU/Z7s/56h92mCSHhkYMH8MaX2jAEOVKV8F9nQXl0hEL1hobC9ju/l
	K7yb0IuJQ+9z1QyhkG7zFXYxNSr2uNNhx7S98DNStmuatWMqLoJh5LwDmMNKhOqdP8h5qNc/MNwto
	DFZFFCDxyw/GBuTZTzrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeAL-00F0gb-35;
	Tue, 19 Dec 2023 17:46:01 +0000
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeAE-00F0dT-0z
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 17:45:55 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d3ea5cc137so1861685ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 09:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703007952; x=1703612752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmjC4RdyrxsTphcSUlyn0FA/9YESGtMGM8wLh/XfFs8=;
        b=oXJpzElgdocsq4cKSIWKDKJOpynKYUA6msSj3xM2pgp74Mnnlx1i7fYDnSJ/z7MauV
         chfJ467z+CEFtk1eu0OpgWGOmeEB668M0vcUCP6gBHRgyGv0ofObyLCDQCOyA5ACqYyg
         heRnMqP/5UQaSRuY8PRL4S7sanQ1jyC6hYbjwgkytTK4YdxVKlc5TimnwMPeOXAQiX2b
         cADzyp5YWL6sf/PCZ0sVEUgQJZ8HGGAR9iS2dwddr47H0M1+shi0goQTP8Lh3q8gIU9e
         SX4PK3wIDmRWglgNUU7a/O8Kp+rL9htc288M/xEjQvewNtHLRSWL9MEnawZVq+KfLDon
         GA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703007952; x=1703612752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BmjC4RdyrxsTphcSUlyn0FA/9YESGtMGM8wLh/XfFs8=;
        b=bEQ40KHG6UDaR3SYEEY7D0k1XCN78YfbxIF1cT4Z24lZQB1IbVHoYXpWxUrFJ2/HQy
         /4nKlvSia52KT9fIS8qZE/0HcA0B38xahd9AVTMsayEn5XynRFbknwKnm9kQOKvx/dOn
         nPDhlaHn2/5fOKHNCX7zEIleCM9bqxIqfkci4GecD3PDc9icpy1b/0QoMfFzKRcF1Cti
         RK+vQtjtc6wsscmjJsQYH6C2QbZWhYKoEGjUFEDZMM39AMiaGfKddJ34QRdWK8W83X9s
         Xzmd8QvNNw/Xo8gpoL33hB42h0Aqyl0c6kpO8ZB5+lsZqrEz2cholJ1yNMa1Y+HHEgZt
         SlqQ==
X-Gm-Message-State: AOJu0Yw+D/J8TjWoRDPkyxLCllAH/jDhrrhJKcu03XpdOO+mX53nAovl
	k577/x8a6OKdoIibCUCKWufJjw==
X-Google-Smtp-Source: AGHT+IGWi2Va1Qi6uqFOhvnkUNZMLVftSlFBeT8Hj5dDFOU/lfjLFJQW6CDFmhglgioUotv/TL88Sg==
X-Received: by 2002:a17:903:32c9:b0:1d3:c201:3bbb with SMTP id i9-20020a17090332c900b001d3c2013bbbmr3333704plr.18.1703007952281;
        Tue, 19 Dec 2023 09:45:52 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id n16-20020a170903111000b001d3320f6143sm14453015plh.269.2023.12.19.09.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:45:51 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v3 03/17] PCI: Make pci_create_root_bus() declare its reliance on MSI domains
Date: Tue, 19 Dec 2023 23:15:12 +0530
Message-Id: <20231219174526.2235150-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
References: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_094554_341207_367FF4B7 
X-CRM114-Status: UNSURE (   8.26  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Similar to [1], declare this dependency for PCI probe in ACPI based
flow.

This is required especially for RISC-V platforms where MSI controller
can be absent.

[1] - https://lore.kernel.org/all/20210330151145.997953-12-maz@kernel.org/

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/pci/probe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 795534589b98..9e941cf55d87 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -3054,6 +3054,7 @@ struct pci_bus *pci_create_root_bus(struct device *parent, int bus,
 	bridge->sysdata = sysdata;
 	bridge->busnr = bus;
 	bridge->ops = ops;
+	bridge->msi_domain = true;
 
 	error = pci_register_host_bridge(bridge);
 	if (error < 0)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
