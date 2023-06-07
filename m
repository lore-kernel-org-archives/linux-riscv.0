Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6ECC7EE23
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 20:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89hoo6sTJtFBSTl++XYNzr3wYaLHeS9Neg/60iDwLCU=; b=tTOt4UqGHSBKr4
	3nbiVaB7DJfbIwPuA2aZENcFHxlyA9ZTLWzrVvRf6gGbIfi5PX2Rnw6QlUdqt6uedUvA0Ht5P7Y8B
	+gMmVRoRXpg/mISVAcs4idfu8MZ7e0OsqcxpiQTU/PyNSfNdjNKbEAzaxx3XSSLFTetYhtRkkF2v4
	u6251S1f/Ukiu9ziqkCGtLEto31TZR9X6zclMCTsay4tC/1wuYV4EC7VYkgNWraen2thy3PGa0zY4
	0nyIwpUoJsFRqNzEVOoiSYN6V3aYC7MuTtjjBH8N17hYRU6j7LW1ZJKrizNfi2DWctsjDRSfI8jv9
	WFWPOB9N2Fj39dc7G0Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zm2-0077mg-05;
	Wed, 07 Jun 2023 20:28:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zlz-0077lZ-1y
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 20:28:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1375F644C2;
	Wed,  7 Jun 2023 20:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EBAC433A0;
	Wed,  7 Jun 2023 20:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686169730;
	bh=hJ38CPjxWwjX4V8XKtRn/M80pqJIL4wsmO+H2FqHFgA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J6GZDEBNvEbqPckqQAG9sc+1v+oU++bsVa661H2Gt8mtcuake5RIz7my4qS7+6/vJ
	 w8h+hfdeSnr/ZhnAV7mGW1hIwqFa9nbmbo2qy+S7ZxMcFBw5/Iz8CU03gttgudGpoy
	 R1JoyE1nJHHoF9Q7u2lrEIn7Ja3mkxeZF2VQqpreAfg9GU/ASp3Hj0D3DgHvO94/I9
	 a1sf4taodGsr+kcrVA6kvCSS89pSzoakn0pz4qbIc8w/DvpShi7LUVhMNzSZxbuvAf
	 K5oe/lXndSzr2z+S8zh7C/TEDvJymwPUTJPPItPmEWREeTqKKs3vay5+96iHyx2kGH
	 xdEkP9NvNoIEQ==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v3 3/7] RISC-V: validate riscv,isa at boot, not during ISA string parsing
Date: Wed,  7 Jun 2023 21:28:27 +0100
Message-Id: <20230607-guts-blurry-67e711acf328@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230607-audacity-overhaul-82bb867a825f@spud>
References: <20230607-audacity-overhaul-82bb867a825f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1996; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=OFfsnmkyItfIBILoPmIAAAogZG8wbQXtmYDyF7w+9u4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkNLzLlLrGJrswqDD3q75XFuefGQb7GO3/Xt4emM/E7W oV2ZL3rKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwES2fGVkWCPtUR/VqdQmVXFp yiKdDwdyI15uifO8PW1TrpfLFz/jZkaG50d5FsVa9TSrrD0qxuW5fuV5m+uRYge29N86ZyFyPoO dCQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_132851_726754_CE38325D 
X-CRM114-Status: GOOD (  12.75  )
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
index 8025de06edb7..dfb4a2a61050 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -65,10 +65,12 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
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
index c8635211fc18..c3851c8cfa9c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -148,12 +148,12 @@ void __init riscv_fill_hwcap(void)
 			}
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
