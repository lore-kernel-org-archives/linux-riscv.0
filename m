Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5652C83030
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 07:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RmAfkcbvg0r8siLFTk1w+6hBR/Oziq77yFiLtHXeaUc=; b=avS6q8AkpBBwSH
	irmCcbXfLL+H9nZC+68fXW+WOPiLV2t/vWPGGhht5bJqk6+sii/gvWqhmdX1xBRqy3IBKG+Ao9Yyl
	/Thky2lPffl8IjYVD2t+wCOVeHj0P21f66C5vkg7f0iqcHjiHbZisgn4uvo1zOlpH2yZ64Ki6Fjiw
	NBgnBxahmKp3LTOcmPqt3eHLS9d4WxU9ZL8KOdVZrd9RTnSzfB/Mi8ZYAmLGGh2KQteu7HGwJMoVz
	SOFiLFLbZz1uKEgoDPbpZHmDuctRrmIjfRNtD9FY3BovizFr67fsTOkg1GLCyTwr7dUMMZ51nSjSc
	grS1OBQY7ScVn+2caHAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaW7-0000000DV8n-4Btq;
	Fri, 04 Jul 2025 07:07:28 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaW1-0000000DUyB-3i8F
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 07:07:23 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3137c20213cso793679a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 00:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612841; x=1752217641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQx4DIh4Piuq7HhjaN41eXcQRyGY2O2ucSjN2pwnllI=;
        b=ZTVITeqOp3AABzSf4gIjeoQh8e29CGcaqpRpZzDoYMrp1J1NZvC2mb34+tBwBk1Cad
         qD40+SYV8nl/Y+BE6vjw9NOIBuytp6Abc8YsBbAEprOarJJOUitHaCfqtWQBHt22OSH1
         0CjCxPmPgdfn0Tu5Bvspk2c/r4Vwrk7Qjk5N6sOGajhabvML4R2ctWegGiCbedJStPNR
         9c0qx64FjIth90O9MpuRN2Iw7qCt2gWVPENgsf+KYVSQ21CgXdm3UpEfAmizZSvxV91/
         rdp3ZQ7m0/ZhARQ0Gy7iv69RXFLwcw1sNCFk5qLg4exIWeQLbRFtp+tXE5TeWow4bjbb
         si+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612841; x=1752217641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQx4DIh4Piuq7HhjaN41eXcQRyGY2O2ucSjN2pwnllI=;
        b=EAO5cYAtZHHeoKUOEFsHziLh47r9DPIIE1dbHNjz/7RFdSKzAgTEimRkOZUxFTVOJI
         Q0xvSPM1+h9u/wmMFXFxjAnXfBhk/pIeHsk4V+WqGsvQ446k25avdaqJycGAhqXTLqPm
         XBoKigD+cZzQbPo8GHTTUM29xtyj82wWwrwpezuhfnX2dtZ8ur4tEJC/0v1/Uusaoc6c
         1h+XT704a8Vo6Uv48opllt6ao8Fx0kLOgtK9O4fHI+z2h3W/gLJfdtKIIkt3LO94h/or
         hF4PjMKPUJkEd1XGzNVnvYQA2Tx7xB4/luHmTYgV56UgmeOkIrmU9tv9Vr0ynt88iaNQ
         k09Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVEjL9q3ZYcO420SJgrvBnrLsA3RRA9eTetd2/TtBxlLB9xqAdJp/ZX6QIS04gok3VRlXPLkC6/U+nEg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzow5mBttwuA8DoVFGM06YLkFNDWqUP0FydPgR1H+jUEYth9kNs
	ssdYboPpAMnl0D23AspYDPObToyZKAl+GVbmmDtwElXetskaZGR7EiWpCitzwzpOAa4=
X-Gm-Gg: ASbGncvTK0mp08dWrx9wpdW5wip97uY7lmjFBqBRiJWCQP6s/yzQ0PiT80Id5TQQUpE
	caDquHbzGSYyS9Rlb63+g7rzfxkv3dCqwZUzprYD+vxjiao85L8aL7i5mxIjbk/hCsnKEu5qSXf
	U7CqHTeY+B4aEhhZvK0KjGS6jSAa2/TYvxTNparvc739oyABObWvzOHraOBUQcCC/v1BoX9twPd
	yTcTYPgJQtt14nA/XhqeS7hk6ACwM/Bp6njWwbHM1LkcEKm24GunjR4liT1fiBSiMvFQ3AACEGa
	asZ4Lfsj/rSVYllAd9B5jxvDneOzrL5trHV8bX2sIhQ7BrsCrbbKX4kFigY7oDP0wD4t301HmDL
	Qm6wyl0F0U9kAoJgTod8xOu+NKQ==
X-Google-Smtp-Source: AGHT+IE8RuxxpKedqzy+uzoXVkR8qJBvZDITw6LQzH2d5wo1aXkwsTRyqrE+z4geahCSOD3aMg/Q4Q==
X-Received: by 2002:a17:90b:2245:b0:312:959:dc4d with SMTP id 98e67ed59e1d1-31aac43290dmr2637314a91.7.1751612840937;
        Fri, 04 Jul 2025 00:07:20 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:07:20 -0700 (PDT)
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
Subject: [PATCH v8 16/24] ACPI: scan: Update honor list for RPMI System MSI
Date: Fri,  4 Jul 2025 12:33:48 +0530
Message-ID: <20250704070356.1683992-17-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_000721_932470_59F2587E 
X-CRM114-Status: GOOD (  10.93  )
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
