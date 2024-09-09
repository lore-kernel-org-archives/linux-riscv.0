Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3264AECE57B
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 08:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pTAbpGbrdZT0pM2WXNHXxUBQ3ntOeEwukoMDgGBvrfY=; b=nXZXinYsct6GT2
	uqCtjbGYGePKW8K6Q8dSBSu0L7esT4fS+RJe2nzzdSLO7lpr/xWWjjNOTktnCmDhHv8CTTcXUapaC
	HSFfCP9obqxotIuwTldp36Dbzok0jHt+qTboprHs6juCrqnrFlGlxF99KU+5MfzQ1mMMJtST6gLsO
	hjCjMTkdr5t7PzYhY8AVcGGcWAdcz9UMP2bFIrwCA80OJLQlAnWVd+hZj/IlyYNtrDIgiy+7ybbWd
	tGZWf7rMhh2O/wuex9pk2GYdHhNpvJtFqkqMr+eo+hkSoNrIqencRqXQoZ0/c0XTd4wJTVo+eZ5kE
	PPigvtrqAe1/RBPdHD+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snaC1-00000001Cmk-40a6;
	Mon, 09 Sep 2024 08:56:17 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snaBy-00000001Cm7-1K05
	for linux-riscv@lists.infradead.org;
	Mon, 09 Sep 2024 08:56:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42cafda818aso15705195e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Sep 2024 01:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1725872172; x=1726476972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uv2AR1woNQLYJ0Fp1iRI0UhGVzR3YfrOcxidNB7ijGc=;
        b=nVRwnHlWa6hNuDJrA0K9BFkkZ/Fd09Nh7kB1gxx1Sd6ErFQnhhDdwtkaaJMA7NQyQ1
         74SZOUL0xL95yDyDr7RerGIjEyLHYeuITHmGct15xvsBqP4CXtyVEPJrDFgmD4VrW4/J
         kDGU7qu/YV9dmgsmFVkxXbEt3TTUvOnHu0V2gwCFsI5jeFmyJDc5MW9nIn3/zUazBQQF
         fbcnQbpxR8XIz9XvmaE0y44NfTaAXNeiKshTx4h+ENklKezG2be31kT+HeT/CqRoInwj
         vQe3utX/e13HgTADv0Z+tXVsmn0omt8Um+PSCNc3oRSh3TYPsNbHLYfzPw/s/STQElDZ
         YHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725872172; x=1726476972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uv2AR1woNQLYJ0Fp1iRI0UhGVzR3YfrOcxidNB7ijGc=;
        b=j0BpVN9BSCTy84kgTQQMT4EWa1Wu8W0zxr05PH9Baekv8UYWtOhoJJCT1rNcX6A9rw
         nJ4q7Lrgy3M/2kUpqsJ9twYrYzIhb9mx95ZK1uITFsZuFIg9yuDruXAfsoFhR3zxZ3et
         HHUx4wPfJvGZ+lkWURzoytN77ebLmNO9lBLYNXQl3N0GNIlVLTUWumuQkrd+l7nTZKuq
         VGnuJYP81mplULbvynFQ5R0Sqk/Xf11hP/bDU4q9pJbs0Lx3fVQ02j6rcIp9VY8aaeV1
         78SEKXCMnk+SVCI0gsYfEa/xIbb1OKCiyHX7BpmTsZEqfctVWj663+AKpw6+tAe/wwye
         Ta5Q==
X-Gm-Message-State: AOJu0Yy3di+iAi9F8hJL6TCjFpUaLi7QqqIF+03LjOMQ85nDP+GHmugk
	vT6eRZKYy7gw7rscZgWUIbKfMhGwYm/S9/PrpiyYL4FAl/hI4lGW+Uf0w8pUr/eBl7To5WXAprl
	CS2c=
X-Google-Smtp-Source: AGHT+IFXzJCsb3FQafzENF2vACJ7ZcGkiKnDKQ091lFVFb0euHttZG/dYayGyB4fQORiKo5lMDqVRg==
X-Received: by 2002:a05:600c:1c06:b0:42c:b95c:65b7 with SMTP id 5b1f17b1804b1-42cb95c693amr10352915e9.8.1725872171244;
        Mon, 09 Sep 2024 01:56:11 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb2a08a1dsm50929395e9.1.2024.09.09.01.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 01:56:10 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: anup@brainfault.org,
	tglx@linutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [PATCH] irqchip/riscv-imsic: Fix output text of base address
Date: Mon,  9 Sep 2024 10:56:11 +0200
Message-ID: <20240909085610.46625-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_015614_374859_E4893EA6 
X-CRM114-Status: UNSURE (   9.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The "per-CPU IDs ... at base ..." info log is outputting a physical
address, not a PPN.

Fixes: 027e125acdba ("irqchip/riscv-imsic: Add device MSI domain support for platform devices")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 11723a763c10..c5ec66e0bfd3 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -340,7 +340,7 @@ int imsic_irqdomain_init(void)
 		imsic->fwnode, global->hart_index_bits, global->guest_index_bits);
 	pr_info("%pfwP: group-index-bits: %d, group-index-shift: %d\n",
 		imsic->fwnode, global->group_index_bits, global->group_index_shift);
-	pr_info("%pfwP: per-CPU IDs %d at base PPN %pa\n",
+	pr_info("%pfwP: per-CPU IDs %d at base address %pa\n",
 		imsic->fwnode, global->nr_ids, &global->base_addr);
 	pr_info("%pfwP: total %d interrupts available\n",
 		imsic->fwnode, num_possible_cpus() * (global->nr_ids - 1));
-- 
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
