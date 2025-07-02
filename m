Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C344C83038
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 07:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hrnKkvELy1VlLWePoRj1wz273AWPoeqWexesuw21l6o=; b=sa0HgKoZDCa5Y6
	7gPLrBtCAbbnfo5Hs4JLLsUJHIbGds6z4fneDNumeRIGB//r7GHk2NI8nrtvUWZKFc2iXxtRD7gNu
	00dgxDFopnPmXDiF7OvEtET+fU0/7KRgtTIszo4Jkj10NoMsZhkLUndD/oHWyFW1wt8M1JbuRJpMn
	aEkTPtFjZp1LVzy/kHeYOXSoPPfFMpFO26VV8HVww/T0pdsSbdfsC1siOoTaDVatI9R8/mXGNduR5
	42VWhwpBZybb+krOyGNFKR3DInIbISt53lFRZp2+PIumeA4ZrEq655p/0V7GrXWi62OgE10bHmmZm
	E6kZes9Bc6G0sLcB/OCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsFM-00000007XvW-1agc;
	Wed, 02 Jul 2025 07:51:12 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWppI-00000007GBp-3wxQ
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 05:16:10 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-235ea292956so37482455ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 22:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433368; x=1752038168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBceoBehx8BvgZH4kIrIZIQMdJgc3OIIxRIhQIQqZsc=;
        b=kOKmwdNkFCsLG0MttthCG5/1KgP6LOvpxDxV2UvdtTKKh7phl/p8JFs0gr4X9qSnSA
         JfFc3zwTQxTBQnmLy0j/3low6j9o+d2rwzjxMgZHXT2aNak/wqXVSmGA6VJdT7OjEqYr
         uPak/EgNedl2pg43HCW9bxq6YlF3liJ6K9FkipPXb50m1PozR821Ff88uDacLwGjecv0
         mFuwaCmBxUY5BOZ4vp1xU8oHyvKgGqi7OFCtjAp2qU/v1nzTPwKOnc+lz9WYOZaIVYvG
         6jiQDOMEicmJvYtLlB0gmVDMJGwUGBb3Ykw+o/rNwm4zRN5bXEEQp6X215I33buheuhb
         aHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433368; x=1752038168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBceoBehx8BvgZH4kIrIZIQMdJgc3OIIxRIhQIQqZsc=;
        b=SnZVBAXNhG9d4GTuWUNf/498tGw9SCYhx7ZMueEKnIZCq3NhQvzF3ZTk/rmE5XL/j/
         IOdzomhV9xGAfo/tTFiU4TDJtHlf16xPUKERChSTgiONuUP3CyiKblYJoSTIXdzcfdGt
         TYeufHLKj0ANpg+Bhd6U7nHCQEaRMzO1oao/IXeS1DGWQbqoHwNhHn8d6+U1itp2KROd
         0eiExGbzoD/byWitnPVdmVS8qavgM+dFOeAmuaNk6C8SSibi7Wdyn1/TMv87tl+2bMCn
         75qZlBRFbOA90hEf4hsbS5nYUV1oMz2vRySYJ3VgG2tPVQx+O6k/RFDYb3TDf2DnT954
         h91A==
X-Forwarded-Encrypted: i=1; AJvYcCXnSFXmIcDwcx1Mby/3/CCqE8pxKBb0FbwBsocfz6ja4QM4DJW3OV5TkWqkzWEeIEgX1sTQjQWctrLsEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmhaNB6jujlAcRSi1hIYvUsME4L+s5wCipnCn1+u1wuGOraxJw
	MbzSccq8Ff6S3yW/i35PFPn9jSsGquvLZNlVsq/57N7QFWSGw9i5WkYiJ9HMyE0F9zE=
X-Gm-Gg: ASbGncsqRvzH7H2P8m6zcRgQ9+CxyIeh0l/hGNToH+thdEwf/WHN397WPIapoiFhRpP
	+u2ly1HBtCgplDtfdBCSDoJSUIeACE5sOVlUVbnyGrm0qdlMpTJlq3hT0XYsyBeviCP2Ymmj/W7
	F1TAbjpy2larQG6179rKTFnitsjDys8kuQO/WjLZxATG5I1yf7STgO8BGLAE/Ttftaa11qCtTw3
	o8F5USEugFCrRtSJa0NYTRMxYFj/i7pBkzprkeF0tL9RL+/YNTs8d337YxyWCKluwLHIYitqUjd
	m6gBSHqSWgx5j+hhNPtKgBU3CYy5E9AJIpf3UeCFTTUn4t4qeG3L3f2ADOWBL7ORBUvf+q81hvn
	d0sPbO8jrAe/Q2d2M
X-Google-Smtp-Source: AGHT+IFKKOiOcB60DEsZKqmVfcXE0dhCOXPWFAp2kRuerlsj/aT4QarUNKrpH9hQuOyq/8oYcK2PvQ==
X-Received: by 2002:a17:903:3c4d:b0:237:d486:706a with SMTP id d9443c01a7336-23c6e584257mr21721685ad.48.1751433368200;
        Tue, 01 Jul 2025 22:16:08 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:16:07 -0700 (PDT)
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
Subject: [PATCH v7 16/24] ACPI: scan: Update honor list for RPMI System MSI
Date: Wed,  2 Jul 2025 10:43:37 +0530
Message-ID: <20250702051345.1460497-17-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_221608_978970_A633838E 
X-CRM114-Status: GOOD (  11.68  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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
