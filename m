Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4C0C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 18:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CxcR/zLSiEZMgfC86wbIVeqbQCJSjVF9LZXELUKz7fU=; b=IKt3I+0FyrqWIt
	bNfuqFl5cRGzXn+vhvB2seal1ArmiarJLp4IgDoUsV+y2eiO3nbY8IZw2wISA0wyrZ9FYIKvz2lyR
	yvYdIBx4l7q8wmFYjkmvrV3HbfYVFJqUMuvntSyM2IQcBxyHDU1q9laej/Pq+PXfeSxcwl7BwbAN/
	JfKVI3yVOxGMWobQ65eLD0dgGm5592h71GjQrqSHlA3vEcZQYMe3M5n98gOjeA3NGfUIxj1vtG+J9
	kp/Dc8myZcooBhnxHCrxxvTNSPBvtwNUrD20dJAUZqYzgaK/MWm9tt/sUi2b952FUUOfEhtAuajjM
	e/hGlbnNOtNfVERMdzWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSisq-00BTdx-2M; Thu, 16 Feb 2023 18:21:28 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSism-00BTZq-MJ
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 18:21:25 +0000
Received: by mail-pj1-x102d.google.com with SMTP id kk7-20020a17090b4a0700b00234463de251so6706608pjb.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 10:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9sxg5LZ/1sJSiDItv56ESM72UWoohRRXZed1vK0StQ=;
        b=I5b4VocraQIzy74N6/WkUSoEflR7yik4OQfTnlBnTTAhyc9/7L7kZrDieGxf5g+3nm
         8jov6jOgh5KiNaZd5Eaa7Vfd+keKgSYotzhC6UN9lRBO7zglAi7u1MIu4JtEtffb1qC4
         dtXduPqacGJKwS4he3LX/xaSnKLvpeDfpeAtrCDtAUe5w4SXN4V3liCjE7jYSJxAhPp8
         DASKy2oFicLS4SBOSKLvGzogHewOZG+O+NkMXBohSjcp/cq1irt5j+D1lDQxPVx9M2Ni
         dBAbL6WViE6T6Vldp2yhiqPJLShLBhApPxCeMBFjOnsg9MH8T1AV3a3db480pdXDA4YB
         xymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9sxg5LZ/1sJSiDItv56ESM72UWoohRRXZed1vK0StQ=;
        b=upa62R/e9wKp9//E8dXASQwghJJVysAbR1hT5UoZjj9y+HXQ9QkfFeEFxNfDcKYyak
         lPjI/IHSmZ2aKUWO8zSasJ20ClOMBL75Uy7PthalL/HlEw9vz70mm5vqFLA87Z+CcVxu
         1kXWCF7WdstJV58Qanh8twyRfGKEUh2q9Qq3fkAt3mC2nSc37jG3i/lr13XS8AtitlLX
         6RoRkCUuMJ13S4rAaEsoWYwpw1RNSXPoD8UspaeJ43Nr/wpjmk/TGUP8KglP7hsB1IM5
         QgA5kGx0sgyhuiHkJwZIYIT+b6Je4xCyfE7v/wne1qKAKtDq+j559k84U1XOZaKQVrDD
         JOfQ==
X-Gm-Message-State: AO0yUKV0yfJ0XCCBSCw71NCB8D45hhuCA2OeU3KYhv+JrQsFx7YRAFVV
	ZjiI4FGdFn0lh/22yN13sykHVw==
X-Google-Smtp-Source: AK7set+LkiYEtVszqIim+13FtoK1iDZchye9bkxcSiZhQvPVVkT3nRpoNkcezYVva1ZFDzq4Dzm6XA==
X-Received: by 2002:a17:902:c943:b0:199:1f42:8bed with SMTP id i3-20020a170902c94300b001991f428bedmr3110483pla.12.1676571681615;
        Thu, 16 Feb 2023 10:21:21 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:21:21 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH V2 06/21] ACPI: OSL: Make should_use_kmap() 0 for RISC-V.
Date: Thu, 16 Feb 2023 23:50:28 +0530
Message-Id: <20230216182043.1946553-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_102124_744069_012B1B59 
X-CRM114-Status: UNSURE (   8.89  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Without this, if the tables are larger than 4K,
acpi_map() will fail.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/osl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/osl.c b/drivers/acpi/osl.c
index 3269a888fb7a..f725813d0cce 100644
--- a/drivers/acpi/osl.c
+++ b/drivers/acpi/osl.c
@@ -276,7 +276,7 @@ acpi_map_lookup_virt(void __iomem *virt, acpi_size size)
 	return NULL;
 }
 
-#if defined(CONFIG_IA64) || defined(CONFIG_ARM64)
+#if defined(CONFIG_IA64) || defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
 /* ioremap will take care of cache attributes */
 #define should_use_kmap(pfn)   0
 #else
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
