Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103D7EE3F0B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 17:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dFXPk7wi5WrWbvcL0vfwtjiGmBHeHvhLCHeVKu9V1Ec=; b=BSeQD309Vy8475
	UQbCdqO/LOVAdRwNz5k16q3d8Rxb+pk2ectwRAP1wEMDkBQa5KyL8EY/6Z3EDIAra91Lq9E34Vdi3
	SNX56/9fo1bYFRrXT0Io6/2Ruo7W6nNyPZgRS3kZk7NksIAsdyZS6+ocavhxQeUh+c3B66ydRhtoe
	SuPt1Je3ZKuPXKVgktwK+JBg3/SGaPvVZWlbCIgv6NKCDiTe4eLYNb1SQUcwtObyOLjAvCDWdFzYJ
	p0L+ooe/ik90q+BbZKdY9F1kWdnmTDvDW4xknVKQn6PuzEUM4kl92ydLIjTo2PPGxiH13n5ysiRYf
	NHvJv1b6vw1hcwaUeR8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7Wv-003veM-21;
	Tue, 12 Sep 2023 17:50:29 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7Wt-003vdF-0B
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 17:50:28 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bf11b1c7d0so726785ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 10:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694541024; x=1695145824; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNKC5KP8qQDW8slouBLKMG229/gzuMYaPiRbkfNYlhQ=;
        b=akbUclaezMrATlNWyk07VF6DEETh7+tUAwGWMsbymhWR16hZRxJ1XH0nW3schrvOHD
         cn531b9d6dbwHC/pJTx0/lmM1+KyWu02j9MAsmOp1iOdO4hYD+TfcFhRbTguC5bO03Mr
         4DKbqd5DSrZEEt8VkrvIQhdqLGI7H6vN4ZrOZG8vWpy0y8dQYhvthhFT7/uXN/+zIFFZ
         LuUBDQIA3AC0SDSQCMgONC+S2qs5nW6nD7kynvfnkR/fnuZCEZSGSobu+adQ8h83W+2C
         HRBOB0qRrnrKm6g77S9z4sL7yeuDg8TbdM7E3mKVkON/zHmLYFMc1E6ULCOZLKXbxq3+
         GzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694541024; x=1695145824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNKC5KP8qQDW8slouBLKMG229/gzuMYaPiRbkfNYlhQ=;
        b=lAlbD3WjmitW4B+ruPQJqLZ7RKmDfSNWz/I7Ieup0G4BjpvC09AdR/s0LYgejVki8Z
         s0khbpnFimr7SM61QEZX9O/pMg15b5uqWArVIsOTlnPuJNppCXzDERtTgSL1pfikxZA8
         r4DpVWb3xz+ye4XDJARGoxsZPzV+Udgo6rcL2c+V1mv+dUOmnE4pPBiUgXahlDmMeJBx
         GSblxla4YIMK7WkHvFSzLWpcbZbsT+gjgNZyL3Z8lycTdt+x5ykKVbzTMe4eRnYCXVoG
         U4J3Cj6aOW7M8ZhYexfQPnBEDzOkwmAwCwaN2MyDekT7wzckWK/mwajIsDx4JqrxlA2c
         OsMA==
X-Gm-Message-State: AOJu0YxVqREssy2sXzgMzS8jwFV4xrk2nxNJSKDL5oaPyiAV/SGf304y
	ZBFRednJcoXVYMfZ5pOIO77/kw==
X-Google-Smtp-Source: AGHT+IGYdL6w3dlhJOKNIocPNIplLHZdN81nYvMZmpKzRwhj2mf4FZSZ6OQM/ntbZzd7phR5FPxKTA==
X-Received: by 2002:a17:902:dac2:b0:1c1:f0b4:f68f with SMTP id q2-20020a170902dac200b001c1f0b4f68fmr490270plx.10.1694541024051;
        Tue, 12 Sep 2023 10:50:24 -0700 (PDT)
Received: from localhost.localdomain ([171.76.81.83])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902a40c00b001b891259eddsm8691440plq.197.2023.09.12.10.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 10:50:23 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v8 01/16] RISC-V: Don't fail in riscv_of_parent_hartid() for disabled HARTs
Date: Tue, 12 Sep 2023 23:19:13 +0530
Message-Id: <20230912174928.528414-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912174928.528414-1-apatel@ventanamicro.com>
References: <20230912174928.528414-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_105027_094500_C7A43504 
X-CRM114-Status: GOOD (  14.77  )
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

The riscv_of_processor_hartid() used by riscv_of_parent_hartid() fails
for HARTs disabled in the DT. This results in the following warning
thrown by the RISC-V INTC driver for the E-core on SiFive boards:

[    0.000000] riscv-intc: unable to find hart id for /cpus/cpu@0/interrupt-controller

The riscv_of_parent_hartid() is only expected to read the hartid from
the DT so we should directly call of_get_cpu_hwid() instead of calling
riscv_of_processor_hartid().

Fixes: ad635e723e17 ("riscv: cpu: Add 64bit hartid support on RV64")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
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
