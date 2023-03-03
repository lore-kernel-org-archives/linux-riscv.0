Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E3CC678D4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XmfgLGxKISD8Uc82AMXXQjWCJLJaDe7hlpTv0BkU/3M=; b=NiE1QmhjPWQMDz
	JLrLCAYgkTOwNNXCmEGTF8X98sT31U74/fnZTNJPuVyhvQC57etwGExjRE5xrzZm5wzCUpBWSLC3p
	DvhVDSKgSm5jYZqrDvoDlvbxWyWuNIbOPQkBPO5vyINwGt6v3tCpuF9NtRikcN9T444Ppwflwkc04
	FmK+0hydWeGLHiZdM8T2T4LWN4XiMey3WuIveXBWt4z6qwRSw9V4GO8nRr9/X22Yz4VGFununO1uq
	4k9N0jHbXSVIAThe5zcub9ZVyhZj1G8Mt4MqEF9jX0KgmD0a2m/6vI1lf//RH/qYIUQ7LgcFYWoyy
	/zta8k9jFTwKaLMuve2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5b4-006T3y-Vx; Fri, 03 Mar 2023 13:37:19 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5b2-006T2P-KS
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:37:17 +0000
Received: by mail-pj1-x1035.google.com with SMTP id x20-20020a17090a8a9400b00233ba727724so5647255pjn.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 05:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjsYubhOT8xU6uZ8EboYvG8E1YP64zOg4cL5+jWYP1s=;
        b=Hvr+Hc1XRLAdZgNfNuAzW7tZ3Jst7xXrcAt+TnMcYTTLwc5wp6kNAfA9iV7bpheE3w
         30D3Sg3uLvZGge9n1VW/QotxJRsCwg3F2z2NiTXSKyFzmZ1MsPzHGNTxO8gwOWrENOa0
         uxGLTMfQ262BzvGKDN2vFo2zi0vTJBZLz3k+a2g+bSD1qqIsQw4D7BbqLxent7xZS5Wf
         ucDJiD+//aTmk/zeGZ7RB28XJ08Bd/dM/1RIsL6Frh6+DPZgmmbCpSngQ5E3P3+sdRC5
         phAfg8rheC2NR51rKDCzXdTuWl++IO7mR63qciSfymfVVq52oFHrnWBukhznu4haQi/W
         hwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjsYubhOT8xU6uZ8EboYvG8E1YP64zOg4cL5+jWYP1s=;
        b=X9uo1Ybz3l8r9ZT9VzQMwsE5j6vjNsGekEGS7UR4Q6+aEDkrakDMD1CS3nEerZLybf
         czN9QnTMW2c3bJMWxyjvIjP7Cz0WKbABYPl7xzGETnCbrtxFUh7akqIr+G4aAPaZnVy0
         tY3qFwK+rAczi4z19SYYbIRfjw0zd9HVXJbugzrTVfT5RUXQRyz1rtLG7f5MTQ55MPPH
         5k00ehj7gDLUAKwnz92bF+t7s/5oAz22XLAP9po1IV9KGDNxbmBM8SlG7RLt1WVN3ucY
         SrxxESd3omzK2RXC49s8LluHEwgo2X556DZTlpGODgk1Ny2E+cIfq60NOVxCw70cRe4h
         RW7w==
X-Gm-Message-State: AO0yUKXN475/E61o5K0V3o8HacmGfVToc7uni2vf39Q38u2R4ZEXqLyo
	3nQWCNFkMWO9DgYCgrf3qlS7vfUyv7e+0gfD
X-Google-Smtp-Source: AK7set9B1fiLkNd83KQWe4fA7X0LkdUmSRy81AmP2oBssWYdZqx7Ou3vE7sWIWYFK1AdjIt5iZD8cQ==
X-Received: by 2002:a17:902:ab8a:b0:19c:d559:8661 with SMTP id f10-20020a170902ab8a00b0019cd5598661mr1709826plr.38.1677850635141;
        Fri, 03 Mar 2023 05:37:15 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:37:14 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH V3 04/20] ACPI: tables: Print RINTC information when MADT is parsed
Date: Fri,  3 Mar 2023 19:06:31 +0530
Message-Id: <20230303133647.845095-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053716_693626_1BA2D7CA 
X-CRM114-Status: UNSURE (   8.90  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@rivosinc.com>, 'Conor Dooley ' <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When MADT is parsed, print RINTC information as below:

ACPI: RISC-V INTC (acpi_uid[0x0000] hart_id[0x0] enabled)
ACPI: RISC-V INTC (acpi_uid[0x0001] hart_id[0x1] enabled)
...
ACPI: RISC-V INTC (acpi_uid[0x000f] hart_id[0xf] enabled)

This debug information will be very helpful during bring up.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/tables.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
index 7b4680da57d7..8ab0a82b4da4 100644
--- a/drivers/acpi/tables.c
+++ b/drivers/acpi/tables.c
@@ -220,6 +220,16 @@ void acpi_table_print_madt_entry(struct acpi_subtable_header *header)
 		}
 		break;
 
+	case ACPI_MADT_TYPE_RINTC:
+		{
+			struct acpi_madt_rintc *p = (struct acpi_madt_rintc *)header;
+
+			pr_debug("RISC-V INTC (acpi_uid[0x%04x] hart_id[0x%llx] %s)\n",
+				 p->uid, p->hart_id,
+				 (p->flags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
+		}
+		break;
+
 	default:
 		pr_warn("Found unsupported MADT entry (type = 0x%x)\n",
 			header->type);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
