Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B1CC25B45
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 17:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SiZGZ8Pyb4qVPaI3Mt/XIkBpGEUPjPPTrvuM43iDLtQ=; b=RnGaspyZKG2nYJ
	GCDoMp9MJHCG6wIG7CHiFS1zRY6goROFMe63YVpBn73/r5zqaluJXYtPdMqgI3w13Jr1HFJ0QP4no
	927yBBj0uBmhMCKJFC2BlEmh/zQewKpKywFn/IzSQlAiA8Ziur3VKSyj07OqSe3lpwgwjFBzGxNi+
	MevkKqoJ4Pas+JSW7NC7uM6/Vff3Rix4nyOqfnQQ7K6Tdg4UbAR9nPs80dQ5QTUlB9MS67cfkxw1T
	cE/N4EII51N33Lm78+MaWneBdVHfeiuW4rG/Xy3juWdlB8PQSXnIFvEZYlo3YW0qldgMPA1r6LJL6
	yqBrH6qR67oajstzGHBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quyix-007w7B-2i;
	Mon, 23 Oct 2023 17:28:19 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quyiw-007w5v-0s
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 17:28:19 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6b5cac99cfdso2857100b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 10:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698082095; x=1698686895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYhetJOGeGWONv0pBZCT4Mywf3EBvVtv+lOqGOUogJM=;
        b=lAgqA2790DxXDRbtaBc5MacDeoDVhUQQ+Q0f1iuwI90jrC+OFMTQZtjAkUa96f86Dk
         eFnNHkWxIwPdLHFHAkclh2KQCJBo11ih7mPhft4Tg8snsLkqNcGNzmcl/thg//Lh/gA4
         ltUkxWrmySu7bGjJiCEtYoKt7Aq5k+ZrzxLDzP1ycTNtn0PoYf5uCOkuTT2plinFFF8+
         Nx9C+YnkNDRGab9CwxXAF0xTra7rnu1+B+HheAByEtt1LFR+686Bzahb3ARdyfSAF8Mi
         eqVfUrkGcMtQiOwQfv7o30RfZLouoGYyqbESBie4ykv7xXZ/yXueXvSckkmx9ZFodwd0
         tB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698082095; x=1698686895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYhetJOGeGWONv0pBZCT4Mywf3EBvVtv+lOqGOUogJM=;
        b=gawbP/rbgV0BXYhyqQkuvGhVyoZF3bHRh4cMfH0b0rHSfW9yMnB4Ea5CAq7gMmM6Sx
         AoImGj/5agU7oWdzAzC5NHOCRdi1vy53SYriXUXD9YP8OKsV61xrKieyvxzXvwJoA5ou
         ttAWfYSE8gPWTaS+4HXLJwkF2JHc1AvOXSPgbgkwfjEg48XxMzYsS0kN6ZBbAKV35aNL
         yRBTNX9UIteWIRtqemkZjwfZSOROQPfoKBuMyaquugdZxFcClr09Ko/AZ8ZeEMz1hseA
         fov39HHund158qpjphCRvTU1fL0LvcTjtWGWoJAErgtKWrQYd1cYkutF63OwRWMj9qhd
         DWfA==
X-Gm-Message-State: AOJu0Yx3/d6gtf/EKqPYq/p1+058/nNmNFVMY5yM+bqYot1paxpzIF6u
	GVUIohGEeLsIltOSl7KVNId1iA==
X-Google-Smtp-Source: AGHT+IGu+lXy4fpqCbUHElQhH8GUD5tz2EcwDu9oUNJjJ7mXrjL2i+iM+REgc4LlydXeHpBqkSNcvQ==
X-Received: by 2002:a05:6a00:248a:b0:68f:ece2:ac2a with SMTP id c10-20020a056a00248a00b0068fece2ac2amr7867812pfv.27.1698082094881;
        Mon, 23 Oct 2023 10:28:14 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.9])
        by smtp.gmail.com with ESMTPSA id g5-20020aa79f05000000b006be055ab117sm6473194pfr.92.2023.10.23.10.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 10:28:14 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v11 01/14] RISC-V: Don't fail in riscv_of_parent_hartid() for disabled HARTs
Date: Mon, 23 Oct 2023 22:57:47 +0530
Message-Id: <20231023172800.315343-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023172800.315343-1-apatel@ventanamicro.com>
References: <20231023172800.315343-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_102818_314656_5C116607 
X-CRM114-Status: GOOD (  13.16  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The riscv_of_processor_hartid() used by riscv_of_parent_hartid() fails
for HARTs disabled in the DT. This results in the following warning
thrown by the RISC-V INTC driver for the E-core on SiFive boards:

[    0.000000] riscv-intc: unable to find hart id for /cpus/cpu@0/interrupt-controller

The riscv_of_parent_hartid() is only expected to read the hartid from
the DT so we should directly call of_get_cpu_hwid() instead of calling
riscv_of_processor_hartid().

Fixes: ad635e723e17 ("riscv: cpu: Add 64bit hartid support on RV64")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index c17dacb1141c..157ace8b262c 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -125,13 +125,14 @@ int __init riscv_early_of_processor_hartid(struct device_node *node, unsigned lo
  */
 int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 {
-	int rc;
-
 	for (; node; node = node->parent) {
 		if (of_device_is_compatible(node, "riscv")) {
-			rc = riscv_of_processor_hartid(node, hartid);
-			if (!rc)
-				return 0;
+			*hartid = (unsigned long)of_get_cpu_hwid(node, 0);
+			if (*hartid == ~0UL) {
+				pr_warn("Found CPU without hart ID\n");
+				return -ENODEV;
+			}
+			return 0;
 		}
 	}
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
