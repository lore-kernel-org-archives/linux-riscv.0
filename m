Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB38BC77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 11:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=94BHaI67t9/j6DueAm9R1SxDZfXE7e98UyI+8ePBeVg=; b=EW87IczTALNf6P
	XW0Cx/g/b2pPo+MGbthQow9ahyfb6351H6+vnyOtuz5JS3SKThSo3q4ndAvg1VzhrLIIkGkATCfQI
	cYIl7J2za0WD9hHnF6WgXCRAe+463Z5VtS1+Rt7RZHWqLOa3GnxNK1kcEnWy5p7J1gtVNceykodaC
	ZgpLdcsy0SU1TzcJwZHZiuCB0ULYAbPR49IxxGH84ZsYd310xeUZdeTDzWanzIVCJJyhMm0qBGfLC
	7QXk7UEi+LV0v8TlmhRATbOvK2eReHF0S7ZS2zZ+j4ObqnSt8qyiBSLDafTFNa6C8tXlZNcG/Ff0H
	RDQbVKjfIYXCdkD5ZrnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzQo-000S1W-2y;
	Mon, 08 May 2023 11:53:31 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzQm-000S0r-2s
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 11:53:30 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1aafa41116fso29538435ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 04:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546808; x=1686138808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wcGbfhUP5NrwGCYl7Q1yL0FMzRdJBr1PIlnUSkktJs=;
        b=fBHUfS8fWSAOqlwT6Q08NJnR0u3M9PyiSxhBSIcvPa/yshAYWNpI0o9m3i1+avJke7
         UpdOLZb8RloM1SZR7kh5kmhzwoaBrLsvxZoeqYVZqqF396fb/4BhWwd23qb9VCpaKumw
         +uzkOQJbxs7oZeo9NsWhaHt5YsTFd1D2MQy8quk+pYQZ9V1E+g372HhAHRdQNMKrPpL/
         Y2eneBn1k8hN2tTm1lHK/RgQHMRZvomTuBl9iOkHafRg69ncMDwy+Yu/SoJirdME89sk
         +YabmC7IczGRfgKnOXQXtodoUNlYgFuPjduPauQRgsg6YGZbopdDa3L+DuoJF7LnTN5O
         CPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546808; x=1686138808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wcGbfhUP5NrwGCYl7Q1yL0FMzRdJBr1PIlnUSkktJs=;
        b=Mrce5bj1sdBRtrCQRzvsxf+nhjFG1ABblPnqLujMTA13lBg3FHwwvZ+rROGKBEtIim
         Byf8lqhtAwjx5FjL79KwcdDQwPbumk1R1tjguWz7oviG4O5/t++V+lpSY+xvGkOEcJpg
         5yw1s6bj0D7GGw7Elfy0af7zKCsL/95bK6C/GKc4ZAYcJVBf2gSuUI2sHU/pAIN8XG7b
         IAnNu7VDUYEAZ1nQDp0ZpWdsLjCPzIGGqC8cUEajRk0mMoNPJr3UqN6D4HRkH4xKC4DU
         fpsJ4Jw/jdckBWQCwOOfyEXbCqDXUw5qm6t5OjrfuP8jYSTvt0nLNgg9BDi8NgrR6Wm+
         YpHw==
X-Gm-Message-State: AC+VfDw1EO7kSlUazD5K/Wdxh3EBrg3kAf4jN6prK/rFcXQDyZ9aup9S
	OL4Sc6+8JJAD+gIv18faxDV26w==
X-Google-Smtp-Source: ACHHUZ4YPZPXYK0bFQvCKyd/gnSncEBJ6qVKzMyJ4dAbIZymuHBA+fio0dFknn2dgtRYb5PHf8ADKA==
X-Received: by 2002:a17:902:b405:b0:1a5:a1b:bbd8 with SMTP id x5-20020a170902b40500b001a50a1bbbd8mr9546124plr.45.1683546808426;
        Mon, 08 May 2023 04:53:28 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:53:28 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V5 04/21] ACPI: tables: Print RINTC information when MADT is parsed
Date: Mon,  8 May 2023 17:22:20 +0530
Message-Id: <20230508115237.216337-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508115237.216337-1-sunilvl@ventanamicro.com>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_045328_930419_288FB5C2 
X-CRM114-Status: UNSURE (   9.53  )
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>, Weili Qian <qianweili@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Len Brown <lenb@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
