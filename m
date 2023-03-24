Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC37CC6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 15:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4Q3RPHg/bBvvQk/g0DByH4xQWMQSoZgsZFwbvD9hGo=; b=uKt8skxeGbhIeX
	CKLIXN+sQhtd71QMxyCXrFPE2GvRljq7A1/7q/9V7IiGb5a6tUzTsRYfffFz4QQBj8/gM5c9a2Ia0
	n9DL/1QHE8HUFuk8A0urkiW+8OhV8W1UjEaPIy7wMuwD5z7XsPlIhwLn2dBrQMSpJpUsdodwNcRoE
	VgwH4nEiUJnFsl4uu/11mapysX6BsAywbcE7Y7WA4Mtu+ruVTJCMInbjBS4LSziNemq786+F45ZiW
	jdHbWT00UOwwfMfRVjt/V/Y7e2+FxKwnlL0rzUIYwnNxYDw720da/4s7+n/2V+BAiKFvHeYI4Zpdt
	1qlqxPUcNiolUPURon5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjmP-004vKh-1N;
	Fri, 24 Mar 2023 15:56:37 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjmL-004vJE-33
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 15:56:36 +0000
Received: by mail-wr1-x42e.google.com with SMTP id d17so2284791wrb.11
        for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 08:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1679673391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PR0MUUfacwAfsjInBPeABoZtOXtMYsQVXBaBrC8rWtM=;
        b=R3kCrQe6UqEb7GoCrQ19E+2HaE0y0+lHYsucNBd+vyoWzCdTuw80+N+fDn3B4o+dGG
         c3qMMwW7jNWTEIdDu0/u2KtnYi8Z4faTZC28TPwx77lPhfWdPjP83tGua6o+w7itsWnj
         mC3HDqQJuuf8k7AgnKbGbTX8y5ZXhA9Uh6RAgNkZxDP5De3aTBcrTXt7lCao9xGz/62i
         yRsIEErfZ8vqKRQmmBfipn3Wt25HXQtH2CQiOzoIT8RAc6LVYIvxgM6UkQ6h+FLqnKVY
         FeppzjVOse3GnyvmI1Qms9N0XKZuOPfDfWF4JwwjWlS/x8DIws6pR1+HOABy/Yzj8yLu
         jggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679673391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PR0MUUfacwAfsjInBPeABoZtOXtMYsQVXBaBrC8rWtM=;
        b=TaFsPNX9NyB2cXm2fU+HTignClHx7RA4wRMJoaU0mJduX4nw9p3A2VifNpBB61YzDy
         FDqDeq0X4uEwF7U9ew2iYdlraYEMJkLNgvstic30g/D04STgA5kJmDmPHDNSgTYvag/3
         pEGh6XJCqAPV8ivoY9eh6mX9Ms7vDJWAa5PqnohstQ/rhbMyYydQE0Hwp2OaV18oNJRz
         PiambMLx7KARslOtJozwx93rZQ1ckZdq990e9WwBl6GHOiqd4pOfvpX+7oPS3jQCoyZz
         j+onIAXG8/eMUAbnoXFaYdDv+qkOJLD8QfO90GsH+m8a+VIwH5erdnu6p+Ip8iK6Hn2L
         G/OA==
X-Gm-Message-State: AAQBX9fP+XdX4zxNxEkD20V2gjtdqktgjApzhdEsPM9UBF+R7zlPZZhs
	/VUSFlGx4S3Mi1q2wd9CQo3+ZA==
X-Google-Smtp-Source: AKy350ZbYATQfNEPjI55Pl0fHAqYJaEDna5Eve19pmNEhT+ETLFt3/hTIE34PKB7xqhm0hzFTkzAsw==
X-Received: by 2002:adf:fe41:0:b0:2cf:e517:c138 with SMTP id m1-20020adffe41000000b002cfe517c138mr2687659wrs.66.1679673391487;
        Fri, 24 Mar 2023 08:56:31 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id d7-20020adffbc7000000b002d5a8d8442asm14382912wrs.37.2023.03.24.08.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 08:56:31 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v9 2/3] riscv: Move the linear mapping creation in its own function
Date: Fri, 24 Mar 2023 16:54:20 +0100
Message-Id: <20230324155421.271544-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230324155421.271544-1-alexghiti@rivosinc.com>
References: <20230324155421.271544-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_085633_983414_D7F8C81C 
X-CRM114-Status: GOOD (  11.94  )
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

No change intended, it just splits the linear mapping creation from
setup_vm_final: this prepares for upcoming additions to the linear
mapping creation.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/init.c | 42 ++++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index cc558d94559a..3b37d8606920 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1086,16 +1086,25 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	pt_ops_set_fixmap();
 }
 
-static void __init setup_vm_final(void)
+static void __init create_linear_mapping_range(phys_addr_t start,
+					       phys_addr_t end)
 {
+	phys_addr_t pa;
 	uintptr_t va, map_size;
-	phys_addr_t pa, start, end;
-	u64 i;
 
-	/* Setup swapper PGD for fixmap */
-	create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
-			   __pa_symbol(fixmap_pgd_next),
-			   PGDIR_SIZE, PAGE_TABLE);
+	for (pa = start; pa < end; pa += map_size) {
+		va = (uintptr_t)__va(pa);
+		map_size = best_map_size(pa, end - pa);
+
+		create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
+				   pgprot_from_va(va));
+	}
+}
+
+static void __init create_linear_mapping_page_table(void)
+{
+	phys_addr_t start, end;
+	u64 i;
 
 	/* Map all memory banks in the linear mapping */
 	for_each_mem_range(i, &start, &end) {
@@ -1107,14 +1116,19 @@ static void __init setup_vm_final(void)
 		if (end >= __pa(PAGE_OFFSET) + memory_limit)
 			end = __pa(PAGE_OFFSET) + memory_limit;
 
-		for (pa = start; pa < end; pa += map_size) {
-			va = (uintptr_t)__va(pa);
-			map_size = best_map_size(pa, end - pa);
-
-			create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
-					   pgprot_from_va(va));
-		}
+		create_linear_mapping_range(start, end);
 	}
+}
+
+static void __init setup_vm_final(void)
+{
+	/* Setup swapper PGD for fixmap */
+	create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
+			   __pa_symbol(fixmap_pgd_next),
+			   PGDIR_SIZE, PAGE_TABLE);
+
+	/* Map the linear mapping */
+	create_linear_mapping_page_table();
 
 	/* Map the kernel */
 	if (IS_ENABLED(CONFIG_64BIT))
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
