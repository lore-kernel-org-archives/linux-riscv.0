Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D94CE7AF8
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 06:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fnl9wrWI3e+ntrCRN4Z3wB7Q4g3WORfF+QXsWNQb6Ig=; b=L31fzo/MdrT87k
	wEqHuspsw/9sxnguLL0sbSHNW0C9u1UjHtjajRQH/KIHTORz6YtmTTy3DpS+mF4oSUeKPmiULH5V7
	apCkPX5ckUKZ1Otb7s1yLkwy/CoSpG5viDokbPvhuy1q9m5357Vx1PtjMrWk0I4kBvAU/czeq3jyG
	K/edyAtdtnvomsByo76r3A1hK1VNg1304Wtq30sVtVfIiypSnUDxbi1JW/gVn6aW2cxYXKxs1+3AC
	PuiuwgeyfRM9b0lk3OTv80Ayp3YIzrmKYSn4TySKA3iu0PgZg/u7n+n2ty5L+pf9QFkrSmvW7WD3u
	YhPhF8qaczlCtiG/pfeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlkGg-002LlE-1z;
	Thu, 28 Sep 2023 06:12:58 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlkGd-002Ljt-2U
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 06:12:57 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-351437112c1so24127655ab.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 23:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695881574; x=1696486374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOj9ECaB96rIjjnLWcT6tpDdCA0D2GI5mFoVxJymrv0=;
        b=fPpuBMTOjZ0cBVCIuBkqVcpciNmaXWVs7oJD9pAIewcobTxN2lTasicI8nksdrTW/e
         Z5w714zwHUFsMkCbUiRtQrd5SfO29Bx7GOp3pEdIe4vrUbiJB1wbysMIBmqWpdg0amXn
         JI2OZcmlBonvU1sU0Mr3iBLr7NxZ0vLfOL8UrXceKljmbBkcYChPh1vQycMDp5pUVdY8
         w1FsVLbbvDsj7E/nV9Axy4ElPTZ4UWPnqvQYbEFpqNy/FHgUREya2HFTTIKklzUL5VkY
         Hty58vKPKeT3RjM5j5gUdO8xsqc6FJKBYlb7T89GoSNPKjAqqyg+NnJHwM3PK2Pa+aaq
         bhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695881574; x=1696486374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOj9ECaB96rIjjnLWcT6tpDdCA0D2GI5mFoVxJymrv0=;
        b=vzxMfdVYQ0OuYeyfrUwPq1/FBodwLF7L8OeckKuYtRcNGFNP2DvbYqJWmisjKAoV4n
         55zO6KECyr+0r3bpEtB5MrtPT6Y5yDiBcj4Kyy+E7vAK5D710y6EVgrDT4d1JEwP26RH
         AeQ7gpenTEt3sL3NCYNP4lXt8Wt1hTo4e7YYn2GB9Rtx3YEsuRlBDzR1UmEuhSbdQ/9Z
         gk9oa74Yx1yH+FusapnrzQTQ2LNPcovhkn/XgLDP31tw7DhsTFTlyovj37a1bZeWUko6
         bgteU8YKzJTKLkzdow8l17mapL0JwcIv8v9tpkT+In4N+23EdeCE65co1ZkIlN9mKoyW
         gmew==
X-Gm-Message-State: AOJu0YzhS4fDHFaIS+WkvFmw9Gx4xOazpVL2Esshc3em0w/eirV/PlZr
	osHyPaAtABhRYnt/fyZg3laDWA==
X-Google-Smtp-Source: AGHT+IFBx1Jn5HFo6/K2zSwRKNfk/Rx/Wfu++Z7gO+1vnjnfhqhj2s5cTSNwlL693OWuuZEVafPJ0Q==
X-Received: by 2002:a05:6e02:1c22:b0:351:4b68:ec3d with SMTP id m2-20020a056e021c2200b003514b68ec3dmr232692ilh.16.1695881574077;
        Wed, 27 Sep 2023 23:12:54 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id x6-20020a92d306000000b003506f457d70sm4774467ila.63.2023.09.27.23.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 23:12:53 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v9 04/15] irqchip/sifive-plic: Fix syscore registration for multi-socket systems
Date: Thu, 28 Sep 2023 11:41:56 +0530
Message-Id: <20230928061207.1841513-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928061207.1841513-1-apatel@ventanamicro.com>
References: <20230928061207.1841513-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_231255_850949_46BE5D7A 
X-CRM114-Status: GOOD (  11.44  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On multi-socket systems, we will have a separate PLIC in each socket
so we should register syscore operation only once for multi-socket
systems.

Fixes: e80f0b6a2cf3 ("irqchip/irq-sifive-plic: Add syscore callbacks for hibernation")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-sifive-plic.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index e1484905b7bd..5b7bc4fd9517 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -532,17 +532,18 @@ static int __init __plic_init(struct device_node *node,
 	}
 
 	/*
-	 * We can have multiple PLIC instances so setup cpuhp state only
-	 * when context handler for current/boot CPU is present.
+	 * We can have multiple PLIC instances so setup cpuhp state
+	 * and register syscore operations only when context handler
+	 * for current/boot CPU is present.
 	 */
 	handler = this_cpu_ptr(&plic_handlers);
 	if (handler->present && !plic_cpuhp_setup_done) {
 		cpuhp_setup_state(CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
 				  "irqchip/sifive/plic:starting",
 				  plic_starting_cpu, plic_dying_cpu);
+		register_syscore_ops(&plic_irq_syscore_ops);
 		plic_cpuhp_setup_done = true;
 	}
-	register_syscore_ops(&plic_irq_syscore_ops);
 
 	pr_info("%pOFP: mapped %d interrupts with %d handlers for"
 		" %d contexts.\n", node, nr_irqs, nr_handlers, nr_contexts);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
