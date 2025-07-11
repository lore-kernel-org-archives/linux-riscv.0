Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC9CC83F1B
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 15:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+fJMm5pliTYDEobgB6ftzz0F6RehH8lg3pTNkm0KCPI=; b=QfTDYsbCWF9fr8
	3+G8XbTPE+GTSwURLzo/fFVLPnrEYv2tIaf9VUJGbyr2LBgNp6/L02TeoXwX90/szudZ4Lyad+FHp
	Qyb6cePS47Fe1v9gCwth2+zMr3BiGwVcZjbtY+aJecnCiSgmY9EKuKn2zd8JZ9FjsUlwSVW4ueaOM
	cM/1evl5+zocyY4/xRz9xDfZrzTEReskIt72JgJ/aaie/j4xorHh8JCyiUN52IPkKsF6r0Z7jYQ16
	uIAXvC+rp6I0XmPQ2YVdI3jU7pjeQKDC2AYjqaezJGbPI/Q+wfoi05CX/eOzEoX7TmwQBDHa4g4fD
	NX32+BdQkLqga/aIYy8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFS4-0000000F7rf-3yV0;
	Fri, 11 Jul 2025 15:14:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEIf-0000000EySC-1gfQ
	for linux-riscv@bombadil.infradead.org;
	Fri, 11 Jul 2025 14:00:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=LmPdsQbDpIgCjumkrL5H7FFgimsuzlN0TDDo32sfzWk=; b=pq6lAI4LUxr5glmJeP9+sG6Twf
	BlNsT2iu93FSWJck9G3xca38hJ7fNn3Q3rVJjrGyUZC385+X7n5Yghe1KGC1yErtSahI4PoqTOw9/
	cF5CUcaPef9owkcfzCpakUHKdwsvGu7xmTWiWE53rzaerFuoSW1l5nT8Eu8+dltTR6n83toelVHGj
	gXKo/SqY8fSIBiISsTS7hKvy48XB5Ar+Rf0nGqyzzVugNzYH0XmWa9amsHjcnPKKMlGvQX6A3Iwr6
	sw1r2eXihTetD9KHoE4j63igv4GHSAgxdILZ5M5me7IAM+hugVQns6JfY+wAucF7GP4kFfIGRZEUt
	YZ2hIe6A==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEIb-00000009HQy-1g3Z
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 14:00:28 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2350fc2591dso21781675ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 07:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752242420; x=1752847220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LmPdsQbDpIgCjumkrL5H7FFgimsuzlN0TDDo32sfzWk=;
        b=AUWl2bE/oAEhhbfo6znnk1QsHPW/eKg+CDyPW/4C6M5rAg/6Yx0CilhMXyXuFRW6+u
         FKB+Q5n11770bJQd/wQK10kVfSwpmyLIegGTKs2dVzltGosEvKLwx4xnb25OePisj+zx
         DzWE9txMq6AdZf6/rqSQ8QAHFcqVw2qww2pdshntzUD8TwQJIK1ONvtg19EQcvCRpmHU
         qx+RwPPYCTmZBz+j2qi8r2AemSSVBDWYh0XEJoPlIumdnss4RrOKoJuEo/fFIWC2RIIU
         CiN567hZO3+s5sf+SpgCwN0jvmIeT3ivOuwdfYHbpXaMIluO8Ohp8uP4Z9IbqmW+qZak
         PBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752242420; x=1752847220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmPdsQbDpIgCjumkrL5H7FFgimsuzlN0TDDo32sfzWk=;
        b=bz3F5F8WOjcU3hU2AWBtTiT2sOZOKXO2wAnC8HLZIXpqsC1dPsFBpmQV6iAVZgnA//
         ZyLyhdBzFEP+tIH7Tr+teEIKCigRfa3+Z+o4GUY7661Ra+nbmqQNkpGfnka7Qw8xulDB
         i97h+VJxbQxdR7LNy6EGcvhQMdqoekImJnHnrnZZq737LLdrgZ7r0kT3fB+sefO5+xVe
         FTD45Fj31Fs8x3tzJU9dyLqJOByEvryqA3LuXyiVshfQlBPfe135/MHwwlUVz8xXrUNW
         zeK+bYifQInF/F6Jr3MnbM45/aKL04c4N3BYNR5zV2oeexUBUJtkNLRA15xE1WTZ7ugQ
         WXuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2HJm6jjFxV+qBGO0pKPBtimvOicGXGPIt4rT4QodabhJCjDtmB5c8Jt26mhe99T7fetz14/wcoH/vFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZIv3cT9n0lCRwx3twcJc/wA6Iju3JoRo3/2fz1SqeSbLbSQao
	0mYhTkM5VuM0GwOlBmUsHLXTwls3V7l56fLImFJ1i1U/Ub0WQjvwO1fT3ESePKl7K6c=
X-Gm-Gg: ASbGncvbAknD31wq9jh/uumEbg0Dy51PzQxoVgDwX5OtPhTr2G0bzZDX1RUFmkaKXMq
	n4JGJy0hlA1y8RWqfIHiPMa8sDaWcgOPKHWnVvDztbGOFXmTaXY6vUkgv3TsgbAALpEPx1pz4OB
	h0KgC2iAtvH8mA25RAMJkp+ZjlKwYsA1aliabXhsF5izigh9ZNeMi216qu+DbNZUF0eGdfzdYpS
	vG3H5sL2xA1pNKwFYq9Oahlk5eQLaSYB5aNRnovLUktrSw4lj6k/WRAs+ftv7a69cY1adWMGOfA
	BtLP5kOpZlsdXYN7w5X2llnBZSgrxSGZPHKmJKu7nEqlDVYIm3WdQMdmI0eXukckSe0+kyBZz6y
	Ucy9PQxqLlDghNN+gEzJEnRkVDdRuYkdd
X-Google-Smtp-Source: AGHT+IFJ0rcsB4i4vXXPgW5KkKIV4zeIjjpkek1NMqdQXCIN7LpmxVPatDuK+xoO9TrfDZV5gowLpw==
X-Received: by 2002:a17:903:f8b:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-23dede67c19mr48246905ad.25.1752242419961;
        Fri, 11 Jul 2025 07:00:19 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.195.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42ae9dfsm48405845ad.73.2025.07.11.07.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 07:00:19 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ACPI: RISC-V: Remove unnecessary CPPC debug message
Date: Fri, 11 Jul 2025 19:30:13 +0530
Message-ID: <20250711140013.3043463-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_150025_674598_6CA78228 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The presence or absence of the CPPC SBI extension is currently logged
on every boot. This message is not particularly useful and can clutter
the boot log. Remove this debug message to reduce noise during boot.

This change has no functional impact.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/riscv/cppc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/acpi/riscv/cppc.c b/drivers/acpi/riscv/cppc.c
index 4cdff387deff..440cf9fb91aa 100644
--- a/drivers/acpi/riscv/cppc.c
+++ b/drivers/acpi/riscv/cppc.c
@@ -37,10 +37,8 @@ static int __init sbi_cppc_init(void)
 {
 	if (sbi_spec_version >= sbi_mk_version(2, 0) &&
 	    sbi_probe_extension(SBI_EXT_CPPC) > 0) {
-		pr_info("SBI CPPC extension detected\n");
 		cppc_ext_present = true;
 	} else {
-		pr_info("SBI CPPC extension NOT detected!!\n");
 		cppc_ext_present = false;
 	}
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
