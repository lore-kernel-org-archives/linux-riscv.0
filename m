Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DACDEB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 09:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z3/VxJlAbSydrYBGCsqvgLpX2nX5mFjMkMbcC5YQqnI=; b=GZsr9egRAZhgJ9
	EVpYFqCcgEN+YKp6nS/5EsGMdmcW0raDbQq096JsJy+FdEs1ZfLpw3tK78l47cma0ybaAKzo/JVUt
	rJ9ewKHv7Mkym/7F9VBetE9DDWk84YXben6pmvwIhj3VNk5j331SfQOv2EIxDGHbVWxs417YeQt+e
	ZrURpBnV9gJ/JQtQMDRUm6FD9XFAz3U1uy4xvfBCQoQi6LaY3V1q8XsBU44vtocNMN6xQazALI2+9
	ZdvHxo6g95y07OJnEfem5oY7aJ11iJuyrDZURbWb+hOb9cvGlosbB7gSw+S01WFoi4wGrbM6C3jNe
	yFwznKDhY18IU5MSMoYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInKB-00B30x-2L;
	Mon, 10 Jul 2023 09:36:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInK8-00B2vk-01
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 09:36:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688981811; x=1720517811;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f+gmfGrxcQqjXfZd/zTckfTRTww6zd62gI4c22r/Xm8=;
  b=CFFs2j0r9UBulqbSfvBlyNlOMWoph18er7BAhPSRFBhI8pujG3Q13LvC
   MZUb62VWD8uf9C7ogqQNILThaQSK9xJBUlRb6eHHRGh8hNcw5BW2rUJ5s
   htCyNWNCoxSQEdd7ZgxJHeWH9AEs/qaUBsZ3qmQdaXK27tJQWo8TSSRjP
   2cZkUmpppolYGD4zFPbS+CwxlaGBmANoB5yNmA0/L591hToRNL5tK6Vi/
   6697dhf/XcxRfXlcMDCB++/J9KOD19j27GjiwL5nd0oM3+Sm/RmWjTScI
   YTPU1F0pBbQ1+N+lQoBukDufs556+3Oozf3IexhHHw/yVNxNzSlQE+eWm
   g==;
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="160600105"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jul 2023 02:36:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 10 Jul 2023 02:36:45 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 10 Jul 2023 02:36:42 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v4 06/11] RISC-V: add missing single letter extension definitions
Date: Mon, 10 Jul 2023 10:35:41 +0100
Message-ID: <20230710-chamber-juvenile-6df500da0d7b@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230710-equipment-stained-dd042d66ba5d@wendy>
References: <20230710-equipment-stained-dd042d66ba5d@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1249; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=f+gmfGrxcQqjXfZd/zTckfTRTww6zd62gI4c22r/Xm8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmrL1yXWFp0ddnsKCMrvpr//ixviqf8vlSnefH74tW5u1Id H7ss7yhlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEFlUwMixOPpqx1zRp3+sN8957FS jd2fCpal1ee9hpO751M1aW/ZvPyDDTIEKUX2JO9IWF2TMXP623NA6SNArjfqHe7turI7bKmx8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_023652_122888_FB82BED5 
X-CRM114-Status: UNSURE (   8.18  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org, conor.dooley@microchip.com, Rob Herring <robh+dt@kernel.org>, Evan Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko
 Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

To facilitate adding single letter extensions to riscv_isa_ext, add
definitions for the extensions present in base_riscv_exts that do not
already have them.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/hwcap.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 2460ac2fc7ed..a20e4ade1b53 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -14,12 +14,17 @@
 #include <uapi/asm/hwcap.h>
 
 #define RISCV_ISA_EXT_a		('a' - 'a')
+#define RISCV_ISA_EXT_b		('b' - 'a')
 #define RISCV_ISA_EXT_c		('c' - 'a')
 #define RISCV_ISA_EXT_d		('d' - 'a')
 #define RISCV_ISA_EXT_f		('f' - 'a')
 #define RISCV_ISA_EXT_h		('h' - 'a')
 #define RISCV_ISA_EXT_i		('i' - 'a')
+#define RISCV_ISA_EXT_j		('j' - 'a')
+#define RISCV_ISA_EXT_k		('k' - 'a')
 #define RISCV_ISA_EXT_m		('m' - 'a')
+#define RISCV_ISA_EXT_p		('p' - 'a')
+#define RISCV_ISA_EXT_q		('q' - 'a')
 #define RISCV_ISA_EXT_s		('s' - 'a')
 #define RISCV_ISA_EXT_u		('u' - 'a')
 #define RISCV_ISA_EXT_v		('v' - 'a')
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
