Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1755C001E0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 12:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=do7oHuxuQ84POW5qy7lVZYk+OzxM4o+5RBZXwdnq6zY=; b=Q3qyaCl4UMl2O2
	maLXb3INYAbekRMcPOmjCCw+MZ+GhKkA5qhE4jSlN7GhbmLi99+NZonXh8E9xx0iECYqvVnhmXoQK
	l9V589lMEq8Zg52+T4c255uiU/flBf6iF0w572W8lcR5Q/LOAWJVgYzyNQ6jtYCVF8tZS3LCa1e3y
	5kyEdsGxNiK0aa6CLw9pzCVHNL/3nDIBfxiijEz+E8T/AD/iY8ocMi5vDsk4lZixkyyLu9wyfHEJp
	J2xA5Cgt4qB3wRzo/vMRsVu0BWOxJQbd709GKCu70DCgkqUrH0Op3tXlViNrxuxZD2wIvb2iQojwb
	1V6ZCaWdtUdkplI9ItLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvBa-003Bgb-2W;
	Thu, 13 Jul 2023 12:12:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvBX-003BfH-1r
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 12:12:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689250359; x=1720786359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1i34KSawlUL8WNjNkmTiVglWiYjIqUpNKEWr7RWMan4=;
  b=tJRpUm644RjT8ajQUgOA7tn35xOLCi3JHWrUQ7fsOecP9bu4S8Xc3jw+
   NaX/hcsUNPHsrpBoJ9ngjD0IpweeHEtO5pErFidMU69bMXWVXPzdFMo1i
   7LP0xxHCBmEXO0PD7wZcczpertKfJ9jH7edJsT4dP0n7zpCWFIVvnu1qm
   rtPVKFt/bcajtS2n6DGbWnPt4StyWIh/HQepgvr2DR7yv/nLb9cC0rmQs
   QjyIBP6BHYMD3cLGbxI4FQ+jMyBGGohFld1dMNF+SWHFcz6qwRYyr5Blz
   fxyrkm1x0X8f92FNyoVdHwN01mLFRjNOO5+Hx4BT8DkYiSGi2/kBeiEiL
   A==;
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="222827139"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2023 05:12:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 13 Jul 2023 05:12:38 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 13 Jul 2023 05:12:36 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v5 03/11] RISC-V: drop a needless check in print_isa_ext()
Date: Thu, 13 Jul 2023 13:11:01 +0100
Message-ID: <20230713-veggie-mug-3d3bf6787ae2@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713-target-much-8ac624e90df8@wendy>
References: <20230713-target-much-8ac624e90df8@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=1i34KSawlUL8WNjNkmTiVglWiYjIqUpNKEWr7RWMan4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnrX15dnT3zoNehbztPtS703Cn0evqXSf3LJDnnbIvR88xU NBKN7ihlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEYk8yMmy41VY7X+Pdp5ctjsmT7j aHfhK+t10mrNpt/vK/GazS9wIY/tm2HFI/t7Zy87PdG0V3eT1fuvLXR8643YfK3/C5tm6fcIYHAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_051239_619559_B01350DE 
X-CRM114-Status: GOOD (  11.38  )
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
