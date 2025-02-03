Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641F3C02199
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 10:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPUnndRT7OFxugojQgzVItydhBRCAUpG9tmASKID0U0=; b=J3IInrS4hOpSsk
	amiPZdtJEVrXnuLNvfGAE3BmaRyYDBkB1vCpn0gVTRqXRUrPeXxGZgYm6utGkX/nYxg+Vto/o+NiB
	tfVKCpH2QcA0gzN9653hMuhoiH/JjdA46aZ4kDj0y08X4wyLiNsbbvE9bfJCfByeStPWTtOA7aaQ6
	oH5wElDqrhvHpnVxlO/kOdAUxFjCM+m3ZLc2mB6V9h1vI2wtP9JA9Ip2c6W/ynBZYTE5oEQEwFPNR
	xD63lipcJ9I9Fpfdor4yYHK8YLANkfXbq3polBtjIhJoC75CwMMPfBzyS7O4EkOS9RKnG2q6O0SNa
	ACPr8OTFR+JucPT12/7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetG7-0000000F3xm-3lc7;
	Mon, 03 Feb 2025 10:00:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesBd-0000000EugB-2tD9
	for linux-riscv@bombadil.infradead.org;
	Mon, 03 Feb 2025 08:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QqHKfwEB4phXeApzs0j4obzgLpliUPZiImb73QFVqNg=; b=im6QtQJzsdgE0Sic33MOcSaNJQ
	p37OjsTUx4/5idqCI6y7qVEExs6FekZDQAB82bbnJKFuSuDCmt6+OOEi6/0e4tGtywdev0iYqyBjA
	o1d7Cyf3ZlpgSBDU5kk8hXXctjaiuWqwXWs7olNtGFu3Do7XJr2e1Z8vBxylL1osCxwdTJRGfF7/J
	H3r91HUFANbPbrYFwn1zOPQEpEy/vcGkOWacTiZr9PoY3792D5PaiY97YbfVKwhyfWoPbNFbweJUA
	OUWoKCpjU1ZGbYTHOuIcPQrkNYO9+Ry58sVlF1oSCQCITtgCbT7F3iMEEjzNw6qS3Xfjeg2QOLsRE
	xrRIqC4Q==;
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesBa-0000000G12T-2qhb
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 08:52:08 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-467a1d43821so47867231cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 00:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572724; x=1739177524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqHKfwEB4phXeApzs0j4obzgLpliUPZiImb73QFVqNg=;
        b=KHSCjwLmALWtQ8KigDSZDDAOQNrk1yVowjqbKmPT9RCBxLwdoAlPbkbvjAiegeCbJ3
         hm1Dqg/7ynd0nG5IcwCzYthqhN3RoIb59EPsPalSTvJMttqPxurAbpySyrWFxuOIErCH
         19tJULAtZmX+KJ9fJjPhFRqn4uu4oFFz8yiihcKFEJX8N7B1o19F0HNTsmCSsTZCycMI
         bjOx/QuQp30dY1O8LAd+Dbk1pBMj9b1sNDFVga6mqKMg8WZMiHcaK0dxSbDWOmN4+60/
         6wAmysVCpT6I/iFpEeRkAUR+Kd0uDmxMe9lJXu1x9ly31NNSfUdmkRCuYPcJN6uCNbDi
         30pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572724; x=1739177524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqHKfwEB4phXeApzs0j4obzgLpliUPZiImb73QFVqNg=;
        b=UK+M7ujWfii5ZGMuTogXyvw2yOM4V5zq+T6D2tCjPSKLFUNXnP1UpEWGeg/oDVZY6U
         xoB+jXipUFLYFQKu8NmtG82KFrJF2YtV3t2nIxIeq7MlqnD9FmHs6m3jWHucXAd2/l5q
         5UtKnks3LHNzLbOtW3Gvs9tJFqGQM7jsZWxpvSCI6EBQV47lm8jMQbcZnIf3Jt1IpVYd
         12PdGspj5Vv7mkrwT5cU3LyJoQxxpfYe1iUzzN0WazEMSEkepRO++9eAmitgeF7w2QH0
         y9Qhy3oMSVmVNeYqzkU1Z/DsvUnDobxGwOdu+OPDIyN8KAnJXLWIAd76JUIW8LdkEc5W
         u/jw==
X-Forwarded-Encrypted: i=1; AJvYcCVQVtbiz0HZ3kB9LF43Ac2vGOEycBxRkorbGX6cyxMS79fzMqpdVCjbXrvNt4wIl7jybm0Ii7WH6it5xw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9fac+c/E9+VThdSRxWCTfRy1IMy0pAuiynDcIBInHtly2aZGy
	28cqJy/Phoy1xCO7ykL/WzNUnLeioc9+r1kKc1cp+3/P67RJ8e7tk5mENHapLaY=
X-Gm-Gg: ASbGncu4exjuXthZ+78u1Jtk0SSsM+LceIl2cGbuvyLa0U+Urs8hwVhCMnfQJFIsXvB
	bveMk2aPgatTXgYH8ZTMZNj70N6u7NLFjBO6riTwIi58zuVxlO/Yk1KPR95K36ONfK8qWveVJDc
	8SJrrL8MzmT74GWcB3y2TyG7NLQe37do8145McR6zyqWEVDp9BSl8kSIbjlDMeM2KT+6zePibS2
	DnddMqWm895i8kuiuvFsdciZB+TzHaqN3Ka+wt+r1mwttRgKzi+/Cbis0QHPlKzaEf1eGDgXh9z
	CgMP54PvEGceY46N+ucr/ui75kv9/VOE+dS1NyQA0aVWg9rFbrrS1I4=
X-Google-Smtp-Source: AGHT+IGWVNCE2D8XvH1GGSIfS5LXa9bxJFfSjFmLfIb7zNeOXcqdzBvLSHp2sbBS6h1VqkAcm9r5rQ==
X-Received: by 2002:a05:622a:304:b0:461:7558:892f with SMTP id d75a77b69052e-46fea0ab7d0mr150479241cf.15.1738572724220;
        Mon, 03 Feb 2025 00:52:04 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:52:03 -0800 (PST)
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
Subject: [RFC PATCH v2 13/17] ACPI: scan: Update honor list for RPMI System MSI
Date: Mon,  3 Feb 2025 14:19:02 +0530
Message-ID: <20250203084906.681418-14-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_085207_007512_9299CCE3 
X-CRM114-Status: GOOD (  10.62  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/scan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 9f4efa8f75a6..e490b4160612 100644
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
