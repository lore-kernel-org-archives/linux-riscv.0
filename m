Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6ECBC61D98
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 23:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TxLGWzikk9woJmOG3EFNVBX6TtKSkhJLQeqNoHn5odk=; b=eSbbLpgPbQDrDD
	Iw9JFlhlYUSWGAgx7/W/aNEfZ/HFMIB6v9Wuj7Bp+smMDwz8or1uz1IoRV1rZdVNuJno1JE3c4dlo
	hY4z831o9n8E3SLjYvJyG79CwsZ78OUji+fbJEKxJQwS1kh9NXsP0DqBudTOTBJEexZWY7pjyGBza
	AVVzko41Blr0MGaVW6mREppf04ImU0cqbd3/09z+bbxIYEpZsIRzSW4NFCYbLSLTY/1+9NbjLLg67
	3V6Bg7QTMRYpnDaQFUmkE7/lTnQDqwqUYROof6UnpoAwI4GeqNzJsFA7iLdwW0FtlW8YXYB4/Gluc
	tlAwrVqpqfgMdRbJfvzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5aT0-000HqV-3D;
	Tue, 21 Nov 2023 23:47:43 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5aSy-000HpB-0w
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 23:47:41 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5c239897895so1899122a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 15:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700610459; x=1701215259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMOStd9fJlE8YG4cHDAqOao79PB5giUTAvN4hSNTpow=;
        b=OHX+G4pOhtXC/kR4X4R3I/I5Zz4oiO2DIp+5llXMHFJB3K9QVlrRW0Fgc8Rk/DyAts
         fWU/RWOngmqM1UJmZldfJssv3Ejc8X7wHF+ZQsg4U8wNVPgLoPH5+EXnemzMc8DSgPNg
         UPrhj35RoID50ZsaBO9K1BdUf+HMbXfnse/wKMw6/VnQKjEJ0RQLlffS4BCgcApU5tMf
         RpsW0iQaamuvGJDjv2Dzn0eAKEqLFA84fltkWueUQHpt5cwfaFBQ0RUP3zZyLcDEXJLK
         ImjdZEP4Z6X9Nx1yapAbaM2IK/XACYBssys8CHPMzRqRB9LLL789j1KQoEotcP/TVqHE
         kykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700610459; x=1701215259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMOStd9fJlE8YG4cHDAqOao79PB5giUTAvN4hSNTpow=;
        b=qQ4aUG0Fb0v8otGLi+gohCYcPkrDWqJ7fv7OtDRshgQUJWlpOSBNFwtWR7CfSDQyIq
         5BGQ3wxxPg0hDVC8fIXCj6zTh9fPOhEgv5zFzEsnrdJdmlrDUlTM86bU/sj0C8rIkw0a
         tfnKBqST4udFQZ+R/rxnqBafGNyKOygfesS+zJmdPPy/g6Mkx5H6YDX66zrZAaynxTl1
         SKrnB72mdgvRznoL4JSASpWuD9WjEvJgCJgFA46TTTG40M/UtivpWtJ2EE/QxvQL8pPc
         o2MFdgaL77edzSvEffm9rPMARddwURRnOti4SwS8w21qfv7/vP4gi9X5FkRz9gx82NKx
         9p6A==
X-Gm-Message-State: AOJu0YwkPW+Gz9o1+8BNgAfmDUhHgpTz4g/0RYBlJLYuR6QNfOS9dibW
	Ez5g1yKAuHAbowvZSMpthQF2YA==
X-Google-Smtp-Source: AGHT+IFbfZAuqOej5wkX0K6/vS8Oyqjn7BLG0X6YPrfr8dn7T6pNtB3Wv/zbSWQDnxrj0rMNrcKVig==
X-Received: by 2002:a17:90b:4b0b:b0:281:1c2e:9e6a with SMTP id lx11-20020a17090b4b0b00b002811c2e9e6amr742314pjb.39.1700610459263;
        Tue, 21 Nov 2023 15:47:39 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id f8-20020a17090ace0800b002802d9d4e96sm82234pju.54.2023.11.21.15.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 15:47:38 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 1/3] riscv: Deduplicate code in setup_smp()
Date: Tue, 21 Nov 2023 15:47:24 -0800
Message-ID: <20231121234736.3489608-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121234736.3489608-1-samuel.holland@sifive.com>
References: <20231121234736.3489608-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_154740_323690_29C413AE 
X-CRM114-Status: GOOD (  12.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Both the ACPI and DT implementations contain some of the same code.
Move it to the calling function so it is not duplicated.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/smpboot.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index d162bf339beb..1c68e61fb852 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -125,18 +125,7 @@ static int __init acpi_parse_rintc(union acpi_subtable_headers *header, const un
 
 static void __init acpi_parse_and_init_cpus(void)
 {
-	int cpuid;
-
-	cpu_set_ops(0);
-
 	acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, acpi_parse_rintc, 0);
-
-	for (cpuid = 1; cpuid < nr_cpu_ids; cpuid++) {
-		if (cpuid_to_hartid_map(cpuid) != INVALID_HARTID) {
-			cpu_set_ops(cpuid);
-			set_cpu_possible(cpuid, true);
-		}
-	}
 }
 #else
 #define acpi_parse_and_init_cpus(...)	do { } while (0)
@@ -150,8 +139,6 @@ static void __init of_parse_and_init_cpus(void)
 	int cpuid = 1;
 	int rc;
 
-	cpu_set_ops(0);
-
 	for_each_of_cpu_node(dn) {
 		rc = riscv_early_of_processor_hartid(dn, &hart);
 		if (rc < 0)
@@ -179,21 +166,25 @@ static void __init of_parse_and_init_cpus(void)
 	if (cpuid > nr_cpu_ids)
 		pr_warn("Total number of cpus [%d] is greater than nr_cpus option value [%d]\n",
 			cpuid, nr_cpu_ids);
-
-	for (cpuid = 1; cpuid < nr_cpu_ids; cpuid++) {
-		if (cpuid_to_hartid_map(cpuid) != INVALID_HARTID) {
-			cpu_set_ops(cpuid);
-			set_cpu_possible(cpuid, true);
-		}
-	}
 }
 
 void __init setup_smp(void)
 {
+	int cpuid;
+
+	cpu_set_ops(0);
+
 	if (acpi_disabled)
 		of_parse_and_init_cpus();
 	else
 		acpi_parse_and_init_cpus();
+
+	for (cpuid = 1; cpuid < nr_cpu_ids; cpuid++) {
+		if (cpuid_to_hartid_map(cpuid) != INVALID_HARTID) {
+			cpu_set_ops(cpuid);
+			set_cpu_possible(cpuid, true);
+		}
+	}
 }
 
 static int start_secondary_cpu(int cpu, struct task_struct *tidle)
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
