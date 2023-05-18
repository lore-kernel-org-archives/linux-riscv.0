Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B3FC7EE2F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 22:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TOCJ2EyezZKjb24CYYWtiE+P4dSsjYelD9Dd+Ip5+aU=; b=KgEFYcV9nbpdbl
	3u95RU7UixGPaj5U0HpDAVO212XQJbgHC3FrOCHdljma7CKOQJAZ5uuCcfYgRMk+DyhTAwEowy1yW
	mkgbucVDXCrim0azCjUS3UGYMV0lnncG5XajMmInW7OaeQWie7N2DRtWWgxBVU8RHHxc+mdeUUIad
	u/49d20Uui5PjDMU/SEYtiwDaZcjd0G4cmTrQkbJxtfCOfq/A68jVD2qzN+H2qmqSFN/oEy/UoqQs
	mR3HS+62/hp8lhYzbXfLIPI5VSm6TVeuCJwg5ZXwXOGNYepu/iy+8qSsD/Uv7bp6w4QWqChp6r47F
	VrMCAvKDrLl1eIY3zEOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzmIC-00ENOT-01;
	Thu, 18 May 2023 22:40:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzmI8-00ENMw-0B
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 22:40:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9EAA9652B1;
	Thu, 18 May 2023 22:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5376C433D2;
	Thu, 18 May 2023 22:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684449611;
	bh=jZKnT1m7eWC6A6hO0IFJethc7rVaQmUoMS4W8xx3UQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n+bRfTxwQVwKD4hS0YdmPeoljhZqPFt5hx4SMIGSCTYOs4UYLr30eaczOTdOU7k6x
	 qbb91kXeiOVKI4X8susJifg97a25Vq12fHAyH4PaXZhZohKXdScz+I+q2SoSi85VJD
	 vwjIpDGuj+vgWsPxhcNdDY37g7HGGPmYV0FluayDAQlkWn8Bbt+ccclKm4zNt7LKue
	 VUU3IQ3GRs7cxDoXJc00nOf0znnIX2P8BxTA8h03z0RZIwABf8Nj4DyywGHdRIloX2
	 A+s0z69QnMd0XT1MbynpmAchoU3MYkiK2zMumDq/NOWR0H6I1z/P4bW1gob2L2goBO
	 JZnb8PiCVlUbg==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v2 4/8] RISC-V: validate riscv,isa at boot, not during ISA string parsing
Date: Thu, 18 May 2023 23:39:05 +0100
Message-Id: <20230518-despair-cannon-0c344a70aa9e@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518-moneybags-rebalance-1484db493d6a@spud>
References: <20230518-moneybags-rebalance-1484db493d6a@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2004; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=odpPs/uqbxvNKy0OmAehTD0ifuZfZw2FYVzH2z9z9iw=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClpKzn+df1eap1ivPXLHHmPlqu8MgwG3859nN6a5Nmzg b0vaDtfRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbC9o7hn7ldQOftF9WPNQ/k /NVo079p+1u99kcf7/xJYlMen6s5x8bIMOl3HUfOAflfRT+U91ziPnjec+/jH+fuKyoKxs5ZMKN xARMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_154012_173580_FB7EF318 
X-CRM114-Status: GOOD (  12.42  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Since riscv_fill_hwcap() now only iterates over possible cpus, the
basic validation of whether riscv,isa contains "rv<width>" can be moved
to riscv_early_of_processor_hartid().

Further, "ima" support is required by the kernel, so reject any CPU not
fitting the bill.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpu.c        |  8 +++++---
 arch/riscv/kernel/cpufeature.c | 12 ++++++------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 7030a5004f8e..b0c3ec0f2f5b 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -63,10 +63,12 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
 		pr_warn("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hart);
 		return -ENODEV;
 	}
-	if (tolower(isa[0]) != 'r' || tolower(isa[1]) != 'v') {
-		pr_warn("CPU with hartid=%lu has an invalid ISA of \"%s\"\n", *hart, isa);
+
+	if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32ima", 7))
+		return -ENODEV;
+
+	if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64ima", 7))
 		return -ENODEV;
-	}
 
 	return 0;
 }
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3ae456413f79..a79c5c52a174 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -130,12 +130,12 @@ void __init riscv_fill_hwcap(void)
 			continue;
 		}
 
-		if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32", 4))
-			continue;
-
-		if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64", 4))
-			continue;
-
+		/*
+		 * For all possible cpus, we have already validated in
+		 * the boot process that they at least contain "rv" and
+		 * whichever of "32"/"64" this kernel supports, and so this
+		 * section can be skipped.
+		 */
 		isa += 4;
 
 		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
