Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C81C77B60
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 18:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=94BHaI67t9/j6DueAm9R1SxDZfXE7e98UyI+8ePBeVg=; b=TLjaZtI/LPrfv7
	AcR/VAutvVO4l5hA8r3EI8BPqsfKFu2ILhaCc1TywCiDmcMPNdVzfT8zZN0oiqgZIcbf/aEg+Vk+K
	tBdsm4ZBHOgg36ww+pUeZPBbdNoyeDsTufG8BWWASzZekSExh9Uq/eQFbfemFBedyUePQh2czBoMe
	KTJRIHtsFgnJwS1gyWfOSMCtIJz+zPI9RfRE2y8cXbveOU1Xsei57gVjy9rGOToMzHCJA/l2cTCNy
	JpYK4Twdy6oKi3pkO7bU+Ir4MBlgVZD1PMI2KPDlaGOI4lFloBKVzQUggzlchlkAPrbQXwW4SU/oX
	5W3l9g+AyG/6GM/F6/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlHT-002Ts0-1D;
	Tue, 04 Apr 2023 18:21:19 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlHQ-002Tr2-37
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 18:21:18 +0000
Received: by mail-pg1-x533.google.com with SMTP id l184so11107480pgd.11
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 11:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wcGbfhUP5NrwGCYl7Q1yL0FMzRdJBr1PIlnUSkktJs=;
        b=aYnlk3BgOfMNMmnnhaJrZqutCOgYZzErmuUTfDAmJFbvnkoL40ha8ijOrqYPZBnsvX
         ycgrTCK+kybVGhevfZFf/SGdnPx4JTrEY/3nEoA07S7d5HXOb2elq4hnDxEyN6ynebyX
         pxRENZLVc0MVnk0sqIXk0LiheSEXSJfSZYELyQaaaESNbrIvTGzzFGa80tp0dixJwm26
         MFd72Gyap2rcWTEzOB7E2LJyMrSviE1LMGX1n+TmEeB9vhYzg8cDk7jRSGhYZbMxL/6K
         AK4NCOD4Jkn6qi9PR3YhUp4EKjjdlwzOK8m4HBMWjFa/5J0IG6nZymCMMx2rvgDS4P3m
         8OdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wcGbfhUP5NrwGCYl7Q1yL0FMzRdJBr1PIlnUSkktJs=;
        b=FgLfL2uA4DuYBplVHLuryZhz9A8l8KBiMSjNE3MtSaqq29wTHeRFcQwTXVNzfmjz0b
         npgoLOxDHmTxgnKWsk7GAKYOA2fEjjEdBCg9kZvEbdAnALv3ZOOjS0Hu/1KB1JPHo6vr
         Xl0NADWrrJwgkzcvu13RUKIZ78PBAppwnls2dJeFMb/gPB6dGTnWYgE7Pn5A9tPwfpcU
         hzX/rSlyNfdaiwE0LYWpI7wEpMCmMGwuO9HaUEJKfPlFdESvuOjm4FmPhuFMQwDDfZjw
         Xs/YGyEdv3mDBcjWPjOjDvWxw7bz3k7No79/MZGXLejFgsrNrp/aGmZShbrt2keq3I9a
         ts7A==
X-Gm-Message-State: AAQBX9fBjG6RjMJ+Luw7iLmdkJg3t+9m3xbNf/Q5Fd8Y5GNUQobG2Dy4
	FMON3y6GyMfYbasfbnyN32W32g==
X-Google-Smtp-Source: AKy350bk0wFBRLbn4XAN/Q3xySFnNlV3qYKkPkqFm43h5C2tri1AqLTnk71cXWF8+MbPS5+mwyzFrg==
X-Received: by 2002:a62:7bc7:0:b0:625:c048:2f81 with SMTP id w190-20020a627bc7000000b00625c0482f81mr3438951pfc.32.1680632474822;
        Tue, 04 Apr 2023 11:21:14 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:21:14 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V4 04/23] ACPI: tables: Print RINTC information when MADT is parsed
Date: Tue,  4 Apr 2023 23:50:18 +0530
Message-Id: <20230404182037.863533-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_112117_004007_7CB0AC20 
X-CRM114-Status: UNSURE (   9.87  )
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
