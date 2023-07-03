Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B91EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0B3bC/Va7fgtkCv7UILwGoLEMSrqaI83+8bj6JRgmKQ=; b=hRwS7L/AC6TUIa
	ql9EUxqwiYAi0hUkBLAMxL4T6z8ZAF6x/c3dG5/3iozJdjdfsHRYUZ9HY8aLlhuAs2KrQ/IV1eIJ9
	FDbHXISxxZsdAYQHPb+croMUyTARBHaBkbNif2rfnbGtJ+5mqyJUmQhi46VhkVwScpOw0lgOVypdw
	EzudcbsJEqxwUQSZRbFMCar3o65593U1BEBPuhwcGmnj/rYc06ZUBviGWZxjmJBw7G+GNPJPTn1q7
	hG66Uf7iYpiBw4ypMlROnR3JTwoWmuwB+w6bhS5aV/9VM0AhJG1neCAd2Czt26XkgiCSnHN3KE5GL
	5LEILIyGobNbgG9gNilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGoL-00AEjs-1W;
	Mon, 03 Jul 2023 10:29:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGoH-00AEfO-2j
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 10:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688380173; x=1719916173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HPRtOyIqm/BcHFGgw0cl0PQB3rNvTkemYLiSjsKMtC8=;
  b=E0GU6WH8M1K1Qx+s14YXFR1xmTZmgfoJVZHaPBNO4YiTFPUSqqscQcbg
   Qh33SGrCD16fsSb0MRD7DkaY5Ammmy/P1igF5wdlcmC2VqpO0X02AB/Vt
   5+S5toYEIQSod4QZK0xcVkVDpGK9gzrUZ9Bc2AxY7TWs29ugtGy5lD7iQ
   MWnzQq/oBfI2hfyivGfxo1zjwNcbc720wEftrycWjP99PIWTAcy3wtXjU
   T3COQXbyoMEBXWP+dlIy4njCpGC/Jv9TsRXa/6IHJVsYR+l0HuMXN7d/I
   TYWHl1wNegUIBCaDy6Pj9wBMWvGGZZ7E4OC8ny/9WL+cKS01KhDabcilW
   A==;
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="222963013"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jul 2023 03:29:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Jul 2023 03:29:15 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 3 Jul 2023 03:29:12 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v3 06/11] RISC-V: add missing single letter extension definitions
Date: Mon, 3 Jul 2023 11:27:58 +0100
Message-ID: <20230703-unlocking-straining-5c814e99642b@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230703-repayment-vocalist-e4f3eeac2b2a@wendy>
References: <20230703-repayment-vocalist-e4f3eeac2b2a@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=HPRtOyIqm/BcHFGgw0cl0PQB3rNvTkemYLiSjsKMtC8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmLFq2OYbpqeyguNVtBVfCDrszyTnumf3Wt4c9vmhndmfJq 4iOGjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkRhUjw+Rrx1P3PZiWeORP1PbA5U 1VeZMWzZhuYfJ9y34dHvkbO3gYGU6tF/o1Jfnay2e5p43/n9xduypM8YrpwczNvfuMMxZGs/IBAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_032933_955010_B932E135 
X-CRM114-Status: UNSURE (   8.03  )
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
