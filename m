Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6E6C87FCE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 09:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RmAfkcbvg0r8siLFTk1w+6hBR/Oziq77yFiLtHXeaUc=; b=2JsIx4mJD4EyQ0
	3gT/kTUVfcweVzltvU0xZ1Lu8c/9V/p9NDYR1T5ViRp4v8rjfPHgyxCqguCPXd8AGl7aTsLt9i9aZ
	/vmnFT6AlCyk/BgfpN+605UZ2aafZbpDVCfvikwn96qyPUpdULQ/n/iANpkYxsSx+3UrsC1hG5i0H
	VoWREJMy/+qXGnAFHcvoI+UPMEbs9tMK6kMge4Aa65YVilZdZDLr2N+ovH9H2AbkyWku8d5PR996Z
	kXP+bb5w4R4vunIAhGUmUf1ynjrIxZYTOK3AIeZ/PsvYGpq7vUTmkLVQs2/lZPivB3TgHkR4SUPP0
	PiidCb6icIxL8sdihfFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKOT-0000000E8kn-04O7;
	Mon, 28 Jul 2025 09:43:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKOS-0000000E8kW-1Ydp
	for linux-riscv@bombadil.infradead.org;
	Mon, 28 Jul 2025 09:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RQx4DIh4Piuq7HhjaN41eXcQRyGY2O2ucSjN2pwnllI=; b=UzyYbnygFCYrnwlc6fxK007EER
	i0el3Cdzqn9U2F6et4sug4qdJlL9+0QAj0zamEEbErxBrL4d1vkX1ULTiVQEUDfON0tDt21pdZenh
	u6bLZ1lv/IWtRhebT6m03I4u/xt61ld+g9PNiFqyn4cDXAkojslGaEDe/aEiF3BYOytBoeUeppZx4
	XLW5AdDDBwJs9QJbjC38adr42QOmMhpM8pCWxIlRiwd/crImAjXOdaCoF4EMRvoKhq0RIUE6ruAOA
	AMeP6rJ+WdeWmo+tmWxv6K8PvA8qX7+3/ZKh9LImnLEhR7UCKM71NkTF8T05E7TSpw+aQ0G+95yHu
	schUTTfw==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKOP-0000000CPjR-1UoL
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:43:39 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-31effad130bso480125a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695815; x=1754300615; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQx4DIh4Piuq7HhjaN41eXcQRyGY2O2ucSjN2pwnllI=;
        b=mDXqvnZ3rQ8AilaDlivHTTt4UdwBPBOVHVkXGGPGhAzP//kHbcN4Ob4LPRtvgugXkW
         duIrbnf4qiiwEfF8ojoWzpO/Tnu6+2cBbDDWOT5YQlqBWuf8clgJcE0L6kJQLtDT95P2
         mDK8V3y4Dpdx6NwIb6MVn2JV86MT8TAJBu7DJ0R4irX8BV60poqFuT+Jr7GTgibiizZF
         2luw6+eMLY0TPLhIcNkh1LZcsy+nFQYgZjAPDhVTg6sAeo5VjXPLfBvbBpNtAQYZJg6i
         CX/kTM7rZhFAtkRutLvWlBpXVAoH70tiUc252CQfWFGFIKRtCUrijTxH8M5gW/NjuQHp
         0+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695815; x=1754300615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQx4DIh4Piuq7HhjaN41eXcQRyGY2O2ucSjN2pwnllI=;
        b=lXW7lsakxL3KDbC9f+LxKdKUpbak3VzhIjmkbtE/IOeHi0H0EK15zHPDVGzKtbdZkI
         cZaeFe4erb5O5oLf5GYiVlM8Ad55gjx4PfYtSrXiwiuwdN79XMjnUFJ+3zPr3dpYulZy
         btK1KnyWWSCjlathaxjtrSLQHmfm6U+rZSa818y2CBmofX1a7VajmJEX0MsYTPN9IwGN
         8gPHdChLpQE33f72Ay9yZ+ihhnqubVxyiQm09fKRzvfzx3jm4AmtUPXbga7Qrk0Kfa3o
         QDaCgAG2B6qc0PSjA2UeWpqm4Lu6PZ4OxVzXkh5/leNyZYgjUsETA+Ex688l+Z5wZK3y
         xXew==
X-Forwarded-Encrypted: i=1; AJvYcCX/Roxtu+mBOPFlyFXY8bTgWSq88xe/dNqBeSar1PbuI26trehWlgLS2zfEeUWN4qMQACrF6bUtOV/hgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkIke9GmfirP3XAEWsoulbgto7rRru9k19GAVLzkechPY3wKc8
	MCGK3L+k1rGZL4EKw939ewtp8SlvfhBjAIflTAROtwRdN0bQ2oOkRz9wKY4CdpP5NCw=
X-Gm-Gg: ASbGncscScCWah/TX5tor4HBCQeDc1eLj8w9L1ai1Ee/wa8hXHyW56T0uP3Tr36HkLC
	4H71OmZE8RHhdmxhQlX4wpn4Jc/i2f/1L3Qejs5QXEoDfoC71JpTOzQygGpsL2hB+HrRRzGzfqr
	sJz9v2tSncQ2WUYPHa2IX0ky/nJecJTYWTUYQfut3trj7wYiZmJZS416wmFk55RCT37dGBcudyh
	4Vvjj1kADhEYbBtNVUn1DAbXlDUcUlmGtylw9hlR1tuC6mzbNCr7tBpHxKKV/FhMhMrYXN/at2u
	TaSG6K9erPwezMKsrolfhJ4x5/VRHlwMtXcAIWK/A6qV0FXkM/tNwFM6cJsv+/MdeIQnxZq3Aa7
	doSMAhFc5XpWAC/gwUZvdrag6oK2G20Zy1cZnXN4hSmJ148eQwcp4ukhK9nsR
X-Google-Smtp-Source: AGHT+IFdcj9UyigKt6rPUnP9ob7R5oKYx3exa18ogG0RTJ8u+ssoeGzkdetp2bS/IhUP8p/ILwtVag==
X-Received: by 2002:a17:90b:584b:b0:311:e305:4e97 with SMTP id 98e67ed59e1d1-31e77a01261mr16532165a91.19.1753695815287;
        Mon, 28 Jul 2025 02:43:35 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:43:34 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v9 16/24] ACPI: scan: Update honor list for RPMI System MSI
Date: Mon, 28 Jul 2025 15:10:24 +0530
Message-ID: <20250728094032.63545-17-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_104337_538794_73C6F1D0 
X-CRM114-Status: GOOD (  10.66  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sunil V L <sunilvl@ventanamicro.com>

The RPMI System MSI interrupt controller (just like PLIC and APLIC)
needs to probed prior to devices like GED which use interrupts provided
by it. Also, it has dependency on the SBI MPXY mailbox device.

Add HIDs of RPMI System MSI and SBI MPXY mailbox devices to the honor
list so that those dependencies are handled.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/scan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index fb1fe9f3b1a3..54181b03b345 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -858,6 +858,8 @@ static const char * const acpi_honor_dep_ids[] = {
 	"INTC10CF", /* IVSC (MTL) driver must be loaded to allow i2c access to camera sensors */
 	"RSCV0001", /* RISC-V PLIC */
 	"RSCV0002", /* RISC-V APLIC */
+	"RSCV0005", /* RISC-V SBI MPXY MBOX */
+	"RSCV0006", /* RISC-V RPMI SYSMSI */
 	"PNP0C0F",  /* PCI Link Device */
 	NULL
 };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
