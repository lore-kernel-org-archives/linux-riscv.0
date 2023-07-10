Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDF5EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 09:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=do7oHuxuQ84POW5qy7lVZYk+OzxM4o+5RBZXwdnq6zY=; b=1vqMoK4J/6LPap
	jiGpK8ZpiTrgN8YtstX6bKwSUCma/M6aJW2sczFGW16U+NoLdEGyGJeO5cZ41K9jOChHLzcr3D7j5
	g72sJSY9jvB5ecvc2XBRIDOGDausL5y5g6n852H1x9q7o1UG+3rXYWOpVM/zFdKM+GajDqNgYigOf
	jhk4tZ4eTBR15PLXErR1pHYz1uSBSAJQwDhNGKyaF42O/zBvKNb85Ukr1YDW9pf6Fmxr3PG6W09uh
	zntrFj10nvq19js6EtEFDQVEGHPXZwo9GISqUGgBEFjly0P8RpGm6GPs87F2nwz+64XNmdXhN3B2D
	ZjD9/nlbKA5VKBCGZWCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInJz-00B2sv-2v;
	Mon, 10 Jul 2023 09:36:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInJx-00B2px-1X
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 09:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688981801; x=1720517801;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1i34KSawlUL8WNjNkmTiVglWiYjIqUpNKEWr7RWMan4=;
  b=zzsmS9JIBe5HRHilDl29wgFFDsjdtDJApCsee3V+xPVmoJAESqHw2T2j
   0+poL8MB+0vCD+ZPxx6EsQT3a3QtDIc41uxT0m3c4SVcIumSju9Qkv9P7
   YPxKgDq/+9dBUM+c0Bf8/raJ2y8re+DCcAXCbTtb5+qWfeLH9b7EKsRs2
   pqldRDe8glMfBs7mKjZi3p0tG7Rf/HbBgRnGZEjTa1DeoH7ZWWHtnXU0G
   0kHQ2EpZZyuGEcaJiRhvd5/MQo9onhY36e1tcTwa4W2nCobKYEeS/lgde
   y6hpV/E+AMr8X2Fw0IAHDBRSHVeozGbfeC2ZJRTrGm9cdw14c0+K3Xm23
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="234573296"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jul 2023 02:36:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 10 Jul 2023 02:36:36 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 10 Jul 2023 02:36:34 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v4 03/11] RISC-V: drop a needless check in print_isa_ext()
Date: Mon, 10 Jul 2023 10:35:38 +0100
Message-ID: <20230710-map-unlocking-9f674ee171bb@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230710-equipment-stained-dd042d66ba5d@wendy>
References: <20230710-equipment-stained-dd042d66ba5d@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=1i34KSawlUL8WNjNkmTiVglWiYjIqUpNKEWr7RWMan4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmrL1xTEVf/3XjKu/FK/trOlIJHnLEzzrSGtosIRW32sVOo THPpKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwEQKHBj++wUedIrm8Vv68c578dmTuH bbNJuHllrJPva9c+2/8f2HyxgZzp2WkLmxOl33VdKJsomyh4p4C2M/Lreb6H7JbJfBO6WTnAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_023641_524838_3468793C 
X-CRM114-Status: GOOD (  11.71  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org, conor.dooley@microchip.com, Rob Herring <robh+dt@kernel.org>, Evan Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko
 Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

isa_ext_arr cannot be empty, as some of the extensions within it are
always built into the kernel. When this code was first added, back in
commit a9b202606c69 ("RISC-V: Improve /proc/cpuinfo output for ISA
extensions"), the array was empty and needed a dummy item & thus there
could be no extensions present. When the first multi-letter ones did
get added, it was Sscofpmf - which didn't have a Kconfig symbol to
disable it.

Remove this check, as it has been redundant since Sscofpmf was added.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
- Reword commit message to explain why this can be dropped
---
 arch/riscv/kernel/cpu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index f808b67f5a27..e721f15fdf17 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -237,10 +237,6 @@ static void print_isa_ext(struct seq_file *f)
 
 	arr_sz = ARRAY_SIZE(isa_ext_arr) - 1;
 
-	/* No extension support available */
-	if (arr_sz <= 0)
-		return;
-
 	for (i = 0; i <= arr_sz; i++) {
 		edata = &isa_ext_arr[i];
 		if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
